<?php
require_once("../cnx/swgc-mysql.php");
header('Content-Type: application/json');

$paquetes = array();

$select = "SELECT * FROM CatServicios";
$rsPaquetes = mysql_query($select);
while($rPaquete = mysql_fetch_array($rsPaquetes))
{
	$paquetes[] = array('codigo'=>$rPaquete{'eCodServicio'},'nombre'=>$rPaquete{'tNombre'},'precio'=>$rPaquete{'dPrecioVenta'});
}

echo json_encode($paquetes);

?>