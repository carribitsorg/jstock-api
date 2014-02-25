<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SymbolDetailModel
 *
 * @author 
 */
class SymbolDetail extends DataSource {

    protected $url = '';
    protected $data = array();
    protected $stockCode = 0;
    protected $date;

    /**
     *
     * @var MarketIndexHistoryModel 
     */
    protected $model = null;

    function __construct($stockCode, $date) {
        $this->stockCode = $stockCode;
        $this->date = $date;
        $this->url = JSE_URL . "/controller.php?action=view_stock_charts&StockCode=$stockCode";
    }

    public function init() {
        $content = file_get_contents($this->url);

        $dom = new domDocument;

        @$dom->loadHTML($content);
        $dom->preserveWhiteSpace = false;

        $this->data['cache_date'] = $this->date;
        $this->data['stock_code'] = $this->stockCode;

        $this->stockDetailSummary($dom);
        $this->stockDetail($dom);
        $this->getGraphs();
    }

    public function stockDetailSummary($dom) {
        $rowIndex = 0;
        $tables = $dom->getElementsByTagName('table');

        $table = $tables->item(4);
        $rows = $table->getElementsByTagName('tr');

        foreach ($rows as $row) {
            $cols = $row->getElementsByTagName('td');


            if ($rowIndex == 0) {
                $this->data['symbol'] = $this->getData($cols->item(0)->nodeValue, 'Symbol :');
                $this->data['financial_year_end'] = $this->getData($cols->item(0)->nodeValue, 'Financial Year End:');
            }
            if ($rowIndex == 1) {
                $this->data['last_traded_price'] = $this->getData($cols->item(0)->nodeValue, "Last Traded Price: ");
                $this->data['close_price'] = $this->getData($cols->item(0)->nodeValue, 'Close Price: ');
                $this->data['change'] = $this->getData($cols->item(0)->nodeValue, 'Change : ');
                $this->data['change_perc'] = $this->getData($cols->item(0)->nodeValue, 'Change% : ') . ' %';
            }
            if ($rowIndex == 2) {
                $this->data['shares_outstanding'] = $this->getData($cols->item(0)->nodeValue, "Shares Outstanding: ");
                $this->data['market_value_of_shares_outstanding'] = $this->getData($cols->item(0)->nodeValue, 'Market Value Of Shares Outstanding: ');
            }
            $rowIndex++;
        }
    }

    public function stockDetail($dom) {
        $rowIndex = 0;
        $tables = $dom->getElementsByTagName('table');

        $table = $tables->item(5);
        $rows = $table->getElementsByTagName('tr');


        foreach ($rows as $row) {
            $cols = $row->getElementsByTagName('td');


            if ($rowIndex == 0) {
                $this->data['bid'] = $cols->item(1)->nodeValue;
                $this->data['week_to_date'] = $cols->item(3)->nodeValue;
            }
            if ($rowIndex == 1) {
                $this->data['ask'] = $cols->item(1)->nodeValue;
                $this->data['month_to_date'] = $cols->item(3)->nodeValue;
            }
            if ($rowIndex == 2) {
                $this->data['open_previous_day_close'] = $cols->item(1)->nodeValue;
                $this->data['quarter_to_date'] = $cols->item(3)->nodeValue;
            }
            if ($rowIndex == 3) {
                $this->data['today_range'] = $cols->item(1)->nodeValue;
                $this->data['year_to_date'] = $cols->item(3)->nodeValue;
            }
            if ($rowIndex == 4) {
                $this->data['week_range_52'] = $cols->item(1)->nodeValue;
            }
            if ($rowIndex == 5) {
                $this->data['volume_traded'] = $cols->item(1)->nodeValue;
            }
            if ($rowIndex == 6) {
                $this->data['week_volume_range_52'] = $cols->item(1)->nodeValue;
            }
            $rowIndex++;
        }
    }

    function getGraphs() {
        $this->data['quarterly_earning_graph'] = '';
        $this->data['annually_earning_graph'] = '';

        $quarterlyURL = JSE_URL . "/chart-xml/xml/xml_quarterly_earnings_chart-$this->stockCode.xml";
        $annuallyURL = JSE_URL . "/chart-xml/xml/xml_annual_earnings_chart-$this->stockCode.xml";

        $annuallyContent = file_get_contents($annuallyURL);
        $quarterlyContent = file_get_contents($quarterlyURL);

        if (strpos($quarterlyContent, '<chart') !== false) {
            $this->data['quarterly_earning_graph'] = $quarterlyContent;
        }

        if (strpos($annuallyContent, '<chart') !== false) {
            $this->data['annually_earning_graph'] = $annuallyContent;
        }

        var_dump($this->data);
    }

    function getData($data, $key) {
        // Remove none ASCII
        $data = iconv('UTF-8', 'ASCII//IGNORE', $data);

        //Remove white space
        $data = preg_replace("/\r\n|\r|\n|\t/", ' ', $data);

        //Replace multiple spaces with a single space
        $data = preg_replace('!\s+!', ' ', $data);

        preg_match("/(?<=$key)\S+/i", $data, $match);
        return $match[0];
    }

    public function load() {
        
    }

    protected function save() {
        $this->model->save($this->data);
    }

    public function fetch($result = true) {
        $this->model = new SymbolDetailModel();

        if (!$this->model->isDBCached($this->date, $this->stockCode)) {
            $this->init();
            $this->load();
            $this->save();
        }

        return $this->data;
    }

}

?>
