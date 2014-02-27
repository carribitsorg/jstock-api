<?php

class CronJob extends CI_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->library('Job');
        $this->load->library('CurlPostAsync');

        $this->load->model('JobModel');
    }

    private function getCurrentTime() {
        return date('Y-m-d H:i:s');
    }

    public function index() {
        $date = $this->getCurrentTime();

        $jobModel = new JobModel();
        $models = $jobModel->getJobs($date);

        foreach ($models as $model) {
            $job = new Job();
            $job->run($model);

            $data = array(
                'job_id' => $model['job_id'],
                'last_run' => $this->getCurrentTime()
            );
            
            $jobModel->updateJob($data);
        }
    }

}

?>
