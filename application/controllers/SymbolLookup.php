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
        $id = $this->input->get('symbol_code');
        $this->toJson(array());
    }

}