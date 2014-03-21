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
class Market extends DataSource {

    protected $url = '';
    protected $data = array();
    /**
     *
     * @var MarketModel 
     */
    protected $model = null;

    function __construct($date) {
        $this->date = $date;
        $this->url = JSE_URL;
    }

    public function init() {
        $content = file_get_contents($this->url);
        $dom = new domDocument;
        @$dom->loadHTML($content);
        $dom->preserveWhiteSpace = false;
        $this->getMarketDate($dom);
    }

    public function getMarketDate($dom) {
        $finder = new DomXPath($dom);
        $classname = "txtsmall";
        $nodes = $finder->query("//*[contains(@class, '$classname')]");

        $list = $nodes->item(0);
        $text = $list->nodeValue;
        $text = trim(str_ireplace(array('as at ', 'th', 'rd', 'nd', 'st'), '', $text));

        /* $old_date_timestamp = strtotime($text);
          $new_date = date('Y-m-d H:i:s', $old_date_timestamp); */
       
        $myDateTime = DateTime::createFromFormat('j F, Y', $text);
        $newDateString = $myDateTime->format('Y-m-d');

        $this->data['market_date'] = $newDateString;
        $this->data['update_time'] = date('Y-m-d H:i:s', time());
    }

    public function load() {
        
    }

    protected function save() {
        $this->model->save($this->data);
    }

    public function fetch() {
        $this->model = new MarketModel();

        if (!$this->model->isDBCached($this->date)) {
            $this->init();
            $this->load();
            $this->save();
        }

        return $this->data;
    }

}

?>
