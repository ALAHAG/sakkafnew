<?php
class ControllerCommonPackagesfilter extends Controller {


	public function index() {

		$data = array();

		$this->load->model("localisation/zone");

		$data['cities'] = $this->model_localisation_zone->getCities();

		if(isset($this->request->get['category']) && !empty($this->request->get['category'])){
			$data['get_category'] = $this->request->get['category'];
			$data['category'] = $this->request->get['category'];
		}

		if(isset($this->request->get['night']) && !empty($this->request->get['night'])){
			$data['night'] = $this->request->get['night'];
		}	
		if(isset($this->request->get['price'])){
			$data['price'] = $this->request->get['price'];
		}

		// dd($data['get_category']);
 		$this->load->model('content/category');
		$this->load->model('content/itinerary');
		$this->load->model('tool/image');
		$data['bookings'] = $this->model_content_itinerary->getBookings();
		// print_r($data['bookings']);exit();
		$cat_options = array( 
			// 'show_in_index' => true,
						  'category_type' => 1 // Package Categories
						);

		$package_categories = $this->model_content_category->getAllData($cat_options);
		// print_r($package_categories);exit();
		foreach ($package_categories as $key => $value) {
			$iti_options = array( 'category' => $value['category_id'] ,
								  'limit' => 4,
								  'itinerary_class' => 1 // package
								   );
			$package_categories[$key]['packages'] = $this->model_content_itinerary->getAllItinerarys($iti_options);
			foreach ($package_categories[$key]['packages'] as $key2 => $value2) {
				$package_categories[$key]['packages'][$key2]['image_thumb']=$this->model_tool_image->resize($value2['itinerary_image'], 277, 206,'w');
			}
		}
		$data['package_categories']=$package_categories;
		
		// print_r($package_categories);exit();
		$data['action'] = HTTPS_SERVER.'packages';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/packages_filter.tpl')) {
			return($this->load->view($this->config->get('config_template') . '/template/common/packages_filter.tpl', $data));
		} else {
			return($this->load->view('default/template/common/packages_filter.tpl', $data));
		}

	}
}
?>