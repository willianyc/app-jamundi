<?php
if (!isset($_SESSION['usuario'])) {
  session_destroy();
  header('location: index.php?error=sesion');
  exit();
}

if (true) {
  require('vendor/fpdf/fpdf_dd.php');

  //$data = generalesMD::getFuncionarioNivelEducativo($_GET['genero'], $_GET['num']);
  $data = generalesMD::getFuncionarioGeneroFechas($_GET['genero'],$_GET['fecha_ini'], $_GET['fecha_fin']);
 
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
//$this->Ln();
      $this->SetFillColor(224, 235, 255);
     // $this->Cell(1170, 5, utf8_encode('Reporte de Funcionarios por Fechas de ingreso entre : '. $_GET['fecha_ini'] .' y '. $_GET['fecha_fin']), 1, 0, 'C', true);
       $this->Cell(280, 10, utf8_encode('REPORTE DE FUNCIONARIOS POR GENERO: '. ($_GET['genero']==="M"?"MASCULINO":"FEMENINO") .' ENTRE LAS FECHAS: '. $_GET['fecha_ini'] .' Y '. $_GET['fecha_fin']), 1, 0, 'C', true);
	  $this->Ln();
      $this->SetFont('Arial', 'b', 8);
	  $this->Cell(10, 5, utf8_decode('N'), 1, 0, 'C', true);
      $this->Cell(30, 5, utf8_decode('IDENTIFICACION'), 1, 0, 'C', true);
      $this->Cell(60, 5, utf8_decode('NOMBRES'), 1, 0, 'C', true);
      $this->Cell(15, 5, utf8_decode('GENERO'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('TIPO VINCULACIÓN'), 1, 0, 'C', true);
      $this->Cell(20, 5, utf8_decode('NIVEL'), 1, 0, 'C', true);
      $this->Cell(50, 5, utf8_decode('CARGO'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('CODIGO'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('GRADO'), 1, 0, 'C', true);
      $this->Cell(30, 5, utf8_decode('DEPENDENCIA'), 1, 0, 'C', true);
      $this->Cell(30, 5, utf8_decode('SEDE'), 1, 0, 'C', true);
      $this->Cell(20, 5, utf8_decode('INGRESO'), 1, 0, 'C', true);
	  $this->Cell(15, 5, utf8_decode('ESTADO'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('PROFESION'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('NIVEL EDUCATIVO'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('GENERO'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('DIRECCIÓN'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('MUNICIPIO RESIDENCIA'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('EMAIL'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('CELULAR'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('FECHA NACIMIENTO'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('ESTADO CIVIL'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('PADRE O MADRE'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('CABEZA DE FAMILIA'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('RH'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('EPS'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('FONDO DE PENSION'), 1, 0, 'C', true);
     // $this->Cell(45, 5, utf8_decode('CONDICION MEDICA'), 1, 0, 'C', true);
      $this->Ln(5);
      foreach ($data as $key => $funcionario) {
        $cabeza_familia = 'SI';
        if ($funcionario['cabeza_familia'] == 0)
          $cabeza_familia = 'NO';
	  $this->SetFillColor(255, 255, 255);
		$this->SetFont('Arial', '', 8);
		$this->Cell(10, 5, utf8_decode($key+1), 1, 0, 'C', true);
        $this->Cell(30, 5, utf8_decode($funcionario['documento']), 1, 0, 'C', true);
        $this->Cell(60, 5, utf8_decode($funcionario['nombre'].' '.$funcionario['apellidos']), 1, 0, 'C', true);
        $this->Cell(15, 5, utf8_decode($funcionario['genero']), 1, 0, 'C', true);
       // $this->Cell(45, 5, utf8_decode($funcionario['tipo_vinculacion']), 1, 0, 'C', true);
        $this->Cell(20, 5, utf8_decode($funcionario['nivel']), 1, 0, 'C', true);
        $this->Cell(50, 5, utf8_decode($funcionario['cargo']), 1, 0, 'C', true);
      //  $this->Cell(45, 5, utf8_decode($funcionario['codigo']), 1, 0, 'C', true);
      //  $this->Cell(45, 5, utf8_decode($funcionario['grado']), 1, 0, 'C', true);
        $this->Cell(30, 5, utf8_decode($funcionario['dependencia']), 1, 0, 'C', true);
        $this->Cell(30, 5, utf8_decode($funcionario['sede']), 1, 0, 'C', true);
        $this->Cell(20, 5, utf8_decode($funcionario['fecha_ingreso_nombra']), 1, 0, 'C', true);
		 $this->Cell(15, 5, utf8_decode($funcionario['is_activo']==1?"Activo":"Retirado"), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['profesion']), 1, 0, 'C', true);
      //  $this->Cell(45, 5, utf8_decode($funcionario['nivel_educativo']), 1, 0, 'C', true);
      //  $this->Cell(45, 5, utf8_decode($funcionario['genero']), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['direccion']), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['municipio']), 1, 0, 'C', true);
     //   $this->Cell(45, 5, utf8_decode($funcionario['email']), 1, 0, 'C', true);
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

  $pdf = new PDF('L', 'mm', array(300, 200));
  $pdf->AliasNbPages();
  // $pdf->SetLeftMargin(5); //margenes
  $pdf->AddPage();
  $pdf->Ln(8);
  // $pdf->tableMovimientos($header, $data);
  $pdf->tableTotal($data);
  $pdf->Ln();
  // $pdf->tableTotales();
  $pdf->SetFont('Arial', '', 8);
  $name_file = 'funcionariosGenero.pdf';
 
  $pdf->Output($name_file, 'I');

  echo "<script language=\"javascript\">window.open('<?php echo '$name_file'; ?>','popup','_self')</script>";
}
