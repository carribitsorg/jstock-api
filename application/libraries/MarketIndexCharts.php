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
class MarketIndexCharts extends DataSource {

    protected $url = '';
    protected $data = array();

    function __construct($date) {
        $this->date = $date;
        $this->url = JSE_URL . '/controller.php?action=view_index_charts&IndexCode=1';
    }

    public function init() {
        $content = file_get_contents($this->url);
        $dom = new domDocument;

        @$dom->loadHTML($content);
        $dom->preserveWhiteSpace = false;

        $this->graphData();
        $this->summaryDetail($dom);
    }

    public function graphData() {
        $this->data['one_week_graph'] = file_get_contents(JSE_URL . '/website/getDayData.php?day_index=0&stock_index=1');
        $this->data['one_month_graph'] = file_get_contents(JSE_URL . '/website/getDayData.php?day_index=1&stock_index=1');
        $this->data['three_month_graph'] = file_get_contents(JSE_URL . '/website/getDayData.php?day_index=2&stock_index=1');
        $this->data['six_month_graph'] = file_get_contents(JSE_URL . '/website/getDayData.php?day_index=3&stock_index=1');
        $this->data['one_year_graph'] = file_get_contents(JSE_URL . '/website/getDayData.php?day_index=4&stock_index=1');
    }

    public function summaryDetail($dom) {
        $rowIndex = 0;

        $finder = new DomXPath($dom);
        $classname = "text";
        $nodes = $finder->query("//*[contains(@class, '$classname')]");

        $table = $nodes->item(1);
        $this->summaryDetail1 = trim($table->nodeValue);

        $rows = $table->getElementsByTagName('tr');

        foreach ($rows as $row) {
            if ($rowIndex == 1) {
                $cols = $row->getElementsByTagName('td');
                $this->data['value_date'] = $cols->item(0)->nodeValue;
                $this->data['value'] = $this->toDecimal($cols->item(1)->nodeValue);
                $this->data['change'] = $this->toDecimal($cols->item(2)->nodeValue);
                $this->data['change_percentage'] = $this->toDecimal($cols->item(3)->nodeValue);
                $this->data['change_direction'] = $cols->item(3)->getElementsByTagName('img')->item(0)->getAttribute('src');
            } else if ($rowIndex == 3) {
                $cols = $row->getElementsByTagName('td');
                $this->data['vol'] = $this->toDecimal($cols->item(0)->nodeValue);
                $this->data['market_capitalization'] = $this->toDecimal($cols->item(1)->nodeValue);
                $this->data['change_1969'] = $this->toDecimal($cols->item(2)->nodeValue);
            } else if ($rowIndex == 5) {
                $cols = $row->getElementsByTagName('td');
                $this->data['wtd'] = $this->toDecimal($cols->item(0)->nodeValue);
                $this->data['mtd'] = $this->toDecimal($cols->item(1)->nodeValue);
                $this->data['qtd'] = $this->toDecimal($cols->item(2)->nodeValue);
                $this->data['ytd'] = $this->toDecimal($cols->item(3)->nodeValue);

                $this->data['wtd_direction'] = $cols->item(0)->getElementsByTagName('img')->item(0)->getAttribute('src');
                $this->data['mtd_direction'] = $cols->item(1)->getElementsByTagName('img')->item(0)->getAttribute('src');
                $this->data['qtd_direction'] = $cols->item(2)->getElementsByTagName('img')->item(0)->getAttribute('src');
                $this->data['ytd_direction'] = $cols->item(3)->getElementsByTagName('img')->item(0)->getAttribute('src');
            }
            $rowIndex++;
        }
    }

    public function load() {
        
    }

    public function fetch($result = true) {
        //echo $this->url;exit;
        $this->init();
        $this->load();
        
        return $this->data;
    }

}

?>
