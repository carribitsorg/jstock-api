<?php

class MarketIndexCompositionModel extends CI_Model {

    function isDBCached($date, $indexName) {
        $this->db->select('report_date');
        $this->db->from('daily_composition');
        $this->db->where(array('report_date' => $date, 'index_name' => $indexName));
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }
        return false;
    }

    function save($data) {
        foreach ($data as $row) {
            $this->db->insert('daily_composition', $row);
        }
    }

    function getMarketIndexDetails($date, $indexName) {
        $this->db->select('value_date, index_name, value, change, change_perc,change_perc_dir, change_dir, vol');
        $this->db->from('daily_market_report');
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
