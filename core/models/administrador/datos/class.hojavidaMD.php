<?php

class hojavidaMD
{

  public static function crearFuncionario()
  {

    $db = conexion();
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));



    try {

      self::validPermissions(1);
      // $_POST = json_decode($_POST['general'], 1);
      $location = '';
	  $locationFoto = '';
      if (!empty($_FILES['archivo_lab']['name'])) {
        $filename = str_replace(" ", "_", $_FILES['archivo_lab']['name']);
        $directorio = "views/archivos/hojavida/";
        $location = $directorio . $filename;

        $imgType = pathinfo($location, PATHINFO_EXTENSION);
        $filename = str_replace("$imgType", time() . '_' . uniqid(), $filename) . '.' . $imgType;
        $imgSize = $_FILES['archivo_lab']['size'];
        $location = $directorio . $filename;

        if ($imgSize > 5242880)
          return array('error_arc' => base64_encode('El archivo no puede ser mayor a 5MB'));

        if ($imgType != "pdf" && $imgType != "docx" && $imgType != "doc")
          return array('error_arc' => base64_encode('El archivo tiene que ser tipo pdf o word'));

        if (strlen($location) > 150)
          return array('error_arc' => base64_encode('La longitud del nombre no puede ser mayor a ' . (120 - strlen($directorio)) . ' caracteres'));

        if (!move_uploaded_file($_FILES['archivo_lab']['tmp_name'], $location))
          return array('error_arc' => base64_encode('Error al subir el archivo'));
      }
	  // file de fotos de funcionarios
	  
	   if (!empty($_FILES['archivo']['name'])) {
        $filename = str_replace(" ", "_", $_FILES['archivo']['name']);
        $directorio = "views/archivos/fotos/";
        $locationFoto = $directorio . $filename;

        $imgType = pathinfo($locationFoto, PATHINFO_EXTENSION);
        $filename = str_replace("$imgType", time() . '_' . uniqid(), $filename) . '.' . $imgType;
        $imgSize = $_FILES['archivo']['size'];
        $locationFoto = $directorio . $filename;

        if ($imgSize > 5242880)
          return array('error_arc' => base64_encode('El archivo no puede ser mayor a 5MB'));

        if ($imgType != "JPG" && $imgType != "jpg" && $imgType != "JPEG" && $imgType != "jpeg" && $imgType != "PNG" && $imgType != "png")
          return array('error_arc' => base64_encode('El archivo tiene que ser tipo JPEG o PNG'));

        if (strlen($locationFoto) > 150)
          return array('error_arc' => base64_encode('La longitud del nombre no puede ser mayor a ' . (120 - strlen($directorio)) . ' caracteres'));

        if (!move_uploaded_file($_FILES['archivo']['tmp_name'], $locationFoto))
          return array('error_arc' => base64_encode('Error al subir el archivo'));
      }else{
		  	$locationFoto = $_POST['foto'];
	  }	  

      $id_f = $_POST['id_funcionario'] == '' ? 0 : $_POST['id_funcionario'];
	  

      $query = "SELECT id_funcionario FROM funcionarios WHERE id_funcionario = $id_f";
      $stmt = $db->query($query);
      $stmt->execute();
      $proscesos = $_POST['is_procesodisciplinario'];
      if ($stmt->rowCount() < 1) {
        $query = "INSERT INTO funcionarios(tipo_documento, documento, nombre, apellidos, is_actualizado, 
        fecha_ingreso_nombra, profesion, genero, direccion, id_municipio, email, celular, fecha_nacimiento, 
        edad, condicion_medica, id_sede, id_etnia, id_rh, id_dependencia, id_tipovinculacion, 
        id_niveleducativo, id_nivelfuncionario, id_victimaviolencia, id_codigo, madre_padre, 
        cabeza_familia, is_viviendapropia, estado_vivienda, id_cargo, id_grado, posgrado, ano_ingreso, 
        is_procesodisciplinario, numero_proceso_dis, fecha_proceso_dis, numero_posesion, fecha_posesion, 
        fecha_resolucion, numero_resolucion, modo_trabajo, archivo_laboral, archivo, id_estadocivil, pais_nacimiento, ciudad_nacimiento, otro_municipio, is_activo)
                        VALUE(:tipo_documento, :documento, :nombre, :apellido, :is_actualizado, 
                        :fecha_ingreso_nombra, :profesion, :genero, :direccion, :id_municipio, :email, 
                        :celular, :fecha_nacimiento, :edad, :condicion_medica, :id_sede, :id_etnia, :id_rh,
                         :id_dependencia, :id_tipovinculacion, :id_niveleducativo, :id_nivelfuncionario,  
                         :id_victimaviolencia, :id_codigo, :madre_padre, :cabeza_familia, :is_viviendapropia, 
                         :estado_vivienda, :id_cargo, :id_grado, :posgrado, :ano_ingreso, :is_procesodisciplinario, 
                         :numero_proceso_dis, :fecha_proceso_dis, 
                         :numero_posesion, :fecha_posesion, :fecha_resolucion, :numero_resolucion, :modo_trabajo, 
                         :archivo_lab, :archivo, :id_estadocivil, :pais_nacimiento, :ciudad_nacimiento, :otro_municipio, :is_activo);";
        $stmt = $db->prepare($query);
      } else {
        $id_funcionario = $stmt->fetch(PDO::FETCH_ASSOC);
        $query = "UPDATE funcionarios SET tipo_documento = :tipo_documento, nombre = :nombre, apellidos = :apellido, 
        is_actualizado = :is_actualizado, fecha_ingreso_nombra = :fecha_ingreso_nombra, profesion = :profesion, 
        direccion = :direccion, id_municipio = :id_municipio, email = :email, celular = :celular, 
        fecha_nacimiento = :fecha_nacimiento, edad = :edad, condicion_medica = :condicion_medica, 
        id_sede = :id_sede, id_etnia = :id_etnia, id_rh = :id_rh, id_dependencia = :id_dependencia, 
        id_tipovinculacion = :id_tipovinculacion, id_niveleducativo = :id_niveleducativo, id_nivelfuncionario = :id_nivelfuncionario, 
        id_victimaviolencia = :id_victimaviolencia, id_codigo = :id_codigo, madre_padre = :madre_padre, cabeza_familia = :cabeza_familia, 
        is_viviendapropia = :is_viviendapropia, estado_vivienda = :estado_vivienda, id_cargo = :id_cargo, id_grado = :id_grado, 
        posgrado = :posgrado, ano_ingreso = :ano_ingreso, is_procesodisciplinario = :is_procesodisciplinario, 
        numero_proceso_dis = :numero_proceso_dis, fecha_proceso_dis = :fecha_proceso_dis, documento =:documento, 
        numero_posesion = :numero_posesion, fecha_posesion = :fecha_posesion, fecha_resolucion = :fecha_resolucion, 
        numero_resolucion = :numero_resolucion, modo_trabajo = :modo_trabajo,  genero = :genero, archivo_laboral = :archivo_lab, archivo = :archivo, id_estadocivil = :id_estadocivil, pais_nacimiento = :pais_nacimiento, ciudad_nacimiento = :ciudad_nacimiento, otro_municipio = :otro_municipio, is_activo = :is_activo 
        WHERE id_funcionario = :id_funcionario";
        $stmt = $db->prepare($query);
        $stmt->bindValue(':id_funcionario', $_POST['id_funcionario']);
      }
      $id_municipio = $_POST['municipio']=="" ? NULL: $_POST['municipio'];
      $fecha_nacimiento = $_POST['fecha_nacimiento']=="" ? NULL: $_POST['fecha_nacimiento'];
      $fecha_posesion = $_POST['fecha_posesion']=="" ? NULL: $_POST['fecha_posesion'];
      $fecha_resolucion = $_POST['fecha_resolucion']=="" ? NULL: $_POST['fecha_resolucion'];
      $id_sede = $_POST['sede']=="" ? NULL: $_POST['sede'];
      $id_etnia = $_POST['etnia']=="" ? NULL: $_POST['etnia'];
      $id_rh = $_POST['tipo_sanguineo']=="" ? NULL: $_POST['tipo_sanguineo'];
      $id_cargo = $_POST['cargo_propiedad']=="" ? NULL: $_POST['cargo_propiedad'];
      $id_grado = $_POST['grado'] == "" || $_POST['grado'] == "null" ? NULL: $_POST['grado'];
      $id_dependencia = $_POST['dependencia']== "" ? NULL: $_POST['dependencia'];
      $id_tipovinculacion = $_POST['tipo_vinculacion']== "" ? NULL: $_POST['tipo_vinculacion'];
      $id_niveleducativo = $_POST['nivel_educativo']== "" ? NULL: $_POST['nivel_educativo'];
      $id_nivelfuncionario = $_POST['nivel_funcionario']== "" ? NULL: $_POST['nivel_funcionario'];
      $id_victimaviolencia = $_POST['victima_violencia']== "" ? NULL: $_POST['victima_violencia'];
      $codigo = $_POST['codigo']== "" ? NULL: $_POST['codigo'];
      $tipo_documento = $_POST['tipo_documento']== "" ? NULL: $_POST['tipo_documento'];
      $estado_civil = $_POST['estado_civil']== "" ? NULL: $_POST['estado_civil'];
      $pais_nacimiento = $_POST['pais_nacimiento']=="" ? NULL: $_POST['pais_nacimiento']; //majjul
      $ciudad_nacimiento = $_POST['ciudad_nacimiento']=="" ? NULL: $_POST['ciudad_nacimiento']; //majjul
      $otro_municipio = $_POST['otro_municipio']=="" ? NULL: $_POST['otro_municipio']; //majjul
      $is_activo = $_POST['estado']; //majjul

      $stmt->bindValue(':genero', $_POST['genero']);
      $stmt->bindValue(':tipo_documento', $tipo_documento);
      $stmt->bindValue(':documento', $_POST['documento']);
      $stmt->bindValue(':nombre', $_POST['nombre']);
      $stmt->bindValue(':apellido', $_POST['apellido']);
      $stmt->bindValue(':is_actualizado', (int)$_POST['is_actualizado'], PDO::PARAM_INT);
      $stmt->bindValue(':fecha_ingreso_nombra', $_POST['fecha_ingreso_nombra']);
      $stmt->bindValue(':profesion', $_POST['profesion']);
      $stmt->bindValue(':direccion', $_POST['direccion']);
      $stmt->bindValue(':id_municipio',$id_municipio);
      $stmt->bindValue(':email', $_POST['email']);
      $stmt->bindValue(':celular', $_POST['celular']);
      $stmt->bindValue(':fecha_nacimiento', $fecha_nacimiento);
      $stmt->bindValue(':edad', $_POST['edad']);
      $stmt->bindValue(':condicion_medica', $_POST['condicion_medica']);
      $stmt->bindValue(':id_sede', $id_sede);
      $stmt->bindValue(':id_etnia', $id_etnia);
      $stmt->bindValue(':id_rh', $id_rh);
      $stmt->bindValue(':id_dependencia',$id_dependencia);
      $stmt->bindValue(':id_tipovinculacion', $id_tipovinculacion);
      $stmt->bindValue(':id_niveleducativo', $id_niveleducativo);
      $stmt->bindValue(':id_nivelfuncionario', $id_nivelfuncionario);
      $stmt->bindValue(':id_victimaviolencia', $id_victimaviolencia);
      $stmt->bindValue(':id_codigo', $codigo);
      $stmt->bindValue(':madre_padre', $_POST['madre_padre']);
      $stmt->bindValue(':cabeza_familia', $_POST['cabeza_familia']);
      $stmt->bindValue(':is_viviendapropia', (int)$_POST['is_viviendapropia'], PDO::PARAM_INT);
      $stmt->bindValue(':estado_vivienda', $_POST['estado_vivienda']);
      $stmt->bindValue(':id_cargo', $id_cargo);
      $stmt->bindValue(':id_grado', $id_grado);
      $stmt->bindValue(':posgrado', $_POST['posgrado']);
      $stmt->bindValue(':ano_ingreso', $_POST['ingreso']);
      $stmt->bindValue(':is_procesodisciplinario', (int)$_POST['is_procesodisciplinario'], PDO::PARAM_INT);
      $stmt->bindValue(':numero_proceso_dis', $_POST['numero_proceso_dis']);
      $stmt->bindValue(':fecha_proceso_dis', empty($_POST['fecha_proceso_dis']) ? null : $_POST['fecha_proceso_dis']);
      $stmt->bindValue(':numero_posesion', $_POST['num_posesion']);
      $stmt->bindValue(':fecha_posesion', $fecha_posesion);
      $stmt->bindValue(':fecha_resolucion', $fecha_resolucion);
      $stmt->bindValue(':numero_resolucion', $_POST['num_resolucion']);
      $stmt->bindValue(':modo_trabajo', $_POST['modo_trabajo']);
      $stmt->bindValue(':archivo_lab', $location);
	    $stmt->bindValue(':archivo', $locationFoto);
      $stmt->bindValue(':id_estadocivil', $estado_civil);
      $stmt->bindValue(':pais_nacimiento', $pais_nacimiento); //majjul
      $stmt->bindValue(':ciudad_nacimiento', $ciudad_nacimiento); //majjul
      $stmt->bindValue(':otro_municipio', $otro_municipio); //majjul
      $stmt->bindValue(':is_activo', (int)$is_activo, PDO::PARAM_INT); //majjul

      $stmt->execute();
      $id_funcionario2 = $db->lastInsertId();
      if (!empty($id_funcionario)) {
        $id_funcionario2 = $id_funcionario['id_funcionario'];
      }
      $experiencia = self::crearExperiencia($db, $_POST['experiencia_ant'], $id_funcionario2);
      $familia = self::crearNucleoFamiliar($db, $_POST['parientes'], $id_funcionario2);
      if (!empty($experiencia['error']))
        $data = $experiencia;
      else if (!empty($familia['error']))
        $data = $familia;
      else {
        if (!empty($id_funcionario))
          $data = array('success' => base64_encode('funcionario ha sido modificado correctamente'));
        else
          $data = array('success' => base64_encode('funcionario registrado correctamente'));
        $db->commit();
      }

      // $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode($e->getMessage()));
    }
    catch (Exception $e) {
      if ($e->getCode() > 999) {
          $data = array('error' => base64_encode($e->getMessage()));
      } else {
          error_log('+** Error Exception: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . PHP_EOL . 'ERROR: [vista]: ' . print_r($data, 1)); //Captura el error en logger, y si hay otro tambien
          $data = array('error' => base64_encode($e->getMessage()));
      }
  }
    return $data;
  }

  private static function upload_archivo($img, $required = false)
  {
    self::validPermissions(1);
    if (!$required && empty($_FILES[$img])) return '';
    include('core/bin/functions/subdomain.php');
    $ruta = 'views/archivos/hojavida/';

    $filename = $_FILES[$img]['name'];
    $location = $ruta . $filename;
    /* Location */
    $imgType = pathinfo($location, PATHINFO_EXTENSION);
    $filename = preg_replace("/-$imgType\$/", time() . '_' . uniqid(), $filename) . '.' . $imgType;
    $imgSize = $_FILES[$img]['size'];
    $location = $ruta . $filename;

    // Check image format
    if (
      $imgType != "pdf" && $imgType != "xls"
      && $imgType != "xlsx" && $imgType != "docx"
    )
      return array('error' => base64_encode('El formato del archivo no es valido'));
    // Validamos el tamaño de la imagen
    if ($imgSize > 5242880) //5MB
      return array('error' => base64_encode('El tamaño del archivo no puede ser mayor a 5MB'));
    //Validamos el tamaño del nombre
    if (strlen($location) > 155)
      return array('error' => base64_encode('La longitud del nombre no puede ser mayor a ' . (155 - strlen($ruta)) . ' caracteres'));

    /* Upload file */
    // error_log(print_r($location,1));
    // error_log(print_r($_FILES[$img]['tmp_name'],1));
    if (move_uploaded_file($_FILES[$img]['tmp_name'], $location))
      return $location;
    //error_log(print_r($location,1));
    return array('error' => base64_encode('Error al subir la imagen'));
  }

  public static function crearExperiencia($conn, $params, $funcionario)
  {
    try {
      self::validPermissions(1);
      $params = json_decode($params);
      foreach ($params as $experiencia) {
        $query = "SELECT * FROM experiencia_previa WHERE id_experienciaprevia = $experiencia->id_experiencia;";
        $stmt = $conn->query($query);
        $stmt->execute();
        $insert = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($experiencia->nombre_emp) && empty($insert)) {
          $query = "INSERT INTO experiencia_previa(empresa, cargo, fecha_ingreso, fecha_retiro, funciones, id_funcionario) VALUE(:empresa, :cargo, :fecha_ingreso, :fecha_retiro, :funciones, :id_funcionario);";
          $stmt = $conn->prepare($query);
          $stmt->bindValue(':empresa', $experiencia->nombre_emp);
          $stmt->bindValue(':cargo', $experiencia->cargo_exp);
          $stmt->bindValue(':fecha_ingreso', $experiencia->fecha_ingreso_exp);
          $stmt->bindValue(':fecha_retiro', $experiencia->fecha_retiro_exp);
          $stmt->bindValue(':funciones', $experiencia->funciones_exp);
          $stmt->bindValue(':id_funcionario', $funcionario);
          $stmt->execute();
        } else {
          $query = "UPDATE experiencia_previa SET empresa = :empresa, cargo = :cargo, fecha_ingreso = :fecha_ingreso, fecha_retiro = :fecha_retiro, funciones = :funciones WHERE id_experienciaprevia = :id_experienciaprevia;";
          $stmt = $conn->prepare($query);
          $stmt->bindValue(':id_experienciaprevia', $experiencia->id_experiencia);
          $stmt->bindValue(':empresa', $experiencia->nombre_emp);
          $stmt->bindValue(':cargo', $experiencia->cargo_exp);
          $stmt->bindValue(':fecha_ingreso', $experiencia->fecha_ingreso_exp);
          $stmt->bindValue(':fecha_retiro', $experiencia->fecha_retiro_exp);
          $stmt->bindValue(':funciones', $experiencia->funciones_exp);
          $stmt->execute();
        }
      }
    } catch (Exception $err) {
      error_log($err->getMessage());
      return array('error' => base64_encode($err->getMessage()));
    }
    return;
  }

  public static function crearNucleoFamiliar($conn, $params, $funcionario)
  {
    try {
      self::validPermissions(1);
      $params = json_decode($params);
      foreach ($params as $familiar) {
        $query = "SELECT * FROM nucleo_familiar WHERE id_nucleofamiliar = $familiar->id_familia;";
        $stmt = $conn->query($query);
        $stmt->execute();
        $insert = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($familiar->nombre_p) && empty($insert)) {
          $query = "INSERT INTO nucleo_familiar(nombres, apellidos, edad, fecha_nacimiento, id_parentesco, is_emergencia,id_funcionario, contacto, contacto_2, parentesco) VALUE(:nombre_p, :apellido_p, :edad_p, :fecha_nac_p,:parentesco_p,  :is_emergencia, :id_funcionario, :contacto, :contacto_2, :parentesco_otro);";
          $stmt = $conn->prepare($query);
          $stmt->bindValue(':nombre_p', $familiar->nombre_p);
          $stmt->bindValue(':apellido_p', $familiar->apellido_p);
          $stmt->bindValue(':edad_p', $familiar->edad_p);
          $stmt->bindValue(':parentesco_p', $familiar->parentesco_p);
          $stmt->bindValue(':fecha_nac_p', $familiar->fecha_nac_p);
          $stmt->bindValue(':is_emergencia', (int)$familiar->emergencia, PDO::PARAM_INT);
          $stmt->bindValue(':id_funcionario', $funcionario);
          $stmt->bindValue(':contacto', $familiar->contacto_emergencia);
          $stmt->bindValue(':contacto_2', $familiar->contacto_emergencia_2);
          $stmt->bindValue(':parentesco_otro', $familiar->parentesco_otro);
          $stmt->execute();
        } else {
          $query = "UPDATE nucleo_familiar SET nombres = :nombre_p, apellidos = :apellido_p, edad = :edad_p, fecha_nacimiento = :fecha_nac_p, 
          id_parentesco = :parentesco_p, is_emergencia = :is_emergencia, id_funcionario = :id_funcionario, contacto = :contacto,
          contacto_2 = :contacto_2, parentesco = :parentesco_otro WHERE id_nucleofamiliar = :id_nucleofamiliar;";
          $stmt = $conn->prepare($query);
          $stmt->bindValue(':id_nucleofamiliar', $familiar->id_familia);
          $stmt->bindValue(':nombre_p', $familiar->nombre_p);
          $stmt->bindValue(':apellido_p', $familiar->apellido_p);
          $stmt->bindValue(':edad_p', $familiar->edad_p);
          $stmt->bindValue(':parentesco_p', $familiar->parentesco_p);
          $stmt->bindValue(':fecha_nac_p', $familiar->fecha_nac_p);
          $stmt->bindValue(':is_emergencia', (int)$familiar->emergencia, PDO::PARAM_INT);
          $stmt->bindValue(':id_funcionario', $funcionario);
          $stmt->bindValue(':contacto', $familiar->contacto_emergencia);
          $stmt->bindValue(':contacto_2', $familiar->contacto_emergencia_2);
          $stmt->bindValue(':parentesco_otro', $familiar->parentesco_otro);
          $stmt->execute();
        }
      }
    } catch (Exception $err) {
      error_log($err->getMessage());
      return array('error' => base64_encode($err->getMessage()));
    }
    return;
  }
  public static function eliminarfuncionario()
  {
    self::validPermissions(1);
    $db = conexion();
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $id_funcionario = (int)$_POST['id_funcionario'];
      $stmt = $db->query("SELECT * FROM experiencia_previa WHERE id_funcionario = $id_funcionario");
      $stmt->execute();
      if ($stmt->rowCount() > 0) {
        $query = "DELETE FROM experiencia_previa WHERE id_funcionario = $id_funcionario;";
        $stmt = $db->query($query);
        $stmt->execute();
      }

      $stmt = $db->query("SELECT * FROM incapacidad WHERE id_funcionario = $id_funcionario");
      $stmt->execute();
      if ($stmt->rowCount() > 0) {
        $query = "DELETE FROM incapacidad WHERE id_funcionario = $id_funcionario;";
        $stmt = $db->query($query);
        $stmt->execute();
      }

      $stmt = $db->query("SELECT * FROM nucleo_familiar WHERE id_funcionario = $id_funcionario");
      $stmt->execute();
      if ($stmt->rowCount() > 0) {
        $query = "DELETE FROM nucleo_familiar WHERE id_funcionario = $id_funcionario;";
        $stmt = $db->query($query);
        $stmt->execute();
      }

      $stmt = $db->query("SELECT * FROM movilidad WHERE id_funcionario = $id_funcionario");
      $stmt->execute();
      if ($stmt->rowCount() > 0) {
        $query = "DELETE FROM movilidad WHERE id_funcionario = $id_funcionario;";
        $stmt = $db->query($query);
        $stmt->execute();
      }

      $stmt = $db->query("SELECT * FROM retiro WHERE id_funcionario = $id_funcionario");
      $stmt->execute();
      if ($stmt->rowCount() > 0) {
        $query = "DELETE FROM retiro WHERE id_funcionario = $id_funcionario;";
        $stmt = $db->query($query);
        $stmt->execute();
      }

      $stmt = $db->query("SELECT * FROM seguridad_social WHERE id_funcionario = $id_funcionario");
      $stmt->execute();
      if ($stmt->rowCount() > 0) {
        $query = "DELETE FROM seguridad_social WHERE id_funcionario = $id_funcionario;";
        $stmt = $db->query($query);
        $stmt->execute();
      }

      $stmt = $db->query("SELECT * FROM actividad_funcionario WHERE id_funcionario = $id_funcionario");
      $stmt->execute();
      if ($stmt->rowCount() > 0) {
        $query = "DELETE FROM actividad_funcionario WHERE id_funcionario = $id_funcionario;";
        $stmt = $db->query($query);
        $stmt->execute();
      }

      $stmt = $db->query("SELECT * FROM capacitacion_funcionario WHERE id_funcionario = $id_funcionario");
      $stmt->execute();
      if ($stmt->rowCount() > 0) {
        $query = "DELETE FROM capacitacion_funcionario WHERE id_funcionario = $id_funcionario;";
        $stmt = $db->query($query);
        $stmt->execute();
      }

      $query = "DELETE FROM funcionarios WHERE id_funcionario = $id_funcionario;";
      $stmt = $db->query($query);
      $stmt->execute();
      $db->commit();

      $data = array('success' => base64_encode('Funcionario eliminado correctamente'));
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
