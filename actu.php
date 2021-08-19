<?php
include("bd.php");

    $codcliente=$_POST['codcliente'];
    $nit=$_POST['nit'];
    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $direccion=$_POST['direccion'];

$actualizar="UPDATE clientes SET nit='$nit', nombre='$nombre', apellido='$apellido', direccion='$direccion' WHERE codcliente='$codcliente'";
$resultado=mysqli_query($conn, $actualizar);
if ($resultado) {
    header ('location:clientes.php');
} else {
    echo '<script lenguage="javascript">';
    echo 'alert("No se ha podido actualizar los datos")';
    echo '</script>';
}
?>

