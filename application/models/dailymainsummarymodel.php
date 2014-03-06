<?php

class DailyMainSummaryModel extends CI_Model {

    function save($data) {
        foreach ($data as $row) {
            $this->db->insert('daily_summary', $row);
        }
    }

    function saveSummaryMaster($data) {
        $this->db->insert('daily_summary_master', $data);
    }

    function isDBCached($date) {
        $this->db->select('summary_date');
        $this->db->from('daily_summary_master');
        $this->db->where(array('summary_date' => $date));
        $this->db->limit(1);

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }
        return false;
    }

    function getDailyMainSummary($date) {
        $this->db->from('daily_summary');
        $this->db->where(array('summary_date' => $date));

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result;
        }
        return array();
    }

    public function getDailyMainDetail($date) {
        $this->db->from('daily_summary_master');
        $this->db->where(array('summary_date' => $date));
        $this->db->limit(1);

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return array(
                'summary_date' => $result[0]['summary_date'],
                'summary1' => $result[0]['summary1'],
                'summary2' => $result[0]['summary2'],
                'summary_list' => json_decode($result[0]['summary_list'])
            );
        }
        return array();
    }

}
