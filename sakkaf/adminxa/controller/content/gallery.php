<?php
class ControllerContentGallery extends Controller { 
	private $error = array();

	public function index() {
		$this->language->load('content/gallery');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/gallery');

		$this->getList();
	}

	public function add() {
		$this->language->load('content/gallery');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/gallery');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_content_gallery->addInformation($this->request->post);

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
			$this->response->redirect($this->url->link('content/gallery', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}

		$this->getForm();
	}

	public function edit() {
		$this->language->load('content/gallery');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/gallery');
		// print_r($this->request->post);exit();
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_content_gallery->editInformation($this->request->get['gallery_category_id'], $this->request->post);

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
			$this->response->redirect($this->url->link('content/gallery', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}

		$this->getForm();
	}

	public function manage() {
		$this->language->load('content/gallery');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/gallery');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $gallery_category_id) {
				$this->model_content_gallery->deleteInformation($gallery_category_id);
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

			$this->redirect($this->url->link('content/gallery', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

	//	$this->getFormPic();
	 }

	public function delete() {
		$this->language->load('content/gallery');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/gallery');
		// print_r($this->request->post['selected']);exit();
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $gallery_category_id) {
				$this->model_content_gallery->deleteInformation($gallery_category_id);
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

			$this->response->redirect($this->url->link('content/gallery', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
	    $this->load->model('localisation/country');
		$this->load->model('localisation/zone');
		// $this->load->model('localisation/city');
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
			'href' => $this->url->link('content/gallery', 'token=' . $this->session->data['token'] . $url, 'SSL')
			);
		
		$data['insert'] = $this->url->link('content/gallery/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('content/gallery/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['repair'] = $this->url->link('content/gallery/repair', 'token=' . $this->session->data['token'] . $url, 'SSL');


		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
			);


		 $information_total = $this->model_content_gallery->getTotalGalleries();

		//$this->load->model('localisation/city');

		$results = $this->model_content_gallery->getInformations($data);
		// print_r($results);exit();
		$data['informations']=array();

		// print_r($results);exit();
		foreach ($results as $result) {

			// $city_name = $this->model_localisation_city->getCity($result['city_id']);

			$data['informations'][] = array(
				'information_id' => $result['gallery_category_id'],
				'gallery_name'=> $result['gallery_category_title'],
				'status'         => $result['gallery_category_status'] ? "Published": "Unpublished",
				'selected'       => isset($this->request->post['selected']) && in_array($result['gallery_category_id'], $this->request->post['selected']),
				'edit'        => $this->url->link('content/gallery/edit', 'token=' . $this->session->data['token'] . '&gallery_category_id=' . $result['gallery_category_id'] . $url, 'SSL'),
				'delete'      => $this->url->link('content/gallery/delete', 'token=' . $this->session->data['token'] . '&gallery_category_id=' . $result['gallery_category_id'] . $url, 'SSL')
			);
		}	

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_title'] = $this->language->get('column_title');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_city'] = $this->language->get('column_city');
		$data['text_list'] = $this->language->get('text_list');
		$data['column_gallery'] = $this->language->get('column_gallery');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_edit'] = $this->language->get('button_edit');

		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_rebuild'] = $this->language->get('button_rebuild');
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

		$data['sort_name'] = $this->url->link('content/gallery', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('content/gallery', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

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
		$pagination->url = $this->url->link('content/gallery', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($information_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($information_total - $this->config->get('config_limit_admin'))) ? $information_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $information_total, ceil($information_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;
		
		$data['header'] = $this->load->controller('common/header');
	    $data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/gallery_list.tpl', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_meta_keywords'] = $this->language->get('entry_meta_keywords');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_geo_locations'] = $this->language->get('entry_geo_locations');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_add_image'] = $this->language->get('button_add_image');
		$data['button_add_video'] = $this->language->get('button_add_video');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
	    $this->document->addScript('view/javascript/plupload/plupload.full.min.js');

		$data['uploader'] = $this->url->link('tool/upload/plupload&token=' . $this->session->data['token'],'', 'SSL');


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
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),     		
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('content/gallery', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' >> '
		);

		$this->load->model('localisation/country');
		$data['countries'] = $this->model_localisation_country->getCountries();


		if (!isset($this->request->get['gallery_category_id'])) {
			$data['action'] = $this->url->link('content/gallery/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('content/gallery/edit', 'token=' . $this->session->data['token'] . '&gallery_category_id=' . $this->request->get['gallery_category_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('content/gallery', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['gallery_category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$information_info = $this->model_content_gallery->getInformation($this->request->get['gallery_category_id']);
		}
		// print_r($information_info);exit();
		$data['token'] = $this->session->data['token'];


		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('localisation/zone');

		if (isset($this->request->post['information_description'])) {
			$data['information_description'] = $this->request->post['information_description'];
		} elseif (isset($this->request->get['gallery_category_id'])) {
			$data['information_description'] = $this->model_content_gallery->getInformationDescriptions($this->request->get['gallery_category_id']);
		} else {
			$data['information_description'] = array();
		}
		// print_r($data['information_description'] );exit();
		$this->load->model('tool/image');

		if (isset($this->request->post['information_images'])) {
			$data['information_images'] = $this->request->post['information_images'];
		} elseif (isset($this->request->get['gallery_category_id'])) {
			$information_image = array();
			$information_images = $this->model_content_gallery->getInformationImage($this->request->get['gallery_category_id']);
			foreach ($information_images as $image) {
				$information_image[] = array( 'thumb' => $this->model_tool_image->resize($image['gallery_url'], 100, 100),
											  'image_file' => $image['gallery_url']
											  );
			}
			$data['information_images'] = $information_image;
		} else {
			$data['information_images'] = array();
		}
		$data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
	
		if (isset($this->request->post['information_videoes'])) {
			$data['information_videoes'] = $this->request->post['information_videoes'];
		} elseif (isset($this->request->get['gallery_category_id'])) {
			$information_videoes = array();
			$information_videoess = $this->model_content_gallery->getInformationVideo($this->request->get['gallery_category_id']);
			foreach ($information_videoess as $image) {
				$information_videoes[] = array( 'video_file' => $image['gallery_url']);
			}
			$data['information_videoes'] = $information_videoes;
		} else {
			$data['information_videoes'] = array();
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($information_info)) {
			$data['status'] = $information_info['gallery_category_status'];
		} else {
			$data['status'] = 1;
		}




		$data['header'] = $this->load->controller('common/header');
	    $data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/gallery_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'content/gallery')) {
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
		if (!$this->user->hasPermission('modify', 'content/gallery')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		// $this->load->model('setting/store');

		// foreach ($this->request->post['selected'] as $gallery_category_id) {
		// 	if ($this->config->get('config_account_id') == $information_id) {
		// 		$this->error['warning'] = $this->language->get('error_account');
		// 	}

		// 	if ($this->config->get('config_checkout_id') == $information_id) {
		// 		$this->error['warning'] = $this->language->get('error_checkout');
		// 	}

		// 	// if ($this->config->get('config_affiliate_id') == $information_id) {
		// 	// 	$this->error['warning'] = $this->language->get('error_affiliate');
		// 	// }

		// 	$store_total = $this->model_setting_store->getTotalStoresByInformationId($information_id);

		// 	if ($store_total) {
		// 		$this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
		// 	}
		// }

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>