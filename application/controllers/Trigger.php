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
        $summary = new MarketIndexChart($dateISO, 1, MarketIndexChart::MAIN_INDEX);
        $summary->fetch();
    }

    public function jseSelectChart() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexChart($dateISO, 2, MarketIndexChart::JSE_SELECT);
        $summary->fetch();
    }

    public function allJamaicanChart() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexChart($dateISO, 3, MarketIndexChart::ALL_JAMAICAN);
        $summary->fetch();
    }

    public function crossListed() {
        $dateISO = date("Y-m-d");
        $summary = new MarketIndexChart($dateISO, 4, MarketIndexChart::CROSS_LISTED);
        $summary->fetch();
    }

}