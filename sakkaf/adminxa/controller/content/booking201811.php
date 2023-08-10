<?php
class ControllerContentBooking extends Controller {
	private $error = array();
	private $data = array();

	public function index() {
		$this->load->model('content/booking');
		$this->getList();
	}

	public function edit()
	{
		$this->load->model('content/booking');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_content_booking->editData($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('content/booking/edit&booking_id='.$this->request->post['booking_id'], 'token=' . $this->session->data['token'] , 'SSL'));
		}

		$this->getForm();
	}

	public function add()
	{
		$this->load->model('content/booking');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$response = $this->model_content_booking->addData($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('content/booking/edit&booking_id='.$response, 'token=' . $this->session->data['token'] , 'SSL'));
		}

		$this->getForm();
	}

	public function delete()
	{
		$this->load->model('content/booking');
		if (($this->request->get['booking_id']) && $this->validateDelete()) {

			$this->model_content_booking->deleteData($this->request->get['booking_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('content/booking', 'token=' . $this->session->data['token'] , 'SSL'));
		}

		$this->getList();

	}

	public function report()
	{
		$this->document->addScript('view/javascript/bootstrap-datepicker/bootstrap-datepicker.min.js');
		$this->document->addStyle('view/javascript/bootstrap-datepicker/bootstrap-datepicker3.min.css');


		$this->load->model('content/booking');

		$data = $this->data;

		$data += $this->load->language('content/booking');

		$this->document->setTitle($this->language->get('heading_title'));


		$data['token'] = $this->session->data['token'];


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/booking', 'token=' . $this->session->data['token'] , 'SSL')
		);

		if(isset($this->session->data['success'])){
			unset($this->session->data['success']);
		}else{
			$data['text_success'] = '';
		}

		if (!isset($this->error['warning'])) {
			$data['error_warning'] = '';
		}

		$filters = array();

		$url = '';

		if (isset($this->request->get['filter_from'])) {
			$data['filter_from'] = $this->request->get['filter_from'];
			$filters['filter_from'] = $this->request->get['filter_from'];
			$url .= 'filter_from='.$this->request->get['filter_from'];

		}else{
			$data['filter_from'] = '';
		}

		if (isset($this->request->get['filter_to'])) {
			$data['filter_to'] = $this->request->get['filter_to'];
			$filters['filter_to'] = $this->request->get['filter_to'];
			$url .= 'filter_to='.$this->request->get['filter_to'];
		}else{
			$data['filter_to'] = '';
		}


		$data['insert'] = $this->url->link('content/booking/add', 'token=' . $this->session->data['token'], 'SSL');


		$bookings = $this->model_content_booking->getReport($filters);

		$total_bookings = $this->model_content_booking->getTotalData($filters);

		foreach ($bookings as $key => $booking) {
			$bookings[$key]['delete'] = $this->url->link('content/booking/delete&booking_id='.$booking['booking_id'], 'token=' . $this->session->data['token'], 'SSL');
			$bookings[$key]['edit'] = $this->url->link('content/booking/edit&booking_id='.$booking['booking_id'], 'token=' . $this->session->data['token'], 'SSL');
		}

		$data['bookings'] = $bookings;

		$data['filter'] = $this->url->link('content/booking/report&token=' . $this->session->data['token'] , '' , 'SSL');



		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/booking_report.tpl', $data));

	}

	public function getList()
	{

		$data = $this->data;

		$data += $this->load->language('content/booking');

		$this->document->setTitle($this->language->get('heading_title'));


		$data['token'] = $this->session->data['token'];


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/booking', 'token=' . $this->session->data['token'] , 'SSL')
		);

		if(isset($this->session->data['success'])){
			unset($this->session->data['success']);
		}else{
			$data['text_success'] = '';
		}

		if (!isset($this->error['warning'])) {
			$data['error_warning'] = '';
		}

		$filters = array();
		if (isset($this->request->get['filter_id'])) {
			$data['filter_id'] = $this->request->get['filter_id'];
			$filters['filter_id'] = $this->request->get['filter_id'];
		}else{
			$data['filter_id'] = '';
		}

		if (isset($this->request->get['filter_name'])) {
			$data['filter_name'] = $this->request->get['filter_name'];
			$filters['filter_name'] = $this->request->get['filter_name'];
		}else{
			$data['filter_name'] = '';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$filters['start'] = ($page - 1) *  $this->config->get('config_limit_admin');
		$filters['limit'] = $this->config->get('config_limit_admin');

		$data['insert'] = $this->url->link('content/booking/add', 'token=' . $this->session->data['token'], 'SSL');


		$bookings = $this->model_content_booking->getAllData($filters);

		$total_bookings = $this->model_content_booking->getTotalData($filters);

		foreach ($bookings as $key => $booking) {
			$bookings[$key]['delete'] = $this->url->link('content/booking/delete&booking_id='.$booking['booking_id'], 'token=' . $this->session->data['token'], 'SSL');
			$bookings[$key]['edit'] = $this->url->link('content/booking/edit&booking_id='.$booking['booking_id'], 'token=' . $this->session->data['token'], 'SSL');
		}

		$data['bookings'] = $bookings;

		$data['filter'] = $this->url->link('content/booking&token=' . $this->session->data['token'] , '' , 'SSL');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$pagination = new Pagination();
		$pagination->total = $total_bookings;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('content/booking', 'token=' . $this->session->data['token']  . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_bookings) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_bookings - $this->config->get('config_limit_admin'))) ? $total_bookings : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_bookings, ceil($total_bookings / $this->config->get('config_limit_admin')));


		$this->response->setOutput($this->load->view('content/booking_list.tpl', $data));
		
	}

	public function getForm()
	{

		$this->document->addScript("view/javascript/jquery/jquery.fancybox.js");
		$this->document->addStyle("view/javascript/jquery/jquery.fancybox.css");
		$data = $this->data;

		$data += $this->load->language('content/booking');

		$this->load->model('content/booking');


		$this->document->setTitle($this->language->get('heading_title'));


		$data['token'] = $this->session->data['token'];

		if(isset($this->session->data['success'])){
			unset($this->session->data['success']);
		}else{
			$data['text_success'] = '';
		}


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/booking', 'token=' . $this->session->data['token'] , 'SSL')
		);




		if (!isset($this->error['warning'])) {
			$data['error_warning'] = '';
		}

		if (!isset($this->error['title'])) {
			$data['error_title'] = '';
		} 

		if (!isset($this->error['keyword'])) {
			$data['error_keyword'] = '';
		} 

		if (!isset($this->request->get['booking_id'])) {
			$data['action'] = $this->url->link('content/booking/add', 'token=' . $this->session->data['token'] , 'SSL');
		} else {
			$data['action'] = $this->url->link('content/booking/edit', 'token=' . $this->session->data['token'] . '&booking_id=' . $this->request->get['booking_id'] , 'SSL');
		}

		$data['cancel'] = $this->url->link('content/booking', 'token=' . $this->session->data['token'] , 'SSL');

		if (isset($this->request->get['booking_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$booking_info = $this->model_content_booking->getData($this->request->get['booking_id']);
			$data['booking_history'] = $this->model_content_booking->getBookingHistory($this->request->get['booking_id']);
			$data['create_quotation'] = $this->url->link('content/itinerary/editquotation&itinerary_id='.$booking_info['itinerary_id'].'&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');
			$data['link_modify_quotation'] = $this->url->link('content/itinerary/editquotation&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');
			$data['link_create_confirmation'] = $this->url->link('content/itinerary/editconfirmation&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');

			$data['link_delete_itinerary'] = $this->url->link('content/itinerary/delete&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');

			$data['link_view_itinerary'] = $this->url->link('content/itinerary/viewItrinary&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');
			$data['link_pdf_itinerary'] = $this->url->link('content/itinerary/pdfItrinary&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');
			$data['link_send_itinerary'] = $this->url->link('content/itinerary/sendItrinary&booking_id='.$booking_info['booking_id'].'&token=' . $this->session->data['token'] , '' , 'SSL');
		
			$data['link_view_vouchers'] = $this->url->link('content/itinerary/viewVouchers&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');
			$data['link_pdf_vouchers'] = $this->url->link('content/itinerary/pdfVouchers&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');

			$data['link_view_invoice'] = $this->url->link('content/itinerary/viewInvoice&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');
			$data['link_pdf_invoice'] = $this->url->link('content/itinerary/pdfInvoice&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');

			$data['link_view_summery'] = $this->url->link('content/itinerary/viewSummery&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');
			$data['link_pdf_summery'] = $this->url->link('content/itinerary/pdfSummery&booking_id='.$booking_info['booking_id'], 'token=' . $this->session->data['token'] , 'SSL');
		}

		if (isset($this->request->post['booking_id'])) {
			$data['booking_id'] = $this->request->post['booking_id'];
		} elseif (isset($booking_info)) {
			$data['booking_id'] = $booking_info['booking_id'];
		} else {
			$data['booking_id'] = '';
		}

		if (isset($this->request->post['itinerary_id'])) {
			$data['itinerary_id'] = $this->request->post['itinerary_id'];
		} elseif (isset($booking_info)) {
			$data['itinerary_id'] = $booking_info['itinerary_id'];
		} else {
			$data['itinerary_id'] = '';
		}


		if (isset($this->request->post['customer_name_ar'])) {
			$data['customer_name_ar'] = $this->request->post['customer_name_ar'];
		} elseif (isset($booking_info)) {
			$data['customer_name_ar'] = $booking_info['customer_name_ar'];
		} else {
			$data['customer_name_ar'] = '';
		}

		if (isset($this->request->post['customer_name_en'])) {
			$data['customer_name_en'] = $this->request->post['customer_name_en'];
		} elseif (isset($booking_info)) {
			$data['customer_name_en'] = $booking_info['customer_name_en'];
		} else {
			$data['customer_name_en'] = '';
		}

		if (isset($this->request->post['customer_country'])) {
			$data['customer_country'] = $this->request->post['customer_country'];
		} elseif (isset($booking_info)) {
			$data['customer_country'] = $booking_info['customer_country'];
		} else {
			$data['customer_country'] = '';
		}

		if (isset($this->request->post['booking_type'])) {
			$data['booking_type'] = $this->request->post['booking_type'];
		} elseif(isset($this->request->get['booking_type'])) {
			$data['booking_type'] = $this->request->get['booking_type'];
		} elseif (isset($booking_info)) {
			$data['booking_type'] = $booking_info['booking_type'];
		} else {
			$data['booking_type'] = '';
		}
		if (isset($this->request->post['currancy_type'])) {
			$data['currancy_type'] = $this->request->post['currancy_type'];
		} elseif(isset($this->request->get['currancy_type'])) {
			$data['currancy_type'] = $this->request->get['currancy_type'];
		} elseif (isset($booking_info)) {
			$data['currancy_type'] = $booking_info['currancy_type'];
		} else {
			$data['currancy_type'] = '';
		}
		if (isset($this->request->post['agent_type'])) {
			$data['agent_type'] = $this->request->post['agent_type'];
		} elseif(isset($this->request->get['agent_type'])) {
			$data['agent_type'] = $this->request->get['agent_type'];
		} elseif (isset($booking_info)) {
			$data['agent_type'] = $booking_info['agent_type'];
		} else {
			$data['agent_type'] = '';
		}
		if (isset($this->request->post['arrival_date'])) {
			$data['arrival_date'] = $this->request->post['arrival_date'];
		} elseif(isset($this->request->get['arrival_date'])) {
			$data['arrival_date'] = $this->request->get['arrival_date'];
		} elseif (isset($booking_info)) {
			$data['arrival_date'] = $booking_info['arrival_date'];
		} else {
			$data['arrival_date'] = '';
		}

		if (isset($this->request->post['departure_date'])) {
			$data['departure_date'] = $this->request->post['departure_date'];
		} elseif(isset($this->request->get['departure_date'])) {
			$data['departure_date'] = $this->request->get['departure_date'];
		} elseif (isset($booking_info)) {
			$data['departure_date'] = $booking_info['departure_date'];
		} else {
			$data['departure_date'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif(isset($this->request->get['email'])) {
			$data['email'] = $this->request->get['email'];
		} elseif (isset($booking_info)) {
			$data['email'] = $booking_info['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['phone'])) {
			$data['phone'] = $this->request->post['phone'];
		} elseif(isset($this->request->get['phone'])) {
			$data['phone'] = $this->request->get['phone'];
		} elseif (isset($booking_info)) {
			$data['phone'] = $booking_info['phone'];
		} else {
			$data['phone'] = '';
		}

		if (isset($this->request->post['num_adults'])) {
			$data['num_adults'] = $this->request->post['num_adults'];
		} elseif(isset($this->request->get['num_adults'])) {
			$data['num_adults'] = $this->request->get['num_adults'];
		} elseif (isset($booking_info)) {
			$data['num_adults'] = $booking_info['num_adults'];
		} else {
			$data['num_adults'] = '';
		}

		if (isset($this->request->post['num_children'])) {
			$data['num_children'] = $this->request->post['num_children'];
		} elseif(isset($this->request->get['num_children'])) {
			$data['num_children'] = $this->request->get['num_children'];
		} elseif (isset($booking_info)) {
			$data['num_children'] = $booking_info['num_children'];
		} else {
			$data['num_children'] = '';
		}

		if (isset($this->request->post['num_bags'])) {
			$data['num_bags'] = $this->request->post['num_bags'];
		} elseif(isset($this->request->get['num_bags'])) {
			$data['num_bags'] = $this->request->get['num_bags'];
		} elseif (isset($booking_info)) {
			$data['num_bags'] = $booking_info['num_bags'];
		} else {
			$data['num_bags'] = '';
		}

		if (isset($this->request->post['notes'])) {
			$data['notes'] = $this->request->post['notes'];
		} elseif (isset($booking_info)) {
			$data['notes'] = $booking_info['notes'];
		} else {
			$data['notes'] = '';
		}

		if (isset($this->request->post['time_added'])) {
			$data['time_added'] = $this->request->post['time_added'];
		} elseif (isset($booking_info)) {
			$data['time_added'] = $booking_info['time_added'];
		} else {
			$data['time_added'] = '';
		} 

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');


		$this->response->setOutput($this->load->view('content/booking_form.tpl', $data));
	
	}
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'content/booking')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}


		// if ($this->request->post['booking_type'] == 2 &&  (utf8_strlen($this->request->post['keyword']) < 1) || (utf8_strlen($this->request->post['keyword']) > 64) ) {
		// 	$this->error['keyword'] = $this->language->get('error_keyword');
		// }

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'content/booking')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}


}

?>