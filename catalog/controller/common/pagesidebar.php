<?php
class ControllerCommonPagesidebar extends Controller {


	public function index($pages = NULL) {

		$data = $pages;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/right_sidebar.tpl')) {
			return($this->load->view($this->config->get('config_template') . '/template/common/right_sidebar.tpl', $data));
		} else {
			return($this->load->view('default/template/common/right_sidebar.tpl', $data));
		}

	}
}
?>