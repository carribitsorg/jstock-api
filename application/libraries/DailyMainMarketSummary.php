<?php

class DailyMainMarketSummary extends DataSource {

    const ADVANCING = 2;
    const DECLINING = 3;
    const TRADING_FIRM = 4;

    protected $url = 'http://www.jamstockex.com/controller.php?action=view_summary';
    protected $keys = array();
    protected $tables = array();
    protected $data = array();
    protected $date = '';
    protected $summaryListing = array();
    protected $summaryDetail1 = '';
    protected $summaryDetail2 = '';

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
        $this->tables = $dom->getElementsByTagName('table');

        $this->summaryListing($dom);
        $this->summaryDetail($dom);
    }

    public function summaryListing($dom) {
        $finder = new DomXPath($dom);
        $classname = "Text";
        $nodes = $finder->query("//*[contains(@class, '$classname')]");

        $list = $nodes->item(4)->childNodes;
        foreach ($list as $li) {
            $str = trim($li->nodeValue);
            if (strlen($str) > 0)
                $this->summaryListing[] = $str;
        }
    }

    public function summaryDetail($dom) {
        $finder = new DomXPath($dom);
        $classname = "Text";
        $nodes = $finder->query("//*[contains(@class, '$classname')]");

        $text = $nodes->item(5);
        $this->summaryDetail1 = trim($text->nodeValue);

        $text = $nodes->item(6);
        $this->summaryDetail2 = trim($text->nodeValue);
    }

    public function load() {
        $advancing = $this->getData(self::ADVANCING, 'ADVANCING');
        $declining = $this->getData(self::DECLINING, 'DECLINING');
        $tradingFirm = $this->getData(self::TRADING_FIRM, 'TRADING_FIRM');

        $this->data = array_merge($advancing, $declining, $tradingFirm);
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
            $delails = $this->model->getDailyMainDetail($date);

            $resultFromatted = array();

            foreach ($rows as $row) {
                $resultFromatted['stocks'][$row['stock']][] = $row;
            }
            $resultFromatted['details'] = $delails;
            return $resultFromatted;
        }
    }

    protected function saveSummary() {
        $summary = array(
            'summary_date' => $this->getISODate(),
            'cache_date' => date('Y-m-d H:i:s'),
            'summary1' => $this->summaryDetail1,
            'summary2' => $this->summaryDetail2,
            'summary_list' => json_encode($this->summaryListing),
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

        $rows = $this->tables->item($index)->getElementsByTagName('tr');
        $rowIndex = 0;

        foreach ($rows as $row) {
            if ($rowIndex == 0) {
                $cols = $row->getElementsByTagName('td');
                $keys[] = trim($cols->item(0)->nodeValue);
                $keys[] = trim($cols->item(1)->nodeValue);
                $keys[] = trim($cols->item(2)->nodeValue);
                $keys[] = trim($cols->item(3)->nodeValue);
            } else {
                $cols = $row->getElementsByTagName('td');
                $data[] = array(
                    'summary_date' => $this->getISODate(),
                    'stock' => $indexName,
                    'security' => trim($cols->item(0)->nodeValue),
                    'volume' => trim($cols->item(1)->nodeValue),
                    'close_price' => trim($cols->item(2)->nodeValue),
                    'change' => trim($cols->item(3)->nodeValue)
                );
            }
            $rowIndex++;
        }
        $this->keys = $keys;
        return $data;
    }

}

?>