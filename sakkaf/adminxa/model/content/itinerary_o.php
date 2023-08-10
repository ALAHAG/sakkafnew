<?php
class ModelContentItinerary extends Model {

	private $table = 'itinerary';

	// Get

	public function getItinerary($id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT slug FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id='" . (int)$id . "') AS slug FROM " . DB_PREFIX . $this->table." WHERE ".$this->table."_id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getItineraryRooms($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->table."_rooms AS ir
									LEFT JOIN " . DB_PREFIX ."hotel_rooms AS hr ON ir.room_id = hr.room_id
									LEFT JOIN " . DB_PREFIX ."hotel_room_content AS hrc on hr.room_id = hrc.room_id AND hrc.language_id = ".(int)$this->config->get('config_language_id')."
									LEFT JOIN " . DB_PREFIX ."hotel AS h on h.hotel_id = hr.hotel_id
									LEFT JOIN " . DB_PREFIX ."hotel_content AS hc on hc.hotel_id= h.hotel_id AND hc.language_id = ".(int)$this->config->get('config_language_id')."
									WHERE ir.".$this->table."_id = '" . (int)$id . "'");
		dd($query);exit();
		return $query->rows;
	}

	public function getItineraryTransportations($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->table."_transportations WHERE ".$this->table."_id = '" . (int)$id . "'");

		return $query->rows;
	}

	public function getItineraryTours($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->table."_tours WHERE ".$this->table."_id = '" . (int)$id . "'");

		return $query->rows;
	}

	public function getAllItinerarys($data) {
		$itinerary_class = $data['itinerary_class'];
		$sql = "SELECT * FROM " . DB_PREFIX . $this->table." WHERE itinerary_class = '".$itinerary_class."'";

		// $sort_data = array(
		// 	'id.title',
		// 	'i.sort_order'
		// );

		// if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
		// 	$sql .= " ORDER BY " . $data['sort'];
		// } else {
		// 	$sql .= " ORDER BY id.title";
		// }

		// if (isset($data['order']) && ($data['order'] == 'DESC')) {
		// 	$sql .= " DESC";
		// } else {
		// 	$sql .= " ASC";
		// }

		// if (isset($data['start']) || isset($data['limit'])) {
		// 	if ($data['start'] < 0) {
		// 		$data['start'] = 0;
		// 	}

		// 	if ($data['limit'] < 1) {
		// 		$data['limit'] = 20;
		// 	}

		// 	$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getItineraryContent($id) {
		$content_data = array();

		$query = $this->db->query("SELECT *, (SELECT slug FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id='" . (int)$id . "') AS keyword FROM " . DB_PREFIX . $this->table."_content WHERE ".$this->table."_id = '" . (int)$id . "'");

		foreach ($query->rows as $result) {
			$content_data[$result['language_id']] = $result;
		}

		return $content_data;
	}


	public function getTotalItinerarys($data = array()) {
		$itinerary_class = isset($data['itinerary_class']) ? $data['itinerary_class'] : 1;
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . $this->table." WHERE itinerary_class = '".$itinerary_class."'";

		if (isset($filters['filter_date_added'])) {
			$sql .= "AND DATE(time_added) = DATE('".$this->db->escape($filters['filter_date_added'])."') ";
		}

		$query = $this->db->query($sql);
		return $query->row['total'];
	}


// CRUD
	public function addItinerary($data) {
		$this->event->trigger('pre.admin.add.'.$this->table, $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . $this->table." SET
			itinerary_title = '" .  $this->db->escape($data['itinerary_title']) . "',
			itinerary_class = '" . (int)$data['itinerary_class'] . "',
			itinerary_image = '" .  $this->db->escape($data['itinerary_image']) . "',
			itinerary_category = '" .  $this->db->escape('&'.implode('&',$data['itinerary_category']).'&') . "',
			total_price = '" . (float)$data['total_price'] . "',
			markup = '" . (float)$data['markup'] . "',
			customer_price = '" . (float)$data['customer_price'] . "',
			status = '" . (int)$data['status'] . "' ");

		$id = $this->db->getLastId();
		if (isset($data['room'])) {
			foreach ($data['room'] as $room) {
				$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_rooms SET
					".$this->table."_id = '" . (int)$id . "',
					room_id = '" . (int)$room['room_id'] . "',
					num_of_rooms = '" . (int)$room['num_of_rooms'] . "',
					num_of_nights = '" . (int)$room['num_of_nights'] . "',
					start_day = '" . (int)$room['start_day'] . "',
					booking_reference = '" . $this->db->escape($room['booking_reference']) . "',
					price = '" . (float)$room['price'] . "',
					`order` = '" . (int)$room['order'] . "'");
			}
		}

		if (isset($data['transportation'])) {
			foreach ($data['transportation'] as $transportation) {
				$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_transportations SET
					".$this->table."_id = '" . (int)$id . "',
					transportation_image = '" . $this->db->escape($transportation['image']) . "',
					transportation_title_ar = '" . $this->db->escape($transportation['transportation_title_ar']) . "',
					transportation_description_ar = '" . $this->db->escape($transportation['transportation_description_ar']) . "',
					transportation_title_en = '" . $this->db->escape($transportation['transportation_title_en']) . "',
					transportation_description_en = '" . $this->db->escape($transportation['transportation_description_en']) . "',
					time = '" . $this->db->escape($transportation['time']) . "',
					start_day = '" . (int)$transportation['start_day'] . "',
					price = '" . (float)$transportation['price'] . "',
					`order` = '" . (int)$transportation['order'] . "'");
			}
		}

		if (isset($data['tour'])) {
			foreach ($data['tour'] as $tour) {
				$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_tours SET
					".$this->table."_id = '" . (int)$id . "',
					tour_image = '" . $this->db->escape($tour['image']) . "',
					tour_title_ar = '" . $this->db->escape($tour['tour_title_ar']) . "',
					tour_description_ar = '" . $this->db->escape($tour['tour_description_ar']) . "',
					tour_title_en = '" . $this->db->escape($tour['tour_title_en']) . "',
					tour_description_en = '" . $this->db->escape($tour['tour_description_en']) . "',
					time = '" . $this->db->escape($tour['time']) . "',
					start_day = '" . (int)$tour['start_day'] . "',
					price = '" . (float)$tour['price'] . "',
					`order` = '" . (int)$tour['order'] . "'");
			}
		}

		if (isset($data['slug'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "seo_route SET content_source = '".$this->table."', content_id = '" . (int)$id . "', slug = '" . $this->db->escape($data['slug']) . "'");
		}

		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.add.'.$this->table, $id);

		return $id;
	}


	public function editItinerary( $data) {
		$this->event->trigger('pre.admin.edit.'.$this->table, $data);

		$id = $data['id'];

		$this->db->query("UPDATE " . DB_PREFIX . $this->table." SET
			itinerary_title = '" .  $this->db->escape($data['itinerary_title']) . "',
			itinerary_class = '" . (int)$data['itinerary_class'] . "',
			itinerary_image = '" .  $this->db->escape($data['itinerary_image']) . "',
			itinerary_category = '" .  $this->db->escape('&'.implode('&',$data['itinerary_category']).'&') . "',
			total_price = '" . (float)$data['total_price'] . "',
			markup = '" . (float)$data['markup'] . "',
			customer_price = '" . (float)$data['customer_price'] . "',
			status = '" . (int)$data['status'] . "'
			WHERE ".$this->table."_id = '" . (int)$id . "' ");

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table."_rooms WHERE ".$this->table."_id = '" . (int)$id . "'");
		if (isset($data['room'])) {
			foreach ($data['room'] as $room) {
				$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_rooms SET
					".$this->table."_id = '" . (int)$id . "',
					room_id = '" . (int)$room['room_id'] . "',
					num_of_rooms = '" . (int)$room['num_of_rooms'] . "',
					num_of_nights = '" . (int)$room['num_of_nights'] . "',
					booking_reference = '" . $this->db->escape($room['booking_reference']) . "',
					start_day = '" . (int)$room['start_day'] . "',
					price = '" . (float)$room['price'] . "',
					`order` = '" . (int)$room['order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table."_transportations WHERE ".$this->table."_id = '" . (int)$id . "'");
		if (isset($data['transportation'])) {
			foreach ($data['transportation'] as $transportation) {
				$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_transportations SET
					".$this->table."_id = '" . (int)$id . "',
					transportation_image = '" . $this->db->escape($transportation['image']) . "',
					transportation_title_ar = '" . $this->db->escape($transportation['transportation_title_ar']) . "',
					transportation_description_ar = '" . $this->db->escape($transportation['transportation_description_ar']) . "',
					transportation_title_en = '" . $this->db->escape($transportation['transportation_title_en']) . "',
					transportation_description_en = '" . $this->db->escape($transportation['transportation_description_en']) . "',
					time = '" . $this->db->escape($transportation['time']) . "',
					start_day = '" . (int)$transportation['start_day'] . "',
					price = '" . (float)$transportation['price'] . "',
					`order` = '" . (int)$transportation['order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table."_tours WHERE ".$this->table."_id = '" . (int)$id . "'");
		if (isset($data['tour'])) {
			foreach ($data['tour'] as $tour) {
				$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_tours SET
					".$this->table."_id = '" . (int)$id . "',
					tour_image = '" . $this->db->escape($tour['image']) . "',
					tour_title_ar = '" . $this->db->escape($tour['tour_title_ar']) . "',
					tour_description_ar = '" . $this->db->escape($tour['tour_description_ar']) . "',
					tour_title_en = '" . $this->db->escape($tour['tour_title_en']) . "',
					tour_description_en = '" . $this->db->escape($tour['tour_description_en']) . "',
					time = '" . $this->db->escape($tour['time']) . "',
					start_day = '" . (int)$tour['start_day'] . "',
					price = '" . (float)$tour['price'] . "',
					`order` = '" . (int)$tour['order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id = '" . (int)$id . "'");

		if (isset($data['slug'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "seo_route SET content_source = '".$this->table."', content_id = '" . (int)$id . "', slug = '" . $this->db->escape($data['slug']) . "'");
		}

		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.edit.'.$this->table, $id);
	}

	public function deleteItinerary($id) {
		$this->event->trigger('pre.admin.delete.'.$this->table, $id);

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table." WHERE ".$this->table."_id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table."_content WHERE ".$this->table."_id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."', content_id = '" . (int)$id . "'");

		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.delete.'.$this->table, $id);
	}

	public function orderMenu($menu_id , $menu_parent, $order)
	{
		$this->db->query("UPDATE " . DB_PREFIX ."menu SET menu_parent = '" . (int)$menu_parent . "',  `order` = '" . (int)$order . "' WHERE menu_id = '" . (int)$menu_id . "'");

	}

}
