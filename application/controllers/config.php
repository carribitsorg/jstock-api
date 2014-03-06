<?php

require_once('application/controllers/BaseController.php');

class Config extends BaseController {

    function __construct() {
        parent::__construct();
    }

    public function index() {
        $date = $this->getMarketDate();
        $data = array(
            'stock_date' => $date,
            'stock_date_full' => date("l, M j, Y", strtotime($date))
        );

        $this->toJson($data);
    }

}
