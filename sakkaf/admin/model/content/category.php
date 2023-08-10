<?php
class ModelContentCategory extends Model {

	private $table = 'category';

	// Get 

	public function getData($id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT slug FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id='" . (int)$id . "') AS slug FROM " . DB_PREFIX . $this->table." WHERE ".$this->table."_id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getAllData($type = 1) {

		$sql = "SELECT * FROM " . DB_PREFIX . $this->table." t 
		LEFT JOIN " . DB_PREFIX . $this->table."_content tc ON (t.".$this->table."_id = tc.".$this->table."_id) 
		WHERE tc.language_id = '" . (int)$this->config->get('config_language_id') . "' AND t.category_type = ".(int)$type." ";
		// $sort_data = array(
		// 	'id.title',
		// 	'i.sort_order'
		// );

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

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getDataContent($id) {
		$content_data = array();

		$query = $this->db->query("SELECT *, (SELECT slug FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id='" . (int)$id . "') AS keyword FROM " . DB_PREFIX . $this->table."_content WHERE ".$this->table."_id = '" . (int)$id . "'");

		foreach ($query->rows as $result) {
			$content_data[$result['language_id']] = $result;
		}

		return $content_data;
	}


	public function getTotalData($type = 1) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . $this->table." WHERE category_type = ".(int)$type." ");

		return $query->row['total'];
	}


// CRUD 
	public function addData($data) {
		$this->event->trigger('pre.admin.add.'.$this->table, $data);

		if(!isset($data['city_related'])) $data['city_related'] = 0;
		if(!isset($data['show_in_index'])) $data['show_in_index'] = 0;

		$this->db->query("INSERT INTO " . DB_PREFIX . $this->table." SET
						category_name = '" . $this->db->escape($data['category_name']) . "',
						city_related = '" . (int)$data['city_related'] . "',
						show_in_index = '" . (int)$data['show_in_index'] . "',
						category_type = '" . (int)$data['category_type'] . "',
						status = '" . (int)$data['status'] . "'
						 ");

		$id = $this->db->getLastId();

 
		foreach ($data[$this->table.'_content'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_content SET ".$this->table."_id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', Meta_descripions = '" .  $this->db->escape($data['Meta_descripions']) . "', Meta_title = '" .  $this->db->escape($data['Meta_title']) . "', title = '" . $this->db->escape($value['title']) . "' ");
		}


		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "seo_route SET content_source = '".$this->table."', content_id = '" . (int)$id . "', slug = '" . $this->db->escape($data['keyword']) . "'");
		}


		$this->cache->delete($this->table);

		$this->event->trigger('post.admin.add.'.$this->table, $id);

		return $id;
	}


	public function editData($data) {
		$id = $data[$this->table."_id"];
		$this->event->trigger('pre.admin.edit.'.$this->table, $data);

		if(!isset($data['city_related'])) $data['city_related'] = 0;
		if(!isset($data['show_in_index'])) $data['show_in_index'] = 0;


		$this->db->query("UPDATE " . DB_PREFIX . $this->table." SET
						category_name = '" . $this->db->escape($data['category_name']) . "',
						city_related = '" . (int)$data['city_related'] . "',
						show_in_index = '" . (int)$data['show_in_index'] . "',
						category_type = '" . (int)$data['category_type'] . "',
						status = '" . (int)$data['status'] . "'
						WHERE ".$this->table."_id = '" . (int)$id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table."_content WHERE ".$this->table."_id = '" . (int)$id . "'");

		// foreach ($data[$this->table.'_content'] as $language_id => $value) {
		// 	$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_content SET ".$this->table."_id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "' ");
		// }
		foreach ($data[$this->table.'_content'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . $this->table."_content SET ".$this->table."_id = '" . (int)$id . "', language_id = '" . (int)$language_id . "', Meta_descripions = '" .  $this->db->escape($data['Meta_descripions']) . "', Meta_title = '" .  $this->db->escape($data['Meta_title']) . "', title = '" . $this->db->escape($value['title']) . "' ");
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

	/************/

	public function getAllRegions()
	{
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX ."regions ");

		return $query->rows;
	}

}