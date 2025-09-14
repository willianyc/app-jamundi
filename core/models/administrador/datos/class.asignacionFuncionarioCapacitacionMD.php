<?php

/*
* Librerias: recapchalib.php
* include('core/bin/functions/conexion.php');
* 
*/


abstract class asignarFuncionarioMD
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
            $funcionariosAsignados = $params['funcionariosAsignados'];
            // self::rules_crear($_POST);
            foreach ($funcionariosAsignados as $funcionarioAsignado) {
                $qn = 1;
                $query = "INSERT INTO capacitacion_funcionario (id_funcionario, id_capacitacion, fecha_asignacion)
                        VALUES (:id_funcionario, :id_capacitacion, :fecha_asignacion)";
                $stmt = $db->prepare($query);
                $stmt->bindValue(':id_funcionario',  $funcionarioAsignado['id_funcionario']);
                $stmt->bindValue(':id_capacitacion',  $params['id_capacitacion']);
                $stmt->bindValue(':fecha_asignacion',  $params['fecha_asignacion']);
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
                        $msger = 'La asignación ya existé';
                        break;
                }
                $data = array('error' => base64_encode($msger));
            } else {
                error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . ' - [query]: ' . PHP_EOL . $query);
                $data = array('error' => base64_encode($e->getMessage()));
            }
            $db->rollback();
        } catch (SeccionGumpClassExeptions $e) {
            $data = $e->getOptions();
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
}
