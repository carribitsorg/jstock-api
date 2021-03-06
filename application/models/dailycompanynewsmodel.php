<?php

class DailyCompanyNewsModel extends CI_Model {

    function save($data) {
        foreach ($data as $row) {
            $this->db->insert('daily_news', $row);
        }
    }

    function isDBCached($date) {
        $this->db->select('news_date');
        $this->db->from('daily_news');
        $this->db->where(array('news_date' => $date));
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }
        return false;
    }

    function getNews($date) {
        $this->db->select('*');
        $this->db->from('daily_news');
        $this->db->where(array('news_date' => $date));
        $this->db->order_by('date_iso', 'desc');
        
        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result;
        }
        return array();
    }

    function getNewsItem($id) {
        $this->db->select('*');
        $this->db->from('daily_news');
        $this->db->where(array('id' => $id));
        $this->db->limit(1);

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result[0];
        }
        return array();
    }

    function purge($date) {
        $this->db->where("news_date = ", "'$date'", false);
        $this->db->delete('daily_news');
    }

}
