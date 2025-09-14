<?php
if (!isset($_SESSION['usuario'])) {
  session_destroy();
  header('location: index.php?error=sesion');
  exit();
}

if (true) {
  require('vendor/fpdf/fpdf_dd.php');
  $data = generalesMD::getCapacitaciones($_GET['fecha_ini'], $_GET['fecha_fin']);
  // if (!empty($_GET['mes']))
    // $data = generalesMD::getFuncionario_2($_GET['mes']);
  // else if (!empty($_GET['todos']))
    
    // $data = generalesMD::getFuncionario_2(null, $_GET['filtro'], $_GET['todos']);

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
    $this->Image('core/models/administrador/pdf/images/Escudo_Horizontal.png', 10 ,10, 55 , 15,'PNG');
      $this->SetFont('arial', 'B', 10);
      $this->SetTextColor('0', '0', '0');
      $this->Ln(6);
      $this->SetFont('arial', 'B', 9);
      // $this->Cell(0, 10, ' ' . strtoupper($_SESSION['empresa']) . ' ', 0, 0, 'C');
      // $this->Ln(8);
    
    //  $this->Cell(0, 10, 'Generado por el Usuario: ' . strtoupper(str_replace('_ferr', '', $_SESSION['usuario'])), 0, 0);
      $fecha  = utf8_decode('Generado en la fecha: ' . (date('Y-m-d')). ' por el usuario: ' . strtoupper(str_replace('_ferr', '', $_SESSION['usuario'])));
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

      //$this->Ln(5);
      $this->SetFillColor(224, 235, 255);
      $this->Cell(260, 5, utf8_encode('REPORTE DE CAPACITACIONES ENTRE LAS FECHAS : '. $_GET['fecha_ini'] .' Y '. $_GET['fecha_fin']), 1, 0, 'C', true);
      $this->Ln();
      $this->SetFont('Arial', 'b', 8);
      $this->Cell(10, 5, utf8_decode('#'), 1, 0, 'C', true);
      $this->Cell(20, 5, utf8_decode('Identificación'), 1, 0, 'C', true);
      $this->Cell(40, 5, utf8_decode('Nombre'), 1, 0, 'C', true);
      $this->Cell(25, 5, utf8_decode('Fecha Inicio'), 1, 0, 'C', true);
      
      $this->Cell(30, 5, utf8_decode('Modalidad'), 1, 0, 'C', true);
      $this->Cell(40, 5, utf8_decode('Lugar'), 1, 0, 'C', true);
      $this->Cell(50, 5, utf8_decode('Entidad'), 1, 0, 'C', true);
      $this->Cell(20, 5, utf8_decode('Asistentes'), 1, 0, 'C', true);
      $this->Cell(25, 5, utf8_decode('Estado'), 1, 0, 'C', true);
       $this->SetFillColor(255, 255, 255);
      $this->Ln(5);
      foreach ($data as $key => $row) {
        $this->SetFont('Arial', '', 8);
        $this->Cell(10, 5, utf8_decode($key+1), 1, 0, 'C', true);
        $this->Cell(20, 5, utf8_decode($row['identificacion']), 1, 0, 'C', true);
        $this->Cell(40, 5, utf8_decode($row['nombre']), 1, 0, 'C', true);
        $this->Cell(25, 5, utf8_decode($row['fecha_ini']), 1, 0, 'C', true);
        $this->Cell(30, 5, utf8_decode($row['is_presencial']), 1, 0, 'C', true);

        $this->Cell(40, 5, utf8_decode($row['direccion']), 1, 0, 'C', true);
          $this->Cell(50, 5, utf8_decode($row['entidadCapacitadora']), 1, 0, 'C', true);
        $this->Cell(20, 5, utf8_decode($row['asistentes']), 1, 0, 'C', true);
         $this->Cell(25, 5, utf8_decode($row['estado']==null?"PENDIENTE":$row['estado']), 1, 0, 'C', true);
        $this->Ln(5);
      }

      $this->hTblEnd += 9 * 5 + 5;
    }
  }

  $header = array_map('utf8_decode', array('COMPROBANTE', 'FECHA ELABORACION', 'CÓDIGO', 'CÓDIGO CUENTA CONTABLE', 'NOMBRE CUENTA CONTABLE', 'DEBITO', 'CREDITO'));

  $pdf = new PDF('L','mm','Letter');
  $pdf->AliasNbPages();
  // $pdf->SetLeftMargin(5); //margenes
  $pdf->AddPage();
  $pdf->Ln(8);
  // $pdf->tableMovimientos($header, $data);
  $pdf->tableTotal($data);
  $pdf->Ln();
  // $pdf->tableTotales();
  $pdf->SetFont('Arial', '', 8);

  $name_file = 'funcionarios' . time() . '.pdf';
  $pdf->Output($name_file, 'I');

  echo "<script language=\"javascript\">window.open('<?php echo '$name_file'; ?>','popup','_self')</script>";
}


