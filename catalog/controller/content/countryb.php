<?php
class ControllerContentCountryb extends Controller {
	public function index() {
		$this->document->setTitle("عروض سياحية الى ماليزيا لعام 2019 تقدمها شركة السقاف للسياحة والسفر ماليزيا شاملة رحلات سياحية وبكجات شهر عسل");//$this->config->get('config_meta_title')
		$this->document->setDescription("افضل عروض سياحية الى ماليزيا لعام 2019 شاملة جولات سياحية وحجوزات فنادق ماليزيا و عروض برامج وبكجات شهر عسل وبرامج عائلية ماليزيا   ورحلات سياحية ");//$this->config->get('config_meta_description')
		$this->document->setKeywords("ماليزيا,السياحية في ماليزيا,عروض سياحية ,شركة سياحة في ماليزيا,سفر ماليزيا ,رحلات ماليزيا ,السقاف للسياحة والسفر,برامج شهر عسل ,بكجات عائلية ,حجز رحلة الى ماليزيا , تذاكر ماليزيا , افضل مناطق ماليزيا");//$this->config->get('config_meta_keyword')
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['server'] = $server;

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
    // get the first url name of the country
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);
			var_dump($this->request->get['_route_']);
			$countryName=current($parts);
			$country=end($parts);

		}
    // $countryName = explode('/', $_SERVER['REQUEST_URI']);
    // $countryName = $countryName[2];
		// dd($countryName);
		$this->load->model('localisation/country');

    if(strcmp($countryName, 'malaysia') == 0 || strcmp($countryName, 'ماليزيا') == 0)
    {
       $session->data['countryb'] = 129;
			 $data['country'] = 'ماليزيا';
			 $data['country_id'] = 129;
			 $data['country_name'] = $this->model_localisation_country->getCountry($data['country_id'])['name'];

    }elseif(strcmp($countryName, 'indonesia') == 0) {
      $session->data['countryb'] = 100;
			$data['country'] = 'اندونيسيا';
			$data['country_id'] = 100;
			$data['country_name'] = $this->model_localisation_country->getCountry($data['country_id'])['name'];

    }else{
			$session->data['countryb'] = 129;
			$data['country'] = 'ماليزيا';
			$data['country_id'] = 129;
			$data['country_name'] = 'malaysia';

		}
		$this->load->model('content/category');
		$this->load->model('content/itinerary');
		$this->load->model('tool/image');
		$bookings= $this->model_content_itinerary->getBookings();
		foreach ($bookings as $key => $value) {
			if(!empty($value['customer_name_ar'])){
					if($this->validate_mobile($value['phone']) OR filter_var($value['email'], FILTER_VALIDATE_EMAIL)){
					$bookingss[$key]['customer_name_ar']=$value['customer_name_ar'];
					$bookingss[$key]['customer_country']=$value['customer_country'];
				}
			}
		}

		$data['bookings']=$bookingss;
		$cat_options = array( 'show_in_index' => true,
							'countryb'=>$data['country_id'],
						  'category_type' => 1 // Package Categories
						);

		$package_categories = $this->model_content_category->getAllData($cat_options);
		foreach ($package_categories as $key => $value) {
			$iti_options = array( 'category' => $value['category_id'] ,
			            'countryb'=>$data['country_id'],

								  'limit' => 4,
								  'itinerary_class' => 1 // package
								   );
			$package_categories[$key]['packages'] = $this->model_content_itinerary->getAllItinerarys($iti_options);
			foreach ($package_categories[$key]['packages'] as $key2 => $value2) {
				$package_categories[$key]['packages'][$key2]['image_thumb']=$this->model_tool_image->resize($value2['itinerary_image'], 370, 206,'w');
				$package_categories[$key]['packages'][$key2]['image']=$value2['itinerary_image'];
			}
		}

		$cat_options_2 = array( 'category_type' => 1 );
		//honey moon
		$package_categories_2 = $this->model_content_category->getAllData($cat_options_2);
		foreach ($package_categories_2 as $key => $value) {
			$iti_options = array( 'category' => 11 ,
								  'limit' => 2,
									'countryb'=>$data['country_id'],
								  'itinerary_class' => 1 // package
								   );
			if($package_categories_2[$key]['category_id']==11){
			$package_categories_2[222]['title']	=$package_categories_2[$key]['title'];
			$package_categories_2[222]['packages'] = $this->model_content_itinerary->getAllItinerarys($iti_options);
			foreach ($package_categories_2[222]['packages'] as $key2 => $value2) {
				$package_categories_2[222]['packages'][$key2]['image_thumb']=$this->model_tool_image->resize($value2['itinerary_image'], 370, 276,'w');
			}
			}
		}
		   // print_r($package_categories); exit();

		$data['package_categories'] = $package_categories;
		$data['package_categories_2'] = $package_categories_2;



				$this->load->model('content/hotels');



				$hotels_options = array( 'limit' => 4 ,'country_id'=>$data['country_id']);

				$hotels = $this->model_content_hotels->getHotels($hotels_options);
				foreach ($hotels as $key => $value) {
					$hotels[$key]['thumb'] = $this->model_tool_image->resize($value['image'], 270, 200,'w');
				}
				$data['hotels'] = $hotels;

		/* --- */
		$this->load->model('content/testimonials');

		$testimonials_options = array('start'=>0,'limit' => 6,'testimonial_type' => 2 );

		$testimonials = $this->model_content_testimonials->getInformations($testimonials_options);
		// dd($testimonials);

		foreach ($testimonials as $key => $value) {

			$testimonials[$key]['image_thumb'] = $this->model_tool_image->resize($value['image'], 95, 95,'w');
		}
		$data['testimonials'] = $testimonials;
		/* --- */
		/* PAGES */
		$this->load->model('content/page');
		$cat_options = array( 'show_in_index' => true,
						      'category_type' => 2, // Page Categories
									'countryb'=>$data['country_id']

							);



		$page_categories = $this->model_content_category->getAllData($cat_options);

		foreach ($page_categories as $key => $value) {
			$iti_options = array( 'category_id' => $value['category_id'] ,
								  'limit' => 4
								   );
			$page_categories[$key]['pages'] =  $this->model_content_page->getAllData($iti_options);
			foreach ($page_categories[$key]['pages'] as $key2 => $value2) {
				$page_categories[$key]['pages'][$key2]['image_thumb']=$this->model_tool_image->resize($value2['image'], 250, 183,'h');
			}
		}

		$data['page_categories'] = $page_categories;

		$data['slider'] = $this->load->controller('common/slider');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/country_view.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/country_view.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/content/country_view.tpl', $data));
		}

	}
	public function validate_mobile($mobile)
	{
			return preg_match('/^[0-9]{5}+$/', $mobile);
	}
}
