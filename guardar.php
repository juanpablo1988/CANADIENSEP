<?php 
include("bd.php");

if (isset($_POST['enviar'])) {
    $codcliente=$_POST['codcliente'];
    $nit=$_POST['nit'];
    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $direccion=$_POST['direccion'];

    $query="INSERT INTO clientes (codcliente, nit, nombre, apellido, direccion) VALUES ('$codcliente', '$nit', '$nombre', '$apellido', '$direccion')";
    $resultado=mysqli_query($conn, $query);
    if ($resultado) {
        die ('Se ha agregado el cliente');
    }
    header('location:clientes.php');
}
?>