<?php

/* pChart library inclusions */
include("class/pData.class.php");
include("class/pDraw.class.php");
include("class/pImage.class.php");

global $yScaleCount;
$yScaleCount = 0;

class StockGraph {

    private $yScaleCount = 0;
    private $data = '';
    private $graphPhoto = null;

    public function __construct($data) {
        $this->data = $data;
        $this->graphPhoto = $this->render();
    }

    public function render() {

        global $yScaleCount;
        $yScaleCount = 0;

        /* Create and populate the pData object */
        $MyData = new pData();
        $points = $this->getPairs($this->data);
        //var_dump($points);
        $MyData->addPoints($points['y_axis'], "Stocks");
        //$MyData->setSerieTicks("Probe 2",4); 
        $MyData->setAxisName(0, "Volume");
        $MyData->addPoints($points['x_axis_value'], "Labels");
        $MyData->setSerieDescription("Labels", "Months");
        $MyData->setAbscissa("Labels");

        $MyData->setAxisDisplay(0, AXIS_FORMAT_CUSTOM, "YAxisFormat");
        $MyData->setAxisColor(0, array("R" => 96, "G" => 96, "B" => 96));



        /* Create the pChart object */
        $myPicture = new pImage(310, 180, $MyData);
        

        /* Turn of Antialiasing */
        $myPicture->Antialias = FALSE;
        $serieSettings = array("R" => 255, "G" => 69, "B" => 0);
        $MyData->setPalette("Stocks", $serieSettings);

        $myPicture->setFontProperties(array("FontName" => "application/third_party/pchart/fonts/pf_arma_five.ttf", "FontSize" => 6, "R" => 96, "G" => 96, "B" => 96));

        /* Define the chart area */
        $myPicture->setGraphArea(38, 0, 310, 170);

        /* Draw the scale */
        $scaleSettings = array("XMargin" => 10, "YMargin" => 10, "Floating" => TRUE, "GridR" => 220, "GridG" => 220, "GridB" => 220, "DrawSubTicks" => TRUE, "CycleBackground" => TRUE);
        $myPicture->drawScale($scaleSettings);

        $myPicture->Antialias = TRUE;

        /* Draw the area chart */
        $MyData->setSerieDrawable("Stocks", TRUE);
        $myPicture->drawAreaChart();

        /* Draw a line and a plot chart on top */
        $MyData->setSerieDrawable("Stocks", TRUE);
        $myPicture->setShadow(TRUE, array("X" => 1, "Y" => 1, "R" => 0, "G" => 0, "B" => 0, "Alpha" => 10));
        $myPicture->drawLineChart();
        $myPicture->drawPlotChart(array("PlotBorder" => TRUE, "PlotSize" => 1, "BorderSize" => 1, "Surrounding" => -60, "BorderAlpha" => 80));

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

}

function YAxisFormat($value) {
    global $yScaleCount;
    return number_format(78000 + ($yScaleCount++ * 1200));
}

?>