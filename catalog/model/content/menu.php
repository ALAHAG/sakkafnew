<?php
class ModelContentMenu extends Model {
	
	private $table = 'menu';

	public function getData($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->table." t
		LEFT JOIN " . DB_PREFIX . $this->table."_content tc ON (t.".$this->table."_id = tc.".$this->table."_id) 
		WHERE tc.language_id = '" . (int)$this->config->get('config_language_id') . "' AND  t.".$this->table."_id = '" . (int)$id . "'");

		return $query->row;
	}


	public function getAllData() {

		$sql = "SELECT t.menu_id, t.menu_parent , tc.title , sr.slug FROM " . DB_PREFIX . $this->table." t 
		LEFT JOIN " . DB_PREFIX . $this->table."_content tc ON (t.".$this->table."_id = tc.".$this->table."_id) 
		LEFT JOIN " . DB_PREFIX ."seo_route sr ON  (sr.content_source = '".$this->table."' AND sr.content_id = tc.".$this->table."_id ) 
		WHERE tc.language_id = '" . (int)$this->config->get('config_language_id') . "' AND  t.status = 1 ORDER BY t.order";

		$query = $this->db->query($sql);

		return $query->rows;
	}
}
?>