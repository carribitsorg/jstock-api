<?php

class DataSource {

    const MAIN_INDEX = 'MAIN_INDEX';
    const JSE_SELECT = 'JSE_SELECT';
    const ALL_JAMAICAN = 'ALL_JAMAICAN';
    const CROSS_LISTED = 'CROSS_LISTED';

    function getISODate() {
        $datetime = new DateTime($this->date);
        $date = $datetime->format('c');
        return substr($date, 0, 10);
    }

    public function toDecimal($string) {
        $val = preg_replace('/[^\d.-]/', "", $string);
        return (float) $val;
    }

    public function getDate($dateString, $newFormat) {
        //$myDateTime = DateTime::createFromFormat($originalFomat, $dateString);
        //$newDateString = $myDateTime->format($newFormat);

        $newDate = date($newFormat, strtotime($dateString));
        return $newDate;
    }

    protected function getStockCode($url) {
        $url_parts = parse_url($url);
        parse_str($url_parts['query'], $path_parts);
        return $path_parts['StockCode'];
    }

}

?>
