<?php
if (!isset($_SESSION['usuario'])) {
  session_destroy();
  header('location: index.php?error=sesion');
  exit();
}

if (true) {
  require('vendor/fpdf/fpdf_dd.php');
  $data = generalesMD::getInspeccion();

  class PDF extends FPDF_dd
  {
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

      $this->setMaxHeight();
      $this->Image('core/models/administrador/pdf/images/Escudo_Horizontal.png', 10 ,10, 55 , 15,'PNG');
      $this->SetFont('arial', 'B', 10);
      $this->SetTextColor('0', '0', '0');
      $this->Ln(6);
      $this->SetFont('arial', 'B', 9);
      
      $fecha  = utf8_decode('Generado en la fecha: ' . (date('Y-m-d')). ' por el usuario: ' . strtoupper(str_replace('_ferr', '', $_SESSION['usuario'])));
      $this->Cell(0, 10, $fecha, 0, 1, 'R');
    }

    function body($data)
    {
      $this->SetY($this->GetY() - 0);
      $this->SetFillColor(224, 235, 255);
      $this->SetFillColor(224, 235, 255);
      $this->Cell(260, 5, utf8_encode('REPORTE DE INSPECCIONES '), 1, 0, 'C', true);
      $this->Ln();
      $this->SetFont('Arial', 'b', 8);
      $this->Cell(10, 5, utf8_decode('#'), 1, 0, 'C', true);
      $this->Cell(20, 5, utf8_decode('Identificación'), 1, 0, 'C', true);
      $this->Cell(35, 5, utf8_decode('Tipo Inspección'), 1, 0, 'C', true);
      $this->Cell(25, 5, utf8_decode('Fecha Inicio'), 1, 0, 'C', true);
      $this->Cell(40, 5, utf8_decode('Fecha Fin'), 1, 0, 'C', true);
      $this->Cell(30, 5, utf8_decode('Modalidad'), 1, 0, 'C', true);
      $this->Cell(50, 5, utf8_decode('Responsable'), 1, 0, 'C', true);
      $this->Cell(20, 5, utf8_decode('Dependecias'), 1, 0, 'C', true);
      $this->Cell(30, 5, utf8_decode('Estado'), 1, 0, 'C', true);
      $this->SetFillColor(255, 255, 255);
      $this->Ln(5);

      foreach ($data as $key => $row){
        $this->SetFont('Arial', '', 8);
        $this->Cell(10, 5, utf8_decode($key+1), 1, 0, 'C', true);
        $this->Cell(20, 5, utf8_decode($row['identificacion']), 1, 0, 'C', true);
        $this->Cell(35, 5, utf8_decode($row['tipo_inspeccion']), 1, 0, 'C', true);
        $this->Cell(25, 5, utf8_decode($row['fecha_ini']), 1, 0, 'C', true);
        $this->Cell(40, 5, utf8_decode($row['fecha_fin']), 1, 0, 'C', true);
        $this->Cell(30, 5, utf8_decode($row['modalidad']), 1, 0, 'C', true);
        $this->Cell(50, 5, utf8_decode($row['responsable']), 1, 0, 'C', true);
        $this->Cell(20, 5, utf8_decode($row['dependecias']), 1, 0, 'C', true);
        $this->Cell(30, 5, utf8_decode($row['estado']==null?"PENDIENTE":$row['estado']), 1, 0, 'C', true);
        $this->Ln(5);
      }
      
      $this->hTblEnd += 9 * 5 + 5;
    }

   }

   $header = array_map('utf8_decode', array('COMPROBANTE', 'FECHA ELABORACION', 'CÓDIGO', 'CÓDIGO CUENTA CONTABLE', 'NOMBRE CUENTA CONTABLE', 'DEBITO', 'CREDITO'));

   $pdf = new PDF('L','mm','Letter');
   $pdf->AliasNbPages();
   $pdf->AddPage();
   $pdf->Ln(8);
   $pdf->Ln();
   $pdf->body($data);
   $pdf->SetFont('Arial', '', 8);
 
   $name_file = 'funcionarios' . time() . '.pdf';
   $pdf->Output($name_file, 'I');
 
   echo "<script language=\"javascript\">window.open('<?php echo '$name_file'; ?>','popup','_self')</script>";

}