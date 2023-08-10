<?php
class ControllerContentMenu extends Controller {


	public function index() {


		if (isset($this->request->get['content_id'])) {

			$this->load->model('content/menu');

			$content =  $this->model_content_menu->getData($this->request->get['content_id']);

			if ($content) {
				$this->document->setTitle($content['title']);
				$this->document->setDescription($content['meta_description']);


				$data['title'] = $content['title'];

				$data['content'] = $content['content'];


				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');
				$data['right_sidebar'] = $this->load->controller('common/rightsidebar');

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/show_menu.tpl')) {
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/show_menu.tpl', $data));
				} else {
					$this->response->setOutput($this->load->view('default/template/content/show_menu.tpl', $data));
				}

			}else{
				$this->response->redirect($this->url->link('error/not_found', '', 'SSL'));
			}
		}else{
			$this->response->redirect($this->url->link('error/not_found', '', 'SSL'));
		}
	}
}
?>