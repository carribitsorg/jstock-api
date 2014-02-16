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
class MarketIndexPerformance extends DataSource {

    protected $url = '';
    protected $data = array();
    protected $index = 0;
    protected $indexName;

    const MAIN_INDEX = 'MAIN_INDEX';
    const JSE_SELECT = 'JSE_SELECT';
    const ALL_JAMAICAN = 'ALL_JAMAICAN';
    const CROSS_LISTED = 'CROSS_LISTED';

    /**
     *
     * @var MarketIndexChartModel 
     */
    protected $model = null;

    function __construct($date, $index, $indexName) {
        $this->date = $date;
        $this->index = $index;
        $this->indexName = $indexName;
        $this->url = JSE_URL . "/controller.php?action=view_index_information&IndexCode=$index";
    }

    public function init() {
        $content = file_get_contents($this->url);
        $dom = new domDocument;

        @$dom->loadHTML($content);
        $dom->preserveWhiteSpace = false;

        $this->performanceDetail($dom);
    }

    public function performanceDetail($dom) {
        $rowIndex = 0;
        $tables = $dom->getElementsByTagName('table');

        $table = $tables->item(4);
        $rows = $table->getElementsByTagName('tr');

        $this->data['index_name'] = $this->indexName;
         $this->data['report_date'] = $this->date;

        foreach ($rows as $row) {
            $cols = $row->getElementsByTagName('td');
            if ($rowIndex == 0) {
                $this->data['volume_traded'] = $this->toDecimal($cols->item(1)->nodeValue);
            }
            if ($rowIndex == 1) {
                $this->data['week_to_date'] = $this->toDecimal($cols->item(1)->nodeValue);
            }
            if ($rowIndex == 2) {
                $this->data['month_to_date'] = $this->toDecimal($cols->item(1)->nodeValue);
            }
            if ($rowIndex == 3) {
                $this->data['quarter_to_date'] = $this->toDecimal($cols->item(1)->nodeValue);
            }
            if ($rowIndex == 4) {
                $this->data['year_to_date'] = $this->toDecimal($cols->item(1)->nodeValue);
            }
            if ($rowIndex == 5) {
                $this->data['change_name'] =  strtr ($cols->item(0)->nodeValue, array (':' => ''));
                $this->data['change_value'] = $this->toDecimal($cols->item(1)->nodeValue);
            }
            $rowIndex++;
        }
    }

    public function load() {
        
    }

    protected function save() {
        $this->model->save($this->data);
    }

    public function fetch($result = true) {
        $this->model = new MarketIndexPerformanceModel();

        if (!$this->model->isDBCached($this->date, $this->indexName)) {
            $this->init();
            $this->load();
            $this->save();
        }

        return $this->data;
    }

}

?>
