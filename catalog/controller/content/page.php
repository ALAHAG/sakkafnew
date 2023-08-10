<?php

class ControllerContentPage extends Controller {
	private $data = array();
	private $category = 1; // Session
	public $pagination = true;

	public function index()
	{


		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('/','')
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('content/page', '' , 'SSL')
		);


		$this->response->setOutput($this->listContent());
	}

	public function listContent($arg = array())
	{

		if(isset($this->request->get['content_id'])){
			$category_id = $this->request->get['content_id'];
		}else{
			$category_id=7;
		}

		if($arg){
			if (isset($arg['pagination']) && is_bool($arg['pagination'])){
				$this->pagination = $arg['pagination'];
			}
		}

		$data = $this->data;

		$this->load->model('content/category');

		$category = $this->model_content_category->getData($category_id);
		 $this->document->setTitle($category['title']);

		$data['category_title'] = $category['title'];



		$this->load->model('content/page');

		// $data += $this->load->language('content/page');



		$filters = array();

		if (isset($category_id)) {
			$filters['category_id'] = $category_id;
		}else{
			$filters['category_id'] =7;
		}

		if (isset($this->request->get['page'])) {
			$filters['page'] = $this->request->get['page'];
		} else {
			$filters['page'] = 1;
		}

		if (isset($this->request->get['city'])) {
			$filters['city'] = $this->request->get['city'];
		}


		$filters['start'] = ($filters['page'] - 1) * 12;

		$filters['limit'] = 12;

		$pages = $this->model_content_page->getAllData($filters);

		$total_pages = $this->model_content_page->getTotalData($filters);

		$this->load->model('tool/image');
		foreach ($pages as $key => $page) {
			$pages[$key]['thumb'] = $this->model_tool_image->resize($page['image'], 300, 250, 'h');

		}

		$data['pages'] = $pages;


		if($this->pagination){

			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}
		}
		$pagination = new Pagination();
		$pagination->total = $total_pages;
		$pagination->page = $page;
		$pagination->limit = 12;
		$link =  "//$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		if(isset($this->request->get['rate'])||isset($this->request->get['city'])){
			$parts=parse_url($link);
			if(isset($this->request->get['page'])){
				$link=substr($link, 0, strrpos($link, "&page"));
			}
			$pagination->url = $link . '&page={page}';
		}else{
			$parts=parse_url($link);
			$pagination->url = $parts['path'] . '?page={page}';
		}

		$data['pagination'] = $pagination->render();

		$this->document->setTitle('اكتشف ماليزيا- مدن ماليزيا - افضل مناطق ماليزيا - رحلات ماليزيا -دليل ماليزياالسياحي ');
		$this->document->setDescription(' معلومات عن ماليزيا واهم المناطق السياحية في المدن الماليزيه ورحلات السياحية والجولات المهمه , دليل ماليزيا السياحي');//$this->config->get('config_meta_description')
		$this->document->setKeywords("دليل ماليزيا السياحي , مدن ماليزيا , رحلات ماليزيا , معلومات عامة عن ماليزيا , اهم الاماكن السياحية في ماليزيا ");//$this->config->get('config_meta_keyword')


		// $data['results'] = sprintf($this->language->get('text_pagination'), ($total_pages) ? (($page - 1) * 12) + 1 : 0, ((($page - 1) * 12) > ($total_pages - 12)) ? $total_pages : ((($page - 1) * 12) + 12), $total_pages, ceil($total_pages / 12));

		//}
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['pagesfilter'] = $this->load->controller('common/pagesfilter');
		$data['footer'] = $this->load->controller('common/footer');

		return $this->load->view('default/template/content/list_pages.tpl', $data);

	}

	public function show()
	{

		if (isset($this->request->get['content_id'])) {

			$this->load->model('content/page');

			$page = $this->model_content_page->getData($this->request->get['content_id']);

			if($page){
				$this->document->addScript('catalog/view/javascript/jssor.slider.mini.js');


				$this->load->model('tool/image');

				$page_content = $this->model_content_page->getDataContent($this->request->get['content_id']);


				$this->document->setTitle($page_content['title']);
				$this->document->setDescription($page_content['meta_description']);

				$page_images = $this->model_content_page->getDataImages($this->request->get['content_id']);
				foreach ($page_images as $key => $image) {
					$page_images[$key]['thumb'] =$this->model_tool_image->resize($image['image'], 70, 50, 'h');
					$page_images[$key]['image'] =$this->model_tool_image->resize($image['image'], 870, 560, 'w');
					if($image['cover']==1)
					$page_images['covera'] = HTTP_SERVER.'image/'.$image['image'];

				}
				$data['page_images'] = $page_images;

				$data['page_id'] = $page['page_id'];
				$data['title'] = $page_content['title'];
				$data['content'] = $page_content['content'];


				$filters['category_id'] = $page['category_id'];
				$filters['limit'] = 4;
				$filters['random'] = true;

				$pages = $this->model_content_page->getAllData($filters);
				foreach ($pages as $key => $page) {
					$pages[$key]['thumb'] =$this->model_tool_image->resize($page['image'], 230, 170, 'w');
				}


				$data['pages'] = $pages;

				$data['header'] = $this->load->controller('common/header');
				// $data['pagesidebar'] = $this->load->controller('common/pagesidebar',$pages);
				$data['footer'] = $this->load->controller('common/footer');


				$this->response->setOutput($this->load->view('default/template/content/show_page.tpl', $data));


			}else{
				$this->redirect('/');
			}





		}

	}

}
?>
