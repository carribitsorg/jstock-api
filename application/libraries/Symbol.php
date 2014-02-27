<?php

class Symbol extends DataSource {

    protected $url = '';
    protected $data = array();

    /**
     *
     * @var SymbolLookupModel 
     */
    protected $model = null;

    function __construct($date) {
        $this->url = JSE_URL . "/controller.php?action=symbol_lookup";
    }

    public function init() {
        $this->model = new SymbolLookupModel();
        $content = file_get_contents($this->url);
        $dom = new domDocument;
        @$dom->loadHTML($content);
        $dom->preserveWhiteSpace = false;

        $this->loadSymbol($dom);
    }

    public function loadSymbol($dom) {
        $this->data = array();
        $rowIndex = 0;
        $tables = $dom->getElementsByTagName('table');
        $table = $tables->item(1);

        $rows = $table->getElementsByTagName('tr');

        foreach ($rows as $row) {
            if ($rowIndex > 3) {
                $cols = $row->getElementsByTagName('td');
                $url = $cols->item(2)->getElementsByTagName('a')->item(0)->nodeValue;

                $stockCodeUrl = $cols->item(0)->getElementsByTagName('a')->item(0)->getAttribute('href');
                $stockCode = $this->getStockCode($stockCodeUrl);

                $data = array(
                    'stock_code' => $stockCode,
                    'symbol' => trim($cols->item(0)->nodeValue),
                    'institution' => trim($cols->item(1)->nodeValue),
                    'web_address' => trim($url),
                    'last_updated' => date('Y-m-d H:i:s', time())
                );
                $this->data[] = $data;
            }
            $rowIndex++;
        }
    }

    

    public function load() {
        
    }

    protected function save() {
        $this->model->refreshSymbol($this->data);
    }

    public function fetch() {
        $this->init();
        $this->load();
        $this->save();
        return $this->data;
    }

}

?>
