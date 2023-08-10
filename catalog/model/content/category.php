<?php
class ModelContentCategory extends Model {

	private $table = 'category';

	// Get

	public function getData($id) {
		$query = $this->db->query("SELECT DISTINCT *,
		 (SELECT slug FROM " . DB_PREFIX . "seo_route WHERE content_source = '".$this->table."' AND content_id='" . (int)$id . "') AS slug
		 FROM " . DB_PREFIX . $this->table." t LEFT JOIN " . DB_PREFIX . $this->table."_content tc ON (t.".$this->table."_id = tc.".$this->table."_id)
		 WHERE t.".$this->table."_id = '" . (int)$id . "'");
		return $query->row;
	}

	public function getAllData($data = array()) {
		$category_type = isset($data['category_type']) ? $data['category_type'] : 1; //$category_type =1 Package Category ; $category_type =2 Page Category
		$sql = "SELECT * FROM " . DB_PREFIX . $this->table." t
		LEFT JOIN " . DB_PREFIX . $this->table."_content tc ON (t.".$this->table."_id = tc.".$this->table."_id)
		WHERE tc.language_id = '" . (int)$this->config->get('config_language_id') . "' AND t.category_type = ".(int)$category_type." AND t.status = 1 ";

		if(isset($data['show_in_index']) && $category_type !=2) {
			$sql .= " AND t.show_in_index = 1 ";
		}
		if($category_type==1){
			$sql .= " order by orders ";
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

}
