<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of LiveStockModel
 *
 * @author 
 */
class LiveStockUpdate extends DataSource {

    protected $url = '';
    protected $data = array();
    protected $refreshTime = '0.527779519092292';

    /**
     *
     * @var LiveStockModel 
     */
    protected $model = null;

    function __construct($date) {
        $this->date = $date;
        $this->url = JSE_URL . "/ticker-xml/test.xml?ini=$this->refreshTime";
        $this->url = "http://jstock.com/jstock/live.xml";
    }

    public function init() {
        $content = file_get_contents($this->url);
        $fixedContent = str_replace('&', '[AMP;]', $content);
        $this->getUpdate($fixedContent);
    }

    public function getUpdate($content) {
        $dom = new DOMDocument();
        $dom->loadXML($content);
        $dom->preserveWhiteSpace = false;

        $count = 0;
        $items = $dom->getElementsByTagName("item");
        foreach ($items as $item) {
            $text = $item->textContent;
            if (strpos(trim($text), 'MARKET SUMMARY FOR') !== false) {
                $this->data[0][] = trim($text);
                $count++;
                continue;
            }


            if (trim($text) == '|') {
                $count++;
            } else {
                $image = $this->getImage($text);
                if ($image !== false) {
                    $this->data[$count][] = $image;
                } else {
                    $this->data[$count][] = trim($text);
                }
            }
            // var_dump($text);
        }

        var_dump($this->data);
        exit;
    }

    private function getImage($url) {
        if (strpos($url, 'images/mov_none') !== false) {
            return 'mov_none.png';
        } else if (strpos($url, 'images/mov_up') !== false) {
            return 'mov_up.png';
        } else if (strpos($url, 'images/mov_down') !== false) {
            return 'mov_down.png';
        }

        return false;
    }

    private function getLink($text) {
        if ($text) {
            if (strpos($text, 'MAIN INDEX') !== false) {
                return 'mov_none.png';
            }
        }
    }

    public function load() {
        
    }

    protected function save() {
        $this->model->save($this->data);
    }

    public function fetch() {
        $this->model = new LiveStockModel();

        $this->init();
        $this->load();
        $this->save();

        return $this->data;
    }

}
?>
