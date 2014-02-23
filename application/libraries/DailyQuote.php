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
class DailyQuote extends DataSource {

    protected $url = '';
    protected $data = array();
   
    /**
     *
     * @var DailyQuoteModel 
     */
    protected $model = null;

    function __construct($date, $index, $indexName) {
        $this->date = $date;
        $this->index = $index;
        $this->indexName = $indexName;
        $this->url = JSE_URL . "/controller.php?action=view_index_history&IndexCode=$date";
    }

    public function init() {
      
    }

    public function historyDetail($dom) {
        
    }

    public function load() {
        
    }

    protected function save() {
        $this->model->saveQuoteMain($this->data);
    }

    public function fetch($result = true) {
        $this->model = new DailyQuoteModel();

        if (!$this->model->isDBCached($this->date, $this->indexName)) {
            $this->init();
            $this->load();
            $this->save();
        }

        return $this->data;
    }

}

?>
