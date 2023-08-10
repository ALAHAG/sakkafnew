<?php
class ControllerContentTestimonials extends Controller {


	public function index() {
		$err = array();
		$done = false;
		if(($this->request->post)){
			if (!$this->request->post['name']) {
				$err['name'] = true;
			}
			if (!$this->request->post['testimonial_body']) {
				$err['testimonial_body'] = true;
			}
			if (!$this->request->post['country']){
				$err['country'] = true;
			}

			if (!$err){
				$this->load->model('content/testimonials');
				if($this->model_content_testimonials->addData($this->request->post)){

			 		$message = "<center><h2> New Message : </h2></center>
								<br> Name  : " .  $this->db->escape($data['name']) . "
								<br> Country  : " .  $this->db->escape($data['country']) . "
								<br> phone  : " .  $this->db->escape($data['phone']) . "
								<br> Image  : <a href='https://alsakkaftravel.net/image/" .  $this->db->escape($data['image']) . "'>https://alsakkaftravel.net/image/ " .  $this->db->escape($data['image']) . "</a>
								<br> Message  : " .  $this->db->escape($data['testimonial_body']);

					$noti_mail = new Mail($this->config->get('config_mail'));
					$noti_mail->setTo('marketing@alsakkaftravel.net,info@alsakkaftravel.net');
					$noti_mail->setFrom('info@alsakkaftravel.net');
					$noti_mail->setSender($this->config->get('config_name'));
					$noti_mail->setSubject(html_entity_decode("New testimonial", ENT_QUOTES, 'UTF-8'));
					$noti_mail->setHTML($message);
					$noti_mail->send();

					$done = true;
				}else{
					$err['db'] = true;
				}
			}

		}



		$data = array();
		$this->document->setTitle('قالوا عن شركة السقاف للسياحة والسفر ماليزيا - اراء العملاء لدى شركة السقاف للسياحة والسفر ماليزيا');
		$this->document->setDescription("أراء العملاء والوكلاء عن شركة السقاف للسياحة والسفر في ماليزيا ");//$this->config->get('config_meta_description')
		$this->document->setKeywords("أراء عملاء السقاف للسياحة والسفر , قالوا عننا , السقاف للسياحة , عملاء السقاف , وكلاء السقاف");//$this->config->

		$data['err'] = $err;
		$data['done'] = $done;
		$data['form'] = $this->request->post;

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$data['testimonial_form'] = $this->load->controller('common/testimonialform');


		$this->load->model('content/testimonials');

		$data['video_testimonials'] =  $this->model_content_testimonials->getAllVideoData();
		$data['text_testimonials'] =  $this->model_content_testimonials->getAllTextData();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/testimonial_list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/testimonial_list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/content/testimonial_list.tpl', $data));
		}

	}
	// public function send()
	// {
	// 	// dd($this->request->post);
	// 				$this->load->model('content/testimonials');


	// 	// if (isset($this->request->post['name']) &&
	// 	// 	isset($this->request->post['testimonial_body']) &&
	// 	// 	isset($this->request->post['country'])
	// 	// 	) {


	// 	// 	if($this->model_content_testimonials->addData($this->request->post)){
	// 	// 		echo 'OK';
	// 	// 	}else{
	// 	// 		echo 'error';
	// 	// 	} }

	// 	// }else{
	// 	// 	echo 'error';
	// 	// }
	// }
		public function add() {
		$this->language->load('content/testimonial');

		$this->load->model('content/testimonials');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
			$this->model_content_testimonials->addInformation($this->request->post);

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
			//$this->response->redirect($this->url->link('content/testimonial'));

		// $this->getForm();
	}
}
?>