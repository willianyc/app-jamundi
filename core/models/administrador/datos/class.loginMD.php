<?php


class loginMD
{

  public static function Login()
  {
    
    $db = conexion();

    $data = array(
      'error' => base64_encode('Error...')
    );
    try {
      $data = json_decode($_POST['general'], 1);
      // $password = md5(sha1($_POST['password']));
      // $usuario = 'J@mundi';
      $password = md5(sha1($data['pass']));
      $query = "SELECT id_usuario, usuario, `password`, nivel FROM usuario WHERE usuario = :usuario AND `password` = :pass;";
      
      $stmt = $db->prepare($query);
      $stmt->bindValue(':usuario', $data['usuario']);
      $stmt->bindValue(':pass', $password);
      $stmt->execute();

      if ($stmt->rowCount() < 1) {
        $data = array(
          'error' => base64_encode('Usuario o contraseña incorrectos, por favor verifiquelos Ahora')
        );
      } else {
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

        $query = "SELECT id_opcion, id_opcionpadre, id_usuario,is_write FROM opciones_asignadas WHERE id_usuario = :id_usuario";
        $stmt = $db->prepare($query);
        $stmt->bindValue(':id_usuario', $usuario['id_usuario']);
        $stmt->execute();
        $opciones = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $_SESSION['mod1'] = [];
        $_SESSION['mod2'] = [];
        $_SESSION['mod3'] = [];
        $_SESSION['mod4'] = [];
        $_SESSION['mod5'] = [];
        $_SESSION['mod6'] = [];
        $_SESSION['mod7'] = [];
        $_SESSION['mod8'] = [];
        $_SESSION['id_usuario'] =  $usuario['id_usuario'];
        $_SESSION['permisos'] = [];
        
        foreach ($opciones as $mod) {
          
          if($mod['id_opcionpadre'] == 1){
             array_push( $_SESSION['mod1'],$mod['id_opcion']);
             array_push($_SESSION['permisos'], [
              "opcion"=>$mod['id_opcion'],
              "permiso"=>$mod['is_write'],
             ]);
          }

          if($mod['id_opcionpadre'] == 2){
             array_push( $_SESSION['mod2'],$mod['id_opcion']);
             array_push($_SESSION['permisos'], [
              "opcion"=>$mod['id_opcion'],
              "permiso"=>$mod['is_write'],
             ]);
          }
          if($mod['id_opcionpadre'] == 3){
             array_push( $_SESSION['mod3'],$mod['id_opcion']);
             array_push($_SESSION['permisos'], [
              "opcion"=>$mod['id_opcion'],
              "permiso"=>$mod['is_write'],
             ]);
          }
          if($mod['id_opcionpadre'] == 4){
             array_push( $_SESSION['mod4'],$mod['id_opcion']);
             array_push($_SESSION['permisos'], [
              "opcion"=>$mod['id_opcion'],
              "permiso"=>$mod['is_write'],
             ]);
          }
          if($mod['id_opcionpadre'] == 5){
             array_push( $_SESSION['mod5'],$mod['id_opcion']);
             array_push($_SESSION['permisos'], [
              "opcion"=>$mod['id_opcion'],
              "permiso"=>$mod['is_write'],
             ]);
          }
          if($mod['id_opcionpadre'] == 6){
             array_push( $_SESSION['mod6'],$mod['id_opcion']);
             array_push($_SESSION['permisos'], [
              "opcion"=>$mod['id_opcion'],
              "permiso"=>$mod['is_write'],
             ]);
          }
          if($mod['id_opcionpadre'] == 7){
             array_push( $_SESSION['mod7'],$mod['id_opcion']);
             array_push($_SESSION['permisos'], [
              "opcion"=>$mod['id_opcion'],
              "permiso"=>$mod['is_write'],
             ]);
          }
          if($mod['id_opcionpadre'] == 8){
             array_push( $_SESSION['mod8'],$mod['id_opcion']);
             array_push($_SESSION['permisos'], [
              "opcion"=>$mod['id_opcion'],
              "permiso"=>$mod['is_write'],
             ]);
          }



        }
        // if ($data['usuario'] == $usuario and $data['pass'] == $password) {
        $_SESSION['usuario'] = 'siithjam';
        $_SESSION['usuario_on'] =  $usuario['usuario'];
        $_SESSION['password'] = '#6p134xQ)vfJJY$';
        $_SESSION['nivel'] = $usuario['nivel'];

        // } else {
        //   return $data = array(
        //     'error' => base64_encode('Datos incorrectos')
        //   );
        // }
        $data = array(
          'success' => base64_encode('success')
        );
      }
    } catch (Exception $err) {
      $data = array(
        'error' => base64_encode("sss")
      );
    }
    
    return $data;
  }
}
