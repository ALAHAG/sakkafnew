<?php
class ModelContentPage extends Model {

	private $table = 'page';

	// Get 

	public function getData($id) {
		$query = $this->db->query("SELECT DISTINCT *,
		 (SELECT slug FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id='" . (int)$id . "') AS slug
		 FROM " . DB_PREFIX . $this->table." WHERE ".$this->table."_id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getAllData($data = array()) {

		$sql = "SELECT * FROM " . DB_PREFIX . $this->table." t 
					LEFT JOIN " . DB_PREFIX . $this->table."_content tc ON (t.".$this->table."_id = tc.".$this->table."_id) 
					LEFT JOIN " . DB_PREFIX . $this->table."_images ti ON (t.".$this->table."_id = ti.".$this->table."_id )
					LEFT JOIN " . DB_PREFIX ."seo_route sr ON (sr.content_source = '".$this->table."' AND sr.content_id = t.".$this->table."_id) 
					WHERE tc.language_id = '" . (int)$this->config->get('config_language_id') . "' ";

 
		if (isset($data['category_id'])){
			$sql .= "  AND  t.category_id = ".(int)$data['category_id']."";
		}

		if(isset($data['city']) && $data['city']){
			foreach ($data['city'] as $key => $value) {
				$data['city'][$key] = (int) $value;
			}

			$sql .= " AND ( t.city_id = ".implode(' || t.city_id = ', $data['city'])." ) ";
		}

		if (isset($data['random']) && $data['random']) {
			$sql .= " ORDER BY RAND()  ";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if (!isset($data['start']) || $data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}
		}

		$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getDataContent($id) {
		$content_data = array();

		$query = $this->db->query("SELECT *, (SELECT slug FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id='" . (int)$id . "') AS keyword FROM " . DB_PREFIX . $this->table."_content WHERE ".$this->table."_id = '" . (int)$id . "' AND language_id =  '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getDataImages($id)
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->table."_images WHERE ".$this->table."_id = '" . (int)$id . "'");

		return $query->rows;
	}


	public function getTotalData($data = array()) {

		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . $this->table." t ";
		// $sql = "SELECT * FROM " . DB_PREFIX . $this->table." t WHERE 1= 1  ";


		$where = array();

 
		if (isset($data['category_id'])){
			$where[] = "  t.category_id = ".(int)$data['category_id']."";
		}

		if(isset($data['city']) && $data['city']){
			foreach ($data['city'] as $key => $value) {
				$data['city'][$key] = (int) $value;
			}

			$where[] = "  ( t.city_id = ".implode(' || t.city_id = ', $data['city'])." ) ";
		}

		if (sizeof($where)) {
			$sql .= " WHERE ".implode(' AND ', $where) . " ";
		}


		// if (isset($data['start']) || isset($data['limit'])) {
		// 	if (!isset($data['start']) || $data['start'] < 0) {
		// 		$data['start'] = 0;
		// 	}

		// 	if ($data['limit'] < 1) {
		// 		$data['limit'] = 20;
		// 	}
		// }

		// $sql .= " LIMIT " .(int)$data['limit'] . " OFFSET " .(int)$data['start']  ;

		$query = $this->db->query($sql);

		return $query->row['total'];
		// return $query->rows;
	}


// CRUD 
	public function addData($data) {
		$this->event->trigger('pre.admin.add.'.$this->table, $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . $this->table." SET
  		  city_id = '" . (int)$data['city_id'] . "',
  		  category_id = '" . (int)$data['category_id'] . "',
  		  status = '" . (int)$data['status'] . "'
  		  ");

		$id = $this->db->getLastId();

 
		foreach ($data[$this->table.'_content'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_content SET
				".$this->table."_id = '" . (int)$id . "',
				language_id = '" . (int)$language_id . "',
				title = '" . $this->db->escape($value['title']) . "',
				meta_description = '" . $this->db->escape($value['meta_description']) . "',
				content = '" . $this->db->escape($value['content']) . "'
				 ");
		}

		foreach ($data[$this->table.'_images'] as $image) {
			if(!isset($image['cover'])) $image['cover'] = 0 ;

			$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_images SET
				".$this->table."_id = '" . (int)$id . "',
				cover = '" . (int)$image['cover'] . "',
				image = '" . $this->db->escape($image['image']) . "'
				 ");
		}


		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "seo_route SET content_source = '".$this->table."', content_id = '" . (int)$id . "', slug = '" . $this->db->escape($data['keyword']) . "'");
		}


		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.add.'.$this->table, $id);

		return $id;
	}


	public function editData($data) {
		// dd($data);
		$id = $data[$this->table."_id"];
		$this->event->trigger('pre.admin.edit.'.$this->table, $data);

		$this->db->query("UPDATE " . DB_PREFIX . $this->table." SET  
  		  city_id = '" . (int)$data['city_id'] . "',
  		  category_id = '" . (int)$data['category_id'] . "',
  		  status = '" . (int)$data['status'] . "'

		 WHERE ".$this->table."_id = '" . (int)$id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table."_content WHERE ".$this->table."_id = '" . (int)$id . "'");

		foreach ($data[$this->table.'_content'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_content SET
				".$this->table."_id = '" . (int)$id . "',
				language_id = '" . (int)$language_id . "',
				title = '" . $this->db->escape($value['title']) . "',
				meta_description = '" . $this->db->escape($value['meta_description']) . "',
				content = '" . $this->db->escape($value['content']) . "'
				 ");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table."_images WHERE ".$this->table."_id = '" . (int)$id . "'");

		foreach ($data[$this->table.'_images'] as $image) {
			if(!isset($image['cover'])) $image['cover'] = 0 ;

			$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_images SET
				".$this->table."_id = '" . (int)$id . "',
				cover = '" . (int)$image['cover'] . "',
				image = '" . $this->db->escape($image['image']) . "'
				 ");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id = '" . (int)$id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "seo_route SET content_source = '".$this->table."', content_id = '" . (int)$id . "', slug = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.edit.'.$this->table, $id);
	}

	public function deleteData($id) {
		$this->event->trigger('pre.admin.delete.'.$this->table, $id);

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table." WHERE ".$this->table."_id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table."_content WHERE ".$this->table."_id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."', content_id = '" . (int)$id . "'");

		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.delete.'.$this->table, $id);
	}

}