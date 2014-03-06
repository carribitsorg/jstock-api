<?php

class SymbolDetailModel extends CI_Model {

    function isDBCached($date, $stockCode) {
        $this->db->select('cache_date');
        $this->db->from('stock_detail');
        $this->db->where(array('cache_date' => $date, 'stock_code' => $stockCode));
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }
        return false;
    }

    function save($data) {
        $this->db->insert('stock_detail ', $data);
    }

    function getStockDetails($date, $stockCode) {
        $this->db->select('*');
        $this->db->from('v_stock_detail');
        $this->db->where(array('cache_date' => $date, 'stock_code' => $stockCode));
        $this->db->limit(1);

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            $this->updateViewCount($stockCode);
            return $result[0];
        }
        return array();
    }

    function updateViewCount($stockCode) {
        try {
            $this->db->where('stock_code', $stockCode);
            $this->db->set('view_count', '`view_count` + 1', FALSE);
            $this->db->update('symbol_lookup');
        } catch (Exception $e) {
            
        }
    }

    function getOutdatedSymbols($date) {
        $this->db->select('*');
        $this->db->from('v_outdated_stocks');
        $this->db->where("cache_date != '$date' OR cache_date IS NULL");

        $result = $this->db->get()->result_array();
        if (is_array($result) && count($result) > 0) {
           
            return $result;
        }
        return array();
    }

    function getAnnualStockGraph($date, $stockCode) {
        $this->db->select('annually_earning_graph');
        $this->db->from('stock_detail');
        $this->db->where(array('cache_date' => $date, 'stock_code' => $stockCode));
        $this->db->limit(1);

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result[0]['annually_earning_graph'];
        }
        return null;
    }

}

?>
