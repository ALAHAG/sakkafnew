<?php
class ControllerContentItinerary extends Controller {

	public function index() {

		$this->document->setTitle('عروض سياحية الى ماليزيا لعام 2017 - عروض شهر العسل الى ماليزيا - عروض عائلية - برامج سياحية - بكجات سياحية - فنادق ماليزيا');
		$this->document->setDescription("افضل العروض السياحية الى ماليزيا لعام 2017 شاملة فنادق ومواصلات وجولات سياحية في افضل المدن الماليزيه ");//$this->config->get('config_meta_description')
		$this->document->setKeywords("عروض سياحة الى ماليزيا , برامج سياحية ,باقات سياحية ,شهر عسل في ماليزيا ,رحلة العمر ,جزر ماليزيا");//$this->config->get('config_meta_keyword')

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

		

		if(isset($this->request->get['category'])){
			$x=reset($this->request->get['category']);

			$cat_options = array('category_type' => 1 // Package Categories
			);
			$package_categories = $this->model_content_category->getAllData($cat_options);
			foreach ($package_categories  as $key => $value) {
				if($value['category_id'] == $x){
					$category_title=$value['title'];

				}
			}
		}
		if(isset($category_title)){
			$data['category_title']=$category_title;
			/* Packages */
		}
		else{
			$data['category_title']='البرامج السياحية في ماليزيا';
		}

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
		if(isset($this->request->get['night'])){
			$filters['night'] = $this->request->get['night'];
		}
		if(isset($this->request->get['price'])){
			$filters['price'] = $this->request->get['price'];
		}

		// print_r($filters);exit;
		$data['packages'] =  $this->model_content_itinerary->getAllItinerarys($filters);
		$total_packages = $this->model_content_itinerary->getTotalItinerarys($filters);
		// dd($total_packages);exit;
		/* --- */
		$data['total_packages']=$total_packages;
		$pagination = new Pagination();
		$pagination->total = $total_packages;
		$pagination->page = $page;
		$pagination->limit = 12;
		$link =  "//$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		if(isset($this->request->get['category'])){
			if(isset($this->request->get['night'])){
				$link=substr($link, 0, strrpos($link, "&night"));
			}
			if(isset($this->request->get['page'])){
				$link=substr($link, 0, strrpos($link, "&page"));
			}
			$pagination->url = $link . '&night={night}&page={page}';
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
	    if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['server'] = $server;

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
				$data['package_notes'] = $package['itinerary_notes'];

				$data['link_send_itinerary'] = $this->url->link('content/itinerary/book');
				$data['link_send_success'] = $server.'package/success';


				// print_r($data['link_send_success']);exit();

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
			// dd($this->request->post);

			$booking =  $this->model_content_itinerary->addBooking($this->request->post);
			if($booking){

		 		// $message = '<div style="text-align:center;font-size:20px;font-weight:bold;line-height:2;"><br><br><br>شكرا جزيلا  لحجزك معنا .....<br>
     //                        تم استلام طلبك وسيتم تنسيق طلبك خلال 30 ساعة تقريبا<br>
     //                        <br>
     //                       نشكرك على ثقتك بنا.<br><br><br><br></div>';
			$data = $this->request->post;
            $message = '<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Hybrid Grid Master</title>
<style type="text/css">

  table td { border: 1px solid purple;direction: rtl;}  
  @media only screen and (max-width: 600px) {
    .wrapper{width:95% !important;}
  }   

</style>
</head>
<body style="margin:0; padding:0; background-color:#F8F8F8">
<center>
<table width="100%" bgcolor="#202020" cellpadding="0" cellspacing="0" border="0" id="backgroundTable">
   <tbody>
      <tr>
         <td>
            <table width="600" cellpadding="0" cellspacing="0" border="0" align="center" class="devicewidth">
               <tbody>
                  <tr>
                     <td width="100%">
                        <table width="600" cellpadding="0" cellspacing="0" border="0" align="center" class="devicewidth">
                           <tbody>
                              <!-- Spacing -->
                              <tr>
                                 <td width="100%" height="20"></td>
                              </tr>
                              <!-- Spacing -->
                              <tr>
                                 <td>
                                    <table width="280" align="right" border="0" cellpadding="0" cellspacing="0" class="devicewidthinner">
                                       <tbody>
                                          <tr>
                                             <td align="right" valign="middle" style="font-family: Helvetica, arial, sans-serif; font-size: 13px;color: #ffffff">
                                                شركة السقاف للسياحة والسفر ماليزيا
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                    <table width="280" align="right" border="0" cellpadding="0" cellspacing="0" class="emhide">
                                       <tbody>
                                          <tr>
                                             <td align="right" valign="middle" style="font-family: Helvetica, arial, sans-serif; font-size: 13px;color: #ffffff">
                                                <a href="#" style="text-decoration: none; color: #ffffff">شكرا جزيلا  لحجزك معنا .....<br>
                            تم استلام طلبك وسيتم تنسيق طلبك خلال 30 ساعة تقريبا<br>
                            <br>
                           نشكرك على ثقتك بنا. </a> 
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                              <!-- Spacing -->
                              <tr>
                                 <td width="100%" height="20" align="center" valign="middle" style="font-family: Helvetica, arial, sans-serif; font-size: 13px;color: #ffffff">
 بيانات طلبك</td>
                              </tr>
                              <!-- Spacing -->
                           </tbody>

                        </table>
                     </td>
                  </tr>
               </tbody>
            </table>
         </td>
      </tr>

   </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#F8F8F8" class="wrapper">
    


  <tr>
    <td align="center" valign="top" width="100%">

      <!--[if (gte mso 9)|(IE)]>
      <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
      <tr>
      <td align="center" valign="top" width="600">
      <![endif]-->
      <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;" bgcolor="#FFFFFF">
        <tr>
          <td align="center" valign="top" style="font-size:0;">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

                    الاسم 

                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

 '.  $this->db->escape($data['customer_name_ar']) .' 
                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
          </td>
        </tr>
      </table>
      <!--[if (gte mso 9)|(IE)]>
      </td>
      </tr>
      </table>
      <![endif]-->

    </td>
  </tr>
 <tr>
    <td align="center" valign="top" width="100%">

      <!--[if (gte mso 9)|(IE)]>
      <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
      <tr>
      <td align="center" valign="top" width="600">
      <![endif]-->
      <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;" bgcolor="#FFFFFF">
        <tr>
          <td align="center" valign="top" style="font-size:0;">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

                    تاريخ الوصول 

                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

'.  $this->db->escape( date("Y-m-d H:m:s", strtotime($data['arrival_date']))) .'
                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
          </td>
        </tr>
      </table>
      <!--[if (gte mso 9)|(IE)]>
      </td>
      </tr>
      </table>
      <![endif]-->

    </td>
  </tr>
   <tr>
    <td align="center" valign="top" width="100%">

      <!--[if (gte mso 9)|(IE)]>
      <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
      <tr>
      <td align="center" valign="top" width="600">
      <![endif]-->
      <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;" bgcolor="#FFFFFF">
        <tr>
          <td align="center" valign="top" style="font-size:0;">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

                    تاريخ المغادرة 

                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

'.  $this->db->escape(  date("Y-m-d H:m:s", strtotime($data['departure_date']))) .'
                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
          </td>
        </tr>
      </table>
      <!--[if (gte mso 9)|(IE)]>
      </td>
      </tr>
      </table>
      <![endif]-->

    </td>
  </tr>
   <tr>
    <td align="center" valign="top" width="100%">

      <!--[if (gte mso 9)|(IE)]>
      <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
      <tr>
      <td align="center" valign="top" width="600">
      <![endif]-->
      <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;" bgcolor="#FFFFFF">
        <tr>
          <td align="center" valign="top" style="font-size:0;">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

                    رقم التلفون 

                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

'.  $this->db->escape($data['phone']) .'
                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
          </td>
        </tr>
      </table>
      <!--[if (gte mso 9)|(IE)]>
      </td>
      </tr>
      </table>
      <![endif]-->

    </td>
  </tr>
   <tr>
    <td align="center" valign="top" width="100%">

      <!--[if (gte mso 9)|(IE)]>
      <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
      <tr>
      <td align="center" valign="top" width="600">
      <![endif]-->
      <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;" bgcolor="#FFFFFF">
        <tr>
          <td align="center" valign="top" style="font-size:0;">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

                    الجنسيه 

                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

'.  $this->db->escape($data['country']) .'
                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
          </td>
        </tr>
      </table>
      <!--[if (gte mso 9)|(IE)]>
      </td>
      </tr>
      </table>
      <![endif]-->

    </td>
  </tr>
   <tr>
    <td align="center" valign="top" width="100%">

      <!--[if (gte mso 9)|(IE)]>
      <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
      <tr>
      <td align="center" valign="top" width="600">
      <![endif]-->
      <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;" bgcolor="#FFFFFF">
        <tr>
          <td align="center" valign="top" style="font-size:0;">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

                    عدد البالغين 

                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

'.  $this->db->escape($data['num_adults']) .'
                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
          </td>
        </tr>
      </table>
      <!--[if (gte mso 9)|(IE)]>
      </td>
      </tr>
      </table>
      <![endif]-->

    </td>
  </tr>
   <tr>
    <td align="center" valign="top" width="100%">

      <!--[if (gte mso 9)|(IE)]>
      <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
      <tr>
      <td align="center" valign="top" width="600">
      <![endif]-->
      <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;" bgcolor="#FFFFFF">
        <tr>
          <td align="center" valign="top" style="font-size:0;">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

                    عدد الاطفال  

                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            <td align="left" valign="top" width="295">
            <![endif]-->
            <div style="display:inline-block; max-width:295px; vertical-align:top; width:100%;">
              <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width:295px;" class="deviceWidth">
                <tr>
                  <td align="center" valign="top" style="font-size:14px;">

'.  $this->db->escape($data['num_children']) .'
                  </td>
                </tr>
              </table>
            </div>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
          </td>
        </tr>
      </table>
      <!--[if (gte mso 9)|(IE)]>
      </td>
      </tr>
      </table>
      <![endif]-->

    </td>
  </tr>
 

</table>
</center>
</body>
</html>';           
				$mail = new Mail($this->config->get('config_mail'));
				$mail->setTo($this->request->post['email']);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject(html_entity_decode(" السقاف للسياحة والسفر ماليزيا", ENT_QUOTES, 'UTF-8'));
				$mail->setHTML($message);
				$mail->send();

				

		 		$message = "<center><h2> New Booking : </h2></center>
							<br> Package ID  : " .(int)$data['itinerary_id'] . "
							<br> Customer Name  : " .  $this->db->escape($data['customer_name_ar']) . "
							<br> Arrival date  : " .  $this->db->escape( date("Y-m-d H:m:s", strtotime($data['arrival_date']))) . "
							<br> Departure date  : " .  $this->db->escape(  date("Y-m-d H:m:s", strtotime($data['departure_date']))) . "
							<br> Email  : " .  $this->db->escape($data['email']) . "
							<br> Phone  : " .  $this->db->escape($data['phone']) . "
							<br> Country  : " .  $this->db->escape($data['country']) . "
							<br> Adults  : " . (int)$data['num_adults'] . "
							<br> Children  : " . (int)$data['num_children'] . "
							<br> Bags  : " . (int)$data['num_bags'] . "
							<br> Notes  : " .  $this->db->escape($data['notes']);

				
				$mail = new Mail($this->config->get('config_mail'));
				$mail->setTo($this->config->get('config_email').',sales-1@alsakkaftravel.net,marketing@alsakkaftravel.net');
				$mail->setFrom($this->request->post['email']);
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject(html_entity_decode("New Booking", ENT_QUOTES, 'UTF-8'));
				$mail->setHTML($message);
				$mail->send();


				return 'done';

			}else{
				return 'error';
			}


		}

	}
	public function success($data){
			$this->document->setTitle('تم استلام طلبك بنجاح - شركة السقاف للسياحة والسفر ماليزيا');
		
				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');


			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/thanks.tpl')) {
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/thanks.tpl', $data));
				} else {
					$this->response->setOutput($this->load->view('default/template/content/thanks.tpl', $data));
			}

	}

}