<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class webgis extends CI_Controller {

    public function __construct(){
		parent::__construct();
		$this->load->model('HotspotModel');
		$this->load->model('KecamatanModel');
	}

	public function index()
	{
		$datacontent['url']='webgis';
		
		//$datacontent['title']='Halaman Leaflet Point';
		$datacontent['title']='WEBGIS';
	
		$data['content']=$this->load->view('admin/leafletpoint/mapView',$datacontent,TRUE);
		//$data['content']=$this->load->view('website/webgis',$datacontent,TRUE);

		$data['js']=$this->load->view('admin/leafletpoint/js/mapJs',$datacontent,TRUE);
		//$data['js']=$this->load->view('website/webgis-js',$datacontent,TRUE);

		$data['title']=$datacontent['title'];

		//$this->load->view('admin/layouts/html',$data);
		$this->load->view('website/layouts/html',$data);
	}
}
