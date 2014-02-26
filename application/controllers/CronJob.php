<?php

class CronJob extends CI_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->library('Job');
        $this->load->model('JobModel');
    }

    private function getCurrentDate($format = 'c') {
        $datetime = new DateTime($this->date);
        $date = $datetime->format($format);
        return substr($date, 0, 10);
    }

    public function index() {
        $date = $this->getCurrentDate();
        $job = new Job();
        $job->run($date);
    }

}
?>
