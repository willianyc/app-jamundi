<?php
if (!isset($_SESSION['usuario'])) {
  session_destroy();
  header('location: index.php?error=sesion');
  exit();
}

if (true) {
  require('vendor/fpdf/fpdf_dd.php');

  //$data = generalesMD::getFuncionarioNivelEducativo($_GET['genero'], $_GET['num']);
  $data = generalesMD::FuncionariofechaCumple($_GET['fecha_ini'], $_GET['fecha_fin']);
 
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
	  $mesIni = $_GET['fecha_ini'];
	  $mesFin = $_GET['fecha_fin'];
		if($mesIni == '1')$mesIni = "ENERO";	if($mesFin == '1')$mesFin = "ENERO";
		if($mesIni == '2')$mesIni = "FEBRERO";	if($mesFin == '2')$mesFin = "FEBRERO";
		if($mesIni == '3')$mesIni = "MARZO";	if($mesFin == '3')$mesFin = "MARZO";
		if($mesIni == '4')$mesIni = "ABRIL";	if($mesFin == '4')$mesFin = "ABRIL";
		if($mesIni == '5')$mesIni = "MAYO";		if($mesFin == '5')$mesFin = "MAYO";
		if($mesIni == '6')$mesIni = "JUNIO";	if($mesFin == '6')$mesFin = "JUNIO";
		if($mesIni == '7')$mesIni = "JULIO";	if($mesFin == '7')$mesFin = "JULIO";
		if($mesIni == '8')$mesIni = "AGOSTO";	if($mesFin == '8')$mesFin = "AGOSTO";
		if($mesIni == '9')$mesIni = "SEPTIEMBRE";	if($mesFin == '9')$mesFin = "SEPTIEMBRE";
		if($mesIni == '10')$mesIni = "OCTUBRE";		if($mesFin == '10')$mesFin = "OCTUBRE";
		if($mesIni == '11')$mesIni = "NOVIEMBRE";	if($mesFin == '11')$mesFin = "NOVIEMBRE";
		if($mesIni == '12')$mesIni = "DICIEMBRE";	if($mesFin == '12')$mesFin = "DICIEMBRE";
		
		
	  
	  
	  
	  
	  
      // $total_let = NumeroALetras::convertir($data->total);
      $this->SetY($this->GetY() - 0);
//$this->Ln();
      $this->SetFillColor(224, 235, 255);
     // $this->Cell(1170, 5, utf8_encode('Reporte de Funcionarios por Fechas de ingreso entre : '. $_GET['fecha_ini'] .' y '. $_GET['fecha_fin']), 1, 0, 'C', true);
       $this->Cell(335, 10, utf8_encode('REPORTE DE CUMPLEANOS DE FUNCIONARIOS ENTRE : '. $mesIni .' Y '. $mesFin), 1, 0, 'C', true);
	  $this->Ln();
      $this->SetFont('Arial', 'b', 8);
	  $this->Cell(10, 5, utf8_decode('N'), 1, 0, 'C', true);
      $this->Cell(25, 5, utf8_decode('IDENTIFICACION'), 1, 0, 'C', true);
      $this->Cell(60, 5, utf8_decode('NOMBRES'), 1, 0, 'C', true);
      //$this->Cell(15, 5, utf8_decode('GENERO'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('TIPO VINCULACIÓN'), 1, 0, 'C', true);
      $this->Cell(20, 5, utf8_decode('NIVEL'), 1, 0, 'C', true);
      $this->Cell(40, 5, utf8_decode('CARGO'), 1, 0, 'C', true);
      $this->Cell(35, 5, utf8_decode('DEPENDENCIA'), 1, 0, 'C', true);
      $this->Cell(35, 5, utf8_decode('SEDE'), 1, 0, 'C', true);
      $this->Cell(10, 5, utf8_decode('DIA'), 1, 0, 'C', true);
      $this->Cell(10, 5, utf8_decode('MES'), 1, 0, 'C', true);
      $this->Cell(10, 5, utf8_decode('AÑO'), 1, 0, 'C', true);
      $this->Cell(10, 5, utf8_decode('EDAD'), 1, 0, 'C', true);
      $this->Cell(20, 5, utf8_decode('TELEFONO'), 1, 0, 'C', true);
      $this->Cell(50, 5, utf8_decode('EMAIL'), 1, 0, 'C', true);
     // $this->Cell(10, 5, utf8_decode('DIA'), 1, 0, 'C', true);
     //$this->Cell(10, 5, utf8_decode('MES'), 1, 0, 'C', true);
     // $this->Cell(10, 5, utf8_decode('AÑO'), 1, 0, 'C', true);
      //$this->Cell(20, 5, utf8_decode('INGRESO'), 1, 0, 'C', true);
	 //   $this->Cell(10, 5, utf8_decode('EDAD'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('PROFESION'), 1, 0, 'C', true);
     
      $this->Ln(5);
      foreach ($data as $key => $funcionario) {
        $cabeza_familia = 'SI';
        if ($funcionario['cabeza_familia'] == 0)
          $cabeza_familia = 'NO';
	  $this->SetFillColor(255, 255, 255);
		$this->SetFont('Arial', '', 8);
		$this->Cell(10, 5, utf8_decode($key+1), 1, 0, 'C', true);
        $this->Cell(25, 5, utf8_decode($funcionario['documento']), 1, 0, 'C', true);
        $this->Cell(60, 5, utf8_decode($funcionario['nombre'].' '.$funcionario['apellidos']), 1, 0, 'C', true);
        //$this->Cell(15, 5, utf8_decode($funcionario['genero']), 1, 0, 'C', true);
       // $this->Cell(45, 5, utf8_decode($funcionario['tipo_vinculacion']), 1, 0, 'C', true);
        $this->Cell(20, 5, utf8_decode($funcionario['nivel']), 1, 0, 'C', true);
        $this->Cell(40, 5, utf8_decode($funcionario['cargo']), 1, 0, 'C', true);
        $this->Cell(35, 5, utf8_decode($funcionario['dependencia']), 1, 0, 'C', true);
        $this->Cell(35, 5, utf8_decode($funcionario['sede']), 1, 0, 'C', true);
        $this->Cell(10, 5, utf8_decode($funcionario['dia_funcionario']), 1, 0, 'C', true);
        $this->Cell(10, 5, utf8_decode($funcionario['mes_funcionario']), 1, 0, 'C', true);
        $this->Cell(10, 5, utf8_decode($funcionario['ano_funcionario']), 1, 0, 'C', true);
        //$this->Cell(20, 5, utf8_decode($funcionario['fecha_ingreso_nombra']), 1, 0, 'C', true);
		    $this->Cell(10, 5, utf8_decode($funcionario['edad']), 1, 0, 'C', true);
        $this->Cell(20, 5, utf8_decode($funcionario['celular']), 1, 0, 'C', true);
        $this->Cell(50, 5, utf8_decode($funcionario['email']), 1, 0, 'C', true);
      //  $this->Cell(10, 5, utf8_decode($funcionario['dia_familiar']), 1, 0, 'C', true);
      //  $this->Cell(10, 5, utf8_decode($funcionario['mes_familiar']), 1, 0, 'C', true);
      //  $this->Cell(10, 5, utf8_decode($funcionario['ano_familiar']), 1, 0, 'C', true);
      //  $this->Cell(10, 5, utf8_decode($funcionario['edad_familiar']), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['celular']), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['fecha_nacimiento']), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['estado_civil']), 1, 0, 'C', true);
      //  $this->Cell(45, 5, utf8_decode($funcionario['madre_padre']), 1, 0, 'C', true);
      //  $this->Cell(45, 5, utf8_decode($cabeza_familia), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['rh']), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['eps']), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['fondo_pension']), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['condicion_medica']), 1, 0, 'C', true);
        $this->Ln(5);
      }

      $this->hTblEnd += 9 * 5 + 5;
    }
  }


  $header = array_map('utf8_decode', array('COMPROBANTE', 'FECHA ELABORACION', 'CÓDIGO', 'CÓDIGO CUENTA CONTABLE', 'NOMBRE CUENTA CONTABLE', 'DEBITO', 'CREDITO'));

  $pdf = new PDF('L', 'mm', 'legal');
  $pdf->AliasNbPages();
  // $pdf->SetLeftMargin(5); //margenes
  $pdf->AddPage();
  $pdf->Ln(8);
  // $pdf->tableMovimientos($header, $data);
  $pdf->tableTotal($data);
  $pdf->Ln();
  // $pdf->tableTotales();
  $pdf->SetFont('Arial', '', 8);
  $name_file = 'FuncionariofechaCumple.pdf';
 
  $pdf->Output($name_file, 'I');

  echo "<script language=\"javascript\">window.open('<?php echo '$name_file'; ?>','popup','_self')</script>";
}
