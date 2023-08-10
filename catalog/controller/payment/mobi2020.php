<?php
class ControllerPaymentMobi extends Controller {
	public function index() {
		// $this->load->language('extension/payment/mobi');
    $data['link_send_payment'] = $this->url->link('payment/mobi/send');
		$data['link_payment_reply'] = $this->url->link('payment/mobi/send');
		$data['link_payment_callback'] = $this->url->link('payment/mobi/callback');
		if(isset($this->request->post['submit']))
		{
			$data['customer_data'] = $this->request->post;

		}
		$data['months'] = array();

		for ($i = 1; $i <= 12; $i++) {
			$data['months'][] = array(
				'text'  => strftime('%B', mktime(0, 0, 0, $i, 1, 2000)),
				'value' => sprintf('%02d', $i)
			);
		}
		$today = getdate();

		$data['year_expire'] = array();

		for ($i = $today['year']; $i < $today['year'] + 11; $i++) {
			$data['year_expire'][] = array(
				'text'  => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)),
				'value' => strftime('%Y', mktime(0, 0, 0, 1, 1, $i))
			);
		}
    $data['footer'] = $this->load->controller('common/footer');
    $data['header'] = $this->load->controller('common/header');
    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/mobi.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/payment/mobi.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/payment/mobi.tpl', $data));
		}

    // if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/mobi.tpl')) {
    //   return($this->load->view($this->config->get('config_template') . '/template/payment/mobi.tpl', $data));
    // } else {
    //   return($this->load->view('default/template/payment/mobi.tpl', $data));
    // }
		// return $this->load->view('payment/mobi', $data);
	}

public function send() {
// session_start();
if(isset($this->request->post['submit']))
{
    $apiKey = ApiKey;
    $loginID = LoginID;
    $payModeURL = PaymentMode;

    $order_info = $this->request->post['order_id'];

        $key = substr($apiKey, 0, 16);
        $iv = substr($apiKey, -16);
        $aes = 'aes-128-cbc';


  	$pass = $this->request->post['cardnum'].'#'.$this->request->post['ccv'].'#'.substr($this->request->post['exp_yy'], -2).$this->request->post['exp_mm'];

	// $encrypted = base64_encode(openssl_encrypt($pass, 'aes-128-cbc', substr($_SESSION['apiKey'], 0, 16), OPENSSL_RAW_DATA, substr($_SESSION['apiKey'], -16)));
  $encrypted = base64_encode(openssl_encrypt($pass, $aes, $key, OPENSSL_RAW_DATA, $iv));

    $chckAmount=is_numeric($this->request->post['amount']) && floor($this->request->post['amount']) != $this->request->post['amount'];
    $am = $this->request->post['amount'];


    if($am !='')
    {

        if($chckAmount==1)
        {
            $s2 = str_replace(".","", number_format($am, 2, '.', ''));
            $s3 = strlen($s2);
            $f1 = 12 - $s3;
            $amt1 = "";
            for($i=0; $i<$f1; $i++)
            {
                $amt1 .= "0";
            }
            $famt = $amt1.$s2;
        }
        else
        {
            $str='000000000000';
            $finalStr=substr($str, strlen(round($am))+2);
            $famt = $finalStr.round($am).'00';
        }
    }
    else
    {
         $famt = '000000000000';
    }

	$data=array("service"=>"ECOMAPI_SALE_REQ","ip"=>$this->request->post['ip'],"mUrl"=>$this->request->post['mUrl'],"firstName"=>$this->request->post['firstName'], "lastName"=>$this->request->post['lastName'],"nameOnCard"=>$this->request->post['nameOnCard'],
  "postalCode"=>$this->request->post['postalCode'],"shippingState"=>$this->request->post['shippingState'],"orderId"=>$this->request->post['ordrid'], "amount"=>$famt, "email"=>$this->request->post['emailid'], "carddetails"=>strtoupper(implode(unpack("H*", $encrypted))));

  $this->session->data['carddetails']=strtoupper(implode(unpack("H*", $encrypted)));
  $ch = curl_init();
      curl_setopt($ch, CURLOPT_URL,$payModeURL);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

      $headers = array("mobiApiKey:".$apiKey, "loginId:".$loginID);
      curl_setopt($ch, CURLOPT_POST, 1);
      curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER , false);

      $server_output = curl_exec ($ch);
      if (curl_errno($ch)) {
         $json['curl_error'] = curl_error($ch);
      }
  $json = array();
      curl_close ($ch);
      $fresult=json_decode($server_output, true);

      if(isset($fresult['responseData']['paReq']))
      {
          if($fresult['responseData']['paReq']!='')
          {
            $json['PaReq']=$fresult['responseData']['paReq'];
            $json['TermUrl']='';
            $json['MD']=$fresult['responseData']['trackid'];
              $json['Url']=$fresult['responseData']['url'];
            $this->session->data['trackid']=$fresult['responseData']['trackid'];
          }
      }
      else if(isset($fresult['responseCode']))
      {
          if($fresult['responseCode']=='0001')
          {
              $json['error'] = $fresult['responseDescription'];
          }
      }

  $this->response->addHeader('Content-Type: application/json');
  $this->response->setOutput(json_encode($json));
	}

}
	public function callback(){
    $apiKey = ApiKey;
    $loginID = LoginID;
    $payModeURL=PaymentMode;

		$data=array("service"=>"ECOMAPI_SALE_3DSREQ", "trackid"=>$this->session->data['trackid'], "paRes"=>$this->request->post['PaRes'], "carddetails"=>$this->session->data['carddetails']);
        // if($this->config->get('payment_mobi_server')=="live"){$payModeURL="https://pay.mobiversa.com/payment/myapiservice/jsonservice";}
        // else if($this->config->get('payment_mobi_server')=="sandbox"){$payModeURL="https://demo.mobiversa.com/payment/myapiservice/jsonservice";}
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$payModeURL);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        $headers = array("mobiApiKey:".$apiKey, "loginId:".$loginID);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER , false);

        $server_output = curl_exec ($ch);
				if (curl_errno($ch)) {
	         $json['curl_error'] = curl_error($ch);
					 print curl_error($ch);
	      }
        curl_close ($ch);
        $fresult=json_decode($server_output, true);

        if($fresult['responseMessage']=='SUCCESSFUL')
        {
        	echo '<script type="text/javascript">';
					echo 'alert("Payment accepted!");';
					echo 'window.location.href = "/payment/success";';
					echo '</script>';
        }
        else
        {
      		echo '<script type="text/javascript">';
    			echo 'alert("'.$fresult['responseDescription'].'");';
    			echo 'window.location.href = "index.php";';
    			echo '</script>';
        }
	}

}
//Nafees
