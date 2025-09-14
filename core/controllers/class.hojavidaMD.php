<?php


class hojavidaMD
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
      $query = "SELECT usuario, `password` FROM usuario WHERE usuario = :usuario AND `password` = :pass;";
      $stmt = $db->prepare($query);
      $stmt->bindValue(':usuario', $data['usuario']);
      $stmt->bindValue(':pass', $password);
      $stmt->execute();

      if ($stmt->rowCount() < 1) {
        $data = array(
          'error' => base64_encode('Usuario o contraseña incorrectos, por favor verifiquelos')
        );
      } else {
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);
        // if ($data['usuario'] == $usuario and $data['pass'] == $password) {
        $_SESSION['usuario'] = 'root';
        $_SESSION['password'] = '';
        $_SESSION['nivel'] = 1;
        return 'success';
        // } else {
        //   return $data = array(
        //     'error' => base64_encode('Datos incorrectos')
        //   );
        // }
        $data = array(
          'success' => base64_encode('')
        );
      }
    } catch (Exception $err) {
      $data = array(
        'error' => base64_encode($err->getMessage())
      );
    }
    return $data;
  }
}
