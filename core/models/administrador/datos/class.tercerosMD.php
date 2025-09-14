<?php

/*
* Librerias: recapchalib.php
* include('core/bin/functions/conexion.php');
* 
*/


abstract class tercerosMD
{

	// Realiza la creacion de los usuarios
	// valida los campos
	public static function crear()
	{
		if (is_string($er = valida_sesion())) return $er;
		if (is_string($er = valida_nivel(array('1')))) return $er;
		if (is_array($data = self::upload_image('archivo_rut'))) return $data;
		$imgLocation = $data;
		$db = conexion($_SESSION['usuario'], $_SESSION['password'], $_SESSION['db']);
		$tiempo_exec = time();
		$data = array('error' => base64_encode('consulta   ||   [#' . $tiempo_exec . ']'));
		$db->beginTransaction();
		$qn = 0;
		$id_relacion = array();
		try {
			if($_SESSION['nivel'] == 3){
                throw new Exception("El usuario <b>$_SESSION[usuario_on]</b> no tiene permisos para realizar esta acción", 6001);
            }
			self::rules_crear($_POST);
			$identificacion = "";
			if (empty($_POST['id'])) {
				$identificacion = $_POST['nit'];
			} else {
				$identificacion = $_POST['id'];
			}
			// error_log("nit: " . print_r($_POST['nit'], 1));
			error_log("id: " . print_r($identificacion, 1));

			$query = "SELECT COUNT(identificacion) identificacion 
					FROM tercero
					WHERE identificacion = :identificacion";
			$stmt = $db->prepare($query);
			$stmt->bindValue(':identificacion', $identificacion);
			$stmt->execute();
			$existente = $stmt->fetch(PDO::FETCH_ASSOC);

			if ($existente["identificacion"] == 0) {
				$qn = 1;
				$query = "INSERT INTO tercero (tipo_persona, clasificacion_tributaria,tercero_clasificacion,sexo,
						id_pais, id_ciudad, id_departamento, id_actividadeseconomicas, tipo_documento, identificacion, digito_verificacion,
						razon_social, nombre_primero, nombre_segundo, apellido_primero, apellido_segundo, archivo_rut, direccion,
						fecha_nac, celular, tel1, tel2, tel3, fax, correo, persona_contacto, direccion_principal, is_activo, tiempo_crea)

						VALUES (:tipo_persona, :clasificacion_tributaria, :tercero_clasificacion, :sexo,
						:id_pais, :id_ciudad, :id_departamento, :id_actividadeseconomicas, :tipo_documento, :identificacion, :digito_verificacion, 
						:razon_social, :nombre_primero, :nombre_segundo, :apellido_primero, :apellido_segundo, :archivo_rut, :direccion, 
						:fecha_nac, :celular, :tel1, :tel2, :tel3, :fax, :correo, :persona_contacto, :direccion_principal, 1, :fecha_creacion);";
				$msgSuccess = 	base64_encode('El tercero ' . $identificacion . ' se ha creado');
			} else {
				$qn = 2;
				$query = "UPDATE tercero SET clasificacion_tributaria = :clasificacion_tributaria,tercero_clasificacion = :tercero_clasificacion,sexo = :sexo,
						id_pais = :id_pais, id_ciudad = :id_ciudad, id_departamento = :id_departamento, id_actividadeseconomicas = :id_actividadeseconomicas, tipo_documento = :tipo_documento,
					 	digito_verificacion = :digito_verificacion, razon_social = :razon_social, nombre_primero = :nombre_primero,
						nombre_segundo = :nombre_segundo, apellido_primero = :apellido_primero, apellido_segundo = :apellido_segundo, archivo_rut = :archivo_rut, direccion = :direccion,
						fecha_nac = :fecha_nac, celular = :celular, tel1 = :tel1, tel2 = :tel2, tel3 = :tel3, fax = :fax, correo = :correo, persona_contacto = :persona_contacto,
						direccion_principal = :direccion_principal, tiempo_crea = :fecha_creacion
						WHERE identificacion = :identificacion AND tipo_persona = :tipo_persona";

				$msgSuccess = 	base64_encode('El tercero ' . $identificacion . ' se ha modificado');
			}
			if ($_POST['tipo_persona'] == 'NATURAL') {
				$stmt = $db->prepare($query);
				$stmt->bindValue(':tipo_persona',  $_POST['tipo_persona']);
				$stmt->bindValue(':clasificacion_tributaria', $_POST['clasificacion_tributaria']);
				$stmt->bindValue(':tercero_clasificacion', $_POST['tercero_clasificacion']);
				$stmt->bindValue(':sexo', $_POST['sexo']);
				$stmt->bindValue(':id_pais', $_POST['pais']);
				$stmt->bindValue(':id_ciudad', $_POST['ciudad']);
				$stmt->bindValue(':id_departamento', $_POST['departamento']);
				$stmt->bindValue(':id_actividadeseconomicas', null);
				$stmt->bindValue(':tipo_documento',  $_POST['documento']);
				$stmt->bindValue(':identificacion', $_POST['id']);
				$stmt->bindValue(':digito_verificacion', null);
				$stmt->bindValue(':razon_social', " ");
				$stmt->bindValue(':nombre_primero', $_POST['nombre_primer']);
				$stmt->bindValue(':nombre_segundo', $_POST['nombre_segundo']);
				$stmt->bindValue(':apellido_primero', $_POST['apellido_primer']);
				$stmt->bindValue(':apellido_segundo', $_POST['apellido_segundo']);
				$stmt->bindValue(':archivo_rut', $imgLocation == '' ? null : $imgLocation, PDO::PARAM_LOB | PDO::PARAM_NULL);
				$stmt->bindValue(':direccion', $_POST['direccion']);
				$stmt->bindValue(':fecha_nac', $_POST['fecha_nac']);
				$stmt->bindValue(':celular', $_POST['celular']);
				$stmt->bindValue(':tel1', $_POST['telefono1']);
				$stmt->bindValue(':tel2', $_POST['telefono2']);
				$stmt->bindValue(':tel3', $_POST['telefono3']);
				$stmt->bindValue(':fax', null);
				$stmt->bindValue(':correo', $_POST['correo']);
				$stmt->bindValue(':persona_contacto', " ");
				$stmt->bindValue(':direccion_principal', " ");
				$stmt->bindValue(':fecha_creacion', $_POST['fecha_creacion']);
				$stmt->execute();
				// $id_relacion = array('id_persona', ':id_persona', $db->lastInsertId());
			} else if ($_POST['tipo_persona'] == 'JURIDICA') {
				$stmt = $db->prepare($query);
				$stmt->bindValue(':tipo_persona',  $_POST['tipo_persona']);
				$stmt->bindValue(':clasificacion_tributaria', $_POST['clasificacion_tributaria2']);
				$stmt->bindValue(':tercero_clasificacion', $_POST['tercero_clasificacion2']);
				$stmt->bindValue(':sexo', "EMPRESA");
				$stmt->bindValue(':id_pais', $_POST['id_pais']);
				$stmt->bindValue(':id_ciudad', $_POST['id_ciudad']);
				$stmt->bindValue(':id_departamento', $_POST['id_departamento']);
				$stmt->bindValue(':id_actividadeseconomicas', $_POST['ciiu']);
				$stmt->bindValue(':tipo_documento', "NIT");
				$stmt->bindValue(':identificacion', $_POST['nit']);
				$stmt->bindValue(':digito_verificacion', $_POST['digito_verificacion']);
				$stmt->bindValue(':razon_social', $_POST['razon_social']);
				$stmt->bindValue(':nombre_primero', " ");
				$stmt->bindValue(':nombre_segundo', null);
				$stmt->bindValue(':apellido_primero', " ");
				$stmt->bindValue(':apellido_segundo', null);
				$stmt->bindValue(':archivo_rut', $imgLocation == '' ? null : $imgLocation, PDO::PARAM_STR | PDO::PARAM_NULL);
				$stmt->bindValue(':direccion', " ");
				$stmt->bindValue(':fecha_nac', "2000-01-01");
				$stmt->bindValue(':celular', $_POST['celular']);
				$stmt->bindValue(':tel1', $_POST['tel1']);
				$stmt->bindValue(':tel2', $_POST['tel2']);
				$stmt->bindValue(':tel3', $_POST['tel3']);
				$stmt->bindValue(':fax', $_POST['fax']);
				$stmt->bindValue(':correo', $_POST['correo2']);
				$stmt->bindValue(':persona_contacto', $_POST['persona_contacto']);
				$stmt->bindValue(':direccion_principal', $_POST['direccion_principal']);
				$stmt->bindValue(':fecha_creacion', $_POST['fecha_creacion']);
				$stmt->execute();
				// $id_relacion = array('id_empresa', ':id_empresa', $db->lastInsertId());
			}

			// $qn = 3;
			// $query = "INSERT INTO tercero ( $id_relacion[0],tipo_persona, fecha_creacion)
			// 		VALUES($id_relacion[1], :tipo_persona, :fecha_creacion);";
			// $stmt = $db->prepare($query);
			// $stmt->bindValue($id_relacion[1], $id_relacion[2]);
			// $stmt->bindValue(':tipo_persona', $_POST['tipo_persona']);
			// $stmt->bindValue(':fecha_creacion', $_POST['fecha_creacion']);
			// $stmt->execute();


			// error_log('*E: terceroMD[54]: ' . print_r($_POST, 1));
			$db->commit();
			// $data = array('success' => base64_encode('El tercero se ha creado'));
			$data = array('success' => $msgSuccess);
			Logger::guardar_accion($db, 'EMPLEADO', 'CREACION DEL TERCERO ID ');
		} catch (PDOException  $e) {
			if (isset($stmt) && $stmt->errorInfo()[1] == '1062') {
				error_log('*E: terceroMD[54]: ' . print_r($stmt->errorInfo(), 1));
				switch ($qn) {
					case 1:
						$msger = 'El tercero ya existé';
						break;
				}
				$data = array('error' => base64_encode($msger));
			} else
				error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . ' - [query]: ' . PHP_EOL . $query);
			$db->rollback();
		} catch (SeccionGumpClassExeptions $e) {
			$data = $e->getOptions();
		} catch (Exception $e) {
			if ($e->getCode() > 999) {
				$data = array('error' => base64_encode($e->getMessage()));
			} else
				error_log('+** Error Exception: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . PHP_EOL . '#' . $tiempo_exec . PHP_EOL . $e->getMessage() . PHP_EOL . 'ERROR: [vista]: ' . print_r($data, 1)); //Captura el error en logger, y si hay otro tambien
		}
		return $data;
	}

	// Validamos las reglas de los parametros que son ingresados por el usuario 
	private static function rules_crear(&$parametros)
	{
		// Validamos los valores enviados
		$gump = new GUMP_dd('es');
		$seccionNombre = "general";
		$parametros = $gump->setSeccionGump(json_decode($parametros[$seccionNombre], 1), $seccionNombre);

		if ($_POST['tipo_persona'] == 'NATURAL') {
			$gump->filter_rules(array(
				'documento' => 'trim|sanitize_string',
				'sexo' => 'trim|sanitize_string',
				'clasificacion_tributaria' => 'trim|sanitize_string',
				'tercero_clasificacion' => 'trim|sanitize_string',
				'pais' => 'trim|sanitize_numbers',
				'departamento' => 'trim|sanitize_numbers',
				'ciudad' => 'trim|sanitize_numbers',
				'id' => 'trim|sanitize_numbers',
				'nombre_primer' => 'trim|sanitize_string',
				'nombre_segundo' => 'trim|sanitize_string',
				'apellido_primer' => 'trim|sanitize_string',
				'apellido_segundo' => 'trim|sanitize_string',
				'direccion' => 'trim|sanitize_string',
				'fecha_nac' => 'trim|sanitize_string',
				'telefono1' => 'trim|sanitize_numbers',
				'telefono2' => 'trim|sanitize_numbers',
				'telefono3' => 'trim|sanitize_numbers',
				'correo' => 'trim|sanitize_string',
				'fecha_creacion' => 'trim|sanitize_string',
			));

			$gump->validation_rules(array(
				'documento' => 'required|contains,\'CEDULA\' \'CEDULA EXTRANJERA\'',
				'sexo' => 'contains,MASCULINO FEMENINO',
				'clasificacion_tributaria' => 'required',
				'tercero_clasificacion' => 'required',
				'pais' => 'required|numeric',
				'departamento' => 'required|numeric',
				'ciudad' => 'required|numeric',
				'id' => 'required|integer|max_len,11|min_len,2',
				'nombre_primer' => 'required|valid_name|max_len,10|min_len,1',
				'nombre_segundo' => 'valid_name,10|min_len,1',
				'apellido_primer' => 'required|valid_name,10|min_len,1',
				'apellido_segundo' => 'valid_name,10|min_len,1',
				'direccion' => 'street_address',
				'fecha_nac' => 'required|date|max_len,45|min_len,1',
				'telefono1' => 'required|phone_number',
				'telefono2' => 'phone_number',
				'telefono3' => 'phone_number',
				'correo' => 'required|valid_email|max_len,120|min_len,1',
				'fecha_creacion' => 'required|date|max_len,11|min_len,1',
			));
		} else {
			$gump->filter_rules(array(
				'nit' => 'trim|sanitize_numbers',
				'digito_verificacion' => 'trim|sanitize_string',
				'clasificacion_tributaria2' => 'trim|sanitize_string',
				'tercero_clasificacion2' => 'trim|sanitize_string',
				'id_pais' => 'trim|sanitize_numbers',
				'id_ciudad' => 'trim|sanitize_numbers',
				'id_departamento' => 'trim|sanitize_numbers',
				'razon_social' => 'trim|sanitize_string',
				'direccion_principal' => 'trim|sanitize_string',
				'persona_contacto' => 'trim|sanitize_string',
				'telefono1' => 'trim|sanitize_numbers',
				'telefono2' => 'trim|sanitize_numbers',
				'telefono3' => 'trim|sanitize_numbers',
				'correo2' => 'trim|sanitize_string',
				'ciiu' => 'trim|sanitize_string',
				'fecha_crea' => 'trim|sanitize_string',
			));

			$gump->validation_rules(array(
				'nit' => 'required|numeric',
				'digito_verificacion' => 'required|numeric',
				'clasificacion_tributaria2' => 'required',
				'tercero_clasificacion2' => 'required',
				'id_pais' => 'required|numeric',
				'id_ciudad' => 'numeric',
				'id_departamento' => 'numeric',
				'razon_social' => 'required|max_len,30|min_len,1',
				'direccion_principal' => 'required',
				'persona_contacto' => 'required|max_len,45|min_len,1',
				'celular' => 'required|phone_number',
				'tel1' => 'phone_number',
				'tel2' => 'phone_number',
				'tel3' => 'phone_number',
				'correo2' => 'required|valid_email|max_len,45|min_len,1',
				'ciiu' => 'required|numeric',
				'fecha_crea' => 'date|max_len,11|min_len,1',
			));
		}

		$gump->run($_POST);
	}
	private static function upload_image($img, $required = false)
	{
		if (!$required && empty($_FILES[$img])) return '';
		if (empty($_FILES[$img])) return array('error' => base64_encode('Debe adjuntar la imagen'));
		$ruta = 'views/images/res/tercero/';
		$filename = $_FILES[$img]['name'];
		/* Location */
		$location = $ruta . $filename;
		$imgType = pathinfo($location, PATHINFO_EXTENSION);
		$imgSize = $_FILES[$img]['size'];

		// Check image format
		if (
			$imgType != "jpg" && $imgType != "png"
			&& $imgType != "jpeg" && $imgType != "gif" && $imgType != "pdf"
		)
			return array('error' => base64_encode('El formato de la imagen no es valida'));
		// Validamos el tamaño de la imagen
		if ($imgSize > 5242880) //5MB
			return array('error' => base64_encode('El tamaño de la imagen no puede ser mayor a 5MB'));
		//Validamos el tamaño del nombre
		if (strlen($location) > 120)
			return array('error' => base64_encode('La longitud del nombre no puede ser mayor a ' . (120 - strlen($ruta)) . ' caracteres'));

		/* Upload file */
		if (move_uploaded_file($_FILES[$img]['tmp_name'], $location))
			return $location;
		//error_log(print_r($location,1));
		return array('error' => base64_encode('Error al subir la imagen'));
	}
}
