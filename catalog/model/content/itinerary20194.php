<?php
class ModelContentItinerary extends Model {

	private $table = 'itinerary';

	// Get

	public function getItinerary($id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT slug FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id='" . (int)$id . "') AS slug FROM " . DB_PREFIX . $this->table."
			WHERE ".$this->table."_id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getItineraryRooms($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->table."_rooms AS ir
									LEFT JOIN " . DB_PREFIX ."hotel_rooms AS hr ON ir.room_id = hr.room_id
									LEFT JOIN " . DB_PREFIX ."hotel_room_content AS hrc on hr.room_id = hrc.room_id AND hrc.language_id = ".(int)$this->config->get('config_language_id')."
									LEFT JOIN " . DB_PREFIX ."hotel AS h on h.hotel_id = hr.hotel_id
									LEFT JOIN " . DB_PREFIX ."hotel_content AS hc on hc.hotel_id= h.hotel_id AND hc.language_id = ".(int)$this->config->get('config_language_id')."
									LEFT JOIN " . DB_PREFIX . "seo_route sr on (content_source = 'hotels' AND content_id= hr.hotel_id )
									LEFT JOIN " . DB_PREFIX ."city AS c on h.city_id = c.city_id
									WHERE ir.".$this->table."_id = '" . (int)$id . "'   order by ir.order ");

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
				// LEFT JOIN " . DB_PREFIX . $this->table."_content AS tc on (t.".$this->table."_id = tc.".$this->table."_id )
		$sql = "SELECT t.*,r.itinerary_id,sum(r.num_of_nights) as night,sr.slug FROM " . DB_PREFIX . $this->table." AS t
				LEFT JOIN " . DB_PREFIX ."seo_route AS sr on (sr.content_source = '".$this->table."' AND content_id= t.".$this->table."_id)
				LEFT JOIN " . DB_PREFIX ."itinerary_rooms as r on (r.itinerary_id=t.".$this->table."_id)

		 WHERE itinerary_class = '".$itinerary_class."' AND status=1";
		 // if (isset($data['category'])) {

		 // 	$sql .= " AND itinerary_category LIKE '%&".(int)$data['category']."&%' ";
		 // }


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

		// $query = $this->db->query($sql);
		// echo $sql;
		//
		//
		//
	    $where = array();
	     // dd($data);
	     $category =array();

		if(isset($data['category']) && $data['category']){
			$category=$data['category'];
			$data_category=array();
			foreach ((array)$category as $key => $value) {
				$data_category[$key] = (int) $value;
			}

			$where[] = "  itinerary_category LIKE '%&".implode("&%' OR  itinerary_category LIKE '%&", (array)$data_category)."&%'";
		}
	  if(isset($data['price']) && $data['price']){
			$price=$data['price'];
			$where[] = "  t.customer_price <=".$price."";
		}
		$where[] = "  (r.itinerary_id >=200)";
		$sort_data = array(
			'r.itinerary_id'
		);
		// print_r($where);exit;
		if(sizeof($where)){
			$sql .=  " AND ".implode(' AND ', $where);
		}
		$sql .= " group by r.itinerary_id";

		if(isset($data['night']) && $data['night']){
				$category=$data['night'];

				$sql .= "  HAVING sum(r.num_of_nights) =".$category."";
		}
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			// $sql .= " ORDER BY sum(r.num_of_nights) ";
			$sql .= " ORDER BY r.itinerary_id,sum(r.num_of_nights) ";
		} else {
			$sql .= " ORDER BY t.customer_price ASC,sum(r.num_of_nights) ";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= "ASC";
		} else {
			$sql .= "ASC";
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
		// var_dump($data['category']);
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


	// public function getTotalItinerarys($data) {

	// 	$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . $this->table."";
	//     $where = array();

	//     // dd($data);
	// 	if(isset($data['category']) && $data['category']){
	// 		foreach ((array)$data['category'] as $key => $value) {
	// 			$data['category'][$key] = (int) $value;
	// 		}
	// 		$where[] = "  itinerary_category LIKE '%&".implode("&%' OR  itinerary_category LIKE '%&", (array)$data['category'])."&%'";
	// 	}

	// 	if(sizeof($where)){
	// 		$sql .=  " WHERE".implode(' AND ', $where);
	// 	}


	//     if(isset($data['night']) && $data['night']){
	// 			$category=$data['night'];

	// 			$sql .= "  HAVING sum(r.num_of_nights) =".$category."";
	// 	}
	// 	$query = $this->db->query($sql);


	// 	return $query->row['total'];
	// }
		public function getTotalItinerarys($data) {
		$itinerary_class = $data['itinerary_class'];
				// LEFT JOIN " . DB_PREFIX . $this->table."_content AS tc on (t.".$this->table."_id = tc.".$this->table."_id )
		$sql = "SELECT t.*,r.itinerary_id,sum(r.num_of_nights) as night,sr.slug FROM " . DB_PREFIX . $this->table." AS t
				LEFT JOIN " . DB_PREFIX ."seo_route AS sr on (sr.content_source = '".$this->table."' AND content_id= t.".$this->table."_id)
				LEFT JOIN " . DB_PREFIX ."itinerary_rooms as r on (r.itinerary_id=t.".$this->table."_id)


		 WHERE itinerary_class = '".$itinerary_class."' AND status=1 AND r.itinerary_id>=200";
		 // if (isset($data['category'])) {

		 // 	$sql .= " AND itinerary_category LIKE '%&".(int)$data['category']."&%' ";
		 // }


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

		// $query = $this->db->query($sql);
		// echo $sql;
		//
		//
		//
	    $where = array();
	     // dd($data);
	     $category =array();

		if(isset($data['category']) && $data['category']){
			$category=$data['category'];
			$data_category=array();
			foreach ((array)$category as $key => $value) {
				$data_category[$key] = (int) $value;
			}

			$where[] = "  itinerary_category LIKE '%&".implode("&%' OR  itinerary_category LIKE '%&", (array)$data_category)."&%'";
		}
	  if(isset($data['price']) && $data['price']){
			$price=$data['price'];
			$where[] = "  t.customer_price <=".$price."";
		}
		$sort_data = array(
			'r.itinerary_id'
		);
		// print_r($where);exit;
		if(sizeof($where)){
			$sql .=  " AND ".implode(' AND ', $where);
		}
		$sql .= " group by r.itinerary_id";

		if(isset($data['night']) && $data['night']){
				$category=$data['night'];

				$sql .= "  HAVING sum(r.num_of_nights) =".$category."";
		}
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY sum(r.num_of_nights)";
		} else {
			$sql .= " ORDER BY sum(r.num_of_nights)";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}



		// dd($sql);

		$query = $this->db->query($sql);

		// dd($query);
		return $query->num_rows;
	}

	public function addBooking($data)
	{

		$sql= $this->db->query("INSERT INTO " . DB_PREFIX ."booking SET
			itinerary_id = '" . (int)$data['itinerary_id'] . "',
			customer_name_ar = '" .  $this->db->escape($data['customer_name_ar']) . "',
			arrival_date = '" .  $this->db->escape( date("Y-m-d H:m:s", strtotime($data['arrival_date']))) . "',
			departure_date = '" .  $this->db->escape(  date("Y-m-d H:m:s", strtotime($data['departure_date']))) . "',
			email = '" .  $this->db->escape($data['email']) . "',
			customer_country = '" .  $this->db->escape($data['country']) . "',
			booking_type = '" .  $this->db->escape($data['booking_type']) . "',
			phone = '" .  $this->db->escape($data['phone']) . "',
			num_adults = '" . (int)$data['num_adults'] . "',
			num_children = '" . (int)$data['num_children'] . "',
			num_bags = '" . (int)$data['num_bags'] . "',
			notes = '" .  $this->db->escape($data['notes']) . "'");

			$booking_id = $this->db->getLastId();

			if($data['booking_type'] == 'tours' && isset($data['tours'])){
				foreach ($data['tours'] as $tour ) {
					$this->db->query("INSERT INTO " . DB_PREFIX ."booking_tours SET
					booking_id = '" . (int)$booking_id . "',
					tour_id = '" . (int)$tour['id'] . "',
					price = '" . (float)$tour['price'] . "'");

				}
			}
		return $sql;
	}
	public function getBookings(){
		$query = $this->db->query("SELECT customer_name_ar,customer_country FROM " . DB_PREFIX . "booking order by booking_id desc limit 15");



		return $query->rows;

	}

}
