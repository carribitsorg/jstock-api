<?php

class MarketIndexChartModel extends CI_Model {

    function isDBCached($date) {
        $this->db->select('report_date');
        $this->db->from('daily_market_report');
        $this->db->where(array('report_date' => $date));
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }
        return false;
    }

    function save($data) {
        $this->db->insert('daily_market_report', $data);
    }

    function getOneMonthGraph($date) {
        $this->db->select('one_month_graph');
        $this->db->from('daily_market_report');
        $this->db->where(array('report_date' => $date));
        $this->db->limit(1);

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result[0];
        }
        return array();
    }
    
    function getMarketIndexDetails($date) {
        $this->db->select('value_date, value, change, change_percentage, change_direction, vol');
        $this->db->from('daily_market_report');
        $this->db->where(array('report_date' => $date));
        $this->db->limit(1);

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result[0];
        }
        return array();
    }

}

?>
