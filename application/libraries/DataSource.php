<?php

class DataSource {

    function getISODate() {
        $datetime = new DateTime($this->date);
        $date = $datetime->format('c');
        return substr($date, 0, 10);
    }

    public function toDecimal($string) {
        $val = preg_replace('/[^\d.-]/', "", $string);
        return (float) $val;
    }

}

?>
