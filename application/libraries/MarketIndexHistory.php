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
class MarketIndexHistory extends DataSource {

    protected $url = '';
    protected $data = array();
    protected $index = 0;
    protected $indexName;

    /**
     *
     * @var MarketIndexHistoryModel 
     */
    protected $model = null;

    function __construct($date, $index, $indexName) {
        $this->date = $date;
        $this->index = $index;
        $this->indexName = $indexName;
        $this->url = JSE_URL . "/controller.php?action=view_index_history&IndexCode=$date";
    }

    public function init() {
        $content = file_get_contents($this->url);
        //$content = mb_convert_encoding($content, 'HTML-ENTITIES', 'UTF-8');

        $dom = new domDocument;

        @$dom->loadHTML($content);
        $dom->preserveWhiteSpace = false;

        $this->historyDetail($dom);
    }

    public function historyDetail($dom) {
        $rowIndex = 0;
        $startDate = $dom->getElementById('StartDate')->getAttribute('value');
        $endDate = $dom->getElementById('EndDate')->getAttribute('value');

        $startDate = $this->getDate($startDate, 'Y/m/d');
        $endDate = $this->getDate($endDate, 'Y/m/d');

        $this->downloadUrl = JSE_URL . "/controller.php?action=download_index_history&IndexCode=$this->index&StartDate=$startDate&EndDate=$endDate";

        $csvData = file_get_contents($this->downloadUrl);


        $lines = explode("\n", $csvData);
        $array = array();
        foreach ($lines as $line) {
            if (strlen($line) > 1 && $rowIndex > 0) {
                $csvArray = str_getcsv($line);
                $row = array(
                    'report_date' => $this->date,
                    'index_name' => $this->indexName,
                    'date' => $csvArray[0],
                    'value' => $this->toDecimal($csvArray[1]),
                    'change' => $this->toDecimal($csvArray[2]),
                    'change_perc' => $this->toDecimal($csvArray[3]),
                    'volume_traded' => $this->toDecimal($csvArray[4])
                );
                $this->data[] = $row;
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
        $this->model = new MarketIndexHistoryModel();

        if (!$this->model->isDBCached($this->date, $this->indexName)) {
            $this->init();
            $this->load();
            $this->save();
        }

        return $this->data;
    }

}

?>
