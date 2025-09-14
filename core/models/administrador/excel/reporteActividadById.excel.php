<?php
if (!isset($_SESSION['usuario'])) {
  session_destroy();
  header('location: index.php?error=sesion');
  exit();
}
if (true) {
  include_once 'vendor/PHPExcel-1.8/Classes/PHPExcel.php';

  $data = generalesMD::getActividadAsignacionAsignacionExcel($_GET['id_actividad']);

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

  $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(30);
  $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(30);
  $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(30);
  $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(30);
  $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(20);
  $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(20);


  $objPHPExcel->getActiveSheet()->setCellValue('A1', "IDENTIFICACION");
  $objPHPExcel->getActiveSheet()->setCellValue('B1', "NOMBRE");
  $objPHPExcel->getActiveSheet()->setCellValue('C1', "FECHA INICIO");
  $objPHPExcel->getActiveSheet()->setCellValue('D1', "FECHA FINALIZACIÓN");
  $objPHPExcel->getActiveSheet()->setCellValue('E1', "MODALIDAD");
  $objPHPExcel->getActiveSheet()->setCellValue('F1', "LUGAR");
  $objPHPExcel->getActiveSheet()->setCellValue('G1', "ESTADO");
  $objPHPExcel->getActiveSheet()->setCellValue('H1', "CANTIDAD");
  // $objPHPExcel->getActiveSheet()->getStyle('A1')->applyFromArray($styleArray);

  $debito = 0;
  $credito = 0;
  $cont = 2;
  $celda = 8;

  // foreach ($data as $funcionario) {
    $objPHPExcel->getActiveSheet()->setCellValue('A' . $fila, $data['identificacion']);
    $objPHPExcel->getActiveSheet()->setCellValue('B' . $fila, $data['nombre']);
    $objPHPExcel->getActiveSheet()->setCellValue('C' . $fila, $data['fecha_ini']);
    $objPHPExcel->getActiveSheet()->setCellValue('D' . $fila, $data['fecha_fin']);
    $objPHPExcel->getActiveSheet()->setCellValue('E' . $fila, $data['is_presencial']);
    $objPHPExcel->getActiveSheet()->setCellValue('F' . $fila, $data['direccion']);
    $objPHPExcel->getActiveSheet()->setCellValue('G' . $fila, $data['estado']);
    $objPHPExcel->getActiveSheet()->setCellValue('H' . $fila, count($data['funcionarios']));

    $fila_funcionarios_start = 'A' . ($fila + 2) . ':H' . ($fila + 2);
    $objPHPExcel->getActiveSheet()->mergeCells($fila_funcionarios_start);
    $objPHPExcel->getActiveSheet()->setCellValue('A' . ($fila + 2), "ASIGNACION FUNCIONARIOS");
    $objPHPExcel->getActiveSheet()->setSharedStyle($estiloTituloColumnas, $fila_funcionarios_start);

    $objPHPExcel->getActiveSheet()->setCellValue('A'.($fila + 3), "IDENTIFICACION");
    $objPHPExcel->getActiveSheet()->setCellValue('B'.($fila + 3), "NOMBRE");
    $objPHPExcel->getActiveSheet()->setCellValue('C'.($fila + 3), "APELLIDOS");
    $objPHPExcel->getActiveSheet()->setCellValue('D'.($fila + 3), "T. CONTRATACION");
    $objPHPExcel->getActiveSheet()->setCellValue('E'.($fila + 3), "NIVEL");
    $objPHPExcel->getActiveSheet()->setCellValue('F'.($fila + 3), "DIRECCIÓN");
    $objPHPExcel->getActiveSheet()->setCellValue('G'.($fila + 3), "APROBO");
    $objPHPExcel->getActiveSheet()->setCellValue('H'.($fila + 3), "NOTA");
    $objPHPExcel->getActiveSheet()->setSharedStyle($estiloTituloColumnas, 'A' . ($fila + 3) . ':H' . ($fila + 3));

    $filaFunc = $fila + 4;
    foreach ($data['funcionarios'] as $rowData) {
      $objPHPExcel->getActiveSheet()->setCellValue('A' . $filaFunc, $rowData['documento']);
      $objPHPExcel->getActiveSheet()->setCellValue('B' . $filaFunc, $rowData['nombre']);
      $objPHPExcel->getActiveSheet()->setCellValue('C' . $filaFunc, $rowData['apellidos']);
      $objPHPExcel->getActiveSheet()->setCellValue('D' . $filaFunc, $rowData['tipo_vinculacion']);
      $objPHPExcel->getActiveSheet()->setCellValue('E' . $filaFunc, $rowData['nivel']);
      $objPHPExcel->getActiveSheet()->setCellValue('F' . $filaFunc, $rowData['direccion']);
      $objPHPExcel->getActiveSheet()->setCellValue('G' . $filaFunc, $rowData['aprobo'] == 1 ? 'Si' : 'No');
      $objPHPExcel->getActiveSheet()->setCellValue('H' . $filaFunc, $rowData['nota']);

      $filaFunc++;
    }

    
    $fila++;
  // }

    $objPHPExcel->getActiveSheet()->setCellValue('A1', "IDENTIFICACION");
    $objPHPExcel->getActiveSheet()->setCellValue('B1', "NOMBRE");
    $objPHPExcel->getActiveSheet()->setCellValue('C1', "FECHA INICIO");
    $objPHPExcel->getActiveSheet()->setCellValue('D1', "FECHA FINALIZACIÓN");
    $objPHPExcel->getActiveSheet()->setCellValue('E1', "MODALIDAD");
    $objPHPExcel->getActiveSheet()->setCellValue('F1', "LUGAR");
    $objPHPExcel->getActiveSheet()->setCellValue('G1', "ESTADO");
    $objPHPExcel->getActiveSheet()->setCellValue('H1', "CANTIDAD");

  $objPHPExcel->getActiveSheet()->setSharedStyle($estiloTituloColumnas, "A1:H1");
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "B8:B" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "C8:C" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion2, "D8:D" . $fila);
  // $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion3, "E8:F" . $fila);

  $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
  header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
  header('Content-Disposition: attachment;filename="actividad.xls"');
  header('Cache-Control: max-age=0');
  ob_end_clean();
  $writer->save('php://output');
}
