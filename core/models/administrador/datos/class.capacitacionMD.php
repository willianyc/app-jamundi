<?php

/*
* Librerias: recapchalib.php
* include('core/bin/functions/conexion.php');
* 
*/


abstract class capacitacionMD
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
            self::validPermissions(6);
            $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);

            $qn = 1;
            $query = "INSERT INTO capacitaciones (nombre, identificacion, fecha_ini, fecha_fin, is_presencial,
                        direccion, horas_formativas, conocimiento_previo, entidadCapacitadora, calificacion, consecutivo)
                        VALUES (:nombre, :identificacion, :fecha_ini, :fecha_fin, :is_presencial,
                        :direccion, :horas_formativas, :conocimiento_previo, :entidadCapacitadora, :calificacion, :consecutivo)";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':nombre',  $params['nombre']);
            $stmt->bindValue(':identificacion',  $params['identificacion']);
            $stmt->bindValue(':fecha_ini', $params['fecha_inicio']);
            $stmt->bindValue(':fecha_fin', $params['fecha_finalizacion']);
            $stmt->bindValue(':is_presencial', $params['modalidad']);
            $stmt->bindValue(':direccion', $params['direccion']);
            $stmt->bindValue(':horas_formativas', $params['horas_formativas']);
            $stmt->bindValue(':conocimiento_previo', $params['conocimiento_previo']);
            $stmt->bindValue(':entidadCapacitadora', $params['entidadCapacitadora']);
            $stmt->bindValue(':calificacion', (int)$params['calificacion'], PDO::PARAM_INT);
            $stmt->bindValue(':consecutivo', (int)$params['consecutivo'], PDO::PARAM_INT);
            $stmt->execute();
            // $id_capacitacion = $db->lastInsertId();


            $db->commit();
            $data = array('success' => base64_encode('Registro guardado con éxito'));
            // Logger::guardar_accion($db, 'EMPLEADO', 'CREACION DEL TERCERO ID ');
        } catch (PDOException  $e) {
            if (isset($stmt) && $stmt->errorInfo()[1] == '1062') {
                error_log('*E: terceroMD[54]: ' . print_r($stmt->errorInfo(), 1));
                switch ($qn) {
                    case 1:
                        $msger = 'La capacitación "' . $params['identificacion'] . '" ya existe';
                        break;
                }
                $data = array('error' => base64_encode($msger));
            } else {
                error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . ' - [query]: ' . PHP_EOL . $query);
                $data = array('error' => base64_encode($e->getMessage()));
            }
            $db->rollback();
            // } catch (SeccionGumpClassExeptions $e) {
            //     $data = $e->getOptions();
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
    public static function modificar()
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
            self::validPermissions(6);
            $params = $_POST;
            $location = "";
            if (!empty($_FILES['archivo'])) {
                $filename = str_replace(" ", "_", $_FILES['archivo']['name']);
                $directorio = "views/archivos/capacitacion/";
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
            // self::rules_crear($_POST);
            // if ($params['is_update'] == "0") {
            $qn = 1;
            $query = "UPDATE capacitaciones SET nombre = :nombre, identificacion =:identificacion,
                 fecha_ini = :fecha_ini, fecha_fin =:fecha_fin, is_presencial =:is_presencial,
                direccion =:direccion, horas_formativas =:horas_formativas, estado=:estado, motivo=:motivo,
                conocimiento_previo =:conocimiento_previo, entidadCapacitadora=:entidadCapacitadora, calificacion=:calificacion,
                archivo=:archivo, cantidad=:cantidad, fecha_inicio_suspencion=:fecha_inicio_suspencion, fecha_final_suspencion=:fecha_final_suspencion
                WHERE id_capacitacion = :id_capacitacion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':nombre',  $params['nombre']);
            $stmt->bindValue(':identificacion',  $params['identificacion']);
            $stmt->bindValue(':fecha_ini', $params['fecha_inicio']);
            $stmt->bindValue(':fecha_fin', $params['fecha_finalizacion']);
            $stmt->bindValue(':is_presencial', $params['modalidad']);
            $stmt->bindValue(':direccion', $params['direccion']);
            $stmt->bindValue(':horas_formativas', $params['horas_formativas']);
            $stmt->bindValue(':conocimiento_previo', $params['conocimiento_previo']);
            $stmt->bindValue(':entidadCapacitadora', $params['entidadCapacitadora']);
            $stmt->bindValue(':estado', $params['estado']);
            $stmt->bindValue(':motivo', $params['motivo']);
            $stmt->bindValue(':cantidad', $params['cantidad']);
            $stmt->bindValue(':archivo', $location);
            $stmt->bindValue(':calificacion', (int)$params['calificacion'], PDO::PARAM_INT);
            $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
            $stmt->bindValue(':fecha_inicio_suspencion', $params['fecha_inicio_suspencion'] == "" ? NULL : $params['fecha_inicio_suspencion']);
            $stmt->bindValue(':fecha_final_suspencion', $params['fecha_final_suspencion'] == "" ? NULL : $params['fecha_final_suspencion']);

            $stmt->execute();
            // $id_capacitacion = $db->lastInsertId();

            $query = "DELETE FROM capacitacion_funcionario 
            WHERE id_capacitacion = :id_capacitacion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
            $stmt->execute();
            if ($params['estado'] == "REALIZADO") {
                // } elseif ($params['estado'] == "REALIZADO") {
                $funcionariosAsignados = json_decode($params['funcionariosAsignados'], 1);
              if(!empty($funcionariosAsignados)){
                // self::rules_crear($_POST);
                foreach ($funcionariosAsignados as $funcionarioAsignado) {
                    $qn = 2;
                    $query = "INSERT INTO capacitacion_funcionario (id_funcionario, id_capacitacion, fecha_asignacion, nota, aprobo)
                            VALUES (:id_funcionario, :id_capacitacion, :fecha_asignacion, :nota, :aprobo)";
                    $stmt = $db->prepare($query);
                    $stmt->bindValue(':id_funcionario',  $funcionarioAsignado['id_funcionario']);
                    $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
                    $stmt->bindValue(':fecha_asignacion',  $params['fecha_asignacion']);
                    $stmt->bindValue(':nota',  $funcionarioAsignado['nota']);
                    $stmt->bindValue(':aprobo',  $funcionarioAsignado['aprobo'] == "" ? NULL : $funcionarioAsignado['aprobo']);
                    $stmt->execute();
                }
            }
            }

            $db->commit();
            $data = array('success' => base64_encode('Registro guardado con éxito'));
            // Logger::guardar_accion($db, 'EMPLEADO', 'CREACION DEL TERCERO ID ');
        } catch (PDOException  $e) {
            if (isset($stmt) && $stmt->errorInfo()[1] == '1062') {
                error_log('*E: terceroMD[54]: ' . print_r($stmt->errorInfo(), 1));
                switch ($qn) {
                    case 1:
                        $msger = 'La capacitación "' . $params['identificacion'] . '" ya existe';
                        break;
                }
                $data = array('error' => base64_encode($msger));
            } else {
                error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . ' - [query]: ' . PHP_EOL . $query);
                $data = array('error' => base64_encode($e->getMessage()));
            }
            $db->rollback();
            // } catch (SeccionGumpClassExeptions $e) {
            //     $data = $e->getOptions();
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
    public static function eliminar()
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
            $params =  json_decode($_POST['general'], 1);

            $query = "DELETE FROM capacitacion_funcionario 
            WHERE id_capacitacion = :id_capacitacion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
            $stmt->execute();

            $query = "DELETE FROM capacitaciones 
            WHERE id_capacitacion = :id_capacitacion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
            $stmt->execute();

            $db->commit();
            $data = array('success' => base64_encode('Capacitación eliminada con éxito'));
            // Logger::guardar_accion($db, 'EMPLEADO', 'CREACION DEL TERCERO ID ');
        } catch (PDOException  $e) {
            if (isset($stmt) && $stmt->errorInfo()[1] == '1062') {
                error_log('*E: terceroMD[54]: ' . print_r($stmt->errorInfo(), 1));
                switch ($qn) {
                    case 1:
                        $msger = 'La capacitación "' . $params['identificacion'] . '" ya existe';
                        break;
                }
                $data = array('error' => base64_encode($msger));
            } else {
                error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . ' - [query]: ' . PHP_EOL . $query);
                $data = array('error' => base64_encode($e->getMessage()));
            }
            $db->rollback();
            // } catch (SeccionGumpClassExeptions $e) {
            //     $data = $e->getOptions();
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
    public static function validPermissions($opcion){
        if($_SESSION['nivel'] !=1){
            foreach ($_SESSION['permisos'] as $permiso) {
               if($permiso['opcion'] == $opcion && $permiso['permiso'] == 0){
                throw new Exception("El usuario <b>$_SESSION[usuario_on]</b> no tiene permisos para realizar esta acción", 6001);
               }
            }
        }
    }

    public static function trazabilidad()
    {
        $db = conexion();
        $tiempo_exec = time();
        $data = array('error' => base64_encode('consulta   ||   [#' . $tiempo_exec . ']'));
        $db->beginTransaction();
        $qn = 0;

        try {
            $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            $id = $params['id_capacitacion'];

            $querygetConsecutivo = "SELECT consecutivo FROM trazabilidad_capacitaciones
            WHERE id_capacitacion = $id ORDER by consecutivo DESC LIMIT 1";
            $stmtGetConsecutivo = $db->prepare($querygetConsecutivo);
            $stmtGetConsecutivo->execute();
            $valueConsecutivo = $stmtGetConsecutivo->fetch(PDO::FETCH_ASSOC);

            $qn = 1;
            $query = "INSERT INTO trazabilidad_capacitaciones (
                id_capacitacion,
                estado,
                observacion,
                calificacion,
                fecha_inicio_suspencion,
                fecha_final_suspencion,
                motivo,
                consecutivo
                )
                VALUES (
                    :id_capacitacion, 
                    :estado,
                    :observacion,
                    :calificacion,
                    :fecha_inicio_suspencion,
                    :fecha_final_suspencion,
                    :motivo,
                    :consecutivo
                )";
            
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_capacitacion', $id);
            $stmt->bindValue(':estado', $params['estado'] == "" ? "PENDIENTE" : $params['estado']);
            $stmt->bindValue(':observacion', $params['observacion'] == "" ? NULL : $params['observacion']);
            $stmt->bindValue(':calificacion', $params['calificacion'] == "" ? NULL : $params['calificacion']);
            $stmt->bindValue(':fecha_inicio_suspencion', $params['fecha_inicio_suspencion'] == "" ? NULL : $params['fecha_inicio_suspencion']);
            $stmt->bindValue(':fecha_final_suspencion', $params['fecha_final_suspencion'] == "" ? NULL : $params['fecha_final_suspencion']);
            $stmt->bindValue(':motivo', $params['motivo'] == "" ? NULL : $params['motivo']);
            $stmt->bindValue(':consecutivo', ($valueConsecutivo['consecutivo'] + 1));
            $stmt->execute();
            $db->commit();
            $data = array('success' => base64_encode('Registro guardado con éxito'));
            
            //Por Consulta tema sobre Logger
            //Logger::guardar_accion($db, 'ACTIVIDADES PROGRAMADAS', 'CREACION ACTIVIDAD PROGRAMADA');
            
        } catch (PDOException  $e) {
            return $e->getMessage();
            if (isset($stmt) && $stmt->errorInfo()[1] == '1062') {
                error_log('*E: terceroMD[54]: ' . print_r($stmt->errorInfo(), 1));
                switch ($qn) {
                    case 1:
                        $msger = 'La capacitacion ya existé';
                        break;
                }
                $data = array('error' => base64_encode($msger));
            } else {
                error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . ' - [query]: ' . PHP_EOL . $query);
                $data = array('error' => base64_encode($e->getMessage()));
            }
            $db->rollback();
            // } catch (SeccionGumpClassExeptions $e) {
            //     $data = $e->getOptions();
        } catch (Exception $e) {
            return $e->getMessage();
            if ($e->getCode() > 999) {
                $data = array('error' => base64_encode($e->getMessage()));
            } else {
                error_log('+** Error Exception: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . PHP_EOL . 'ERROR: [vista]: ' . print_r($data, 1)); //Captura el error en logger, y si hay otro tambien
                $data = array('error' => base64_encode($e->getMessage()));
            }
        }
        return $data;
    }
}
