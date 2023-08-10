<?php
class ModelContentGallery extends Model {
	public function addInformation($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_category SET gallery_category_status = '" . (int)$data['status'] . "'");


		$information_id = $this->db->getLastId(); ; 


		foreach ($data['information_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_category_description SET gallery_category_id = '" . (int)$information_id . "', language_id = '" . (int)$language_id . "', gallery_category_title = '" . $this->db->escape($value['gallery_category_title']) . "', gallery_category_description = '" . $this->db->escape($value['gallery_category_description']) . "' ");
		}

		if(isset($data['information_images'])){
			foreach ($data['information_images'] as $key => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "gallery SET gallery_category = '" . (int)$information_id . "', gallery_type = 1, gallery_url = '" . $this->db->escape($value['image_file']) . "' ");
			}
		}
			if(isset($data['information_videoes'])){
			foreach ($data['information_videoes'] as $key => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "gallery SET gallery_category = '" . (int)$information_id . "', gallery_type = 2, gallery_url = '" . $this->db->escape($value['video_file']) . "' ");
			}
		}




	}

	public function editInformation($gallery_category_id, $data) {
		
		$this->db->query("UPDATE " . DB_PREFIX . "gallery_category SET gallery_category_status = '" . (int)$data['status'] . "' WHERE gallery_category_id = '" . (int)$gallery_category_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_category_description WHERE gallery_category_id = '" . (int)$gallery_category_id . "'");

		foreach ($data['information_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_category_description SET gallery_category_id = '" . (int)$gallery_category_id . "', language_id = '" . (int)$language_id . "', gallery_category_title = '" . $this->db->escape($value['gallery_category_title']) . "', gallery_category_description = '" . $this->db->escape($value['gallery_category_description']) . "' ");
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery WHERE gallery_category = '" . (int)$gallery_category_id . "'");
		if(isset($data['information_images'])){
			foreach ($data['information_images'] as $key => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "gallery SET gallery_category = '" . (int)$gallery_category_id . "', gallery_type = 1, gallery_url = '" . $this->db->escape($value['image_file']) . "' ");
			}
		}
			if(isset($data['information_videoes'])){
			foreach ($data['information_videoes'] as $key => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "gallery SET gallery_category = '" . (int)$gallery_category_id . "', gallery_type = 2, gallery_url = '" . $this->db->escape($value['video_file']) . "' ");
			}
		}


		

	}

	public function deleteInformation($information_id) {
		// print_r($information_id);exit();
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_category WHERE gallery_category_id = '" . (int)$information_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_category_description WHERE gallery_category_id = '" . (int)$information_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery WHERE gallery_category = '" . (int)$information_id ."'");

		// $this->db->query("DELETE FROM " . DB_PREFIX . "article_image WHERE article_id = '" . (int)$information_id . "'");
		// $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'article_id=" . (int)$information_id . "'");

		// $this->cache->delete('city');
	}	

	public function getInformation($information_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "gallery_category WHERE gallery_category_id = '" . (int)$information_id . "'");

		return $query->row;
	}

	public function getInformations($data = array()) {
		if ($data) {
			$sql = "SELECT a.gallery_category_id, a.gallery_category_status, ad.gallery_category_title, a.gallery_category_status FROM " . DB_PREFIX . "gallery_category a LEFT JOIN " . DB_PREFIX . "gallery_category_description ad ON (a.gallery_category_id = ad.gallery_category_id) WHERE ad.language_id = '" . (int)$this->config->get('config_language_id') . "'";
			$sort_data = array(
				'ad.gallery_category_title',
				'a.gallery_category_id'
			);		

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY a.gallery_category_id";	
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
		} else {
			$information_data = $this->cache->get('gallery_category.' . (int)$this->config->get('config_language_id'));

			if (!$information_data) {
				$query = $this->db->query("SELECT a.gallery_category_id, a.gallery_category_status, ad.gallery_category_title,  FROM " . DB_PREFIX . "gallery_category a LEFT JOIN " . DB_PREFIX . "gallery_category_description ad ON (a.gallery_category_id = ad.gallery_category_id) WHERE ad.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY a.article_id");

				$information_data = $query->rows;

				$this->cache->set('gallery_category.' . (int)$this->config->get('config_language_id'), $information_data);
			}	

			return $information_data;			
		}
	}

	public function getInformationDescriptions($information_id) {
		$information_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_category_description WHERE gallery_category_id = '" . (int)$information_id . "'");

		foreach ($query->rows as $result) {
			$information_description_data[$result['language_id']] = array(
				'gallery_category_title'       => $result['gallery_category_title'],
				'gallery_category_description' => $result['gallery_category_description']
			);
		}

		return $information_description_data;
	}
// 	public function galleryDetails($gallery_category) {

// 		$information_description_data = array();


// 		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery WHERE gallery_category = '" . (int)$gallery_category . "'");

		
// 		foreach ($query->rows as $result) {
// 			$information_description_data[$result['language_id']] = array(
// 				'gallery_category'       => $result['gallery_category']
// 			);
// 		}

// 		return $information_description_data;
// 	}

// public function galleryDescription($gallery_id) {

// 		$information_description_data = array();

// 		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_description WHERE gallery_id = '" . (int)$gallery_id . "'");

// 		foreach ($query->rows as $result) {
// 			$information_description_data[$result['language_id']] = array(
// 				'gallery_description'       => $result['gallery_description']
// 			);
// 		}

// 		return $information_description_data;
// 	}



	public function getInformationImage($information_id) {
		$information_image_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery WHERE gallery_type=1 AND gallery_category = '" . (int)$information_id . "'");

		return $query->rows;
	}
	public function getInformationVideo($information_id) {
		$information_image_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery WHERE gallery_type=2 AND gallery_category = '" . (int)$information_id . "'");

		return $query->rows;
	}

	public function getTotalGalleries() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "gallery_category WHERE gallery_category_status = 1");

		return $query->row['total'];
	}	


}
?>