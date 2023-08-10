<?php
class ModelContentHotels extends Model {

	private $table = 'hotels';

	public function deleteHotel($hotel_id) {
		$this->event->trigger('pre.admin.delete.category', $hotel_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "hotel WHERE hotel_id = '" . (int)$hotel_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "hotel_content WHERE hotel_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "hotel_images WHERE hotel_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "hotel_rooms WHERE hotel_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "hotel_room_content WHERE hotel_id = '" . (int)$hotel_id . "'");

		$this->cache->delete('hotel');

		$this->event->trigger('post.admin.delete.hotel', $hotel_id);
	}


	public function getHotels($data = array()) {

		$sql = "SELECT c.city_name, h.hotel_id , h.status,h.city_id, h.address,h.email,h.star_rate,h.hotel_english_name FROM " . DB_PREFIX . "hotel h
				LEFT JOIN " . DB_PREFIX . "city c on (c.city_id = h.city_id) ";

		if (!empty($data['filter_name'])) {
			$sql .= " AND h.hotel_english_name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'h.hotel_english_name'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY h.hotel_english_name";
		} else {
			$sql .= " ORDER BY h.hotel_english_name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
	public function getHotel($hotel_id) {

		$sql = "SELECT *,  (SELECT slug FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id='" . (int)$hotel_id . "') AS slug FROM " . DB_PREFIX . "hotel WHERE hotel_id = '" . (int)$hotel_id . "'";
		$query = $this->db->query($sql);
		return $query->row;
	}

	public function editHotel($hotel_id, $data) {

		$this->db->query("UPDATE " . DB_PREFIX . "hotel SET
			hotel_english_name = '" . $this->db->escape($data['hotel_english_name']) . "',
			status = '" . (int)$data['status']. "',
			city_id = '" . (int)$data['city_id'] . "',
			address = '" . $this->db->escape($data['address']) . "',
			phone = '" . $this->db->escape($data['phone']) . "',
			fax = '" . $this->db->escape($data['fax']) . "',
			website_url = '" . $this->db->escape($data['website_url']) . "',
			email = '" . $this->db->escape($data['email']) . "',
			star_rate = '" . (float)$data['star_rating'] . "',
			map = '" . $this->db->escape($data['map']) . "'
			 WHERE hotel_id = '" . (int)$hotel_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "hotel_content WHERE  hotel_id = '" . (int)$hotel_id . "'");

		foreach ($data['hotel_description'] as $language_id => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_content SET
					hotel_id = '" . (int)$hotel_id . "',
					language_id = '" . (int)$language_id . "',
					hotel_name = '" . $this->db->escape($value['hotel_name']) . "',
					meta_description = '" . $this->db->escape($value['meta_description']) . "',
					hotel_content = '" . $this->db->escape($value['description']) . "'");
			}

		if (isset($data['hotel_images'])) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "hotel_images WHERE hotel_id = '" . (int)$hotel_id . "'");
			foreach ($data['hotel_images'] as $key =>$image) {
				if (!isset($image['cover'])) {
					$image['cover'] = 0;
				}
				$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_images SET
						 hotel_id = '" . (int)$hotel_id . "',
						 image = '" .$this->db->escape($image['image']) . "',
						 cover = '" . (int)$image['cover'] . "'");
			}
		}

		if (isset($data['hotel_room'])) {
			foreach ($data['hotel_room'] as $hotel_room) {

				if (isset($hotel_room['room_id']) && $hotel_room['room_id'] != '') {
					$room_id = $hotel_room['room_id'];
					$this->db->query("UPDATE " . DB_PREFIX . "hotel_rooms SET
							room_english_name = '" . $this->db->escape($hotel_room['room_english_name']) . "',
							occupancy = '" . (int)$hotel_room['occupancy'] . "',
							r_price = '" . (int)$hotel_room['price'] . "',
							image = '" . $this->db->escape($hotel_room['image']) . "'
							WHERE room_id = '" . (int)$room_id. "'");

					foreach ($hotel_room['hotel_room_description'] as $language_id => $value) {
						$this->db->query("UPDATE " . DB_PREFIX . "hotel_room_content SET
								room_name = '" . $this->db->escape($value['room_name']) . "',
								room_content = '" . $this->db->escape($value['room_description']) . "'
								WHERE room_id = '" . (int)$room_id . "' AND language_id = '" . (int)$language_id . "'");
					}
				}else{
					$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_rooms SET
						 		hotel_id = '" . (int)$hotel_id. "',
								room_english_name = '" . $this->db->escape($hotel_room['room_english_name']) . "',
								occupancy = '" . (int)$hotel_room['occupancy'] . "',
								r_price = '" . (int)$hotel_room['price'] . "',
								image = '" . $this->db->escape($hotel_room['image']) . "'
					 ");

					$room_id = $this->db->getLastId();

					foreach ($hotel_room['hotel_room_description'] as $language_id => $value) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_room_content SET
						 room_id = '" . (int)$room_id . "',
						 language_id = '" . (int)$language_id . "',
						 room_name = '" . $this->db->escape($value['room_name']) . "',
						 room_content = '" . $this->db->escape($value['room_description']) . "'");
					}

				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id = '" . (int)$hotel_id . "'");

		if ($data['slug']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "seo_route SET content_source = '".$this->table."', content_id = '" . (int)$hotel_id . "', slug = '" . $this->db->escape($data['slug']) . "'");
		}

	}
	public function addHotel($data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "hotel SET
			hotel_english_name = '" . $this->db->escape($data['hotel_english_name']) . "',
			status = '" . (int)$data['status']. "',
			city_id = '" . (int)$data['city_id'] . "',
			address = '" . $this->db->escape($data['address']) . "',
			phone = '" . $this->db->escape($data['phone']) . "',
			fax = '" . $this->db->escape($data['fax']) . "',
			website_url = '" . $this->db->escape($data['website_url']) . "',
			email = '" . $this->db->escape($data['email']) . "',
			star_rate = '" . (float)$data['star_rating'] . "',
			map = '" . $this->db->escape($data['map']) . "'");

			$hotel_id = $this->db->getLastId();


		foreach ($data['hotel_description'] as $language_id => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_content SET
					hotel_id = '" . (int)$hotel_id . "',
					language_id = '" . (int)$language_id . "',
					hotel_name = '" . $this->db->escape($value['hotel_name']) . "',
					meta_description = '" . $this->db->escape($value['meta_description']) . "',
					hotel_content = '" . $this->db->escape($value['description']) . "'");
			}

		if (isset($data['hotel_images'])) {
			foreach ($data['hotel_images'] as $key =>$image) {
				if (!isset($image['cover'])) {
					$image['cover'] = 0;
				}
				$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_images SET
						 hotel_id = '" . (int)$hotel_id . "',
						 image = '" .$this->db->escape($image['image']) . "',
						 cover = '" . (int)$image['cover'] . "'");
			}
		}

 		if (isset($data['hotel_room'])) {

			foreach ($data['hotel_room'] as $hotel_room) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_rooms SET
					 		hotel_id = '" . (int)$hotel_id. "',
							room_english_name = '" . $this->db->escape($hotel_room['room_english_name']) . "',
							occupancy = '" . (int)$hotel_room['occupancy'] . "',
							r_price = '" . (int)$hotel_room['price'] . "',
							image = '" . $this->db->escape($hotel_room['image']) . "'
				 ");

				$room_id = $this->db->getLastId();

				foreach ($hotel_room['hotel_room_description'] as $language_id => $value) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_room_content SET
					 room_id = '" . (int)$room_id . "',
					 language_id = '" . (int)$language_id . "',
					 room_name = '" . $this->db->escape($value['room_name']) . "',
					 room_content = '" . $this->db->escape($value['room_description']) . "'");
				}
			}
		}
		if ($data['slug']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "seo_route SET content_source = '".$this->table."', content_id = '" . (int)$hotel_id . "', slug = '" . $this->db->escape($data['slug']) . "'");
		}

	}
	public function getHotelRooms($hotel_id) {
		$hotel_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_rooms WHERE hotel_id = '" . (int)$hotel_id . "'");

		$hotel_rooms = $query->rows;
		$i=0;
		foreach ($hotel_rooms as $result) {
			$dquery = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_room_content WHERE room_id = '" . (int)$result['room_id'] . "'");
			$hotel_room_description = array();
			foreach ($dquery->rows as $dresult) {
				$hotel_room_description[$dresult['language_id']] = array(
					'room_name'      => $dresult['room_name'],
					'room_description'      => $dresult['room_content']
				);
			}
			$hotel_rooms[$i]['hotel_room_description'] = $hotel_room_description;
			$i++;
		}
		return $hotel_rooms;
	}

	public function getHotelDescriptions($hotel_id) {
		$information_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_content WHERE hotel_id = '" . (int)$hotel_id . "'");

		foreach ($query->rows as $result) {
			$information_description_data[$result['language_id']] = array(
				'hotel_name'       => $result['hotel_name'],
				'meta_description'       => $result['meta_description'],
				'description' => $result['hotel_content']
			);
		}

		return $information_description_data;
	}
	public function getTotalHotels() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "hotel");

		return $query->row['total'];
	}


	public function getHotelImages($hotel_id) {
		$information_image_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_images WHERE hotel_id = '" . (int)$hotel_id . "'");

		return $query->rows;
	}
}
