
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
    case 'reportecapacitacionexcel':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['fecha_ini']) && isset($_GET['fecha_fin'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportecapacitacion.excel.php');
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
        if (isset($_GET['nivel_educativo']) || isset($_GET['genero'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/excel/reportesNivelEducativo.excel.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            if ($_GET['num'] == 2)
                include('html/administrador/datos/consultarFuncionarioNivelEducativoVW.php');
            if ($_GET['num'] == 1)
                include('html/administrador/datos/consultarFuncionarioGeneroVW.php');
        }
        break;
    case 'reporteNivelEducativopdf':
        include('core/bin/functions/conexion.php');
        if (isset($_GET['nivel_educativo']) || isset($_GET['genero'])) {
            require_once('core/models/administrador/datos/class.generalesMD.php');
            require_once('core/models/administrador/pdf/reportesNivelEducativo.pdf.php');
        } else {
            include('html/administrador/overall/headerVW.php');
            if ($_GET['num'] == 2)
                include('html/administrador/datos/consultarFuncionarioNivelEducativoVW.php');
            if ($_GET['num'] == 1)
                include('html/administrador/datos/consultarFuncionarioGeneroVW.php');
        }
        break;
        include('html/administrador/overall/headerVW.php');
        include('html/public/error404.php');
        break;
}
