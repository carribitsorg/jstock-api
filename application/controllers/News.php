<?php

//require_once('application/simple_html_dom.php'); 
require_once('application/controllers/BaseController.php');

class News extends BaseController {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        
    }

    public function dailyNews() {
        $this->clearBuffer();

        $news = array();

        $dateISO = $this->getMarketDate();

        $model = new DailyCompanyNewsModel();
        $data = $model->getNews($dateISO);

        foreach ($data as $row) {
            $row['full_date'] = date("l, F j, Y", strtotime($row['date_iso']));
            $news[$row['full_date']][] = $row;
        }

        $this->toJson($news);
    }

    public function viewNews() {
        $this->clearBuffer();

        $id = $this->input->get('id');

        $model = new DailyCompanyNewsModel();
        $data = $model->getNewsItem($id);
        
        $data['full_date'] = 'Publiahed ' .  date("l, F j, Y", strtotime($data['date_iso']));

        $this->toJson($data);
    }

}