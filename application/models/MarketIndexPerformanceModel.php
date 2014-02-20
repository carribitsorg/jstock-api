<?php

class MarketIndexPerformanceModel extends CI_Model {

    function isDBCached($date, $indexName) {
        $this->db->select('report_date');
        $this->db->from('daily_market_perfromance');
        $this->db->where(array('report_date' => $date, 'index_name' => $indexName));
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }
        return false;
    }

    function save($data) {
        $this->db->insert('daily_market_perfromance', $data);
    }


    function getMarketIndexDetails($date, $indexName) {
        $this->db->select('*');
        $this->db->from('v_daily_market_perfromance');
        $this->db->where(array('report_date' => $date, 'index_name' => $indexName));
        $this->db->limit(1);

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result[0];
        }
        return array();
    }

}

?>
