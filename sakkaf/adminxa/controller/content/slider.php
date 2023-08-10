<?php
class ControllerContentSlider extends Controller {
	private $error = array();
	private $data = array();

	public function index() {

		$data = $this->data;

		$data += $this->load->language('content/slider');
		
		$this->load->model('content/slider');

		$data['success'] = '';
		$data['error_warning'] = '';

		if (isset($this->request->post) && $this->request->post && $this->validate()) {

			$this->model_content_slider->editData($this->request->post);
			$data['success'] = $this->language->get('success');
		}
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}


		$this->document->setTitle($this->language->get('heading_title'));


		$data['token'] = $this->session->data['token'];


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/slider', 'token=' . $this->session->data['token'] , 'SSL')
		);


		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('tool/image');

		 $sliders = $this->model_content_slider->getAllData();
		 foreach ($sliders as $key => $slider) {
		 	$sliders[$key]['thumb'] =  $this->model_tool_image->resize($slider['image'], 70, 40);
		 }

		$data['sliders'] = $sliders;

		$data['action'] = $this->url->link('content/slider', 'token=' . $this->session->data['token'], 'SSL');


		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 70, 40);
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/slider_list.tpl', $data));
	}

	public function validate()
	{
		return true;
	}

}

?>