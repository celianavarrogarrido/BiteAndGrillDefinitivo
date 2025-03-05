<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json');

include 'db.php'; // Incluir la conexión a la base de datos

$sql = "SELECT * FROM productos";
$result = $conn->query($sql);

$productos = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $productos[] = $row;
    }
}

echo json_encode($productos, JSON_PRETTY_PRINT); // Enviar los datos como JSON
$conn->close();
?>
