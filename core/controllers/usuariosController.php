<?php
session_start();
if (
  !isset($_SESSION['usuario']) || !isset($_SESSION['password'])
  || !isset($_SESSION['nivel'])
) {
  session_destroy();
  header('location: index.php?error=sesion');
  exit();
}

switch (isset($_SESSION['nivel']) ? $_SESSION['nivel'] : null) {
  case '1':
    switch (isset($_GET['mode']) ? $_GET['mode'] : null) {
      case 'crear':
        include('core/bin/functions/conexion.php');
        if (isset($_POST['general'])) {
          require('vendor/validacion/gump/gump_dd.class.php');
          include('core/bin/functions/class.logger.php');
          require('core/models/administrador/datos/class.usuarioMD.php');
          echo json_encode(usuarioMD::crearUsuario());
          exit();
        } else {
          // include('core/models/generics/class.getClasificacionTribuMD.php');
          include('html/administrador/overall/headerVW.php');
          include('html/administrador/datos/crearusuariosVW.php');
        }
        break;
      case 'modificar':
        include('core/bin/functions/conexion.php');
        if (isset($_POST['general'])) {
          require('vendor/validacion/gump/gump_dd.class.php');
          include('core/bin/functions/class.logger.php');
          require('core/models/administrador/datos/class.usuarioMD.php');
          echo json_encode(usuarioMD::modificarUsuario());
          exit();
        } else {
          // include('core/models/generics/class.getClasificacionTribuMD.php');
          include('html/administrador/overall/headerVW.php');
          include('html/administrador/datos/crearusuariosVW.php');
        }
        break;
      default:
        include('html/administrador/overall/headerVW.php');
        include('html/public/error404.php');
        break;
    }
    break;
  default:
    header('location: ?view=logout');
    break;
}
