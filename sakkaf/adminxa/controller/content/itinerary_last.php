<?php
class ControllerContentItinerary extends Controller {

	private $error = array();
	private $itinerary_class = 'package';
	private $itinerary_class_id = 1;

	public function index() {
		$this->load->language('content/itinerary');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/itinerary');

		$this->getList();
	}

	private function add()
	{
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->load->model('content/itinerary');

			// dd($this->request->post);
			$itinerary = $this->request->post;

			$itinerary['itinerary_class'] = $this->itinerary_class_id;

			$response = $this->model_content_itinerary->addItinerary($itinerary);

			$this->session->data['success'] = $this->language->get('text_success');

			if(isset($this->request->get['booking_id'])){

				$this->load->model('content/booking');

				$data = array( 'booking_id' => $this->request->get['booking_id'],
								'itinerary_id' => $response,
								'admin_id' => $this->user->getId()
							  );

				$this->model_content_booking->addBookingHistory($data);

				$this->response->redirect($this->url->link('content/booking/edit&booking_id='.$this->request->get['booking_id'], 'token=' . $this->session->data['token'] , 'SSL'));
			}


			$this->response->redirect($this->url->link('content/itinerary/'.$this->itinerary_class, 'token=' . $this->session->data['token'] , 'SSL'));

		}

	}

	private function edit()
	{
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->load->model('content/itinerary');

			$itinerary = $this->request->post;
			$itinerary['itinerary_class'] = $this->itinerary_class_id;

			$this->model_content_itinerary->editItinerary($itinerary);

			$this->session->data['success'] = $this->language->get('text_success');

			if(isset($this->request->get['booking_id'])){

				$this->load->model('content/booking');

				$data = array( 'booking_id' => $this->request->get['booking_id'],
								'itinerary_id' => $response,
								'admin_id' => $this->user->getId()
							  );

				$this->model_content_booking->addBookingHistory($data);

				$this->response->redirect($this->url->link('content/booking/edit&booking_id='.$this->request->get['booking_id'], 'token=' . $this->session->data['token'] , 'SSL'));
			}

			$this->response->redirect($this->url->link('content/itinerary/'.$this->itinerary_class, 'token=' . $this->session->data['token'] , 'SSL'));

		}
	}

	public function delete()
	{
		if(isset($this->request->get['itinerary_id']) && isset($this->request->get['class'])){
			$this->load->model('content/itinerary');

			$booking_id = isset($this->request->get['booking_id']) ? $this->request->get['booking_id']: '';

			$response = $this->model_content_itinerary->deleteItinerary($this->request->get['itinerary_id'],$booking_id);

			if($this->request->get['class'] == 1){

				$this->itinerary_class = 'package';
				$this->response->redirect($this->url->link('content/itinerary/'.$this->itinerary_class, 'token=' . $this->session->data['token'] , 'SSL'));

			}else if(isset($this->request->get['booking_id'])){

				$this->response->redirect($this->url->link('content/booking/edit&booking_id='.$this->request->get['booking_id'], 'token=' . $this->session->data['token'] , 'SSL'));

			}
		}
	}



	public function package()
	{
		$this->itinerary_class = 'package';
		$this->itinerary_class_id = 1;
		$this->getList();

	}

	public function quotation()
	{
		$this->itinerary_class = 'quotation';
		$this->itinerary_class_id = 2;
		$this->getList();

	}

	public function confirmation()
	{
		$this->itinerary_class = 'confirmation';
		$this->itinerary_class_id = 3;
		$this->getList();

	}

	public function addpackage()
	{
		$this->itinerary_class = 'package';
		$this->itinerary_class_id = 1;
		$this->add();
		$this->getForm();

	}

	public function addquotation()
	{
		$this->itinerary_class = 'quotation';
		$this->itinerary_class_id = 2;
		$this->add();
		$this->getForm();

	}

	public function addconfirmation()
	{
		$this->itinerary_class = 'confirmation';
		$this->itinerary_class_id = 3;
		$this->add();
		$this->getForm();
	}

	public function editpackage()
	{
		$this->itinerary_class = 'package';
		$this->itinerary_class_id = 1;
		$this->edit();
		$this->getForm();

	}

	public function editquotation()
	{
		$this->itinerary_class = 'quotation';
		$this->itinerary_class_id = 2;
		$this->edit();
		$this->getForm();

	}

	public function editconfirmation()
	{
		$this->itinerary_class = 'confirmation';
		$this->itinerary_class_id = 3;
		$this->edit();
		$this->getForm();

	}


	protected function getList() {

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'id';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}


		$this->load->model('content/itinerary');

		$data['token'] = $this->session->data['token'];



		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->itinerary_class,
			'href' => $this->url->link('content/itinerary/'.$this->itinerary_class.'', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['insert'] = $this->url->link('content/itinerary/add'.$this->itinerary_class.'', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['order'] = $this->url->link('content/itinerary/order'.$this->itinerary_class.'&token=' . $this->session->data['token'] , '' , 'SSL');
		$data['filter'] = $this->url->link('content/itinerary/'.$this->itinerary_class.'&token=' . $this->session->data['token'] , '' , 'SSL');

		$data['sort_code'] = $this->url->link('content/itinerary/'.$this->itinerary_class.'&token=' . $this->session->data['token'] .'&sort=code'.$url, '' , 'SSL');
		$data['sort_name'] = $this->url->link('content/itinerary/'.$this->itinerary_class.'&token=' . $this->session->data['token'] .'&sort=name'.$url, '' , 'SSL');
		$data['sort_status'] = $this->url->link('content/itinerary/'.$this->itinerary_class.'&token=' . $this->session->data['token'] .'&sort=status'.$url, '' , 'SSL');

		$itinerarys = array();

		$filters['itinerary_class'] =  $this->itinerary_class_id;


		if (isset($this->request->get['filter_code'])) {
			$data['filter_code'] = $this->request->get['filter_code'];
			$filters['filter_code'] = $this->request->get['filter_code'];
		}else{
			$data['filter_code'] = '';
		}

		if (isset($this->request->get['filter_name'])) {
			$data['filter_name'] = $this->request->get['filter_name'];
			$filters['filter_name'] = $this->request->get['filter_name'];
		}else{
			$data['filter_name'] = '';
		}

		if (isset($this->request->get['filter_status'])) {
			$data['filter_status'] = $this->request->get['filter_status'];
			$filters['filter_status'] = $this->request->get['filter_status'];
		}else{
			$data['filter_status'] = '';
		}

		$filters['start'] = ($page - 1) *  $this->config->get('config_limit_admin');
		$filters['limit'] = $this->config->get('config_limit_admin');

		$total = $this->model_content_itinerary->getTotalItinerarys($filters);
		$results = $this->model_content_itinerary->getAllItinerarys($filters);

		$this->load->model('content/category');

		$categories = $this->model_content_category->getAllData(1); // 1 = Package Categories ; 2 = Page
		foreach ($categories as $key => $value) {
			$itinerary_categories[$value['category_id']] = $value['category_name'];
		}


		foreach ($results as $key => $result) {
			$result['edit'] = $this->url->link('content/itinerary/edit'.$this->itinerary_class.'', 'token=' . $this->session->data['token'] . '&itinerary_id=' . $result['itinerary_id'] , 'SSL');
			$result['delete'] = $this->url->link('content/itinerary/delete&class='.$this->itinerary_class_id.'', 'token=' . $this->session->data['token'] . '&itinerary_id=' . $result['itinerary_id'] , 'SSL');
			$categories = explode('&', $result['itinerary_category']);
			$result['status'] = $result['status'] == 1 ? 'Published' : 'Unpublished';
			$result['itinerary_category'] = array();
			foreach ($categories as $value) {
				if($value) $result['itinerary_category'][] = $itinerary_categories[$value];
			}
			$itinerarys[$result['itinerary_id']] = $result;
		}

		$data['itinerary_class'] = $this->itinerary_class;

		$data['itinerarys'] = $itinerarys;

		if (!isset($this->error['warning'])) {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('content/itinerary/'.$this->itinerary_class.'', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total - $this->config->get('config_limit_admin'))) ? $total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total, ceil($total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$data += $this->load->language('content/itinerary');

		$this->response->setOutput($this->load->view('content/itinerary_list.tpl', $data));
	}


	public function getForm($data = array())
	{
		$this->load->model('content/itinerary');

		$this->document->addScript('view/javascript/jquery/jquery.sortable.js');
		$this->document->addScript('view/javascript/select2/select2.min.js');
		$this->document->addStyle('view/javascript/select2/select2.css');

		$url = '';


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->itinerary_class,
			'href' => $this->url->link('content/itinerary/'.$this->itinerary_class.'', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->error['warning'])) {
			$data['error_warning'] = '';
		}
		$data['cancel'] = $this->url->link('content/itinerary/'.$this->itinerary_class.'', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['get_hotel_rooms'] = $this->url->link('content/hotels/getRooms&token=' . $this->session->data['token'], '' , 'SSL');

		$data['itinerary_class'] = $this->itinerary_class;

		$itinerary = NULL;

		if (isset($this->request->get['itinerary_id'])) {
			$itinerary = $this->model_content_itinerary->getItinerary($this->request->get['itinerary_id']);
			$itinerary_rooms = $this->model_content_itinerary->getItineraryRooms($this->request->get['itinerary_id']);
			$itinerary_transportations = $this->model_content_itinerary->getItineraryTransportations($this->request->get['itinerary_id']);
			$itinerary_tours = $this->model_content_itinerary->getItineraryTours($this->request->get['itinerary_id']);

			$data['itinerary_class_id'] = $itinerary['itinerary_class']; //$this->itinerary_class_id;//

			$data['id'] = $this->request->get['itinerary_id'];
			if(isset($this->request->get['booking_id'])){
				$data['action'] = $this->url->link('content/itinerary/add'.$this->itinerary_class.'&booking_id='.$this->request->get['booking_id'].'&token=' . $this->session->data['token'] , '' , 'SSL');
			}else{
				$data['action'] = $this->url->link('content/itinerary/edit'.$this->itinerary_class.'&token=' . $this->session->data['token'] , '' , 'SSL');
			}
		}

		if (isset($data['arrival_date']) ) { $arrival_date = $data['arrival_date']; }else{ $arrival_date =''; }
		if (isset($data['departure_date'])){ $departure_date = $data['departure_date']; }else{ $departure_date =''; }

		if ($itinerary) {
			if ($itinerary_rooms) {
				foreach ($itinerary_rooms as $key => $room) {
					$itinerary_rooms[$key]['type'] = 'hotel';
					$itinerary_rooms[$key]['order'] = $room['order'];
					$itinerary_rooms[$key]['hotel_rooms'] = array();
					if($arrival_date){
						$checkin = date('Y-m-d', strtotime($arrival_date. ' + '.( $room['start_day'] - 1 ).' days'));
						$itinerary_rooms[$key]['checkin'] = $checkin;
						$itinerary_rooms[$key]['checkout'] = date('Y-m-d', strtotime($checkin. ' + '.($room['num_of_nights'] ).' days'));
					}
					$data['itinerary'][] = $itinerary_rooms[$key];
				}
				$data['itinerary_rooms'] = $itinerary_rooms ;
			}

			if ($itinerary_transportations) {
				foreach ($itinerary_transportations as $key => $transportation) {
					$itinerary_transportations[$key]['type'] = 'transportation';
					$itinerary_transportations[$key]['order'] = $transportation['order'];
					if($arrival_date){
						$date = date('Y-m-d', strtotime($arrival_date. ' + '.( $transportation['start_day'] - 1 ).' days'));
						$itinerary_transportations[$key]['date'] = $date;
					}
					$data['itinerary'][] = $itinerary_transportations[$key];
				}
				$data['itinerary_transportations'] = $itinerary_transportations ;
			}
			if ($itinerary_tours) {
				foreach ($itinerary_tours as $key => $tour) {
					$itinerary_tours[$key]['type'] = 'tour';
					$itinerary_tours[$key]['order'] = $tour['order'];
					if($arrival_date){
						$date = date('Y-m-d', strtotime($arrival_date. ' + '.( $tour['start_day'] - 1 ).' days'));
						$itinerary_tours[$key]['date'] = $date;
					}
					$data['itinerary'][] = $itinerary_tours[$key];
				}
				$data['itinerary_tours'] = $itinerary_tours ;
			}

			usort($data['itinerary'], function($a, $b) {
			    return $a['order'] - $b['order'];
			});


		}else{
			$data['itinerary'] = array();
			if(isset($this->request->get['booking_id'])){
				$data['action'] = $this->url->link('content/itinerary/add'.$this->itinerary_class.'&booking_id='.$this->request->get['booking_id'].'&token=' . $this->session->data['token'] , '' , 'SSL');
			}else{
				$data['action'] = $this->url->link('content/itinerary/add'.$this->itinerary_class.'&token=' . $this->session->data['token'] , '' , 'SSL');
			}
		}

		$this->load->model('content/hotels');
		$data['hotels'] =  $this->model_content_hotels->getHotels();


		if ($itinerary) {
			$data['itinerary_title'] = $itinerary['itinerary_title'];
		}else if(isset($this->request->post['itinerary_title'])){
			$data['itinerary_title'] = $this->request->post['itinerary_title'];
		}else{
			$data['itinerary_title'] = '';
		}

		if ($itinerary) {
			$data['itinerary_image'] = $itinerary['itinerary_image'];
		}else if(isset($this->request->post['itinerary_image'])){
			$data['itinerary_image'] = $this->request->post['itinerary_image'];
		}else{
			$data['itinerary_image'] = '../image/no_image.png';
		}

		$this->load->model('content/category');

		$data['categories'] = $this->model_content_category->getAllData(1); // 1 = Package Categories ; 2 = Page Categories


		if ($itinerary) {
			$data['itinerary_category'] = explode('&', $itinerary['itinerary_category']);
		}else if(isset($this->request->post['itinerary_category'])){
			$data['itinerary_category'] = $this->request->post['itinerary_category'];
		}else{
			$data['itinerary_category'] = array();
		}

		if ($itinerary) {
			$data['slug'] = $itinerary['slug'];
		}else if(isset($this->request->post['slug'])){
			$data['slug'] = $this->request->post['slug'];
		}else{
			$data['slug'] = '';
		}

		if ($itinerary) {
			$data['itinerary_notes'] = $itinerary['itinerary_notes'];
		}else if(isset($this->request->post['itinerary_notes'])){
			$data['itinerary_notes'] = $this->request->post['itinerary_notes'];
		}else{
			$data['itinerary_notes'] = '';
		}

		if ($itinerary) {
			$data['total_price'] = $itinerary['total_price'];
		}else if(isset($this->request->post['total_price'])){
			$data['total_price'] = $this->request->post['total_price'];
		}else{
			$data['total_price'] = 0;
		}

		if ($itinerary) {
			$data['markup'] = $itinerary['markup'];
		}else if(isset($this->request->post['markup'])){
			$data['markup'] = $this->request->post['markup'];
		}else{
			$data['markup'] = 0;
		}
		if ($itinerary) {
			$data['customer_price'] = $itinerary['customer_price'];
		}else if(isset($this->request->post['customer_price'])){
			$data['customer_price'] = $this->request->post['customer_price'];
		}else{
			$data['customer_price'] = 0;
		}

		if ($itinerary) {
			$data['status'] = $itinerary['status'];
		}else if(isset($this->request->post['status'])){
			$data['status'] = $this->request->post['status'];
		}else{
			$data['status'] = 0;
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$data += $this->load->language('content/itinerary');
		// dd($data);

		if(isset($data['viewItrinary']) && $data['viewItrinary'] == 'view'){
			$this->response->setOutput($this->load->view('content/itinerary_view.tpl', $data));

		}else if(isset($data['viewItrinary']) && $data['viewItrinary'] == 'pdf'){
			return $this->load->view('content/itinerary_view.tpl', $data);

		}else if(isset($data['viewInvoice']) && $data['viewInvoice'] == 'view'){
			$this->response->setOutput($this->load->view('content/invoice_view.tpl', $data));

		}else if(isset($data['viewInvoice']) && $data['viewInvoice'] == 'pdf'){
			return $this->load->view('content/invoice_view.tpl', $data);

		}else if(isset($data['viewSummery']) && $data['viewSummery'] == 'view'){
			$this->response->setOutput($this->load->view('content/summery_view.tpl', $data));

		}else if(isset($data['viewSummery']) && $data['viewSummery'] == 'pdf'){
			return $this->load->view('content/summery_view.tpl', $data);

		}else if(isset($data['viewVoucher']) && $data['viewVoucher'] == 'view'){
			$this->response->setOutput($this->load->view('content/voucher_view.tpl', $data));

		}else if(isset($data['viewVoucher']) && $data['viewVoucher'] == 'pdf'){
			return $this->load->view('content/voucher_view.tpl', $data);

 		}else{
			$this->response->setOutput($this->load->view('content/itinerary_from.tpl', $data));
		}
	}


	public function validateForm()
	{
		return true;
	}


	public function viewItrinary()
	{
		$data['viewItrinary'] = 'view';

		$this->load->model('content/booking');

		$booking_info = $this->model_content_booking->getData($this->request->get['booking_id']);

		$data += $booking_info;

 		$this->getForm($data);
	}

	public function pdfItrinary()
	{
		$data['viewItrinary'] = 'pdf';

		$this->load->model('content/booking');

		$booking_info = $this->model_content_booking->getData($this->request->get['booking_id']);

		$data += $booking_info;

 		@pdf ($this->getForm($data) , BOOKING_PREFIX.$booking_info['booking_id']);

	}

	public function sendItrinary()
	{
		$data['viewItrinary'] = 'pdf';

		$this->load->model('content/booking');

		$booking_info = $this->model_content_booking->getData($this->request->get['booking_id']);

		$data += $booking_info;

 		$message = $this->getForm($data);

		$mail = new Mail($this->config->get('config_mail'));
		$mail->setTo($booking_info['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject(html_entity_decode("تفاصيل البرنامج السياحي", ENT_QUOTES, 'UTF-8'));
		$mail->setHTML($message);
		$mail->send();


	}

	public function viewInvoice()
	{
		$data['viewInvoice'] = 'view';

		$this->load->model('content/booking');

		$booking_info = $this->model_content_booking->getData($this->request->get['booking_id']);

		$data += $booking_info;

 		$this->getForm($data);
	}

	public function pdfInvoice()
	{
		$data['viewInvoice'] = 'pdf';

		$this->load->model('content/booking');

		$booking_info = $this->model_content_booking->getData($this->request->get['booking_id']);

		$data += $booking_info;

 		@pdf ($this->getForm($data) , 'Invoice-'. BOOKING_PREFIX.$booking_info['booking_id']);

	}

	public function viewSummery()
	{
		$data['viewSummery'] = 'view';

		$this->load->model('content/booking');

		$booking_info = $this->model_content_booking->getData($this->request->get['booking_id']);

		$data += $booking_info;

 		$this->getForm($data);
	}

	public function pdfSummery()
	{
		$data['viewSummery'] = 'pdf';

		$this->load->model('content/booking');

		$booking_info = $this->model_content_booking->getData($this->request->get['booking_id']);

		$data += $booking_info;

 		@pdf ($this->getForm($data) , 'Summery-'. BOOKING_PREFIX.$booking_info['booking_id']);

	}
	public function viewVouchers()
	{
		$data['viewVoucher'] = 'view';

		$this->load->model('content/booking');

		$booking_info = $this->model_content_booking->getData($this->request->get['booking_id']);

		$data += $booking_info;

 		$this->getForm($data);
	}

	public function pdfVouchers()
	{
		$data['viewVoucher'] = 'pdf';

		$this->load->model('content/booking');

		$booking_info = $this->model_content_booking->getData($this->request->get['booking_id']);

		$data += $booking_info;

 		@pdf ($this->getForm($data) , 'Vouchers-'. BOOKING_PREFIX.$booking_info['booking_id']);

	}

	public function pdf()
	{
		$file = '<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div style="width:820px; margin:0 auto; direction:rtl;">
<center><img width="100%" src="http://crestkey-travel.com/image//itinerary_header.jpg"></center>

<center>السلام عليكم و رحمة الله و بركاته</center>
إسم العميل: خالد -  <br>
رقم الهاتف: - <br>
تحية طيبة من شركة النور للسياحة و التدريب <br>
رقم البرنامج : CTTB15020 <br>

 تم إقتراح البرنامج  كالتالي: <br>

<center><h4>برنامج  5 نجوم فاخر ( 14 ليلة و 15 يوم ) - مع المواصلات و الجولات</h4></center>
  <h4>الفنادق</h4>
  <table width="800" style="border:1px solid #CED0D1; min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
    <tbody>
      <tr style="height:40px" >
        <td style="text-align: center;background:orange;"><span style="font-weight: bold;">المدينة</span></td>
        <td style="text-align: center;background:orange;"><span style="font-weight: bold;">من - الى </span></td>
        <td style="text-align: center;background:orange;"><span style="font-weight: bold;">اسم الفندق</span></td>
        <td style="text-align: center;background:orange;"><span style="font-weight: bold;">نوع الغرفة</span></td>
        <td style="text-align: center;background:orange;"><span style="font-weight: bold;">الإفطار</span></td>
        <td style="text-align: center;background:orange;"><span style="font-weight: bold;">عدد الليالي </span></td>
        <td style="text-align: center;background:orange;"><span style="font-weight: bold;">مستوى الفندق</span></td>
      </tr>
              <tr>
          <td style="border:1px solid #CED0D1;text-align:center;"> سلانجور</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2015-05-24<br>2015-05-26</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> قصر الخيول الذهبية<br>Palace of the Golden Horses </td>
          <td style="border:1px solid #CED0D1;text-align:center;"> غرفة ديلوكس مطلة على البحيرة<br>Deluxe Room Lake view</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 5 نجوم</td>
        </tr>

              <tr>
          <td style="border:1px solid #CED0D1;text-align:center;"> لنكـاوي</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2015-05-26<br>2015-05-30</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> منتجع ويستن لانكاوي<br>The Westin Langkawi Resort &amp; Spa </td>
          <td style="border:1px solid #CED0D1;text-align:center;"> غرفة بريميوم مطلة على المحيط<br>Premium ocean view room</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 4</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 5 نجوم</td>
        </tr>

              <tr>
          <td style="border:1px solid #CED0D1;text-align:center;"> بينـــانق</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2015-05-29<br>2015-06-02</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> منتجع قولدن ساندس باي شنقريلا<br>Golden Sands Resort - Penang </td>
          <td style="border:1px solid #CED0D1;text-align:center;"> سوبيرير مطلة على البحر<br>Deluxe sea View room</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 4</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 4 نجوم</td>
        </tr>

              <tr>
          <td style="border:1px solid #CED0D1;text-align:center;"> مرتفعات كاميرون</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2015-06-01<br>2015-06-02</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> منتجع ستروبيري بارك ريزورت كاميرون<br>Strawberry Park Resort </td>
          <td style="border:1px solid #CED0D1;text-align:center;"> جناح تيوقا ديلوكس<br>TIOGA DELUXE SUITE</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 1</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 4 نجوم</td>
        </tr>

              <tr>
          <td style="border:1px solid #CED0D1;text-align:center;"> سلانجور</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2015-06-03<br>2015-06-06</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> منتجع صن واي ريزورت<br>Sunway Resort Hotel and Spa </td>
          <td style="border:1px solid #CED0D1;text-align:center;"> غرفة بريمير<br>Premier Room</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 2</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 3</td>
          <td style="border:1px solid #CED0D1;text-align:center;"> 5 نجوم</td>
        </tr>

          </table>


      <br>
  <h4>الرحلات و التنقلات الداخلية  </h4>
  <div style="clear:both;">
      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
      <img src="http://crestkey-travel.com/image/catalog/packages/smll car.jpg" width="100%">
      <h5 style="text-align:center;" >الاستقبال من المطار الدولي و التوصيل الى الفندق</h5>
    </div>

      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
      <img src="http://crestkey-travel.com/image/catalog/packages/smll car.jpg" width="100%">
      <h5 style="text-align:center;" >التوصيل  الى  المطار الداخلي للسفر إلى جزيرة لانكاوي</h5>
    </div>

      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
      <img src="http://crestkey-travel.com/image/catalog/packages/air.jpg" width="100%">
      <h5 style="text-align:center;" >السفر من سلانجور إلى لانكاوي</h5>
    </div>

      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
      <img src="http://crestkey-travel.com/image/catalog/packages/smll car.jpg" width="100%">
      <h5 style="text-align:center;" >الاسقبال من  مطار لانكاوي و التوصيل الى الفندق</h5>
    </div>

      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
      <img src="http://crestkey-travel.com/image/catalog/packages/smll car.jpg" width="100%">
      <h5 style="text-align:center;" >التوصيل إلى مطار لانكاوي للسفر إلى بينانق</h5>
    </div>

      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
      <img src="http://crestkey-travel.com/image/catalog/packages/air.jpg" width="100%">
      <h5 style="text-align:center;" >السفر من لانكاوي  إلى بينانق</h5>
    </div>

      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
      <img src="http://crestkey-travel.com/image/catalog/packages/smll car.jpg" width="100%">
      <h5 style="text-align:center;" >الاستقبال من مطار بينانق و التوصيل الى الفندق</h5>
    </div>

      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
      <img src="http://crestkey-travel.com/image/catalog/packages/smll car.jpg" width="100%">
      <h5 style="text-align:center;" >التوصيل من بينانق الى الفندق في كاميرون هايلاند</h5>
    </div>

      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
      <img src="http://crestkey-travel.com/image/catalog/packages/smll car.jpg" width="100%">
      <h5 style="text-align:center;" >التوصيل من مرتفعات كاميرون إلى الفندق في كوالالمبور</h5>
    </div>

      <div style="  width: 150px;height: 180px;float: right;margin: 5px;border: 1px solid rgba(0,0,0,0.3);">
      <img src="http://crestkey-travel.com/image/catalog/packages/smll car.jpg" width="100%">
      <h5 style="text-align:center;" >التوصيل و التوديع إلى المطار الدولي للعودة إلى أرض الوطن</h5>
    </div>

    <div style="width:100%;clear:both;"></div>
  </div>


      <br>
      <h4>برنامج الرحلة</h4>
      <table width="800" style="border:1px solid #CED0D1; min-width:800px;" align="center" dir="rtl" cellpadding="0" cellspacing="0">
        <tbody>
          <tr style="height:40px" >
            <td style="text-align: center;background:orange;width:100px"><span style="font-weight: bold;">التاريخ</span></td>
                        <td style="text-align: center;background:orange;"><span style="font-weight: bold;">البرنامج</span></td>
            <td style="text-align: center;background:orange;"><span style="font-weight: bold;">Description</span></td>
          </tr>
                                                                                                                                                                                                                        <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;"> 2015-05-24</td>
                                <td style="border:1px solid #CED0D1;text-align:center;"> الاستقبال من المطار الدولي و التوصيل الى الفندق</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> From KLIA To Golden Horses Hotel</td>
             </tr>

                                                                          <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;white-space:nowrap;"> 2015-05-25</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> جولة في سياحية سلانجور لمدة 6 ساعات تبدأ الساعة 10 صباحا تتضمن زيارة حديقة الحيوانات و الشلالات و المعبد الهندي</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> 6  Hrs SEL Tour
It covers Zoo Negara ,Templer park waterfalls and Batu caves</td>
                              </tr>
                                                  <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;"> 2015-05-26</td>
                                <td style="border:1px solid #CED0D1;text-align:center;"> التوصيل  الى  المطار الداخلي للسفر إلى جزيرة لانكاوي</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> From Golden Horses hotel To KLIA2</td>
             </tr>

                                                              <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;"> 2015-05-26</td>
                                <td style="border:1px solid #CED0D1;text-align:center;"> السفر من سلانجور إلى لانكاوي</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> KLIA 2 To LGKAirport</td>
             </tr>

                                                              <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;"> 2015-05-26</td>
                                <td style="border:1px solid #CED0D1;text-align:center;"> الاسقبال من  مطار لانكاوي و التوصيل الى الفندق</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> LGK Airport To Westin Hotel</td>
             </tr>

                                                                          <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;white-space:nowrap;"> 2015-05-27</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> جولة سياحية في جزيرة لانكاوي لمدة 6 ساعات تبدأ الساعة 10 صباحا  تتضمن أهم الأماكن السياحية في الجزيرة</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> 6  Hrs LGK Tour</td>
                              </tr>
                                                  <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;"> 2015-05-29</td>
                                <td style="border:1px solid #CED0D1;text-align:center;"> التوصيل إلى مطار لانكاوي للسفر إلى بينانق</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> From Westin Hotel To LGK Airport</td>
             </tr>

                                                              <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;"> 2015-05-29</td>
                                <td style="border:1px solid #CED0D1;text-align:center;"> السفر من لانكاوي  إلى بينانق</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> From LGK To PEN</td>
             </tr>

                                                              <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;"> 2015-05-29</td>
                                <td style="border:1px solid #CED0D1;text-align:center;"> الاستقبال من مطار بينانق و التوصيل الى الفندق</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> PEN Airport To Golden Sands Hotel</td>
             </tr>

                                                                          <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;white-space:nowrap;"> 2015-05-30</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> جولة سياحية في جزيرة بينانق لمدة 6 ساعات تبدأ الساعة 10 صباحا  تتضمن أهم الأماكن السياحية في الجزيرة</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> 6  Hrs PEN Tour</td>
                              </tr>
                                                  <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;"> 2015-06-01</td>
                                <td style="border:1px solid #CED0D1;text-align:center;"> التوصيل من بينانق الى الفندق في كاميرون هايلاند</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> From Golden Sands Hotel To Strawberry Park Resort</td>
             </tr>

                                                              <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;"> 2015-06-03</td>
                                <td style="border:1px solid #CED0D1;text-align:center;"> التوصيل من مرتفعات كاميرون إلى الفندق في كوالالمبور</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> From Strawberry Park Resort To Sunway Resort</td>
             </tr>

                                                                          <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;white-space:nowrap;"> 2015-06-04</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> جولة سياحية في كوالالمبور لمدة 6 ساعات تبدأ الساعة 10 صباحا  تتضمن زيارة البرجين التوأم و عالم تحت البحار و برج المنارة و حديقة الطيور والفراشات</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> 6  Hrs KL Tour
It covers KLCC , Menara KL ,Aquaria KLCC and Butterfly &amp; Bird Park</td>
                              </tr>
                                                  <tr>
                <td style="border:1px solid #CED0D1;text-align:center; background:orange;"> 2015-06-07</td>
                                <td style="border:1px solid #CED0D1;text-align:center;"> التوصيل و التوديع إلى المطار الدولي للعودة إلى أرض الوطن</td>
                <td style="border:1px solid #CED0D1;text-align:center;"> From Sunway Resort To KLIA</td>
             </tr>

                                                      </tbody>
      </table>
        <br>
        <br>
        <br>
           <center>
      <h3>إجمالي سعر البرنامج شاملا الضرائب و  رسوم الخدمة 12850 رنجت ماليزي </h3><br>
<!--       <h3>لتاكيد حجزك يتطلب من دفع 30% من سعر الفنادق + سعر الطيران كامل و سيقوم موظف الحجوزات بتاكيد جميع الحجوزات وارسالها لك.</h3><br>
      <h3>المبلغ المطلوب دفعه للتامين بالرنجت الماليزي: 3855 رنجت ماليزي</h3><br>
 -->
    </center>
          <h4>سياسة إلغاء الحجز:</h4>
    <div><br></div>
    <div>- إلغاء الحجز حسب سياسة كل فندق بعضها يتم خصم ليلة واحدة و البعض يخصم كامل المبلغ.</div>
    <div><br></div>
    <div>- في حالة إلغاء الحجز بعد تاكيده تخصم رسوم الخدمة و استرجاع باقي المبلغ حسب التاريخ المحدد.</div>
    <div><br></div>
    <h4>ملاحظات هامة للعميل :</h4>
    <div><br></div>
      <div>- يعتبر هذا عرض سعر فقط و لم يتم حجز اي شي الى الان و الشركة غير مسؤولة عن ضمان السعر في حالة تاخر العميل في تاكيد الحجز.</div>
          <div>-           الجولات السياحية لا تتضمن تذاكر الدخول للأماكن السياحية.</div>
    <div>-           تذاكر الطيران الداخلي و العبارة غير قابلة للتبديل او الإرجاع وذلك حسب نظام الشركات الناقلة.</div>
    <div>-           يرجى مراعاة عدد الحقائب حسب نوع السيارة وفي حالة وجود حقائب كثيرة يرجى ابلاغ الشركة قبل الوصول الى ماليزيا.</div>
    <div>-           سعر تذاكر الطيران غير ثابت ويزداد بإقتراب الموعد.</div>
    <div> </div>
    <div><br></div>
    <div>-           جميع الجولات السياحية تبدأ بعد الافطار الساعة 10 صباحا و يمكنك تغيرها بالتواصل مع الشركة 12 ساعة على الأقل قبل موعد الجولة.</div>
    <div> </div>
    <div><br></div>
    <div>-           في حالة إضافة ساعات اضافية في الجولات يرجى اخبار السائق و دفع المبلغ الاضافي للسائق مباشرة</div>
    <div>-           الشركة غير مسؤولة عن أي تغيير في البرنامج من قبل العميل من دون علم الشركة.</div>
    <div>-           في السفر الداخلي : يجب وجود العميل في المطار / الميناء قبل موعد إقلاع الرحلة بساعتين على الأقل . في السفر الدولي : يجب وجود العميل في المطار قبل موعد إقلاع الرحلة بثلاث ساعات على الأقل . لذا يلزم التأكد من مواعيد السائقين والتواصل مع الشركة مباشرة في حالة التأخر.</div>
    <div><br></div>
    <div>-           تسجيل الدخول بالفنادق الساعة الثالثة عصرا،  و موعد الخروج الساعة 12:00 ظهرا .</div>
    <div><br></div>
    <div>-           الوزن المسموح به في  الطيران الداخلي في ماليزيا  هو 15كيلو لكل فرد بالغ و 15 كيلوا للطفل.</div>
    <div><br></div>
    <div>للمزيد من الاستفسار التواصل مع :</div>
    <div><br></div>
<table align="center" border="1" width="60%">
  <tr>
    <td>الاسم</td>
    <td>العمل</td>
    <td>الهاتف</td>
  </tr>
  <tr>
    <td>أحمد الكثيري</td>
    <td>المشرف العام</td>
    <td>0060149317909</td>
  </tr>
  <tr>
    <td>راضي حديجان</td>
    <td>المدير التنفيذي</td>
    <td>00601111633514</td>
  </tr>
  <tr>
    <td>راشد بت</td>
    <td>مسؤول المواصلات</td>
    <td>0060169569785</td>
  </tr>
</table>
<center>نتمنى لكم رحلة لاتنسى</center>
</div>';
 		@pdf ($file , 'test.pdf');

	}
}
?>
