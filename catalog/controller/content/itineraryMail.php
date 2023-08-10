<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require 'vendor/autoload.php';

class ControllerContentItinerary extends Controller {

	public function index() {



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
			// $x=reset($this->request->get['category']);
			$x=$this->request->get['category'];

			$cat_options = array('category_type' => 1 // Package Categories
			);
			$package_categories = $this->model_content_category->getAllData($cat_options);
			foreach ($package_categories  as $key => $value) {

				if($value['category_id'] == $x){
					$category_title=$value['title'];
					$category_meta_title=$value['Meta_title'];
					$category_meta_descripions=$value['Meta_descripions'];
				}

			}
		}
		// print_r($category_title);
		if(!empty($category_meta_title)){
			$this->document->setTitle($category_meta_title);
		}else{
			$this->document->setTitle('عروض سياحية الى ماليزيا لعام 2018 - عروض شهر العسل الى ماليزيا - عروض عائلية - برامج سياحية - بكجات سياحية - فنادق ماليزيا - honeymoon in malaysia');
		}

		if(!empty($category_meta_descripions)){
			$this->document->setDescription($category_meta_descripions);

		}else{
			 $this->document->setDescription("افضل العروض السياحية الى ماليزيا لعام 2018 شاملة فنادق ومواصلات وجولات سياحية في افضل المدن الماليزيه  honeymoon in malaysia");//$this->config->get('config_meta_description')

		}
		$this->document->setKeywords("عروض سياحة الى ماليزيا , برامج سياحية ,باقات سياحية ,شهر عسل في ماليزيا ,رحلة العمر ,جزر ماليزيا , honeymoon in malaysia ,packages in malaysia");//$this->config->get('config_meta_keyword')

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
		if(isset($this->request->get['night']) && !empty($this->request->get['night'])){
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
			if(isset($this->request->get['night']) && !empty($this->request->get['night']) ){
				$link=substr($link, 0, strrpos($link, "&night"));
				$night_value='&night={night}';
			}else{
				$night_value='';

			}
			if(isset($this->request->get['page'])){
				$link=substr($link, 0, strrpos($link, "&page"));
				$page_value='&page={page}';
			}
			else{
				$page_value='&page={page}';

			}
			$pagination->url = $link . $night_value.$page_value;
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
				$this->document->setTitle($package['itinerary_title'] . " , ماليزيا , عروض سياحية الى ماليزيا , بكجات سياحية ");

		$this->document->setDescription($package['itinerary_title'] ." , فنادق ماليزيا , افضل العروض السياحية الى ماليزيا لعام 2018 شاملة فنادق ومواصلات وجولات سياحية في افضل المدن الماليزيه ");//$this->config->get('config_meta_description')
		$this->document->setKeywords($package['itinerary_title'] ." , فنادق ماليزيا عروض سياحة الى ماليزيا , برامج سياحية ,باقات سياحية ,شهر عسل في ماليزيا ,رحلة العمر ,جزر ماليزيا");


				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');
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

  		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

// echo $details->city;
		if ($this->request->post) {
			$this->load->model('content/itinerary');
			// dd($this->request->post);
			// $ip = $_SERVER['REMOTE_ADDR'];
			// $query = @unserialize(file_get_contents('http://ip-api.com/php/'.$ip));
			// if($query && $query['status'] == 'success') {
			// $city= $query ['country'].', '.$query['city'].'!';
			// // 'My IP: '.$query['query'].', '.$query['regionName'].', '.$query['isp'].', '.$query['org'].', '.
			// } else {
			// $city= 'Unable to get location';
			// }



			$booking =  $this->model_content_itinerary->addBooking($this->request->post);
			if($booking){
				if($this->request->post['email']){
		 		// $message = '<div style="color: #fff;background: #7B0462;text-align:center;font-size:20px;font-weight:bold;line-height:2;"><br><br><br>شكرا جزيلا  لحجزك معنا <br>
     //                        تم استلام طلبك وسيتم تنسيق طلبك خلال اقل من 24 ساعة تقريبا<br>
     //                        <br>
     //                       .نشكرك على ثقتك بنا<br><br><br><br></div>';
				          $message ='<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"><head><!--[if gte mso 9]><xml> <o:OfficeDocumentSettings>  <o:AllowPNG/>  <o:PixelsPerInch>96</o:PixelsPerInch> </o:OfficeDocumentSettings></xml><![endif]--><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta name="viewport" content="width=device-width"><!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]--><title></title><!--[if !mso]><!-- -->
  <!--<![endif]--><style type="text/css" id="media-query">  body {
  margin: 0;
  padding: 0; }table, tr, td {
  vertical-align: top;
  border-collapse: collapse; }.ie-browser table, .mso-container table {
  table-layout: fixed; }* {
  line-height: inherit; }a[x-apple-data-detectors=true] {
  color: inherit !important;
  text-decoration: none !important; }[owa] .img-container div, [owa] .img-container button {
  display: block !important; }[owa] .fullwidth button {
  width: 100% !important; }[owa] .block-grid .col {
  display: table-cell;
  float: none !important;
  vertical-align: top; }.ie-browser .num12, .ie-browser .block-grid, [owa] .num12, [owa] .block-grid {
  width: 515px !important; }.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {
  line-height: 100%; }.ie-browser .mixed-two-up .num4, [owa] .mixed-two-up .num4 {
  width: 168px !important; }.ie-browser .mixed-two-up .num8, [owa] .mixed-two-up .num8 {
  width: 336px !important; }.ie-browser .block-grid.two-up .col, [owa] .block-grid.two-up .col {
  width: 257px !important; }.ie-browser .block-grid.three-up .col, [owa] .block-grid.three-up .col {
  width: 171px !important; }.ie-browser .block-grid.four-up .col, [owa] .block-grid.four-up .col {
  width: 128px !important; }.ie-browser .block-grid.five-up .col, [owa] .block-grid.five-up .col {
  width: 103px !important; }.ie-browser .block-grid.six-up .col, [owa] .block-grid.six-up .col {
  width: 85px !important; }.ie-browser .block-grid.seven-up .col, [owa] .block-grid.seven-up .col {
  width: 73px !important; }.ie-browser .block-grid.eight-up .col, [owa] .block-grid.eight-up .col {
  width: 64px !important; }.ie-browser .block-grid.nine-up .col, [owa] .block-grid.nine-up .col {
  width: 57px !important; }.ie-browser .block-grid.ten-up .col, [owa] .block-grid.ten-up .col {
  width: 51px !important; }.ie-browser .block-grid.eleven-up .col, [owa] .block-grid.eleven-up .col {
  width: 46px !important; }.ie-browser .block-grid.twelve-up .col, [owa] .block-grid.twelve-up .col {
  width: 42px !important; }@media only screen and (min-width: 535px) {
  .block-grid {width: 515px !important; }
  .block-grid .col {vertical-align: top; }.block-grid .col.num12 {  width: 515px !important; }
  .block-grid.mixed-two-up .col.num4 {width: 168px !important; }
  .block-grid.mixed-two-up .col.num8 {width: 336px !important; }
  .block-grid.two-up .col {width: 257px !important; }
  .block-grid.three-up .col {width: 171px !important; }
  .block-grid.four-up .col {width: 128px !important; }
  .block-grid.five-up .col {width: 103px !important; }
  .block-grid.six-up .col {width: 85px !important; }
  .block-grid.seven-up .col {width: 73px !important; }
  .block-grid.eight-up .col {width: 64px !important; }
  .block-grid.nine-up .col {width: 57px !important; }
  .block-grid.ten-up .col {width: 51px !important; }
  .block-grid.eleven-up .col {width: 46px !important; }
  .block-grid.twelve-up .col {width: 42px !important; } }@media (max-width: 535px) {
  .block-grid, .col {min-width: 320px !important;max-width: 100% !important;display: block !important; }
  .block-grid {width: calc(100% - 40px) !important; }
  .col {width: 100% !important; }.col > div {  margin: 0 auto; }
  img.fullwidth, img.fullwidthOnMobile {max-width: 100% !important; }
  .no-stack .col {min-width: 0 !important;display: table-cell !important; }
  .no-stack.two-up .col {width: 50% !important; }
  .no-stack.mixed-two-up .col.num4 {width: 33% !important; }
  .no-stack.mixed-two-up .col.num8 {width: 66% !important; }
  .no-stack.three-up .col.num4 {width: 33% !important; }
  .no-stack.four-up .col.num3 {width: 25% !important; }
  .mobile_hide {min-height: 0px;max-height: 0px;max-width: 0px;display: none;overflow: hidden;font-size: 0px; } }
</style>
</head>
<body class="clean-body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #7B0462">
  <style type="text/css" id="media-query-bodytag">@media (max-width: 520px) {  .block-grid {    min-width: 320px!important;    max-width: 100%!important;    width: 100%!important;    display: block!important;  }
  .col {    min-width: 320px!important;    max-width: 100%!important;    width: 100%!important;    display: block!important;  }.col > div {      margin: 0 auto;    }
  img.fullwidth {    max-width: 100%!important;  }  img.fullwidthOnMobile {    max-width: 100%!important;  }  .no-stack .col {    min-width: 0!important;    display: table-cell!important;  }  .no-stack.two-up .col {    width: 50%!important;  }  .no-stack.mixed-two-up .col.num4 {    width: 33%!important;  }  .no-stack.mixed-two-up .col.num8 {    width: 66%!important;  }  .no-stack.three-up .col.num4 {    width: 33%!important;  }  .no-stack.four-up .col.num3 {    width: 25%!important;  }  .mobile_hide {    min-height: 0px!important;    max-height: 0px!important;    max-width: 0px!important;    display: none!important;    overflow: hidden!important;    font-size: 0px!important;  }}
  </style>
  <!--[if IE]><div class="ie-browser"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table class="nl-container" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #7B0462;width: 100%" cellpadding="0" cellspacing="0">
  <tbody>
  <tr style="vertical-align: top"><td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top"><!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #7B0462;"><![endif]-->
<div style="background-color:transparent;">  <div style="Margin: 0 auto;min-width: 320px;max-width: 515px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #5A0D5C;" class="block-grid ">    <div style="border-collapse: collapse;display: table;width: 100%;background-color:#5A0D5C;">      <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="background-color:transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width: 515px;"><tr class="layout-full-width" style="background-color:#5A0D5C;"><![endif]-->      <!--[if (mso)|(IE)]><td align="center" width="515" style=" width:515px; padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;" valign="top"><![endif]-->        <div class="col num12" style="min-width: 320px;max-width: 515px;display: table-cell;vertical-align: top;">          <div style="background-color: transparent; width: 100% !important;">          <!--[if (!mso)&(!IE)]><!--><div style="border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;"><!--<![endif]-->                          <div align="center" class="img-container center  autowidth  " style="padding-right: 0px;  padding-left: 0px;">
<!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr style="line-height:0px;line-height:0px;"><td style="padding-right: 0px; padding-left: 0px;" align="center"><![endif]-->
<div style="line-height:25px;font-size:1px">&#160;</div>  <img class="center  autowidth " align="center" border="0" src="https://alsakkaftravel.net/images/logo%20-%20Copy.png" alt="Image" title="Image" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: 0;height: auto;float: none;width: 100%;max-width: 506px" width="506">
<!--[if mso]></td></tr></table><![endif]-->
</div>                                        <div class="">
  <!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding-right: 30px; padding-left: 30px; padding-top: 30px; padding-bottom: 15px;"><![endif]-->
  <div style="line-height:150%;font-family:TimesNewRoman, Times New Roman, Times, Beskerville, Georgia, serif;color:#FFFFFF; padding-right: 30px; padding-left: 30px; padding-top: 30px; padding-bottom: 15px;">  <div style="font-family:TimesNewRoman, Times New Roman, Times, Beskerville, Georgia, serif;font-size:12px;line-height:18px;color:#FFFFFF;text-align:left;"><p style="margin: 0;font-size: 12px;line-height: 18px;text-align: center"><span style="font-size: 24px; line-height: 36px;"><strong><span style="color: rgb(255, 255, 255); line-height: 36px; font-size: 24px;">.شكراً جزيلاً لحجزك معنا&#160;</span></strong></span></p><p style="margin: 0;font-size: 12px;line-height: 18px;text-align: center"><br><span style="color: rgb(255, 255, 255); font-size: 20px; line-height: 30px;"> تم استلام طلبك وسيتم تنسيق طلبك خلال اقل من 24 ساعة تقريبا</span></p><p style="margin: 0;font-size: 12px;line-height: 18px;text-align: center"><br><span style="color: rgb(255, 255, 255); font-size: 24px; line-height: 36px;">.نشكرك على ثقتك بنا</span></p></div>
  </div>
  <!--[if mso]></td></tr></table><![endif]-->
</div>
<table border="0" cellpadding="0" cellspacing="0" width="100%" class="divider " style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 100%;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%"><tbody>    <tr style="vertical-align: top">        <td class="divider_inner" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-right: 10px;padding-left: 10px;padding-top: 10px;padding-bottom: 10px;min-width: 100%;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">            <table class="divider_content" height="0px" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 4px solid #E1C207;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">                <tbody>                    <tr style="vertical-align: top">                        <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">                            <span>&#160;</span>                        </td>                    </tr>                </tbody>            </table>        </td>    </tr></tbody>
</table>                                            <div class="">
  <!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding-right: 0px; padding-left: 0px; padding-top: 0px; padding-bottom: 5px;"><![endif]-->
  <div style="line-height:150%;font-family: Tahoma, sans-serif;color:#5ACEE1; padding-right: 0px; padding-left: 0px; padding-top: 0px; padding-bottom: 5px;"> <div style="line-height:18px;font-size:12px;color:#5ACEE1;font-family: Tahoma, sans-serif;text-align:left;"><p style="margin: 0;line-height: 18px;text-align: center;font-size: 12px">&#160;<br></p><p style="margin: 0;line-height: 18px;text-align: center;font-size: 12px"><span style="color: rgb(255, 255, 255); font-size: 12px; line-height: 18px;"><span style="font-size: 18px; line-height: 27px;"><span style="font-weight: 700; font-size: 18px; line-height: 27px;">:</span><strong>خدمة العملاء على مدار 24 ساعة على الارقام التالية</strong></span><span style="font-size: 18px; line-height: 27px;"></span></span></p><p style="margin: 0;line-height: 18px;text-align: center;font-size: 12px">&#160;<br></p><p style="margin: 0;line-height: 18px;text-align: center;font-size: 12px"><span style="font-size: 18px; line-height: 27px; color: rgb(255, 255, 255);"><strong>&#160;اتصال +&#160; وتس أب</strong></span></p><p style="margin: 0;line-height: 18px;text-align: center;font-size: 12px"><span style="font-size: 18px; line-height: 27px;"><strong><br><span style="color: rgb(255, 255, 255); font-size: 18px; line-height: 27px;"> 0060187770755</span><br><span style="color: rgb(255, 255, 255); font-size: 18px; line-height: 27px;"> 0060187770075</span><br><span style="color: rgb(255, 255, 255); font-size: 18px; line-height: 27px;"> 0060187776077</span><br></strong></span></p></div>
  </div>
  <!--[if mso]></td></tr></table><![endif]-->
</div>                        <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->          </div>        </div>      <!--[if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]-->    </div>  </div></div>    <div style="background-color:#5ACEE1;">  <div style="Margin: 0 auto;min-width: 320px;max-width: 515px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;" class="block-grid ">    <div style="border-collapse: collapse;display: table;width: 100%;background-color:transparent;">      <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="background-color:#5ACEE1;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width: 515px;"><tr class="layout-full-width" style="background-color:transparent;"><![endif]-->      <!--[if (mso)|(IE)]><td align="center" width="515" style=" width:515px; padding-right: 0px; padding-left: 0px; padding-top:0px; padding-bottom:0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;" valign="top"><![endif]-->        <div class="col num12" style="min-width: 320px;max-width: 515px;display: table-cell;vertical-align: top;">          <div style="background-color: transparent; width: 100% !important;">          <!--[if (!mso)&(!IE)]><!--><div style="border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;"><!--<![endif]-->
<table border="0" cellpadding="0" cellspacing="0" width="100%" class="divider " style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 100%;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%"><tbody>    <tr style="vertical-align: top">        <td class="divider_inner" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-right: 0px;padding-left: 0px;padding-top: 0px;padding-bottom: 0px;min-width: 100%;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">            <table class="divider_content" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 0px solid transparent;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">                <tbody>                    <tr style="vertical-align: top">                        <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">                            <span></span>                        </td>                    </tr>                </tbody>            </table>        </td>    </tr></tbody>
</table>                        <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->          </div>        </div>      <!--[if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]-->    </div>  </div></div>    <div style="background-color:#CCD7D9;">  <div style="Margin: 0 auto;min-width: 320px;max-width: 515px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #CCD7D9;" class="block-grid ">    <div style="border-collapse: collapse;display: table;width: 100%;background-color:#CCD7D9;">      <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="background-color:#CCD7D9;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width: 515px;"><tr class="layout-full-width" style="background-color:#CCD7D9;"><![endif]-->      <!--[if (mso)|(IE)]><td align="center" width="515" style=" width:515px; padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px; border-top: 0px solid #5ACEE1; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;" valign="top"><![endif]-->        <div class="col num12" style="min-width: 320px;max-width: 515px;display: table-cell;vertical-align: top;">          <div style="background-color: transparent; width: 100% !important;">          <!--[if (!mso)&(!IE)]><!--><div style="border-top: 0px solid #5ACEE1; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;"><!--<![endif]-->
<div align="center" style="padding-right: 25px; padding-left: 25px; padding-bottom: 25px;" class="">
  <div style="line-height:25px;font-size:1px">&#160;</div>
  <div style="display: table; max-width:233px;">
  <!--[if (mso)|(IE)]><table width="183" cellpadding="0" cellspacing="0" border="0"><tr><td style="border-collapse:collapse; padding-right: 25px; padding-left: 25px; padding-bottom: 25px;"  align="center"><table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse; mso-table-lspace: 0pt;mso-table-rspace: 0pt; width:183px;"><tr><td width="32" style="width:32px; padding-right: 10px;" valign="top"><![endif]--><table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;Margin-right: 10px">  <tbody><tr style="vertical-align: top"><td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">    <a href="https://www.facebook.com/Sakkaftravel" title="Facebook" target="_blank">      <img src="https://alsakkaftravel.net/images/facebook@2x.png" alt="Facebook" title="Facebook" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">    </a>  <div style="line-height:5px;font-size:1px">&#160;</div>  </td></tr></tbody></table>  <!--[if (mso)|(IE)]></td><td width="32" style="width:32px; padding-right: 10px;" valign="top"><![endif]--><table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;Margin-right: 10px">  <tbody><tr style="vertical-align: top"><td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">    <a href="https://twitter.com/alsakkaftravel1" title="Twitter" target="_blank">      <img src="https://alsakkaftravel.net/images/twitter@2x.png" alt="Twitter" title="Twitter" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">    </a>  <div style="line-height:5px;font-size:1px">&#160;</div>  </td></tr></tbody></table>  <!--[if (mso)|(IE)]></td><td width="32" style="width:32px; padding-right: 10px;" valign="top"><![endif]--><table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;Margin-right: 10px">  <tbody><tr style="vertical-align: top"><td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">    <a href="https://instagram.com/alsakkaf_travel" title="Instagram" target="_blank">      <img src="https://alsakkaftravel.net/images/instagram@2x.png" alt="Instagram" title="Instagram" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">    </a>  <div style="line-height:5px;font-size:1px">&#160;</div>  </td></tr></tbody></table>  <!--[if (mso)|(IE)]></td><td width="32" style="width:32px; padding-right: 0;" valign="top"><![endif]--><table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;Margin-right: 0">  <tbody><tr style="vertical-align: top"><td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">    <a href="https://www.youtube.com/channel/UCZgsgZah-yWILj-D0K385-w" title="YouTube" target="_blank">      <img src="https://alsakkaftravel.net/images/youtube@2x.png" alt="YouTube" title="YouTube" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">    </a>  <div style="line-height:5px;font-size:1px">&#160;</div>  </td></tr></tbody></table><!--[if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]-->
  </div>
</div>                        <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->          </div>        </div>      <!--[if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]-->    </div>  </div></div>   <!--[if (mso)|(IE)]></td></tr></table><![endif]--></td>
  </tr>
  </tbody>
  </table>
  <!--[if (mso)|(IE)]></div><![endif]-->
</body></html>';
				// $mail = new Mail($this->config->get('config_mail'));
				// $mail->setTo($this->request->post['email']);
				// $mail->setFrom($this->config->get('config_email'));
				// $mail->setSender($this->config->get('config_name'));
				// $mail->setSubject(html_entity_decode(" السقاف للسياحة والسفر ماليزيا", ENT_QUOTES, 'UTF-8'));
				// $mail->setHTML($message);
				// $mail->send();
/*				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = '14.102.148.51';
				$mail->smtp_username = 'marketing@alsakkaftravel.net';
				$mail->smtp_password = html_entity_decode(']V7n7j3iheGi', ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = 2525;
				$mail->smtp_timeout = 5;
				$mail->setTo($this->request->post['email']);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setSubject(html_entity_decode(" السقاف للسياحة والسفر ماليزيا", ENT_QUOTES, 'UTF-8'));
				$mail->setHTML($message);

				$mail->send(); */

				}
				$data = $this->request->post;

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
							<br> URL  : " . $server.'index.php?route=content/itinerary/show&content_id='.(int)$data['itinerary_id'] . "

							<br> Notes  : ". $this->db->escape($data['notes']);

							// <br> User Info  : ". $city."

				$sentFrom='';
				if($this->request->post['email']){
					$sentFrom=$this->request->post['email'];
				}else{
					$sentFrom='no-replay@alsakkaftravel.net';

				}
// $mg = Mailgun::create('8fac17e1ee08280dfb7a46de0c0e9070-1053eade-8e434452');
//
//
// $mg->messages()->send('alsakkaftravel.net', [
//   'from'    => 'marketing@alsakkaftravel.net',
//   'to'      => 'sales-3@alsakkaftravel.net',
//   'subject' => (html_entity_decode("New Booking", ENT_QUOTES, 'UTF-8'),
//   'text'    => $message
// ]);

$mail = new PHPMailer();                              // Passing `true` enables exceptions
try {
    //Server settings
    $mail->SMTPDebug = 2;                                 // Enable verbose debug output
    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->Host = 'mail.alsakkaftravel.net';  // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;                               // Enable SMTP authentication
    $mail->Username = 'marketing@alsakkaftravel.net';                 // SMTP username
    $mail->Password = ']V7n7j3iheGi';                           // SMTP password
    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 587;                                    // TCP port to connect to
    $subject="السقاف للسياحة والسفر ";
      //Recipients
    $mail->setFrom($sentFrom, '=?utf-8?B?'.base64_encode($subject).'?=');
    $mail->addAddress('marketing@alsakkaftravel.net');     // Add a recipient
    $mail->addAddress('alahag85@gmail.com');     // Add a recipient
    // $mail->addAddress('sales-2@alsakkaftravel.net');     // Add a recipient
    $mail->addReplyTo('booking@alsakkaftravel.net', ' Booking');
    //$mail->addCC('cc@example.com');
    //$mail->addBCC('bcc@example.com');


    //Content
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = "New Booking ";
    $mail->Body    = $message;
    $mail->AltBody = 'Ur account did nt support HTML';

    $mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
}



				// $mail = new Mail($this->config->get('config_mail'));
				//
				// //$mail->setTo($this->config->get('config_email'));
				// $mail->setTo($this->config->get('config_email').',sales-3@alsakkaftravel.net,marketing@alsakkaftravel.net');
				// $mail->setFrom($sentFrom);
				// $mail->setSender($this->config->get('config_name'));
				// $mail->setSubject(html_entity_decode("New Booking", ENT_QUOTES, 'UTF-8'));
				// $mail->setHTML($message);
				// $mail->send();


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
