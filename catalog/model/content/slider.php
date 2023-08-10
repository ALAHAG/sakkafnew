<?php
class ModelContentSlider extends Model {

	private $table = 'slider';


	// Get 

	public function getAllData() {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . $this->table." WHERE status = 1 ");

		return $query->rows;
	}

}
?>