<?php

// error_log('+** ajax [SERVER]: ' . print_r($_SERVER, 1)); //.' - [Var2]: '.);//.' - [Var3]: '.);
// echo($_GET['mode']);
if (!isset($_GET['mode'])) {
  echo 'mode?';
  exit();
}

switch ($_GET['mode']) {
  case 'tipoIdentificacion':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::tipoIdentificacion());
    break;
  case 'rh':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::rh());
    break;
  case 'etnia':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::etnia());
    break;
  case 'parentesco':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::parentesco());
    break;
  case 'nivelEducativo':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::nivel_educativo());
    break;
  case 'Vinculacion':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::vinculacion());
    break;
  case 'nivel':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::nivel());
    break;
  case 'cargo':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::cargo());
    break;
  case 'codigo':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::codigo());
    break;
  case 'grado':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::grado());
    break;
  case 'dependencia':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::dependencia());
    break;
  case 'seguridadSocial':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::seguridadSocial());
    break;
  case 'sede':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::sede());
    break;
  case 'getFuncionario':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionario());
    break;
  case 'eps':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::eps());
    break;
  case 'fondoPension':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::fondoPension());
    break;
  case 'fondoCesantias':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::fondoCesantias());
    break;
  case 'arl':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::arl());
    break;
  case 'caja_compensacion':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::caja_compensacion());
    break;
  case 'getFuncionarioSeguridadSocial':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionarioSeguridadSocial());
    break;
  case 'getFuncionarioSeguridadSocial_2':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionarioSeguridadSocial_2());
    break;
  case 'municipio':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::municipio());
    break;
  case 'getSegSocial':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getSegSocial());
    break;
  case 'victima':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::victimasViolencias());
    break;
  case 'getFuncionario_2':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionario_2());
    break;
  case 'getFuncionario_3':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionario_3());
    break;
  case 'getFuncionario_4':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionario_4());
    break;
  case 'getFuncionariosEvaluaciones':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionariosEvaluaciones());
    break;
	
 case 'getFuncionarioPorFechaCumple':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::FuncionariofechaCumple($_POST['fecha_i'], $_POST['fecha_f']));
    break; 	
	
  case 'getIncapacidad':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getIncapacidad());
    break;
  case 'experienciaInst':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::experiencia());
    break;
  case 'tipo_retiro':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::tipo_retiro());
    break;
  case 'causa_retiro':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::causa_ret());
    break;
  case 'funcionariosAll':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionariosAll());
    break;
  case 'funcionariosAllFilter':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionariosAllFilter());
    break;
  case 'getActividad':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividad());
    break;
  case 'getActividad1_2':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividad1_2($_POST['fecha_ini'], $_POST['fecha_fin']));
    break;
  case 'getCapacitacion':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getCapacitacion());
    break;
  case 'eliminarFamiliar':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::eliminarFamiliar());
    break;
    case 'eliminarinfoAcademica':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::eliminarinfoAcademica());
    break;
  case 'getCapacitaciones':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getCapacitaciones($_POST['fecha_ini'], $_POST['fecha_fin']));
    break;
case 'getListadoCapacitaciones':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getListadoCapacitaciones());
    break;

     case 'ParticipacionesenCapacitaciones':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::ParticipacionesenCapacitaciones($_POST['fecha_ini'], $_POST['fecha_fin']));
    break;
       case 'ParticipacionesenActividades':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::ParticipacionesenActividades($_POST['fecha_ini'], $_POST['fecha_fin']));
    break;

  case 'tipo_documento':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::tipo_documento());
    break;
  
case 'condicion_vulnerabilidad':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::condicion_vulnerabilidad());
    break;

case 'organizacion_sindical':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::organizacion_sindical());
    break;

case 'paises':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::paises());
    break;

case 'departamentos':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::departamentos($_POST['id_pais']));
    break;

case 'ciudades':
require_once('core/bin/functions/conexion.php');
require_once('core/models/administrador/datos/class.generalesMD.php');
session_start();
echo json_encode(generalesMD::ciudades($_POST['id_departamento']));
break;




  case 'estado_civil':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::estado_civil());
    break;
  case 'getActividades':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividades());
    break;
  case 'getActividadAsignacion':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividadAsignacion());
    break;
  case 'getFuncianariosActividadAnual':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncianariosActividadAnual());
    break;
  case 'getFuncianariosCapacitacionesAnual':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncianariosCapacitacionesAnual());
    break;
  case 'rankingFuncionariosCapacitacion':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::rankingFuncionariosCapacitacion($_POST['fecha_i'], $_POST['fecha_f']));
    break;
  case 'rankingFuncionariosActividades':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::rankingFuncionariosActividades($_POST['fecha_i'], $_POST['fecha_f']));
    break;
  case 'getHijos':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getHijos($_POST['edad']));
    break;
  case 'getMovilidad':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getMovilidad());
    break;
  case 'getMovilidad1_2':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getMovilidad1_2());
    break;
  case 'getRetiro':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getRetiro());
    break;
  case 'evaluacionImportarExcell':
    include('core/models/administrador/datos/class.evaluacionDesempenoMD.php');
    session_start();
    echo json_encode(evaluacionDesempenoMD::upload_file());
    break;
  case 'getActividadesProgramadas':
    require_once('core/bin/functions/conexion.php');
    include('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividadesProgramadas());
    break;
  case 'getCapacitacionesProgramadas':
    require_once('core/bin/functions/conexion.php');
    include('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getCapacitacionesProgramadas());
    break;
  case 'getActividadesProgramadasAsignacion':
    require_once('core/bin/functions/conexion.php');
    include('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividadesProgramadasAsignacion());
    break;
  case 'getCapacitacionesProgramadasAsignacion':
    require_once('core/bin/functions/conexion.php');
    include('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getCapacitacionesProgramadasAsignacion());
    break;
  case 'getFuncionarioIngreso':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::Funcionario_fechaIni($_POST['fecha_ini'], $_POST['fecha_fin']));
    break;
  case 'getFuncionarioEdad':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::Funcionario_edad($_POST['edad_ini'], $_POST['edad_fin']));
    break;
  case 'getFuncionarioNivelEducativo':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionarioNivelEducativo($_POST['nivel_educativo'], $_POST['num']));
    break;
     case 'getFuncionarioNivelEducativoNuevo':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionarioNivelEducativoNuevo($_POST['fecha_ini'], 
        $_POST['fecha_fin'],
        $_POST['nivel_e']));
    break;

    case 'getFuncionarioHijosMenores':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionarioHijosMenores($_POST['fecha_i'],$_POST['fecha_f']));
    break;
  case 'getFuncionarioGenero':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getFuncionarioGeneroFechas($_POST['fecha_ini'], 
        $_POST['fecha_fin'], 
        $_POST['genero']));
    break;
  case 'getInspeccion':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getInspeccion());
    break;
  case 'getInspeccionUnique':
    require_once('core/bin/functions/conexion.php');
    require_once('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getInspeccionUnique());
    break;
  case 'evaluacionImportarValidar':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.evaluacionDesempenoMD.php');
    $action = $_GET['action'];
    session_start();
    echo json_encode(evaluacionDesempenoMD::validacionEvaluacion($action));
    break;
  case 'file':
    switch ($_GET['type']) {
      case 'evaluacion':
        include('core/models/administrador/datos/class.evaluacionDesempenoMD.php');
        session_start();
        echo json_encode(evaluacionDesempenoMD::downloadFileImport());
        break;
    }
    break;
  case 'getConsecutivo':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getConsecutivo());
    break;
  case 'getMatriz':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getMatriz());
    break;
  case 'getopciones':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getOpciones());
    break;
  case 'getusuarios':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getUsuarios());
    break;
  case 'getusuariosbyid':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getusuariosbyId());
    break;
  case 'getusuariosbyname':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getusuariosbyName());
    break;
  case 'download':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::downloadDocument());
    break;
  case 'historial':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getSeguridadSocialHistory());
    break;
    // default: 
  //Majjul
  case 'getReporteActividadesProgramadas':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getReportesActividades());
    break;
  //Majjul
  case 'getReporteCapacitacionesProgramadas':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getReportesCapacitaciones());
    break;
  //Majjul
  case 'getReporteInspeccionesProgramadas':
    require_once('core/bin/functions/conexion.php');
    require('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getReportesInspecciones()); 
    break;
  //Majjul
  case 'getActividadesProgramadasTrazabilidad':
    require_once('core/bin/functions/conexion.php');
    include('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getActividadesProgramadasTrazabilidad());
    break;
  case 'getCapacitacionesProgramadasTrazabilidad':
    require_once('core/bin/functions/conexion.php');
    include('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getCapacitacionesProgramadasTrazabilidad());
    break;
  case 'getInspeccionesTrazabilidad':
    require_once('core/bin/functions/conexion.php');
    include('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getInspeccionesTrazabilidad());
    break;
  case 'getMatrizTrazabilidad':
      require_once('core/bin/functions/conexion.php');
      include('core/models/administrador/datos/class.generalesMD.php');
      session_start();
      echo json_encode(generalesMD::getMatrizTrazabilidad());
      break;
  case 'getAsignacionFuncionariosCapacitacionesTrazabilidad':
    require_once('core/bin/functions/conexion.php');
    include('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getAsignacionFuncionariosCapacitacionesTrazabilidad());
    break;
  case 'getAsignacionFuncionariosActividadTrazabilidad':
    require_once('core/bin/functions/conexion.php');
    include('core/models/administrador/datos/class.generalesMD.php');
    session_start();
    echo json_encode(generalesMD::getAsignacionFuncionariosActividadTrazabilidad());
    break;
}