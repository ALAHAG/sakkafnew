<?php
class ControllerContentTours extends Controller {


	public function index() {
		$this->document->setTitle('إحجز برنامج المواصلات والجولات السياحية في ماليزيا  في كولالمبور و جزيرة لنكاوي و بينانج و كاميرون هايلاند ماليزيا وجنتنق هايلاند ماليزيا');
		$this->document->setDescription("إحجز برنامج المواصلات والجولات السياحية في ماليزيا ,أسعار المواصلات والجولات السياحية  في كولالمبور و جزيرة لنكاوي و بينانج و كاميرون هايلاند ماليزيا وجنتنق هايلاند ماليزيا");//$this->config->get('config_meta_description')
		$this->document->setKeywords("اسعار جولات ماليزيا , مواصلات سياحية في كولالمبور , توصيل الى فنادق لنكاوي , اسعار مواصلات وجولات بينانج , مواصلات وجولات كاميرون هايلان , ");//$this->config->get('config_meta_keyword')
		// $this->document->addScript('catalog/view/javascript/jquery/jquery.sortable.js');
		$this->document->addScript('catalog/view/javascript/select2/select2.min.js');
		$this->document->addStyle('catalog/view/javascript/select2/select2.css');
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
		$data['toursfilter'] = $this->load->controller('common/toursfilter');


		$this->load->model('content/tours');

		$this->load->model('tool/image');

		$filters = array();
		if (isset($this->request->get['page'])) {
					$array_page = $this->request->get['page'];
					if ( filter_var($array_page, FILTER_VALIDATE_INT) === false ) {

					setcookie("error", "Invalid page.", time()+3600);
					header("location:https://alsakkaftravel.net/");
					die();
					var_dump("$array_page is not int");

				}
			$filters['page'] = $this->request->get['page'];
		} else {
			$filters['page'] = 1;
		}

		// $filters['start'] = ($filters['page'] - 1) * 12;

		// $filters['limit'] = 12;

		if (isset($filters['page'])) {
			$page = $filters['page'];
		} else {
			$page = 1;
		}



		if(isset($this->request->get['rate'])){
			$array = $this->request->get['rate'];
			$array_rate = $this->request->get['rate'];
			array_walk($array_rate, function ($num){
					$is_int = filter_var($num, FILTER_VALIDATE_INT);
					if ($is_int === false){
					setcookie("error", "Invalid page.", time()+3600);
					header("location:https://alsakkaftravel.net/");
					die();
				}
			});
			$filters['rate'] = $this->request->get['rate'];
		}

		if(isset($this->request->get['city_id'])){
			$array_city = $this->request->get['city_id'];
			array_walk($array_city, function ($num){
					$is_int = filter_var($num, FILTER_VALIDATE_INT);
					if ($is_int === false){
					setcookie("error", "Invalid page.", time()+3600);
					header("location:https://alsakkaftravel.net/");
					die();
				}
			});
			$filters['city_id'] = $this->request->get['city_id'];
		}

    $filters['cat_id'] =1;
    $data['link_send_city'] = 'http://localhost/sakkaf/index.php?route=content/tours';
		// $this->url->link('content/tours','','SSL');
		$data['link_send_itinerary'] = $this->url->link('content/itinerary/book','');
		$data['link_send_success'] = $server.'package/success';

    $tours = $this->model_content_tours->getTours([]);
    $tours_city = $this->model_content_tours->getTourCities(array());

		$total_tours = $this->model_content_tours->getTotalTours($filters);

		foreach ($tours as $key => $value) {
			$tours[$key]['thumb'] = $this->model_tool_image->resize($value['image'], 270, 200,'w');
		}
		$data['tours'] = $tours;
    // dd($tours);
$data['tours_city']=$tours_city;

	// dd($data['tours']);
		$pagination = new Pagination();
		$pagination->total = $total_tours;
		$pagination->page = $page;
		$pagination->limit = 12;
		$link =  "//$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		if(isset($this->request->get['rate'])||isset($this->request->get['city'])){
			$parts=parse_url($link);
			if(isset($this->request->get['page'])){
				$link=substr($link, 0, strrpos($link, "&page"));
			}
			$pagination->url = $link . '&page={page}';
		}else{
			$parts=parse_url($link);
			$pagination->url = $parts['path'] . '?page={page}';
		}

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_tours) ? (($page - 1) * 12) + 1 : 0, ((($page - 1) * 12) > ($total_tours - 12)) ? $total_tours : ((($page - 1) * 12) + 12), $total_tours, ceil($total_tours / 12));

		/* --- */
		if($this->request->get['head'] == 1){
			return $data['tours'];
		}else{



		$data['hotelsfilter'] = $this->load->controller('common/hotelsfilter');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
}
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/list_tours.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/list_tours.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/content/list_tours.tpl', $data));
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
				if(isset($this->request->get['header'])){}else{
					$data['footer'] = $this->load->controller('common/footer');
					$data['header'] = $this->load->controller('common/header');
					$data['right_sidebar'] = $this->load->controller('common/rightsidebar');
				}
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

	public function book()
	{
		dd('tours');
	}
}
?>
