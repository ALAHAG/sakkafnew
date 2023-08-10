<?php
class ModelContentTestimonial extends Model {
	public function addInformation($data) {

		$this->db->query("INSERT INTO " .DB_PREFIX .
		  "testimonials SET testimonial_body = '" . $this->db->escape($data['testimonial_body']) .
		  "', company_rate = '" .(int) $data['company_rate'] .
		  "', name = '" . $this->db->escape($data['customer_name']) .
		  "', email = '" . $this->db->escape($data['email']) .
		  "', country_id = " . (int)$this->db->escape($data['country']).
		  ", image = '" . $this->db->escape($data['customer_image']).
		  "', `status` = '".(int)$data['status'].
		  "', date_added= now()");

		$this->cache->delete('testimonials');
	}

	public function editInformation($data) {


		$this->db->query("UPDATE " . DB_PREFIX . "testimonials SET name = '" . $this->db->escape($data['customer_name']) ."', email = '" . $this->db->escape($data['email']) .  "', country_id = " . (int)$this->db->escape($data['country']).", image = '" . $this->db->escape($data['customer_image'])."',`testimonial_body` = '".$this->db->escape($data['testimonial_body'])."', `company_rate` = '".(int)$data['company_rate']."', `status` = '".(int)$data['status']."' WHERE `testimonial_id` = '".(int)$data['testimonial_id']."';");

		$this->cache->delete('testimonials');
	}

	public function deleteInformation($information_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "testimonials WHERE testimonial_id = '" . (int)$information_id . "'");
		$this->cache->delete('testimonials');
	}	

	public function getInformation($information_id) {
		$query = $this->db->query("SELECT t.*  FROM " . DB_PREFIX . "testimonials AS t 
									LEFT JOIN " . DB_PREFIX . "country AS ca on ca.country_id = t.country_id
									WHERE testimonial_id = '" . (int)$information_id . "'");

		return $query->row;
	}

	public function getInformations($data = array()) {
			$sql = "SELECT t.* , ca.name FROM " . DB_PREFIX . "testimonials AS t 
					LEFT JOIN " . DB_PREFIX . "country AS ca on ca.country_id = t.country_id";

			$sort_data = array(
				'name',
				'testimonial_id'
			);		
		if ($data) {

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY testimonial_id";	
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
		}

			$query = $this->db->query($sql);

			return $query->rows;
	}

	public function getTotalInformations() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "testimonials ");

		return $query->row['total'];
	}	


}
?>