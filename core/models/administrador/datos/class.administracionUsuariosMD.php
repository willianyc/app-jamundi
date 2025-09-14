<?php
abstract class AdministracionUsuarioMD
{
    public static function crear()
    {

        try {
            if($_SESSION['nivel'] == 2){
                throw new Exception("El usuario <b>$_SESSION[usuario_on]</b> no tiene permisos para realizar esta acción", 6001);
            }
           
                $db = conexion();
                $tiempo_exec = time();
                $data = array('error' => base64_encode('consulta   ||   [#' . $tiempo_exec . ']'));
                $db->beginTransaction();
                $qn = 0;
                $params =  json_decode($_POST['general'], 1);
            // self::rules_crear($_POST);
            
            if(empty($params['opciones']) || empty($params['usuario']) || empty($params['password']) || empty($params['nivel'])){
                
                if(empty($params['usuario'])){
                    throw new Exception("Usuario es obligatorio", 6001);
                }
         
                if(empty($params['nivel'])){
                    throw new Exception("Nivel es obligatorio", 6001);
                }
                if(empty($params['opciones']) ){
                    throw new Exception("Debe asignar los modulos al usuario", 6001);
                }
            }
                $qn = 1;
                $password = md5(sha1($params['password']));

                $query = "SELECT id_usuario FROM usuario WHERE usuario = :usuario";
                $stmt = $db->prepare($query);
                $stmt->bindValue(':usuario', $params['usuario']);
                $stmt->execute();
                $data = $stmt->fetch(PDO::FETCH_ASSOC);

                $estado ="guardar";
            if(empty($data['id_usuario'])){
                if(empty($params['password'])){
                    throw new Exception("Contraseña es obligatoria", 6001);
                }
                $query = "INSERT INTO usuario (usuario, password, nivel)
                        VALUES (:usuario, :password, :nivel)";
                $stmt = $db->prepare($query);
                $stmt->bindValue(':usuario',  $params['usuario']);
                $stmt->bindValue(':password', $password);
                $stmt->bindValue(':nivel',  $params['nivel']);
                $stmt->execute();

                $id_usuario = $db->lastInsertId();
                $qn = 2;
                $modpadre ="";
                foreach ($params['opciones'] as $key => $mod) {
                $modpadre = substr($key, 3, 10);
                   foreach ($mod as $submod) {
                       $id_opcionpadre = intval($modpadre);
                       if($submod['permiso'] == "")
                       {throw new Exception("Todas las opciones deben tener sus permisos respectivos.", 6001);}

                    $query = "INSERT INTO opciones_asignadas (id_opcion, id_opcionpadre, id_usuario,is_write) VALUES (:id_opcion, :id_opcionpadre, :id_usuario,:is_write)";
                    $stmt = $db->prepare($query);
                    $stmt->bindValue(':id_opcion', $submod['opcion']);
                    $stmt->bindValue(':id_opcionpadre', $modpadre);
                    $stmt->bindValue(':id_usuario',   $id_usuario);
                    $stmt->bindValue(':is_write',   $submod['permiso']);
                    $stmt->execute();
                   }
                }
            }
            else{

                if(!empty($params['password'])){
                    $query="UPDATE usuario SET usuario=:usuario, password=:password, nivel=:nivel WHERE id_usuario =:id_usuario";
                    $stmt = $db->prepare($query);
                    $stmt->bindValue(':usuario',  $params['usuario']);
                    $stmt->bindValue(':id_usuario', $data['id_usuario']);
                    $stmt->bindValue(':password', $password);
                    $stmt->bindValue(':nivel',  $params['nivel']);
                    $stmt->execute();
                }else{
                    $query="UPDATE usuario SET usuario=:usuario, nivel=:nivel WHERE id_usuario =:id_usuario";
                    $stmt = $db->prepare($query);
                    $stmt->bindValue(':usuario',  $params['usuario']);
                    $stmt->bindValue(':id_usuario', $data['id_usuario']);
                    $stmt->bindValue(':nivel',  $params['nivel']);
                    $stmt->execute();
                }
                $estado ="Actualizado";
               

                $query = "DELETE FROM opciones_asignadas WHERE id_usuario=:id_usuario"; 
                $stmt = $db->prepare($query);
                $stmt->bindValue(':id_usuario', $data['id_usuario']);
                $stmt->execute();

                foreach ($params['opciones'] as $key => $mod) {
                    if(!empty($key)){
                    $modpadre = substr($key, 3, 10);
                    $id_opcionpadre = intval($modpadre);
                    if(!empty($id_opcionpadre)){
                       foreach ($mod as $submod) {
                           if(!empty($submod)){ 
                            if($submod['permiso'] == ""){throw new Exception("Todas las opciones deben tener sus permisos respectivos.", 6001);}
                                $query = "INSERT INTO opciones_asignadas (id_opcion, id_opcionpadre, id_usuario,is_write) VALUES (:id_opcion, :id_opcionpadre, :id_usuario,:is_write)";
                                $stmt = $db->prepare($query);
                                $stmt->bindValue(':id_opcion', $submod['opcion']);
                                $stmt->bindValue(':id_opcionpadre', $modpadre);
                                $stmt->bindValue(':id_usuario', $data['id_usuario']);
                                $stmt->bindValue(':is_write',   $submod['permiso']);
                                $stmt->execute();
                           }

                        }
                    }
                }
                }
            }
            $db->commit();
            $data = array('success' => base64_encode("Usuario <b>$params[usuario]</b> $estado con éxito"));
        } catch (PDOException  $e) {
            if (isset($stmt) && $stmt->errorInfo()[1] == '1062') {
                error_log('*E: usuario[54]: ' . print_r($stmt->errorInfo(), 1));
                switch ($qn) {
                    case 1:
                        $msger = 'Usuario ya existé';
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

    public static function modificarPass(){
        try {
           
            $db = conexion();
            $tiempo_exec = time();
            $data = array('error' => base64_encode('consulta   ||   [#' . $tiempo_exec . ']'));
            $qn = 0;
            $params =  json_decode($_POST['general'], 1);

            if(empty($params['password'])){
                throw new Exception("Contraseña es obligatoria", 6001);
            }
            $password = md5(sha1($params['password']));

            $query="UPDATE usuario SET password=:password WHERE id_usuario =:id_usuario";
                    $stmt = $db->prepare($query);
                    $stmt->bindValue(':id_usuario',  $_SESSION['id_usuario']);
                    $stmt->bindValue(':password', $password);
                    $stmt->execute();
            $data = array('success' => base64_encode("Se modifico su contraseña con éxito"));
        } catch (PDOException  $e) {
            if (isset($stmt) && $stmt->errorInfo()[1] == '1062') {
                error_log('*E: usuario[54]: ' . print_r($stmt->errorInfo(), 1));
                switch ($qn) {
                    case 1:
                        $msger = 'No se pudo modificar';
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
