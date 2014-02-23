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
        $this->url = JSE_URL . "/controller.php?action=view_quote";
    }

    public function init() {
        $content = file_get_contents($this->url);
        $dom = new domDocument;
        @$dom->loadHTML($content);
        $dom->preserveWhiteSpace = false;

        $this->mainQuote($dom);
        $this->ordinaryShares($dom);
        $this->preferenceShares($dom);
        $this->usDenominatedShares($dom);
    }

    public function mainQuote($dom) {
        $this->data['main_quote'] = array();
        $rowIndex = 0;
        $tables = $dom->getElementsByTagName('table');
        $table = $tables->item(3);

        $rows = $table->getElementsByTagName('tr');

        foreach ($rows as $row) {
            if ($rowIndex !== 0) {
                $cols = $row->getElementsByTagName('td');

                $data = array(
                    'report_date' => $this->date,
                    'index' => trim($cols->item(1)->nodeValue),
                    'value' => $this->toDecimal($cols->item(2)->nodeValue),
                    'volume' => $this->toDecimal($cols->item(3)->nodeValue),
                    'change' => $this->toDecimal($cols->item(4)->nodeValue),
                    'change_perc' => $this->toDecimal($cols->item(5)->nodeValue),
                    'direction' => $cols->item(0)->getElementsByTagName('img')->item(0)->getAttribute('src')
                );

                $this->data['main_quote'][] = $data;
            }
            $rowIndex++;
        }
    }

    public function ordinaryShares($dom) {
        $this->data['ordinary_shares'] = array();
        $rowIndex = 0;
        $tables = $dom->getElementsByTagName('table');
        $table = $tables->item(4);

        $rows = $table->getElementsByTagName('tr');

        foreach ($rows as $row) {
            if ($rowIndex > 1) {
                $cols = $row->getElementsByTagName('td');

                $data = array(
                    'report_date' => $this->date,
                    'week_high_52' => trim($cols->item(1)->nodeValue),
                    'week_low_52' => trim($cols->item(2)->nodeValue),
                    'security' => trim($cols->item(3)->nodeValue),
                    'prev_yr_div' => $this->toDecimal($cols->item(4)->nodeValue),
                    'current_yr_div' => $this->toDecimal($cols->item(5)->nodeValue),
                    'volume_non_block' => $this->toDecimal($cols->item(6)->nodeValue),
                    'today_high' => $this->toDecimal($cols->item(7)->nodeValue),
                    'today_low' => $this->toDecimal($cols->item(8)->nodeValue),
                    'last_traded_price' => $this->toDecimal($cols->item(9)->nodeValue),
                    'close_price' => $this->toDecimal($cols->item(10)->nodeValue),
                    'change' => $this->toDecimal($cols->item(11)->nodeValue),
                    'closing_bid' => $this->toDecimal($cols->item(12)->nodeValue),
                    'closing_ask' => $this->toDecimal($cols->item(13)->nodeValue),
                    'direction' => $cols->item(0)->getElementsByTagName('img')->item(0)->getAttribute('src')
                );

                $this->data['ordinary_shares'][] = $data;
            }
            $rowIndex++;
        }
    }

    public function preferenceShares($dom) {
        $this->data['preference_shares'] = array();
        $rowIndex = 0;
        $tables = $dom->getElementsByTagName('table');
        $table = $tables->item(5);

        $rows = $table->getElementsByTagName('tr');

        foreach ($rows as $row) {
            if ($rowIndex > 1) {
                $cols = $row->getElementsByTagName('td');

                $data = array(
                    'report_date' => $this->date,
                    'week_high_52' => trim($cols->item(1)->nodeValue),
                    'week_low_52' => trim($cols->item(2)->nodeValue),
                    'security' => trim($cols->item(3)->nodeValue),
                    'prev_yr_div' => $this->toDecimal($cols->item(4)->nodeValue),
                    'current_yr_div' => $this->toDecimal($cols->item(5)->nodeValue),
                    'volume_non_block' => $this->toDecimal($cols->item(6)->nodeValue),
                    'today_high' => $this->toDecimal($cols->item(7)->nodeValue),
                    'today_low' => $this->toDecimal($cols->item(8)->nodeValue),
                    'last_traded_price' => $this->toDecimal($cols->item(9)->nodeValue),
                    'close_price' => $this->toDecimal($cols->item(10)->nodeValue),
                    'change' => $this->toDecimal($cols->item(11)->nodeValue),
                    'closing_bid' => $this->toDecimal($cols->item(12)->nodeValue),
                    'closing_ask' => $this->toDecimal($cols->item(13)->nodeValue),
                    'direction' => $cols->item(0)->getElementsByTagName('img')->item(0)->getAttribute('src')
                );

                $this->data['preference_shares'][] = $data;
            }
            $rowIndex++;
        }
    }

    public function usDenominatedShares($dom) {
        $this->data['preference_shares'] = array();
        $rowIndex = 0;
        $tables = $dom->getElementsByTagName('table');
        $table = $tables->item(5);

        $rows = $table->getElementsByTagName('tr');

        foreach ($rows as $row) {
            if ($rowIndex > 1) {
                $cols = $row->getElementsByTagName('td');

                $data = array(
                    'report_date' => $this->date,
                    'week_high_52' => trim($cols->item(1)->nodeValue),
                    'week_low_52' => trim($cols->item(2)->nodeValue),
                    'security' => trim($cols->item(3)->nodeValue),
                    'prev_yr_div' => $this->toDecimal($cols->item(4)->nodeValue),
                    'current_yr_div' => $this->toDecimal($cols->item(5)->nodeValue),
                    'volume_non_block' => $this->toDecimal($cols->item(6)->nodeValue),
                    'today_high' => $this->toDecimal($cols->item(7)->nodeValue),
                    'today_low' => $this->toDecimal($cols->item(8)->nodeValue),
                    'last_traded_price' => $this->toDecimal($cols->item(9)->nodeValue),
                    'close_price' => $this->toDecimal($cols->item(10)->nodeValue),
                    'change' => $this->toDecimal($cols->item(11)->nodeValue),
                    'closing_bid' => $this->toDecimal($cols->item(12)->nodeValue),
                    'closing_ask' => $this->toDecimal($cols->item(13)->nodeValue),
                    'direction' => $cols->item(0)->getElementsByTagName('img')->item(0)->getAttribute('src')
                );

                $this->data['preference_shares'][] = $data;
            }
            $rowIndex++;
        }
    }

    public function load() {
        
    }

    protected function save() {
        $this->model->saveQuoteMain($this->data['main_quote']);
        $this->model->saveOrdinaryShares($this->data['ordinary_shares']);
        $this->model->savePreferenceShares($this->data['preference_shares']);
        $this->model->saveUsDenominatedShares($this->data['us_denominated_shares']);
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
