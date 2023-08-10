<?php
class ModelContentHotels extends Model {

	private $table = 'hotels';

 
	public function getHotels($data = array()) {

		$sql = "SELECT * FROM " . DB_PREFIX . "hotel h
				LEFT JOIN " . DB_PREFIX . "hotel_content hc on (hc.hotel_id = h.hotel_id)
				LEFT JOIN " . DB_PREFIX . "hotel_images hg on (hg.hotel_id = h.hotel_id AND hg.cover=1)
				LEFT JOIN " . DB_PREFIX . "seo_route sr on (content_source = '".$this->table."' AND content_id= h.hotel_id )

				";

		$where = array();

		if (!empty($data['filter_name'])) {
			$where[] = " h.hotel_english_name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if(isset($data['city']) && $data['city']){
			foreach ($data['city'] as $key => $value) {
				$data['city'][$key] = (int) $value;
			}

			$where[] = " ( h.city_id = ".implode(' || h.city_id = ', $data['city'])." ) ";
		}

		if(isset($data['rate']) && $data['rate']){
			foreach ($data['rate'] as $key => $value) {
				$data['rate'][$key] = (int) $value;
			}

			$where[] = " ( h.star_rate = ".implode(' || h.star_rate = ', $data['rate'])." ) ";
		}

		$sort_data = array(
			'h.hotel_english_name'
		);

		if(sizeof($where)){
			$sql .=  " WHERE ".implode(' AND ', $where);
		}

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
			if (!isset($data['start']) || $data['start'] < 0 ) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		// dd($sql);

		$query = $this->db->query($sql);

		return $query->rows;
	}
	public function getHotel($hotel_id) {

		$sql = "SELECT * FROM " . DB_PREFIX . "hotel h
				LEFT JOIN " . DB_PREFIX . "city c ON (h.city_id = c.city_id)
				WHERE hotel_id = '" . (int)$hotel_id . "'";
		$query = $this->db->query($sql);
		return $query->row;
	}

	public function getHotelRooms($hotel_id) {
		$hotel_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_rooms hs
									LEFT JOIN " . DB_PREFIX . "hotel_room_content hsc on (hs.room_id = hsc.room_id)
									WHERE hs.hotel_id = '" . (int)$hotel_id . "'");
		return $query->rows;
	}

	public function getHotelImages($hotel_id) {
		$information_image_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_images WHERE hotel_id = '" . (int)$hotel_id . "'");

		return $query->rows;
	}

	public function getHotelContent($hotel_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "hotel_content WHERE hotel_id = '" . (int)$hotel_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}
	public function getTotalHotels($data) {

		$sql = "SELECT  COUNT(*) AS total FROM " . DB_PREFIX . "hotel h	";

		$where = array();

		if (!empty($data['filter_name'])) {
			$where[] = " h.hotel_english_name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if(isset($data['city']) && $data['city']){

			$where[] = " ( h.city_id = ".implode(' || h.city_id = ', $data['city'])." ) ";
		}

		if(isset($data['rate']) && $data['rate']){

			$where[] = " ( h.star_rate = ".implode(' || h.star_rate = ', $data['rate'])." ) ";
		}

		$sort_data = array(
			'h.hotel_english_name'
		);

		if(sizeof($where)){
			$sql .=  " WHERE ".implode(' AND ', $where);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}


}