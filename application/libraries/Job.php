<?php

class Job {

    public function run($dateISO) {
        $model = new JobModel();
        $jobs = $model->getJobs($dateISO);
        
        var_dump($jobs);exit;
    }
}

?>
