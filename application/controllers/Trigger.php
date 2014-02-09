<?php

//require_once('application/simple_html_dom.php'); 

class Trigger extends CI_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->library('DataSource');
        $this->load->library('DailyMainMarketSummary');

        $this->load->model('DailyMainSummaryModel');

        $this->config->set_item('csrf_protection', FALSE);
    }

    public function index() {
        
    }

    public function DailyMainMarketSummary() {

        $date = $this->input->get('date');
        $summary = new DailyMainMarketSummary($date);
        $result = $summary->fetch();

        ob_get_clean();

        $this->output->set_header("Access-Control-Allow-Methods:  GET, POST, OPTIONS");
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $this->output->set_header("Access-Control-Expose-Headers: Access-Control-Allow-Origin");
        $this->output->set_header("Access-Control-Allow-Credentials: true");
        $this->output->set_content_type('application/json');
        $this->output->set_output(json_encode($result));
    }

    public function DailyMainMarketDetail() {

        $date = $this->input->get('date');
        $summary = new DailyMainMarketDetail($date);
        $result = $summary->fetch();

        ob_get_clean();


        $this->output->set_header("Access-Control-Allow-Methods:  GET, POST, OPTIONS");
        $this->output->set_header("Access-Control-Allow-Origin:  *");
        $this->output->set_header("Access-Control-Expose-Headers: Access-Control-Allow-Origin");
        $this->output->set_header("Access-Control-Allow-Credentials: true");
        $this->output->set_header("Content-type: application/json");
        $this->output->set_output(json_encode($result));
    }

}