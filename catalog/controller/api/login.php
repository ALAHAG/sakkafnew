<?php

class ControllerApiLogin extends Controller {
	public function index() {

		$this->load->language('api/login');

		// Delete old login so not to cause any issues if there is an error
		unset($this->session->data['api_id']);
		$json = array();
		// $json['poss'] =$this->request->post;

		$keys = array(
			'username',
			'password'
		);
		foreach ($keys as $key) {
			if (!isset($this->request->post[$key])) {
				$this->request->post[$key] = '';
			}
		}


		// $json['api_id_k']=$this->session->data['api_id'];
		// $json['username'] =$this->request->post['username'];
		// $json['password'] =$this->request->post['password'];
		$this->load->model('account/api');

		$api_info = $this->model_account_api->login($this->request->post['username'], $this->request->post['password']);

		if ($api_info) {
			$this->session->data['api_id'] = $api_info['api_id'];
			// $json['api_id'] = $this->session->data;
			$json['cookie'] = $this->session->getId();
			$json['success'] = $this->language->get('text_success');
		} else {
			$json['error'] = $this->language->get('error_login');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
