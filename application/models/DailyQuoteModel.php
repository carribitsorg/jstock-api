<?php

class DailyQuoteModel extends CI_Model {

    function isDBCached($date, $indexName) {
        $this->db->select('report_date');
        $this->db->from('daily_quote_main');
        $this->db->where(array('report_date' => $date));
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }
        return false;
    }

    function saveQuoteMain($data) {
        foreach ($data as $row) {
            $this->db->insert('daily_quote_main', $row);
        }
    }
    
    function saveOrdinaryShares($data) {
        foreach ($data as $row) {
            $this->db->insert('daily_quote_ordinary_shares', $row);
        }
    }
    
    function savePreferenceShares($data) {
        foreach ($data as $row) {
            $this->db->insert('daily_quote_preference_shares', $row);
        }
    }
    
    function saveUsDenominatedShares($data) {
        foreach ($data as $row) {
            $this->db->insert('daily_quote_preference_shares', $row);
        }
    }

    function getQoute($date, $indexName) {
        $this->db->select('*');
        $this->db->from('daily_quote_main');
        $this->db->where(array('report_date' => $date));

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result;
        }
        return array();
    }

}
?>

