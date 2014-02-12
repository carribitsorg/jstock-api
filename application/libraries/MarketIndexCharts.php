<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MarketIndexCharts
 *
 * @author mm51467
 */
class MarketIndexCharts {
     protected $url = '';
     
    function __construct($date) {
        $this->date = $date;
        $this->url = JSE_URL . '/controller.php?action=view_index_charts&IndexCode=1';
    }
}

?>
