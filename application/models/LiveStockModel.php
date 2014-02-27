<?php

class LiveStockModel extends CI_Model {
    function getJobs($time) {
        $this->db->select('*');
        $this->db->from('live_stock');
        $this->db->where('time_to_run <', $time);

        $result = $this->db->get()->result_array();
        
        if (is_array($result) && count($result) > 0) {
            return $result;
        }
        return array();
    }
   
}

?>
