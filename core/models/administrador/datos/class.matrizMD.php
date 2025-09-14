<?php

/*
* Librerias: recapchalib.php
* include('core/bin/functions/conexion.php');
* 
*/


abstract class matrizMD
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
            self::validPermissions(13);
            $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            $qn = 1;
            
            if($params['estado']!=="CERRADO") $params['fechaCierre'] = null; //majjul
            
            $query = "INSERT INTO matriz (is_entidad, lugar, sede, dependencia, denominacion, fecha, origen_hallazgo, descripcion_hallazgo,
                     elemento_interviene, recomendacion, tipo_accion, responsable, fechapropuesta_cierre,
                     accion_tomada, estado, fecha_seguimiento, avance, documento_soporte, fecha_cierre )
                    VALUES (:is_entidad, :lugar, :sede, :dependencia, :denominacion, :fecha, :origen_hallazgo, :descripcion_hallazgo,
                     :elemento_interviene, :recomendacion, :tipo_accion, :responsable, :fechapropuesta_cierre,
                     :accion_tomada, :estado, :fecha_seguimiento, :avance, :documento_soporte, :fecha_cierre)";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':is_entidad', (int)$params['is_entidad'], PDO::PARAM_INT);
            $stmt->bindValue(':lugar',  $params['lugar']);
            $stmt->bindValue(':sede',  $params['sede']);
            $stmt->bindValue(':dependencia',  (int)$params['dependencia'], PDO::PARAM_INT);
            $stmt->bindValue(':denominacion',  (int)$params['denominacion'], PDO::PARAM_INT);
            $stmt->bindValue(':fecha',  $params['fecha']);
            $stmt->bindValue(':origen_hallazgo', $params['origenHallazgo']);
            $stmt->bindValue(':descripcion_hallazgo', $params['descripcionHallazgo']);
            $stmt->bindValue(':elemento_interviene', $params['elementoSiguiente']);
            $stmt->bindValue(':recomendacion', $params['recomendacion']);
            $stmt->bindValue(':tipo_accion', $params['tipoAccion']);
            $stmt->bindValue(':responsable', $params['responsable']);
            $stmt->bindValue(':fechapropuesta_cierre', $params['fechaPropuestaCierre']);
            $stmt->bindValue(':accion_tomada', $params['accionTomada']);
            $stmt->bindValue(':estado', $params['estado']);
            $stmt->bindValue(':fecha_seguimiento', $params['fechaSeguimiento']);
            $stmt->bindValue(':avance', $params['avance']);
            $stmt->bindValue(':documento_soporte', $params['archivo']);
            $stmt->bindValue(':fecha_cierre', $params['fechaCierre']);
            $stmt->execute();
            $data = array('success' => base64_encode('Registro guardado con éxito'));
            
            $queryGetId = "SELECT id_matriz FROM matriz ORDER by id_matriz DESC LIMIT 1";
            $stmtGetId = $db->prepare($queryGetId);
            $stmtGetId->execute();
            $id_matriz = $stmtGetId->fetch(PDO::FETCH_ASSOC);
            
            $queryTrazabilidad = "INSERT INTO trazabilidad_matrices (
                id_matriz,
                tipo_accion,
                responsable,
                fechapropuesta_cierre,
                accion_tomada,
                estado,
                fecha_cierre,
                fecha_seguimiento,
                avance,
                documento_soporte,
                consecutivo
                ) VALUES (
                    :id_matriz, 
                    :tipo_accion,
                    :responsable,
                    :fechapropuesta_cierre,
                    :accion_tomada,
                    :estado,
                    :fecha_cierre,
                    :fecha_seguimiento,
                    :avance,
                    :documento_soporte,
                    1    
                )";
            $stmtTrazabilidad = $db->prepare($queryTrazabilidad);
            $stmtTrazabilidad->bindValue(':id_matriz', $id_matriz['id_matriz']);
            $stmtTrazabilidad->bindValue(':tipo_accion', $params['tipoAccion']);
            $stmtTrazabilidad->bindValue(':responsable', $params['responsable']);
            $stmtTrazabilidad->bindValue(':fechapropuesta_cierre', $params['fechaPropuestaCierre']);
            $stmtTrazabilidad->bindValue(':accion_tomada', $params['accionTomada']);
            $stmtTrazabilidad->bindValue(':estado', $params['estado']);
            $stmtTrazabilidad->bindValue(':fecha_cierre', $params['fechaCierre']);
            $stmtTrazabilidad->bindValue(':fecha_seguimiento', $params['fechaSeguimiento']);
            $stmtTrazabilidad->bindValue(':avance', $params['avance']);
            $stmtTrazabilidad->bindValue(':documento_soporte', $params['archivo']);
            $stmtTrazabilidad->execute();

            $db->commit();

            // Logger::guardar_accion($db, 'EMPLEADO', 'CREACION DEL TERCERO ID ');
        } catch (PDOException  $e) {
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
            self::validPermissions(13);
            $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            // if ($params['is_update'] == "0") {
            $qn = 1;
            $query = "UPDATE matriz SET is_entidad = :is_entidad, lugar = :lugar, sede = :sede, dependencia = :dependencia, denominacion = :denominacion, fecha = :fecha, 
                      origen_hallazgo = :origen_hallazgo, descripcion_hallazgo = :descripcion_hallazgo, elemento_interviene = :elemento_interviene, 
                      recomendacion = :recomendacion, tipo_accion = :tipo_accion, responsable =:responsable, fechapropuesta_cierre = :fechapropuesta_cierre, 
                      accion_tomada = :accion_tomada, estado = :estado, fecha_seguimiento = :fecha_seguimiento, avance = :avance, documento_soporte = :documento_soporte, 
                      fecha_cierre = :fecha_cierre  WHERE id_matriz = :id_matriz";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_matriz',  $params['id_matriz']);
            $stmt->bindValue(':is_entidad', (int)$params['is_entidad'], PDO::PARAM_INT);
            $stmt->bindValue(':lugar',  $params['lugar']);
            $stmt->bindValue(':sede',  $params['sede']);
            $stmt->bindValue(':dependencia',  (int)$params['dependencia'], PDO::PARAM_INT);
            $stmt->bindValue(':denominacion',  (int)$params['denominacion'], PDO::PARAM_INT);
            $stmt->bindValue(':fecha',  $params['fecha']);
            $stmt->bindValue(':origen_hallazgo', $params['origenHallazgo']);
            $stmt->bindValue(':descripcion_hallazgo', $params['descripcionHallazgo']);
            $stmt->bindValue(':elemento_interviene', $params['elementoSiguiente']);
            $stmt->bindValue(':recomendacion', $params['recomendacion']);
            $stmt->bindValue(':tipo_accion', $params['tipoAccion']);
            $stmt->bindValue(':responsable', $params['responsable']);
            $stmt->bindValue(':fechapropuesta_cierre', $params['fechaPropuestaCierre']);
            $stmt->bindValue(':accion_tomada', $params['accionTomada']);
            $stmt->bindValue(':estado', $params['estado']);
            $stmt->bindValue(':fecha_seguimiento', $params['fechaSeguimiento']);
            $stmt->bindValue(':avance', $params['avance']);
            $stmt->bindValue(':documento_soporte', $params['archivo']);
            $stmt->bindValue(':fecha_cierre', $params['fechaCierre']);
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
        try {
            self::validPermissions(13);
            $params =  json_decode($_POST['general'], 1);

            $query = "DELETE FROM matriz 
            WHERE id_matriz = :id_matriz";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_matriz',  $params['id_matriz']);
            $stmt->execute();

            $db->commit();
            $data = array('success' => base64_encode('Matriz eliminada con éxito'));
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
            $id = $params['id_matriz'];
            if($params['estado']!=="CERRADO") $params['fecha_cierre'] = null;

            $querygetConsecutivo = "SELECT consecutivo FROM trazabilidad_matrices
            WHERE id_matriz = $id ORDER by consecutivo DESC LIMIT 1";
            $stmtGetConsecutivo = $db->prepare($querygetConsecutivo);
            $stmtGetConsecutivo->execute();
            $valueConsecutivo = $stmtGetConsecutivo->fetch(PDO::FETCH_ASSOC);

            $qn = 1;
            $query = "INSERT INTO trazabilidad_matrices (
                id_matriz,
                tipo_accion,
                responsable,
                fechapropuesta_cierre,
                accion_tomada,
                estado,
                fecha_cierre,
                fecha_seguimiento,
                avance,
                documento_soporte,
                consecutivo
                ) VALUES (
                    :id_matriz, 
                    :tipo_accion,
                    :responsable,
                    :fechapropuesta_cierre,
                    :accion_tomada,
                    :estado,
                    :fecha_cierre,
                    :fecha_seguimiento,
                    :avance,
                    :documento_soporte,
                    :consecutivo
                )";
            
            $stmtTrazabilidad = $db->prepare($query);
            $stmtTrazabilidad->bindValue(':id_matriz', $id);
            $stmtTrazabilidad->bindValue(':tipo_accion', $params['tipo_accion']);
            $stmtTrazabilidad->bindValue(':responsable', $params['responsable']);
            $stmtTrazabilidad->bindValue(':fechapropuesta_cierre', $params['fechapropuesta_cierre']);
            $stmtTrazabilidad->bindValue(':accion_tomada', $params['accion_tomada']);
            $stmtTrazabilidad->bindValue(':estado', $params['estado']);
            $stmtTrazabilidad->bindValue(':fecha_cierre', $params['fecha_cierre']);
            $stmtTrazabilidad->bindValue(':fecha_seguimiento', $params['fecha_seguimiento']);
            $stmtTrazabilidad->bindValue(':avance', $params['avance']);
            $stmtTrazabilidad->bindValue(':documento_soporte', $params['archivo']);
            $stmtTrazabilidad->bindValue(':consecutivo', ($valueConsecutivo['consecutivo'] + 1));
            $stmtTrazabilidad->execute();

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
