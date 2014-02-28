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
        //$this->url = "http://jstock.com/jstock/live.xml";
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
            $url = $item->getAttribute('link');
            $text = $item->textContent;
            if (strpos(trim($text), 'MARKET SUMMARY FOR') !== false) {
                $this->data[0]['lines'][] = trim($text);
                $count++;
                continue;
            }
            
            if (strpos(trim($text), 'LIVE DATA FOR:') !== false) {
                $this->data[0]['lines'][] = trim($text);
                $count++;
                continue;
            }

            if (trim($text) == '|') {
                $count++;
            } else {
                $image = $this->getImage($text);
                $link = $this->getLink($text, $url);
                if ($image !== false) {
                    $this->data[$count]['lines'][] = $image;
                } else {
                    $this->data[$count]['lines'][] = trim($text);
                }

                if ($link !== false) {
                    $this->data[$count]['link'] = $link;
                }
            }
        }
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

    private function getLink($text, $link) {
        if (strpos($text, 'MAIN INDEX') !== false) {
            return '#link?MAIN_INDEX';
        } else if (strpos($text, 'ALL JAMAICAN') !== false) {
            return '#link?ALL_JAMAICAN';
        } else if (strpos($text, 'JSE SELECT') !== false) {
            return '#link?JSE_SELECT';
        } else if (strpos($text, 'CROSS LISTED') !== false) {
            return '#link?CROSS_LISTED';
        } else {
            $stockCode = $this->getLinkStockCode($link);

            if ($stockCode !== false) {
                return "#symboldetail?$stockCode";
            }
        }
        return false;
    }

    private function getLinkStockCode($string) {
        if (preg_match('/(?<=StockCode=)\S+/i', $string, $match)) {
            return $match[0];
        }
        return false;
    }

    public function load() {
        
    }

    protected function save() {
        $this->model->update($this->data);
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
