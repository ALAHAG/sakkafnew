<?php
class ControllerContentPage extends Controller {
	private $error = array();
	private $data = array();

	public function index() {
		$this->load->model('content/page');
		$this->getList();
	}

	public function edit()
	{
		$this->load->model('content/page');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_content_page->editData($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('content/page&category_id='.$this->request->post['category_id'], 'token=' . $this->session->data['token'] , 'SSL'));
		}

		$this->getForm();
	}

	public function add()
	{
		$this->load->model('content/page');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_content_page->addData($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('content/page&category_id='.$this->request->post['category_id'], 'token=' . $this->session->data['token'] , 'SSL'));
		}

		$this->getForm();
	}

	public function delete()
	{
		$this->load->model('content/page');
		if (($this->request->get['page_id']) && $this->validateDelete()) {

			$this->model_content_page->deleteData($this->request->get['page_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('content/page&category_id='.$this->request->get['category_id'], 'token=' . $this->session->data['token'] , 'SSL'));

		}

		$this->getList();

	}

	public function getList()
	{
		if (isset($this->request->get['category_id'])) {
			$this->load->model('content/category');

			$category_info = $this->model_content_category->getData($this->request->get['category_id']);
		}

		if (!isset($category_info) || !$category_info) {
			$this->response->redirect($this->url->link('error/not_found', 'token=' . $this->session->data['token'] , 'SSL'));
			exit();
		}

		$data = $this->data;

		$data += $this->load->language('content/page');

		$this->document->setTitle(strtoupper($category_info['category_name']));

		$data['category_name'] = $category_info['category_name'];


		$data['token'] = $this->session->data['token'];


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $category_info['category_name'],
			'href' => $this->url->link('content/page&category_id='.$category_info['category_id'], 'token=' . $this->session->data['token'] , 'SSL')
		);

		if(isset($this->session->data['success'])){
			unset($this->session->data['success']);
		}else{
			$data['text_success'] = '';
		}

		if (!isset($this->error['warning'])) {
			$data['error_warning'] = '';
		}


		$data['insert'] = $this->url->link('content/page/add&category_id='.$category_info['category_id'], 'token=' . $this->session->data['token'], 'SSL');

		$filters = array( 'category_id' =>  $category_info['category_id']);
		$pages = $this->model_content_page->getAllData($filters);

		$total_pages = $this->model_content_page->getTotalData($filters);

		foreach ($pages as $key => $page) {
			$pages[$key]['delete'] = $this->url->link('content/page/delete&page_id='.$page['page_id'].'&category_id='.$page['category_id'], 'token=' . $this->session->data['token'], 'SSL');
			$pages[$key]['edit'] = $this->url->link('content/page/edit&page_id='.$page['page_id'], 'token=' . $this->session->data['token'], 'SSL');
		}

		$data['pages'] = $pages;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}


		$pagination = new Pagination();
		$pagination->total = $total_pages;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('content/page', 'token=' . $this->session->data['token']  . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_pages) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_pages - $this->config->get('config_limit_admin'))) ? $total_pages : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_pages, ceil($total_pages / $this->config->get('config_limit_admin')));


		$this->response->setOutput($this->load->view('content/page_list.tpl', $data));
		
	}

	public function getForm()
	{
		if (isset($this->request->get['page_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$page_info = $this->model_content_page->getData($this->request->get['page_id']);
		}

		if (isset($this->request->get['category_id']) || $page_info['category_id']) {
			$this->load->model('content/category');

			$category_id = isset($this->request->get['category_id']) ? $this->request->get['category_id']: $page_info['category_id'];
			$category_info = $this->model_content_category->getData($category_id);
		}

		if (!isset($category_info) || !$category_info) {
			$this->response->redirect($this->url->link('error/not_found', 'token=' . $this->session->data['token'] , 'SSL'));
			exit();
		}

		$this->document->addScript('view/javascript/plupload/plupload.full.min.js');

		$data = $this->data;

		$data += $this->load->language('content/page');

		$this->load->model('content/page');

		$data['city_related'] = $category_info['city_related'];

		$this->document->setTitle($this->language->get('heading_title'));


		$data['token'] = $this->session->data['token'];


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $category_info['category_name'],
			'href' => $this->url->link('content/page&category_id='.$category_info['category_id'], 'token=' . $this->session->data['token'] , 'SSL')
		);

		$data['uploader'] = $this->url->link('tool/upload/plupload&token=' . $this->session->data['token'],'', 'SSL');


		$this->session->data['success'] = $this->language->get('text_success');

		if (!isset($this->error['warning'])) {
			$data['error_warning'] = '';
		}

		if (!isset($this->error['title'])) {
			$data['error_title'] = '';
		} 

		if (!isset($this->error['keyword'])) {
			$data['error_keyword'] = '';
		} 

		if (!isset($this->request->get['page_id'])) {
			$data['action'] = $this->url->link('content/page/add', 'token=' . $this->session->data['token'] , 'SSL');
		} else {
			$data['action'] = $this->url->link('content/page/edit', 'token=' . $this->session->data['token'] . '&page_id=' . $this->request->get['page_id'] , 'SSL');
		}

		$data['cancel'] = $this->url->link('content/page', 'token=' . $this->session->data['token'] , 'SSL');



		$this->load->model('localisation/language');


		$data['languages'] = $this->model_localisation_language->getLanguages();

		if($category_info['city_related']){

			$this->load->model('localisation/zone');

			$data['zones'] = $this->model_localisation_zone->getZonesByCountryId(129); // 129 => Malaysia

			if (isset($this->request->post['city_id'])) {
				$data['city_id'] = $this->request->post['city_id'];
			} elseif (isset($page_info)) {
				$data['city_id'] = $page_info['city_id'];
			} else {
				$data['city_id'] = 0;
			}

			if (isset($this->request->post['zone_id'])) {
				$data['zone_id'] = $this->request->post['zone_id'];
				$data['cities'] = $this->model_localisation_zone->getCitiesByZoneId($this->request->post['zone_id']); // 129 => Malaysia
			} elseif (isset($page_info)) {
				$city = $this->model_localisation_zone->getCity($page_info['city_id']);
				if($city){
					$data['zone_id'] =  $city['zone_id'];
					$data['cities'] =  $this->model_localisation_zone->getCitiesByZoneId($city['zone_id']); // 129 => Malaysia

				}else{
					$data['zone_id'] = '';
					$data['cities'] = array();					
				}
			} else {
				$data['zone_id'] = '';
				$data['cities'] = array();
			}



		}



		if (isset($this->request->post['category_id'])) {
			$data['category_id'] = $this->request->post['category_id'];
		} elseif (isset($page_info)) {
			$data['category_id'] = $page_info['category_id'];
		} else {
			$data['category_id'] = $category_id;
		}


		if (isset($this->request->post['slug'])) {
			$data['slug'] = $this->request->post['slug'];
		} elseif (isset($page_info)) {
			$data['slug'] = $page_info['slug'];
		} else {
			$data['slug'] = '';
		}

		if (isset($this->request->post['page_id'])) {
			$data['page_id'] = $this->request->post['page_id'];
		} elseif (isset($page_info)) {
			$data['page_id'] = $page_info['page_id'];
		} else {
			$data['page_id'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($page_info)) {
			$data['status'] = $page_info['status'];
		} else {
			$data['status'] = '';
		}


		if (isset($this->request->post['page_content'])) {
			$data['page_content'] = $this->request->post['page_content'];
		} elseif (isset($this->request->get['page_id'])) {
			$data['page_content'] = $this->model_content_page->getDataContent($this->request->get['page_id']);
		} else {
			$data['page_content'] = array();
		}

		if (isset($this->request->post['page_images'])) {
			$data['page_images'] = $this->request->post['page_images'];
		} elseif (isset($this->request->get['page_id'])) {
			$data['page_images'] = $this->model_content_page->getDataImages($this->request->get['page_id']);
		} else {
			$data['page_images'] = array();
		}
		$this->load->model('tool/image');

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 70, 40);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');


		$this->response->setOutput($this->load->view('content/page_form.tpl', $data));
	
	}
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'content/page')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['page_content'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 255)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}
		}

		if ((utf8_strlen($this->request->post['keyword']) < 1) || (utf8_strlen($this->request->post['keyword']) > 64)) {
			$this->error['keyword'] = $this->language->get('error_keyword');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'content/page')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}

?>