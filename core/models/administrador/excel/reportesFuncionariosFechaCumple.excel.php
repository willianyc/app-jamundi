<?php
if (!isset($_SESSION['usuario'])) {
  session_destroy();
  header('location: index.php?error=sesion');
  exit();
}
if (true) {
  include_once 'vendor/PHPExcel-1.8/Classes/PHPExcel.php';

 
  //  $data = generalesMD::getFuncionarioNivelEducativo($_GET['genero'], $_GET['num']);
  $data = generalesMD::FuncionariofechaCumple($_GET['fecha_ini'], $_GET['fecha_fin']);
  

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
  $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(15);
  $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(30);
  $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(15);
  $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(15);
  $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(15);
  $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(15);
  $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(10);
  $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(10);
  $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(10);
  $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(10);
  $objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth(15);
  $objPHPExcel->getActiveSheet()->getColumnDimension('M')->setWidth(50);
  $objPHPExcel->getActiveSheet()->getColumnDimension('N')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('O')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('P')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setWidth(20);

  $objPHPExcel->getActiveSheet()->setCellValue('A1', "N");
  $objPHPExcel->getActiveSheet()->setCellValue('B1', "IDENTIFICACION");
  $objPHPExcel->getActiveSheet()->setCellValue('C1', "NOMBRE");
  $objPHPExcel->getActiveSheet()->setCellValue('D1', "NIVEL");
  $objPHPExcel->getActiveSheet()->setCellValue('E1', "CARGO");
  $objPHPExcel->getActiveSheet()->setCellValue('F1', "DEPENDENCIA");
  $objPHPExcel->getActiveSheet()->setCellValue('G1', "SEDE");
  $objPHPExcel->getActiveSheet()->setCellValue('H1', "DIA");
  $objPHPExcel->getActiveSheet()->setCellValue('I1', "MES");
  $objPHPExcel->getActiveSheet()->setCellValue('J1', "ANO");
  $objPHPExcel->getActiveSheet()->setCellValue('K1', "EDAD");
  $objPHPExcel->getActiveSheet()->setCellValue('L1', "TELEFONO");
  $objPHPExcel->getActiveSheet()->setCellValue('M1', "EMAIL");
/* $objPHPExcel->getActiveSheet()->setCellValue('N1', "DIA FAMILIAR");
  $objPHPExcel->getActiveSheet()->setCellValue('O1', "MES FAMILIAR");
  $objPHPExcel->getActiveSheet()->setCellValue('P1', "ANO FAMILIAR");
  $objPHPExcel->getActiveSheet()->setCellValue('Q1', "EDAD FAMILIAR");*/





  // $objPHPExcel->getActiveSheet()->getStyle('A1')->applyFromArray($styleArray);




  $debito = 0;
  $credito = 0;
  $cont = 2;
  $celda = 8;

  foreach ($data as $funcionario) {
    $cabeza_familia = 'SI';
    if ($funcionario['cabeza_familia'] == 0)
      $cabeza_familia = 'NO';
    $objPHPExcel->getActiveSheet()->setCellValue('A' . $fila, $fila-1);
    $objPHPExcel->getActiveSheet()->setCellValue('B' . $fila, $funcionario['documento']);
    $objPHPExcel->getActiveSheet()->setCellValue('C' . $fila, $funcionario['nombre'].' '.$funcionario['apellidos']);
    $objPHPExcel->getActiveSheet()->setCellValue('D' . $fila, $funcionario['nivel']);
    $objPHPExcel->getActiveSheet()->setCellValue('E' . $fila, $funcionario['cargo']);
    $objPHPExcel->getActiveSheet()->setCellValue('F' . $fila, $funcionario['dependencia']);
    $objPHPExcel->getActiveSheet()->setCellValue('G' . $fila, $funcionario['sede']);
    $objPHPExcel->getActiveSheet()->setCellValue('H' . $fila, $funcionario['dia_funcionario']);
    $objPHPExcel->getActiveSheet()->setCellValue('I' . $fila, $funcionario['mes_funcionario']);
    $objPHPExcel->getActiveSheet()->setCellValue('J' . $fila, $funcionario['ano_funcionario']);
    $objPHPExcel->getActiveSheet()->setCellValue('K' . $fila, $funcionario['edad']);
    $objPHPExcel->getActiveSheet()->setCellValue('L' . $fila, $funcionario['celular']);
    $objPHPExcel->getActiveSheet()->setCellValue('M' . $fila, $funcionario['email']);
  /*  $objPHPExcel->getActiveSheet()->setCellValue('N' . $fila, $funcionario['dia_familiar']);
    $objPHPExcel->getActiveSheet()->setCellValue('O' . $fila, $funcionario['mes_familiar']);
    $objPHPExcel->getActiveSheet()->setCellValue('P' . $fila, $funcionario['ano_familiar']);
    $objPHPExcel->getActiveSheet()->setCellValue('Q' . $fila, $funcionario['edad_familiar']);*/
    //$objPHPExcel->getActiveSheet()->setCellValue('J' . $fila, $funcionario['is_activo']==1?"Activo":"Retirado");
    $fila++;
  }

  $objPHPExcel->getActiveSheet()->setSharedStyle($estiloTituloColumnas, "A1:Z1");
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "B8:B" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "C8:C" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "D8:D" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion3, "E8:F" . $fila);

  $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
  header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
  header('Content-Disposition: attachment;filename="FuncionarioFechaCumple.xls"');
  header('Cache-Control: max-age=0');
  ob_end_clean();
  $writer->save('php://output');
}