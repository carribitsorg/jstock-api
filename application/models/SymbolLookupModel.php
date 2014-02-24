<?php

class SymbolLookupModel extends CI_Model {

    function save($data) {
        foreach ($data as $row) {
            $this->db->insert('symbol', $row);
        }
    }

    function refreshSymbol($data) {
        var_dump($data);
    }
}
?>
