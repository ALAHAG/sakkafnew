<?php
class ControllerCommonSlider extends Controller {
	public function index() {

		$this->load->model('content/slider');

		$data['slides'] = $this->model_content_slider->getAllData();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/slider.tpl')) {
			return ($this->load->view($this->config->get('config_template') . '/template/common/slider.tpl', $data));
		} else {
			return ($this->load->view('default/template/common/slider.tpl', $data));
		}
	}
}