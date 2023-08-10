<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle("عروض سياحية الى ماليزيا لعام 2018 تقدمها شركة السقاف شاملة فنادق في مدن ماليزيا وجولات سياحية ومواصلات بين المدن الماليزيا ");//$this->config->get('config_meta_title')
		$this->document->setDescription("عروض سياحية الى ماليزيا لعام 2018 شاملة جولات سياحية وحجوزات فنادق ماليزيا و عروض برامج وبكجات شهر عسل وبرامج عائلية ماليزيا  وفنادق 5 نجوم");//$this->config->get('config_meta_description')
		 $this->document->setKeywords("ماليزيا,السياحية في ماليزيا,عروض سياحية ,شركة سياحة في ماليزيا,شركة عربية للسياحة في ماليزيا,برامج شهر عسل ,بكجات عائلية ,حجز رحلة الى ماليزيا , تذاكر ماليزيا , افضل مناطق ماليزيا");//$this->config->get('config_meta_keyword')
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['server'] = $server;

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$this->load->model('content/category');
		$this->load->model('content/itinerary');
		$this->load->model('tool/image');
		$data['bookings'] = $this->model_content_itinerary->getBookings();
		// print_r($data['bookings']);exit();
		$cat_options = array( 'show_in_index' => true,
						  'category_type' => 1 // Package Categories
						);

		$package_categories = $this->model_content_category->getAllData($cat_options);
		// print_r($package_categories);exit();
		foreach ($package_categories as $key => $value) {
			$iti_options = array( 'category' => $value['category_id'] ,
								  'limit' => 8,
								  'itinerary_class' => 1 // package
								   );
			$package_categories[$key]['packages'] = $this->model_content_itinerary->getAllItinerarys($iti_options);
			foreach ($package_categories[$key]['packages'] as $key2 => $value2) {
				$package_categories[$key]['packages'][$key2]['image_thumb']=$this->model_tool_image->resize($value2['itinerary_image'], 370, 206,'w');
			}
		}
		$cat_options_2 = array( 'category_type' => 1 );
		//honey moon
		$package_categories_2 = $this->model_content_category->getAllData($cat_options_2);
		foreach ($package_categories_2 as $key => $value) {
			$iti_options = array( 'category' => 11 ,
								  'limit' => 2,
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
		
		/* --- */		
		$this->load->model('content/testimonials');

		$testimonials_options = array('start'=>0,'limit' => 6 );

		$testimonials = $this->model_content_testimonials->getInformations($testimonials_options);
		foreach ($testimonials as $key => $value) {
			$testimonials[$key]['image_thumb'] = $this->model_tool_image->resize($value['image'], 95, 95,'w');
		}
		$data['testimonials'] = $testimonials;
		/* --- */
		/* PAGES */
		$this->load->model('content/page');
		$cat_options = array( 'show_in_index' => true,
						      'category_type' => 2 // Page Categories
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

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
}