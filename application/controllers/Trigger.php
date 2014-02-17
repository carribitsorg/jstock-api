<?php

//require_once('application/simple_html_dom.php'); 
require_once('application/controllers/BaseController.php');

class Trigger extends BaseController {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        
    }

    public function dailySummary() {
        $dateISO = $this->input->get('date');
        $date = date("m/d/Y", strtotime($dateISO));

        $summary = new DailyMainMarketSummary($date);
        $summary->fetch();
    }

    public function mainIndexChart() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexChart($dateISO, 1, DataSource::MAIN_INDEX);
        $summary->fetch();
    }

    public function jseSelectChart() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexChart($dateISO, 2, DataSource::JSE_SELECT);
        $summary->fetch();
    }

    public function allJamaicanChart() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexChart($dateISO, 3, DataSource::ALL_JAMAICAN);
        $summary->fetch();
    }

    public function crossListedChart() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexChart($dateISO, 4, DataSource::CROSS_LISTED);
        $summary->fetch();
    }

    public function mainIndexPerformance() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexPerformance($dateISO, 1, DataSource::MAIN_INDEX);
        $summary->fetch();
    }

    public function jseSelectIndexPerformance() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexPerformance($dateISO, 2, DataSource::JSE_SELECT);
        $summary->fetch();
    }

    public function allJamaicanIndexPerformance() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexPerformance($dateISO, 3, DataSource::ALL_JAMAICAN);
        $summary->fetch();
    }

    public function crossListedIndexPerformance() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexPerformance($dateISO, 4, DataSource::CROSS_LISTED);
        $summary->fetch();
    }

    public function mainMarketIndexHistory() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexHistory($dateISO, 1, DataSource::MAIN_INDEX);
        $summary->fetch();
    }

    public function jseSelectIndexHistory() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexHistory($dateISO, 2, DataSource::JSE_SELECT);
        $summary->fetch();
    }

    public function allJamaicanIndexHistory() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexHistory($dateISO, 3, DataSource::ALL_JAMAICAN);
        $summary->fetch();
    }

    public function crossListedIndexHistory() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexHistory($dateISO, 4, DataSource::CROSS_LISTED);
        $summary->fetch();
    }

    public function mainIndexComposition() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexComposition($dateISO, 1, DataSource::MAIN_INDEX);
        $summary->fetch();
    }

    public function jseSelectIndexComposition() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexComposition($dateISO, 2, DataSource::JSE_SELECT);
        $summary->fetch();
    }

    public function allJamaicanIndexComposition() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexComposition($dateISO, 3, DataSource::ALL_JAMAICAN);
        $summary->fetch();
    }

    public function crossListedIndexComposition() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexComposition($dateISO, 4, DataSource::CROSS_LISTED);
        $summary->fetch();
    }

}