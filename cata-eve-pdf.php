<?php

$url = $urlServicio."light-eve-det.php?eCodEvento=".$_GET['val'];


$html=file_get_contents($url);

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


$html=str_replace('font-size:14px;','font-size:12px;',$html);






//==============================================================
//==============================================================
//==============================================================


include("./mpdf/mpdf-2.php");
$mpdf=new mPDF('c'); 

$mpdf->mirrorMargins = true;

$mpdf->SetDisplayMode('fullpage','two');

$mpdf->WriteHTML($html);



$mpdf->Output();
exit;


//==============================================================
//==============================================================
//==============================================================
//==============================================================
//==============================================================


?>