<?php

/* pChart library inclusions */
global $yScaleSymbolCount;
$yScaleSymbolCount = 0;

class SymbolGraph {

    private $yScaleCount = 0;
    private $data = '';
    private $graphPhoto = null;
    private $scale = 2;

    public function __construct($data, $settings) {
        $this->data = $data;
        $this->settings = $settings;
        $this->graphPhoto = $this->render();
    }

    public function render() {
        /* Create and populate the pData object */
        $MyData = new pData();
        $points = $this->data;
        //var_dump($points);
        $MyData->addPoints($points['value'], "Stocks");
        $MyData->setAxisName(0, " ");
        $MyData->addPoints($points['label'], "Labels");
        $MyData->setSerieDescription("Labels", "Months");
        $MyData->setAbscissa("Labels");

        $MyData->setAxisDisplay(0, AXIS_FORMAT_CUSTOM, "YAxisFormatSymbol");
        $MyData->setAxisColor(0, array("R" => 96, "G" => 96, "B" => 96));



        /* Create the pChart object */
        $myPicture = new pImage(310 * $this->scale, 180 * $this->scale, $MyData);


        /* Turn of Antialiasing */
        $myPicture->Antialias = FALSE;
        $serieSettings = array("R" => 109, "G" => 152, "B" => 171);
        $MyData->setPalette("Stocks", $serieSettings);

        $myPicture->setFontProperties(array("FontName" => "application/third_party/pchart/fonts/pf_arma_five.ttf", "FontSize" => 11, "R" => 110, "G" => 110, "B" => 110));

        /* Define the chart area */
        $myPicture->setGraphArea(45 * $this->scale, 5 * $this->scale, 310 * $this->scale, 160 * $this->scale);

        /* Draw the scale */
        $scaleSettings = array("Mode" => SCALE_MODE_MANUAL, "ManualScale" => array(0 => array("Min" => 0, "Max" => $this->settings['max'])),
            "Factors" => array($this->settings['factor']), "Floating" => TRUE, "GridR" => 255, "GridG" => 255, "GridB" => 255, "CycleBackground" => TRUE,"LabelRotation"=>45);
        $myPicture->drawScale($scaleSettings);

        $myPicture->Antialias = TRUE;
        //$myPicture->drawText(150, 178, "Year");

        /* Draw the area chart */
        $MyData->setSerieDrawable("Stocks", TRUE);

        /* Draw a line and a plot chart on top */
        $MyData->setSerieDrawable("Stocks", TRUE);
        $myPicture->drawBarChart();
        return $myPicture;
    }

    public function output() {
        /* Render the picture (choose the best way) */
        $this->graphPhoto->autoOutput("graphs/" . date('Y-m-d') . ".png");
    }

}

function YAxisFormatSymbol($value) {
    return '$' . number_format($value) . 'M';
}

?>