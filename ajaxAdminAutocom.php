<?php
include('core/bin/functions/conexion.php');

if (!isset($_GET['mode'])) {
  echo 'mode?';
  exit();
}

switch ($_GET['mode']) {
  case 'retencionNoCatalogo':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/administrador/class.buscarRetencionFuenteAJXMD.php');
    session_start();
    echo json_encode(buscarRetencionFuenteAJXMD::byNoCatalogo(), 1);
    break;
  case 'cuentaByCodigo':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/administrador/class.buscarCuentaPucAJXMD.php');
    session_start();
    echo json_encode(buscarCuentaPucAJXMD::byCodigo(), 1);
    break;
  case 'catalogoEsRetencion':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/administrador/class.buscarCatalogoRetencionAJXMD.php');
    session_start();
    echo json_encode(buscarCatalogoRetencionAJXMD::byEsRetencion());
    break;
  case 'nitTercero':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/administrador/class.buscarTerceroAJXMD.php');
    session_start();
    echo json_encode(buscarTerceroAJXMD::byTercero(), 1);
    break;
  case 'nitTercero_Persona':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/administrador/class.buscarTerceroAJXMD.php');
    session_start();
    echo json_encode(buscarTerceroAJXMD::byTercero_Persona(), 1);
    break;
  case 'nitTercero_Empresa':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/administrador/class.buscarTerceroAJXMD.php');
    session_start();
    echo json_encode(buscarTerceroAJXMD::byTercero_Empresa(), 1);
    break;
  case 'catalogoCuenta':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/administrador/class.buscarCatcuentaAJXMD.php');
    session_start();
    echo json_encode(buscarCatalogocuentaAJXMD::byCatalogo(), 1);
    break;
  case 'clientefactura':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/administrador/class.buscarTerceroAJXMD.php');
    session_start();
    echo json_encode(buscarTerceroAJXMD::byTercero(), 1);
    break;
  case 'cuentascontables':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/generics/class.getCuentasContablesAJXMD.php');
    session_start();
    echo json_encode(getCuentasContablesMD::get_cuentas());
    break;
  case 'cuentascontablesreteiva':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/generics/class.CuentasContableRteivaAJXMD.php');
    session_start();
    echo json_encode(getcuentaReteviaMD::get_cuentareteiva());
    break;
  case 'tipocomprobanteCodigo':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/generics/class.getTipoComprobanteCodigoAJXMD.php');
    session_start();
    echo json_encode(getTipoComprobanteCodigoAJXMD::get_tipocomprobante());
    break;
  case 'tipocomprobanteNumero':
    include('vendor/validacion/gump/gump_dd.class.php');
    include('core/bin/ajax/generics/class.getTipoComprobanteNumeroAJXMD.php');
    session_start();
    echo json_encode(getTipoComprobanteNumeroAJXMD::get_tipocomprobanteNumero());
    break;
  default:
    break;
}
