<?php

class LiveStockModel extends CI_Model {

    function update($data) {
      if(!empty($data)){
        $row = array(
            'stock_data' => json_encode($data),
            'last_updated' => date('Y-m-d H:i:s', time())
        );

        $this->db->update('live_stock', $row);
        }
    }

    function getLiveStock() {
        $this->db->select('stock_data');
        $this->db->from('live_stock');
        $this->db->limit(1);

        $result = $this->db->get()->result_array();
        
        if (is_array($result) && count($result) > 0) {
            return $result[0]['stock_data'];
        }
        return array();
    }

}

?>