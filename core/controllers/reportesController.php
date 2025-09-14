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
    case 'participacionActividades':
        include('core/bin/functions/conexion.php');
        include('html/administrador/overall/headerVW.php');
        include('html/administrador/datos/participacionFunActividadesVW.php');
        break;
    case 'participacionCapacitaciones':
        include('core/bin/functions/conexion.php');
        include('html/administrador/overall/headerVW.php');
        include('html/administrador/datos/participacionFunCapacitacionesVW.php');
        break;
    case 'rankingFuncionariosCapacitacion':
        include('core/bin/functions/conexion.php');
        include('html/administrador/overall/headerVW.php');
        include('html/administrador/datos/rankingFuncionariosCapacitacionVW.php');
        break;
    case 'rankingFuncionariosActividades':
        include('core/bin/functions/conexion.php');
        include('html/administrador/overall/headerVW.php');
        include('html/administrador/datos/rankingFuncionariosActividadVW.php');
        break;
    case 'reportefuncionariocumpleexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['mes'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportefuncionariocumple.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/reportefuncionarioVW.php');
        }
        break;
    case 'reporteactividadesexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteactividad.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/reporteactividadVW.php');
        }
        break;
    case 'reportehijos':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['edad'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportehijos.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/reportehijosVW.php');
        }
        break;
    case 'reportefuncionarioexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['todos'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportefuncionariocumple.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioVW.php');
        }
        break;
    case 'reportefuncionariopdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['todos'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reportefuncionario.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioVW.php');
        }
        break;

        case 'reportefuncionariohijosmenorespdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reportesfuncionariosHijosMenores.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioVW.php');
        }
        break;

        case 'reportesfuncionariosCumplepdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reportesfuncionariosCumple.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioVW.php');
        }
        break;

    case 'reporteretiroexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['todos'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteretiro.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarretiroVW.php');
        }
        break;
    case 'reporteretiropdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['todos'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporteretiro.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarretiroVW.php');
        }
        break;
    case 'reporteincapacidadexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['todos'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteincapacidad.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarincapacidadVW.php');
        }
        break;
    case 'reporteincapacidadpdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['todos'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporteincapacidad.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarincapacidadVW.php');
        }
        break;
    case 'reportemovilidadexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['todos'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportemovilidad.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarmovilidadVW.php');
        }
        break;
    case 'reportemovilidadpdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['todos'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reportemovilidad.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarmovilidadVW.php');
        }
        break;
    case 'consultacapacitacionexcel':
        include('core/bin/functions/conexion.php');
        if (true) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/consultarCapacitacion.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarCapacitacionVW.php');
        }
        break;
    case 'consultacapacitacionbyIdexcel':
        include('core/bin/functions/conexion.php');
        if (true) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteCapacitacionById.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarCapacitacionVW.php');
        }
        break;
    case 'asignacionFuncionariosCapacitacionesProgramadasByIdexcel':
        include('core/bin/functions/conexion.php');
        if (true) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteCapacitacionProgramadaById.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarCapacitacionVW.php');
        }
        break;
    case 'consultaActividadByIdexcel':
        include('core/bin/functions/conexion.php');
        if (true) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteActividadById.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarCapacitacionVW.php');
        }
        break;
    case 'consultacapacitacionByIdPdf':
        include('core/bin/functions/conexion.php');
        if (true) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporteCapacitacionById.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarCapacitacionVW.php');
        }
        break;
    case 'actividadesexcel':
        include('core/bin/functions/conexion.php');
        if (true) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteactividad.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarCapacitacionVW.php');
        }
        break;
    case 'actividadespdf':
        include('core/bin/functions/conexion.php');
        if (true) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporteactividad.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarCapacitacionVW.php');
        }
        break;
    case 'reportecapacitacionexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteConsultarCapacitacion.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/reportecapacitacionVW.php');
        }
        break;
    case 'reporteseguridadsocialexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['todos'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteseguridadsocial.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/reportecapacitacionVW.php');
        }
        break;
    case 'reporteseguridadsocialpdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['todos'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporteseguridadsocial.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/reportecapacitacionVW.php');
        }
        break;
    case 'consultacapacitacionpdf':
        include('core/bin/functions/conexion.php');
        if (true) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporteListarCapacitacion.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarCapacitacionVW.php');
        }
        break;    
    case 'reportefuncionarioIngresoexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportesfechaingreso.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioIngresoVW.php');
        }
        break;
    case 'reportefuncionarioIngresopdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reportefuncionarioIngreso.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioIngresoVW.php');
        }
        break;
    case 'reporteEdadexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['edad_ini']) && isset($_GET['edad_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportesedad.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionariosEdadVW.php');
        }
        break;
    case 'reporteEdadpdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['edad_ini']) && isset($_GET['edad_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reportefuncionarioedad.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionariosEdadVW.php');
        }
        break;
    case 'reporteNivelEducativoexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['nivel_educativo']) || isset($_GET['genero']) || isset($_GET['sede']) || isset($_GET['dependencia'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportesNivelEducativo.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            if ($_GET['num'] == 2)
                include('html/administrador/datos/consultarFuncionarioNivelEducativoVW.php');
            if ($_GET['num'] == 1)
                include('html/administrador/datos/consultarFuncionarioGeneroVW.php');
            if ($_GET['num'] == 3)
                include('html/administrador/datos/consultarFuncionarioSedeVW.php');
            if ($_GET['num'] == 4)
                include('html/administrador/datos/consultarFuncionarioDependenciaVW.php');
        }
        break;
    case 'reporteNivelEducativopdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['nivel_educativo']) || isset($_GET['genero']) || isset($_GET['sede']) || isset($_GET['dependencia'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reportesNivelEducativo.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            if ($_GET['num'] == 2)
                include('html/administrador/datos/consultarFuncionarioNivelEducativoVW.php');
            if ($_GET['num'] == 1)
                include('html/administrador/datos/consultarFuncionarioGeneroVW.php');
            if ($_GET['num'] == 3)
                include('html/administrador/datos/consultarFuncionarioSedeVW.php');
            if ($_GET['num'] == 4)
                include('html/administrador/datos/consultarFuncionarioDependenciaVW.php');
        }
        break;
	case 'reporteGeneroFechaspdf':
        include('core/bin/functions/conexion.php');
		if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin']) && isset($_GET['genero'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reportesGeneroFecha.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionarioGeneroVW.php');
		}
        break;

        case 'reporteNivelEducativoFechaspdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin']) && isset($_GET['nivel_educativo'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reportesNivelEducativoFecha.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionarioGeneroVW.php');
        }
        break;
	case 'reporteGeneroFechasExcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin']) && isset($_GET['genero'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportesGeneroFechas.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionarioGeneroVW.php');
          
        }
        break;

        case 'reporteNivelEducativoFechasExcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin']) && isset($_GET['nivel_educativo'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportesNivelEducativoFechas.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionarioGeneroVW.php');
          
        }
        break;


        case 'reportesFuncionarioMenoresEdadEcxel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportesFuncionarioMenoresEdad.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionarioHijosMenoresEdadVW.php');
          
        }
        break;

        case 'reportesfuncionariosFechaCumpleEcxel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportesFuncionariosFechaCumple.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionarioHijosMenoresEdadVW.php');
          
        }
        break;

        case 'rankingfunCapacitacionesexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/rankingcapacitaciones.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionarioHijosMenoresEdadVW.php');
          
        }
        break;

         case 'participacionCapacitacionesexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteParticipacionenCapacitaciones.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionarioHijosMenoresEdadVW.php');
          
        }
        break;

        case 'participacionActividedesexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reporteParticipacionenActividades.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionarioHijosMenoresEdadVW.php');
          
        }
        break;


         case 'rankingfunActividadesexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/rankingactividades.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarFuncionarioHijosMenoresEdadVW.php');
          
        }
        break;

         case 'rankingCapacitacionespdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporterankingfuncapacitaciones.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioIngresoVW.php');
        }
        break;

        case 'rankingActividadespdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporterankingactividades.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioIngresoVW.php');
        }
        break;

         case 'reporteparticipacionencapacitacionpdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporteParticipacionCapacitaciones.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioIngresoVW.php');
        }
        break;


          case 'reporteparticipacionenactividadespdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporteParticipacionenActividades.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioIngresoVW.php');
        }
        break;

        case 'reporteCapacitacionespdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporteConsultarCapacitacion.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioIngresoVW.php');
        }
        break;


        case 'reporteactividadpdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reporteactividad.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            include('html/administrador/datos/consultarfuncionarioIngresoVW.php');
        }
        break;

        case 'rankingCapacitacionesexcel':
        include('core/bin/functions/conexion.php');
       
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/rankingCapacitaciones.excel.php'); 
        break;

        // Majjul
        case 'consultaractividadesprogramadaspdf':
            include('core/bin/functions/conexion.php');
            if (true) {
                require_once('core/models/administrador/datos/class.generalesMD.php');
                require_once('core/models/administrador/pdf/reporteListarActividadesProgramadas.pdf.php');
            } else {
                include('html/administrador/overall/headerVW.php');
                include('html/administrador/datos/consultarActividadesProgramadasVW.php');
            }
            break;

        // Majjul
        case 'consultarcapacitacionesprogramadaspdf':
            include('core/bin/functions/conexion.php');
            if (true) {
                require_once('core/models/administrador/datos/class.generalesMD.php');
                require_once('core/models/administrador/pdf/reporteListarCapacitacionesProgramadas.pdf.php');
            } else {
                include('html/administrador/overall/headerVW.php');
                include('html/administrador/datos/consultarCapacitacionesProgramadasVW.php');
            }
            break; 

        // Majjul
        case 'consultarinspeccionespdf':
            include('core/bin/functions/conexion.php');
            if (true) {
                require_once('core/models/administrador/datos/class.generalesMD.php');
                require_once('core/models/administrador/pdf/reporteListarInspecciones.pdf.php');
            } else {
                include('html/administrador/overall/headerVW.php');
                include('html/administrador/datos/consultarInpesccionVW.php');
            }
            break; 
        
        // Majjul
        case 'consultarmatrizpdf':
            include('core/bin/functions/conexion.php');
            if (true) {
                require_once('core/models/administrador/datos/class.generalesMD.php');
                require_once('core/models/administrador/pdf/reporteListarMatriz.pdf.php'); 
            } else {
                include('html/administrador/overall/headerVW.php');
                include('html/administrador/datos/consultarMatrizVW.php');
            }
            break;
        
        //Majjul
        case 'consultacapacitacionesprogramadasexcel':
            include('core/bin/functions/conexion.php');
            if (true) {
                require_once('core/models/administrador/datos/class.generalesMD.php');
                require_once('core/models/administrador/excel/consultarCapacitacionesProgramadas.excel.php');
            } else {
                include('html/administrador/overall/headerVW.php');
                include('html/administrador/datos/consultarCapacitacionesProgramadasVW.php');
            }
            break;
        
        //Majjul
        case 'consultaactividadesprogramadasexcel':
            include('core/bin/functions/conexion.php');
            if (true) {
                require_once('core/models/administrador/datos/class.generalesMD.php');
                require_once('core/models/administrador/excel/consultarActividadesProgramadas.excel.php');
            } else {
                include('html/administrador/overall/headerVW.php');
                include('html/administrador/datos/consultarActividadesProgramadasVW.php');
            }
            break;
        
        //Majjul
        case 'consultainspeccionexcel':
            include('core/bin/functions/conexion.php');
            if (true) {
                require_once('core/models/administrador/datos/class.generalesMD.php');
                require_once('core/models/administrador/excel/consultarInspecciones.excel.php');
            } else {
                include('html/administrador/overall/headerVW.php');
                include('html/administrador/datos/consultarInspeccionVW.php');
            }
            break;
        
        //Majjul
        case 'consultamatrizexcel': 
            include('core/bin/functions/conexion.php');
            if (true) {
                require_once('core/models/administrador/datos/class.generalesMD.php');
                require_once('core/models/administrador/excel/consultarMatriz.excel.php');
            } else {
                include('html/administrador/overall/headerVW.php');
                include('html/administrador/datos/consultarMatrizVW.php');
            }
            break;
}
