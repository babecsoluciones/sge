<?php
require_once("../cnx/swgc-mysql.php");
header('Content-Type: application/json');

$paquetes = array();

$searchTerm = $_GET['term'];

$select = "	SELECT 
				cc.*, 
				ce.tIcono as estatus,
				su.tNombre as promotor
			FROM
				CatClientes cc
			INNER JOIN CatEstatus ce ON cc.eCodEstatus = ce.eCodEstatus
			LEFT JOIN SisUsuarios su ON su.eCodUsuario = cc.eCodUsuario
            WHERE 1=1".
            ()
            ($_SESSION['sessionAdmin'][0]['bAll'] ? "" : " AND cc.eCodEstatus<> 7").
			($bAll ? "" : " AND cc.eCodUsuario = ".$_SESSION['sessionAdmin'][0]['eCodUsuario']).
			" ORDER BY cc.eCodCliente ASC";


$rsPaquetes = mysql_query($select);
while($rPaquete = mysql_fetch_array($rsPaquetes))
{
    $data['id'] = $rPaquete['eCodCliente'];
    $data['value'] = $rPaquete{'tNombres'}.' '.$rPaquete{'tApellidos'}.' ('.$rPaquete{'tCorreo'}.')';
    array_push($paquetes, $data);
	//$paquetes[] = array('codigo'=>$rPaquete{'eCodCliente'},'nombre'=>$rPaquete{'tNombres'}.' '.$rPaquete{'tApellidos'}.' ('.$rPaquete{'tCorreo'}.')');
}

echo json_encode($paquetes);

?>