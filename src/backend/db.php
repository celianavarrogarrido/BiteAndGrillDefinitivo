<?php
$host = "localhost";
$user = "root"; 
$pass = ""; /
$dbname = "bite_grill";

$conn = new mysqli($host, $user, $pass, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Configurar el juego de caracteres a utf8
$conn->set_charset("utf8");

?>
