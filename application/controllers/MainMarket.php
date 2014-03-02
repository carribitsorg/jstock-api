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
        $dateISO = $this->getMarketDate();

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

        $dateISO = $this->getMarketDate();
        $indexName = (string) $this->input->get('index_name');

        $settings = array(
            'max' => 86400,
            'factor' => 1200
        );

        $model = new MarketIndexChartModel();
        $data = $model->getOneMonthGraph($dateISO, $indexName);

        $graph = new StockGraph($data['one_month_graph'], $settings);
        $this->clearBuffer();
        $graph->output();
    }

    public function marketIndexDetails() {
        $this->clearBuffer();

        $dateISO = $this->getMarketDate();
        $indexName = (string) $this->input->get('index_name');

        $model = new MarketIndexChartModel();
        $data = $model->getMarketIndexDetails($dateISO, $indexName);

        $this->toJson($data);
    }

    public function marketIndexFullDetails() {
        $this->clearBuffer();
        $dateISO = $this->getMarketDate();
        $data = array();

        $indexName = (string) $this->input->get('index_name');

        $modelInfo = new MarketIndexChartModel();
        $data['information'] = $modelInfo->getMarketIndexStockDetails($dateISO, $indexName);

        $modelPerformance = new MarketIndexPerformanceModel();
        $data['performance'] = $modelPerformance->getMarketIndexDetails($dateISO, $indexName);

        $modelHistory = new MarketIndexHistoryModel();
        $data['history'] = $modelHistory->getMarketIndexDetails($dateISO, $indexName);

        $modelComposition = new MarketIndexCompositionModel();
        $data['composition'] = $modelComposition->getMarketIndexDetails($dateISO, $indexName);

        $this->toJson($data);
    }

    function dailyQuote() {
        $this->clearBuffer();
        $dateISO = $this->getMarketDate();
        $data = array();

        $model = new DailyQuoteModel();
        $data['quote'] = $model->getQuote($dateISO);
        $data['ordinary_shares'] = $model->getOrdinaryShares($dateISO);
        $data['preference_shares'] = $model->getPreferenceShares($dateISO);
        $data['us_denominated_shares'] = $model->getUsDenominatedShares($dateISO);

        $this->toJson($data);
    }

}