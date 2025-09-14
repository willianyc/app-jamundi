<?php


abstract class evaluacionDesempenoMD
{

  public static function downloadFileImport()
  {
    $ruta = ('views/archivos/evaluacion/' . $_GET['name']);
    $question_file = $ruta;
    if (file_exists($question_file)) {
      header('Cache-Control: public');
      header('Content-Description: File Transfer');
      header("Content-Disposition: attachment; filename={$question_file}");
      header('Content-Type: application/vnd.ms-excel');
      header('Content-Transfer-Encoding: binary');
      readfile($question_file);
      exit;
    }
  }
  public static function upload_file()
  {
    self::validPermissions(9);
    if (empty($_FILES[0])) return array('error' => ('Debe adjuntar el archivo'));
    $ruta = 'views/archivos/evaluacion/';
    $filename = $_FILES[0]['name'];
    $path_download = 'ajaxGeneral.php?mode=file&type=evaluacion&name=' . $filename;
    /* Location */
    $location = $ruta . $filename;
    $imgType = pathinfo($location, PATHINFO_EXTENSION);
    $imgSize = $_FILES[0]['size'];

    // Check image format
    if ($imgType != "xls")
      return array('error' => ('El formato del XLXS no es valida'));
    // Validamos el tasmaño del XLXS
    if ($imgSize > 5242880) //5MB
      return array('error' => ('El tamaño del XLXS no puede ser mayor a 5MB'));
    //Validamos el tamaño del nombre
    if (strlen($location) > 120)
      return array('error' => ('La longitud del nombre no puede ser mayor a ' . (120 - strlen($ruta)) . ' caracteres'));

    /* Upload file */
    if (move_uploaded_file($_FILES[0]['tmp_name'], $location))
      return array('ruta' => $path_download);
    return array('error' => ('Error al subir el xlxs'));
  }
  public static function validacionEvaluacion($action)
  {
    $db = conexion();
    $eliminar_f = array();
    if (!isset($_SESSION['numPack']['codigo']) || $_POST['numPack']['codigo'] != $_SESSION['numPack']['codigo']) {
      $_SESSION['IMP_CAT'] = array();
      $_SESSION['IMP_CAT']['versionImportador'] = $_POST['versionImportador'];
      $_SESSION['numPack']['codigo'] = $_POST['numPack']['codigo'];
      $_SESSION['IMP_CAT']['evaluacion_recorridas'] = array('CEDULA EVALUADO' => array());
    }
    $errores = array();
    $observaciones = array();

    if ($action == 'importar') {
      $db->beginTransaction();
    }
    $evaluaciones = json_decode($_POST['evaluacion'], 1);
    $eliminado = self::eliminarEvaluacion($db);
    foreach ($evaluaciones as $id => $cuentas) {
      foreach ($cuentas as $cuenta) {
        $is_duplicado = false;

        if (empty($cuenta['Periodo']))
          $errores[$cuenta['
          Cedula Evaluado']][] = 'periodo_vacio';

        if (empty($cuenta['Cedula Evaluado']))
          $errores[$cuenta['Cedula Evaluado']][] = 'cedula evaluado_vacio';

        if (empty($cuenta['Evaluado']))
          $errores[$cuenta['
          Cedula Evaluado']][] = 'evaluado_vacio';

        if (empty($cuenta['Valor Total Def.']))
          $errores[$cuenta['Cedula Evaluado']][] = 'valor total_vacio';

        if (array_key_exists($cuenta['Cedula Evaluado'], $_SESSION['IMP_CAT']['evaluacion_recorridas']['CEDULA EVALUADO'])) {
          $errores[$cuenta['Cedula Evaluado']][] = 'Cedula Evaluado_duplicado';
          $is_duplicado = true;
        }

        $_SESSION['IMP_CAT']['cuentas_recorridas']['Cedula Evaluado'][$cuenta['Cedula Evaluado']][$cuenta['Cedula Evaluado']] = 1;
        $id_funcionario = self::validarFuncionario($db, $cuenta['Cedula Evaluado']);


        if (isset($eliminado['error'])) {
          $eliminar_f = $eliminado;
          //   $db->rollBack();
          //   return $eliminado;
        }

        // if (!$valFuncionario) {
        //   $errores[$cuenta['CEDULA EVALUADO']][] = 'cedula evaluado_inexistente';
        // }

        if (empty($errores) && !empty($id_funcionario)) {
          $evaluacion = array(
            'periodo' => $cuenta['Periodo'],
            'id_funcionario' => $id_funcionario,
            'valor' => $cuenta['Valor Total Def.'],
          );
          // return $evaluacion;
          $evaluacionIngresada = self::IngresarEvaluacion($db, $evaluacion);
          // $catalogoCuenta = catalogoMD::put($db, $datos);
          // $nivelesCuenta = catalogoMD::validaNivelesCUenta($db, $cuenta['CUENTA CONTABLE']);
          // if ($catalogoCuenta == 'cuenta_inactiva')
          //   $errores[$cuenta['CUENTA CONTABLE']][] = 'cuenta contable_inactivoCuenta';
          if (isset($evaluacionIngresada['error'])) {
            $db->rollBack();
            return $evaluacionIngresada;
            die();
          }
        }
      }
      // return $cuentas[$i];
    }
    // return $data = array("success" => ("Se importaron todas los funcionarios"));
    if ($action == 'importar' && empty($errores)) {
      $db->commit();
      $data = array("success" => base64_encode("Se importaron todas los funcionarios"));
      return $data;
    } else {
      return array(
        'success' => '',
        'observaciones' => $observaciones,
        'errores' => $errores
      );
    }
  }
  public static function validarFuncionario($conn, $cedula)
  {
    $query = "SELECT id_funcionario FROM funcionarios WHERE documento = $cedula";
    $stmt = $conn->query($query);
    $stmt->execute();
    if ($stmt->rowCount() > 0)
      return $stmt->fetch(PDO::FETCH_ASSOC)['id_funcionario'];
    return false;
  }
  public static function eliminarEvaluacion($conn)
  {
    try {
      self::validPermissions(9);
      $query = "DELETE FROM evaluaciones";
      $stmt = $conn->query($query);
      $stmt->execute();
      return array('success' => base64_encode('EVALUACION'));
    } catch (PDOException $e) {
      return array('error' => base64_encode($e->getMessage()));
    }
  }
  public static function IngresarEvaluacion($conn, $datos)
  {
    try {
      self::validPermissions(9);
      $query = "INSERT INTO evaluaciones(periodo, id_funcionario, valor_evaluacion) 
    VALUE(:periodo, :id_funcionario, :valor_evaluacion);";
      $stmt = $conn->prepare($query);
      $stmt->bindValue(':periodo', $datos['periodo']);
      $stmt->bindValue(':id_funcionario',  $datos['id_funcionario']);
      $stmt->bindValue(':valor_evaluacion', $datos['valor']);
      $stmt->execute();
      $data = array('success' => base64_encode('GUARDADO CON ÉXITO'));
    } catch (PDOException  $e) {
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }


  public static function validPermissions($opcion){
    if($_SESSION['nivel'] !=1){
        foreach ($_SESSION['permisos'] as $permiso) {
           if($permiso['opcion'] == $opcion && $permiso['permiso'] == 0){
            throw new Exception("El usuario <b>$_SESSION[usuario_on]</b> no tiene permisos para realizar esta acción", 6001);
           }
        }
    }
}
}
