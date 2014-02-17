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
class MarketIndexComposition extends DataSource {

    protected $url = '';
    protected $data = array();
    protected $index = 0;
    protected $indexName;

    /**
     *
     * @var MarketIndexCompositionModel 
     */
    protected $model = null;

    function __construct($date, $index, $indexName) {
        $this->date = $date;
        $this->index = $index;
        $this->indexName = $indexName;
        $this->url = JSE_URL . "/controller.php?action=view_index_composition&IndexCode=$index";
        // $this->url = 'http://localhost/test2.htm';
    }

    public function init() {
        $content = file_get_contents($this->url);
        //$content = mb_convert_encoding($content, 'HTML-ENTITIES', 'UTF-8');

        $dom = new domDocument;

        @$dom->loadHTML($content);
        $dom->preserveWhiteSpace = false;

        $this->compositionDetail($dom);
    }

    public function compositionDetail($dom) {
        $rowIndex = 0;
        $tables = $dom->getElementsByTagName('table');
        $table = $tables->item(3);
        $rows = $table->getElementsByTagName('tr');
        foreach ($rows as $row) {
            if ($rowIndex !== 0) {
                $cols = $row->getElementsByTagName('td');
                $url = $cols->item(0)->getElementsByTagName('a')->item(0)->getAttribute('href');
                $data = array(
                    'report_date' => $this->date,
                    'index_name' => $this->indexName,
                    'symbol' => trim($cols->item(0)->nodeValue),
                    'url' => $url,
                    'price' => $this->toDecimal($cols->item(1)->nodeValue),
                    'change' => $this->toDecimal($cols->item(2)->nodeValue),
                    'change_perc' => $this->toDecimal($cols->item(3)->nodeValue),
                    'volume_traded' => $this->toDecimal($cols->item(4)->nodeValue),
                );
                $this->data[] = $data;
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
        $this->model = new MarketIndexCompositionModel();

        if (!$this->model->isDBCached($this->date, $this->indexName)) {
            $this->init();
            $this->load();
            $this->save();
        }

        return $this->data;
    }

}

?>
