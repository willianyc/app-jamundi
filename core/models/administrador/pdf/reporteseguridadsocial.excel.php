<?php
if (!isset($_SESSION['usuario'])) {
  session_destroy();
  header('location: index.php?error=sesion');
  exit();
}

if (true) {
  require('vendor/fpdf/fpdf_dd.php');

  $data = generalesMD::getseguridadsocialReporte($_GET['filtro'], $_GET['todos'], $_GET['if_f']);

  class PDF extends FPDF_dd
  {

    // Guarda los datos del cliente
    private $data;
    private $total;
    private $hTblEnd;
    protected $col = 0; // Current column
    protected $y0;      // Ordinate of column start

    function GlobalPdf()
    {
      // Definimos el array de los totales
      $this->totales = array(
        'cant' => 0,
        'capital' => 0,
        'utilidad' => 0,
        'saldo' => 0
      );
    }

    function header()
    {
      global $data;
      $this->hTblEnd = 0;

      // Definimos el valor que tendra como maximo para continuar
      // o crear un nuevo cuadro
      $this->setMaxHeight();

      $this->SetFont('arial', 'B', 10);
      $this->SetTextColor('255', '0', '0');
      $this->Cell(0, 10, utf8_decode('REPORTE SEGURIDAD SOCIAL PDF '), 0, 0, 'C');
      $this->SetTextColor('0', '0', '0');
      $this->Ln(5);
      $this->SetFont('arial', 'B', 9);
      // $this->Cell(0, 10, ' ' . strtoupper($_SESSION['empresa']) . ' ', 0, 0, 'C');
      // $this->Ln(8);

      $this->Cell(0, 10, 'USUARIO: ' . strtoupper(str_replace('_ferr', '', $_SESSION['usuario'])), 0, 0);
      $fecha  = utf8_decode('Fecha de Generación: ' . (date('Y-m-d')));
      $this->Cell(0, 10, $fecha, 0, 1, 'R');
    }

    function tableTotal($data)
    {
      global $fecha_ini;
      global $fecha_fin;
      global $costo;
      global $precio;
      global $saldo;
      global $cant;
      global $credito;
      global $debito;
      $cont = 0;
      // $total_let = NumeroALetras::convertir($data->total);
      $this->SetY($this->GetY() - 0);

      $this->Ln(5);
      $this->SetFillColor(224, 235, 255);
      $this->Cell(198, 5, utf8_encode('Detalles Seguridad Social'), 1, 0, 'C', true);
      $this->Ln();
      $this->SetFont('Arial', 'b', 8);
      $this->Cell(45, 5, utf8_decode('IDENTIFICACION'), 1, 0, 'C', true);
      $this->Cell(45, 5, utf8_decode('NOMBRES'), 1, 0, 'C', true);
      $this->Cell(45, 5, utf8_decode('EPS'), 1, 0, 'C', true);
      $this->Cell(45, 5, utf8_decode('ADMINISTRADORA DE PENSIONES'), 1, 0, 'C', true);
      $this->Cell(45, 5, utf8_decode('FONDO DE CESANTIAS'), 1, 0, 'C', true);
      $this->Cell(45, 5, utf8_decode('ARL'), 1, 0, 'C', true);
      $this->Cell(45, 5, utf8_decode('CAJA COMPENSACIÓN'), 1, 0, 'C', true);
      $this->Cell(45, 5, utf8_decode('FECHA RETIRO DE SEGURIDAD SOCIAL'), 1, 0, 'C', true);
      $this->Cell(45, 5, utf8_decode('SALARIO'), 1, 0, 'C', true);
      $this->Ln(5);
      foreach ($data as $key => $seguridad_social) {
        $this->Cell(45, 5, utf8_decode($seguridad_social['documento']), 1, 0, 'C', true);
        $this->Cell(45, 5, utf8_decode($seguridad_social['nombre'] . ' ' . $seguridad_social['apellidos']), 1, 0, 'C', true);
        $this->Cell(45, 5, utf8_decode($seguridad_social['eps']), 1, 0, 'C', true);
        $this->Cell(45, 5, utf8_decode($seguridad_social['fondo_pension']), 1, 0, 'C', true);
        $this->Cell(45, 5, utf8_decode($seguridad_social['fondo_cesantias']), 1, 0, 'C', true);
        $this->Cell(45, 5, utf8_decode($seguridad_social['arl']), 1, 0, 'C', true);
        $this->Cell(45, 5, utf8_decode($seguridad_social['caja_compensacion']), 1, 0, 'C', true);
        $this->Cell(45, 5, utf8_decode($seguridad_social['fecha_retiro']), 1, 0, 'C', true);
        $this->Cell(45, 5, utf8_decode($seguridad_social['salario']), 1, 0, 'C', true);
        $this->Ln();
      }

      $this->hTblEnd += 9 * 5 + 5;
    }
  }

  $header = array_map('utf8_decode', array('COMPROBANTE', 'FECHA ELABORACION', 'CÓDIGO', 'CÓDIGO CUENTA CONTABLE', 'NOMBRE CUENTA CONTABLE', 'DEBITO', 'CREDITO'));

  $pdf = new PDF('P', 'mm', array(400, 400));
  $pdf->AliasNbPages();
  // $pdf->SetLeftMargin(5); //margenes
  $pdf->AddPage();
  $pdf->Ln(8);
  // $pdf->tableMovimientos($header, $data);
  $pdf->tableTotal($data);
  $pdf->Ln();
  // $pdf->tableTotales();
  $pdf->SetFont('Arial', '', 8);

  $name_file = 'seguridad_social' . time() . '.pdf';
  $pdf->Output($name_file, 'I');

  echo "<script language=\"javascript\">window.open('<?php echo '$name_file'; ?>','popup','_self')</script>";
}
