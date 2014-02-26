<?php

class JobModel extends CI_Model {
    function getJobs() {
        $this->db->select('*');
        $this->db->from('cron_job');

        $result = $this->db->get()->result_array();

        if (is_array($result) && count($result) > 0) {
            return $result;
        }
        return array();
    }
    function updateJob($data) {
        $this->db->where('job_id', $data['job_id']);
        $this->db->update('cron_job', $data);
    }
}

?>
