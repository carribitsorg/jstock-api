<?php

//require_once('application/simple_html_dom.php'); 
require_once('application/controllers/BaseController.php');

class SymbolLookup extends BaseController {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        
    }

    public function refreshSymbol() {
        $model = new SymbolLookup();
        $data = $model->getNewsItem($id);
        
        $data['full_date'] = 'Published ' .  date("l, F j, Y", strtotime($data['date_iso']));

        $this->toJson($data);
    }

}