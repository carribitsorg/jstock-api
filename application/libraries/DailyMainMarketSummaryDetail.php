<?php

class DailyMainMarketSummaryDetail extends DataSource {

  

    protected $url = 'http://www.jamstockex.com/controller.php?action=view_summary';
    
    protected $tables = array();
    protected $data = array();
    protected $date = '';

    /**
     *
     * @var DailyMainSummaryModel 
     */
    protected $model = null;

    function __construct($date) {
        $this->date = $date;
    }

    public function init() {
        $data = file_get_contents($this->url . '&TradingDate=' . $this->date);
        $dom = new domDocument;

        @$dom->loadHTML($data);
        $dom->preserveWhiteSpace = false;
        $this->tables = $dom->getElementsByTagName('ul');
    }

    public function load() {
        $advancing = $this->getData();
      
    }

    public function fetch($result = true) {
        $this->model = new DailyMainSummaryModel();
        $date = $this->getISODate();
        if (!$this->model->isDBCached($date)) {
            $this->init();
            $this->load();
            $this->saveStock();
            $this->saveSummary();
        }

        if ($result == true) {
            $rows = $this->model->getDailyMainSummary($date);
            $resultFromatted = array();

            foreach ($rows as $row) {
                $resultFromatted[$row['stock']][] = $row;
            }
            return $resultFromatted;
        }
    }

    protected function saveSummary() {
        $summary = array(
            'summary_date' => $this->getISODate(),
            'cache_date' => date('Y-m-d H:i:s'),
            'status' => 'COMPLETE'
        );
        $this->model->saveSummaryMaster($summary);
    }

    public function saveStock($index) {
        foreach ($this->data as $row) {
            $data[] = array(
                'summary_date' => $row['summary_date'],
                'stock' => $row['stock'],
                'security' => $row['security'],
                'volume' => $this->toDecimal($row['volume']),
                'close_price' => $this->toDecimal($row['close_price']),
                'change' => $this->toDecimal($row['change'])
            );
        }
        $this->model->save($data);
    }

    public function getData($index, $indexName) {
        $keys = array();
        $data = array();

        $rows = $this->tables->item($index)->getElementsByTagName('li');
       
        return $data;
    }

}
?>