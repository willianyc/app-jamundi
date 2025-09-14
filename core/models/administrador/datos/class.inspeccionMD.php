<?php

/*
* Librerias: recapchalib.php
* include('core/bin/functions/conexion.php');
* 
*/


abstract class inspeccionMD
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
            self::validPermissions(12);
            $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            $qn = 1;
            $query = "INSERT INTO inspeccion (id_dependencia, identificacion,
             tipo_inspeccion, responsable, fecha_ini, fecha_fin, modalidad, archivo, consecutivo, sede, descripcion)
            VALUES (:dependencia, :identificacion, :tipo_inspeccion, :responsable, :fecha_ini, :fecha_fin, :is_presencial,
            :archivo, :consecutivo, :sede, :descripcion)";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':dependencia',  $params['dependencia']);
            $stmt->bindValue(':identificacion',  $params['identificacion']);
            $stmt->bindValue(':tipo_inspeccion',  (int)$params['tipo_inspeccion'], PDO::PARAM_INT);
            $stmt->bindValue(':responsable',  $params['entidad']);
            $stmt->bindValue(':fecha_ini', $params['fecha_inicio']);
            $stmt->bindValue(':fecha_fin', $params['fecha_finalizacion']);
            $stmt->bindValue(':is_presencial', $params['modalidad']);
            $stmt->bindValue(':consecutivo', (int)$params['consecutivo'], PDO::PARAM_INT);
            $stmt->bindValue(':sede', $params['sede']);
            $stmt->bindValue(':descripcion', $params['descripcion']);
            // $stmt->bindValue(':estado', $params['estado']);
            // $stmt->bindValue(':motivo', $params['motivo']);
            // $stmt->bindValue(':observacion', $params['observacion']);
            $stmt->bindValue(':archivo', $params['archivo']);
            $stmt->execute();
            // $id_actividad = $db->lastInsertId();

            $queryGetId = "SELECT id_inspeccion FROM inspeccion ORDER by id_inspeccion DESC LIMIT 1";
            $stmtGetId = $db->prepare($queryGetId);
            $stmtGetId->execute();
            $id_inspeccion = $stmtGetId->fetch(PDO::FETCH_ASSOC);
            
            $queryTrazabilidad = "INSERT INTO trazabilidad_inspecciones (id_inspeccion, consecutivo) VALUES (:id_inspeccion, 1)";
            $stmtTrazabilidad = $db->prepare($queryTrazabilidad);
            $stmtTrazabilidad->bindValue(':id_inspeccion', $id_inspeccion['id_inspeccion']);
            $stmtTrazabilidad->execute();

            $db->commit();
            $data = array('success' => base64_encode('Registro guardado con éxito'));
            // Logger::guardar_accion($db, 'EMPLEADO', 'CREACION DEL TERCERO ID ');
        } catch (PDOException  $e) {
            if (isset($stmt) && $stmt->errorInfo()[1] == '1062') {
                error_log('*E: terceroMD[54]: ' . print_r($stmt->errorInfo(), 1));
                switch ($qn) {
                    case 1:
                        $msger = 'La inspección ya existé';
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
            self::validPermissions(12);
            $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            // if ($params['is_update'] == "0") {
            $qn = 1;
            $query = "UPDATE inspeccion SET
            id_dependencia =:id_dependencia, tipo_inspeccion = :tipo_inspeccion, responsable = :responsable,
            fecha_ini = :fecha_ini, fecha_fin = :fecha_fin, modalidad = :is_presencial, archivo = :archivo,
            estado=:estado, motivo=:motivo, observacion = :observacion, fecha_inicio_suspencion=:fecha_inicio_suspencion,
		    fecha_final_suspencion=:fecha_final_suspencion, fecha_=:fecha_, sede=:sede, descripcion=:descripcion
            WHERE id_inspeccion = :id_inspeccion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_inspeccion',  $params['id_inspeccion']);
            $stmt->bindValue(':id_dependencia',  $params['dependencia']);
            $stmt->bindValue(':tipo_inspeccion',  (int)$params['tipo_inspeccion'], PDO::PARAM_INT);
            $stmt->bindValue(':responsable',  $params['entidad']);
            $stmt->bindValue(':fecha_ini', $params['fecha_inicio']);
            $stmt->bindValue(':fecha_fin', $params['fecha_finalizacion']);
            $stmt->bindValue(':is_presencial', $params['modalidad']);
            $stmt->bindValue(':estado', $params['estado']);
            $stmt->bindValue(':motivo', $params['motivo']);
            $stmt->bindValue(':observacion', $params['observacion']);
            $stmt->bindValue(':descripcion', $params['descripcion']);
            $stmt->bindValue(':sede', $params['sede']);
            $stmt->bindValue(':archivo', $params['archivo']);
		// Majjul
		$stmt->bindValue(':fecha_inicio_suspencion', $params['fecha_inicio_suspencion'] == "" ? NULL : $params['fecha_inicio_suspencion']);
            $stmt->bindValue(':fecha_final_suspencion', $params['fecha_final_suspencion'] == "" ? NULL : $params['fecha_final_suspencion']);
            $stmt->bindValue(':fecha_', $params['fecha_'] == "" ? NULL : $params['fecha_']);
            $stmt->execute();

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
            self::validPermissions(12);
            $params =  json_decode($_POST['general'], 1);

            $query = "DELETE FROM capacitacionesprogramadas_funcionario 
            WHERE id_inspeccion = :id_capacitacion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
            $stmt->execute();

            $query = "DELETE FROM capacitaciones_programadas 
            WHERE id_inspeccion = :id_capacitacion";
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
            self::validPermissions(14);
            $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            $id = $params['id_inspeccion'];

            $querygetConsecutivo = "SELECT consecutivo FROM trazabilidad_inspecciones
            WHERE id_inspeccion = $id ORDER by consecutivo DESC LIMIT 1";
            $stmtGetConsecutivo = $db->prepare($querygetConsecutivo);
            $stmtGetConsecutivo->execute();
            $valueConsecutivo = $stmtGetConsecutivo->fetch(PDO::FETCH_ASSOC);

            $qn = 1;
            $query = "INSERT INTO trazabilidad_inspecciones (
                id_inspeccion,
                estado,
                observacion,
                fecha_inicio_suspencion,
                fecha_final_suspencion,
                fecha_,
                consecutivo
                )
                VALUES (
                    :id_inspeccion, 
                    :estado,
                    :observacion,
                    :fecha_inicio_suspencion,
                    :fecha_final_suspencion,
                    :fecha_,
                    :consecutivo
                )";
            
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_inspeccion', $id);
            $stmt->bindValue(':estado', $params['estado'] == "" ? "PENDIENTE" : $params['estado']);
            $stmt->bindValue(':observacion', $params['observacion']);
            $stmt->bindValue(':fecha_inicio_suspencion', $params['fecha_inicio_suspencion'] == "" ? NULL : $params['fecha_inicio_suspencion']);
            $stmt->bindValue(':fecha_final_suspencion', $params['fecha_final_suspencion'] == "" ? NULL : $params['fecha_final_suspencion']);
            $stmt->bindValue(':fecha_', $params['fecha_'] == "" ? NULL : $params['fecha_']);
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
                        $msger = 'La actividad ya existé';
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
