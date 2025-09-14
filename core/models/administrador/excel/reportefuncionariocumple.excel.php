<?php
if (!isset($_SESSION['usuario'])) {
  session_destroy();
  header('location: index.php?error=sesion');
  exit();
}
if (true) {
  include_once 'vendor/PHPExcel-1.8/Classes/PHPExcel.php';

  $data = generalesMD::getFuncionariosPdf();
  // if (!empty($_GET['mes']))
  // else if (!empty($_GET['todos']))
  //   $data = generalesMD::getFuncionario_2(null, $_GET['filtro'], $_GET['todos']);

  //Establecemos en que fila inciara a imprimir los datos	

  $fila = 2;
  $objPHPExcel  = new PHPExcel();
  //Propiedades de Documento
  $objPHPExcel->getProperties()->setCreator("Jamundi")->setDescription("Reporte");
  //Establecemos la pestaña activa y nombre a la pestaña
  $objPHPExcel->setActiveSheetIndex(0);
  $objPHPExcel->getActiveSheet();
  $objDrawing = new PHPExcel_Worksheet_MemoryDrawing();
  $objDrawing->setRenderingFunction(PHPExcel_Worksheet_MemoryDrawing::RENDERING_PNG);
  $objDrawing->setMimeType(PHPExcel_Worksheet_MemoryDrawing::MIMETYPE_DEFAULT);

  $objDrawing->setWorksheet($objPHPExcel->getActiveSheet());

  $estiloTitle = array(
    'font' => array(
      'name'  => 'Arial',
      'bold' => true,
      'color' => array('rgb' => 'FFFFFF'),
      'size' => 14,
    ),
    'fill' => array(
      'type' => PHPExcel_Style_Fill::FILL_SOLID,
      'color' => array('rgb' => '2559a6')
    ),
    'alignment' =>  array(
      'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
      'vertical'  => PHPExcel_Style_Alignment::VERTICAL_CENTER
    )
  );
  $estiloTituloColumnas = new PHPExcel_Style();
  $estiloTituloColumnas->applyFromArray(array(
    'font' => array(
      'name'  => 'Arial',
      'bold'  => true,
      'size' => 10,
      'color' => array(
        'rgb' => '333333'
      )
    ),
    'fill' => array(
      'type' => PHPExcel_Style_Fill::FILL_SOLID,
      'color' => array('rgb' => 'A9D08E')
    ),
    'borders' => array(
      'allborders' => array(
        'style' => PHPExcel_Style_Border::BORDER_THIN
      )
    ),
    'alignment' =>  array(
      'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
      'vertical'  => PHPExcel_Style_Alignment::VERTICAL_CENTER
    )
  ));

  $estiloTituloColumnas2 = array(
    'font' => array(
      'name'  => 'Arial',
      'bold'  => false,
      'size' => 10,

    ),
    'fill' => array(
      'type' => PHPExcel_Style_Fill::FILL_SOLID,
      'color' => array('rgb' => 'FFFFFF')
    ),
    'borders' => array(
      'allborders' => array(
        'style' => PHPExcel_Style_Border::BORDER_THIN
      )
    ),
    'alignment' =>  array(
      'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
      'vertical'  => PHPExcel_Style_Alignment::VERTICAL_CENTER
    )
  );

  $estiloInformacion = new PHPExcel_Style();
  $estiloInformacion->applyFromArray(array(
    'font' => array(
      'name'  => 'Arial',
      'bold' => false,
      'color' => array()
    ),
    'fill' => array(
      'type'  => PHPExcel_Style_Fill::FILL_SOLID
    ),
    'borders' => array(
      'allborders' => array(
        'style' => PHPExcel_Style_Border::BORDER_THIN
      )
    ),
    'alignment' =>  array(
      'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
      'vertical'  => PHPExcel_Style_Alignment::VERTICAL_CENTER
    )
  ));
  $estiloInformacion2 = new PHPExcel_Style();
  $estiloInformacion2->applyFromArray(array(
    'font' => array(
      'name'  => 'Arial',
      'color' => array(
        'rgb' => '000000'
      )
    ),
    'fill' => array(
      'type'  => PHPExcel_Style_Fill::FILL_SOLID
    ),
    'borders' => array(
      'allborders' => array(
        'style' => PHPExcel_Style_Border::BORDER_THIN
      )
    ),
    'alignment' =>  array(
      'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
      'vertical'  => PHPExcel_Style_Alignment::VERTICAL_CENTER
    )
  ));
  $estiloInformacion3 = new PHPExcel_Style();
  $estiloInformacion3->applyFromArray(array(
    'font' => array(
      'name'  => 'Arial',
      'color' => array(
        'rgb' => '000000'
      )
    ),
    'fill' => array(
      'type'  => PHPExcel_Style_Fill::FILL_SOLID
    ),
    'borders' => array(
      'allborders' => array(
        'style' => PHPExcel_Style_Border::BORDER_THIN
      )
    ),
    'alignment' =>  array(
      'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_RIGHT,
      'vertical'  => PHPExcel_Style_Alignment::VERTICAL_CENTER
    )
  ));

  $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(10);
  $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(70);
  $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(30);
  $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth(40);
  $objPHPExcel->getActiveSheet()->getColumnDimension('M')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('N')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('O')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('P')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('R')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('S')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('T')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('U')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('V')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('W')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('X')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('Y')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('Z')->setWidth(20);




  $objPHPExcel->getActiveSheet()->setCellValue('A1', "N");
  $objPHPExcel->getActiveSheet()->setCellValue('B1', "IDENTIFICACION");
  $objPHPExcel->getActiveSheet()->setCellValue('C1', "NOMBRE");
  $objPHPExcel->getActiveSheet()->setCellValue('D1', "TIPO VINCULACIÓN");
  $objPHPExcel->getActiveSheet()->setCellValue('E1', "FECHA DE INGRESO");
  $objPHPExcel->getActiveSheet()->setCellValue('F1', "DEPENDENCIA");
  $objPHPExcel->getActiveSheet()->setCellValue('G1', "NIVEL");
  $objPHPExcel->getActiveSheet()->setCellValue('H1', "CARGO");
  $objPHPExcel->getActiveSheet()->setCellValue('I1', "CODIGO");
  $objPHPExcel->getActiveSheet()->setCellValue('J1', "GRADO");
  $objPHPExcel->getActiveSheet()->setCellValue('K1', "SEDE");
  $objPHPExcel->getActiveSheet()->setCellValue('L1', "PROFESION");
  $objPHPExcel->getActiveSheet()->setCellValue('M1', "NIVEL EDUCATIVO");
  $objPHPExcel->getActiveSheet()->setCellValue('N1', "GENERO");
  $objPHPExcel->getActiveSheet()->setCellValue('O1', "DIRECCIÓN");
  $objPHPExcel->getActiveSheet()->setCellValue('P1', 'MUNICIPIO RESIDENCIA');
  $objPHPExcel->getActiveSheet()->setCellValue('Q1', 'EMAIL');
  $objPHPExcel->getActiveSheet()->setCellValue('R1', 'CELULAR');
  $objPHPExcel->getActiveSheet()->setCellValue('S1', 'FECHA NACIMIENTO');
  $objPHPExcel->getActiveSheet()->setCellValue('T1', 'ESTADO CIVIL');
  $objPHPExcel->getActiveSheet()->setCellValue('U1', 'PADRE O MADRE');
  $objPHPExcel->getActiveSheet()->setCellValue('V1', 'CABEZA DE FAMILIA');
  $objPHPExcel->getActiveSheet()->setCellValue('W1', 'RH');
  $objPHPExcel->getActiveSheet()->setCellValue('X1', 'EPS');
  $objPHPExcel->getActiveSheet()->setCellValue('Y1', 'FONDO DE PENSION');
  $objPHPExcel->getActiveSheet()->setCellValue('Z1', 'CONDICION MEDICA');

  $debito = 0;
  $credito = 0;
  $cont = 2;
  $celda = 8;

  foreach ($data as $funcionario) {
    $objPHPExcel->getActiveSheet()->setCellValue('A' . $fila, $fila-1);
    $objPHPExcel->getActiveSheet()->setCellValue('B' . $fila, $funcionario['documento']);
    $objPHPExcel->getActiveSheet()->setCellValue('C' . $fila, $funcionario['nombre'].' '.$funcionario['apellidos']);
    $objPHPExcel->getActiveSheet()->setCellValue('D' . $fila, $funcionario['tipo_vinculacion']);
    $objPHPExcel->getActiveSheet()->setCellValue('E' . $fila, $funcionario['fecha_ingreso_nombra']);
    $objPHPExcel->getActiveSheet()->setCellValue('F' . $fila, $funcionario['dependencia']);
    $objPHPExcel->getActiveSheet()->setCellValue('G' . $fila, $funcionario['nivel']);
    $objPHPExcel->getActiveSheet()->setCellValue('H' . $fila, $funcionario['cargo']);
    $objPHPExcel->getActiveSheet()->setCellValue('I' . $fila, $funcionario['codigo']);
    $objPHPExcel->getActiveSheet()->setCellValue('J' . $fila, $funcionario['grado']);
    $objPHPExcel->getActiveSheet()->setCellValue('K' . $fila, $funcionario['sede']);
    $objPHPExcel->getActiveSheet()->setCellValue('L' . $fila, $funcionario['profesion']);
    $objPHPExcel->getActiveSheet()->setCellValue('M' . $fila, $funcionario['nivel_educativo']);
    $objPHPExcel->getActiveSheet()->setCellValue('N' . $fila, $funcionario['genero']);
    $objPHPExcel->getActiveSheet()->setCellValue('O' . $fila, $funcionario['direccion']);
    $objPHPExcel->getActiveSheet()->setCellValue('P' . $fila, $funcionario['municipio']);
    $objPHPExcel->getActiveSheet()->setCellValue('Q' . $fila, $funcionario['email']);
    $objPHPExcel->getActiveSheet()->setCellValue('R' . $fila, $funcionario['celular']);
    $objPHPExcel->getActiveSheet()->setCellValue('S' . $fila, $funcionario['fecha_nacimiento']);
    $objPHPExcel->getActiveSheet()->setCellValue('T' . $fila, $funcionario['estado_civil']);
    $objPHPExcel->getActiveSheet()->setCellValue('U' . $fila, $funcionario['madre_padre']);
    $objPHPExcel->getActiveSheet()->setCellValue('V' . $fila, $funcionario['cabeza_familia']);
    $objPHPExcel->getActiveSheet()->setCellValue('W' . $fila, $funcionario['rh']);
    $objPHPExcel->getActiveSheet()->setCellValue('X' . $fila, $funcionario['eps']);
    $objPHPExcel->getActiveSheet()->setCellValue('Y' . $fila, $funcionario['fondo_pension']);
    $objPHPExcel->getActiveSheet()->setCellValue('Z' . $fila, $funcionario['condicion_medica']);



    $fila++;
  }

  $objPHPExcel->getActiveSheet()->setSharedStyle($estiloTituloColumnas, "A1:Z1");
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "B8:B" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "C8:C" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "D8:D" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion3, "E8:F" . $fila);

  $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
  header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
  if (!empty($_GET['mes']))
    header('Content-Disposition: attachment;filename="Cumpleanos_mes_' . $mes . '.xls"');
  else if (!empty($_GET['todos']))
    header('Content-Disposition: attachment;filename="ListaFuncionarios.xls"');
  header('Cache-Control: max-age=0');
  ob_end_clean();
  $writer->save('php://output');
}
