<?php
class ControllerCommonMenu extends Controller {
	public function index() {

		$this->load->model('content/menu');
		$this->load->model('content/page');
		
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$results = $this->model_content_menu->getAllData();
		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}
		$data['home'] = $server;
		$data['name'] = $this->config->get('config_name');


		foreach ($results as $key => $result) {
			$menu[$result['menu_id']] = $result;
		}
		// dd($menu);

		foreach ($menu as $key => $value) {
			if ($value['menu_parent'] != 0 ){
				$menu[$value['menu_parent']]['children'][$value['menu_id']] = $value;
				unset($menu[$key]);
			}
		}

		$data['menu'] = $menu;

		$filters['start'] = 1;//($filters['page'] - 1) * 12;

		$filters['limit'] = 24;
		$pages = $this->model_content_page->getAllData($filters);
		// dd($pages);

		$total_pages = $this->model_content_page->getTotalData($filters);

		$this->load->model('tool/image');
		foreach ($pages as $key => $page) {
			$pages[$key]['thumb'] = $this->model_tool_image->resize($page['image'], 300, 250, 'h');

		}

		$data['pages'] = $pages;
		// dd($data['pages'] );

		// $data = array();

		// $this->load->model("localisation/zone");

		// $data['cities'] = $this->model_localisation_zone->getCities();

		// if (isset($this->request->get['city'])) {
		// 	$data['get_city'] = $this->request->get['city'];
		// }

		//  // dd($data['cities']);
		// $data['action'] = HTTP_SERVER.'pages';


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/menu.tpl')) {
			return ($this->load->view($this->config->get('config_template') . '/template/common/menu.tpl', $data));
		} else {
			return ($this->load->view('default/template/common/menu.tpl', $data));
		}
	}
}