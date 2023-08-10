<?php
class ControllerContentHotels extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('content/hotels');

		$this->document->setTitle($this->language->get('heading_title'));
		global $accomodation_types;
		$this->load->model('content/hotels');
		$this->getList();
	}

	public function add() {
		$this->load->language('content/hotels');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/hotels');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_content_hotels->addHotel($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('content/hotels', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('content/hotels');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/hotels');
		 // print_r( $this->request->post);exit();
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				 // print_r( $this->request->post);exit();
			// dd($this->request->post);
			$this->model_content_hotels->editHotel($this->request->get['hotel_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('content/hotels', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('content/hotels');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('content/hotels');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $hotel_id) {
				$this->model_content_hotels->deleteHotel($hotel_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('content/hotels', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}



	protected function getList() {
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
			);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/hotels', 'token=' . $this->session->data['token'] . $url, 'SSL')
			);

		$data['insert'] = $this->url->link('content/hotels/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('content/hotels/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['repair'] = $this->url->link('content/hotels/repair', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['categories'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
			);

		$category_total = $this->model_content_hotels->getTotalHotels();

		$results = $this->model_content_hotels->getHotels($filter_data);

		$hotels = array();
		foreach ($results as $result) {
			$hotels[] = array(
				'hotel_id' => $result['hotel_id'],
				'city_id' => $result['city_id'],
				'city_name' => $result['city_name'],
				'status' => $result['status'] == 1 ?  'Active' : 'Unactive',
				'address'        => $result['address'],
				'email'  => $result['email'],
				'star_rate'  => $result['star_rate'],
				'hotel_english_name'  => $result['hotel_english_name'],
				'edit'        => $this->url->link('content/hotels/edit', 'token=' . $this->session->data['token'] . '&hotel_id=' . $result['hotel_id'] . $url, 'SSL'),
				'delete'      => $this->url->link('content/hotels/delete', 'token=' . $this->session->data['token'] . '&hotel_id=' . $result['hotel_id'] . $url, 'SSL')
				);
		}
		$data['hotels']= $hotels;

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['star_rate'] = $this->language->get('star_rate');
		$data['column_city'] = $this->language->get('column_city');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_edit'] = $this->language->get('button_edit');

		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_rebuild'] = $this->language->get('button_rebuild');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('content/hotels', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('content/hotels', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $category_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('content/hotels', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($category_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($category_total - $this->config->get('config_limit_admin'))) ? $category_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $category_total, ceil($category_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/hotels_list.tpl', $data));
	}

	protected function getForm() {

		$this->document->addScript('view/javascript/plupload/plupload.full.min.js');


		$data['uploader'] = $this->url->link('tool/upload/plupload&token=' . $this->session->data['token'],'', 'SSL');

		$this->load->model('localisation/zone');
		$this->load->model('tool/image');

		$data['heading_title'] = $this->language->get('heading_title');
		$data += $this->load->language('content/hotels');
		$data['text_form'] = !isset($this->request->get['hotel_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		$data['current_lang_id'] = $this->config->get('config_language_id');

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
			);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/hotels', 'token=' . $this->session->data['token'] . $url, 'SSL')
			);

		if (!isset($this->request->get['hotel_id'])) {
			$data['action'] = $this->url->link('content/hotels/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('content/hotels/edit', 'token=' . $this->session->data['token'] . '&hotel_id=' . $this->request->get['hotel_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('content/hotels', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['hotel_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$hotel_info = $this->model_content_hotels->getHotel($this->request->get['hotel_id']);
		}
		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['hotel_description'])) {
			$data['hotel_description'] = $this->request->post['hotel_description'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$data['hotel_description'] = $this->model_content_hotels->getHotelDescriptions($this->request->get['hotel_id']);
		} else {
			$data['hotel_description'] = array();
		}

			$this->load->model('localisation/zone');

			$data['zones'] = $this->model_localisation_zone->getZonesByCountryId(129); // 129 => Malaysia

			if (isset($this->request->post['city_id'])) {
				$data['city_id'] = $this->request->post['city_id'];
			} elseif (isset($hotel_info)) {
				$data['city_id'] = $hotel_info['city_id'];
			} else {
				$data['city_id'] = 0;
			}

			if (isset($this->request->post['zone_id'])) {
				$data['zone_id'] = $this->request->post['zone_id'];
				$data['cities'] = $this->model_localisation_zone->getCitiesByZoneId($this->request->post['zone_id']); // 129 => Malaysia
			} elseif (isset($hotel_info)) {
				$city = $this->model_localisation_zone->getCity($hotel_info['city_id']);
				if($city){
					$data['zone_id'] =  $city['zone_id'];
					$data['cities'] =  $this->model_localisation_zone->getCitiesByZoneId($city['zone_id']); // 129 => Malaysia

				}else{
					$data['zone_id'] = '';
					$data['cities'] = array();
				}
			} else {
				$data['zone_id'] = '';
				$data['cities'] = array();
			}



		if (isset($this->request->post['address'])) {
			$data['address'] = $this->request->post['address'];
		} elseif (!empty($hotel_info)) {
			$data['address'] = $hotel_info['address'];
		} else {
			$data['address'] = '';
		}
		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($hotel_info)) {
			$data['email'] = $hotel_info['email'];
		} else {
			$data['email'] = '';
		}
		if (isset($this->request->post['rate'])) {
			$data['rate'] = $this->request->post['rate'];
		} elseif (!empty($hotel_info)) {
			$data['rate'] = $hotel_info['star_rate'];
		} else {
			$data['rate'] = '';
		}
		if (isset($this->request->post['phone'])) {
			$data['phone'] = $this->request->post['phone'];
		} elseif (!empty($hotel_info)) {
			$data['phone'] = $hotel_info['phone'];
		} else {
			$data['phone'] = '';
		}
		if (isset($this->request->post['fax'])) {
			$data['fax'] = $this->request->post['fax'];
		} elseif (!empty($hotel_info)) {
			$data['fax'] = $hotel_info['fax'];
		} else {
			$data['fax'] = '';
		}
		if (isset($this->request->post['map'])) {
			$data['map'] = $this->request->post['map'];
		} elseif (!empty($hotel_info)) {
			$data['map'] = $hotel_info['map'];
		} else {
			$data['map'] = '';
		}
		if (isset($this->request->post['website_url'])) {
			$data['website_url'] = $this->request->post['website_url'];
		} elseif (!empty($hotel_info)) {
			$data['website_url'] = $hotel_info['website_url'];
		} else {
			$data['website_url'] = '';
		}

		if (isset($this->request->post['slug'])) {
			$data['slug'] = $this->request->post['slug'];
		} elseif (!empty($hotel_info)) {
			$data['slug'] = $hotel_info['slug'];
		} else {
			$data['slug'] = '';
		}

		if (isset($this->request->post['hotel_english_name'])) {
			$data['hotel_english_name'] = $this->request->post['hotel_english_name'];
		} elseif (!empty($hotel_info)) {
			$data['hotel_english_name'] = $hotel_info['hotel_english_name'];
		} else {
			$data['hotel_english_name'] = '';
		}

		// if (isset($this->request->post['hotel_facilities'])) {
		// 	$data['hotel_facilities'] = $this->request->post['hotel_facilities'];
		// } elseif (!empty($hotel_info)) {
		// 	$data['hotel_facilities'] = $hotel_info['facilities'];
		// } else {
		// 	$data['hotel_facilities'] = '';
		// }


		// if (isset($this->request->post['city_id'])) {
		// 	$this->data['city_id'] = $this->request->post['city_id'];
		// 	$city_name = $this->model_localisation_zone->getZone($this->request->post['city_id']);
		// 	$data['city_name'] = $city_name['name'];

		// 	$data['country_id'] = $this->request->post['country_id'];
		// 	$country_name = $this->model_localisation_country->getCountryByCityId($this->request->post['city_id']);
		// 	$data['country_name'] = $country_name['name'];
		// } elseif (!empty($hotel_info)) {
		// 	$data['city_id'] = $hotel_info['city_id'];

		// 	$city_name = $this->model_localisation_zone->getZone($hotel_info['city_id']);

		// 	$data['city_name'] = $city_name['name'];


		// 	$data['country_id'] = $country_name['country_id'];
		// 	$data['country_name'] = $country_name['name'];
		// } else {
		// 	$data['city_id'] = '';
		// 	$data['city_name'] = '';

		// 	$data['country_id'] = '129';
		// 	$data['country_name'] = 'Malaysia';
		// }

		$this->load->model('catalog/filter');

		$this->load->model('tool/image');

		if (isset($this->request->post['hotel_rooms'])) {
			$data['hotel_rooms'] = $this->request->post['hotel_rooms'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$data['hotel_rooms'] = $this->model_content_hotels->getHotelRooms($this->request->get['hotel_id']);
		} else {
			$data['hotel_rooms'] = array();
		}

		if (isset($this->request->post['hotel_image'])) {
			$data['hotel_images'] = $this->request->post['hotel_image'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$hotel_image = array();
			$hotel_images = $this->model_content_hotels->getHotelImages($this->request->get['hotel_id']);
			foreach ($hotel_images as $image) {
				$hotel_image[] = array( 'thumb' => $this->model_tool_image->resize($image['image'], 100, 100),
					'image' => $image['image'],
					'cover' => $image['cover']);
			}
			$data['hotel_images'] = $hotel_image;
		} else {
			$data['hotel_images'] = array();
		}
		$data['no_image'] = $this->model_tool_image->resize('no_image.png', 100, 100);


		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 70, 40);

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($hotel_info)) {
			$data['status'] = $hotel_info['status'];
		} else {
			$data['status'] = 1;
		}



		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/hotels_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'content/hotels')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['hotel_description'] as $language_id => $value) {
			if ((utf8_strlen($value['hotel_name']) < 2) || (utf8_strlen($value['hotel_name']) > 255)) {
				$this->error['hotel_name'][$language_id] = $this->language->get('error_name');
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'content/hotels')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}


	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('content/hotels');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
				);

			$results = $this->model_content_hotels->getCategories($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'hotel_id' => $result['hotel_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
					);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	public function getRooms()
	{
		if(isset($this->request->post['hotel_id'])){
			$hotel_id = $this->request->post['hotel_id'];
			$this->load->model('content/hotels');
			$rooms_list = $this->model_content_hotels->getHotelRooms($hotel_id);

			echo json_encode($rooms_list);
		}
	}
}
