<?php

phpinfo();
/**
 * Test de conexión a MySQL por PDO
 */

// Configuración
$host = 'db';   // o el nombre del servicio en docker-compose.yml, por ejemplo 'db'
$port = '3306';
$dbname = 'appjamundi';
$user = 'appuser';
$pass = 'apppass';

// Cadena DSN
$dsn = "mysql:host=$host;port=$port;dbname=$dbname;charset=utf8";

echo "<h2>🔍 Test de conexión a la base de datos</h2>";

try {
    // Intentar conexión
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,           // Modo de errores por excepción
        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET sql_mode="TRADITIONAL"',
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    echo "<p style='color:green;'>✅ Conexión exitosa a la base de datos <strong>$dbname</strong>.</p>";

    // Probar una consulta simple
    $stmt = $pdo->query("SELECT NOW() AS fecha_actual");
    $row = $stmt->fetch();
    echo "<p>🕒 Fecha actual del servidor MySQL: <strong>{$row['fecha_actual']}</strong></p>";

} catch (PDOException $e) {
    echo "<p style='color:red;'>❌ Error de conexión:</p>";
    echo "<pre>" . htmlspecialchars($e->getMessage()) . "</pre>";
}
