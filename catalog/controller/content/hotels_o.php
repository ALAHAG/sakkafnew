<?php
class ControllerContentHotels extends Controller {


	public function index() {
		$this->document->setTitle('الفنادق');
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
		/* Hotels */


		$this->load->model('content/hotels');

		$this->load->model('tool/image');

		$filters = array();


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

		if(isset($this->request->get['rate'])){
			$filters['rate'] = $this->request->get['rate'];
		}

		if(isset($this->request->get['city'])){
			$filters['city'] = $this->request->get['city'];
		}

		 // dd($filters);


		$hotels = $this->model_content_hotels->getHotels($filters);
		$total_hotels = $this->model_content_hotels->getTotalHotels($filters);

		foreach ($hotels as $key => $value) {
			$hotels[$key]['thumb'] = $this->model_tool_image->resize($value['image'], 270, 200,'w');
		}
		$data['hotels'] = $hotels;


		$pagination = new Pagination();
		$pagination->total = $total_hotels;
		$pagination->page = $page;
		$pagination->limit = 12;
		$link =  "//$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		if(isset($this->request->get['rate'])||isset($this->request->get['city'])){
			$pagination->url = $link . '&page={page}';
		}else{
		$pagination->url = $link . '?page={page}';}

		$data['pagination'] = $pagination->render();
		
		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_hotels) ? (($page - 1) * 12) + 1 : 0, ((($page - 1) * 12) > ($total_hotels - 12)) ? $total_hotels : ((($page - 1) * 12) + 12), $total_hotels, ceil($total_hotels / 12));

		/* --- */
		$data['hotelsfilter'] = $this->load->controller('common/hotelsfilter');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/list_hotels.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/list_hotels.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/content/list_hotels.tpl', $data));
		}

	}
	public function show() {

		if (isset($this->request->get['content_id'])) {

			$this->load->model('content/hotels');

			$this->load->model('tool/image');


			$hotels_options = array( 'limit' => 4 , 'random' => true );

			$hotels = $this->model_content_hotels->getHotels($hotels_options);
			foreach ($hotels as $key => $value) {
				$hotels[$key]['thumb'] = $this->model_tool_image->resize($value['image'], 270, 200,'w');
			}
			$data['hotels'] = $hotels;
			/* --- */

			$hotel_info =  $this->model_content_hotels->getHotel($this->request->get['content_id']);
			if ($hotel_info) {

				$hotel_content =  $this->model_content_hotels->getHotelContent($this->request->get['content_id']);
				$hotel_rooms =  $this->model_content_hotels->getHotelRooms($this->request->get['content_id']);
				$hotel_images =  $this->model_content_hotels->getHotelImages($this->request->get['content_id']);

				$this->document->setTitle($hotel_content['hotel_name']);
				$this->document->setDescription($hotel_content['meta_description']);

				$data['hotel_english_name'] =$hotel_info['hotel_english_name'];
				$data['star_rate'] =$hotel_info['star_rate'];
				$data['city_ar_name'] =$hotel_info['city_ar_name'];

				// Hotel Content

				$data['hotel_name'] =$hotel_content['hotel_name'];

				$data['hotel_content'] =$hotel_content['hotel_content'];
				$data['hotel_star']=$hotel_info['star_rate'];




				// Hotel Images

				foreach ($hotel_images as $key => $value) {
					$hotel_images[$key]['thumb'] = $this->model_tool_image->resize($value['image'], 70, 70);
					$hotel_images[$key]['resized_image'] = $this->model_tool_image->resize($value['image'], 900, 500 , 'w');
				}

				$data['hotel_images'] =$hotel_images;

				// Hotel Rooms

				foreach ($hotel_rooms as $key => $value) {
					$hotel_rooms[$key]['thumb'] = $this->model_tool_image->resize($value['image'], 230, 160 , 'w');
				}

				$data['hotel_rooms'] =$hotel_rooms;

				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');
				$data['right_sidebar'] = $this->load->controller('common/rightsidebar');

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/show_hotel.tpl')) {
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/show_hotel.tpl', $data));
				} else {
					$this->response->setOutput($this->load->view('default/template/content/show_hotel.tpl', $data));
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