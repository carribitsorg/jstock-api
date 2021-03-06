<?php

//require_once('application/simple_html_dom.php'); 
//require_once('application/third_party/pchart/PChartLoader.php');

require_once('application/third_party/pchart/StockGraph.php');
require_once('application/third_party/pchart/SymbolGraph.php');
require_once('application/third_party/simple/autoloader.php');

class BaseController extends CI_Controller {

    public function __construct() {
        ob_start();
        parent::__construct();

        $this->load->library('DataSource');
        $this->load->library('DailyMainMarketSummary');
        $this->load->library('MarketIndexChart');
        $this->load->library('MarketIndexPerformance');
        $this->load->library('MarketIndexHistory');
        $this->load->library('MarketIndexComposition');
        $this->load->library('DailyCompanyNews');
        $this->load->library('DailyQuote');
        $this->load->library('Symbol');
        $this->load->library('SymbolDetail');
        $this->load->library('Market');
        $this->load->library('LiveStockUpdate');

        $this->load->model('DailyMainSummaryModel');
        $this->load->model('MarketIndexChartModel');
        $this->load->model('MarketIndexPerformanceModel');
        $this->load->model('MarketIndexHistoryModel');
        $this->load->model('MarketIndexCompositionModel');
        $this->load->model('DailyCompanyNewsModel');
        $this->load->model('DailyQuoteModel');
        $this->load->model('SymbolLookupModel');
        $this->load->model('SymbolDetailModel');
        $this->load->model('MarketModel');
        $this->load->model('LiveStockModel');

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

    public function rawJson($data) {
        $this->clearBuffer();
        $this->output->set_header("Access-Control-Allow-Methods:  GET, POST, OPTIONS");
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $this->output->set_header("Access-Control-Expose-Headers: Access-Control-Allow-Origin");
        $this->output->set_header("Access-Control-Allow-Credentials: true");
        $this->output->set_content_type('application/json');
        $this->output->set_output($data);
    }

    public function getMarketDate() {
        $model = new MarketModel();
        $date = $model->getLastDate();

        if (!$date) {
            $currentDate = $this->getDate('c');
            $date = date('Y-m-d', (strtotime('-1 day', strtotime($currentDate))));
        }
        return $date;
    }

    public function getRunDate() {
        $date = $this->input->get('date');
        if (!$date) {
            return $this->getDate('c');
        }
        return $date;
    }

    public function getCurrentDate() {
        return $this->getDate('c');
    }

    public function getCurrentTime() {
        return date('Y-m-d H:i:s', time());
    }

    function getDate($format) {
        $datetime = new DateTime();
        $date = $datetime->format($format);
        return substr($date, 0, 10);
    }

}

?>
