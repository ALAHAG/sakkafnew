<?php
class ControllerContentItinerary extends Controller {

	public function index() {
		$this->document->setTitle('البرامج السياحية');
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

		$this->load->model('content/itinerary');

		// $iti_options = array( 'itinerary_class' => 1 // package
		// 					   );
		$filters = array();

		$filters['itinerary_class']=1;
		if (isset($this->request->get['page'])) {
			$filters['page'] = $this->request->get['page'];
		} else {
			$filters['page'] = 1;
		}

		$filters['start'] = ($filters['page'] - 1) * 12;

		$filters['limit'] = 12;

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if(isset($this->request->get['category'])){
			$filters['category'] = $this->request->get['category'];
		}

		$data['packages'] =  $this->model_content_itinerary->getAllItinerarys($filters);
		$total_packages = $this->model_content_itinerary->getTotalItinerarys($filters);

		/* --- */
		$pagination = new Pagination();
		$pagination->total = $total_packages;
		$pagination->page = $page;
		$pagination->limit = 12;
		$link =  "//$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		if(isset($this->request->get['category'])){
			if(isset($this->request->get['page'])){
				$link=substr($link, 0, strrpos($link, "&page"));
			}
			$pagination->url = $link . '&page={page}';
		}else{
			$parts=parse_url($link);
			$pagination->url = $parts['path'] . '?page={page}';
		}

		$data['pagination'] = $pagination->render();
		// $data['rightsidebar'] = $this->load->controller('common/rightsidebar');
		$data['packagesfilter'] = $this->load->controller('common/packagesfilter');

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/list_packages.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/list_packages.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/content/list_packages.tpl', $data));
		}


	}

	public function show()
	{

		if (isset($this->request->get['content_id'])) {

			$package_id = $this->request->get['content_id'];

			$this->load->model('content/itinerary');
			$package =  $this->model_content_itinerary->getItinerary($package_id);

			if ($package) {
				$this->document->setTitle($package['itinerary_title']);

				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');

				$package_rooms = $this->model_content_itinerary->getItineraryRooms($package_id);
				$package_transportations = $this->model_content_itinerary->getItineraryTransportations($package_id);
				$package_tours = $this->model_content_itinerary->getItineraryTours($package_id);

				$data += $package;

				$data['package_rooms'] = $package_rooms;
				$data['package_transportations'] = $package_transportations;
				$data['package_tours'] = $package_tours;
				$data['link_send_itinerary'] = $this->url->link('content/itinerary/book');

				// print_r($package_tours);exit();

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/show_package.tpl')) {
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/show_package.tpl', $data));
				} else {
					$this->response->setOutput($this->load->view('default/template/content/show_package.tpl', $data));
				}

			}else{
				$this->response->redirect($this->url->link('error/not_found', '', 'SSL'));
			}
		}else{
			$this->response->redirect($this->url->link('error/not_found', '', 'SSL'));
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