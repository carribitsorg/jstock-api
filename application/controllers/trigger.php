<?php

//require_once('application/simple_html_dom.php'); 
require_once('application/controllers/BaseController.php');

class Trigger extends BaseController {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        
    }

    public function liveStock() {
        $market = new LiveStockUpdate();
        $market->fetch();
    }

    public function symbolUpdate() {
        $dateISO = $this->getMarketDate();

        $model = new SymbolDetailModel();
        $symbols = $model->getOutdatedSymbols($dateISO);

        foreach ($symbols as $symbol) {
            $stockCode = $symbol['stock_code'];
            $symbolDetail = new SymbolDetail($stockCode, $dateISO);
            $symbolDetail->fetch();
        }
    }

    public function market() {
        $dateISO = $this->getRunDate();

        $market = new Market($dateISO);
        $market->fetch();
    }

    public function dailySummary() {
        $dateISO = $this->getMarketDate();
        $date = date("m/d/Y", strtotime($dateISO));

        $summary = new DailyMainMarketSummary($date);
        $summary->fetch();
    }

    public function dailyNews() {
        $dateISO = $this->getRunDate();
        $news = new DailyCompanyNews($dateISO);
        $news->fetch();
    }

    public function dailyQuote() {
        $dateISO = $this->getMarketDate();
        $news = new DailyQuote($dateISO);
        $news->fetch();
    }

    public function refreshSymbol() {
        $news = new Symbol();
        $news->fetch();
    }

    public function mainIndexChart() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexChart($dateISO, 1, DataSource::MAIN_INDEX);
        $summary->fetch();
    }

    public function jseSelectChart() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexChart($dateISO, 2, DataSource::JSE_SELECT);
        $summary->fetch();
    }

    public function allJamaicanChart() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexChart($dateISO, 3, DataSource::ALL_JAMAICAN);
        $summary->fetch();
    }

    public function crossListedChart() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexChart($dateISO, 4, DataSource::CROSS_LISTED);
        $summary->fetch();
    }

    public function mainIndexPerformance() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexPerformance($dateISO, 1, DataSource::MAIN_INDEX);
        $summary->fetch();
    }

    public function jseSelectIndexPerformance() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexPerformance($dateISO, 2, DataSource::JSE_SELECT);
        $summary->fetch();
    }

    public function allJamaicanIndexPerformance() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexPerformance($dateISO, 3, DataSource::ALL_JAMAICAN);
        $summary->fetch();
    }

    public function crossListedIndexPerformance() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexPerformance($dateISO, 4, DataSource::CROSS_LISTED);
        $summary->fetch();
    }

    public function mainMarketIndexHistory() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexHistory($dateISO, 1, DataSource::MAIN_INDEX);
        $summary->fetch();
    }

    public function jseSelectIndexHistory() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexHistory($dateISO, 2, DataSource::JSE_SELECT);
        $summary->fetch();
    }

    public function allJamaicanIndexHistory() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexHistory($dateISO, 3, DataSource::ALL_JAMAICAN);
        $summary->fetch();
    }

    public function crossListedIndexHistory() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexHistory($dateISO, 4, DataSource::CROSS_LISTED);
        $summary->fetch();
    }

    public function mainIndexComposition() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexComposition($dateISO, 1, DataSource::MAIN_INDEX);
        $summary->fetch();
    }

    public function jseSelectIndexComposition() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexComposition($dateISO, 2, DataSource::JSE_SELECT);
        $summary->fetch();
    }

    public function allJamaicanIndexComposition() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexComposition($dateISO, 3, DataSource::ALL_JAMAICAN);
        $summary->fetch();
    }

    public function crossListedIndexComposition() {
        $dateISO = $this->getMarketDate();
        $summary = new MarketIndexComposition($dateISO, 4, DataSource::CROSS_LISTED);
        $summary->fetch();
    }

}
