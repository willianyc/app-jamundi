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
  case 'consultarfuncionario':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarfuncionarioVW.php');
    break;
  case 'consultarretiro':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarretirolVW.php');
    break;
  case 'consultarmovilidad':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarmovilidadVW.php');
    break;
  case 'consultarincapacidad':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarincapacidadVW.php');
    break;
  case 'consultarseguidadSocial':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarseguridadsocialVW.php');
    break;
    include('html/administrador/overall/headerVW.php');
    include('html/public/error404.php');
    break;
  case 'consultarfuncionarioIngreso':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarFuncionariosIngresoVW.php');
    break;
  case 'consultarfuncionarioEdad':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarFuncionariosEdadVW.php');
    break;
  case 'consultarfuncionarioNivelEducativo':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarFuncionarioNivelEducativoVW.php');
    break;
  case 'consultarfuncionarioGenero':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarFuncionarioGeneroVW.php');
    break;
  case 'consultarfuncionarioSede':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarFuncionarioSedeVW.php');
    break;
  case 'consultarfuncionarioHijosMenoresEdad':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarFuncionarioHijosMenoresEdadVW.php');
    break;	
  case 'consultarfuncionarioCumpleanos':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarFuncionarioCumpleanosVW.php');
    break;		
	
  case 'consultarfuncionarioDependencia':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/consultarFuncionarioDependenciaVW.php');
    break;
  case 'reporteFuncionariosSel':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/reporteFuncionariosSelVW.php');
    break;
  case 'reporteActividadCapacitacion':
    include('core/bin/functions/conexion.php');
    // include('core/models/generics/class.getClasificacionTribuMD.php');
    include('html/administrador/overall/headerVW.php');
    include('html/administrador/datos/reporteActividadCapacitacionVW.php');
    break;
}
