<?php

/*
* Librerias: recapchalib.php
* include('core/bin/functions/conexion.php');
* 
*/


abstract class incapacidadMD
{

    public static function crear()
    {
       

        // if (is_string($er = valida_sesion())) return $er;
        // if (is_string($er = valida_nivel(array('1')))) return $er;
        // if (is_array($data = self::upload_image('archivo_rut'))) return $data;
        // $imgLocation = $data;
        self::validPermissions(3);
        $db = conexion();
        $tiempo_exec = time();
        $data = array('error' => base64_encode('consulta   ||   [#' . $tiempo_exec . ']'));
        $db->beginTransaction();
        $qn = 0;
        $id_relacion = array();
        try {
            
            if($_SESSION['nivel'] == 3){
                throw new Exception("El usuario <b>$_SESSION[usuario_on]</b> no tiene permisos para realizar esta acción", 1000);
            }
            // $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            $location = "";
            if (!empty($_FILES['archivo_incapacidad']['name'])) {
                $filename = str_replace(" ", "_", $_FILES['archivo_incapacidad']['name']);
                $directorio = "views/archivos/incapacidad/";
                $location = $directorio . $filename;

                $imgType = pathinfo($location, PATHINFO_EXTENSION);
                $filename = str_replace("$imgType", time() . '_' . uniqid(), $filename) . '.' . $imgType;
                $imgSize = $_FILES['archivo_incapacidad']['size'];
                $location = $directorio . $filename;

                if ($imgSize > 5242880)
                    return array('error_arc' => base64_encode('El archivo no puede ser mayor a 5MB'));

                if ($imgType != "pdf" && $imgType != "docx")
                    return array('error_arc' => base64_encode('El archivo tiene que ser tipo pdf o word'));

                if (strlen($location) > 150)
                    return array('error_arc' => base64_encode('La longitud del nombre no puede ser mayor a ' . (120 - strlen($directorio)) . ' caracteres'));

                if (!move_uploaded_file($_FILES['archivo_incapacidad']['tmp_name'], $location))
                    return array('error_arc' => base64_encode('Error al subir el archivo'));
            }

            $qn = 1;
            // if (empty($_POST['id_incapacidad'])) {
            if (true) {
                $query = "INSERT INTO incapacidad (dias, fecha_ini, fecha_fin, diagnostico, tipo_incapacidad,
                    archivo_incapacidad, id_funcionario)
                    VALUES (:dias, :fecha_ini, :fecha_fin, :diagnostico, :tipo_incapacidad,
                     :archivo_incapacidad, :id_funcionario)";
                $stmt = $db->prepare($query);
                $stmt->bindValue(':id_funcionario', $_POST['id_funcionario']);
            } else {
                $query = "UPDATE incapacidad SET dias = :dias, fecha_ini = :fecha_ini, fecha_fin = :fecha_fin, diagnostico = :diagnostico, tipo_incapacidad = :tipo_incapacidad, archivo_incapacidad
                 = :archivo_incapacidad WHERE id_incapacidad = :id_incapacidad";
                $stmt = $db->prepare($query);
                $stmt->bindValue(':id_incapacidad', $_POST['id_incapacidad']);
            }
            $stmt->bindValue(':dias',  $_POST['dias']);
            $stmt->bindValue(':fecha_ini', $_POST['fecha_inicio']);
            $stmt->bindValue(':fecha_fin', $_POST['fecha_fin']);
            $stmt->bindValue(':diagnostico', $_POST['diagnostico']);
            $stmt->bindValue(':tipo_incapacidad', $_POST['tipo_incapacidad']);
            $stmt->bindValue(':archivo_incapacidad', $location);
            // $stmt->bindValue(':id_eps', $params['id_eps']);
            $stmt->execute();

            $db->commit();
            $data = array('success' => base64_encode('GUARDADO CON ÉXITO'));
            // Logger::guardar_accion($db, 'EMPLEADO', 'CREACION DEL TERCERO ID ');
        } catch (PDOException  $e) {
            error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . ' - [query]: ' . PHP_EOL . $query);
            $data = array('error' => base64_encode($e->getMessage()));
            $db->rollback();
        } catch (PDOException $e) {
            $data = $e->getMessage();
        } catch (Exception $e) {
            if ($e->getCode() > 999) {
                $data = array('error' => base64_encode($e->getMessage()));
            } else {
                error_log('+** Error Exception: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . PHP_EOL . 'ERROR: [vista]: ' . print_r($data, 1)); //Captura el error en logger, y si hay otro tambien
                $data = array('error' => base64_encode($e->getMessage()));
            }
        }
        return $data;
    }

    public static function EliminarIncapacidad()
    {
        $db = conexion();
        $db->beginTransaction();
        $data = array('error' => base64_encode('Error: [#' . time() . ']'));
        self::validPermissions(3);
        try {
            
            $query = "DELETE FROM incapacidad WHERE id_incapacidad = $_POST[id_incapacidad];";
            $stmt = $db->query($query);
            $stmt->execute();
            $db->commit();
            $data = array('success' => base64_encode('Incapacidad eliminada correctamente'));
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
