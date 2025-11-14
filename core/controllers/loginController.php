<?php

// session_start();
// if (
//   (isset($_SESSION['usuario']) || isset($_SESSION['password'])
//     || isset($_SESSION['nivel'])) && isset($_GET['mode']) == 'login'
// ) {
//   header('location: index.php?view=hojavida&mode=crear&id=hoja_vida');
// }


switch (isset($_GET['mode']) ? $_GET['mode'] : null) {
  case 'login':
    
    include('core/bin/functions/conexion.php');
    
    if (isset($_POST['general'])) {
     
      session_start();
      // require('vendor/validacion/gump/gump_dd.class.php');
      include('core/bin/functions/class.logger.php');
      require('core/models/administrador/datos/class.loginMD.php');
       
      echo json_encode(loginMD::Login());
      
      exit();
    } else {
      // include('core/models/generics/class.getClasificacionTribuMD.php');
      // include('html/administrador/overall/headerVW.php');
      include('html/administrador/datos/loginVW.php');
    }
  case 'cerrar':
    session_start();
    session_destroy();
    include('html/administrador/datos/loginVW.php');
    break;
    break;
    include('html/administrador/overall/headerVW.php');
    include('html/public/error404.php');
    break;
    // default:
    // include('html/administrador/datos/loginVW.php');
}
