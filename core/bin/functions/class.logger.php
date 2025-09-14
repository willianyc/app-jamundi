<?php

abstract class Logger
{


	public static function guardar_accion(PDO $conn, $opcion, $concepto)
	{
		$table = $_SESSION['is_master'] == '1' ? 'logger_master' : 'logger';
		try {
			$query   = "INSERT INTO $table (opcion, concepto, usuario, ipv6)
			VALUES (:opcion, :concepto, :usuario, :ipv6);";
			$bind = array(
				':opcion' => strtoupper($opcion),
				':concepto' => strtoupper($concepto),
				':usuario' => $_SESSION['usuario'],
				':ipv6' => $_SERVER['REMOTE_ADDR'],
			);

			$stmt = $conn->prepare($query);
			$stmt->execute($bind);
		} catch (PDOException $e) {
			throw new Exception('+** Error PDO: Logger::' . __FUNCTION__ . ': ' . $e->getMessage() . ' - [bind]: ' . print_r($bind, 1), 100);
			return false;
		}
		return true;
	}
}
