<?php
class ControllerCommonTestimonialform extends Controller {


	public function index() {

		$data = array();
		$this->language->load('content/testimonial');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/testimonials');

		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');
		$this->load->model('tool/image');
	    if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['server'] = $server;
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
		
	

		$this->load->model('localisation/language');
		$data['countries'] = $this->model_localisation_country->getCountries();

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['country'])) {
			$data['country'] = $this->request->post['country'];
		} else {
			$data['country'] = '';
		}

		if (isset($this->request->post['testimonial_body'])) {
			$data['testimonial_body'] = $this->request->post['testimonial_body'];
		} else {
			$data['testimonial_body'] = '';
		}

		if (isset($this->request->post['company_rate'])) {
			$data['company_rate'] = $this->request->post['company_rate'];
		}  else {
			$data['company_rate'] = '';
		}

		if (isset($this->request->post['customer_name'])) {
			$data['customer_name'] = $this->request->post['customer_name'];
		}  else {
			$data['customer_name'] = '';
		}

		if (isset($this->request->post['customer_id'])) {
			$data['customer_id'] = $this->request->post['customer_id'];
		} else {
			$data['customer_id'] = '';
		}


		if (isset($this->request->post['testimonial_id'])) {
			$data['testimonial_id'] = $this->request->post['testimonial_id'];
		}  else {
			$data['testimonial_id'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		}else {
			$data['email'] = '';
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

		// $data['uploader'] = $this->url->link('tool/upload/plupload', 'SSL');
		$data['uploader'] = 'https://alsakkaftravel.net/index.php?route=tool/upload/plupload';

		$data['action'] = 'https://alsakkaftravel.net/index.php?route=content/testimonials/add';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/testimonial_form.tpl')) {
			return($this->load->view($this->config->get('config_template') . '/template/common/testimonial_form.tpl', $data));
		} else {
			return($this->load->view('default/template/common/testimonial_form.tpl', $data));
		}

	}
		public function add() {
		$this->language->load('content/testimonial');

		$this->load->model('content/testimonials');


		if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
			$this->model_content_testimonial->addInformation($this->request->post);

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

			//$this->response->redirect($this->url->link('content/testimonial'));
		}

		// $this->getForm();
	}

		
}
?>