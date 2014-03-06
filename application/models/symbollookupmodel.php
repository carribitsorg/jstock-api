<?php

class SymbolLookupModel extends CI_Model {

    function save($data) {
        $this->db->insert('symbol_lookup', $data);
    }

    function update($data) {
        $this->db->where('stock_code', $data['stock_code']);
        $this->db->update('symbol_lookup', $data);
    }

    function refreshSymbol($data) {
        foreach ($data as $row) {
            $symbol = $this->getSymbol($row);
            if (empty($symbol)) {
                $this->save($row);
            } else {
                $this->update($row);
            }
        }
    }

    function getSymbol($data) {
        $this->db->select('stock_code, symbol');
        $this->db->from('symbol_lookup');
        $this->db->where(array('stock_code' => $data['stock_code']));
        $this->db->limit(1);

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result[0];
        }
        return array();
    }

    function getAllSymbol() {
        $this->db->select('stock_code, symbol, institution');
        $this->db->from('symbol_lookup');

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result;
        }
        return array();
    }

}

?>
