<?php
if (!isset($_SESSION['usuario'])) {
  session_destroy();
  header('location: index.php?error=sesion');
  exit();
}
if (true) {
  include_once 'vendor/PHPExcel-1.8/Classes/PHPExcel.php';

  $data = generalesMD::getMovilidadReporte($_GET['filtro'], $_GET['todos'], $_GET['id_f']);

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

  $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('M')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('N')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('O')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('P')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setWidth(35);
  $objPHPExcel->getActiveSheet()->getColumnDimension('R')->setWidth(35);


  $objPHPExcel->getActiveSheet()->setCellValue('A1', "IDENTIFICACIÓN");
  $objPHPExcel->getActiveSheet()->setCellValue('B1', "NOMBRES");
  $objPHPExcel->getActiveSheet()->setCellValue('C1', "FECHA INGRESO");
  $objPHPExcel->getActiveSheet()->setCellValue('D1', "TIPO DE VINCULACIÓN");
  $objPHPExcel->getActiveSheet()->setCellValue('E1', "NIVEL");
  $objPHPExcel->getActiveSheet()->setCellValue('F1', "CARGO");
  $objPHPExcel->getActiveSheet()->setCellValue('G1', "CODIGO");
  $objPHPExcel->getActiveSheet()->setCellValue('H1', "GRADO");
  $objPHPExcel->getActiveSheet()->setCellValue('I1', "DEPENDENCIA");
  $objPHPExcel->getActiveSheet()->setCellValue('J1', "SEDE");
  $objPHPExcel->getActiveSheet()->setCellValue('K1', "N° ACTO DE POSESIÓN");
  $objPHPExcel->getActiveSheet()->setCellValue('L1', "FECHA DE POSESIÓN");
  $objPHPExcel->getActiveSheet()->setCellValue('M1', "N° DE RESOLUCIÓN");
  $objPHPExcel->getActiveSheet()->setCellValue('N1', "FECHA EXPEDICION DE RESOLUCIÓN");
  $objPHPExcel->getActiveSheet()->setCellValue('O1', "FECHA FINALIZACIÓN");
  $objPHPExcel->getActiveSheet()->setCellValue('P1', "MODALIDAD TRABAJO");
  $objPHPExcel->getActiveSheet()->setCellValue('Q1', "SALARIO");
  $objPHPExcel->getActiveSheet()->setCellValue('R1', "FUNCIONES");
  $objPHPExcel->getActiveSheet()->setCellValue('R1', "FECHA CREACIÓN");
  // $objPHPExcel->getActiveSheet()->setCellValue('K1', "FECHA RETIRO");
  // $objPHPExcel->getActiveSheet()->setCellValue('L1', "FECHA RECEPCIÓN");
  // $objPHPExcel->getActiveSheet()->getStyle('A1')->applyFromArray($styleArray);




  $debito = 0;
  $credito = 0;
  $cont = 2;
  $celda = 8;

  foreach ($data as $movilidad) {
    $objPHPExcel->getActiveSheet()->setCellValue('A' . $fila, $movilidad['documento']);
    $objPHPExcel->getActiveSheet()->setCellValue('B' . $fila, $movilidad['nombre'] . ' ' . $movilidad['apellidos']);
    $objPHPExcel->getActiveSheet()->setCellValue('C' . $fila, $movilidad['fecha_ini']);
    $objPHPExcel->getActiveSheet()->setCellValue('D' . $fila, $movilidad['tipo_vinculacion']);
    $objPHPExcel->getActiveSheet()->setCellValue('E' . $fila, $movilidad['nivel']);
    $objPHPExcel->getActiveSheet()->setCellValue('F' . $fila, $movilidad['cargo']);
    $objPHPExcel->getActiveSheet()->setCellValue('G' . $fila, $movilidad['codigo']);
    $objPHPExcel->getActiveSheet()->setCellValue('H' . $fila, $movilidad['grado']);
    $objPHPExcel->getActiveSheet()->setCellValue('I' . $fila, $movilidad['dependencia']);
    $objPHPExcel->getActiveSheet()->setCellValue('J' . $fila, $movilidad['sede']);
    $objPHPExcel->getActiveSheet()->setCellValue('K' . $fila, $movilidad['numero_posesion']);
    $objPHPExcel->getActiveSheet()->setCellValue('L' . $fila, $movilidad['fecha_posesion']);
    $objPHPExcel->getActiveSheet()->setCellValue('M' . $fila, $movilidad['numero_resolucion']);
    $objPHPExcel->getActiveSheet()->setCellValue('N' . $fila, $movilidad['fecha_resolucion']);
    $objPHPExcel->getActiveSheet()->setCellValue('O' . $fila, $movilidad['fecha_fin']);
    $objPHPExcel->getActiveSheet()->setCellValue('P' . $fila, $movilidad['modo_trabajo']);
    $objPHPExcel->getActiveSheet()->setCellValue('Q' . $fila, $movilidad['salario']);
    $objPHPExcel->getActiveSheet()->setCellValue('R' . $fila, $movilidad['funciones']);
    $objPHPExcel->getActiveSheet()->setCellValue('R' . $fila, $movilidad['fecha_creacion']);
    $fila++;
  }

  $objPHPExcel->getActiveSheet()->setSharedStyle($estiloTituloColumnas, "A1:R1");
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "B8:B" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "C8:C" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "D8:D" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion3, "E8:F" . $fila);

  $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
  header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
  if (!empty($_GET['mes']))
    header('Content-Disposition: attachment;filename="Cumpleanos_mes_' . $mes . '.xls"');
  else if (!empty($_GET['todos']))
    header('Content-Disposition: attachment;filename="seguridad_social.xls"');
  header('Cache-Control: max-age=0');
  ob_end_clean();
  $writer->save('php://output');
}
