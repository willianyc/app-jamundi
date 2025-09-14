<?php

class retiroMD
{

  public static function crear()
  {
    $db = conexion();
    $tiempo_exec = time();
    $data = array('error' => base64_encode('consulta   ||   [#' . $tiempo_exec . ']'));
    $db->beginTransaction();
    $qn = 0;
    $id_relacion = array();
    try {
      self::validPermissions(5);
      // $params =  json_decode($_POST['general'], 1);
      // self::rules_crear($_POST);
      // $query = "SELECT id_retiro
      //        FROM retiro  
      //        WHERE id_funcionario = $params[id_funcionario];";
      // $stmt = $db->query($query);
      // $stmt->execute();
      // $has_retiro = $stmt->fetch(PDO::FETCH_ASSOC);
      $location = '';
      $msg ="Se guardó la información con exito";
      if (!empty($_FILES['archivo']['name'])) {
        $filename = str_replace(" ", "_", $_FILES['archivo']['name']);
        $directorio = "views/archivos/retiro/";
        $location = $directorio . $filename;

        $imgType = pathinfo($location, PATHINFO_EXTENSION);
        $filename = str_replace("$imgType", time() . '_' . uniqid(), $filename) . '.' . $imgType;
        $imgSize = $_FILES['archivo']['size'];
        $location = $directorio . $filename;

        if ($imgSize > 5242880)
          return array('error_arc' => base64_encode('El archivo no puede ser mayor a 5MB'));

        if ($imgType != "pdf" && $imgType != "docx")
          return array('error_arc' => base64_encode('El archivo tiene que ser tipo pdf o word'));

        if (strlen($location) > 150)
          return array('error_arc' => base64_encode('La longitud del nombre no puede ser mayor a ' . (120 - strlen($directorio)) . ' caracteres'));

        if (!move_uploaded_file($_FILES['archivo']['tmp_name'], $location))
          return array('error_arc' => base64_encode('Error al subir el archivo'));
      }

      // if (empty($_POST['id_retiro'])) {
      if (!isset($_POST['id_retiro']) && empty($_POST['id_retiro'])) {
        $query = "INSERT INTO retiro (acta_informe, examen_medico, comprovante_devolucion, hoja_sigep, declaracion_sigep,
                    carnet_servidor, fecha_recepcion, id_funcionario, id_causaretiro, tipo_retiro, otro, paz_salvo,estado, fecha_retiro)
                    VALUES (:acta_informe, :examen_medico, :comprovante_devolucion, :hoja_sigep, :declaracion_sigep,
                     :carnet_servidor, :fecha_recepcion, :id_funcionario, :id_causaretiro, :tipo_retiro, :otra_causa, :paz_salvo,:estado, :fecha_retiro)";
        $stmt = $db->prepare($query);
        $stmt->bindValue(':acta_informe',  $_POST['procesos_disc']);
        $stmt->bindValue(':examen_medico', $_POST['examen_med']);
        $stmt->bindValue(':comprovante_devolucion', $_POST['comprobante_dev']);
        $stmt->bindValue(':hoja_sigep', $_POST['hoja_vida']);
        $stmt->bindValue(':declaracion_sigep', $_POST['declariacion_renta']);
        $stmt->bindValue(':carnet_servidor', $_POST['carnet_servidor']);
        $stmt->bindValue(':fecha_recepcion', $_POST['fecha_recepcion'] == "undefined" ? NULL :$_POST['fecha_recepcion']);
        $stmt->bindValue(':id_funcionario', $_POST['id_funcionario']);
        $stmt->bindValue(':tipo_retiro', $_POST['tipo_retiro']);
        $stmt->bindValue(':id_causaretiro', $_POST['causa_retiro']);
        $stmt->bindValue(':otra_causa', $_POST['otra_causa']);
        $stmt->bindValue(':paz_salvo', $location);
        $stmt->bindValue(':estado', $_POST['estadodoc']);
        $stmt->bindValue(':fecha_retiro', $_POST['fecha_retiro']);
        $stmt->execute();
      } else {
        $msg="Se Actualizó correctamente la información";

        $query = "UPDATE retiro SET acta_informe = :acta_informe, examen_medico = :examen_medico, comprovante_devolucion = :comprovante_devolucion, hoja_sigep = :hoja_sigep, declaracion_sigep = :declaracion_sigep,
        carnet_servidor = :carnet_servidor, fecha_recepcion = :fecha_recepcion, id_causaretiro = :id_causaretiro,tipo_retiro = :tipo_retiro, otro = :otro, paz_salvo = :paz_salvo, estado=:estado,fecha_retiro = :fecha_retiro WHERE id_retiro =:id_retiro;";
        $stmt = $db->prepare($query);
        $stmt->bindValue(':acta_informe',  $_POST['procesos_disc']);
        $stmt->bindValue(':examen_medico', $_POST['examen_med']);
        $stmt->bindValue(':comprovante_devolucion', $_POST['comprobante_dev']);
        $stmt->bindValue(':hoja_sigep', $_POST['hoja_vida']);
        $stmt->bindValue(':declaracion_sigep', $_POST['declariacion_renta']);
        $stmt->bindValue(':carnet_servidor', $_POST['carnet_servidor']);
        $stmt->bindValue(':fecha_recepcion', $_POST['fecha_recepcion'] == "undefined" ? NULL :$_POST['fecha_recepcion']);
        $stmt->bindValue(':id_retiro', $_POST['id_retiro']);
        $stmt->bindValue(':tipo_retiro', $_POST['tipo_retiro']);
        $stmt->bindValue(':id_causaretiro', $_POST['causa_retiro']);
        $stmt->bindValue(':otro', $_POST['otra_causa']);
        $stmt->bindValue(':paz_salvo', $location);
        $stmt->bindValue(':estado', $_POST['estadodoc']);
        $stmt->bindValue(':fecha_retiro', $_POST['fecha_retiro']);
        $stmt->execute();
      }

      $id_funcionario = $_POST['id_funcionario'];
      if($_POST['tipo_retiro'] == "Retiro"){
        $query = "UPDATE funcionarios SET is_activo = 0 WHERE id_funcionario = $id_funcionario";
        $stmt = $db->query($query);
        $stmt->execute();
      }
      $queryM = "SELECT id_movilidad FROM movilidad WHERE id_funcionario = $id_funcionario ORDER BY id_movilidad DESC limit 1;";
      $stmt = $db->query($queryM);
      $stmt->execute();
      $id_movilidad = $stmt->fetch(PDO::FETCH_ASSOC);
      if(!empty($id_movilidad)){        
      $query = "UPDATE movilidad SET fecha_fin = :fecha_fin WHERE id_funcionario = $id_funcionario";
      $stmt = $db->prepare($query);
      $stmt->bindValue(':fecha_fin', $_POST['fecha_retiro']);
      $stmt->execute();
      }

      $db->commit();
      $data = array('success' => base64_encode($msg));
      // Logger::guardar_accion($db, 'EMPLEADO', 'CREACION DEL TERCERO ID ');
    } catch (PDOException  $e) {
      $db->rollback();
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }

  public static function eliminar()
  {
    $db = conexion();
    $tiempo_exec = time();
    $data = array('error' => base64_encode('consulta   ||   [#' . $tiempo_exec . ']'));
    $db->beginTransaction();
    try {
      self::validPermissions(5);
      $query = "DELETE FROM retiro WHERE id_retiro = $_POST[id_retiro];";
      $stmt = $db->query($query);
      $stmt->execute();
      $db->commit();
      $data = array('success' => base64_encode('Retiro eliminado correctamente'));
    } catch (PDOException $err) {
      error_log($err->getMessage());
      $data = array('error' => base64_encode($err->getMessage()));
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
