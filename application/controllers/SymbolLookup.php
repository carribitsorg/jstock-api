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
    }

}