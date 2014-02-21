<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MarketIndexCharts
 *
 * @author 
 */
class DailyCompanyNews extends DataSource {

    protected $url = '';
    protected $data = array();
    protected $index = 0;
    protected $indexName;

    /**
     *
     * @var DailyCompanyNewsModel 
     */
    protected $model = null;

    function __construct($date) {
        $this->date = $date;
        $this->url = JSE_URL;
    }

    public function init() {
        
    }

    public function load() {

        $news = array();
        $feed = new SimplePie();
        $feed->set_feed_url("http://jstock.com/rssfeed.xml");
        //$feed->set_feed_url("http://www.jamstockex.com/rssfeed.php");
        $feed->enable_cache(false);
        $feed->set_output_encoding('Windows-1252');
        $feed->init();
        $SiteTitle = $feed->get_title();
        $SiteDesc = $feed->get_description();
        $itemCount = $feed->get_item_quantity();
        $items = $feed->get_items();

        foreach ($items as $item) {


            $url = $item->get_permalink();

            $title = $item->get_title();
            $desc = $item->get_description();
            $date = $item->pubDate();
            $link = $item->get_links();
            $dateIso = $this->getDate($date, 'Y-m-d');

            $news = array(
                'news_date' => $this->date,
                'date_iso' => $dateIso,
                'title' => $title,
                'desc' => $desc,
                'date' => $date,
                'link' => $link[0]
            );

            $this->data[] = $news;
        }

        var_dump($this->data);
    }

    protected function save() {
        $this->model->save($this->data);
    }

    public function fetch($result = true) {
        $this->model = new DailyCompanyNewsModel();

        if (!$this->model->isDBCached($this->date, $this->indexName)) {
            $this->init();
            $this->load();
            $this->save();
        }

        return $this->data;
    }

}

?>
