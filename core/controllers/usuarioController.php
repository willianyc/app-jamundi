<?php
session_start();
if (!isset($_SESSION['usuario']) || !isset($_SESSION['password'])|| !isset($_SESSION['nivel'])) {
  session_destroy();
  header('location: index.php');
  exit();
}
switch (isset($_GET['mode']) ? $_GET['mode'] : null) {
  case 'crear':
    include('core/bin/functions/conexion.php');
    if (isset($_POST['general'])) {
      require('core/models/administrador/datos/class.administracionUsuariosMD.php');
      echo json_encode(AdministracionUsuarioMD::crear());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/usuariosVW.php');
    }
    break;
  case 'modificarpass':
    include('core/bin/functions/conexion.php');
    if (isset($_POST['general'])) {
      require('core/models/administrador/datos/class.administracionUsuariosMD.php');
      echo json_encode(AdministracionUsuarioMD::modificarPass());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/cambiarPasswordVW.php');
    }
    break;
  case 'modificar':
    include('core/bin/functions/conexion.php');
    if (isset($_POST['general'])) {
      // require('vendor/validacion/gump/gump_dd.class.php');
      include('core/bin/functions/class.logger.php');
      require('core/models/administrador/datos/class.actividadMD.php');
      echo json_encode(actividadMD::modificar());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/crearActividadVW.php');
    }
    break;
  case 'eliminar':
    include('core/bin/functions/conexion.php');
    if (isset($_POST['general'])) {
      // require('vendor/validacion/gump/gump_dd.class.php');
      include('core/bin/functions/class.logger.php');
      require('core/models/administrador/datos/class.actividadMD.php');
      echo json_encode(actividadMD::eliminar());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/crearActividadVW.php');
    }
    break;
  case 'consultar':
    include('core/bin/functions/conexion.php');
    if (isset($_POST['general'])) {
      // require('vendor/validacion/gump/gump_dd.class.php');
      include('core/bin/functions/class.logger.php');
      require('core/models/administrador/datos/class.actividadMD.php');
      echo json_encode(actividadMD::crear());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/consultarActividadVW.php');
    }
    break;
    include('html/administrador/overall/headerVW.php');
    include('html/public/error404.php');
    break;
}
