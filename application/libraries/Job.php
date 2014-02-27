<?php

class Job {

    public function run($model) {
        $url = JSTOCK_URL . $model['url'];
        CurlPostAsync::exec($url);
    }

}

?>
