<?php

class JobModel extends CI_Model {
    function getJobs($time) {
        $this->db->select('*');
        $this->db->from('v_active_cron_job');
        $this->db->where('time_to_run <', $time);

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
