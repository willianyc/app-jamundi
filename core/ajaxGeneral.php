<?php

// error_log('+** ajax [SERVER]: ' . print_r($_SERVER, 1)); //.' - [Var2]: '.);//.' - [Var3]: '.);
// echo($_GET['mode']);

if (!isset($_GET['mode'])) {
  echo 'mode?';
  exit();
}

switch ($_GET['mode']) {
  case 'tipoIdentificacion':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::tipoIdentificacion());
    break;
  case 'rh':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::rh());
    break;
  case 'etnia':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::etnia());
    break;
  case 'parentesco':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::parentesco());
    break;
  case 'nivelEducativo':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::nivel_educativo());
    break;
  case 'Vinculacion':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::vinculacion());
    break;
  case 'nivel':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::nivel());
    break;
  case 'cargo':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::cargo());
    break;
  case 'codigo':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::codigo());
    break;
  case 'grado':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::grado());
    break;
  case 'dependencia':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::dependencia());
    break;
  case 'seguridadSocial':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::seguridadSocial());
    break;
  case 'sede':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::sede());
    break;
  case 'getFuncionario':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionario());
    break;
  case 'eps':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::eps());
    break;
  case 'fondoPension':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::fondoPension());
    break;
  case 'fondoCesantias':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::fondoCesantias());
    break;
  case 'arl':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::arl());
    break;
  case 'caja_compensacion':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::caja_compensacion());
    break;
  case 'getFuncionarioSeguridadSocial':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionarioSeguridadSocial());
    break;
  case 'getFuncionarioSeguridadSocial_2':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionarioSeguridadSocial_2());
    break;
  case 'municipio':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::municipio());
    break;
  case 'getSegSocial':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getSegSocial());
    break;
  case 'victima':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::victimasViolencias());
    break;
  case 'getFuncionario_2':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionario_2());
    break;
  case 'getFuncionario_3':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionario_3());
    break;
  case 'getFuncionario_4':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionario_4());
    break;
  case 'getFuncionariosEvaluaciones':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionariosEvaluaciones());
    break;
  case 'getIncapacidad':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getIncapacidad());
    break;
  case 'experienciaInst':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::experiencia());
    break;
  case 'tipo_retiro':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::tipo_retiro());
    break;
  case 'causa_retiro':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::causa_ret());
    break;
  case 'funcionariosAll':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionariosAll());
    break;
  case 'funcionariosAllFilter':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionariosAllFilter());
    break;
  case 'getActividad':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividad());
    break;
  case 'getActividad1_2':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividad1_2());
    break;
  case 'getCapacitacion':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getCapacitacion());
    break;
  case 'eliminarFamiliar':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::eliminarFamiliar());
    break;
  case 'getCapacitaciones':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getCapacitaciones());
    break;
  case 'estado_civil':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::estado_civil());
    break;
  case 'getActividades':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividades());
    break;
  case 'getActividadAsignacion':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividadAsignacion());
    break;
  case 'getFuncianariosActividadAnual':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncianariosActividadAnual());
    break;
  case 'getFuncianariosCapacitacionesAnual':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncianariosCapacitacionesAnual());
    break;
  case 'rankingFuncionariosCapacitacion':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::rankingFuncionariosCapacitacion());
    break;
  case 'rankingFuncionariosActividades':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::rankingFuncionariosActividades());
    break;
  case 'getHijos':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getHijos($_POST['edad']));
    break;
  case 'getMovilidad':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getMovilidad());
    break;
  case 'getMovilidad1_2':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getMovilidad1_2());
    break;
  case 'getRetiro':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getRetiro());
    break;
  case 'evaluacionImportarExcell':
    include(__DIR__.'/models/administrador/datos/class.evaluacionDesempenoMD.php');
    session_start();
    echo json_encode(evaluacionDesempenoMD::upload_file());
    break;
  case 'getActividadesProgramadas':
    require_once(__DIR__.'/bin/functions/conexion.php');
    include(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividadesProgramadas());
    break;
  case 'getCapacitacionesProgramadas':
    require_once(__DIR__.'/bin/functions/conexion.php');
    include(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getCapacitacionesProgramadas());
    break;
  case 'getActividadesProgramadasAsignacion':
    require_once(__DIR__.'/bin/functions/conexion.php');
    include(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividadesProgramadasAsignacion());
    break;
  case 'getCapacitacionesProgramadasAsignacion':
    require_once(__DIR__.'/bin/functions/conexion.php');
    include(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getCapacitacionesProgramadasAsignacion());
    break;
  case 'getFuncionarioIngreso':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::Funcionario_fechaIni($_POST['fecha_ini'], $_POST['fecha_fin']));
    break;
  case 'getFuncionarioEdad':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::Funcionario_edad($_POST['edad_ini'], $_POST['edad_fin']));
    break;
  case 'getFuncionarioGenero':
  require_once(__DIR__.'/bin/functions/conexion.php');
  require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
  session_start();
  echo json_encode(generalesMD::Funcionario_genero($_POST['fecha_ini'], $_POST['fecha_fin']));
  break;
  case 'getFuncionarioNivelEducativo':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionarioNivelEducativo($_POST['nivel_educativo'], $_POST['num']));
    break;
  case 'getInspeccion':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getInspeccion());
    break;
  case 'getInspeccionUnique':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require_once(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getInspeccionUnique());
    break;
  case 'evaluacionImportarValidar':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.evaluacionDesempenoMD.php');
    $action = $_GET['action'];
    session_start();
    echo json_encode(evaluacionDesempenoMD::validacionEvaluacion($action));
    break;
  case 'file':
    switch ($_GET['type']) {
      case 'evaluacion':
        include(__DIR__.'/models/administrador/datos/class.evaluacionDesempenoMD.php');
        session_start();
        echo json_encode(evaluacionDesempenoMD::downloadFileImport());
        break;
    }
    break;
  case 'getConsecutivo':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getConsecutivo());
    break;
  case 'getMatriz':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getMatriz());
    break;
  case 'getopciones':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getOpciones());
    break;
  case 'getusuarios':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getUsuarios());
    break;
  case 'getusuariosbyid':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getusuariosbyId());
    break;
  case 'getusuariosbyname':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getusuariosbyName());
    break;
  case 'download':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::downloadDocument());
    break;
  case 'historial':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getSeguridadSocialHistory());
    break;
    // default:
  //Majjul
  case 'reporteActividades':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getReportesActividades());
    break;
  //Majjull
  case 'getReporteActividadesProgramadas':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getReportesActividades());
    break;
  case 'getinfoacademica':
    require_once(__DIR__.'/bin/functions/conexion.php');
    require(__DIR__.'/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getinfoacademica( ));
    break;
}
