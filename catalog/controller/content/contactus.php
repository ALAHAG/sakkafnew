	<?php
	class ControllerContentContactus extends Controller {


		public function index() {
			$this->document->setTitle('تواصل مع شركة السقاف للسياحة والسفر ');
			$this->document->setDescription("خدمة العملاء والاستفسارات لشركة السقاف للسياحة والسفر في ماليزيا 24/7 على مدار الساعه");//$this->config->get('config_meta_description')
			$this->document->setKeywords("شركو السقاف للسياحة والسفر ماليزيا , تواصل معنا ");//$this->config->get('config_meta_keyword')

			$this->document->addScript('http://maps.google.com/maps/api/js?sensor=false&amp;language=en');
	
			$data = array();
			$data['link_send_contact'] = $this->url->link('content/contactus/contact','','SSL');

			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/content/contactus.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/content/contactus.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/content/contactus.tpl', $data));
			}

		}



		public function contact()
		{

			if ($this->request->post) {




					if($this->request->post['email']){
			 		// $message = '<div style="text-align:center;font-size:20px;font-weight:bold;line-height:2;"><br><br><br>شكرا جزيلا  لحجزك معنا .....<br>
	     //                        تم استلام طلبك وسيتم تنسيق طلبك خلال 30 ساعة تقريبا<br>
	     //                        <br>
	     //                       نشكرك على ثقتك بنا.<br><br><br><br></div>';
	     //
	    			$message ='<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"><head>
	    <!--[if gte mso 9]><xml>
	     <o:OfficeDocumentSettings>
	      <o:AllowPNG/>
	      <o:PixelsPerInch>96</o:PixelsPerInch>
	     </o:OfficeDocumentSettings>
	    </xml><![endif]-->
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	    <meta name="viewport" content="width=device-width">
	    <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
	    <title></title>
	    <!--[if !mso]><!-- -->
		<!--<![endif]-->

	    <style type="text/css" id="media-query">
	      body {
	  margin: 0;
	  padding: 0; }

	table, tr, td {
	  vertical-align: top;
	  border-collapse: collapse; }

	.ie-browser table, .mso-container table {
	  table-layout: fixed; }

	* {
	  line-height: inherit; }

	a[x-apple-data-detectors=true] {
	  color: inherit !important;
	  text-decoration: none !important; }

	[owa] .img-container div, [owa] .img-container button {
	  display: block !important; }

	[owa] .fullwidth button {
	  width: 100% !important; }

	[owa] .block-grid .col {
	  display: table-cell;
	  float: none !important;
	  vertical-align: top; }

	.ie-browser .num12, .ie-browser .block-grid, [owa] .num12, [owa] .block-grid {
	  width: 515px !important; }

	.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {
	  line-height: 100%; }

	.ie-browser .mixed-two-up .num4, [owa] .mixed-two-up .num4 {
	  width: 168px !important; }

	.ie-browser .mixed-two-up .num8, [owa] .mixed-two-up .num8 {
	  width: 336px !important; }

	.ie-browser .block-grid.two-up .col, [owa] .block-grid.two-up .col {
	  width: 257px !important; }

	.ie-browser .block-grid.three-up .col, [owa] .block-grid.three-up .col {
	  width: 171px !important; }

	.ie-browser .block-grid.four-up .col, [owa] .block-grid.four-up .col {
	  width: 128px !important; }

	.ie-browser .block-grid.five-up .col, [owa] .block-grid.five-up .col {
	  width: 103px !important; }

	.ie-browser .block-grid.six-up .col, [owa] .block-grid.six-up .col {
	  width: 85px !important; }

	.ie-browser .block-grid.seven-up .col, [owa] .block-grid.seven-up .col {
	  width: 73px !important; }

	.ie-browser .block-grid.eight-up .col, [owa] .block-grid.eight-up .col {
	  width: 64px !important; }

	.ie-browser .block-grid.nine-up .col, [owa] .block-grid.nine-up .col {
	  width: 57px !important; }

	.ie-browser .block-grid.ten-up .col, [owa] .block-grid.ten-up .col {
	  width: 51px !important; }

	.ie-browser .block-grid.eleven-up .col, [owa] .block-grid.eleven-up .col {
	  width: 46px !important; }

	.ie-browser .block-grid.twelve-up .col, [owa] .block-grid.twelve-up .col {
	  width: 42px !important; }

	@media only screen and (min-width: 535px) {
	  .block-grid {
	    width: 515px !important; }
	  .block-grid .col {
	    vertical-align: top; }
	    .block-grid .col.num12 {
	      width: 515px !important; }
	  .block-grid.mixed-two-up .col.num4 {
	    width: 168px !important; }
	  .block-grid.mixed-two-up .col.num8 {
	    width: 336px !important; }
	  .block-grid.two-up .col {
	    width: 257px !important; }
	  .block-grid.three-up .col {
	    width: 171px !important; }
	  .block-grid.four-up .col {
	    width: 128px !important; }
	  .block-grid.five-up .col {
	    width: 103px !important; }
	  .block-grid.six-up .col {
	    width: 85px !important; }
	  .block-grid.seven-up .col {
	    width: 73px !important; }
	  .block-grid.eight-up .col {
	    width: 64px !important; }
	  .block-grid.nine-up .col {
	    width: 57px !important; }
	  .block-grid.ten-up .col {
	    width: 51px !important; }
	  .block-grid.eleven-up .col {
	    width: 46px !important; }
	  .block-grid.twelve-up .col {
	    width: 42px !important; } }

	@media (max-width: 535px) {
	  .block-grid, .col {
	    min-width: 320px !important;
	    max-width: 100% !important;
	    display: block !important; }
	  .block-grid {
	    width: calc(100% - 40px) !important; }
	  .col {
	    width: 100% !important; }
	    .col > div {
	      margin: 0 auto; }
	  img.fullwidth, img.fullwidthOnMobile {
	    max-width: 100% !important; }
	  .no-stack .col {
	    min-width: 0 !important;
	    display: table-cell !important; }
	  .no-stack.two-up .col {
	    width: 50% !important; }
	  .no-stack.mixed-two-up .col.num4 {
	    width: 33% !important; }
	  .no-stack.mixed-two-up .col.num8 {
	    width: 66% !important; }
	  .no-stack.three-up .col.num4 {
	    width: 33% !important; }
	  .no-stack.four-up .col.num3 {
	    width: 25% !important; }
	  .mobile_hide {
	    min-height: 0px;
	    max-height: 0px;
	    max-width: 0px;
	    display: none;
	    overflow: hidden;
	    font-size: 0px; } }

	    </style>
	</head>
	<body class="clean-body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #7B0462">
	  <style type="text/css" id="media-query-bodytag">
	    @media (max-width: 520px) {
	      .block-grid {
	        min-width: 320px!important;
	        max-width: 100%!important;
	        width: 100%!important;
	        display: block!important;
	      }

	      .col {
	        min-width: 320px!important;
	        max-width: 100%!important;
	        width: 100%!important;
	        display: block!important;
	      }

	        .col > div {
	          margin: 0 auto;
	        }

	      img.fullwidth {
	        max-width: 100%!important;
	      }
				img.fullwidthOnMobile {
	        max-width: 100%!important;
	      }
	      .no-stack .col {
					min-width: 0!important;
					display: table-cell!important;
				}
				.no-stack.two-up .col {
					width: 50%!important;
				}
				.no-stack.mixed-two-up .col.num4 {
					width: 33%!important;
				}
				.no-stack.mixed-two-up .col.num8 {
					width: 66%!important;
				}
				.no-stack.three-up .col.num4 {
					width: 33%!important;
				}
				.no-stack.four-up .col.num3 {
					width: 25%!important;
				}
	      .mobile_hide {
	        min-height: 0px!important;
	        max-height: 0px!important;
	        max-width: 0px!important;
	        display: none!important;
	        overflow: hidden!important;
	        font-size: 0px!important;
	      }
	    }
	  </style>
	  <!--[if IE]><div class="ie-browser"><![endif]-->
	  <!--[if mso]><div class="mso-container"><![endif]-->
	  <table class="nl-container" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #7B0462;width: 100%" cellpadding="0" cellspacing="0">
		<tbody>
		<tr style="vertical-align: top">
			<td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
	    <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #7B0462;"><![endif]-->

	    <div style="background-color:transparent;">
	      <div style="Margin: 0 auto;min-width: 320px;max-width: 515px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #5A0D5C;" class="block-grid ">
	        <div style="border-collapse: collapse;display: table;width: 100%;background-color:#5A0D5C;">
	          <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="background-color:transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width: 515px;"><tr class="layout-full-width" style="background-color:#5A0D5C;"><![endif]-->

	              <!--[if (mso)|(IE)]><td align="center" width="515" style=" width:515px; padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;" valign="top"><![endif]-->
	            <div class="col num12" style="min-width: 320px;max-width: 515px;display: table-cell;vertical-align: top;">
	              <div style="background-color: transparent; width: 100% !important;">
	              <!--[if (!mso)&(!IE)]><!--><div style="border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;"><!--<![endif]-->


	                    <div align="center" class="img-container center  autowidth  " style="padding-right: 0px;  padding-left: 0px;">
	<!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr style="line-height:0px;line-height:0px;"><td style="padding-right: 0px; padding-left: 0px;" align="center"><![endif]-->
	<div style="line-height:25px;font-size:1px">&#160;</div>  <img class="center  autowidth " align="center" border="0" src="https://alsakkaftravel.net/images/logo%20-%20Copy.png" alt="Image" title="Image" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: 0;height: auto;float: none;width: 100%;max-width: 506px" width="506">
	<!--[if mso]></td></tr></table><![endif]-->
	</div>



	                    <div class="">
		<!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding-right: 30px; padding-left: 30px; padding-top: 30px; padding-bottom: 15px;"><![endif]-->
		<div style="line-height:150%;font-family:TimesNewRoman, Times New Roman, Times, Beskerville, Georgia, serif;color:#FFFFFF; padding-right: 30px; padding-left: 30px; padding-top: 30px; padding-bottom: 15px;">
			<div style="font-family:TimesNewRoman, Times New Roman, Times, Beskerville, Georgia, serif;font-size:12px;line-height:18px;color:#FFFFFF;text-align:left;"><p style="margin: 0;font-size: 12px;line-height: 18px;text-align: center"><span style="font-size: 24px; line-height: 36px;"><strong><span style="color: rgb(255, 255, 255); line-height: 36px; font-size: 24px;">.شكراً جزيلاً لحجزك معنا&#160;</span></strong></span></p><p style="margin: 0;font-size: 12px;line-height: 18px;text-align: center"><br><span style="color: rgb(255, 255, 255); font-size: 20px; line-height: 30px;"> تم استلام طلبك وسيتم تنسيق طلبك خلال اقل من 24 ساعة تقريبا</span></p><p style="margin: 0;font-size: 12px;line-height: 18px;text-align: center"><br><span style="color: rgb(255, 255, 255); font-size: 24px; line-height: 36px;">.نشكرك على ثقتك بنا</span></p></div>
		</div>
		<!--[if mso]></td></tr></table><![endif]-->
	</div>



	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="divider " style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 100%;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">
	    <tbody>
	        <tr style="vertical-align: top">
	            <td class="divider_inner" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-right: 10px;padding-left: 10px;padding-top: 10px;padding-bottom: 10px;min-width: 100%;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">
	                <table class="divider_content" height="0px" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 4px solid #E1C207;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">
	                    <tbody>
	                        <tr style="vertical-align: top">
	                            <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">
	                                <span>&#160;</span>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </td>
	        </tr>
	    </tbody>
	</table>


	                    <div class="">
		<!--[if mso]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding-right: 0px; padding-left: 0px; padding-top: 0px; padding-bottom: 5px;"><![endif]-->
		<div style="line-height:150%;font-family: Tahoma, sans-serif;color:#5ACEE1; padding-right: 0px; padding-left: 0px; padding-top: 0px; padding-bottom: 5px;">
			<div style="line-height:18px;font-size:12px;color:#5ACEE1;font-family: Tahoma, sans-serif;text-align:left;"><p style="margin: 0;line-height: 18px;text-align: center;font-size: 12px">&#160;<br></p><p style="margin: 0;line-height: 18px;text-align: center;font-size: 12px"><span style="color: rgb(255, 255, 255); font-size: 12px; line-height: 18px;"><span style="font-size: 18px; line-height: 27px;"><span style="font-weight: 700; font-size: 18px; line-height: 27px;">:</span><strong>خدمة العملاء على مدار 24 ساعة على الارقام التالية</strong></span><span style="font-size: 18px; line-height: 27px;"></span></span></p><p style="margin: 0;line-height: 18px;text-align: center;font-size: 12px">&#160;<br></p><p style="margin: 0;line-height: 18px;text-align: center;font-size: 12px"><span style="font-size: 18px; line-height: 27px; color: rgb(255, 255, 255);"><strong>&#160;اتصال +&#160; وتس أب</strong></span></p><p style="margin: 0;line-height: 18px;text-align: center;font-size: 12px"><span style="font-size: 18px; line-height: 27px;"><strong><br><span style="color: rgb(255, 255, 255); font-size: 18px; line-height: 27px;"> 0060187770755</span><br><span style="color: rgb(255, 255, 255); font-size: 18px; line-height: 27px;"> 0060187770075</span><br><span style="color: rgb(255, 255, 255); font-size: 18px; line-height: 27px;"> 0060187776077</span><br></strong></span></p></div>
		</div>
		<!--[if mso]></td></tr></table><![endif]-->
	</div>

	              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
	              </div>
	            </div>
	          <!--[if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]-->
	        </div>
	      </div>
	    </div>    <div style="background-color:#5ACEE1;">
	      <div style="Margin: 0 auto;min-width: 320px;max-width: 515px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;" class="block-grid ">
	        <div style="border-collapse: collapse;display: table;width: 100%;background-color:transparent;">
	          <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="background-color:#5ACEE1;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width: 515px;"><tr class="layout-full-width" style="background-color:transparent;"><![endif]-->

	              <!--[if (mso)|(IE)]><td align="center" width="515" style=" width:515px; padding-right: 0px; padding-left: 0px; padding-top:0px; padding-bottom:0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;" valign="top"><![endif]-->
	            <div class="col num12" style="min-width: 320px;max-width: 515px;display: table-cell;vertical-align: top;">
	              <div style="background-color: transparent; width: 100% !important;">
	              <!--[if (!mso)&(!IE)]><!--><div style="border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top:0px; padding-bottom:0px; padding-right: 0px; padding-left: 0px;"><!--<![endif]-->



	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="divider " style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 100%;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">
	    <tbody>
	        <tr style="vertical-align: top">
	            <td class="divider_inner" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-right: 0px;padding-left: 0px;padding-top: 0px;padding-bottom: 0px;min-width: 100%;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">
	                <table class="divider_content" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 0px solid transparent;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">
	                    <tbody>
	                        <tr style="vertical-align: top">
	                            <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%">
	                                <span></span>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </td>
	        </tr>
	    </tbody>
	</table>

	              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
	              </div>
	            </div>
	          <!--[if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]-->
	        </div>
	      </div>
	    </div>    <div style="background-color:#CCD7D9;">
	      <div style="Margin: 0 auto;min-width: 320px;max-width: 515px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #CCD7D9;" class="block-grid ">
	        <div style="border-collapse: collapse;display: table;width: 100%;background-color:#CCD7D9;">
	          <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="background-color:#CCD7D9;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width: 515px;"><tr class="layout-full-width" style="background-color:#CCD7D9;"><![endif]-->

	              <!--[if (mso)|(IE)]><td align="center" width="515" style=" width:515px; padding-right: 0px; padding-left: 0px; padding-top:5px; padding-bottom:5px; border-top: 0px solid #5ACEE1; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent;" valign="top"><![endif]-->
	            <div class="col num12" style="min-width: 320px;max-width: 515px;display: table-cell;vertical-align: top;">
	              <div style="background-color: transparent; width: 100% !important;">
	              <!--[if (!mso)&(!IE)]><!--><div style="border-top: 0px solid #5ACEE1; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top:5px; padding-bottom:5px; padding-right: 0px; padding-left: 0px;"><!--<![endif]-->



	<div align="center" style="padding-right: 25px; padding-left: 25px; padding-bottom: 25px;" class="">
	  <div style="line-height:25px;font-size:1px">&#160;</div>
	  <div style="display: table; max-width:233px;">
	  <!--[if (mso)|(IE)]><table width="183" cellpadding="0" cellspacing="0" border="0"><tr><td style="border-collapse:collapse; padding-right: 25px; padding-left: 25px; padding-bottom: 25px;"  align="center"><table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse; mso-table-lspace: 0pt;mso-table-rspace: 0pt; width:183px;"><tr><td width="32" style="width:32px; padding-right: 10px;" valign="top"><![endif]-->
	    <table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;Margin-right: 10px">
	      <tbody><tr style="vertical-align: top"><td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
	        <a href="https://www.facebook.com/Sakkaftravel" title="Facebook" target="_blank">
	          <img src="https://alsakkaftravel.net/images/facebook@2x.png" alt="Facebook" title="Facebook" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">
	        </a>
	      <div style="line-height:5px;font-size:1px">&#160;</div>
	      </td></tr>
	    </tbody></table>
	      <!--[if (mso)|(IE)]></td><td width="32" style="width:32px; padding-right: 10px;" valign="top"><![endif]-->
	    <table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;Margin-right: 10px">
	      <tbody><tr style="vertical-align: top"><td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
	        <a href="https://twitter.com/alsakkaftravel1" title="Twitter" target="_blank">
	          <img src="https://alsakkaftravel.net/images/twitter@2x.png" alt="Twitter" title="Twitter" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">
	        </a>
	      <div style="line-height:5px;font-size:1px">&#160;</div>
	      </td></tr>
	    </tbody></table>
	      <!--[if (mso)|(IE)]></td><td width="32" style="width:32px; padding-right: 10px;" valign="top"><![endif]-->
	    <table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;Margin-right: 10px">
	      <tbody><tr style="vertical-align: top"><td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
	        <a href="https://instagram.com/alsakkaf_travel" title="Instagram" target="_blank">
	          <img src="https://alsakkaftravel.net/images/instagram@2x.png" alt="Instagram" title="Instagram" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">
	        </a>
	      <div style="line-height:5px;font-size:1px">&#160;</div>
	      </td></tr>
	    </tbody></table>
	      <!--[if (mso)|(IE)]></td><td width="32" style="width:32px; padding-right: 0;" valign="top"><![endif]-->
	    <table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;Margin-right: 0">
	      <tbody><tr style="vertical-align: top"><td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
	        <a href="https://www.youtube.com/channel/UCZgsgZah-yWILj-D0K385-w" title="YouTube" target="_blank">
	          <img src="https://alsakkaftravel.net/images/youtube@2x.png" alt="YouTube" title="YouTube" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">
	        </a>
	      <div style="line-height:5px;font-size:1px">&#160;</div>
	      </td></tr>
	    </tbody></table>
	    <!--[if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]-->
	  </div>
	</div>

	              <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
	              </div>
	            </div>
	          <!--[if (mso)|(IE)]></td></tr></table></td></tr></table><![endif]-->
	        </div>
	      </div>
	    </div>   <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
			</td>
	  </tr>
	  </tbody>
	  </table>
	  <!--[if (mso)|(IE)]></div><![endif]-->


	</body></html>';
					$mail = new Mail($this->config->get('config_mail'));
					$mail->setTo($this->request->post['email']);
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender($this->config->get('config_name'));
					$mail->setSubject(html_entity_decode(" السقاف للسياحة والسفر ماليزيا", ENT_QUOTES, 'UTF-8').'-'.$this->db->escape($data['subject']));
					$mail->setHTML($message);
					$mail->send();
					}
					$data = $this->request->post;
			 		$message = "<center><h2> Contact Form : </h2></center>
								<br> Customer Name  : " .  $this->db->escape($data['name']) . "
								<br> Email  : " .  $this->db->escape($data['email']) . "
								<br> subject  : " .  $this->db->escape($data['subject']) . "
								<br> message  : " .  $this->db->escape($data['message']);



					$sentFrom='';
					if($this->request->post['email']){
						$sentFrom=$this->request->post['email'];
					}else{
						$sentFrom='no-replay@alsakkaftravel.net';

					}
					$mail = new Mail($this->config->get('config_mail'));

					// $mail->setTo($this->config->get('config_email'));
					$mail->setTo($this->config->get('config_email').',marketing@alsakkaftravel.net');
					$mail->setFrom($sentFrom);
					$mail->setSender($this->config->get('config_name'));
					$mail->setSubject(html_entity_decode('New Contact', ENT_QUOTES, 'UTF-8').'-'.$this->db->escape($data['subject']));
					$mail->setHTML($message);
					$mail->send();

					return 'done';
				}else{
					return 'error';
				}

			}



	}
	?>
