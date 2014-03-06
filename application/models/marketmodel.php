<?php

class MarketModel extends CI_Model {

    function isDBCached($date) {
        $this->db->select('market_date');
        $this->db->from('market');
        $this->db->where(array('DATE(market_date)' => $date));
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }
        return false;
    }

    function save($data) {
        $this->db->insert('market', $data);
    }

    /**
     * Returns the latest market date
     * if and only if the latest market date
     * is lest than current time by at least 
     * detay update time;
     * @return Date Time
     */
    function getLastDate() {
        $this->db->select('*');
        $this->db->from('market');
        $this->db->order_by("market_date", "desc");
        $this->db->limit(2);

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            if (sizeof($result) == 1) {
                return $result[0]['market_date'];
            } else {
                $time1 = strtotime($result[0]['update_time']);
                $time2 = strtotime(date('Y-m-d H:i:s', time()));
                $dif = $time2 - $time1;

                if ($dif >= DELAY_UPDATE_TIME) {
                    return $result[0]['market_date'];
                } else {
                    return $result[1]['market_date'];
                }
            }
        }
        return array();
    }

}

?>
