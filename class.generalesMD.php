<?php


abstract class generalesMD
{
  // Trae todos los dotos de los articulo



  public static function tipoIdentificacion()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    // $data = $_SESSION['usuario'];
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_tipodocumento, tipo_documento FROM tipo_documento;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar los tipo de documentos'));
    }
    return $data;
  }

  public static function rh()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_rh, rh FROM tipo_sanguineo;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar los tipos de sangre'));
    }
    return $data;
  }

  public static function etnia()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_etnia, etnia FROM etnia;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar las etnias'));
    }
    return $data;
  }

  public static function parentesco()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_parentesco, parentesco FROM parentesco;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el parentezco'));
    }
    return $data;
  }

  public static function nivel_educativo()
  {

    echo "<pre>";
    print_r($_POST);
    echo "</pre>";
    exit;
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_niveleducativo, nivel_educativo FROM nivel_educativo where is_activo = 1;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar los niveles educativos'));
    }
    return $data;
  }

  public static function vinculacion()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_tipovinculacion, tipo_vinculacion FROM tipo_vinculacion;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el tipo de vinculacion'));
    }
    return $data;
  }

 

  public static function nivel()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_nivelfuncionario, nivel FROM nivel_funcionario;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el nivel'));
    }
    return $data;
  }

  public static function cargo()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_cargo, cargo, fecha_upd, id_nivelfuncionario
       FROM cargos;";
      $stmt = $db->prepare($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el cargo'));
    }
    return $data;
  }

  public static function codigo()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      if (!empty($_GET['cargo']))
        $cargo = $_GET['cargo'];
      if (!empty($_POST['cargo']))
        $cargo = $_POST['cargo'];

      $query = "SELECT id_codigo, codigo FROM codigo WHERE id_cargo = :id_cargo;";
      $stmt = $db->prepare($query);
      $stmt->bindValue(':id_cargo', $cargo);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el codigo'));
    }
    return $data;
  }

  public static function grado()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      if (!empty($_GET['codigo']))
        $codigo = $_GET['codigo'];
      if (!empty($_POST['codigo']))
        $codigo = $_POST['codigo'];

      $query = "SELECT id_grado, grado FROM grado WHERE id_codigo = :id_codigo;";
      $stmt = $db->prepare($query);
      $stmt->bindValue(':id_codigo', $codigo);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el grado'));
    }
    return $data;
  }

  public static function dependencia()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_dependencia, dependencia FROM dependencias;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el grado'));
    }
    return $data;
  }

  public static function sede()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_sede, sede FROM sede;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el grado'));
    }
    return $data;
  }

  public static function seguridadSocial()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_funcionario FROM funcionarios WHERE documento = :cedula LIMIT 1;";
      $stmt = $db->prepare($query);
      $stmt->bindValue(':cedula', $_POST['cedula']);
      $stmt->execute();
      $funcionario = $stmt->fetch(PDO::FETCH_ASSOC);

      $query = "SELECT e.eps, fp.fondo_pension, a.arl, fc.fondo_cesantias, cc.caja_compensacion, ss.fecha_retiro
      FROM seguridad_social ss 
      LEFT JOIN eps e ON ss.id_eps = e.id_eps
      LEFT JOIN arl a ON ss.id_arl = a.id_arl
      LEFT JOIN fondo_cesantias fc ON ss.id_fondocesantias = fc.id_fondocesantias
      LEFT JOIN caja_compensacion cc ON ss.id_cajacompensacion = cc.id_cajacompensacion
      LEFT JOIN fondo_pension fp ON fp.id_fondopension = ss.id_fondopension
      WHERE ss.id_funcionario = :id_funcionario;";
      $stmt = $db->prepare($query);
      $stmt->bindValue(':id_funcionario', $funcionario['id_funcionario']);
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el grado'));
    }
    return $data;
  }

  public static function getFuncionario()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT f.*, c.cargo, ss.salario FROM funcionarios f
      LEFT JOIN nivel_funcionario nf ON f.id_nivelfuncionario = nf.id_nivelfuncionario
      LEFT JOIN cargos c ON c.id_nivelfuncionario = nf.id_nivelfuncionario AND c.id_cargo = f.id_cargo
      LEFT JOIN codigo co ON co.id_cargo = c.id_cargo ANd f.id_codigo = co.id_codigo
      LEFT JOIN grado g ON g.id_codigo = f.id_grado
      LEFT JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario
      WHERE f.documento = $_POST[documento];";
      $stmt = $db->query($query);
      // $stmt->bindValue(':documento', $_POST['documento']);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      if ($data == false)
        throw new Exception("El funcionario no existe", 6001);
      //   $data = array('error' => base64_encode('El funcionario no existe'));

    } catch (Exception $e) {
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function eps()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_eps, eps, descripcion, fecha_upd FROM eps;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar las eps'));
    }
    return $data;
  }
  public static function fondoPension()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_fondopension, fondo_pension, descripcion, fecha_upd FROM fondo_pension;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar las eps'));
    }
    return $data;
  }
  public static function fondoCesantias()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_fondocesantias, fondo_cesantias, fecha_upd FROM fondo_cesantias;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar las eps'));
    }
    return $data;
  }
  public static function arl()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_arl, arl, descripcion, fecha_upd FROM arl;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar las eps'));
    }
    return $data;
  }
  public static function caja_compensacion()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_cajacompensacion, caja_compensacion, fecha_upd FROM caja_compensacion;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar las eps'));
    }
    return $data;
  }
  public static function getFuncionarioSeguridadSocial()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $cond = '';
      $group = '';
      $inner = "INNER JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario";
      if (!empty($_POST['seguridadsocial']))
        $group = "GROUP BY f.id_funcionario";
      if (!empty($_POST['id_funcionario'])) {
        $cond = "WHERE f.id_funcionario = $_POST[id_funcionario];";
      } else if (!empty($_POST['documento'])) {
        $cond = "WHERE f.documento = $_POST[documento];";
        // $inner = "LEFT JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario";
      }
      if (!empty($_POST['nombre'])) {
        $cond = "WHERE f.documento LIKE '%$_POST[nombre]%' OR LOWER(concat(nombre, ' ', apellidos)) LIKE '%$_POST[nombre]%'";
      }

      $query = "SELECT f.id_funcionario, f.nombre, c.cargo, ss.salario, f.apellidos,f.documento, ss.id_seguridadsocial, ss.fecha_retiro, ss.id_eps, ss.id_fondopension, ss.id_arl, ss.id_fondocesantias, ss.id_cajacompensacion, fp.fondo_pension, a.arl, fc.fondo_cesantias, cc.caja_compensacion, e.eps, ss.fecha_creacion
      FROM funcionarios f   
      INNER JOIN cargos c ON f.id_cargo = c.id_cargo
      $inner 
      LEFT JOIN eps e ON e.id_eps = ss.id_eps 
      LEFT JOIN fondo_pension fp ON fp.id_fondopension = ss.id_fondopension 
      LEFT JOIN arl a ON a.id_arl = ss.id_arl 
      LEFT join fondo_cesantias fc ON fc.id_fondocesantias = ss.id_fondocesantias
      LEFT join caja_compensacion cc ON cc.id_cajacompensacion = ss.id_cajacompensacion
      $cond $group";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar las eps'));
    }
    return $data;
  }
  public static function getFuncionarioSeguridadSocial_2()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $cond = '';
      $group = '';
      $inner = "INNER JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario";
      if (!empty($_POST['seguridadsocial']))
        $group = "GROUP BY f.id_funcionario";
      if (!empty($_POST['id_funcionario'])) {
        $cond = "WHERE f.id_funcionario = $_POST[id_funcionario]";
      } else if (!empty($_POST['documento'])) {
        $cond = "WHERE f.documento = $_POST[documento]";
        $inner = "LEFT JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario";
      }
      if (!empty($_POST['nombre'])) {
        $cond = "WHERE f.documento LIKE '%$_POST[nombre]%' OR LOWER(concat(nombre, ' ', apellidos)) LIKE '%$_POST[nombre]%'";
      }

      $query = "SELECT f.id_funcionario, f.nombre, c.cargo, ss.salario, f.apellidos,f.documento, ss.id_seguridadsocial, ss.fecha_retiro, ss.id_eps, ss.id_fondopension, ss.id_arl, ss.id_fondocesantias, ss.id_cajacompensacion, fp.fondo_pension, a.arl, fc.fondo_cesantias, cc.caja_compensacion, e.eps, ss.fecha_creacion
      FROM funcionarios f   
      LEFT JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario
      LEFT JOIN cargos c ON f.id_cargo = c.id_cargo
        LEFT JOIN eps e ON e.id_eps = ss.id_eps 
        LEFT JOIN fondo_pension fp ON fp.id_fondopension = ss.id_fondopension 
        LEFT JOIN arl a ON a.id_arl = ss.id_arl 
        LEFT join fondo_cesantias fc ON fc.id_fondocesantias = ss.id_fondocesantias
        LEFT join caja_compensacion cc ON cc.id_cajacompensacion = ss.id_cajacompensacion
      $cond $group ORDER BY SS.fecha_creacion DESC";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar las eps'));
    }
    return $data;
  }
  public static function municipio()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_municipio, municipio FROM municipio
      ORDER BY municipio LIKE '%JAMUNDI%' DESC;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar los tipos de sangre'));
    }
    return $data;
  }
  public static function getSegSocial()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    $cond = '';
    if (!empty($_POST['documento']))
      $cond = "WHERE f.documento = $_POST[documento];";
    if (!empty($_POST['id_funcionario']))
      $cond = "WHERE f.id_funcionario = $_POST[id_funcionario];";
    try {
      $query = "SELECT ss.fecha_retiro, e.eps, fp.fondo_pension, a.arl, fs.fondo_cesantias, cc.caja_compensacion
      FROM seguridad_social ss
      LEFT JOIN funcionarios f ON ss.id_funcionario = f.id_funcionario
      LEFT JOIN eps e ON e.id_eps = ss.id_eps 
      LEFT JOIN fondo_pension fp ON fp.id_fondopension = ss.id_fondopension 
      LEFT JOIN arl a ON a.id_arl = ss.id_arl 
      LEFT join fondo_cesantias fs ON fs.id_fondocesantias = ss.id_fondocesantias
      LEFT join caja_compensacion cc ON cc.id_cajacompensacion = ss.id_cajacompensacion
      $cond";
      $stmt = $db->query($query);
      // $stmt->bindValue(':documento', $_POST['documento']);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      if ($data == false)
        throw new Exception("", 6001);
      //   $data = array('error' => base64_encode('El funcionario no existe'));

    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el grado'));
    }
    return $data;
  }
  public static function victimasViolencias()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_victimaviolencia, nombre FROM victima_violencia;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el victimas de violencia'));
    }
    return $data;
  }
  public static function getFamilia($conn, $id_funcionario)
  {
    $query = "SELECT * FROM nucleo_familiar WHERE id_funcionario = $id_funcionario";
    $stmt = $conn->query($query);
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    return '';
  }

  public static function getExperiencia($conn, $id_funcionario)
  {
    $query = "SELECT * FROM experiencia_previa WHERE id_funcionario = $id_funcionario";
    $stmt = $conn->query($query);
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    return '';
  }

  public static function getMovilidad($conn = null, $id_funcionario = null)
  {
    $query = "SELECT * FROM movilidad WHERE id_funcionario = $id_funcionario";
    $stmt = $conn->query($query);
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    return '';
  }
  public static function getIncapacidad()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $cond = ' GROUP BY i.id_incapacidad;';
      if (empty($_POST['id_incapacidad']) && !empty($_POST['id_funcionario'])) {
        $cond = "WHERE f.id_funcionario = $_POST[id_funcionario] GROUP BY i.id_incapacidad ORDER BY i.id_incapacidad ASC";
      } else if (!empty($_POST['nombre'])) {
        $cond = "WHERE f.documento LIKE '%$_POST[nombre]%' OR LOWER(concat(f.nombre, ' ', f.apellidos)) LIKE '%$_POST[nombre]%' ORDER BY m.id_movilidad DESC";
      } else if (!empty($_POST['cedula'])) {
        $cond = "WHERE f.documento = $_POST[cedula]";
      }

      $query = "SELECT i.*, f.*, c.cargo, m.salario
      FROM funcionarios f
      INNER JOIN incapacidad i ON i.id_funcionario = f.id_funcionario
      LEFT JOIN cargos c ON f.id_cargo = c.id_cargo
      LEFT JOIN movilidad m ON f.id_funcionario = m.id_funcionario
      $cond;";
      $stmt = $db->query($query);
      // $stmt->bindValue(':documento', $_POST['documento']);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      if ($data == false)
        throw new Exception("", 6001);
      //   $data = array('error' => base64_encode('El funcionario no existe'));

    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar la seguridad social'));
    }
    return $data;
  }
  public static function experiencia()
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT m.*, c.cargo FROM movilidad m 
      INNER JOIN funcionarios f ON f.id_funcionario = m.id_funcionario 
      INNER JOIN cargos c ON m.id_cargo = c.id_cargo
      WHERE f.id_funcionario = $_POST[id_funcionario]";
      $stmt = $db->query($query);
      $stmt->execute();
      if ($stmt->rowCount() > 0)
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      $data =  array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function causa_ret()
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error al cargar'));

    try {
      $query = "SELECT tipo_retiro FROM tipos_retiro WHERE id_tiposretiro = $_POST[retiro]";
      $stmt = $db->query($query);
      $stmt->execute();
      if ($stmt->rowCount() > 0) {
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      }
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar'));
    }
    return $data;
  }
  public static function getFuncionario_2($mes = null,  $filtro = null, $todos = null)
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $cond = '';
      $inner = '';
      $group = '';
      $campos = '';

      if (isset($_POST['nombre']))
        $group = 'GROUP BY f.id_funcionario';

      if (!empty($filtro))
        $_POST['nombre'] = $filtro;

      if (!empty($_POST['id_funcionario'])) {
        $cond = "WHERE f.id_funcionario = $_POST[id_funcionario] LIMIT 1";
        $group = '';
      } else if (!empty($_POST['nombre'])) {
        $cond = "WHERE f.documento LIKE '%$_POST[nombre]%' OR LOWER(concat(nombre, ' ', apellidos)) LIKE '%$_POST[nombre]%'";
      } else if (!empty($_POST['documento'])) {
        $cond = "WHERE f.documento = $_POST[documento] LIMIT 1";
        $group = '';
      } else if (!empty($_POST['mes'])) {
        $cond = "WHERE MONTH(f.fecha_nacimiento) = $_POST[mes]";
      } else if (!empty($mes)) {
        $cond = "WHERE MONTH(f.fecha_nacimiento) = $mes";
      }

      if (!empty($_POST['movilidad'])) {
        $inner = 'INNER JOIN movilidad mov ON f.id_funcionario = mov.id_funcionario';
        $group = 'GROUP BY f.id_funcionario';
      }
      if (!empty($_POST['retiro'])) {
        $inner = 'INNER JOIN retiro r ON f.id_funcionario = r.id_funcionario
        LEFT JOIN tipos_retiro cr ON cr.id_tiposretiro = r.id_causaretiro';
        $group = 'GROUP BY f.id_funcionario';
        $campos = ', r.tipo_retiro, cr.tipo_retiro as causa';
      }
      if (!empty($_POST['incapacidad'])) {
        $inner = 'INNER JOIN incapacidad i ON f.id_funcionario = i.id_funcionario';
        $group = 'GROUP BY f.id_funcionario';
        $campos = ', i.diagnostico, i.dias, i.fecha_ini, i.fecha_fin';
      }

      $query = "SELECT f.*, co.codigo, c.cargo, g.grado, ss.fecha_retiro, nf.nivel, se.sede,  ss.salario, de.dependencia, tv.tipo_vinculacion, ne.nivel_educativo, eps, fp.fondo_pension,
      m.municipio, ec.estado_civil, ts.rh $campos FROM funcionarios f
      LEFT JOIN nivel_funcionario nf ON f.id_nivelfuncionario = nf.id_nivelfuncionario
    LEFT JOIN cargos c ON c.id_nivelfuncionario = nf.id_nivelfuncionario AND c.id_cargo = f.id_cargo
    LEFT JOIN codigo co ON co.id_cargo = c.id_cargo ANd f.id_codigo = co.id_codigo
    LEFT JOIN grado g ON g.id_codigo = f.id_codigo AND g.id_grado = f.id_grado
    LEFT join sede se ON f.id_sede = se.id_sede
    LEFT join dependencias de ON f.id_dependencia = de.id_dependencia
    LEFT JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario
    LEFT join nivel_educativo ne ON f.id_niveleducativo = ne.id_niveleducativo
    LEFT join municipio m ON f.id_municipio = m.id_municipio
    LEFT join estado_civil ec ON f.id_estadocivil = ec.id_estadocivil
    LEFT join eps eps ON eps.id_eps = ss.id_eps
    LEFT join fondo_pension fp ON fp.id_fondopension  = ss.id_fondopension
    LEFT join tipo_sanguineo ts ON f.id_rh = ts.id_rh
    LEFT join tipo_vinculacion tv ON f.id_tipovinculacion = tv.id_tipovinculacion
    $inner
      $cond $group ORDER BY f.id_funcionario DESC";
      $stmt = $db->query($query);
      // $stmt->bindValue(':documento', $_POST['documento']);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      if ($data == false)
        throw new Exception("El funcionario no existe", 6001);
      else {
        $data[0]['nucleo_familia'] = self::getFamilia($db, $data[0]['id_funcionario']);
        $data[0]['experiencia'] = self::getExperiencia($db, $data[0]['id_funcionario']);
      }
      //   $data = array('error' => base64_encode('El funcionario no existe'));

    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        $data = $e->getMessage();
      // error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el funcionario'));
    }
    return $data;
  }
  public static function getFuncionario_3($mes = null,  $filtro = null, $todos = null)
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $cond = '';
      if (!empty($filtro))
        $_POST['nombre'] = $filtro;

      $inner = '';
      $group = 'GROUP BY f.id_funcionario';
      $campos = '';

      if (!empty($_POST['id_funcionario'])) {
        $cond = "WHERE f.id_funcionario = $_POST[id_funcionario] LIMIT 1";
      } else if (!empty($_POST['nombre'])) {
        $cond = "WHERE f.documento LIKE '%$_POST[nombre]%' OR LOWER(concat(nombre, ' ', apellidos)) LIKE '%$_POST[nombre]%'";
      } else if (!empty($_POST['documento'])) {
        $cond = "WHERE f.documento = $_POST[documento] LIMIT 1";
      } else if (!empty($_POST['mes'])) {
        $cond = "WHERE MONTH(f.fecha_nacimiento) = $_POST[mes]";
      } else if (!empty($mes)) {
        $cond = "WHERE MONTH(f.fecha_nacimiento) = $mes ";
      }
      // if (!empty($_POST['movilidad'])) {
      //   $inner = 'LEFT JOIN movilidad mov ON f.id_funcionario = mov.id_funcionario';
      //   $group = 'GROUP BY f.id_funcionario';
      // }
      // if (!empty($_POST['retiro'])) {
      //   $inner = 'LEFT JOIN retiro r ON f.id_funcionario = r.id_funcionario
      //   LEFT JOIN tipos_retiro cr ON cr.id_tiposretiro = r.id_causaretiro';
      //   $group = 'GROUP BY f.id_funcionario';
      //   $campos = ', r.tipo_retiro, cr.tipo_retiro as causa';
      // }
      // if (!empty($_POST['incapacidad'])) {
      //   $inner = 'LEFT JOIN incapacidad i ON f.id_funcionario = i.id_funcionario';
      //   $group = 'GROUP BY f.id_funcionario';
      //   $campos = ', i.diagnostico, i.dias, i.fecha_ini, i.fecha_fin';
      // }

      $query = "SELECT f.*, co.codigo, c.cargo, g.grado, ss.fecha_retiro, nf.nivel, se.sede,  ss.salario, de.dependencia, tv.tipo_vinculacion, ne.nivel_educativo, eps, fp.fondo_pension,
      m.municipio, ec.estado_civil, ts.rh, i.diagnostico, i.dias, i.fecha_ini, i.fecha_fin, r.tipo_retiro, cr.tipo_retiro as causa FROM funcionarios f
    LEFT JOIN nivel_funcionario nf ON f.id_nivelfuncionario = nf.id_nivelfuncionario
    LEFT JOIN cargos c ON c.id_nivelfuncionario = nf.id_nivelfuncionario AND c.id_cargo = f.id_cargo
    LEFT JOIN codigo co ON co.id_cargo = c.id_cargo ANd f.id_codigo = co.id_codigo
    LEFT JOIN grado g ON g.id_codigo = f.id_codigo AND g.id_grado = f.id_grado
    LEFT join sede se ON f.id_sede = se.id_sede
    LEFT join dependencias de ON f.id_dependencia = de.id_dependencia
    LEFT JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario
    LEFT join nivel_educativo ne ON f.id_niveleducativo = ne.id_niveleducativo
    LEFT join municipio m ON f.id_municipio = m.id_municipio
    LEFT join estado_civil ec ON f.id_estadocivil = ec.id_estadocivil
    LEFT join eps eps ON eps.id_eps = ss.id_eps
    LEFT JOIN incapacidad i ON f.id_funcionario = i.id_funcionario
    LEFT join fondo_pension fp ON fp.id_fondopension  = ss.id_fondopension
    LEFT JOIN retiro r ON f.id_funcionario = r.id_funcionario
    INNER JOIN movilidad mov ON f.id_funcionario = mov.id_funcionario
        LEFT JOIN tipos_retiro cr ON cr.id_tiposretiro = r.id_causaretiro
        LEFT join tipo_sanguineo ts ON f.id_rh = ts.id_rh
        LEFT join tipo_vinculacion tv ON f.id_tipovinculacion = tv.id_tipovinculacion
      $cond $group";
      $stmt = $db->query($query);
      // $stmt->bindValue(':documento', $_POST['documento']);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      if ($data == false)
        throw new Exception("El funcionario no existe", 6001);
      else {
        $data[0]['nucleo_familia'] = self::getFamilia($db, $data[0]['id_funcionario']);
        $data[0]['experiencia'] = self::getExperiencia($db, $data[0]['id_funcionario']);
      }
      //   $data = array('error' => base64_encode('El funcionario no existe'));

    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el funcionario'));
    }
    return $data;
  }
  public static function getFuncionariosAll()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT f.id_funcionario, f.nombre, f.apellidos,f.documento, s.sede, c.codigo, cg.cargo, tv.tipo_vinculacion,
      f.direccion, f.email, n.nivel
      FROM funcionarios f 
      LEFT JOIN sede s ON s.id_sede = f.id_sede
      LEFT JOIN codigo c ON c.id_codigo= f.id_codigo
      INNER JOIN tipo_vinculacion tv ON tv.id_tipovinculacion= f.id_tipovinculacion
      INNER JOIN nivel_funcionario n ON n.id_nivelfuncionario= f.id_nivelfuncionario
      LEFT JOIN cargos cg ON c.id_cargo= cg.id_cargo";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function getFUncionariosEvaluaciones()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $WHERE = "";
      if ($_POST['documento'])
        $WHERE = "WHERE f.documento = $_POST[documento]";
      $query = "SELECT e.id_evaluacion, e.valor_evaluacion, de.dependencia,
      f.id_funcionario, f.nombre, f.apellidos,f.documento, s.sede, c.codigo, cg.cargo, tv.tipo_vinculacion,
            f.direccion, f.email, n.nivel
      FROM evaluaciones e
      LEFT JOIN funcionarios f ON f.id_funcionario = e.id_funcionario
      LEFT JOIN sede s ON s.id_sede = f.id_sede
      LEFT JOIN codigo c ON c.id_codigo= f.id_codigo
      LEFT JOIN tipo_vinculacion tv ON tv.id_tipovinculacion= f.id_tipovinculacion
      LEFT JOIN nivel_funcionario n ON n.id_nivelfuncionario= f.id_nivelfuncionario
      LEFT join dependencias de ON f.id_dependencia = de.id_dependencia
      LEFT JOIN cargos cg ON c.id_cargo= cg.id_cargo
      $WHERE ";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function getFuncionariosAllFilter()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $docuemento = $_POST["documento"] == "" ? "" : "%" . $_POST["documento"] . "%";
      $cargo = $_POST["cargo"] == "" ? "" : "%" . $_POST["cargo"] . "%";
      $whereCargos = "WHERE f.documento LIKE '$docuemento'
      OR cg.cargo LIKE '$cargo'";
      if (isset($_POST['grupoObjetivo'])) {
        $gruposObjetivo = $_POST['grupoObjetivo'];
        foreach ($gruposObjetivo as $grupoObjetivo) {
          $whereCargos .= " OR cg.id_cargo = $grupoObjetivo[id_cargo]";
        }
      }
      $data = $whereCargos;
      // $tipo_vinculacion = $_POST["tipo_vinculacion"] == "" ? "" : "%" . $_POST["tipo_vinculacion"] . "%";
      // $nivel = $_POST["nivel"] == "" ? "" : "%" . $_POST["nivel"] . "%";
      $query = "SELECT f.id_funcionario, f.nombre, f.apellidos,f.documento, s.sede, c.codigo, cg.cargo,
      f.direccion, f.email, n.nivel, tv.tipo_vinculacion
      FROM funcionarios f 
      LEFT JOIN sede s ON s.id_sede = f.id_sede
      LEFT JOIN codigo c ON c.id_codigo= f.id_codigo
      LEFT JOIN tipo_vinculacion tv ON tv.id_tipovinculacion= f.id_tipovinculacion
      INNER JOIN nivel_funcionario n ON n.id_nivelfuncionario= f.id_nivelfuncionario
      LEFT JOIN cargos cg ON c.id_cargo= cg.id_cargo
      $whereCargos";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function tipo_retiro($retiro = null)
  {
    $db = conexion();
    if (!empty($_POST['mode']))
      $retiro = $_POST['retiro'];
    if (!empty($_GET['mode']))
      $retiro = $_GET['retiro'];
    $query = "SELECT id_tiposretiro, tipo_retiro FROM tipos_retiro WHERE is_retiro = $retiro";
    $stmt = $db->query($query);
    $stmt->execute();
    if ($stmt->rowCount() > 0) {
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    return '';
  }
  public static function getActividad($fecha_ini = null, $fecha_fin = null)
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error al cargar'));

    try {
      $cond = '';
      $campo = '';
      if (!empty($_POST['documento']) || !empty($_POST['nombre']))
        $cond = "WHERE identificacion = '$_POST[documento]'
      OR nombre = '$_POST[nombre]'";
      else if (!empty($fecha_ini) && !empty($fecha_fin)) {
        $cond = "LEFT JOIN actividad_funcionario af ON a.id_actividad = af.id_actividad WHERE fecha_ini BETWEEN '$fecha_ini' AND '$fecha_fin'";
        $campo = ", COUNT(af.id_actividad) cantidad";
      }

      $query = "SELECT a.id_actividad, a.nombre, a.identificacion, a.fecha_ini, a.fecha_fin, a.is_presencial, a.direccion, 
      a.horas_formativas, a.entidad_actividad $campo 
      FROM actividades a
      $cond;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar'));
    }
    return $data;
  }
  public static function getActividadesProgramadas($fecha_ini = null, $fecha_fin = null)
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error al cargar'));

    try {
      if ($_POST['mes'] != "") {
        $anoActual = date('Y');
        $query = "SELECT id_actividadprogramada, nombre, identificacion, fecha_ini, fecha_fin, is_presencial, 
        direccion, recursos, entidad_actividad, estado, archivo, motivo, calificacion, ciclo, valor_total
        FROM actividades_programadas a
        WHERE DATE(tiempo_gen) BETWEEN " . $anoActual . "$_POST[mes]" . "01 AND " . $anoActual . "$_POST[mes]" . "31;";
        $stmt = $db->query($query);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      } else {
        $cond = '';
        $campo = '';
        if (!empty($_POST['identificacion']))
          $cond = "WHERE identificacion = '$_POST[identificacion]'";

        $query = "SELECT id_actividadprogramada, nombre, identificacion, fecha_ini, fecha_fin, is_presencial, 
        direccion, recursos, entidad_actividad, estado, archivo, motivo, calificacion, ciclo, valor_total
        FROM actividades_programadas a
        $cond;";
        $stmt = $db->query($query);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      }
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar'));
    }
    return $data;
  }
  public static function getCapacitacionesProgramadas($fecha_ini = null, $fecha_fin = null)
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error al cargar'));

    try {
      if ($_POST['mes'] != "") {
        $anoActual = date('Y');
        $query = "SELECT id_capacitacionprogramada, nombre, identificacion, fecha_ini, fecha_fin, is_presencial, 
        direccion, recursos, entidad_actividad, estado, archivo, motivo, calificacion, grupo_objetivo, valor_total
        FROM capacitaciones_programadas a
        WHERE DATE(tiempo_gen) BETWEEN " . $anoActual . "$_POST[mes]" . "01 AND " . $anoActual . "$_POST[mes]" . "31;";
        $stmt = $db->query($query);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      } else {
        $cond = '';
        $campo = '';
        if (!empty($_POST['documento']))
          $cond = "WHERE identificacion = '$_POST[documento]'";

        $query = "SELECT id_capacitacionprogramada, nombre, identificacion, fecha_ini, fecha_fin, is_presencial, 
        direccion, recursos, entidad_actividad, estado, archivo, motivo, calificacion, grupo_objetivo, valor_total
        FROM capacitaciones_programadas a
        $cond;";
        $stmt = $db->query($query);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      }
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar'));
    }
    return $data;
  }
  public static function getInspeccion($fecha_ini = null, $fecha_fin = null)
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error al cargar'));

    try {

      if ($_POST['mes'] != "") {
        $anoActual = date('Y');
        $query = "SELECT id_inspeccion, i.id_dependencia, d.dependencia, identificacion, tipo_inspeccion, responsable,
        fecha_ini, fecha_fin, modalidad, estado, archivo, motivo, observacion
        FROM inspeccion i
        INNER JOIN dependencias d ON d.id_dependencia = i.id_dependencia
        WHERE DATE(tiempo_gen) BETWEEN " . $anoActual . "$_POST[mes]" . "01 AND " . $anoActual . "$_POST[mes]" . "31;";
        $stmt = $db->query($query);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      } else {
        $cond = '';
        $campo = '';
        if (!empty($_POST['identificacion']))
          $cond = "WHERE identificacion = '$_POST[identificacion]'";

        $query = "SELECT id_inspeccion, i.id_dependencia, d.dependencia, identificacion, tipo_inspeccion, responsable,
        fecha_ini, fecha_fin, modalidad, estado, archivo, motivo, observacion
        FROM inspeccion i
        INNER JOIN dependencias d ON d.id_dependencia = i.id_dependencia
        $cond;";
        $stmt = $db->query($query);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      }
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar'));
    }
    return $data;
  }
  public static function getInspeccionUnique($fecha_ini = null, $fecha_fin = null)
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error al cargar'));

    try {
      $cond = '';
      $campo = '';
      // if (!empty($_POST['identificacion']) || !empty($_POST['nombre']))
      //   $cond = "WHERE identificacion = '$_POST[identificacion]'";

      $query = "SELECT id_inspeccion, i.id_dependencia, d.dependencia, identificacion, tipo_inspeccion, responsable,
      fecha_ini, fecha_fin, modalidad, estado, archivo, motivo, observacion
      FROM inspeccion i
      INNER JOIN dependencias d ON d.id_dependencia = i.id_dependencia
      WHERE id_inspeccion = '$_POST[id_inspeccion]';";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar'));
    }
    return $data;
  }
  public static function getActividad1_2($fecha_ini = null, $fecha_fin = null)
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error al cargar'));

    try {
      $cond = '';
      $campo = '';
      if (!empty($_POST['documento']) || !empty($_POST['nombre']))
        $cond = "WHERE identificacion = '$_POST[documento]'
      OR nombre = '$_POST[nombre]'";
      else if (!empty($fecha_ini) && !empty($fecha_fin)) {
        $cond = "LEFT JOIN actividad_funcionario af ON a.id_actividad = af.id_actividad WHERE fecha_ini BETWEEN '$fecha_ini' AND '$fecha_fin'";
        $campo = ", COUNT(af.id_actividad) cantidad";
      }

      $query = "SELECT a.id_actividad, a.nombre, a.identificacion, a.fecha_ini, a.fecha_fin, a.is_presencial, a.direccion, 
      a.horas_formativas, a.entidad_actividad $campo 
      FROM actividades a
      $cond;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar'));
    }
    return $data;
  }
  public static function getCapacitacion()
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));

    try {
      $query = "SELECT id_capacitacion, nombre, identificacion, fecha_ini, fecha_fin, is_presencial, direccion, 
      horas_formativas, conocimiento_previo, motivo, estado, entidadCapacitadora, calificacion
      FROM capacitaciones 
      WHERE id_capacitacion = '$_POST[id_capacitacion]'";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);

      $query = "SELECT f.id_funcionario, f.nombre, f.apellidos,f.documento, s.sede, c.codigo, cg.cargo, tv.tipo_vinculacion,
      f.direccion, f.email, n.nivel, cf.id_capacitacion_funcionario, cf.asistencia, cf.fecha_asignacion
      FROM funcionarios f 
      LEFT JOIN capacitacion_funcionario cf ON cf.id_funcionario = f.id_funcionario
      LEFT JOIN sede s ON s.id_sede = f.id_sede
      LEFT JOIN codigo c ON c.id_codigo= f.id_codigo
      INNER JOIN tipo_vinculacion tv ON tv.id_tipovinculacion= f.id_tipovinculacion
      INNER JOIN nivel_funcionario n ON n.id_nivelfuncionario= f.id_nivelfuncionario
      LEFT JOIN cargos cg ON c.id_cargo= cg.id_cargo
      WHERE id_capacitacion = $data[id_capacitacion]";
      $stmt = $db->query($query);
      $stmt->execute();
      $funcionarios = $stmt->fetchAll(PDO::FETCH_ASSOC);
      $data['funcionarios'] = $funcionarios;
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function eliminarFamiliar()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "DELETE FROM nucleo_familiar WHERE id_nucleofamiliar = $_POST[id_familiar]";
      $stmt = $db->query($query);
      $stmt->execute();
      $db->commit();
      $data = array('success' => base64_encode('El familiar fue eliminado correctamente'));
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function getCapacitaciones($fecha_ini = null, $fecha_fin = null)
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $cond = '';
      $campo = '';
      if (!empty($_POST['fecha_ini']) && !empty($_POST['fecha_fin'])) {
        $campo = ", COUNT(cf.id_capacitacion) as cantidad ";
        $cond = "LEFT JOIN capacitacion_funcionario cf ON c.id_capacitacion = cf.id_capacitacion WHERE fecha_ini BETWEEN '$_POST[fecha_ini]' AND '$_POST[fecha_fin]';";
      } else if (!empty($fecha_ini) && !empty($fecha_fin)) {
        $campo = ", COUNT(cf.id_capacitacion) as cantidad ";
        $cond = "LEFT JOIN capacitacion_funcionario cf ON c.id_capacitacion = cf.id_capacitacion WHERE fecha_ini BETWEEN '$fecha_ini' AND '$fecha_fin';";
      }
      $query = "SELECT c.id_capacitacion, c.nombre, c.identificacion, c.fecha_ini, c.fecha_fin, c.is_presencial, c.direccion, 
      c.horas_formativas, c.estado, c.conocimiento_previo $campo
      FROM capacitaciones c
      $cond";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }

  public static function estado_civil()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT * FROM estado_civil;";
      $stmt = $db->query($query);
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el estado civil'));
    }
    return $data;
  }
  public static function getActividades()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $where = "";
      if (!empty($_POST['identificacion'])) {
        $where = "WHERE identificacion = $_POST[identificacion]";
      };
      $query = "SELECT id_actividad, nombre, identificacion, fecha_ini, fecha_fin, is_presencial, direccion, 
      horas_formativas, entidad_actividad , estado
      FROM actividades
      $where;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      // error_log('+** Error PDO: ' . _CLASS_ . ' ' . _FUNCTION_ . ': ' . $e->getMessage() .
      //   ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function getActividadAsignacion()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_actividad, nombre, identificacion, fecha_ini, fecha_fin, is_presencial, direccion, 
      horas_formativas, entidad_actividad , estado, calificacion
      FROM actividades
      WHERE id_actividad = '$_POST[id_actividad]'";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);

      $query = "SELECT f.id_funcionario, f.nombre, f.apellidos,f.documento, s.sede, c.codigo, cg.cargo, tv.tipo_vinculacion,
      f.direccion, f.email, n.nivel, af.id_actividad_funcionario, af.asistencia,  af.fecha_asignacion
      FROM funcionarios f 
      LEFT JOIN actividad_funcionario af ON af.id_funcionario = f.id_funcionario
      LEFT JOIN sede s ON s.id_sede = f.id_sede
      LEFT JOIN codigo c ON c.id_codigo= f.id_codigo
      INNER JOIN tipo_vinculacion tv ON tv.id_tipovinculacion= f.id_tipovinculacion
      INNER JOIN nivel_funcionario n ON n.id_nivelfuncionario= f.id_nivelfuncionario
      LEFT JOIN cargos cg ON c.id_cargo= cg.id_cargo
      WHERE id_actividad = $data[id_actividad]";
      $stmt = $db->query($query);
      $stmt->execute();
      $funcionarios = $stmt->fetchAll(PDO::FETCH_ASSOC);
      $data['funcionarios'] = $funcionarios;
    } catch (PDOException  $e) {
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function getActividadesProgramadasAsignacion()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_actividadprogramada, nombre, identificacion, fecha_ini, 
      fecha_fin, is_presencial, direccion, recursos, entidad_actividad, estado, archivo,
      motivo, calificacion, ciclo, valor_total, observacion
      FROM actividades_programadas
      WHERE id_actividadprogramada = '$_POST[id_actividad]'";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);

      $query = "SELECT f.id_funcionario, f.nombre, f.apellidos,f.documento, s.sede, c.codigo, cg.cargo, tv.tipo_vinculacion,
      f.direccion, f.email, n.nivel, af.id_actividadprogramadasfuncionario, af.asistencia,  af.fecha_asignacion
      FROM funcionarios f 
      LEFT JOIN actividadesprogramadas_funcionario af ON af.id_funcionario = f.id_funcionario
      LEFT JOIN sede s ON s.id_sede = f.id_sede
      LEFT JOIN codigo c ON c.id_codigo= f.id_codigo
      INNER JOIN tipo_vinculacion tv ON tv.id_tipovinculacion= f.id_tipovinculacion
      INNER JOIN nivel_funcionario n ON n.id_nivelfuncionario= f.id_nivelfuncionario
      LEFT JOIN cargos cg ON c.id_cargo= cg.id_cargo
      WHERE id_actividadprogramada = $data[id_actividadprogramada]";
      $stmt = $db->query($query);
      $stmt->execute();
      $funcionarios = $stmt->fetchAll(PDO::FETCH_ASSOC);
      $data['funcionarios'] = $funcionarios;
    } catch (PDOException  $e) {
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function getCapacitacionesProgramadasAsignacion()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT id_capacitacionprogramada, nombre, identificacion, fecha_ini, 
      fecha_fin, is_presencial, direccion, recursos, entidad_actividad, estado, archivo,
      motivo, calificacion, grupo_objetivo, valor_total, observacion
      FROM capacitaciones_programadas
      WHERE id_capacitacionprogramada = '$_POST[id_capacitacion]'";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);

      $query = "SELECT f.id_funcionario, f.nombre, f.apellidos,f.documento, s.sede, c.codigo, cg.cargo, tv.tipo_vinculacion,
      f.direccion, f.email, n.nivel, cf.id_capacitacionprogramadasfuncionario, cf.asistencia,  cf.fecha_asignacion
      FROM funcionarios f 
      LEFT JOIN capacitacionesprogramadas_funcionario cf ON cf.id_funcionario = f.id_funcionario
      LEFT JOIN sede s ON s.id_sede = f.id_sede
      LEFT JOIN codigo c ON c.id_codigo= f.id_codigo
      INNER JOIN tipo_vinculacion tv ON tv.id_tipovinculacion= f.id_tipovinculacion
      INNER JOIN nivel_funcionario n ON n.id_nivelfuncionario= f.id_nivelfuncionario
      LEFT JOIN cargos cg ON c.id_cargo= cg.id_cargo
      WHERE id_capacitacionprogramada = $data[id_capacitacionprogramada]";
      $stmt = $db->query($query);
      $stmt->execute();
      $funcionarios = $stmt->fetchAll(PDO::FETCH_ASSOC);
      $data['funcionarios'] = $funcionarios;

      $query = "SELECT id_grupoobjetivo, id_capacitacionprogramada, id_cargo
      FROM grupo_objetivo f 
      WHERE id_capacitacionprogramada = $data[id_capacitacionprogramada]";
      $stmt = $db->query($query);
      $stmt->execute();
      $grupo_objetivo = $stmt->fetchAll(PDO::FETCH_ASSOC);
      $data['grupo_objetivo'] = $grupo_objetivo;
    } catch (PDOException  $e) {
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function getFuncianariosActividadAnual()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $data = array();
      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-01-01' AND '2021-01-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getEnero = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["enero"] = $getEnero;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-02-01' AND '2021-02-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getFebrero = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["febrero"] = $getFebrero;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-03-01' AND '2021-03-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getMarzo = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["marzo"] = $getMarzo;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-04-01' AND '2021-04-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getAbril = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["abril"] = $getAbril;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-05-01' AND '2021-05-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getMayo = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["mayo"] = $getMayo;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-06-01' AND '2021-06-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getJunio = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["junio"] = $getJunio;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-07-01' AND '2021-07-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getJulio = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["julio"] = $getJulio;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-08-01' AND '2021-08-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getAgosto = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["agosto"] = $getAgosto;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-09-01' AND '2021-09-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getSeptiembre = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["septiembre"] = $getSeptiembre;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-10-01' AND '2021-10-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getOctubre = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["octubre"] = $getOctubre;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-11-01' AND '2021-11-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getNoviembre = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["noviembre"] = $getNoviembre;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM actividad_funcionario
      WHERE fecha_asignacion BETWEEN '2021-12-01' AND '2021-12-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getDiciembre = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["diciembre"] = $getDiciembre;
    } catch (PDOException  $e) {
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function getFuncianariosCapacitacionesAnual()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $data = array();
      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-01-01' AND '2021-01-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getEnero = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["enero"] = $getEnero;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-02-01' AND '2021-02-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getFebrero = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["febrero"] = $getFebrero;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-03-01' AND '2021-03-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getMarzo = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["marzo"] = $getMarzo;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-04-01' AND '2021-04-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getAbril = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["abril"] = $getAbril;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-05-01' AND '2021-05-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getMayo = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["mayo"] = $getMayo;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-06-01' AND '2021-06-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getJunio = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["junio"] = $getJunio;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-07-01' AND '2021-07-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getJulio = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["julio"] = $getJulio;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-08-01' AND '2021-08-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getAgosto = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["agosto"] = $getAgosto;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-09-01' AND '2021-09-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getSeptiembre = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["septiembre"] = $getSeptiembre;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-10-01' AND '2021-10-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getOctubre = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["octubre"] = $getOctubre;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-11-01' AND '2021-11-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getNoviembre = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["noviembre"] = $getNoviembre;

      $query = "SELECT COUNT(id_funcionario) cant_funcionarios
      FROM capacitacion_funcionario
      WHERE fecha_asignacion BETWEEN '2021-12-01' AND '2021-12-31'";
      $stmt = $db->query($query);
      $stmt->execute();
      $getDiciembre = $stmt->fetch(PDO::FETCH_ASSOC);
      $data["diciembre"] = $getDiciembre;
    } catch (PDOException  $e) {
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function rankingFuncionariosCapacitacion()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT c.id_funcionario, f.documento, f.nombre, f.apellidos, COUNT(c.id_funcionario) AS rankingFuncionarios
      FROM capacitacion_funcionario c
      INNER JOIN funcionarios f ON f.id_funcionario = c.id_funcionario
      WHERE fecha_asignacion BETWEEN '2021-01-01' AND '2021-12-31'
      GROUP BY id_funcionario
      ORDER BY rankingFuncionarios DESC;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function rankingFuncionariosActividades()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $db->beginTransaction();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT c.id_funcionario, f.documento, f.nombre, f.apellidos, COUNT(c.id_funcionario) AS rankingFuncionarios
      FROM actividad_funcionario c
      INNER JOIN funcionarios f ON f.id_funcionario = c.id_funcionario
      WHERE fecha_asignacion BETWEEN '2021-01-01' AND '2021-12-31'
      GROUP BY id_funcionario
      ORDER BY rankingFuncionarios DESC;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException  $e) {
      $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function getHijos($edad)
  {
    $db = conexion();
    try {
      $query = "SELECT nf.nombres nom_p, nf.apellidos ape_p, nf.fecha_nacimiento, f.nombre nom_f, f.apellidos ape_f, f.documento 
      from nucleo_familiar nf 
    left JOIN funcionarios f ON f.id_funcionario = nf.id_funcionario 
    WHERE DATE_FORMAT(FROM_DAYS(TO_DAYS(NOW())-TO_DAYS(nf.fecha_nacimiento)),'%Y')+0 < $edad AND id_parentesco = 4;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $err) {
      $data = array('error' => base64_encode($err->getMessage()));
    }
    return $data;
  }

  public static function getRetiroReporte($filtro = null, $todos = null, $id_f = null)
  {
    $db = conexion();
    try {
      $cond = '';
      if (!empty($filtro)) {
        $cond = "WHERE f.documento LIKE '%$filtro%' OR LOWER(concat(f.nombre, ' ', f.apellidos)) LIKE '%$filtro%'";
      }
      if (!empty($id_f))
        $cond = "WHERE f.id_funcionario = $id_f";

      $query = "SELECT r.*, f.documento, f.nombre, f.apellidos, cr.tipo_retiro FROM retiro r
        INNER JOIN funcionarios f ON r.id_funcionario = f.id_funcionario
        LEFT JOIN tipos_retiro cr ON cr.id_tiposretiro = r.id_causaretiro
        $cond ORDER BY f.id_funcionario;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $err) {
      $data = array('error' => base64_encode($err->getMessage()));
    }
    return $data;
  }

  public static function getIncapacidadReporte($filtro = null, $todos = null, $id_f = null)
  {
    $db = conexion();
    try {
      $cond = '';
      if (!empty($filtro)) {
        $cond = "WHERE f.documento LIKE '%$filtro%' OR LOWER(concat(f.nombre, ' ', f.apellidos)) LIKE '%$filtro%'";
      }
      if (!empty($id_f))
        $cond = "WHERE f.id_funcionario = $id_f";
      $query = "SELECT i.*, f.documento, f.nombre, f.apellidos FROM incapacidad i
      INNER JOIN funcionarios f ON f.id_funcionario = i.id_funcionario
        $cond ORDER BY f.id_funcionario;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $err) {
      $data = array('error' => base64_encode($err->getMessage()));
    }
    return $data;
  }

  public static function getseguridadsocialReporte($filtro = null, $todos = null, $id_f)
  {
    $db = conexion();
    try {
      $cond = '';
      if (!empty($filtro)) {
        $cond = "WHERE f.documento LIKE '%$filtro%' OR LOWER(concat(f.nombre, ' ', f.apellidos)) LIKE '%$filtro%'";
      }
      if (!empty($id_f))
        $cond = "WHERE f.id_funcionario = $id_f";
      $query = "SELECT ss.*, eps, arl, fc.fondo_cesantias, fp.fondo_pension, cc.caja_compensacion, f.documento, f.nombre, f.apellidos FROM seguridad_social ss
      INNER JOIN funcionarios f ON f.id_funcionario = ss.id_funcionario
              INNER JOIN eps e ON e.id_eps = ss.id_eps 
              INNER JOIN fondo_pension fp ON fp.id_fondopension = ss.id_fondopension 
              INNER JOIN arl a ON a.id_arl = ss.id_arl 
              Inner join fondo_cesantias fc ON fc.id_fondocesantias = ss.id_fondocesantias
              Inner join caja_compensacion cc ON cc.id_cajacompensacion = ss.id_cajacompensacion
        $cond ORDER BY f.id_funcionario;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $err) {
      $data = array('error' => base64_encode($err->getMessage()));
    }
    return $data;
  }
  public static function getMovilidad_2()
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $cond = '';
      if (!empty($_POST['id_funcionario'])) {
        $cond = "WHERE m.id_funcionario = $_POST[id_funcionario];";
      } else if (!empty($_POST['nombre'])) {
        $cond = "WHERE f.documento LIKE '%$_POST[nombre]%' OR LOWER(concat(nombre, ' ', apellidos)) LIKE '%$_POST[nombre]%' OR n.nivel LIKE '%$_POST[nombre]%' OR c.cargo LIKE '%$_POST[nombre]%';";
      } else if (!empty($_POST['cedula'])) {
        $cond = "WHERE f.documento = $_POST[cedula];";
      }
      if ($cond != '') {
        $query = "SELECT m.*, c.cargo, n.nivel, d.dependencia, f.id_funcionario, f.documento, f.celular, f.nombre, f.apellidos FROM funcionarios f 
      INNER JOIN movilidad m ON f.id_funcionario = m.id_funcionario 
      INNER JOIN cargos c ON m.id_cargo = c.id_cargo
      INNER JOIN nivel_funcionario n ON m.id_nivel = n.id_nivelfuncionario
      INNER JOIN dependencias d ON d.id_dependencia = f.id_dependencia
      $cond";
        $stmt = $db->query($query);
        $stmt->execute();
        if ($stmt->rowCount() > 0)
          $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      }
    } catch (PDOException  $e) {
      $data =  array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }
  public static function getMovilidadReporte($filtro = null, $todos = null, $id_f = null)
  {
    $db = conexion();
    try {
      $cond = '';
      if (!empty($filtro)) {
        $cond = "WHERE f.documento LIKE '%$filtro%' OR LOWER(concat(f.nombre, ' ', f.apellidos)) LIKE '%$filtro%'";
      }
      if (!empty($id_f)) {
        $cond = "WHERE f.id_funcionario = $id_f";
      }
      $query = "SELECT m.*, c.cargo, nf.nivel, d.dependencia, se.sede, co.codigo, g.grado, f.documento, f.nombre, f.apellidos, tv.tipo_vinculacion FROM movilidad m
      INNER JOIN funcionarios f ON f.id_funcionario = m.id_funcionario 
      INNER JOIN dependencias d ON d.id_dependencia = f.id_dependencia
    Inner join sede se ON f.id_sede = se.id_sede
      INNER JOIN nivel_funcionario nf ON f.id_nivelfuncionario = nf.id_nivelfuncionario
    INNER JOIN cargos c ON c.id_nivelfuncionario = nf.id_nivelfuncionario AND c.id_cargo = f.id_cargo
    INNER JOIN codigo co ON co.id_cargo = c.id_cargo ANd f.id_codigo = co.id_codigo
    INNER JOIN grado g ON g.id_codigo = f.id_codigo AND g.id_grado = f.id_grado
    Inner join tipo_vinculacion tv ON f.id_tipovinculacion = tv.id_tipovinculacion
        $cond ORDER BY f.id_funcionario;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $err) {
      $data = array('error' => base64_encode($err->getMessage()));
    }
    return $data;
  }
  public static function getRetiro()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
    die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $cond = '';
      $group = '';
      if (!empty($_POST['retiro']))
        $group = "GROUP BY r.id_funcionario";

      if (!empty($_POST['nombre'])) {
        $cond = "WHERE f.documento LIKE '%$_POST[nombre]%' OR LOWER(concat(nombre, ' ', apellidos)) LIKE '%$_POST[nombre]%' OR r.tipo_retiro LIKE '%$_POST[nombre]%' OR tr.tipo_retiro LIKE '%$_POST[nombre]%' AND is_activo = 0";
      }
      if (!empty($_POST['id_funcionario'])) {
        $cond = "WHERE f.id_funcionario = $_POST[id_funcionario]";
      }
      if (!empty($_POST['cedula'])) {
        $cond = "WHERE f.documento = $_POST[cedula]";
      }
      $query = "SELECT r.*, f.nombre, f.id_funcionario, f.documento, f.celular, f.apellidos, tr.tipo_retiro as causa 
      FROM funcionarios f 
      INNER JOIN retiro r ON f.id_funcionario = r.id_funcionario 
      LEFT JOIN tipos_retiro tr ON r.id_causaretiro = tr.id_tiposretiro
      $cond $group;";
      $stmt = $db->query($query);
      if ($stmt->rowCount() > 0)
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      else
        $data = array('error' => base64_encode('No tiene retiros registrado'));
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar al retiro'));
    }
    return $data;
  }
  public static function getMovilidad1_2()
  {
    $db = conexion();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $cond = '';
      if (!empty($_POST['id_funcionario'])) {
        $cond = "WHERE m.id_funcionario = $_POST[id_funcionario];";
      } else if (!empty($_POST['nombre'])) {
        $cond = "WHERE f.documento LIKE '%$_POST[nombre]%' OR LOWER(concat(nombre, ' ', apellidos)) LIKE '%$_POST[nombre]%' OR n.nivel LIKE '%$_POST[nombre]%' OR c.cargo LIKE '%$_POST[nombre]%';";
      } else if (!empty($_POST['cedula'])) {
        $cond = "WHERE f.documento = $_POST[cedula];";
      }
      if ($cond != '') {
        $query = "SELECT m.*, c.cargo, n.nivel, d.dependencia, f.id_funcionario, f.documento, f.celular, f.nombre, f.apellidos FROM movilidad m 
      INNER JOIN funcionarios f ON f.id_funcionario = m.id_funcionario 
      INNER JOIN cargos c ON m.id_cargo = c.id_cargo
      INNER JOIN nivel_funcionario n ON m.id_nivel = n.id_nivelfuncionario
      INNER JOIN dependencias d ON d.id_dependencia = f.id_dependencia
      $cond";
        $stmt = $db->query($query);
        $stmt->execute();
        if ($stmt->rowCount() > 0)
          $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      }
    } catch (PDOException  $e) {
      $data =  array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  }

  public static function Funcionario_fechaIni($fecha_inicio, $fecha_final)
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {


      $query = "SELECT f.*, co.codigo, c.cargo, g.grado, ss.fecha_retiro, nf.nivel, se.sede,  ss.salario, de.dependencia, tv.tipo_vinculacion, ne.nivel_educativo, eps, fp.fondo_pension,
      m.municipio, ec.estado_civil, ts.rh FROM funcionarios f
    INNER JOIN nivel_funcionario nf ON f.id_nivelfuncionario = nf.id_nivelfuncionario
    INNER JOIN cargos c ON c.id_nivelfuncionario = nf.id_nivelfuncionario AND c.id_cargo = f.id_cargo
    INNER JOIN codigo co ON co.id_cargo = c.id_cargo ANd f.id_codigo = co.id_codigo
    INNER JOIN grado g ON g.id_codigo = f.id_codigo AND g.id_grado = f.id_grado
    Inner join sede se ON f.id_sede = se.id_sede
    Inner join dependencias de ON f.id_dependencia = de.id_dependencia
    LEFT JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario
    left join nivel_educativo ne ON f.id_niveleducativo = ne.id_niveleducativo
    Inner join municipio m ON f.id_municipio = m.id_municipio
    Inner join estado_civil ec ON f.id_estadocivil = ec.id_estadocivil
    left join eps eps ON eps.id_eps = ss.id_eps
    left join fondo_pension fp ON fp.id_fondopension = ss.id_fondopension
    Inner join tipo_sanguineo ts ON f.id_rh = ts.id_rh
    Inner join tipo_vinculacion tv ON f.id_tipovinculacion = tv.id_tipovinculacion
    WHERE f.fecha_ingreso_nombra BETWEEN :fecha_inicio AND :fecha_final;";
      $stmt = $db->prepare($query);
      $stmt->bindValue(':fecha_inicio', $fecha_inicio);
      $stmt->bindValue(':fecha_final', $fecha_final);
      $stmt->execute();
      if ($stmt->rowCount() > 0)
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      else
        $data = array();
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el funcionario'));
    }
    return $data;
  }
  public static function Funcionario_edad($edad_inicio, $edad_final)
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {


      $query = "SELECT f.*, co.codigo, c.cargo, g.grado, ss.fecha_retiro, nf.nivel, se.sede,  ss.salario, de.dependencia, tv.tipo_vinculacion, ne.nivel_educativo, eps, fp.fondo_pension,
      m.municipio, ec.estado_civil, ts.rh FROM funcionarios f
    INNER JOIN nivel_funcionario nf ON f.id_nivelfuncionario = nf.id_nivelfuncionario
    INNER JOIN cargos c ON c.id_nivelfuncionario = nf.id_nivelfuncionario AND c.id_cargo = f.id_cargo
    INNER JOIN codigo co ON co.id_cargo = c.id_cargo ANd f.id_codigo = co.id_codigo
    INNER JOIN grado g ON g.id_codigo = f.id_codigo AND g.id_grado = f.id_grado
    Inner join sede se ON f.id_sede = se.id_sede
    Inner join dependencias de ON f.id_dependencia = de.id_dependencia
    LEFT JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario
    left join nivel_educativo ne ON f.id_niveleducativo = ne.id_niveleducativo
    Inner join municipio m ON f.id_municipio = m.id_municipio
    Inner join estado_civil ec ON f.id_estadocivil = ec.id_estadocivil
    left join eps eps ON eps.id_eps = ss.id_eps
    left join fondo_pension fp ON fp.id_fondopension = ss.id_fondopension
    Inner join tipo_sanguineo ts ON f.id_rh = ts.id_rh
    Inner join tipo_vinculacion tv ON f.id_tipovinculacion = tv.id_tipovinculacion
    WHERE TIMESTAMPDIFF(YEAR, f.fecha_nacimiento, CURDATE()) BETWEEN :edad_inicial AND :edad_final;";
      $stmt = $db->prepare($query);
      $stmt->bindValue(':edad_inicial', $edad_inicio);
      $stmt->bindValue(':edad_final', $edad_final);
      $stmt->execute();
      if ($stmt->rowCount() > 0)
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      else
        $data = array();
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el funcionario'));
    }
    return $data;
  }
  public static function getFuncionarioNivelEducativo($var, $num)
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {

      if ($num == 1)
        $cond = "f.genero = '$var';";
      if ($num == 2)
        $cond = "f.id_niveleducativo = $var;";
      if ($num == 3)
        $cond = "f.id_sede = $var;";
      if ($num == 4)
        $cond = "f.id_dependencia = $var;";

      $query = "SELECT f.*, co.codigo, c.cargo, g.grado, ss.fecha_retiro, nf.nivel, se.sede,  ss.salario, de.dependencia, tv.tipo_vinculacion, ne.nivel_educativo, eps, fp.fondo_pension,
      m.municipio, ec.estado_civil, ts.rh FROM funcionarios f
    INNER JOIN nivel_funcionario nf ON f.id_nivelfuncionario = nf.id_nivelfuncionario
    INNER JOIN cargos c ON c.id_nivelfuncionario = nf.id_nivelfuncionario AND c.id_cargo = f.id_cargo
    INNER JOIN codigo co ON co.id_cargo = c.id_cargo ANd f.id_codigo = co.id_codigo
    INNER JOIN grado g ON g.id_codigo = f.id_codigo AND g.id_grado = f.id_grado
    Inner join sede se ON f.id_sede = se.id_sede
    Inner join dependencias de ON f.id_dependencia = de.id_dependencia
    LEFT JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario
    left join nivel_educativo ne ON f.id_niveleducativo = ne.id_niveleducativo
    Inner join municipio m ON f.id_municipio = m.id_municipio
    Inner join estado_civil ec ON f.id_estadocivil = ec.id_estadocivil
    left join eps eps ON eps.id_eps = ss.id_eps
    left join fondo_pension fp ON fp.id_fondopension = ss.id_fondopension
    Inner join tipo_sanguineo ts ON f.id_rh = ts.id_rh
    Inner join tipo_vinculacion tv ON f.id_tipovinculacion = tv.id_tipovinculacion
    WHERE $cond";
      $stmt = $db->query($query);
      $stmt->execute();
      if ($stmt->rowCount() > 0)
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
      else
        $data = array();
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el funcionario'));
    }
    return $data;
  }
  public static function getConsecutivo()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $anoActual = date('Y');
      $query = "SELECT CONCAT('" . $anoActual . "-',MAX(consecutivo)+1) consecutivoConcat, MAX(consecutivo)+1 consecutivo
      FROM $_POST[tabla]";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
      if ($data["consecutivo"] == null) {
        $data["consecutivoConcat"] = "$anoActual-1";
        $data["consecutivo"] = 1;
      }
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else {
        $data = $e->getMessage();
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
      }
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el funcionario'));
    }
    return $data;
  }
  public static function getFuncionarioMatriz()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT f.*, co.codigo, c.cargo, g.grado, ss.fecha_retiro, nf.nivel, se.sede,  ss.salario, de.dependencia, tv.tipo_vinculacion, ne.nivel_educativo, eps, fp.fondo_pension,
      m.municipio, ec.estado_civil, ts.rh FROM funcionarios f
      left JOIN nivel_funcionario nf ON f.id_nivelfuncionario = nf.id_nivelfuncionario
      left JOIN cargos c ON c.id_nivelfuncionario = nf.id_nivelfuncionario AND c.id_cargo = f.id_cargo
      left JOIN codigo co ON co.id_cargo = c.id_cargo ANd f.id_codigo = co.id_codigo
      left JOIN grado g ON g.id_codigo = f.id_codigo AND g.id_grado = f.id_grado
      left join sede se ON f.id_sede = se.id_sede
      left join dependencias de ON f.id_dependencia = de.id_dependencia
      LEFT JOIN seguridad_social ss ON f.id_funcionario = ss.id_funcionario
      left join nivel_educativo ne ON f.id_niveleducativo = ne.id_niveleducativo
      left join municipio m ON f.id_municipio = m.id_municipio
      left join estado_civil ec ON f.id_estadocivil = ec.id_estadocivil
      left join eps eps ON eps.id_eps = ss.id_eps
      left join fondo_pension fp ON fp.id_fondopension  = ss.id_fondopension
      Inner join tipo_sanguineo ts ON f.id_rh = ts.id_rh
      left join tipo_vinculacion tv ON f.id_tipovinculacion = tv.id_tipovinculacion
      WHERE documento = $_POST[documento]
      group by documento";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else {
        $data = $e->getMessage();
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
      }
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el funcionario'));
    }
    return $data;
  }
  public static function getMatriz()
  {
    // if (is_string($er = valida_sesion())) return $er;
    // if (is_string($er = valida_nivel(array('1', '2', '3')))) return $er;
    $db = conexion();
    /*return array('success' => base64_encode('correcto'));
      die();*/
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $where = "";
      $fetch = "fetchAll";
      if (isset($_POST['id_matriz'])) {
        $fetch = "fetch";
        $where = "WHERE id_matriz = $_POST[id_matriz]";
      }
      $query = "SELECT id_matriz, lugar, fecha, origen_hallazgo, descripcion_hallazgo, f.documento,
      elemento_interviene, recomendacion, tipo_accion, responsable, fechapropuesta_cierre,
      fecha_cierre, accion_tomada, documento_soporte, avance, estado, tiempo_gen, sede, denominacion, is_entidad
      FROM matriz m
      INNER JOIN funcionarios f ON f.id_funcionario = m.id_funcionario
      $where";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->$fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      if ($e->getCode() > 6000) {
        $data = array('error' => base64_encode($e->getMessage()));
      } else {
        $data = $e->getMessage();
        error_log($e->getMessage()); //Captura el error en logger, y si hay otro tambien
      }
    } catch (PDOException  $e) {
      error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage() .
        ' - [query]: ' . PHP_EOL . $query);
      $data = array('error' => base64_encode('Error al cargar el funcionario'));
    }
    return $data;
  }
  public static function getWehereMes($mes)
  {
    // switch ($mes) {
    //   case 'ENERO':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'FEBRERO':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'MARZO':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'ABRIL':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'MAYO':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'JUNIO':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'JULIO':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'AGOSTO':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'SEPTIEMBRE':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'OCTUBRE':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'NOVIEMBRE':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    //   case 'DICIEMBRE':
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;

    //   default:
    //     $where = "WHERE tiempo_gen BETWEEN ano-01-02"
    //     break;
    // }
  }
   // Majjul
  public static function getReportesActividades()
  {
    return "Hello word";
    $db = conexion();
    $data = array('error' => base64_encode('Error: [#' . time() . ']'));
    try {
      $query = "SELECT estado, COUNT(*) as cantidad
      FROM actividades_programadas
      GROUP BY estado;";
      $stmt = $db->query($query);
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
      } catch (PDOException  $e) {
         $data = array('error' => base64_encode($e->getMessage()));
    }
    return $data;
  } 
}
