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
    if (isset($_POST['general'])) {
      // require('vendor/validacion/gump/gump_dd.class.php');
      include('core/bin/functions/class.logger.php');
      require('core/models/administrador/datos/class.capacitacionMD.php');
      echo json_encode(capacitacionMD::crear());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/capacitacionVW.php');
    }
    break;
  case 'modificar':
    include('core/bin/functions/conexion.php');
    if (!empty($_POST)) {
      // require('vendor/validacion/gump/gump_dd.class.php');
      include('core/bin/functions/class.logger.php');
      require('core/models/administrador/datos/class.capacitacionMD.php');
      echo json_encode(capacitacionMD::modificar());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/capacitacionVW.php');
    }
    break;
  case 'eliminar':
    include('core/bin/functions/conexion.php');
    if (isset($_POST['general'])) {
      // require('vendor/validacion/gump/gump_dd.class.php');
      include('core/bin/functions/class.logger.php');
      require('core/models/administrador/datos/class.capacitacionMD.php');
      echo json_encode(capacitacionMD::eliminar());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/capacitacionVW.php');
    }
    break;
  case 'consultar':
    include('core/bin/functions/conexion.php');
    if (isset($_POST['general'])) {
      // require('vendor/validacion/gump/gump_dd.class.php');
      include('core/bin/functions/class.logger.php');
      require('core/models/administrador/datos/class.capacitacionMD.php');
      echo json_encode(capacitacionMD::crear());
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/consultarCapacitacionVW.php');
    }
    break;
    include('html/administrador/overall/headerVW.php');
    include('html/public/error404.php');
    break;

    case 'trazabilidad':
      include('core/bin/functions/conexion.php');
      if (isset($_POST['general'])) {
        // require('vendor/validacion/gump/gump_dd.class.php');
        include('core/bin/functions/class.logger.php');
        require('core/models/administrador/datos/class.capacitacionMD.php');
        echo json_encode(capacitacionMD::trazabilidad());
        exit();
      } else {
        // include('core/models/generics/class.getClasificacionTribuMD.php');
        include('html/administrador/overall/headerVW.php');
        include('html/administrador/datos/consultarCapacitacionVW.php');
      }
      break;
      include('html/administrador/overall/headerVW.php');
      include('html/public/error404.php');
      break;
}
