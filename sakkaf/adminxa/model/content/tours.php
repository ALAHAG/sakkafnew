<?php
class ModelContentTours extends Model {

	private $table = 'tour';

	public function deleteTour($id) {
		$this->event->trigger('pre.admin.delete.category', $id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "tour WHERE id = '" . (int)$id . "'");
		$this->cache->delete('tour');

		$this->event->trigger('post.admin.delete.tour', $id);
	}

	public function getTourCities($data = array()) {

		$sql = "SELECT distinct(city_name),city_id FROM " . DB_PREFIX . "tour";

		if (!empty($data['cat_id'])) {
			$sql .= " WHERE cat_id = '" . (int)$data['cat_id'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->rows;

	}
	public function getTours($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "tour";
		if (!empty($data['cat_id'])) {
			$sql .= " WHERE cat_id = '" . (int)$data['cat_id'] . "'";
		}
		if (!empty($data['city_id'])) {
			$sql .= " AND city_id = '" . (int)$data['city_id'] . "'";
		}
		//
		// $sort_data = array(
		// 	'h.hotel_english_name'
		// );
		//
		// if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
		// 	$sql .= " ORDER BY h.hotel_english_name";
		// } else {
		// 	$sql .= " ORDER BY h.hotel_english_name";
		// }

		// if (isset($data['order']) && ($data['order'] == 'DESC')) {
		// 	$sql .= " DESC";
		// } else {
		// 	$sql .= " ASC";
		// }
		//
		// if (isset($data['start']) || isset($data['limit'])) {
		// 	if ($data['start'] < 0) {
		// 		$data['start'] = 0;
		// 	}
		//
		// 	if ($data['limit'] < 1) {
		// 		$data['limit'] = 20;
		// 	}
		//
		// 	$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		// }

		$query = $this->db->query($sql);

		return $query->rows;
	}
	public function getTour($id) {

		$sql = "SELECT *,  (SELECT slug FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id='" . (int)$id . "') AS slug FROM " . DB_PREFIX . "tour WHERE id = '" . (int)$id . "'";
		// $sql = "SELECT * FROM " . DB_PREFIX . "tour WHERE id = '" . (int)$id . "'";

		$query = $this->db->query($sql);
		return $query->row;
	}

	public function editTour($id, $data) {

		$this->db->query("UPDATE " . DB_PREFIX . "tour SET
		num_of_transportations = '" . (int)$data['num_of_transportations'] . "',
		num_of_passangers = '" . (int)$data['num_of_passangers'] . "',
		image = '" . $this->db->escape($data['image']) . "',
		cat_id = '" . $this->db->escape($data['cat_id']) . "',
		city_id = '" . $this->db->escape($data['city_id']) . "',
		city_name = '" . $this->db->escape($data['city_name']) . "',
		fromCity = '" . $this->db->escape($data['fromCity']) . "',
		toCity = '" . $this->db->escape($data['toCity']) . "',
		carType = '" . $this->db->escape($data['carType']) . "',
		title_ar = '" . $this->db->escape($data['title_ar']) . "',
		description_ar = '" . $this->db->escape($data['description_ar']) . "',
		title_en = '" . $this->db->escape($data['title_en']) . "',
		description_en = '" . $this->db->escape($data['description_en']) . "',
		time = '" . $this->db->escape($data['time']) . "',
		start_day = '" . (int)$data['start_day'] . "',
		price = '" . (float)$data['price'] . "',
		selprice = '" . (float)$data['selprice'] . "',
		`order` = '" . (int)$data['order'] . "'
		 WHERE id = '" . (int)$id . "'");




		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id = '" . (int)$id . "'");

		if ($data['slug']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "seo_route SET content_source = '".$this->table."', content_id = '" . (int)$id . "', slug = '" . $this->db->escape($data['slug']) . "'");
		}

	}
	public function addTour($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "tour SET

			num_of_transportations = '" . (int)$data['num_of_transportations'] . "',
			num_of_passangers = '" . (int)$data['num_of_passangers'] . "',
			image = '" . $this->db->escape($data['image']) . "',
			cat_id = '" . $this->db->escape($data['cat_id']) . "',
			city_id = '" . $this->db->escape($data['city_id']) . "',
			city_name = '" . $this->db->escape($data['city_name']) . "',
			fromCity = '" . $this->db->escape($data['fromCity']) . "',
			toCity = '" . $this->db->escape($data['toCity']) . "',
			carType = '" . $this->db->escape($data['carType']) . "',
			title_ar = '" . $this->db->escape($data['title_ar']) . "',
			description_ar = '" . $this->db->escape($data['description_ar']) . "',
			title_en = '" . $this->db->escape($data['title_en']) . "',
			description_en = '" . $this->db->escape($data['description_en']) . "',
			time = '" . $this->db->escape($data['time']) . "',
			start_day = '" . (int)$data['start_day'] . "',
			price = '" . (float)$data['price'] . "',
			selprice = '" . (float)$data['selprice'] . "',
			`order` = '" . (int)$data['order'] . "'");

			$id = $this->db->getLastId();


		// foreach ($data['hotel_description'] as $language_id => $value) {
		// 		$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_content SET
		// 			hotel_id = '" . (int)$hotel_id . "',
		// 			language_id = '" . (int)$language_id . "',
		// 			hotel_name = '" . $this->db->escape($value['hotel_name']) . "',
		// 			meta_description = '" . $this->db->escape($value['meta_description']) . "',
		// 			hotel_content = '" . $this->db->escape($value['description']) . "'");
		// 	}
		//
		// if (isset($data['hotel_images'])) {
		// 	foreach ($data['hotel_images'] as $key =>$image) {
		// 		if (!isset($image['cover'])) {
		// 			$image['cover'] = 0;
		// 		}
		// 		$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_images SET
		// 				 hotel_id = '" . (int)$hotel_id . "',
		// 				 image = '" .$this->db->escape($image['image']) . "',
		// 				 cover = '" . (int)$image['cover'] . "'");
		// 	}
		// }
		//
 		// if (isset($data['hotel_room'])) {
		//
		// 	foreach ($data['hotel_room'] as $hotel_room) {
		// 		$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_rooms SET
		// 			 		hotel_id = '" . (int)$hotel_id. "',
		// 					room_english_name = '" . $this->db->escape($hotel_room['room_english_name']) . "',
		// 					occupancy = '" . (int)$hotel_room['occupancy'] . "',
		// 					price = '" . (int)$hotel_room['price'] . "',
		// 					image = '" . $this->db->escape($hotel_room['image']) . "'
		// 		 ");
		//
		// 		$room_id = $this->db->getLastId();
		//
		// 		foreach ($hotel_room['hotel_room_description'] as $language_id => $value) {
		// 			$this->db->query("INSERT INTO " . DB_PREFIX . "hotel_room_content SET
		// 			 room_id = '" . (int)$room_id . "',
		// 			 language_id = '" . (int)$language_id . "',
		// 			 room_name = '" . $this->db->escape($value['room_name']) . "',
		// 			 room_content = '" . $this->db->escape($value['room_description']) . "'");
		// 		}
		// 	}
		// }
		if ($data['slug']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "seo_route SET content_source = '".$this->table."', content_id = '" . (int)$id . "', slug = '" . $this->db->escape($data['slug']) . "'");
		}

	}
	// public function getHotelRooms($hotel_id) {
	// 	$hotel_description_data = array();
	//
	// 	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_rooms WHERE hotel_id = '" . (int)$hotel_id . "'");
	//
	// 	$hotel_rooms = $query->rows;
	// 	$i=0;
	// 	foreach ($hotel_rooms as $result) {
	// 		$dquery = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_room_content WHERE room_id = '" . (int)$result['room_id'] . "'");
	// 		$hotel_room_description = array();
	// 		foreach ($dquery->rows as $dresult) {
	// 			$hotel_room_description[$dresult['language_id']] = array(
	// 				'room_name'      => $dresult['room_name'],
	// 				'room_description'      => $dresult['room_content']
	// 			);
	// 		}
	// 		$hotel_rooms[$i]['hotel_room_description'] = $hotel_room_description;
	// 		$i++;
	// 	}
	// 	return $hotel_rooms;
	// }
	//
	// public function getHotelDescriptions($hotel_id) {
	// 	$information_description_data = array();
	//
	// 	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_content WHERE hotel_id = '" . (int)$hotel_id . "'");
	//
	// 	foreach ($query->rows as $result) {
	// 		$information_description_data[$result['language_id']] = array(
	// 			'hotel_name'       => $result['hotel_name'],
	// 			'meta_description'       => $result['meta_description'],
	// 			'description' => $result['hotel_content']
	// 		);
	// 	}
	//
	// 	return $information_description_data;
	// }
	public function getTotalTours() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "tour");

		return $query->row['total'];
	}


	// public function getHotelImages($hotel_id) {
	// 	$information_image_data = array();
	//
	// 	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_images WHERE hotel_id = '" . (int)$hotel_id . "'");
	//
	// 	return $query->rows;
	// }
}
