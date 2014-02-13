<?php

//require_once('application/simple_html_dom.php'); 
require_once('application/controllers/BaseController.php');

class MainMarket extends BaseController {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        
    }

    public function dailySummary() {
        $dateISO = $this->input->get('date');
        
        $this->model = new DailyMainSummaryModel();

        $rows = $this->model->getDailyMainSummary($dateISO);
        $delails = $this->model->getDailyMainDetail($dateISO);

        $resultFromatted = array();

        foreach ($rows as $row) {
            $resultFromatted['stocks'][$row['stock']][] = $row;
        }
        $resultFromatted['details'] = $delails;
        
        $this->toJson($resultFromatted);
    }

    public function oneMonthGraph() {
        $this->clearBuffer();

        $dateISO = $this->input->get('date');

        $model = new MarketIndexChartModel();
        $data = $model->getOneMonthGraph($dateISO);

        $graph = new StockGraph($data['one_month_graph']);
        ob_get_clean();
        $graph->output();
    }

}