<?php

// error_log('+** ajax [SERVER]: ' . print_r($_SERVER, 1)); //.' - [Var2]: '.);//.' - [Var3]: '.);
if (!isset($_GET['mode'])) {
	echo 'mode?';
	exit();
}

switch ($_GET['mode']) {
	case 'login':
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/customer/class.loginAJXMD.php';
		session_start();
		echo loginAJXMD::ingresar();
		break;
	case 'centrocosto':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getCentroCostoAJXMD.php';
		session_start();
		echo json_encode(getCentroCostoMD::centroCosto());
		break;
	case 'centrocosto':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getCentroCostoAJXMD.php';
		session_start();
		// echo json_encode(getCentroCostoMD::desactivar());
		break;
	case 'subcentrocosto':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getSubcentroCostoAJXMD.php';
		session_start();
		echo json_encode(getSubcentroCostoMD::subCentroCosto());
		break;
	case 'subcentros':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getSubcentrosAJXMD.php';
		session_start();
		echo json_encode(getSubcentrosMD::subCentros());
		break;
	case 'centrocostoselected':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getSubcentroselectedAJXMD.php';
		session_start();
		echo json_encode(getCentrocostoselectMD::centroCostoSelected());
		break;
	case 'tipocomprobantes':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getTipoComprobantesAJXMD.php';
		session_start();
		echo json_encode(gettipoComprobanteMD::tipoComprobante());
		break;
	case 'comprobantes':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		require('core/models/generics/traits/consecutivoTipoComprobanteTRT.php');
		include 'core/bin/ajax/generics/class.getComprobanteAJXMD.php';
		session_start();
		echo json_encode(getComprobanteMD::getComprobantes());

		break;
	case 'asientos':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getAsientosAJXMD.php';
		session_start();
		echo json_encode(getAsientosMD::asientos());
		break;
	case 'categorias':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getCategoriaAJXMD.php';
		session_start();
		echo json_encode(getCategoriasMD::categorias());
		break;
	case 'buscargrupo':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getBuscarGrupoAJXMD.php';
		session_start();
		echo json_encode(getbuscarGrupoMD::buscarGrupo());
		break;
	case 'grupoaut':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getGrupoAutAJXMD.php';
		session_start();
		echo json_encode(getGrupoautMD::grupoau());
		break;
	case 'buscarproducto':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getBuscarProductoAJXMD.php';
		session_start();
		echo json_encode(getbuscarProductoMD::buscarProducto());
		break;
	case 'buscarservicio':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getBuscarServicioAJXMD.php';
		session_start();
		echo json_encode(getbuscarServicioMD::buscarServicio());
		break;
	case 'buscarsucursal':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getBuscarSucursalAJXMD.php';
		session_start();
		echo json_encode(getSucursalMD::sucursal());
		break;
	case 'sucursal':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getSucursalAJXMD.php';
		session_start();
		echo json_encode(buscarsucursalMD::getBuscarSucursal());
		break;
	case 'magnitud':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include 'core/bin/ajax/generics/class.getMagnitudAJXMD.php';
		session_start();
		echo json_encode(magnitudMD::getMagnitud());
		break;
	case 'medida':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getMedidaAJXMD.php');
		session_start();
		echo json_encode(medidaMD::getMedida());
		break;
	case 'pais':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getPaisAJXMD.php');
		session_start();
		echo json_encode(paisMD::getPais());
		break;
	case 'departamento':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getDepartamentoAJXMD.php');
		session_start();
		echo json_encode(departamentoMD::getDepartamentos());
		break;
	case 'ciudad':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getCiudadAJXMD.php');
		session_start();
		echo json_encode(ciudadMD::getCiudades());
		break;
	case 'buscarcategorias':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getBuscarCategoriasAJXMD.php');
		session_start();
		echo json_encode(buscarcategoriaMD::getBuscarCategoria());
		break;
	case 'atributocategorias':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getAtributoCategoriaAJXMD.php');
		session_start();
		echo json_encode(atributocategoriaMD::getAtributoCategoria());
		break;
	case 'caracteristicascategorias':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getCaracteristicasCategoriaAJXMD.php');
		session_start();
		echo json_encode(caracteristicascategoriaMD::getCaracteristicasCategoria());
		break;
	case 'articulos':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getArticulosAJXMD.php');
		session_start();
		echo json_encode(articulosMD::getArticulos());
		break;
	case 'impuestoarticulos':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getArticulosAJXMD.php');
		session_start();
		echo json_encode(articulosMD::getImpuestos());
		break;
	case 'series':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getCategoriaSeriesAJXMD.php');
		session_start();
		echo json_encode(seriecategoriaMD::getSerieCategoria());
		break;
	case 'articuloscdo':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getArticulosAJXMD.php');
		session_start();
		echo json_encode(articulosMD::ArticuloCod());
		break;
	case 'articulosnombre':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getArticulosAJXMD.php');
		session_start();
		echo json_encode(articulosMD::ArticuloNombre());
		break;
	case 'productos_detalles':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getArticulosAJXMD.php');
		session_start();
		echo json_encode(articulosMD::getProducto());
		break;
	case 'articulossalidas':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getArticulosAJXMD.php');
		session_start();
		echo json_encode(articulosMD::getArticulosSalidas());
		break;
	case 'serieslotes':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getSeriesLoteAJXMD.php');
		session_start();
		echo json_encode(serieslotesMD::getGeriesLotes());
		break;
	case 'listainventario':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getListaInventarioAJXMD.php');
		session_start();
		echo json_encode(articuloseninventarioMD::getArticulosEnInventario());
		break;
	case 'listainventariocdo':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getListaInventarioAJXMD.php');
		session_start();
		echo json_encode(articuloseninventarioMD::getInventarioCdo());
		break;
	case 'listainventarionombre':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getListaInventarioAJXMD.php');
		session_start();
		echo json_encode(articuloseninventarioMD::getInventarioNombre());
		break;
	case 'listainventariosucursal':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getListaInventarioAJXMD.php');
		session_start();
		echo json_encode(articuloseninventarioMD::getInventarioSucursal());
		break;
	case 'listacotizaciones':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getListaCotizacionesAJXMD.php');
		session_start();
		echo json_encode(listaCotizacionesMD::getlistaCotizaciones());
		break;
	case 'buscarcotizaciones':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getBuscarCotizacionAJXMD.php');
		session_start();
		echo json_encode(buscarCotizacionesMD::getBuscarCotizacion());
		break;
	case 'cotizacionseleccionada':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getCotizacionSelectedAJXMD.php');
		session_start();
		echo json_encode(cotizacionSeleccionadaMD::getCotizacionSelected());
		break;
	case 'facturaseleccionada':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getFacturaSelectedAJXMD.php');
		session_start();
		echo json_encode(facturaSeleccionadaMD::getFacturaSelected());
		break;
	case 'sucursales':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getSucursalesAJXMD.php');
		session_start();
		echo json_encode(getSucursalesMD::sucursales());
		break;
	case 'reterenta':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getReteFuenteAJXMD.php');
		session_start();
		echo json_encode(ReteFuenteMD::getReteFuente());
		break;
	case 'moduloscontables':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getModulosContAJXMD.php');
		session_start();
		echo json_encode(ModulosContablesMD::getModulosContables());
		break;
	case 'MediosPagoCajas':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getCajasAJXMD.php');
		session_start();
		echo json_encode(getCajasMD::cajas());
		break;
	case 'CuentasBancarias':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getCuentasBancariasAJXMD.php');
		session_start();
		echo json_encode(getCuentasMD::cuentas());
		break;
	case 'TarjetasCredito':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getTarjetasCreditoAJXMD.php');
		session_start();
		echo json_encode(getTarjetasCreditoMD::tarjetas());
		break;
	case 'franquicias':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getFranquiciaAJXMD.php');
		session_start();
		echo json_encode(franquiciasMD::getFranquicia());
		break;
	case 'egrsosingresoClasificacion':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getEgresoIngresoClasificacionAJXMD.php');
		session_start();
		echo json_encode(egresoingresoMD::clasificacion());
		break;
	case 'getentradas':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.registroCompraAJXMD.php');
		session_start();
		echo json_encode(getRegistroCompra::registroCompra());
		break;
	case 'egresosClasificacion':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.egresosClasificacionAJXMD.php');
		session_start();
		echo json_encode(egresoclasificacionMD::egresos());
		break;
	case 'mediopago':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getMedioPagoAJXMD.php');
		session_start();
		echo json_encode(getmediopagoMD::mediopago());
		break;
	case 'egresodefinicion':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getEgresoDefinicionAJXMD.php');
		session_start();
		echo json_encode(egresodefinicionMD::definicion());
		break;
	case 'tarjetascredito':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getTarjetaCreditoAJXMD.php');
		session_start();
		echo json_encode(tarjetacreditoMD::tarjetascredito());
		break;
	case 'bancomediopago':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getBancoMediopagoAJXMD.php');
		session_start();
		echo json_encode(bancomediopagoMD::bancomediopago());
		break;
	case 'impuestos':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getImpuestosAJXMD.php');
		session_start();
		echo json_encode(ImpuestosMD::impuestos());
		break;
	case 'deducciones':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getDeduccionesAJXMD.php');
		session_start();
		echo json_encode(getDeduccionesMD::deducciones());
		break;
	case 'retenciones':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getRetencionesAJXMD.php');
		session_start();
		echo json_encode(getRetencionesMD::retenciones());
		break;
	case 'catalogoretencion':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getCatalogoRetencionAJXMD.php');
		session_start();
		echo json_encode(catalogoRetencionMD::catalogoretenciones());
		break;
	case 'cargoempleados':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.cargoEmpleadosAJXMD.php');
		session_start();
		echo json_encode(CargoEmpleados::getCargo());
		break;
	case 'terceroperfil':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.terceroAJXMD.php');
		session_start();
		echo json_encode(TerceroPerfil::gettercero());
		break;
	case 'perfil':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.loadPerfilAJXMD.php');
		session_start();
		echo json_encode(Perfiles::getPerfil());
		break;
	case 'cargoperfil':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.perfilesPorEmpleadosAJXMD.php');
		session_start();
		echo json_encode(CargoPerfiles::getPerfilesPorempleado());
		break;
	case 'bancotarjeta':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getBancoTarjetaAJXMD.php');
		session_start();
		echo json_encode(bancoTarjetaMD::bancotarjeta());
		break;
	case 'selectreteiva':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getDefinicionReteivaAJXMD.php');
		session_start();
		echo json_encode(DefinicionReteiva::getDefinicionReteiva());
		break;
	case 'reteiva':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.reteIvaAJXMD.php');
		session_start();
		echo json_encode(ReteivaMD::getReteiva());
		break;
	case 'egresobancario':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getEgresobancarioAJXMD.php');
		session_start();
		echo json_encode(egresobancarioMD::egresobancario());
		break;
	case 'gettercero':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getlistadoTerceroAJXMD.php');
		session_start();
		echo json_encode(listarTerceroMD::getTercero());
	case 'facturasventas':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getFacturasVentaAJXMD.php');
		session_start();
		echo json_encode(facturasventaMD::facturasventa());
		break;
	case 'ingresoDefinicion':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.ingresoDefinicionAJXMD.php');
		session_start();
		echo json_encode(ingresoDefinicionMD::ingresodefinicion());
		break;
	case 'DefinicionSelect':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.ingresoDefinicionAJXMD.php');
		session_start();
		echo json_encode(ingresoDefinicionMD::definicionselect());
		break;
	case 'facturacliente':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getFacturasClientesAJXMD.php');
		session_start();
		echo json_encode(facturasclientesMD::facturasclientes());
		break;
	case 'aseguramientoEstado':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getAsegutamientoEstadoAJXMD.php');
		session_start();
		echo json_encode(aseguramientoestadoMD::aseguramientoestado());
		break;
	case 'aseguramientoPeriodo':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getAseguramientoPeriodoAJXMD.php');
		session_start();
		echo json_encode(aseguramientoperiodoMD::aseguramientoperiodo());
		break;
	case 'balanceprueba':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.balanceAJXMD.php');
		session_start();
		echo json_encode(balancePruebaMD::balance());
		break;
	case 'cuentacontabletercero':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.reporteterceroCuentacontableAJXMD.php');
		session_start();
		echo json_encode(getcatalogocuentaTercerosMD::get_catalogoTercero());
		break;
	case 'reportecomprobantes':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.reporteComprobantesAJXMD.php');
		session_start();
		echo json_encode(getreporteComprobanteMD::getComprobantesAsientos());
		break;
	case 'comprobanteseleccionado':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getComprobanteSelectedAJXMD.php');
		session_start();
		echo json_encode(ComprobanteSeleccionadaMD::getComprobanteSelected());
		break;
	case 'librodiario':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.libroDiarioAJXMD.php');
		session_start();
		echo json_encode(libroDiarioMD::libro());
		break;
	case 'reportefactura':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.reportefacturaAJXMD.php');
		session_start();
		echo json_encode(reportefacturasMD::getreportefacturas());
		break;
	case 'reportecaja':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.reporteCajaAJXMD.php');
		session_start();
		echo json_encode(reporteCajaMD::caja());
		break;
	case 'catalogocuentacont':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.catalogocuentaAJXMD.php');
		session_start();
		echo json_encode(getcatalogoCuentasMD::get_catalogo());
		break;
	case 'informacionCuenta':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.catalogocuentaAJXMD.php');
		session_start();
		echo json_encode(getcatalogoCuentasMD::informacionCuenta());
		break;

	case 'tipocomprobantehijos':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getTipoComprobanteHijosAJXMD.php');
		session_start();
		echo json_encode(TipoComprobanteHijosMD::getTipoComprobanteHijos());
		break;
	case 'documentos_comprobantes':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getModulosContAJXMD.php');
		session_start();
		echo json_encode(ModulosContablesMD::getDocumentos());
		break;
	case 'documentos_comprobantes_creados':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getModulosContAJXMD.php');
		session_start();
		echo json_encode(ModulosContablesMD::getDocumentosCreados());
		break;
	case 'empresa_principal':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getEmpresaPrincipalJXMD.php');
		session_start();
		echo json_encode(EmpresaPrincipalMD::EmpresaPrincipal());
		break;
	case 'listar_terceros':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getListarTercerosAJXMD.php');
		session_start();
		echo json_encode(ListarTercerosMD::getListarTerceros());
		break;
	case 'listar_terceros_nit':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getListarTercerosAJXMD.php');
		session_start();
		echo json_encode(ListarTercerosMD::getListarTercerosNit());
		break;
	case 'listar_terceros_IdNombre':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getListarTercerosAJXMD.php');
		session_start();
		echo json_encode(ListarTercerosMD::getListarTercerosIdNombre());
		break;
	case 'usuarios':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.UsuariosAJXMD.php');
		session_start();
		echo json_encode(getUsuariosMD::usuarios());
		break;
	case 'autorizaciones':
		include('core/bin/functions/conexion.php');
		include('vendor/validacion/gump/gump_dd.class.php');
		include('core/bin/ajax/generics/class.getAutorizacionesAJXMD.php');
		session_start();
		echo json_encode(geAutorizacionesMD::autorizaciones());
		break;
}
