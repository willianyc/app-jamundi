<?php

/*
* Librerias: recapchalib.php
* include('core/bin/functions/conexion.php');
* 
*/


abstract class actividadProgramadaMD
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
            self::validPermissions(14);
            $params =  json_decode($_POST['general'], 1);
            
            // self::rules_crear($_POST);
            
            $qn = 1;
            $query = "INSERT INTO actividades_programadas (nombre, identificacion,
                    fecha_ini, fecha_fin, is_presencial, direccion, recursos, entidad_actividad,
                    ciclo, valor_total, archivo, consecutivo)
                    VALUES (:nombre, :identificacion, :fecha_ini, :fecha_fin, :is_presencial,
                    :direccion, :recursos, :entidad_actividad, :ciclo, :valor_total, :archivo, :consecutivo)";
                    
            $stmt = $db->prepare($query);
            $stmt->bindValue(':nombre',  $params['nombre']);
            $stmt->bindValue(':identificacion',  $params['identificacion']);
            $stmt->bindValue(':fecha_ini', $params['fecha_inicio']);
            $stmt->bindValue(':fecha_fin', $params['fecha_finalizacion']);
            $stmt->bindValue(':is_presencial', $params['modalidad']);
            $stmt->bindValue(':direccion', $params['direccion']);
            $stmt->bindValue(':recursos', $params['recursos']);
            $stmt->bindValue(':ciclo', $params['ciclo']);
            $stmt->bindValue(':valor_total', $params['valorTotal']);
            $stmt->bindValue(':entidad_actividad', $params['entidad']);
            $stmt->bindValue(':archivo', $params['archivo']);
            $stmt->bindValue(':consecutivo', (int)$params['consecutivo'], PDO::PARAM_INT);
            $stmt->execute();
            $data = array('success' => base64_encode('Registro guardado con éxito'));
            
            $queryGetId = "SELECT id_actividadProgramada FROM actividades_programadas ORDER by id_actividadprogramada DESC LIMIT 1";
            $stmtGetId = $db->prepare($queryGetId);
            $stmtGetId->execute();
            $id_actividad_programada = $stmtGetId->fetch(PDO::FETCH_ASSOC);
            
            $queryTrazabilidad = "INSERT INTO trazabilidad_actividades_programadas (id_actividadprogramada, consecutivo) VALUES (:id_actividadprogramada, 1)";
            $stmtTrazabilidad = $db->prepare($queryTrazabilidad);
            $stmtTrazabilidad->bindValue(':id_actividadprogramada', $id_actividad_programada['id_actividadProgramada']);
            $stmtTrazabilidad->execute();
            
            $db->commit();


            //Por Consulta tema sobre Logger
            //Logger::guardar_accion($db, 'ACTIVIDADES PROGRAMADAS', 'CREACION ACTIVIDAD PROGRAMADA');
            
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
            self::validPermissions(14);
            $params =  json_decode($_POST['general'], 1);

            // self::rules_crear($_POST);
            // if ($params['is_update'] == "0") {
            $qn = 1;
		// Majjul ->Cambio en el query
            $query = "UPDATE actividades_programadas SET nombre = :nombre, identificacion =:identificacion,
                 fecha_ini = :fecha_ini, fecha_fin =:fecha_fin, is_presencial =:is_presencial,
                 direccion =:direccion, ciclo =:ciclo, recursos = :recursos, valor_total=:valor_total,
                 estado=:estado, motivo=:motivo, observacion=:observacion,entidad_actividad =:entidad_actividad,
		         fecha_inicio_suspencion=:fecha_inicio_suspencion, fecha_final_suspencion=:fecha_final_suspencion,
                 fecha_=:fecha_
                 WHERE id_actividadprogramada = :id_actividad";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':nombre',  $params['nombre']);
            $stmt->bindValue(':identificacion',  $params['identificacion']);
            $stmt->bindValue(':fecha_ini', $params['fecha_inicio']);
            $stmt->bindValue(':fecha_fin', $params['fecha_finalizacion']);
            $stmt->bindValue(':is_presencial', $params['modalidad']);
            $stmt->bindValue(':direccion', $params['direccion']);
            $stmt->bindValue(':ciclo', $params['ciclo']);
            $stmt->bindValue(':recursos', $params['recursos']);
            $stmt->bindValue(':valor_total', $params['valorTotal'] == "" ? NULL : $params['valorTotal']);
            $stmt->bindValue(':entidad_actividad', $params['entidad']);
            $stmt->bindValue(':estado', $params['estado']);
            $stmt->bindValue(':motivo', $params['motivo']);
            $stmt->bindValue(':observacion', $params['observacion']);
            $stmt->bindValue(':motivo', $params['observacion']);
            $stmt->bindValue(':id_actividad',  (int)$params['id_actividad'], PDO::PARAM_INT);

		    // Majjul
		    $stmt->bindValue(':fecha_inicio_suspencion', $params['fecha_inicio_suspencion'] == "" ? NULL : $params['fecha_inicio_suspencion']);
            $stmt->bindValue(':fecha_final_suspencion', $params['fecha_final_suspencion'] == "" ? NULL : $params['fecha_final_suspencion']);
            $stmt->bindValue(':fecha_', $params['fecha_'] == "" ? NULL : $params['fecha_']);
            $stmt->execute();
            
            // $id_actividad = $db->lastInsertId();

            $query = "DELETE FROM actividadesprogramadas_funcionario 
            WHERE id_actividadprogramada = :id_actividad";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_actividad',  $params['id_actividad']);
            $stmt->execute();
            if ($params['estado'] == "REALIZADO") {
                // } elseif ($params['estado'] == "REALIZADO") {
                $funcionariosAsignados = $params['funcionariosAsignados'];
                // self::rules_crear($_POST);
                foreach ($funcionariosAsignados as $funcionarioAsignado) {
                    $qn = 2;
                    $query = "INSERT INTO actividadesprogramadas_funcionario (id_funcionario, id_actividadprogramada, fecha_asignacion)
                            VALUES (:id_funcionario, :id_actividad, :fecha_asignacion)";
                    $stmt = $db->prepare($query);
                    $stmt->bindValue(':id_funcionario',  $funcionarioAsignado['id_funcionario']);
                    $stmt->bindValue(':id_actividad',  $params['id_actividad']);
                    $stmt->bindValue(':fecha_asignacion',  $funcionarioAsignado['fecha_asignacion']);
                    $stmt->execute();
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
            self::validPermissions(14);
            $params =  json_decode($_POST['general'], 1);

            $query = "DELETE FROM actividadesprogramadas_funcionario 
            WHERE id_actividadprogramada = :id_actividad";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_actividad',  $params['id_actividad']);
            $stmt->execute();

            $query = "DELETE FROM actividades_programadas 
            WHERE id_actividadprogramada = :id_actividad";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_actividad',  $params['id_actividad']);
            $stmt->execute();

            $db->commit();
            $data = array('success' => base64_encode('Actividad eliminada con éxito'));
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

    //Majjul
    public static function reporte()
    {
        $db = conexion();
        $tiempo_exec = time();
        $data = array('error' => base64_encode('consulta   ||   [#' . $tiempo_exec . ']'));
        $db->beginTransaction();
        $qn = 0;
        try {
            self::validPermissions(14);

            $query = "SELECT estado, COUNT(*) as cantidad 
            FROM `actividades_programadas`
            GROUP BY estado;";
            $stms= $db->prepare($query);
            $stms->execute();

            $db->commit();
            $data = array('success' => base64_encode('Reporte de actividades programadas.'));

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
            $id = $params['id_actividadprogramada'];

            $querygetConsecutivo = "SELECT consecutivo FROM trazabilidad_actividades_programadas
            WHERE id_actividadprogramada = $id ORDER by consecutivo DESC LIMIT 1";
            $stmtGetConsecutivo = $db->prepare($querygetConsecutivo);
            $stmtGetConsecutivo->execute();
            $valueConsecutivo = $stmtGetConsecutivo->fetch(PDO::FETCH_ASSOC);

            $qn = 1;
            $query = "INSERT INTO trazabilidad_actividades_programadas (
                id_actividadprogramada,
                estado,
                observacion,
                fecha_inicio_suspencion,
                fecha_final_suspencion,
                fecha_,
                consecutivo
                )
                VALUES (
                    :id_actividadprogramada, 
                    :estado,
                    :observacion,
                    :fecha_inicio_suspencion,
                    :fecha_final_suspencion,
                    :fecha_,
                    :consecutivo
                )";
            
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_actividadprogramada', $id);
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
