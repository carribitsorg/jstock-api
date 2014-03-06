<?php

//require_once('application/simple_html_dom.php'); 
require_once('application/controllers/BaseController.php');

class SymbolLookup extends BaseController {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        
    }

    public function allSymbols() {
        $model = new SymbolLookupModel();
        $data = $model->getAllSymbol();
        $this->toJson($data);
    }

    public function symbolData() {
        $stockCode = $this->input->get('symbol_code');
        $dateIso = $this->getMarketDate();

        $symbolDetail = new SymbolDetail($stockCode, $dateIso);
        $symbolDetail->fetch();

        $model = new SymbolDetailModel();
        $data = $model->getStockDetails($dateIso, $stockCode);
        $this->toJson($data);
    }

    public function symbolAnnualGraphData() {
        $graphData = array();

        $stockCode = $this->input->get('symbol_code');
        $dateIso = $this->getMarketDate();

        $symbolDetail = new SymbolDetail($stockCode, $dateIso);
        $symbolDetail->fetch();

        $model = new SymbolDetailModel();
        $graphStr = $model->getAnnualStockGraph($dateIso, $stockCode);

        $chart = new SimpleXMLElement($graphStr);

        foreach ($chart->set as $set) {
            $graphData['label'][] = $set['label'];
            $graphData['value'][] = bcdiv($set['value'], 1000000, 0);
        }
        $settings = $this->getGraphSettings($graphData['value']);
        $graph = new SymbolGraph($graphData, $settings);

        $this->clearBuffer();
        $graph->output();

        var_dump($graphData);
    }

    function getGraphSettings($values) {
        $maxValue = max($values);
        $value = 0;

        if ($maxValue >= 10 && $maxValue <= 100) {
            $value = ceil($maxValue / 10) * 10;
        } else if ($maxValue >= 100 && $maxValue <= 250) {
            $value = ceil($maxValue / 10) * 10;
        } else if ($maxValue >= 250 && $maxValue <= 500) {
            $value = ceil($maxValue / 100) * 100;
        } else if ($maxValue >= 500 && $maxValue <= 1000) {
            $value = ceil($maxValue / 100) * 100;
        } else if ($maxValue >= 1000 && $maxValue <= 10000) {
            $value = ceil($maxValue / 1000) * 1000;
        } else if ($maxValue >= 10000) {
            $value = ceil($maxValue / 1000) * 1000;
        } else {
            $value = ceil($maxValue);
        }

        $factor = $value / 5;

        $settings = array(
            'max' => $maxValue,
            'factor' => $factor
        );

        return $settings;
    }

}
