<?php
class ControllerContentPayment extends Controller {


	public function index() {
		$this->document->setTitle('الدفع بالبطاقة الائتمانية لشركة السقاف للسياحة والسفر ماليزيا');
		$this->document->setDescription("طريقة الدفع اونلاين لشركة السقاف للسياحة والسفر ماليزيا");//$this->config->get('config_meta_description')
		$this->document->setKeywords("شركو السقاف للسياحة والسفر ماليزيا , الدفع اونلاين ");//$this->config->get('config_meta_keyword')

		$this->document->addScript('https://maps.google.com/maps/api/js?sensor=false&amp;language=en');
		$this->document->addScript('catalog/view/javascript/gmap3.min.js');

		$data = array();
		$data['right_sidebar'] = $this->load->controller('common/rightsidebar');

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/payment.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/payment.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/content/payment.tpl', $data));
		}

	}
		public function success($data){
			$this->document->setTitle('شكرا لدفعك اونلاين -  ستم التواصل بك حالا');

				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');


			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/success.tpl')) {
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/success.tpl', $data));
				} else {
					$this->response->setOutput($this->load->view('default/template/content/success.tpl', $data));
			}

	}
}
?>
