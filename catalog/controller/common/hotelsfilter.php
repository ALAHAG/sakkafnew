<?php
class ControllerCommonHotelsfilter extends Controller {


	public function index() {

		$data = array();

		$this->load->model("localisation/zone");

		$data['cities'] = $this->model_localisation_zone->getCities();

		if(isset($this->request->get['rate'])){
			$data['get_rate'] = $this->request->get['rate'];
		}

		if(isset($this->request->get['city'])){
			$data['get_city'] = $this->request->get['city'];
		}

		// dd($data['cities']);

		$data['action'] = HTTPS_SERVER.'hotels';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/hotels_filter.tpl')) {
			return($this->load->view($this->config->get('config_template') . '/template/common/hotels_filter.tpl', $data));
		} else {
			return($this->load->view('default/template/common/hotels_filter.tpl', $data));
		}

	}
}
?>