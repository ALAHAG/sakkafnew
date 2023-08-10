<?php
class ControllerContentBooking extends Controller {

	public function index() {
		$this->document->setTitle('حجز البرامج السياحية');
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['server'] = $server;

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
		/* Packages */

		$this->load->model('tool/image');

		// $this->load->model('content/itinerary');

		// $iti_options = array( 'itinerary_class' => 1 // package
		// 					   );
		// $data['packages'] =  $this->model_content_itinerary->getAllItinerarys($iti_options);

		$data['link_send_itinerary'] = $this->url->link('content/booking/book');

		/* --- */
		$data['right_sidebar'] = $this->load->controller('common/rightsidebar');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/booking.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/booking.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/content/booking.tpl', $data));
		}


	}

	public function book()
	{

		if ($this->request->post) {
			$this->load->model('content/itinerary');

			$booking =  $this->model_content_itinerary->addBooking($this->request->post);

		}

	}

}