<?php
class ModelContentBooking extends Model {

	private $table = 'booking';

	// Get 

	public function getData($id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . $this->table." WHERE ".$this->table."_id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getAllData($filters = array()) {

		$sql = "SELECT * FROM " . DB_PREFIX . $this->table." ";

		$para = array();

		if (isset($filters['filter_id'])) {
			$para[] = " ".$this->table."_id  LIKE '".$filters['filter_id']."%'";
		}

		if (isset($filters['filter_name'])) {
			$para[] = " ( customer_name_ar  LIKE '".$filters['filter_name']."%' OR  customer_name_en  LIKE '".$filters['filter_name']."%')";
		}

		if ($para) {
			$sql = $sql . " WHERE ". implode(' AND ', $para);
		}
		$sql = $sql . " ORDER BY  ". DB_PREFIX . $this->table.".booking_id DESC";
		 dd($sql);
		$query = $this->db->query($sql);


		return $query->rows;
	}

	public function getBookingHistory($id) {
		$content_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->table."_history t
									LEFT JOIN " . DB_PREFIX ."itinerary i on ( i.itinerary_id = t.itinerary_id )
									WHERE ".$this->table."_id = '" . (int)$id . "'");

		return $query->rows;
	}


	public function getTotalData($filters = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . $this->table." ";

		if (isset($filters['filter_date_added'])) {
			$sql .= "WHERE DATE(time_added) = DATE('".$this->db->escape($filters['filter_date_added'])."') ";
		}


		$query = $this->db->query($sql);
		return $query->row['total'];
	}


// CRUD 

	public function addData($data)
	{
		$this->db->query("INSERT INTO " . DB_PREFIX ."booking SET
			itinerary_id = '" . (int)$data['itinerary_id'] . "',
			customer_name_ar = '" .  $this->db->escape($data['customer_name_ar']) . "',
			customer_name_en = '" .  $this->db->escape($data['customer_name_en']) . "',
			arrival_date = '" .  $this->db->escape( date("Y-m-d", strtotime($data['arrival_date']))) . "',
			departure_date = '" .  $this->db->escape(  date("Y-m-d", strtotime($data['departure_date']))) . "',
			customer_country = '" .  $this->db->escape($data['customer_country']) . "',
			email = '" .  $this->db->escape($data['email']) . "',
			phone = '" .  $this->db->escape($data['phone']) . "',
			booking_type = '" . (int)$data['booking_type'] . "',
			num_adults = '" . (int)$data['num_adults'] . "',
			num_children = '" . (int)$data['num_children'] . "',
			num_bags = '" . (int)$data['num_bags'] . "',			
			notes = '" .  $this->db->escape($data['notes']) . "'");

		return $this->db->getLastId();
	}

	public function editData($data) {
		$id = $data[$this->table."_id"];
		$this->event->trigger('pre.admin.edit.'.$this->table, $data);


		$this->db->query("UPDATE " . DB_PREFIX . $this->table." SET
					itinerary_id = '" . (int)$data['itinerary_id'] . "',
					customer_name_ar = '" .  $this->db->escape($data['customer_name_ar']) . "',
					customer_name_en = '" .  $this->db->escape($data['customer_name_en']) . "',
					arrival_date = '" .  $this->db->escape( date("Y-m-d", strtotime($data['arrival_date']))) . "',
					departure_date = '" .  $this->db->escape(  date("Y-m-d", strtotime($data['departure_date']))) . "',
					customer_country = '" .  $this->db->escape($data['customer_country']) . "',
					email = '" .  $this->db->escape($data['email']) . "',
					phone = '" .  $this->db->escape($data['phone']) . "',
					num_adults = '" . (int)$data['num_adults'] . "',
					num_children = '" . (int)$data['num_children'] . "',
					booking_type = '" . (int)$data['booking_type'] . "',
					num_bags = '" . (int)$data['num_bags'] . "',			
					notes = '" .  $this->db->escape($data['notes']) . "'
					WHERE ". $this->table."_id = ".(int)$data['booking_id']."
					");

		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.edit.'.$this->table, $id);
	}

	public function deleteData($id) {
		$this->event->trigger('pre.admin.delete.'.$this->table, $id);

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table." WHERE ".$this->table."_id = '" . (int)$id . "'");
		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.delete.'.$this->table, $id);
	}

	public function addBookingHistory($data)
	{
		$this->db->query("INSERT INTO " . DB_PREFIX ."booking_history SET
			itinerary_id = '" . (int)$data['itinerary_id'] . "',
			booking_id = '" . (int)$data['booking_id'] . "',
			admin_id = '" . (int)$data['admin_id'] . "'
			");
	}

}