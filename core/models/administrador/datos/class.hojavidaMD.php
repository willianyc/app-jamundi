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

        /* ============================================================
           🟦 MANEJO DE ARCHIVOS
        ============================================================ */
        $location = '';
        $locationFoto = '';

        // ---------------------- archivo laboral ----------------------
        if (!empty($_FILES['archivo_lab']['name']) && $_FILES['archivo_lab']['name'] !== 'undefined') {
            $filename = str_replace(" ", "_", $_FILES['archivo_lab']['name']);
            $directorio = "views/archivos/hojavida/";
            $location = $directorio . $filename;

            $imgType = pathinfo($location, PATHINFO_EXTENSION);
            $filename = str_replace($imgType, time() . '_' . uniqid(), $filename) . '.' . $imgType;
            $imgSize = $_FILES['archivo_lab']['size'];
            $location = $directorio . $filename;

            if ($imgSize > 5242880) {
                return array('error_arc' => base64_encode('El archivo no puede ser mayor a 5MB'));
            }

            if (!in_array(strtolower($imgType), ['pdf', 'doc', 'docx'])) {
                return array('error_arc' => base64_encode('El archivo tiene que ser tipo pdf o word'));
            }

            if (strlen($location) > 150) {
                return array('error_arc' => base64_encode('La longitud del nombre no puede ser mayor a ' . (120 - strlen($directorio)) . ' caracteres'));
            }

            if (!move_uploaded_file($_FILES['archivo_lab']['tmp_name'], $location)) {
                return array('error_arc' => base64_encode('Error al subir el archivo'));
            }
        } else {
            // Si viene "undefined" desde JS, lo tratamos como vacío
            $location = (isset($_POST['arch_lab']) && $_POST['arch_lab'] !== 'undefined') ? $_POST['arch_lab'] : null;
        }

        // ---------------------- archivo foto ----------------------
        if (!empty($_FILES['archivo']['name']) && $_FILES['archivo']['name'] !== 'undefined') {
            $filename = str_replace(" ", "_", $_FILES['archivo']['name']);
            $directorio = "views/archivos/fotos/";
            $locationFoto = $directorio . $filename;

            $imgType = pathinfo($locationFoto, PATHINFO_EXTENSION);
            $filename = str_replace($imgType, time() . '_' . uniqid(), $filename) . '.' . $imgType;
            $imgSize = $_FILES['archivo']['size'];
            $locationFoto = $directorio . $filename;

            if ($imgSize > 5242880) {
                return array('error_arc' => base64_encode('El archivo no puede ser mayor a 5MB'));
            }

            if (!in_array(strtolower($imgType), ['jpg', 'jpeg', 'png'])) {
                return array('error_arc' => base64_encode('El archivo tiene que ser tipo JPEG o PNG'));
            }

            if (strlen($locationFoto) > 150) {
                return array('error_arc' => base64_encode('La longitud del nombre no puede ser mayor a ' . (120 - strlen($directorio)) . ' caracteres'));
            }

            if (!move_uploaded_file($_FILES['archivo']['tmp_name'], $locationFoto)) {
                return array('error_arc' => base64_encode('Error al subir el archivo'));
            }
        } else {
            $locationFoto = (isset($_POST['foto']) && $_POST['foto'] !== 'undefined') ? $_POST['foto'] : null;
        }

        /* ============================================================
           🟦 DETECCIÓN DE INSERCIÓN O ACTUALIZACIÓN
        ============================================================ */
        $id_f = (isset($_POST['id_funcionario']) && $_POST['id_funcionario'] !== '') ? (int)$_POST['id_funcionario'] : 0;

        $query = "SELECT id_funcionario FROM funcionarios WHERE id_funcionario = " . (int)$id_f;
        $stmt = $db->query($query);
        $stmt->execute();

        /* ============================================================
           🟦 NORMALIZACIÓN DE DATOS COMUNES
        ============================================================ */
        $id_municipio  = ($_POST['municipio'] ?? '') === "" ? null : $_POST['municipio'];
        $fecha_nacimiento = ($_POST['fecha_nacimiento'] ?? '') === "" ? null : $_POST['fecha_nacimiento'];
        $fecha_posesion   = ($_POST['fecha_posesion'] ?? '') === "" ? null : $_POST['fecha_posesion'];
        $fecha_resolucion = ($_POST['fecha_resolucion'] ?? '') === "" ? null : $_POST['fecha_resolucion'];
        $id_sede          = ($_POST['sede'] ?? '') === "" ? null : $_POST['sede'];
        $id_etnia         = ($_POST['etnia'] ?? '') === "" ? null : $_POST['etnia'];
        $id_rh            = ($_POST['tipo_sanguineo'] ?? '') === "" ? null : $_POST['tipo_sanguineo'];
        $id_cargo         = ($_POST['cargo_propiedad'] ?? '') === "" ? null : $_POST['cargo_propiedad'];
        $id_grado         = (!isset($_POST['grado']) || $_POST['grado'] === "" || $_POST['grado'] === "null") ? null : $_POST['grado'];
        $id_dependencia   = ($_POST['dependencia'] ?? '') === "" ? null : $_POST['dependencia'];
        $id_tipovinculacion = ($_POST['tipo_vinculacion'] ?? '') === "" ? null : $_POST['tipo_vinculacion'];
        $id_niveleducativo  = ($_POST['nivel_educativo'] ?? '') === "" ? null : $_POST['nivel_educativo'];
        $id_nivelfuncionario = ($_POST['nivel_funcionario'] ?? '') === "" ? null : $_POST['nivel_funcionario'];
        $id_victimaviolencia = ($_POST['victima_violencia'] ?? '') === "" ? null : $_POST['victima_violencia'];
        $codigo           = ($_POST['codigo'] ?? '') === "" ? null : $_POST['codigo'];
        $tipo_documento   = ($_POST['tipo_documento'] ?? '') === "" ? null : $_POST['tipo_documento'];
        $estado_civil     = ($_POST['estado_civil'] ?? '') === "" ? null : $_POST['estado_civil'];
        $pais_nacimiento  = ($_POST['pais_nacimiento'] ?? '') === "" ? null : $_POST['pais_nacimiento'];

        $ciudad_nacimiento = (
            !isset($_POST['ciudad_nacimiento']) ||
            $_POST['ciudad_nacimiento'] === "" ||
            $_POST['ciudad_nacimiento'] === "null"
        ) ? null : $_POST['ciudad_nacimiento'];

        $estrato = (
            isset($_POST['estrato_socioeconomico']) &&
            $_POST['estrato_socioeconomico'] !== "" &&
            $_POST['estrato_socioeconomico'] !== "null"
        ) ? (int)$_POST['estrato_socioeconomico'] : null;

        $ciudad_extranjero = ($_POST['ciudad_extranjero'] ?? '') === "" ? null : $_POST['ciudad_extranjero'];
        $otro_municipio    = ($_POST['otro_municipio'] ?? '') === "" ? null : $_POST['otro_municipio'];

        $id_departamento_nacimiento = (
            isset($_POST['id_departamento_nacimiento']) &&
            $_POST['id_departamento_nacimiento'] !== "" &&
            $_POST['id_departamento_nacimiento'] !== "null"
        ) ? $_POST['id_departamento_nacimiento'] : null;

        $necesidad_subsidio_vivienda = (
            isset($_POST['necesidad_subsidio_vivienda']) &&
            $_POST['necesidad_subsidio_vivienda'] !== "" &&
            $_POST['necesidad_subsidio_vivienda'] !== "null"
        ) ? $_POST['necesidad_subsidio_vivienda'] : null;

        // Campos booleanos / numéricos tipo flag
        $is_activo = isset($_POST['estado']) ? (int)$_POST['estado'] : 1;

        $is_actualizado = (
            isset($_POST['is_actualizado']) &&
            $_POST['is_actualizado'] !== "" &&
            $_POST['is_actualizado'] !== "null"
        ) ? 1 : 0; // BIT(1) → 0 / 1

        $estado_gestacion = ($_POST['estado_gestacion'] ?? '') === "" ? null : $_POST['estado_gestacion'];
        $discapacidad     = ($_POST['discapacidad'] ?? '') === "" ? null : $_POST['discapacidad'];
        $tipo_discapacidad = ($_POST['tipo_discapacidad'] ?? '') === "" ? null : $_POST['tipo_discapacidad'];

        $organizacion_sindical = ($_POST['id_organizacion_sindical'] ?? '') === "" ? null : $_POST['id_organizacion_sindical'];
        $derecho_car_admin     = ($_POST['derecho_car_admin'] ?? '') === "" ? null : $_POST['derecho_car_admin'];

        $is_viviendapropia = isset($_POST['is_viviendapropia']) ? (int)$_POST['is_viviendapropia'] : 0;
        $is_procesodisciplinario = isset($_POST['is_procesodisciplinario']) ? (int)$_POST['is_procesodisciplinario'] : 0;

        /* ============================================================
           🟦 INSERTAR
        ============================================================ */
        if ($stmt->rowCount() < 1) {

            $query = "INSERT INTO funcionarios(
                tipo_documento, documento, nombre, apellidos, is_actualizado,
                fecha_ingreso_nombra, profesion, genero, direccion, barrio,
                id_municipio, email, celular, fecha_nacimiento, edad,
                condicion_medica, desc_condicion_medica, id_sede, id_etnia, id_rh,
                id_dependencia, id_tipovinculacion, id_niveleducativo, id_nivelfuncionario,
                id_victimaviolencia, id_codigo, madre_padre, cabeza_familia,
                is_viviendapropia, estado_vivienda, id_cargo, id_grado, posgrado,
                ano_ingreso, is_procesodisciplinario, numero_proceso_dis, fecha_proceso_dis,
                numero_posesion, fecha_posesion, numero_resolucion, fecha_resolucion,
                modo_trabajo, archivo_laboral, archivo, ano_ingreso,
                id_municipio, id_estadocivil, pais_nacimiento, id_departamento_nacimiento,
                ciudad_nacimiento, ciudad_extranjero, otro_municipio, barrio,
                desc_condicion_medica, estado_gestacion, discapacidad,
                tipo_discapacidad, certificado_discapacidad, id_condicion_vulnerabilidad,
                id_organizacion_sindical, derecho_car_admin, estrato_socioeconomico,
                necesidad_subsidio_vivienda, is_activo
            ) VALUES (
                :tipo_documento, :documento, :nombre, :apellido, :is_actualizado,
                :fecha_ingreso_nombra, :profesion, :genero, :direccion, :barrio,
                :id_municipio, :email, :celular, :fecha_nacimiento, :edad,
                :condicion_medica, :desc_condicion_medica, :id_sede, :id_etnia, :id_rh,
                :id_dependencia, :id_tipovinculacion, :id_niveleducativo, :id_nivelfuncionario,
                :id_victimaviolencia, :id_codigo, :madre_padre, :cabeza_familia,
                :is_viviendapropia, :estado_vivienda, :id_cargo, :id_grado, :posgrado,
                :ano_ingreso, :is_procesodisciplinario, :numero_proceso_dis, :fecha_proceso_dis,
                :numero_posesion, :fecha_posesion, :numero_resolucion, :fecha_resolucion,
                :modo_trabajo, :archivo_lab, :archivo, :ano_ingreso,
                :id_municipio, :id_estadocivil, :pais_nacimiento, :id_departamento_nacimiento,
                :ciudad_nacimiento, :ciudad_extranjero, :otro_municipio, :barrio,
                :desc_condicion_medica2, :estado_gestacion, :discapacidad,
                :tipo_discapacidad, :certificado_discapacidad, :id_condicion_vulnerabilidad,
                :id_organizacion_sindical, :derecho_car_admin, :estrato_socioeconomico,
                :necesidad_subsidio_vivienda, :is_activo
            )";

            $stmt = $db->prepare($query);

            $stmt->bindValue(':tipo_documento', $tipo_documento);
            $stmt->bindValue(':documento', $_POST['documento']);
            $stmt->bindValue(':nombre', $_POST['nombre']);
            $stmt->bindValue(':apellido', $_POST['apellido']);
            $stmt->bindValue(':is_actualizado', $is_actualizado, PDO::PARAM_INT);
            $stmt->bindValue(':fecha_ingreso_nombra', $_POST['fecha_ingreso_nombra']);
            $stmt->bindValue(':profesion', $_POST['profesion'] ?? null);
            $stmt->bindValue(':genero', $_POST['genero']);
            $stmt->bindValue(':direccion', $_POST['direccion']);
            $stmt->bindValue(':barrio', $_POST['barrio'] ?? null);
            $stmt->bindValue(':id_municipio', $id_municipio);
            $stmt->bindValue(':email', $_POST['email']);
            $stmt->bindValue(':celular', $_POST['celular']);
            $stmt->bindValue(':fecha_nacimiento', $fecha_nacimiento);
            $stmt->bindValue(':edad', $_POST['edad']);
            $stmt->bindValue(':condicion_medica', $_POST['condicion_medica'] ?? null);
            $stmt->bindValue(':desc_condicion_medica', $_POST['desc_condicion_medica'] ?? null);
            $stmt->bindValue(':id_sede', $id_sede);
            $stmt->bindValue(':id_etnia', $id_etnia);
            $stmt->bindValue(':id_rh', $id_rh);
            $stmt->bindValue(':id_dependencia', $id_dependencia);
            $stmt->bindValue(':id_tipovinculacion', $id_tipovinculacion);
            $stmt->bindValue(':id_niveleducativo', $id_niveleducativo);
            $stmt->bindValue(':id_nivelfuncionario', $id_nivelfuncionario);
            $stmt->bindValue(':id_victimaviolencia', $id_victimaviolencia);
            $stmt->bindValue(':id_codigo', $codigo);
            $stmt->bindValue(':madre_padre', $_POST['madre_padre'] ?? null);
            $stmt->bindValue(':cabeza_familia', $_POST['cabeza_familia'] ?? null);
            $stmt->bindValue(':is_viviendapropia', $is_viviendapropia, PDO::PARAM_INT);
            $stmt->bindValue(':estado_vivienda', $_POST['estado_vivienda'] ?? null);
            $stmt->bindValue(':id_cargo', $id_cargo);
            $stmt->bindValue(':id_grado', $id_grado);
            $stmt->bindValue(':posgrado', $_POST['posgrado'] ?? null);
            $stmt->bindValue(':ano_ingreso', $_POST['ingreso'] ?? null);
            $stmt->bindValue(':is_procesodisciplinario', $is_procesodisciplinario, PDO::PARAM_INT);
            $stmt->bindValue(':numero_proceso_dis', $_POST['numero_proceso_dis'] ?? null);
            $stmt->bindValue(':fecha_proceso_dis', empty($_POST['fecha_proceso_dis']) ? null : $_POST['fecha_proceso_dis']);
            $stmt->bindValue(':numero_posesion', $_POST['num_posesion'] ?? null);
            $stmt->bindValue(':fecha_posesion', $fecha_posesion);
            $stmt->bindValue(':numero_resolucion', $_POST['num_resolucion'] ?? null);
            $stmt->bindValue(':fecha_resolucion', $fecha_resolucion);
            $stmt->bindValue(':modo_trabajo', $_POST['modo_trabajo'] ?? null);
            $stmt->bindValue(':archivo_lab', $location);
            $stmt->bindValue(':archivo', $locationFoto);
            $stmt->bindValue(':id_estadocivil', $estado_civil);
            $stmt->bindValue(':pais_nacimiento', $pais_nacimiento);
            $stmt->bindValue(':id_departamento_nacimiento', $id_departamento_nacimiento);
            $stmt->bindValue(':ciudad_nacimiento', $ciudad_nacimiento);
            $stmt->bindValue(':ciudad_extranjero', $ciudad_extranjero);
            $stmt->bindValue(':otro_municipio', $otro_municipio);
            $stmt->bindValue(':desc_condicion_medica2', $_POST['desc_condicion_medica'] ?? null);
            $stmt->bindValue(':estado_gestacion', $estado_gestacion);
            $stmt->bindValue(':discapacidad', $discapacidad);
            $stmt->bindValue(':tipo_discapacidad', $tipo_discapacidad);
            $stmt->bindValue(':certificado_discapacidad', $_POST['certificado_discapacidad'] ?? null);
            $stmt->bindValue(':id_condicion_vulnerabilidad', $_POST['id_condicion_vulnerabilidad'] ?? null);
            $stmt->bindValue(':id_organizacion_sindical', $organizacion_sindical);
            $stmt->bindValue(':derecho_car_admin', $derecho_car_admin);
            if ($estrato === null) {
                $stmt->bindValue(':estrato_socioeconomico', null, PDO::PARAM_NULL);
            } else {
                $stmt->bindValue(':estrato_socioeconomico', $estrato, PDO::PARAM_INT);
            }
            $stmt->bindValue(':necesidad_subsidio_vivienda', $necesidad_subsidio_vivienda);
            $stmt->bindValue(':is_activo', $is_activo, PDO::PARAM_INT);

            $stmt->execute();
            $id_funcionario2 = $db->lastInsertId();
            $resultado = "insert_ok";

        } else {

            /* ============================================================
               🟦 UPDATE POR BLOQUES
            ============================================================ */
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $id_funcionario2 = (int)$row['id_funcionario'];

            $datos = [
                // Bloque 1
                'tipo_documento' => $tipo_documento,
                'documento' => $_POST['documento'],
                'nombre' => $_POST['nombre'],
                'apellido' => $_POST['apellido'],
                'genero' => $_POST['genero'],
                'is_actualizado' => $is_actualizado,
                'fecha_nacimiento' => $fecha_nacimiento,
                'edad' => $_POST['edad'],
                'direccion' => $_POST['direccion'],
                'barrio' => $_POST['barrio'] ?? null,
                'id_municipio' => $id_municipio,
                'email' => $_POST['email'],
                'celular' => $_POST['celular'],
                'id_estadocivil' => $estado_civil,
                'pais_nacimiento' => $pais_nacimiento,
                'id_departamento_nacimiento' => $id_departamento_nacimiento,
                'ciudad_nacimiento' => $ciudad_nacimiento,
                'ciudad_extranjero' => $ciudad_extranjero,
                'otro_municipio' => $otro_municipio,
                'is_activo' => $is_activo,

                // Bloque 2
                'fecha_ingreso_nombra' => $_POST['fecha_ingreso_nombra'],
                'profesion' => $_POST['profesion'] ?? null,
                'id_sede' => $id_sede,
                'id_dependencia' => $id_dependencia,
                'id_tipovinculacion' => $id_tipovinculacion,
                'id_niveleducativo' => $id_niveleducativo,
                'id_nivelfuncionario' => $id_nivelfuncionario,
                'id_cargo' => $id_cargo,
                'id_grado' => $id_grado,
                'posgrado' => $_POST['posgrado'] ?? null,
                'ano_ingreso' => $_POST['ingreso'] ?? null,
                'id_codigo' => $codigo,
                'modo_trabajo' => $_POST['modo_trabajo'] ?? null,
                'archivo_lab' => $location,
                'archivo' => $locationFoto,

                // Bloque 3
                'condicion_medica' => $_POST['condicion_medica'] ?? null,
                'desc_condicion_medica' => $_POST['desc_condicion_medica'] ?? null,
                'id_etnia' => $id_etnia,
                'id_rh' => $id_rh,
                'id_victimaviolencia' => $id_victimaviolencia,
                'madre_padre' => $_POST['madre_padre'] ?? null,
                'cabeza_familia' => $_POST['cabeza_familia'] ?? null,
                'is_viviendapropia' => $is_viviendapropia,
                'estado_vivienda' => $_POST['estado_vivienda'] ?? null,
                'is_procesodisciplinario' => $is_procesodisciplinario,
                'numero_proceso_dis' => $_POST['numero_proceso_dis'] ?? null,
                'fecha_proceso_dis' => empty($_POST['fecha_proceso_dis']) ? null : $_POST['fecha_proceso_dis'],
                'numero_posesion' => $_POST['num_posesion'] ?? null,
                'fecha_posesion' => $fecha_posesion,
                'fecha_resolucion' => $fecha_resolucion,
                'numero_resolucion' => $_POST['num_resolucion'] ?? null,
                'estado_gestacion' => $estado_gestacion,
                'discapacidad' => $discapacidad,
                'tipo_discapacidad' => $tipo_discapacidad,
                'certificado_discapacidad' => $_POST['certificado_discapacidad'] ?? null,
                'id_condicion_vulnerabilidad' => $_POST['id_condicion_vulnerabilidad'] ?? null,
                'id_organizacion_sindical' => $organizacion_sindical,
                'derecho_car_admin' => $derecho_car_admin,
                'estrato_socioeconomico' => $estrato,
                'necesidad_subsidio_vivienda' => $necesidad_subsidio_vivienda,
            ];

            $filas = self::actualizarFuncionarioPorBloques($db, $id_funcionario2, $datos);
            $resultado = ($filas > 0) ? "update_ok" : "sin_cambios";
        }

        

        /* ============================================================
           🟦 DETALLE: EXPERIENCIA / FAMILIA / INFO ACADÉMICA
        ============================================================ */
        $exp  = self::crearExperiencia($db, $_POST['experiencia_ant'], $id_funcionario2);
        $fam  = self::crearNucleoFamiliar($db, $_POST['parientes'], $id_funcionario2);
        $acad = self::crearInfoAcademica($db, $_POST['infAcademica_ant'], $id_funcionario2);

        if (!empty($exp['error'])) {
            $data = $exp;
        } elseif (!empty($acad['error'])) {
            $data = $acad;
        } elseif (!empty($fam['error'])) {
            $data = $fam;
        } else {
            $msg = ($stmt->rowCount() < 1)
                ? 'funcionario registrado correctamente'
                : 'funcionario ha sido modificado correctamente';
            $data = array('success' => base64_encode($msg));
            $db->commit();
        }

    } catch (PDOException $e) {
        error_log('+** Error PDO: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage());
        $data = array('error' => base64_encode($e->getMessage()));
        $db->rollBack();
    } catch (Exception $e) {
        error_log('+** Error Exception: ' . __CLASS__ . ' ' . __FUNCTION__ . ': ' . $e->getMessage());
        $data = array('error' => base64_encode($e->getMessage()));
        $db->rollBack();
    }

    return $data;
}


/**
 * UPDATE dividido en 3 bloques para depuración detallada
 */
private static function actualizarFuncionarioPorBloques(PDO $db, int $id, array $d): int
{
    $total = 0;

    /* =======================================================
       🔷 BLOQUE 1 — Datos Básicos
    ======================================================= */
    try {
        $sql1 = "UPDATE funcionarios SET
            tipo_documento = :tipo_documento,
            documento = :documento,
            nombre = :nombre,
            apellidos = :apellido,
            genero = :genero,
            is_actualizado = :is_actualizado,
            fecha_nacimiento = :fecha_nacimiento,
            edad = :edad,
            direccion = :direccion,
            barrio = :barrio,
            id_municipio = :id_municipio,
            email = :email,
            celular = :celular,
            id_estadocivil = :id_estadocivil,
            pais_nacimiento = :pais_nacimiento,
            id_departamento_nacimiento = :id_departamento_nacimiento,
            ciudad_nacimiento = :ciudad_nacimiento,
            ciudad_extranjero = :ciudad_extranjero,
            otro_municipio = :otro_municipio,
            is_activo = :is_activo
        WHERE id_funcionario = :id";

        $st = $db->prepare($sql1);

        $st->bindValue(':id', $id, PDO::PARAM_INT);
        $st->bindValue(':tipo_documento', $d['tipo_documento']);
        $st->bindValue(':documento', $d['documento']);
        $st->bindValue(':nombre', $d['nombre']);
        $st->bindValue(':apellido', $d['apellido']);
        $st->bindValue(':genero', $d['genero']);
        $st->bindValue(':is_actualizado', (int)$d['is_actualizado'], PDO::PARAM_INT);
        $st->bindValue(':fecha_nacimiento', $d['fecha_nacimiento']);
        $st->bindValue(':edad', $d['edad']);
        $st->bindValue(':direccion', $d['direccion']);
        $st->bindValue(':barrio', $d['barrio']);
        $st->bindValue(':id_municipio', $d['id_municipio']);
        $st->bindValue(':email', $d['email']);
        $st->bindValue(':celular', $d['celular']);
        $st->bindValue(':id_estadocivil', $d['id_estadocivil']);
        $st->bindValue(':pais_nacimiento', $d['pais_nacimiento']);
        $st->bindValue(':id_departamento_nacimiento', $d['id_departamento_nacimiento']);
        $st->bindValue(':ciudad_nacimiento', $d['ciudad_nacimiento']);
        $st->bindValue(':ciudad_extranjero', $d['ciudad_extranjero']);
        $st->bindValue(':otro_municipio', $d['otro_municipio']);
        $st->bindValue(':is_activo', (int)$d['is_activo'], PDO::PARAM_INT);

        $st->execute();
        $total += $st->rowCount();

    } catch (Exception $e) {
        throw new Exception("Error bloque 1 (datos básicos): " . $e->getMessage(), 1001);
    }

    /* =======================================================
       🔷 BLOQUE 2 — Información laboral / académica
    ======================================================= */
    try {
        $sql2 = "UPDATE funcionarios SET
            fecha_ingreso_nombra = :fecha_ingreso_nombra,
            profesion = :profesion,
            id_sede = :id_sede,
            id_dependencia = :id_dependencia,
            id_tipovinculacion = :id_tipovinculacion,
            id_niveleducativo = :id_niveleducativo,
            id_nivelfuncionario = :id_nivelfuncionario,
            id_cargo = :id_cargo,
            id_grado = :id_grado,
            posgrado = :posgrado,
            ano_ingreso = :ano_ingreso,
            id_codigo = :id_codigo,
            modo_trabajo = :modo_trabajo,
            archivo_laboral = :archivo_lab,
            archivo = :archivo
        WHERE id_funcionario = :id";

        $st = $db->prepare($sql2);

        $st->bindValue(':id', $id, PDO::PARAM_INT);
        $st->bindValue(':fecha_ingreso_nombra', $d['fecha_ingreso_nombra']);
        $st->bindValue(':profesion', $d['profesion']);
        $st->bindValue(':id_sede', $d['id_sede']);
        $st->bindValue(':id_dependencia', $d['id_dependencia']);
        $st->bindValue(':id_tipovinculacion', $d['id_tipovinculacion']);
        $st->bindValue(':id_niveleducativo', $d['id_niveleducativo']);
        $st->bindValue(':id_nivelfuncionario', $d['id_nivelfuncionario']);
        $st->bindValue(':id_cargo', $d['id_cargo']);
        $st->bindValue(':id_grado', $d['id_grado']);
        $st->bindValue(':posgrado', $d['posgrado']);
        $st->bindValue(':ano_ingreso', $d['ano_ingreso']);
        $st->bindValue(':id_codigo', $d['id_codigo']);
        $st->bindValue(':modo_trabajo', $d['modo_trabajo']);
        $st->bindValue(':archivo_lab', $d['archivo_lab']);
        $st->bindValue(':archivo', $d['archivo']);

        $st->execute();
        $total += $st->rowCount();

    } catch (Exception $e) {
        throw new Exception("Error bloque 2 (laboral/académico): " . $e->getMessage(), 1002);
    }

    /* =======================================================
       🔷 BLOQUE 3 — Salud, vulnerabilidad, proceso disciplinario
    ======================================================= */
    try {
        $sql3 = "UPDATE funcionarios SET
            condicion_medica = :condicion_medica,
            desc_condicion_medica = :desc_condicion_medica,
            id_etnia = :id_etnia,
            id_rh = :id_rh,
            id_victimaviolencia = :id_victimaviolencia,
            madre_padre = :madre_padre,
            cabeza_familia = :cabeza_familia,
            is_viviendapropia = :is_viviendapropia,
            estado_vivienda = :estado_vivienda,
            is_procesodisciplinario = :is_procesodisciplinario,
            numero_proceso_dis = :numero_proceso_dis,
            fecha_proceso_dis = :fecha_proceso_dis,
            numero_posesion = :numero_posesion,
            fecha_posesion = :fecha_posesion,
            fecha_resolucion = :fecha_resolucion,
            numero_resolucion = :numero_resolucion,
            estado_gestacion = :estado_gestacion,
            discapacidad = :discapacidad,
            tipo_discapacidad = :tipo_discapacidad,
            certificado_discapacidad = :certificado_discapacidad,
            id_condicion_vulnerabilidad = :id_condicion_vulnerabilidad,
            id_organizacion_sindical = :id_organizacion_sindical,
            derecho_car_admin = :derecho_car_admin,
            estrato_socioeconomico = :estrato_socioeconomico,
            necesidad_subsidio_vivienda = :necesidad_subsidio_vivienda
        WHERE id_funcionario = :id";

        $st = $db->prepare($sql3);

        $st->bindValue(':id', $id, PDO::PARAM_INT);
        $st->bindValue(':condicion_medica', $d['condicion_medica']);
        $st->bindValue(':desc_condicion_medica', $d['desc_condicion_medica']);
        $st->bindValue(':id_etnia', $d['id_etnia']);
        $st->bindValue(':id_rh', $d['id_rh']);
        $st->bindValue(':id_victimaviolencia', $d['id_victimaviolencia']);
        $st->bindValue(':madre_padre', $d['madre_padre']);
        $st->bindValue(':cabeza_familia', $d['cabeza_familia']);
        $st->bindValue(':is_viviendapropia', (int)$d['is_viviendapropia'], PDO::PARAM_INT);
        $st->bindValue(':estado_vivienda', $d['estado_vivienda']);
        $st->bindValue(':is_procesodisciplinario', (int)$d['is_procesodisciplinario'], PDO::PARAM_INT);
        $st->bindValue(':numero_proceso_dis', $d['numero_proceso_dis']);
        $st->bindValue(':fecha_proceso_dis', $d['fecha_proceso_dis']);
        $st->bindValue(':numero_posesion', $d['numero_posesion']);
        $st->bindValue(':fecha_posesion', $d['fecha_posesion']);
        $st->bindValue(':fecha_resolucion', $d['fecha_resolucion']);
        $st->bindValue(':numero_resolucion', $d['numero_resolucion']);
        $st->bindValue(':estado_gestacion', $d['estado_gestacion']);
        $st->bindValue(':discapacidad', $d['discapacidad']);
        $st->bindValue(':tipo_discapacidad', $d['tipo_discapacidad']);
        $st->bindValue(':certificado_discapacidad', $d['certificado_discapacidad']);
        $st->bindValue(':id_condicion_vulnerabilidad', $d['id_condicion_vulnerabilidad']);
        $st->bindValue(':id_organizacion_sindical', $d['id_organizacion_sindical']);
        $st->bindValue(':derecho_car_admin', $d['derecho_car_admin']);
        if ($d['estrato_socioeconomico'] === null) {
            $st->bindValue(':estrato_socioeconomico', null, PDO::PARAM_NULL);
        } else {
            $st->bindValue(':estrato_socioeconomico', (int)$d['estrato_socioeconomico'], PDO::PARAM_INT);
        }
        $st->bindValue(':necesidad_subsidio_vivienda', $d['necesidad_subsidio_vivienda']);

        $st->execute();
        $total += $st->rowCount();

    } catch (Exception $e) {
        throw new Exception("Error bloque 3 (salud/proceso/vulnerabilidad): " . $e->getMessage(), 1003);
    }

    return $total;
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
  
public static function crearInfoAcademica($conn, $params, $funcionario)
{
    try {
        self::validPermissions(1);
        $params = json_decode($params);
         //var_dump($_FILES);

                    // ======================================
// 1. ELIMINAR
// ======================================
if (!empty($_POST['infoAcademicaEliminados'])) {
    $idsEliminar = explode(",", $_POST['infoAcademicaEliminados']);
    foreach ($idsEliminar as $id) {
        $id = intval($id);
         // Verificar un registro de información académica
            $query = "SELECT * FROM informacion_academica WHERE id_infoacademica = :id;";
            $stmt = $conn->prepare($query);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $insert = $stmt->fetch(PDO::FETCH_ASSOC);
              // valido si el archivo existe lo elimino de la ruta 
            if(!empty($insert) && file_exists($insert['archivo_academico'])){
                 unlink($insert['archivo_academico']);
                 echo "eliminando arch de la ruta";
            }else{  echo "no hay registro para eliminar arch de la ruta"; }

        $query = "DELETE FROM informacion_academica WHERE id_infoacademica = :id";
        $stmt = $conn->prepare($query);
        $stmt->bindValue(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
    }
}

        // ===========================================
// PREPARAR ÍNDICES REALES DE ARCHIVOS
// ===========================================
$archivoKeys = isset($_FILES['archivo_academico']['name'])
    ? array_keys($_FILES['archivo_academico']['name'])
    : [];

$archivoIndexPos = 0; // Apuntador sobre archivos reales

// ===========================================
// RECORRER INFORMACIÓN ACADÉMICA
// ===========================================
foreach ($params as $index => $InfoAcad) {

    if (!is_object($InfoAcad) || empty((array)$InfoAcad)) {
        continue;
    }

    //echo "Info Academica: ".$InfoAcad->profesion." No. ".$InfoAcad->id_infoacademica."<br>";

    // Buscar si existe registro
    $query = "SELECT * FROM informacion_academica WHERE id_infoacademica = :id;";
    $stmt = $conn->prepare($query);
    $stmt->bindValue(':id', $InfoAcad->id_infoacademica);
    $stmt->execute();
    $insert = $stmt->fetch(PDO::FETCH_ASSOC);

    $filePath = "";
    $filePath_ant = "";

    // ================================
    // DETERMINAR SI HAY ARCHIVO REAL
    // ================================
    $hayArchivo = false;
    $realFileIndex = null;

    if (isset($archivoKeys[$archivoIndexPos])) {
        $realFileIndex = $archivoKeys[$archivoIndexPos];
        $archivoNombre = $_FILES['archivo_academico']['name'][$realFileIndex];

        if (!empty($archivoNombre)) {
            $hayArchivo = true;
        }
    }
    // ====================================================================================
    // CASO 1: UPDATE (el registro YA existe)
    // ====================================================================================
    if (!empty($insert)) {

        echo "existe registro INDEX: $index de esta informacion academica $InfoAcad->id_infoacademica<br>";

        // Mantener archivo anterior en caso de no subir uno nuevo
        $filePath = $insert['archivo_academico'];

        if ($hayArchivo) {

    $directorio = "views/archivos/academicos/";
    $filename = str_replace(" ", "_", $_FILES['archivo_academico']['name'][$realFileIndex]);
    $imgType  = pathinfo($filename, PATHINFO_EXTENSION);
    $filename = time() . '_' . uniqid() . '.' . $imgType;
    $filePath = $directorio . $filename;
    $imgSize  = $_FILES['archivo_academico']['size'][$realFileIndex];

    //echo "llego archivo → $filePath<br>";

    if ($imgSize > 5242880) { return ['error'=>base64_encode('Archivo mayor a 5MB')]; }
    if (!in_array($imgType, ['pdf','doc','docx','txt'])) { return ['error'=>base64_encode('Archivo no permitido')]; }

    move_uploaded_file($_FILES['archivo_academico']['tmp_name'][$realFileIndex], $filePath);
} else {
           // echo "no llego archivo (UPDATE) <br>";
        }

        // Actualizar
        $query = "UPDATE informacion_academica 
                  SET profesion=:prof, id_niveleducativo=:niv, posgrado=:posg, archivo_academico=:arch,
                   nombre_institucion = :nombre_institucion,
              fecha_grado = :fecha_grado,
              tarjeta_registro = :tarjeta_registro
                  WHERE id_infoacademica=:id";
        $stmt = $conn->prepare($query);
        $stmt->execute([
            ':id'   => $InfoAcad->id_infoacademica,
            ':prof' => $InfoAcad->profesion,
            ':niv'  => $InfoAcad->nivel_educativo,
            ':posg' => $InfoAcad->posgrado,
            ':arch' => $filePath,
            ':nombre_institucion' => $InfoAcad->nombre_institucion,
            ':fecha_grado' => $InfoAcad->fecha_grado,
            ':tarjeta_registro' => $InfoAcad->tarjeta_registro

        ]);

        if ($filePath_ant && file_exists($filePath_ant)) {
            unlink($filePath_ant);
        }

        $archivoIndexPos++;

    }
    // ====================================================================================
    // CASO 2: INSERT (el registro NO existe)
    // ====================================================================================
    else {

       // echo "no existe registro INDEX: $index de esta informacion academica $InfoAcad->id_infoacademica<br>";

        if (!empty($InfoAcad->profesion)) {

            if ($hayArchivo) {

                $directorio = "views/archivos/academicos/";
                $filename = str_replace(" ", "_", $_FILES['archivo_academico']['name'][$realFileIndex]);
                $imgType  = pathinfo($filename, PATHINFO_EXTENSION);
                $filename = time() . '_' . uniqid() . '.' . $imgType;
                $filePath = $directorio . $filename;
                $imgSize  = $_FILES['archivo_academico']['size'][$realFileIndex];

                //echo "llego archivo (INSERT) → $filePath<br>";

                if ($imgSize > 5242880) { return ['error'=>base64_encode('Archivo mayor a 5MB')]; }
                if (!in_array($imgType, ['pdf','doc','docx','txt'])) { return ['error'=>base64_encode('Archivo no permitido')]; }

                move_uploaded_file($_FILES['archivo_academico']['tmp_name'][$realFileIndex], $filePath);

                $archivoIndexPos++;
            } else {
               // echo "no llego archivo (INSERT)<br>";
            }

            // Insertar
            $query = "INSERT INTO informacion_academica (profesion,id_niveleducativo,posgrado,archivo_academico,id_funcionario,
            nombre_institucion, fecha_grado, tarjeta_registro)
                      VALUES (:prof,:niv,:posg,:arch,:func,:nombre_institucion, :fecha_grado, :tarjeta_registro)";
            $stmt = $conn->prepare($query);
            $stmt->execute([
                ':prof' => $InfoAcad->profesion,
                ':niv'  => $InfoAcad->nivel_educativo,
                ':posg' => $InfoAcad->posgrado,
                ':arch' => $filePath,
                ':func' => $funcionario,
                ':nombre_institucion' => $InfoAcad->nombre_institucion,
                ':fecha_grado' => $InfoAcad->fecha_grado,
                ':tarjeta_registro' => $InfoAcad->tarjeta_registro
            ]);
        }
    }
}

    } catch (Exception $err) {
        error_log($err->getMessage());
        return array('error' => base64_encode($err->getMessage()));
    }
    return array('success' => base64_encode('Información académica guardada correctamente'));
}


  
  public static function getInfoAcademica($conn, $id_funcionario) {
    $query = "SELECT * FROM informacion_academica WHERE id_funcionario = :id_funcionario";
    $stmt = $conn->prepare($query);
    $stmt->bindValue(':id_funcionario', $id_funcionario, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
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
          $query = "INSERT INTO nucleo_familiar(nombres, apellidos, edad, fecha_nacimiento, id_parentesco, is_emergencia,id_funcionario, contacto, contacto_2, parentesco, is_dependiente_eco) 
          VALUE(:nombre_p, :apellido_p, :edad_p, :fecha_nac_p,:parentesco_p,  :is_emergencia, :id_funcionario, :contacto, :contacto_2, :parentesco_otro, :is_dependiente_eco);";
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
          $stmt->bindValue(':is_dependiente_eco', (int)$familiar->is_dependiente_eco, PDO::PARAM_INT);
          
          $stmt->execute();
        } else {
          $query = "UPDATE nucleo_familiar SET nombres = :nombre_p, apellidos = :apellido_p, edad = :edad_p, fecha_nacimiento = :fecha_nac_p, 
          id_parentesco = :parentesco_p, is_emergencia = :is_emergencia, id_funcionario = :id_funcionario, contacto = :contacto,
          contacto_2 = :contacto_2, parentesco = :parentesco_otro, is_dependiente_eco = :is_dependiente_eco WHERE id_nucleofamiliar = :id_nucleofamiliar;";
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
          $stmt->bindValue(':is_dependiente_eco', (int)$familiar->is_dependiente_eco, PDO::PARAM_INT);
          
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
