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
            require('core/models/administrador/datos/class.inspeccionMD.php');
            echo json_encode(inspeccionMD::crear());
            exit();
        } else {
            // include('core/models/generics/class.getClasificacionTribuMD.php');
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/inspeccionVW.php');
        }
        break;
    case 'modificar':
        include('core/bin/functions/conexion.php');
        if (isset($_POST['general'])) {
            // require('vendor/validacion/gump/gump_dd.class.php');
            include('core/bin/functions/class.logger.php');
            require('core/models/administrador/datos/class.inspeccionMD.php');
            echo json_encode(inspeccionMD::modificar());
            exit();
        } else {
            // include('core/models/generics/class.getClasificacionTribuMD.php');
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/inspeccionVW.php');
        }
        break;
    case 'eliminar':
        include('core/bin/functions/conexion.php');
        if (isset($_POST['general'])) {
            // require('vendor/validacion/gump/gump_dd.class.php');
            include('core/bin/functions/class.logger.php');
            require('core/models/administrador/datos/class.inspeccionMD.php');
            echo json_encode(inspeccionMD::eliminar());
            exit();
        } else {
            // include('core/models/generics/class.getClasificacionTribuMD.php');
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/inspeccionVW.php');
        }
        break;
    case 'consultarInspeccion':
        include('core/bin/functions/conexion.php');
        if (isset($_POST['general'])) {
            // require('vendor/validacion/gump/gump_dd.class.php');
            include('core/bin/functions/class.logger.php');
            require('core/models/administrador/datos/class.inspeccionMD.php');
            echo json_encode(inspeccionMD::eliminar());
            exit();
        } else {
            // include('core/models/generics/class.getClasificacionTribuMD.php');
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/getInspeccionVW.php');
        }
        break;
    case 'consultar':
        include('core/bin/functions/conexion.php');
        if (isset($_POST['general'])) {
            // require('vendor/validacion/gump/gump_dd.class.php');
            include('core/bin/functions/class.logger.php');
            // require('core/models/administrador/datos/class.inspeccionMD.php');
            // echo json_encode(inspeccionMD::crear());
            exit();
        } else {
            // include('core/models/generics/class.getClasificacionTribuMD.php');
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarinspeccionVW.php');
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
            require('core/models/administrador/datos/class.inspeccionMD.php');
            echo json_encode(inspeccionMD::trazabilidad());
            exit();
        } else {
            // include('core/models/generics/class.getClasificacionTribuMD.php');
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/inspeccionVW.php');
        }
        break;
}
