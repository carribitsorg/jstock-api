<?php

/* pChart library inclusions */
include("class/pData.class.php");
include("class/pDraw.class.php");
include("class/pImage.class.php");

global $yScaleCount;
$yScaleCount = 0;
global $settings;

class StockGraph {

    private $yScaleCount = 0;
    private $data = '';
    private $graphPhoto = null;
    private $scale = 1.0;

    public function __construct($data) {
        $this->data = $data;
        $this->settings = array();
        $this->graphPhoto = $this->render();
    }

    public function render() {

        global $yScaleCount;
        $yScaleCount = 0;

        global $settings;

        /* Create and populate the pData object */
        $MyData = new pData();
        $points = $this->getPairs($this->data);
        $this->settings = $this->getGraphSettings($points['y_axis']);
        $settings = $this->settings;

        $MyData->addPoints($points['y_axis'], "Stocks");
        //$MyData->setSerieTicks("Probe 2",4); 
        $MyData->setAxisName(0, "Vol.");
        $MyData->addPoints($points['x_axis_value'], "Labels");
        $MyData->setSerieDescription("Labels", "Months");
        $MyData->setAbscissa("Labels");

        $MyData->setAxisDisplay(0, AXIS_FORMAT_CUSTOM, "YAxisFormat");
        $MyData->setAxisColor(0, array("R" => 96, "G" => 96, "B" => 96));



        /* Create the pChart object */
        $myPicture = new pImage(310 * $this->scale, 180 * $this->scale, $MyData);


        /* Turn of Antialiasing */
        $myPicture->Antialias = FALSE;
        $serieSettings = array("R" => 255, "G" => 69, "B" => 0);
        $MyData->setPalette("Stocks", $serieSettings);

        $myPicture->setFontProperties(array("FontName" => "application/third_party/pchart/fonts/pf_arma_five.ttf", "FontSize" => 6, "R" => 96, "G" => 96, "B" => 96));
        $myPicture->customManipulate = true;
        /* Define the chart area */
        $myPicture->setGraphArea(38 * $this->scale, 0, 310 * $this->scale, 170 * $this->scale);

        //var_dump($this->settings);exit;
        /* Draw the scale */
        $scaleSettings = array("Mode" => SCALE_MODE_MANUAL, "ManualScale" => array(0 => array("Min" => $this->settings['min'], "Max" => $this->settings['max'])),
            "Factors" => array($this->settings['factor']),
            "XMargin" => 10, "YMargin" => 10, "Floating" => TRUE,
            "GridR" => 255, "GridG" => 255, "GridB" => 255, "CycleBackground" => TRUE);
        $myPicture->drawScale($scaleSettings);

        $myPicture->Antialias = TRUE;

        /* Draw the area chart */
        $MyData->setSerieDrawable("Stocks", TRUE);
        $myPicture->drawAreaChart();

        /* Draw a line and a plot chart on top */
        $MyData->setSerieDrawable("Stocks", TRUE);
        $myPicture->setShadow(TRUE, array("X" => 1, "Y" => 1, "R" => 0, "G" => 0, "B" => 0, "Alpha" => 10));
        $myPicture->drawLineChart();
        //$myPicture->drawPlotChart(array("PlotBorder" => TRUE, "PlotSize" => 1, "BorderSize" => 1, "Surrounding" => -60, "BorderAlpha" => 80));

        return $myPicture;
    }

    public function output() {
        /* Render the picture (choose the best way) */
        $this->graphPhoto->autoOutput("graphs/" . date('Y-m-d') . ".png");
    }

    function getPairs($text) {
        preg_match('/[A-Za-z]/', $text, $matches, PREG_OFFSET_CAPTURE);
        $text = substr($text, $matches[0][1], strlen($text));
        $pieces = explode(";", $text);
        $pairs = array();

        foreach ($pieces as $piece) {
            if (preg_match('/[A-Za-z]+/', $piece) && strlen($piece) > 3) {
                $val = explode(" - ", $piece);
                $pairs['x_axis'][] = $val[0];
                $pairs['x_axis_value'][] = substr($val[0], 4, 2);
                $pairs['y_axis'][] = floatval(strtr($val[1], array(',' => '')));
            }
        }

        return $pairs;
    }

    function getGraphSettings($values) {
        $maxValue = max($values);
        $minValue = min($values);


        $value2 = 0;
        $value1 = 0;

        if ($maxValue >= 100 && $maxValue < 1000) {
            $value2 = (ceil($maxValue / 10) * 10) + 10;
        } else if ($maxValue >= 1000 && $maxValue < 10000) {
            $value2 = (ceil($maxValue / 100) * 100);
        } else if ($maxValue >= 10000) {
            $value2 = (ceil($maxValue / 1000) * 1000) + 1000;
        } else {
            $value2 = ceil($maxValue);
        }


        if ($minValue >= 100 && $minValue < 1000) {
            $value1 = (floor($minValue / 10) * 10);
        } else if ($minValue >= 1000 && $minValue < 10000) {
            $value1 = (floor($minValue / 100) * 100);
        } else if ($minValue >= 10000) {
            $value1 = (floor($minValue / 1000) * 1000) - 1000;
        } else {
            $value1 = floor($minValue);
        }

        $value = $value2 - $value1;

        $factor = $value / 5;

        $settings = array(
            'max' => $value2,
            'min' => $value1,
            'factor' => $factor
        );
        return $settings;
    }

}

function YAxisFormat($value) {
    global $yScaleCount;
    global $settings;
    return number_format($settings['min'] + ($yScaleCount++ * $settings['factor']));
    //return number_format($value);
}

?>