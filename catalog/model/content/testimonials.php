<?php
class ModelContentTestimonials extends Model {
	public function addData($data) {

		$q = $this->db->query("INSERT INTO " .DB_PREFIX ."testimonials SET
		  testimonial_body = '" . $this->db->escape($data['testimonial_body']) ."',
		  testimonial_type = '1',
		  company_rate =  '" . $this->db->escape($data['company_rate']) ."',
		  name = '" . $this->db->escape($data['name']) ."',
		  company_rate = '" .(int) $data['company_rate'] ."',
		  country = '" . $this->db->escape($data['country'])."',
		  image = '" . $this->db->escape($data['customer_image'])."',
		  date_added= now()");
		  // phone = '" . $this->db->escape($data['phone']) ."',

		// $this->cache->delete('testimonials');

		return $q;
	}
	public function addInformation($data) {

		// dd($data);
		$query="INSERT INTO " .DB_PREFIX .
		  "testimonials SET testimonial_body = '" . $this->db->escape($data['testimonial_body']) .
		  "', company_rate = '" .(int) $data['company_rate'] .
  		  "',testimonial_type = '1',
		   name = '" . $this->db->escape($data['name']) .
		  "', email = '" . $this->db->escape($data['email']) .
		  "', country = '" . $this->db->escape($data['country']).
		  "', image = '" . $this->db->escape($data['customer_image']).
		  "', `status` = 0, date_added = NOW()";
		  $this->db->query($query);
		$this->cache->delete('testimonials');
	}


	public function getData($information_id) {
		$query = $this->db->query("SELECT t.*  FROM " . DB_PREFIX . "testimonials AS t
									WHERE t.testimonial_id = '" . (int)$information_id . "'");

		return $query->row;
	}
	public function getAllVideoData() {
		$query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "testimonials WHERE testimonial_type = '2' AND status = '1' ORDER BY testimonial_id DESC");

		return $query->rows;
	}

	public function getAllTextData() {
		$query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "testimonials WHERE testimonial_type = '1' AND status = '1' ORDER BY testimonial_id DESC");

		return $query->rows;
	}

	public function getTotalData() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "testimonials ");

		return $query->row['total'];
	}
	public function getInformations($data = array()) {
		// $sql = "SELECT *  FROM " . DB_PREFIX . "testimonials WHERE testimonial_type = '1' AND status = '1'";
		$sql = "SELECT *  FROM " . DB_PREFIX . "testimonials WHERE status = '1'";

			$sort_data = array(
				'name',
				'date_added'
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
				$sql .= " DESC";
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


}
?>
