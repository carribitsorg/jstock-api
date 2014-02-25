<?php

/* pChart library inclusions */
global $yScaleSymbolCount;
$yScaleSymbolCount = 0;

class SymbolGraph {

    private $yScaleCount = 0;
    private $data = '';
    private $graphPhoto = null;

    public function __construct($data) {
        $this->data = $data;
        $this->graphPhoto = $this->render();
    }

    public function render() {
        /* Create and populate the pData object */
        $MyData = new pData();
        $points = $this->data;
        //var_dump($points);
        $MyData->addPoints($points['value'], "Stocks");
        $MyData->setAxisName(0, "Earnings");
        $MyData->addPoints($points['label'], "Labels");
        $MyData->setSerieDescription("Labels", "Months");
        $MyData->setAbscissa("Labels");

        $MyData->setAxisDisplay(0, AXIS_FORMAT_CUSTOM, "YAxisFormatSymbol");
        $MyData->setAxisColor(0, array("R" => 96, "G" => 96, "B" => 96));
        


        /* Create the pChart object */
        $myPicture = new pImage(310, 180, $MyData);


        /* Turn of Antialiasing */
        $myPicture->Antialias = FALSE;
        $serieSettings = array("R" => 109, "G" => 152, "B" => 171);
        $MyData->setPalette("Stocks", $serieSettings);

        $myPicture->setFontProperties(array("FontName" => "application/third_party/pchart/fonts/pf_arma_five.ttf", "FontSize" => 6, "R" => 110, "G" => 110, "B" => 110));

        /* Define the chart area */
        $myPicture->setGraphArea(45, 5, 310, 160);

        /* Draw the scale */
        $scaleSettings = array("Floating" => TRUE, "GridR" => 255, "GridG" => 255, "GridB" => 255, "CycleBackground" => TRUE);
        $myPicture->drawScale($scaleSettings);

        $myPicture->Antialias = TRUE;
        $myPicture->drawText(150, 178, "Year");

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
    global $yScaleSymbolCount;
    return '$' . number_format(($yScaleSymbolCount++ * 220)) . 'M';
}

?>