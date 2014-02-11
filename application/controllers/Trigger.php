<?php

//require_once('application/simple_html_dom.php'); 
require_once('application/third_party/pchart/StockGraph.php');

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

    public function test() {
        error_reporting(0);
        ini_set('display_errors', 0);

        $data = "79950.500;79865.290;79840.960;80227.600;79922.910;79619.380;79892.040;80173.720;79771.250;79636.630;79854.040;79567.500;80540.480;81315.470;82387.810;81436.230;81017.930;81192.730;78993.480;79435.220;79184.540;79193.510 Jan 13, 2014 - 79,950.50;Jan 14, 2014 - 79,865.29;Jan 15, 2014 - 79,840.96;Jan 16, 2014 - 80,227.60;Jan 17, 2014 - 79,922.91;Jan 20, 2014 - 79,619.38;Jan 21, 2014 - 79,892.04;Jan 22, 2014 - 80,173.72;Jan 23, 2014 - 79,771.25;Jan 24, 2014 - 79,636.63;Jan 27, 2014 - 79,854.04;Jan 28, 2014 - 79,567.50;Jan 29, 2014 - 80,540.48;Jan 30, 2014 - 81,315.47;Jan 31, 2014 - 82,387.81;Feb 03, 2014 - 81,436.23;Feb 04, 2014 - 81,017.93;Feb 05, 2014 - 81,192.73;Feb 06, 2014 - 78,993.48;Feb 07, 2014 - 79,435.22;Feb 10, 2014 - 79,184.54;Feb 11, 2014 - 79,193.51 13;14;15;16;17;20;21;22;23;24;27;28;29;30;31;Feb;4;5;6;7;10;11";
        $graph = new StockGraph($data);
        ob_get_clean();
        $graph->output();
    }

}