<?php
class ControllerContentTestimonials extends Controller { 
	private $error = array();

	public function index() {
		$this->language->load('content/testimonial');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/testimonial');

		$this->getList();
	}

	public function add() {
		$this->language->load('content/testimonial');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/testimonial');


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			// print_r($this->request->post);exit();
			$this->model_content_testimonial->addData($this->request->post);

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

			$this->response->redirect($this->url->link('content/testimonials', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->language->load('content/testimonial');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/testimonial');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			// print_r($_POST);exit();
			$this->model_content_testimonial->editData($this->request->post);

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
			$this->response->redirect($this->url->link('content/testimonials', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('content/testimonial');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/testimonial');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $information_id) {
				$this->model_content_testimonial->deleteData($information_id);
			}

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
			$this->response->redirect($this->url->link('content/testimonials', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}

		$this->getList();
	}


	protected function getList() {

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
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
			'href' => $this->url->link('content/testimonials', 'token=' . $this->session->data['token'] . $url, 'SSL')
			);
		
		$data['insert'] = $this->url->link('content/testimonials/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('content/testimonials/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
			);

		$information_total = $this->model_content_testimonial->getTotalData();

		$data['informations']=array();
		$results = $this->model_content_testimonial->getAllData($data);
		foreach ($results as $result) {
			
			$data['informations'][] = array(
				'testimonial_id' => $result['testimonial_id'],
				'name'      => $result['name'],
				'country_name'  => $result['country'],
				'status'         => $result['status'] ? "Published": "Unpublished",
				'selected'       => isset($this->request->post['selected']) && in_array($result['information_id'], $this->request->post['selected']),
				'edit'        => $this->url->link('content/testimonials/edit', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $result['testimonial_id'] . $url, 'SSL'),
				'delete'      => $this->url->link('content/testimonials/delete', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $result['testimonial_id'] . $url, 'SSL')
			);
		}	

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_country'] = $this->language->get('column_country');
		$data['column_status'] = $this->language->get('column_status');
		$data['text_list'] = $this->language->get('text_list');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_edit'] = $this->language->get('button_edit');

		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('content/testimonials', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('content/testimonials', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $information_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('content/testimonials', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($information_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($information_total - $this->config->get('config_limit_admin'))) ? $information_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $information_total, ceil($information_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/testimonial_list.tpl', $data));
	}

	protected function getForm() {

		$this->load->model('tool/image');

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_form'] = !isset($this->request->get['testimonial_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['button_add_image'] = $this->language->get('button_add_image');
		$data['tab_hotel_photos'] = $this->language->get('tab_hotel_photos');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_phone'] = $this->language->get('entry_phone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_address'] = $this->language->get('entry_address');
		$data['entry_map'] = $this->language->get('entry_map');
		$data['entry_rate'] = $this->language->get('entry_rate');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_policy'] = $this->language->get('entry_meta_policy');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_parent'] = $this->language->get('entry_parent');
		$data['entry_filter'] = $this->language->get('entry_filter');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_top'] = $this->language->get('entry_top');
		$data['entry_column'] = $this->language->get('entry_column');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_layout'] = $this->language->get('entry_layout');

		$data['entry_room_name'] = $this->language->get('entry_room_name');
		$data['entry_room_description'] = $this->language->get('entry_room_description');

		$data['help_filter'] = $this->language->get('help_filter');
		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_top'] = $this->language->get('help_top');
		$data['help_column'] = $this->language->get('help_column');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_design'] = $this->language->get('tab_design');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		$data['current_lang_id'] = $this->config->get('config_language_id');

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
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
			'href' => $this->url->link('content/testimonials', 'token=' . $this->session->data['token'] . $url, 'SSL')
			);
		
		if (!isset($this->request->get['testimonial_id'])) {
			$data['action'] = $this->url->link('content/testimonials/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('content/testimonials/edit', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $this->request->get['testimonial_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('content/testimonials', 'token=' . $this->session->data['token'] . $url, 'SSL');
		if (isset($this->request->get['testimonial_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$information_info = $this->model_content_testimonial->getData($this->request->get['testimonial_id']);
		}
		// print_r($information_info);exit();
		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		if (isset($this->request->post['country'])) {
			$data['country'] = $this->request->post['country'];
		} elseif (!empty($information_info)) {
			$data['country'] = $information_info['country'];
		} else {
			$data['country'] = '';
		}

		if (isset($this->request->post['testimonial_body'])) {
			$data['testimonial_body'] = $this->request->post['testimonial_body'];
		} elseif (!empty($information_info)) {
			$data['testimonial_body'] = $information_info['testimonial_body'];
		} else {
			$data['testimonial_body'] = '';
		}
		if (isset($this->request->post['testimonial_type'])) {
			$data['testimonial_type'] = $this->request->post['testimonial_type'];
		} elseif (!empty($information_info)) {
			$data['testimonial_type'] = $information_info['testimonial_type'];
		} else {
			$data['testimonial_type'] = 1;
		}

		if (isset($this->request->post['company_rate'])) {
			$data['company_rate'] = $this->request->post['company_rate'];
		} elseif (!empty($information_info)) {
			$data['company_rate'] = $information_info['company_rate'];
		} else {
			$data['company_rate'] = '';
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($information_info)) {
			$data['name'] = $information_info['name'];
		} else {
			$data['name'] = '';
		}



		if (isset($this->request->post['testimonial_id'])) {
			$data['testimonial_id'] = $this->request->post['testimonial_id'];
		} elseif (!empty($information_info)) {
			$data['testimonial_id'] = $information_info['testimonial_id'];
		} else {
			$data['testimonial_id'] = '';
		}

		if (isset($this->request->post['phone'])) {
			$data['phone'] = $this->request->post['phone'];
		} elseif (!empty($information_info)) {
			$data['phone'] = $information_info['phone'];
		} else {
			$data['phone'] = '';
		}



		$this->load->model('tool/image');

		if (isset($information_info)) {
			$data['customer_image'] = $information_info['image'];
		}else if(isset($this->request->post['customer_image'])){
			$data['customer_image'] = $this->request->post['customer_image'];
		}else{
			$data['customer_image'] = '../image/no_image.png';
		}


		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($information_info)) {
			$data['status'] = $information_info['status'];
		} else {
			$data['status'] = 1;
		}


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/testimonial_form.tpl', $data));
	}


	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'content/testimonials')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		// foreach ($this->request->post['information_description'] as $language_id => $value) {
		// 	if ((utf8_strlen($value['city_name']) < 3) || (utf8_strlen($value['city_name']) > 64)) {
		// 		$this->error['city_name'][$language_id] = $this->language->get('error_title');
		// 	}

		// 	if (utf8_strlen($value['city_description']) < 3) {
		// 		$this->error['city_description'][$language_id] = $this->language->get('error_description');
		// 	}
		// }

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'content/testimonials')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
?>