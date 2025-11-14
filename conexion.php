<?php

function conexion($db_user = 'appuser', $db_pass = 'apppass', $msj_error = NULL)
{

	try {
		// error_log("db " . print_r($db, 1));
		/*PDO::ATTR_EMULATE_PREPARES => false: Se usa para desactivar emulación de consultas preparadas 
     *      forzando el uso real de consultas preparadas.
     *      Es muy importante establecerlo a false para prevenir Inyección SQL.*/
		//,array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET sql_mode="TRADITIONAL"')
		$db = "dbname=appjamundi";
		// if(!empty($db)) $db="dbname=dbf_powsound";
		//$conn = new PDO('mysql:host=50.31.174.181;charset=utf8;' . $db, $db_user, $db_pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET sql_mode="TRADITIONAL"'));
		$conn = new PDO('mysql:host=db;port=3306;charset=utf8;' . $db, $db_user, $db_pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET sql_mode="TRADITIONAL"'));
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
	} catch (PDOException $e) {
		error_log('+** Error PDO:CONEXION : ' . $e->getMessage());
		if ($msj_error != NULL) {
			$msj_error = base64_encode($msj_error == '' ? 'No se pudo conectar' : $msj_error);
			echo json_encode(array('error' => array('conexion_fail' => $msj_error)));
		}
		exit;
	}
	return $conn;
}

// Añade la db de la empresa a la conexion, dependiendo del dominio conectado
function binMyDbConnexion($conn)
{
	try {
		$query = "SELECT db FROM dbfg_empresa.Empresa WHERE host=:host;";
		$stmt = $conn->prepare($query);
		$stmt->execute(array('host' => $_SERVER['HTTP_HOST']));
		if ($stmt->rowCount() > 0) {
			$namDb = $stmt->fetch(PDO::FETCH_ASSOC)['db'];
			$conn->exec("USE $namDb;");
			return $conn;
		} else
			throw new Exception('No encontro DB, con este host', 1000);
	} catch (PDOException  $e) {
		// error_log('+** [Var1]: '.print_r($e,1));//.' - [Var2]: '.);//.' - [Var3]: '.);
		error_log('+** Error PDO: binMyDbConnexion ' . $e->getMessage() .
			' - [query]: ' . PHP_EOL . $query);
	}
	return false;
}

function valida_sesion()
{ // retorna true si las variabels de conexion fueron creadas y llenadas
	if (!empty($_SESSION['usuario']) and !empty($_SESSION['password']) and !empty($_SESSION['db']) and !empty($_SESSION['nivel']))
		return true;
	return json_encode(array('error' => array(
		'session_off' => base64_encode('Su sesión ha caducado [conexión]')
	)));
}

function valida_nivel($niveles_validos)
{
	foreach ($niveles_validos as $nivel) {
		if ($nivel == $_SESSION['nivel'])
			return true;
	}
	return json_encode(array('error' => array(
		'nivel_not' => base64_encode('No tiene permisos para usar esta funcionalidad')
	)));
}
