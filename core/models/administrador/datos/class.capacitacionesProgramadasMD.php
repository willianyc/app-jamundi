<?php

/*
* Librerias: recapchalib.php
* include('core/bin/functions/conexion.php');
* 
*/


abstract class capacitacionProgramadaMD
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
            if($_SESSION['nivel'] == 3){
                throw new Exception("El usuario <b>$_SESSION[usuario_on]</b> no tiene permisos para realizar esta acción", 6001);
            }
            $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            $qn = 1;
            $query = "INSERT INTO capacitaciones_programadas (nombre, identificacion,
                    fecha_ini, fecha_fin, is_presencial, direccion, recursos, entidad_actividad,
                    valor_total, archivo, consecutivo)
                    VALUES (:nombre, :identificacion, :fecha_ini, :fecha_fin, :is_presencial,
                    :direccion, :recursos, :entidad_actividad, :valorTotal, :archivo, :consecutivo)";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':nombre',  $params['nombre']);
            $stmt->bindValue(':identificacion',  $params['identificacion']);
            $stmt->bindValue(':fecha_ini', $params['fecha_inicio']);
            $stmt->bindValue(':fecha_fin', $params['fecha_finalizacion']);
            $stmt->bindValue(':is_presencial', $params['modalidad']);
            $stmt->bindValue(':direccion', $params['direccion']);
            $stmt->bindValue(':recursos', $params['recursos']);
            $stmt->bindValue(':valorTotal', $params['valorTotal'] == "" ? NULL : $params['valorTotal']);
            $stmt->bindValue(':entidad_actividad', $params['entidad']);
            $stmt->bindValue(':archivo', $params['archivo']);
            $stmt->bindValue(':consecutivo', (int)$params['consecutivo'], PDO::PARAM_INT);
            $stmt->execute();
            $id_capacitacionprogramada = $db->lastInsertId();

            $funcionariosAsignados = $params['funcionariosAsignados'];
            foreach ($funcionariosAsignados as $funcionarioAsignado) {
                $qn = 2;
                $query = "INSERT INTO capacitacionesprogramadas_funcionario (id_funcionario, id_capacitacionprogramada, fecha_asignacion)
                        VALUES (:id_funcionario, :id_capacitacion, :fecha_asignacion)";
                $stmt = $db->prepare($query);
                $stmt->bindValue(':id_funcionario',  $funcionarioAsignado['id_funcionario']);
                $stmt->bindValue(':id_capacitacion',  $id_capacitacionprogramada);
                $stmt->bindValue(':fecha_asignacion',  $params['fecha_asignacion']);
                $stmt->execute();
            }

            $gruposObjetivo = $params['gruposObjetivo'];
            foreach ($gruposObjetivo as $grupoObjetivo) {
                $qn = 2;
                $query = "INSERT INTO grupo_objetivo (id_capacitacionprogramada, id_cargo)
                VALUES (:id_capacitacionprogramada, :id_cargo)";
                $stmt = $db->prepare($query);
                $stmt->bindValue(':id_cargo',  (int)$grupoObjetivo['id_cargo'], PDO::PARAM_INT);
                $stmt->bindValue(':id_capacitacionprogramada', $id_capacitacionprogramada);
                $stmt->execute();
            }

            $queryGetId = "SELECT id_capacitacionprogramada FROM capacitaciones_programadas ORDER by id_capacitacionprogramada DESC LIMIT 1";
            $stmtGetId = $db->prepare($queryGetId);
            $stmtGetId->execute();
            $id_capacitacion_programada = $stmtGetId->fetch(PDO::FETCH_ASSOC);
            
            $queryTrazabilidad = "INSERT INTO trazabilidad_capacitaciones_programadas (id_capacitacionprogramada, consecutivo) VALUES (:id_capacitacionprogramada, 1)";
            $stmtTrazabilidad = $db->prepare($queryTrazabilidad);
            $stmtTrazabilidad->bindValue(':id_capacitacionprogramada', $id_capacitacion_programada['id_capacitacionprogramada']);
            $stmtTrazabilidad->execute();

            $db->commit();
            $data = array('success' => base64_encode('Registro guardado con éxito'));
            // Logger::guardar_accion($db, 'EMPLEADO', 'CREACION DEL TERCERO ID ');
        } catch (PDOException  $e) {
            if (isset($stmt) && $stmt->errorInfo()[1] == '1062') {
                error_log('*E: terceroMD[54]: ' . print_r($stmt->errorInfo(), 1));
                switch ($qn) {
                    case 1:
                        $msger = 'La capacitación ya existé';
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
            $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            // if ($params['is_update'] == "0") {
            $qn = 1;
		// Majjul ->Cambio en el query
            $query = "UPDATE capacitaciones_programadas SET nombre = :nombre, identificacion =:identificacion,
                 fecha_ini = :fecha_ini, fecha_fin =:fecha_fin, is_presencial =:is_presencial, archivo=:archivo,
                direccion =:direccion, recursos = :recursos, valor_total=:valorTotal,
                estado=:estado, motivo=:motivo, observacion=:observacion,entidad_actividad =:entidad_actividad,
	          fecha_inicio_suspencion=:fecha_inicio_suspencion, fecha_final_suspencion=:fecha_final_suspencion,
                fecha_=:fecha_
                WHERE id_capacitacionprogramada = :id_capacitacion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':nombre',  $params['nombre']);
            $stmt->bindValue(':identificacion',  $params['identificacion']);
            $stmt->bindValue(':fecha_ini', $params['fecha_inicio']);
            $stmt->bindValue(':fecha_fin', $params['fecha_finalizacion']);
            $stmt->bindValue(':is_presencial', $params['modalidad']);
            $stmt->bindValue(':direccion', $params['direccion']);
            $stmt->bindValue(':recursos', $params['recursos']);
            $stmt->bindValue(':valorTotal', $params['valorTotal'] == "" ? NULL : $params['valorTotal']);
            $stmt->bindValue(':entidad_actividad', $params['entidad']);
            $stmt->bindValue(':estado', $params['estado']);
            $stmt->bindValue(':motivo', $params['motivo']);
            $stmt->bindValue(':archivo', $params['archivo']);
            $stmt->bindValue(':observacion', $params['observacion']);
            $stmt->bindValue(':id_capacitacion',  (int)$params['id_capacitacion'], PDO::PARAM_INT);
            // Majjul
		    $stmt->bindValue(':fecha_inicio_suspencion', $params['fecha_inicio_suspencion'] == "" ? NULL : $params['fecha_inicio_suspencion']);
            $stmt->bindValue(':fecha_final_suspencion', $params['fecha_final_suspencion'] == "" ? NULL : $params['fecha_final_suspencion']);
            $stmt->bindValue(':fecha_', $params['fecha_'] == "" ? NULL : $params['fecha_']);
            $stmt->execute();
            // $id_capacitacion = $db->lastInsertId();

            $query = "DELETE FROM capacitacionesprogramadas_funcionario 
            WHERE id_capacitacionprogramada = :id_capacitacion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
            $stmt->execute();

            if ($params['estado'] == "REALIZADO") {
                // } elseif ($params['estado'] == "REALIZADO") {
                $funcionariosAsignados = json_decode($params['funcionariosAsignados'], 1);
                // self::rules_crear($_POST);
                foreach ($funcionariosAsignados as $funcionarioAsignado) {
                    $qn = 2;
                    $query = "INSERT INTO capacitacionesprogramadas_funcionario (id_funcionario, id_capacitacionprogramada, fecha_asignacion, asistencia, nota, aprobo)
                     VALUES (:id_funcionario, :id_capacitacionprogramada, :fecha_asignacion, :asistencia, :nota, :aprobo)"; 
                    $stmt = $db->prepare($query);
                    $stmt->bindValue(':id_funcionario',  $funcionarioAsignado['id_funcionario']);
                    $stmt->bindValue(':id_capacitacionprogramada',  $params['id_capacitacion']);
                    $stmt->bindValue(':fecha_asignacion',  $params['fecha_asignacion']);
                    $stmt->bindValue(':asistencia', $funcionarioAsignado['asistencia']);                    
                    $stmt->bindValue(':nota',  $funcionarioAsignado['nota']);
                    $stmt->bindValue(':aprobo',  $funcionarioAsignado['aprobo'] == "" ? NULL : $funcionarioAsignado['aprobo']);
                    $stmt->execute();
                }
            }

            $gruposObjetivo = $params['gruposObjetivo'];
            $query = "DELETE FROM grupo_objetivo 
            WHERE id_capacitacionprogramada = :id_capacitacion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
            $stmt->execute();
            foreach ($gruposObjetivo as $grupoObjetivo) {
                $qn = 2;
                $query = "INSERT INTO grupo_objetivo (id_capacitacionprogramada, id_cargo)
                VALUES (:id_capacitacionprogramada, :id_cargo)";
                $stmt = $db->prepare($query);
                $stmt->bindValue(':id_cargo',  (int)$grupoObjetivo['id_cargo'], PDO::PARAM_INT);
                $stmt->bindValue(':id_capacitacionprogramada', (int)$params['id_capacitacion'], PDO::PARAM_INT);
                $stmt->execute();
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

            $query = "DELETE FROM capacitacionesprogramadas_funcionario 
            WHERE id_capacitacionprogramada = :id_capacitacion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
            $stmt->execute();

            $query = "DELETE FROM grupo_objetivo 
            WHERE id_capacitacionprogramada = :id_capacitacion";
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
            $stmt->execute();

            $query = "DELETE FROM capacitaciones_programadas 
            WHERE id_capacitacionprogramada = :id_capacitacion";
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
            $id = $params['id_capacitacionprogramada'];

            $querygetConsecutivo = "SELECT consecutivo FROM trazabilidad_capacitaciones_programadas
            WHERE id_capacitacionprogramada = $id ORDER by consecutivo DESC LIMIT 1";
            $stmtGetConsecutivo = $db->prepare($querygetConsecutivo);
            $stmtGetConsecutivo->execute();
            $valueConsecutivo = $stmtGetConsecutivo->fetch(PDO::FETCH_ASSOC);

            $qn = 1;
            $query = "INSERT INTO trazabilidad_capacitaciones_programadas (
                id_capacitacionprogramada,
                estado,
                observacion,
                fecha_inicio_suspencion,
                fecha_final_suspencion,
                fecha_,
                consecutivo
                )
                VALUES (
                    :id_capacitacionprogramada, 
                    :estado,
                    :observacion,
                    :fecha_inicio_suspencion,
                    :fecha_final_suspencion,
                    :fecha_,
                    :consecutivo
                )";
            
            $stmt = $db->prepare($query);
            $stmt->bindValue(':id_capacitacionprogramada', $id);
            $stmt->bindValue(':estado', $params['estado'] == "" ? "PENDIENTE" : $params['estado']);
            $stmt->bindValue(':observacion', $params['observacion'] == "" ? NULL : $params['observacion']);
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
