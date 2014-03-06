<?php

//require_once('application/simple_html_dom.php'); 
require_once('application/controllers/BaseController.php');

class LiveStock extends BaseController {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $model = new LiveStockModel();
        $data = $model->getLiveStock();
        $this->rawJson($data);
    }

}
