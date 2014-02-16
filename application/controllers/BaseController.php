<?php

//require_once('application/simple_html_dom.php'); 
require_once('application/third_party/pchart/StockGraph.php');

class BaseController extends CI_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->library('DataSource');
        $this->load->library('DailyMainMarketSummary');
        $this->load->library('MarketIndexChart');
        $this->load->library('MarketIndexPerformance');
         $this->load->library('MarketIndexHistory');
        

        $this->load->model('DailyMainSummaryModel');
        $this->load->model('MarketIndexChartModel');
        $this->load->model('MarketIndexPerformanceModel');
        $this->load->model('MarketIndexHistoryModel');

        $this->config->set_item('csrf_protection', FALSE);
    }

    protected function hideErrors() {
        error_reporting(0);
        ini_set('display_errors', 0);
    }

    protected function clearBuffer() {
        ob_get_clean();
    }

    public function toJson($data) {
        $this->clearBuffer();
        $this->output->set_header("Access-Control-Allow-Methods:  GET, POST, OPTIONS");
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $this->output->set_header("Access-Control-Expose-Headers: Access-Control-Allow-Origin");
        $this->output->set_header("Access-Control-Allow-Credentials: true");
        $this->output->set_content_type('application/json');
        $this->output->set_output(json_encode($data));
    }

}

?>
