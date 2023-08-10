<?php
class ControllerContentCategory extends Controller {
	private $error = array();
	private $data = array();

	public function index() {
		$this->load->model('content/category');
		$this->getList();
	}

	public function edit()
	{
		$this->load->model('content/category');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_content_category->editData($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('content/category&category_type='.$this->request->post['category_type'], 'token=' . $this->session->data['token'] , 'SSL'));
		}

		$this->getForm();
	}

	public function add()
	{
		$this->load->model('content/category');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_content_category->addData($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('content/category&category_type='.$this->request->post['category_type'], 'token=' . $this->session->data['token'] , 'SSL'));
		}

		$this->getForm();
	}

	public function delete()
	{
		$this->load->model('content/category');
		if (($this->request->get['category_id']) && $this->validateDelete()) {

			$this->model_content_category->deleteData($this->request->get['category_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('content/category&category_type='.$this->request->get['category_type'], 'token=' . $this->session->data['token'] , 'SSL'));

		}

		$this->getList();

	}

	public function getList()
	{
		$data = $this->data;

		$data += $this->load->language('content/category');

		$this->document->setTitle($this->language->get('heading_title'));


		$data['token'] = $this->session->data['token'];


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/category', 'token=' . $this->session->data['token'] , 'SSL')
		);

		if(isset($this->session->data['success'])){
			unset($this->session->data['success']);
		}else{
			$data['text_success'] = '';
		}

		if (!isset($this->error['warning'])) {
			$data['error_warning'] = '';
		}



		if (isset($this->request->get['category_type'])) {
			$category_type = $this->request->get['category_type'];
		} else {
			$category_type = 1;
		}

		$data['insert'] = $this->url->link('content/category/add&category_type='.$category_type, 'token=' . $this->session->data['token'], 'SSL');

		$categories = $this->model_content_category->getAllData($category_type);

		$total_catrgories = $this->model_content_category->getTotalData($category_type);

		foreach ($categories as $key => $category) {
			$categories[$key]['delete'] = $this->url->link('content/category/delete&category_id='.$category['category_id'].'&category_type='.$category['category_type'], 'token=' . $this->session->data['token'], 'SSL');
			$categories[$key]['edit'] = $this->url->link('content/category/edit&category_id='.$category['category_id'], 'token=' . $this->session->data['token'], 'SSL');
		}

		$data['categories'] = $categories;


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$pagination = new Pagination();
		$pagination->total = $total_catrgories;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('content/category', 'token=' . $this->session->data['token']  . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_catrgories) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_catrgories - $this->config->get('config_limit_admin'))) ? $total_catrgories : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_catrgories, ceil($total_catrgories / $this->config->get('config_limit_admin')));


		$this->response->setOutput($this->load->view('content/category_list.tpl', $data));
		
	}

	public function getForm()
	{
		$data = $this->data;

		$data += $this->load->language('content/category');

		$this->load->model('content/category');


		$this->document->setTitle($this->language->get('heading_title'));


		$data['token'] = $this->session->data['token'];


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/category', 'token=' . $this->session->data['token'] , 'SSL')
		);


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

		if (!isset($this->request->get['category_id'])) {
			$data['action'] = $this->url->link('content/category/add', 'token=' . $this->session->data['token'] , 'SSL');
		} else {
			$data['action'] = $this->url->link('content/category/edit', 'token=' . $this->session->data['token'] . '&category_id=' . $this->request->get['category_id'] , 'SSL');
		}

		$data['cancel'] = $this->url->link('content/category', 'token=' . $this->session->data['token'] , 'SSL');

		if (isset($this->request->get['category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$category_info = $this->model_content_category->getData($this->request->get['category_id']);
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['slug'])) {
			$data['slug'] = $this->request->post['slug'];
		} elseif (isset($category_info)) {
			$data['slug'] = $category_info['slug'];
		} else {
			$data['slug'] = '';
		}

		if (isset($this->request->post['category_id'])) {
			$data['category_id'] = $this->request->post['category_id'];
		} elseif (isset($category_info)) {
			$data['category_id'] = $category_info['category_id'];
		} else {
			$data['category_id'] = '';
		}

		if (isset($this->request->post['category_type'])) {
			$data['category_type'] = $this->request->post['category_type'];
		} elseif(isset($this->request->get['category_type'])) {
			$data['category_type'] = $this->request->get['category_type'];
		} elseif (isset($category_info)) {
			$data['category_type'] = $category_info['category_type'];
		} else {
			$data['category_type'] = 1;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($category_info)) {
			$data['status'] = $category_info['status'];
		} else {
			$data['status'] = '';
		}

		if (isset($this->request->post['category_name'])) {
			$data['category_name'] = $this->request->post['category_name'];
		} elseif (isset($category_info)) {
			$data['category_name'] = $category_info['category_name'];
		} else {
			$data['category_name'] = '';
		}



		if (isset($this->request->post['city_related'])) {
			$data['city_related'] = $this->request->post['city_related'];
		} elseif (isset($category_info)) {
			$data['city_related'] = $category_info['city_related'];
		} else {
			$data['city_related'] = '';
		}

		if (isset($this->request->post['show_in_index'])) {
			$data['show_in_index'] = $this->request->post['show_in_index'];
		} elseif (isset($category_info)) {
			$data['show_in_index'] = $category_info['show_in_index'];
		} else {
			$data['show_in_index'] = '';
		}


		if (isset($this->request->post['category_content'])) {
			$data['category_content'] = $this->request->post['category_content'];
		} elseif (isset($this->request->get['category_id'])) {
			$data['category_content'] = $this->model_content_category->getDataContent($this->request->get['category_id']);
		} else {
			$data['category_content'] = array();
		}

		if (isset($this->request->post['Meta_descripions'])) {
			$data['Meta_descripions'] = $this->request->post['Meta_descripions'];
		} elseif (isset($category_info)) {
			$data['Meta_descripions'] = $data['category_content']['Meta_descripions'];
		} else {
			$data['Meta_descripions'] = '';
		}
		if (isset($this->request->post['Meta_title'])) {
			$data['Meta_title'] = $this->request->post['Meta_title'];
		} elseif (isset($category_info)) {
			$data['Meta_title'] = $data['category_content']['Meta_title'];
		} else {
			$data['Meta_title'] = '';
		}



		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');


		$this->response->setOutput($this->load->view('content/category_form.tpl', $data));
	
	}
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'content/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['category_content'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 255)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}
		}

		if ($this->request->post['category_type'] == 2 &&  (utf8_strlen($this->request->post['keyword']) < 1) || (utf8_strlen($this->request->post['keyword']) > 64) ) {
			$this->error['keyword'] = $this->language->get('error_keyword');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'content/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}

?>