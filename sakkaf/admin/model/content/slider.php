<?php
class ModelContentSlider extends Model {

	private $table = 'slider';
	private $info = array( 'image' => 'text' ,
						   'url' => 'text' ,
						   'language_id' => 'int' ,
						   'status' => 'int');

	// Get 

	public function getAllData() {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . $this->table." ");

		return $query->rows;
	}


// CRUD 

	public function editData($data) {
		$this->event->trigger('pre.admin.edit.'.$this->table, $data);

		$this->db->query("DELETE FROM " . DB_PREFIX . $this->table." ");

		foreach ($data[$this->table] as $value) {
		$this->db->query("INSERT INTO " . DB_PREFIX . $this->table." SET 
				   image = '".$this->db->escape($value['image'])."' ,
				   url = '".$this->db->escape($value['url'])."' ,
				   language_id = '".(int)$value['language_id']."' ,
				   status = '".(int)$value['status']."' 
				    ");
		}
		// foreach ($data[$this->table] as $key => $value) {
		// 	$query .= $key ." = ";
		// 	switch ($this->info[$key]) {
		// 		case 'text':
		// 			$query .= $this->db->escape($data[$key]);
		// 			break;
		// 		case 'int':
		// 			$query .= (int)$data[$key];
		// 			break;
		// 		case 'float':
		// 			$query .= (float)$data[$key];
		// 			break;
		// 		default:
		// 			$query .= $this->db->escape($data[$key]);
		// 			break;
		// 	}
		// 	$query .= ', ';
		// }

		// $result = $this->db->query($query);

		$this->cache->delete($this->table);

		// $this->event->trigger('post.admin.edit.'.$this->table, 1);

		return true;
	}

}