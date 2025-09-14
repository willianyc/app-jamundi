<?php

/*
* Librerias: recapchalib.php
* include('core/bin/functions/conexion.php');
* 
*/


abstract class seguridadSocialMD
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
            self::validPermissions(2);
            $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            $fecha_retiro = $params['fecha_registro'] == "" ? NULL : $params['fecha_registro'];
            $query = "SELECT id_seguridadsocial
             FROM seguridad_social  
             WHERE id_funcionario = $params[id_funcionario];";
            $stmt = $db->query($query);
            $stmt->execute();
            $has_seguridadsocial = $stmt->fetch(PDO::FETCH_ASSOC);
            if(true) {
                $qn = 1;
                $query = "INSERT INTO seguridad_social (fecha_retiro, id_funcionario,id_eps,id_fondopension,
                        id_arl, id_fondocesantias, id_cajacompensacion, salario)
                        VALUES (:fecha_retiro, :id_funcionario, :id_eps, :id_fondopension,
                        :id_arl, :id_fondocesantias, :id_cajacompensacion, :salario)";
                $stmt = $db->prepare($query);
                $stmt->bindValue(':fecha_retiro',  $fecha_retiro);
                $stmt->bindValue(':id_funcionario', $params['id_funcionario']);
                $stmt->bindValue(':id_eps', $params['entidad_salud']=="" ? NULL : $params['entidad_salud']);
                $stmt->bindValue(':id_fondopension', $params['administradora_pension'] == "" ? NULL : $params['administradora_pension']);
                $stmt->bindValue(':id_arl', $params['arl']=="" ? NULL : $params['arl']);
                $stmt->bindValue(':id_fondocesantias', $params['fondo_cesantias'] == "" ? NULL : $params['fondo_cesantias']);
                $stmt->bindValue(':id_cajacompensacion', $params['caja_compensacion']=="" ? NULL : $params['caja_compensacion']);
                $stmt->bindValue(':salario', $params['salario']  == '' ? 0 : $params['salario']);
                $stmt->execute();
                $MSG ="Exito al guardar";
            } else {
                $query = "UPDATE seguridad_social SET fecha_retiro = :fecha_retiro,id_eps = :id_eps,id_fondopension = :id_fondopension,
                        id_arl = :id_arl, id_fondocesantias = :id_fondocesantias, id_cajacompensacion = :id_cajacompensacion, salario = :salario
                        WHERE id_seguridadsocial = :id_seguridadsocial";
                $stmt = $db->prepare($query);
                $stmt->bindValue(':fecha_retiro', $fecha_retiro );
                $stmt->bindValue(':id_eps', $params['entidad_salud']=="" ? NULL : $params['entidad_salud']);
                $stmt->bindValue(':id_fondopension', $params['administradora_pension'] == "" ? NULL : $params['administradora_pension']);
                $stmt->bindValue(':id_arl', $params['arl']=="" ? NULL : $params['arl']);
                $stmt->bindValue(':id_fondocesantias', $params['fondo_cesantias'] == "" ? NULL : $params['fondo_cesantias']);
                $stmt->bindValue(':id_cajacompensacion', $params['caja_compensacion']=="" ? NULL : $params['caja_compensacion']);
                $stmt->bindValue(':salario',$params['salario']);
                $stmt->bindValue(':id_seguridadsocial', $has_seguridadsocial['id_seguridadsocial'] == "" ? NULL : $has_seguridadsocial['id_seguridadsocial']);
                $resp = $stmt->execute();
                $MSG ="Exito al actualizar";
            }

            // if(!empty($fecha_retiro)){
            //     $query = "UPDATE funcionarios SET is_activo = 0 WHERE id_funcionario = $params[id_funcionario]";
            //     $stmt = $db->query($query);
            //     $stmt->execute();
            //     $query = "INSERT INTO retiro (acta_informe, examen_medico, comprovante_devolucion, hoja_sigep, declaracion_sigep,
            //         carnet_servidor, fecha_recepcion, id_funcionario, id_causaretiro, tipo_retiro, otro, paz_salvo, fecha_retiro)
            //         VALUES (:acta_informe, :examen_medico, :comprovante_devolucion, :hoja_sigep, :declaracion_sigep,
            //          :carnet_servidor, :fecha_recepcion, :id_funcionario, :id_causaretiro, :tipo_retiro, :otra_causa, :paz_salvo, :fecha_retiro)";
            //     $stmt = $db->prepare($query);
            //     $stmt->bindValue(':acta_informe',  'NO APLICA');
            //     $stmt->bindValue(':examen_medico', 'NO APLICA');
            //     $stmt->bindValue(':comprovante_devolucion', 'NO APLICA');
            //     $stmt->bindValue(':hoja_sigep', 'NO APLICA');
            //     $stmt->bindValue(':declaracion_sigep', 'NO APLICA');
            //     $stmt->bindValue(':carnet_servidor', 'NO APLICA');
            //     $stmt->bindValue(':fecha_recepcion', null);
            //     $stmt->bindValue(':id_funcionario', $params['id_funcionario']);
            //     $stmt->bindValue(':tipo_retiro', 'Retiro');
            //     $stmt->bindValue(':id_causaretiro', 16);
            //     $stmt->bindValue(':otra_causa', '');
            //     $stmt->bindValue(':paz_salvo', '');
            //     $stmt->bindValue(':fecha_retiro', $params['fecha_registro']);
            //     $stmt->execute();
  
            // }

            $db->commit();
            $data = array('success' => base64_encode($MSG));
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
    public static function EliminarSeguridadSocial()
    {
        $db = conexion();
        /*return array('success' => base64_encode('correcto'));
      die();*/
       self::validPermissions(2);
        $db->beginTransaction();
        $data = array('error' => base64_encode('Error: [#' . time() . ']'));
        try {
            $query = "DELETE FROM seguridad_social WHERE id_seguridadsocial = $_POST[id_seguridadsocial];";
            $stmt = $db->query($query);
            $stmt->execute();
            $db->commit();
            $data = array('success' => base64_encode('Seguridad social eliminada correctamente'));
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
