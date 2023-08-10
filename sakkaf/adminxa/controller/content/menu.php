<?php
class ControllerContentMenu extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('content/menu');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/menu');

		$this->getList();
	}

	public function add() {
		$this->load->language('content/menu');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/menu');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_content_menu->addData($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('content/menu', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('content/menu');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/menu');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_content_menu->editData($this->request->get['menu_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('content/menu', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('content/menu');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/menu');

		if (isset($this->request->get['menu_id']) && $this->validateDelete()) {

			$this->model_content_menu->deleteData($this->request->get['menu_id']);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('content/menu', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function order()
	{

		if (isset($this->request->post['data'])) {

			$data = json_decode($_POST['data'],true);

			$this->load->model('content/menu');


			foreach ($data as $key => $value) {
				// echo $value['id'] .'- Order'. $key;
				$this->model_content_menu->orderMenu($value['id'] , 0 , $key);
				if (isset($value['children'])) {
					foreach ($value['children'] as $child_key => $child) {
						// echo '-- Child' . $child['id'] . ' Parent '. $value['id'] .' Order ' . $child_key;
						$this->model_content_menu->orderMenu($child['id'] , $value['id'] , $child_key);
					}
					
				}
			}

			echo true;
		}
	}

	protected function getList() {

		// $this->document->addScript('https://code.jquery.com/ui/1.10.4/jquery-ui.min.js');
		$this->document->addScript('view/javascript/jquery/jquery.nestable.js');

		$url = '';

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/menu', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);
		
		$data['insert'] = $this->url->link('content/menu/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('content/menu/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['order'] = $this->url->link('content/menu/order&token=' . $this->session->data['token'] , '' , 'SSL');

		$data['menus'] = array();

		$results = $this->model_content_menu->getAllData();

		foreach ($results as $key => $result) {
			$result['edit'] = $this->url->link('content/menu/edit', 'token=' . $this->session->data['token'] . '&menu_id=' . $result['menu_id'] , 'SSL');
			$result['delete'] = $this->url->link('content/menu/delete', 'token=' . $this->session->data['token'] . '&menu_id=' . $result['menu_id'] , 'SSL');
			$menu[$result['menu_id']] = $result;
		}

		foreach ($menu as $key => $value) {
			if ($value['menu_parent'] != 0 ){
				$menu[$value['menu_parent']]['children'][$value['menu_id']] = $value;
				unset($menu[$key]);
			}
		}

		$data['menu'] = $menu;

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		
		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		if (!isset($this->error['warning'])) {
			$data['error_warning'] = '';
		}

		// dd($this->session->data['success']);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		// dd($data['menu']);
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/menu_list.tpl', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_form'] = !isset($this->request->get['menu_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_menu_class'] = $this->language->get('entry_menu_class');
		$data['entry_menu_parent'] = $this->language->get('entry_menu_parent');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_page_content'] = $this->language->get('entry_page_content');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['help_keyword'] = $this->language->get('help_keyword');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');


		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = array();
		}

		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/menu', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);
		
		if (!isset($this->request->get['menu_id'])) {
			$data['action'] = $this->url->link('content/menu/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('content/menu/edit', 'token=' . $this->session->data['token'] . '&menu_id=' . $this->request->get['menu_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('content/menu', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['menu_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$menu_info = $this->model_content_menu->getData($this->request->get['menu_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['menu_content'])) {
			$data['menu_content'] = $this->request->post['menu_content'];
		} elseif (isset($this->request->get['menu_id'])) {
			$data['menu_content'] = $this->model_content_menu->getDataContent($this->request->get['menu_id']);
		} else {
			$data['menu_content'] = array();
		}

		if (isset($this->request->post['main_menu'])) {
			$data['main_menu'] = $this->request->post['main_menu'];
		} elseif (isset($this->request->get['menu_id'])) {
			$data['main_menu'] = $this->model_content_menu->getAllData();
		} else {
			$data['main_menu'] = array();
		}

		if (isset($this->request->post['menu_class'])) {
			$data['menu_class'] = $this->request->post['menu_class'];
		} elseif (!empty($menu_info)) {
			$data['menu_class'] = $menu_info['menu_class'];
		} else {
			$data['menu_class'] = '';
		}

		if (isset($this->request->post['menu_parent'])) {
			$data['menu_parent'] = $this->request->post['menu_parent'];
		} elseif (!empty($menu_info)) {
			$data['menu_parent'] = $menu_info['menu_parent'];
		} else {
			$data['menu_parent'] = '';
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($menu_info)) {
			$data['keyword'] = $menu_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($menu_info)) {
			$data['status'] = $menu_info['status'];
		} else {
			$data['status'] = 1;
		}


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/menu_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'content/menu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['menu_content'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 64)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}

			if (utf8_strlen($value['content']) < 3  && $this->request->post['menu_class'] == 1) {
				$this->error['content'][$language_id] = $this->language->get('error_content');
			}
		}
			if ($this->request->post['menu_class'] != 3 && (utf8_strlen($this->request->post['keyword']) < 3) || (utf8_strlen($this->request->post['keyword']) > 64)) {
				$this->error['keyword'][$language_id] = $this->language->get('error_title');
			}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'content/menu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!isset($this->request->get['menu_id'] )) {
				$this->error['warning'] = $this->language->get('error_account');
			}

		return !$this->error;
	}
}