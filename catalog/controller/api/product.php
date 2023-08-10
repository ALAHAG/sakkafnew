<?php
class ControllerApiProduct extends Controller
{
    public function index()
    {

      // https://webocreation.com/blog/pull-products-json-through-api-opencart/
        $this->load->language('api/product');

        $json = array();
        $json['products'] = array();
        // if (!isset($this->session->data['api_id'])) {
    		// 	$data['error']['warning'] = $this->language->get('error_permission');
        //   $json = 	$data['error']['warning']  ;
    		// } else {

          if ($this->request->server['HTTPS']) {
    			$server = $this->config->get('config_ssl');
    		} else {
    			$server = $this->config->get('config_url');
    		}

    		$data['server'] = $server;
 //    show specific package
          if (isset($this->request->get['id'])) {

            $package_id = $this->request->get['id'];

            $this->load->model('content/itinerary');
            $package =  $this->model_content_itinerary->getItinerary($package_id);

            if ($package) {
              $this->document->setTitle($package['itinerary_title'] . "  ماليزيا , عرض سياحي الى ماليزيا , بكج سياحي في ماليزيا - برنامج سياحي في ماليزيا ");

              $this->document->setDescription($package['itinerary_title'] ." - برنامج سياحي في ماليزيا - بكج سياحي الى ماليزيا - باقة ورحلة سياحية ");//$this->config->get('config_meta_description')$this->document->setKeywords($package['itinerary_title'] ." برنامج سياحي , شهر عسل , ماليزيا , لنكاوي , كولالمبور , فنادق , بكج سياحي");

              // $data['footer'] = $this->load->controller('common/footer');
              // $data['header'] = $this->load->controller('common/header');
              $data['nights']=0;
              $package_rooms = $this->model_content_itinerary->getItineraryRooms($package_id);
              $package_transportations = $this->model_content_itinerary->getItineraryTransportations($package_id);
              $package_tours = $this->model_content_itinerary->getItineraryTours($package_id);
              foreach ($package_rooms as $key => $value) {
                $data['nights']+=$value['num_of_nights'];
              }

              $data += $package;
              $data['entry_num_passengers']=$package['entry_num_passengers'];
              $data['package_rooms'] = $package_rooms;
              $data['package_transportations'] = $package_transportations;
              $data['package_tours'] = $package_tours;
              $data['package_notes'] = $package['itinerary_notes'];

              $data['link_send_itinerary'] = $this->url->link('content/itinerary/book','', 'SSL');
              $data['link_send_success'] = $server.'package/success';

              $json= $data;
          }
        }

          else{


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
                  'category_type' => 1 // Package Categories
                );

        $package_categories = $this->model_content_category->getAllData($cat_options);
        foreach ($package_categories as $key => $value) {
          $iti_options = array( 'category' => $value['category_id'] ,
                      'limit' => 4,
                      'itinerary_class' => 1 // package
                       );
            if($key==0){
              $package_categories[$key]['open']=true;
            }
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

        $data['package_categories'] = $package_categories;
        $data['package_categories_2'] = $package_categories_2;

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

        $json= $data['package_categories'];


        // }
      }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json, JSON_UNESCAPED_UNICODE));

    }
    public function validate_mobile($mobile)
    {
        return preg_match('/^[0-9]{5}+$/', $mobile);
    }
}
