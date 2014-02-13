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

    public function marketIndexChart() {
        $dateISO = date("Y-m-d");

        $summary = new MarketIndexChart($dateISO);
        $summary->fetch();

    }
}