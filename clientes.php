<?php include("bd.php"); ?>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Clientes</title>
    <link rel="shortcut icon" href="imagenes/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css ">
    <link rel="stylesheet" href="fondo.css">
  </head>
  <body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="index.html">Inicio</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarColor02">
            <ul class="navbar-nav me-auto">
              <li class="nav-item">
                <a class="nav-link active" href="clientes.php">Clientes
                  <span class="visually-hidden">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="compras.php">Compras</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="producto.php">Productos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="proveedor.php">Proveedor</a>
              </li>
                </div>
              </li>
            </ul>
            <form action="buscar.php" method="GET" class="d-flex">
              <input style="font-family: 'Font Awesome 5 free'; font-weight: 700;" type="text" class="form-control" placeholder="&#Xf002;" name="busqueda" id="busqueda">
              <input type="submit" class="btn btn-dark" value="buscar">
            </form>
          </div>
        </div>
      </nav>
      <br><br>
      <form action="guardar.php" method="POST">
      <div class="container">
  <div class="row">
    <div class="col-4">
    <div class="form-floating mb-3">
    <input type="text" class="form-control" id="floatingInput" placeholder="codcliente" name="codcliente">
    <label for="floatingInput">Cod_cliente</label>  
    </div>
    <br>
    <div class="form-floating">
    <input type="text" class="form-control" id="floatingPassword" placeholder="Nit" name="nit">
    <label for="floatingPassword">Nit</label>
    </div>
    <br>
    <div class="form-floating">
    <input type="text" class="form-control" id="floatingPassword" placeholder="Nombre" name="nombre">
    <label for="floatingPassword">Nombre</label>
    </div>
    <br>
    <div class="form-floating">
    <input type="text" class="form-control" id="floatingPassword" placeholder="Apellido" name="apellido">
    <label for="floatingPassword">Apellido</label>
    </div>
    <br>
    <div class="form-floating">
    <input type="text" class="form-control" id="floatingPassword" placeholder="Direccion" name="direccion">
    <label for="floatingPassword">Direccion</label>
    </div>
    <br>
    <center>
    <input type="submit" class="btn btn-danger" name="enviar">
    </center>
    </div>
    <div class="col-8">
    <table class="table table-dark table-hover">
    <thead>
    <tr>
    <th scope="col">CodCliente</th>
    <th scope="col">Nit</th>
    <th scope="col">Nombre</th>
    <th scope="col">Apellidos</th>
    <th scope="col">Direccion</th>
    <th scope="col">Acciones</th>
    </tr>
    </thead>
    <tbody>
    <?php
    $query="SELECT * FROM clientes";
    $resultat=mysqli_query($conn,$query);
    while ($row=mysqli_fetch_array($resultat)){ ?>
    <tr>
    <td><?php echo $row ['codcliente'] ?> </td>
    <td><?php echo $row ['nit'] ?> </td>
    <td><?php echo $row ['nombre'] ?> </td>
    <td><?php echo $row ['apellido'] ?> </td>
    <td><?php echo $row ['direccion'] ?> </td>
    <td>
    <a href="editar.php?id=<?php echo $row ['codcliente'] ?>" class="btn btn-info"> <img src="imagenes/1.png" width="20"></a>
    <a href="eliminar.php?id=<?php echo $row ['codcliente'] ?>" class="btn btn-danger"> <img src="imagenes/elim.png" width="20"></a>
    </td>
    </tr> 

    <?php } ?>

    </tbody>
    </table>
    </div>
    </div>
  </form>