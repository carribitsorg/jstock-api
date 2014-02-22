<?php

//require_once('application/simple_html_dom.php'); 
require_once('application/controllers/BaseController.php');

class News extends BaseController {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        
    }

    public function getDailyNews() {
        $this->clearBuffer();
        
        $news =array();

        $dateISO = $this->getMarketDate();
      
        $model = new DailyCompanyNewsModel();
        $data = $model->getNews($dateISO);
        
        foreach($data as $row)
        {
            $news[$row['date_iso']][] = $row;
        }

        $this->toJson($news);
    }

}