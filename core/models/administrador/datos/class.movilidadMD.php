<?php

class movilidadMD
{

  public static function crear()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1')))) return $er;
    // if (is_array($data = self::upload_image('archivo_rut'))) return $data;
    // $imgLocation = $data;
    $db = conexion();
    $tiempo_exec = time();
    $data = array('error' => base64_encode('consulta   ||   [#' . $tiempo_exec . ']'));
    $db->beginTransaction();
    $qn = 0;
    $id_relacion = array();
    try {
      // $_POST =  json_decode($_POST['general'], 1);
      self::validPermissions(4);

      $location = "";
      if (!empty($_FILES['archivo_lab']['name'])) {
        $filename = str_replace(" ", "_", $_FILES['archivo_lab']['name']);
        $directorio = "views/archivos/movilidad/";
        $location = $directorio . $filename;

        $imgType = pathinfo($location, PATHINFO_EXTENSION);
        $filename = str_replace("$imgType", time() . '_' . uniqid(), $filename) . '.' . $imgType;
        $imgSize = $_FILES['archivo_lab']['size'];
        $location = $directorio . $filename;

        if ($imgSize > 5242880)
          return array('error_arc' => base64_encode('El archivo no puede ser mayor a 5MB'));

        if ($imgType != "pdf" && $imgType != "docx")
          return array('error_arc' => base64_encode('El archivo tiene que ser tipo pdf o word'));

        if (strlen($location) > 150)
          return array('error_arc' => base64_encode('La longitud del nombre no puede ser mayor a ' . (120 - strlen($directorio)) . ' caracteres'));

        if (!move_uploaded_file($_FILES['archivo_lab']['tmp_name'], $location))
          return array('error_arc' => base64_encode('Error al subir el archivo'));
      }
      // self::rules_crear($_POST);
      $qn = 1;
      $MSG ="GUARDADO CON ÉXITO";
      if (empty($_POST['id_movilidad'])) {
        $query = "INSERT INTO movilidad (funciones, salario, id_dependencia, id_sede,
                    fecha_ini, fecha_fin, id_funcionario, id_tipovinculacion, id_nivel, 
                    id_cargo, id_codigo, id_grado, numero_posesion, fecha_posesion, fecha_resolucion, 
                    numero_resolucion, modo_trabajo, archivo_laboral, fecha_creacion, motivo, otro, entrega_cargo)
                    VALUES (:funciones, :salario, :dependencia_mov, :sede_mov, 
                      :fecha_ini, :fecha_fin, :id_funcionario, :id_tipovinculacion, :id_nivel, 
                      :id_cargo, :id_codigo, :id_grado, :numero_posesion, :fecha_posesion, :fecha_resolucion, 
                      :numero_resolucion, :modo_trabajo, :archivo_lab, :fecha_creacion, :motivo, :otro, :entrega_cargo)";
        $stmt = $db->prepare($query);
        $stmt->bindValue(':id_funcionario', $_POST['id_funcionario']);
        $stmt->bindValue(':funciones',  $_POST['funciones']);
        $stmt->bindValue(':salario', $_POST['salario']);
        $stmt->bindValue(':dependencia_mov', $_POST['dependencia_mov']);
        $stmt->bindValue(':sede_mov', $_POST['sede_mov']);
        $stmt->bindValue(':id_nivel', $_POST['nivel']);
        $stmt->bindValue(':fecha_ini', $_POST['fecha_ini']);
        $stmt->bindValue(':fecha_fin', $_POST['fecha_fin'] == '' ? NULL : $_POST['fecha_fin']);
        $stmt->bindValue(':id_cargo', $_POST['cargo_propiedad']);
        $stmt->bindValue(':id_codigo', $_POST['codigo']);
        $stmt->bindValue(':id_grado', $_POST['grado']);
        $stmt->bindValue(':id_tipovinculacion', $_POST['tipo_vinculacion']);
        $stmt->bindValue(':numero_posesion', $_POST['num_posesion']);
        $stmt->bindValue(':fecha_posesion', $_POST['fecha_posesion']);
        $stmt->bindValue(':fecha_resolucion', $_POST['fecha_resolucion']);
        $stmt->bindValue(':numero_resolucion', $_POST['num_resolucion']);
        $stmt->bindValue(':modo_trabajo', $_POST['modo_trabajo']);
        $stmt->bindValue(':archivo_lab', $location);
        $stmt->bindValue(':fecha_creacion', $_POST['fecha_creacion']);
        $stmt->bindValue(':motivo', $_POST['motivo']);
        $stmt->bindValue(':otro', $_POST['otro']);
        $stmt->bindValue(':entrega_cargo', $_POST['entrega_cargo']);
        $stmt->execute();
      } else {
        $MSG ="SE MODIFICÓ CON ÉXITO";
        $query = "UPDATE movilidad SET funciones = :funciones, salario = :salario, id_dependencia = :dependencia_mov, id_sede = :sede_mov,
        fecha_ini = :fecha_ini, fecha_fin = :fecha_fin, id_tipovinculacion = :id_tipovinculacion, id_nivel = :id_nivel, 
        id_cargo = :id_cargo, id_codigo = :id_codigo, id_grado = :id_grado, numero_posesion = :numero_posesion, fecha_posesion = :fecha_posesion, fecha_resolucion = :fecha_resolucion, 
        numero_resolucion = :numero_resolucion, modo_trabajo = :modo_trabajo, archivo_laboral = :archivo_lab, motivo = :motivo, otro = :otro, 
        entrega_cargo = :entrega_cargo WHERE id_movilidad = :id_movilidad;";
        $stmt = $db->prepare($query);
        $stmt->bindValue(':id_movilidad', $_POST['id_movilidad']);
        $stmt->bindValue(':funciones',  $_POST['funciones']);
        $stmt->bindValue(':salario', $_POST['salario']);
        $stmt->bindValue(':dependencia_mov', $_POST['dependencia_mov']);
        $stmt->bindValue(':sede_mov', $_POST['sede_mov']);
        $stmt->bindValue(':id_nivel', $_POST['nivel']);
        $stmt->bindValue(':fecha_ini', $_POST['fecha_ini']);
        $stmt->bindValue(':fecha_fin', $_POST['fecha_fin'] == '' ? NULL : $_POST['fecha_fin']);
        $stmt->bindValue(':id_cargo', $_POST['cargo_propiedad']);
        $stmt->bindValue(':id_codigo', $_POST['codigo']);
        $stmt->bindValue(':id_grado', $_POST['grado']);
        $stmt->bindValue(':id_tipovinculacion', $_POST['tipo_vinculacion']);
        $stmt->bindValue(':numero_posesion', $_POST['num_posesion']);
        $stmt->bindValue(':fecha_posesion', $_POST['fecha_posesion']);
        $stmt->bindValue(':fecha_resolucion', $_POST['fecha_resolucion']);
        $stmt->bindValue(':numero_resolucion', $_POST['num_resolucion']);
        $stmt->bindValue(':modo_trabajo', $_POST['modo_trabajo']);
        $stmt->bindValue(':archivo_lab', $location);
        $stmt->bindValue(':motivo', $_POST['motivo']);
        $stmt->bindValue(':otro', $_POST['otro']);
        $stmt->bindValue(':entrega_cargo', $_POST['entrega_cargo']);
        $stmt->execute();



        // $query = "UPDATE funcionarios SET id_cargo = :id_cargo, id_nivelfuncionario = :id_nivelfuncionario,
        //  id_grado = :id_grado, id_codigo = :id_codigo ,id_tipovinculacion = :id_tipovinculacion
        //   WHERE id_funcionario = :id_funcionario;";
        // $stmt1 = $db->prepare($query);
        // $stmt1->bindValue(':id_cargo', $_POST['cargo_propiedad']);
        // $stmt1->bindValue(':id_nivelfuncionario', $_POST['nivel']);
        // $stmt1->bindValue(':id_grado', $_POST['grado']);
        // $stmt1->bindValue(':id_codigo', $_POST['codigo']);
        // $stmt1->bindValue(':id_tipovinculacion',$_POST['tipo_vinculacion']);
        // $stmt1->bindValue(':id_funcionario',$_POST['id_funcionario']);
        // $stmt1->execute();
      }
      $query = "SELECT id_movilidad FROM movilidad WHERE id_funcionario = $_POST[id_funcionario] ORDER BY id_movilidad DESC LIMIT 1;";
      $stmt = $db->query($query);
      $stmt->execute();
      $movilidad_id = $stmt->fetch(PDO::FETCH_ASSOC);
      if (empty($_POST['id_movilidad']) == $movilidad_id) {
        $query = "UPDATE funcionarios SET id_nivelfuncionario = :id_nivel, id_codigo = :id_codigo,  id_sede = :sede_mov, 
      id_tipovinculacion = :id_tipovinculacion, id_cargo = :id_cargo, id_grado = :id_grado, 
        numero_posesion = :numero_posesion, fecha_posesion = :fecha_posesion, fecha_resolucion = :fecha_resolucion, 
        numero_resolucion = :numero_resolucion, modo_trabajo = :modo_trabajo, id_dependencia = :dependencia_mov WHERE id_funcionario = :id_funcionario;";
        $stmt = $db->prepare($query);
        $stmt->bindValue(':id_funcionario', $_POST['id_funcionario']);
        $stmt->bindValue(':dependencia_mov', $_POST['dependencia_mov']);
        $stmt->bindValue(':sede_mov', $_POST['sede_mov']);
        $stmt->bindValue(':id_nivel', $_POST['nivel']);
        // $stmt->bindValue(':fecha_ini', $_POST['fecha_ini']);
        $stmt->bindValue(':id_cargo', $_POST['cargo_propiedad']);
        $stmt->bindValue(':id_codigo', $_POST['codigo']);
        $stmt->bindValue(':id_grado', $_POST['grado']);
        $stmt->bindValue(':id_tipovinculacion', $_POST['tipo_vinculacion']);
        $stmt->bindValue(':numero_posesion', $_POST['num_posesion']);
        $stmt->bindValue(':fecha_posesion', $_POST['fecha_posesion']);
        $stmt->bindValue(':fecha_resolucion', $_POST['fecha_resolucion']);
        $stmt->bindValue(':numero_resolucion', $_POST['num_resolucion']);
        $stmt->bindValue(':modo_trabajo', $_POST['modo_trabajo']);
        $stmt->execute();
      }
      $db->commit();
      $data = array('success' => base64_encode($MSG));
      // Logger::guardar_accion($db, 'EMPLEADO', 'CREACION DEL TERCERO ID ');
    } catch (PDOException  $e) {
      $data = array('error' => base64_encode($e->getMessage()));
      $db->rollback();
    }
    return $data;
  }

  public static function EliminarMovilidad()
  {
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      self::validPermissions(4);
      $query = "DELETE FROM movilidad WHERE id_movilidad = $_POST[id_movilidad];";
      $stmt = $db->query($query);
      $stmt->execute();
      $db->commit();
      $data = array('success' => base64_encode('Movilidad eliminada correctamente'));
    } catch (PDOException $err) {
      error_log($err->getMessage());
      $data = array('error' => base64_encode($err->getMessage()));
    }
    return $data;
  }

  private static function validfuncionario(){
    try {
      $query = "SELECT COUNT(*) exist FROM movilidad WHERE id_movilidad = $_POST[id_movilidad];";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $err) {
      error_log($err->getMessage());
      $data = array('error' => base64_encode($err->getMessage()));
    }
    return $data['exist'];
  }
  public static function CargarFuncionario()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/

    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      
      $_POST = json_decode($_POST['general'], 1);
      $query = "SELECT f.id_funcionario, f.nombre, f.apellidos, f.fecha_ingreso, f.fecha_ingreso_nombra, c.cargo, n.nivel, co.codigo, g.grado, d.dependencia, s.sede
      FROM funcionario f
      LEFT JOIN dependencia d ON d.id_dependencia = d.id_dependencia
      LEFT JOIN tipo_vinculacion d ON d.id_tipovinculacion = d.id_tipovinculacion
      LEFT JOIN sede s ON s.id_sede = f.id_sede
      LEFT JOIN nivel n ON n.id_nivel = f.id_nivel 
      LEFT JOIN cargo c ON c.id_cargo = n.id_cargo
      LEFT JOIN Codigo co ON co.id_codigo = c.id_codigo 
      LEFT JOIN grado g ON g.id_grado = co.id_grado
      WHERE f.documento = :documento AND td.tipo_documento = :tipo_documento LIMIT 1;";
      $stmt = $db->prepare($query);
      $stmt->bindValue(':documento', $_POST['cedula']);
      $stmt->bindValue(':tipo_documento', $_POST['tipoIdent']);
      if ($stmt->rowCount() > 0)
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
      else
        $data = array('error' => base64_encode('No hay ningun funcionario registrado con esta informacion.'));
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
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
