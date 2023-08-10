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
		if (isset($filters['start']) || isset($filters['limit'])) {
			if ($filters['start'] < 0) {
				$filters['start'] = 0;
			}

			if ($filters['limit'] < 1) {
				$filters['limit'] = 20;
			}
			$sql = $sql . " ORDER BY  ". DB_PREFIX . $this->table.".booking_id DESC";

			$sql .= " LIMIT " . (int)$filters['start'] . "," . (int)$filters['limit'];
		}


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

		$query = $this->db->query($sql);

		return $query->num_rows;
	}

	public function getReport($filters = array()) {

		$sql = "SELECT * , b.time_added as booking_date FROM " . DB_PREFIX . $this->table." b 
				LEFT JOIN " . DB_PREFIX ."booking_history bh on (bh.booking_id = b.booking_id)
				JOIN " . DB_PREFIX ."itinerary i on (i.itinerary_class = 3 AND i.itinerary_id = bh.itinerary_id) ";

		$para = array();

		if (isset($filters['filter_from']) && isset($filters['filter_to'])) {
			$from = date('Y-m-d', strtotime($filters['filter_from']));
			$to = date('Y-m-d', strtotime($filters['filter_to']));

			$para[] = 'b.time_added between "'.$from.'" AND "'.$to.'"  ';
		}

		if ($para) {
			$sql = $sql . " WHERE ". implode(' AND ', $para);
		}

		$query = $this->db->query($sql);


		return $query->rows;
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
			currancy_type = '" . (int)$data['currancy_type'] . "',
			agent_type = '" . (int)$data['agent_type'] . "',
			num_adults = '" . (int)$data['num_adults'] . "',
			num_children = '" . (int)$data['num_children'] . "',
			num_bags = '" . (int)$data['num_bags'] . "',			
			notes = '" .  $this->db->escape($data['notes']) . "'");

		$id = $this->db->getLastId();


		// USER ACTION LOG


		$action = array("booking_id" => $id,
						"itinerary_id" => $data['itinerary_id'],
						"action" => "Added New Booking");

		$this->addUserActionLog($action);

		// END USER ACTION LOG
		return $id;
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
					currancy_type = '" . (int)$data['currancy_type'] . "',
					agent_type = '" . (int)$data['agent_type'] . "',
					num_bags = '" . (int)$data['num_bags'] . "',			
					notes = '" .  $this->db->escape($data['notes']) . "'
					WHERE ". $this->table."_id = ".(int)$data['booking_id']."
					");


		// USER ACTION LOG
		$action = array("booking_id" => $data['booking_id'],
						"itinerary_id" => $data['itinerary_id'],
						"action" => "Edited Booking");

		$this->addUserActionLog($action);
		// END USER ACTION LOG


		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.edit.'.$this->table, $id);
	}

	public function deleteData($id) {
		$this->event->trigger('pre.admin.delete.'.$this->table, $id);

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table." WHERE ".$this->table."_id = '" . (int)$id . "'");
		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.delete.'.$this->table, $id);

		// USER ACTION LOG
		$action = array("booking_id" => $id,
						"itinerary_id" => '',
						"action" => "Deleted Booking");

		$this->addUserActionLog($action);
		// END USER ACTION LOG	
	}

	public function addBookingHistory($data)
	{
		$this->db->query("INSERT INTO " . DB_PREFIX ."booking_history SET
			itinerary_id = '" . (int)$data['itinerary_id'] . "',
			booking_id = '" . (int)$data['booking_id'] . "',
			admin_id = '" . (int)$data['admin_id'] . "'
			");
	}

	public function addUserActionLog($data)
	{
		$this->db->query("INSERT INTO " . DB_PREFIX ."user_action_log SET
			itinerary_id = '" . (int)$data['itinerary_id'] . "',
			booking_id = '" . (int)$data['booking_id'] . "',
			user_id = '" . (int) $this->user->getId() . "',
			action = '" . $this->db->escape($data['action']) . "'
			");
	}

}