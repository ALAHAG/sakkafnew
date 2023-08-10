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
		$data['delete'] = $this->url->link('content/itinerary/delete'.$this->itinerary_class.'', 'token=' . $this->session->data['token'] . $url, 'SSL');
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


		$total = $this->model_content_itinerary->getTotalItinerarys(array('itinerary_class'=> $this->itinerary_class_id));
		$results = $this->model_content_itinerary->getAllItinerarys($filters);

		$this->load->model('content/category');  

		$categories = $this->model_content_category->getAllData(1); // 1 = Package Categories ; 2 = Page 
		foreach ($categories as $key => $value) {
			$itinerary_categories[$value['category_id']] = $value['category_name'];
		}


		foreach ($results as $key => $result) {
			$result['edit'] = $this->url->link('content/itinerary/edit'.$this->itinerary_class.'', 'token=' . $this->session->data['token'] . '&itinerary_id=' . $result['itinerary_id'] , 'SSL');
			$result['delete'] = $this->url->link('content/itinerary/delete'.$this->itinerary_class.'', 'token=' . $this->session->data['token'] . '&itinerary_id=' . $result['itinerary_id'] , 'SSL');
			$categories = explode('&', $result['itinerary_category']);
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
			// $data['success'] = $this->session->data['success'];

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

		$data['get_hotel_rooms'] = $this->url->link('content/hotels/getRooms&token=' . $this->session->data['token'], '' , 'SSL');

		$data['itinerary_class'] = $this->itinerary_class;

		$itinerary = NULL;

		if (isset($this->request->get['itinerary_id'])) {
			$itinerary = $this->model_content_itinerary->getItinerary($this->request->get['itinerary_id']);
			$itinerary_rooms = $this->model_content_itinerary->getItineraryRooms($this->request->get['itinerary_id']);
			$itinerary_transportations = $this->model_content_itinerary->getItineraryTransportations($this->request->get['itinerary_id']);
			$itinerary_tours = $this->model_content_itinerary->getItineraryTours($this->request->get['itinerary_id']);

			$data['itinerary_class_id'] = $this->itinerary_class_id;// $itinerary['itinerary_class'];

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
						$date = date('Y-m-d', strtotime($arrival_date. ' + '.( $room['start_day'] - 1 ).' days'));
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
						$date = date('Y-m-d', strtotime($arrival_date. ' + '.( $room['start_day'] - 1 ).' days'));
						$itinerary_tours[$key]['date'] = $date;
					}
					$data['itinerary'][] = $itinerary_tours[$key];
				}
				$data['itinerary_tours'] = $itinerary_tours ;
			}
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

		if(isset($data['viewItrinary']) && $data['viewItrinary'] == 'view'){
			$this->response->setOutput($this->load->view('content/itinerary_view.tpl', $data));

		}else if(isset($data['viewItrinary']) && $data['viewItrinary'] == 'pdf'){
			return $this->load->view('content/itinerary_view.tpl', $data);

		}else if(isset($data['viewInvoice']) && $data['viewInvoice'] == 'view'){
			$this->response->setOutput($this->load->view('content/invoice_view.tpl', $data));
			
		}else if(isset($data['viewInvoice']) && $data['viewInvoice'] == 'pdf'){
			return $this->load->view('content/invoice_view.tpl', $data);

		}else if(isset($data['viewSummery']) && $data['viewSummery'] == 'view'){
			$this->response->setOutput($this->load->view('content/invoice_view.tpl', $data));
			
		}else if(isset($data['viewSummery']) && $data['viewSummery'] == 'pdf'){
			return $this->load->view('content/summery_view.tpl', $data);

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
		
		pdf($this->getForm($data) , BOOKING_PREFIX.$booking_info['booking_id']);

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
		$mail->setHtml(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
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

 		pdf ($this->getForm($data) , 'Invoice-'. BOOKING_PREFIX.$booking_info['booking_id']);

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

 		pdf ($this->getForm($data) , 'Summery-'. BOOKING_PREFIX.$booking_info['booking_id']);

	}
}
?>
