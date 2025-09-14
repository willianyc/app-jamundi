<?php
session_start();
if (
  !isset($_SESSION['usuario']) || !isset($_SESSION['password'])
  || !isset($_SESSION['nivel'])
) {
  session_destroy();
  header('location: index.php');
  exit();
}

switch (isset($_GET['mode']) ? $_GET['mode'] : null) {
  case 'crear':
    include('core/bin/functions/conexion.php');
    if (isset($_POST['id_funcionario'])) {
      // require('vendor/validacion/gump/gump_dd.class.php');
      include('core/bin/functions/class.logger.php');
      // require('core/models/administrador/datos/class.usuarioMD.php');
      include('core/models/administrador/datos/class.movilidadMD.php');
      echo json_encode(movilidadMd::crear());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/movilidadVW.php');
    }
    break;
  case 'eliminar':
    include('core/bin/functions/conexion.php');
    if (isset($_POST['id_movilidad'])) {
      // require('vendor/validacion/gump/gump_dd.class.php');
      include('core/bin/functions/class.logger.php');
      require('core/models/administrador/datos/class.movilidadMD.php');
      echo json_encode(movilidadMD::EliminarMovilidad());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/movilidadVW.php');
    }
    break;
  case 'cargarDatos':
    include('core/bin/functions/conexion.php');
    if (isset($_POST['general'])) {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('core/models/administrador/datos/class.movilidadMD.php');
      echo json_encode(movilidadMD::CargarFuncionario());
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/movilidadVW.php');
    }
    include('html/administrador/overall/headerVW.php');
    include('html/public/error404.php');
    break;
}
