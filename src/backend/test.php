<?php
include "db.php";

$sql = "SELECT * FROM productos";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "Producto: " . $row["Nombre_Producto"] . " - Precio: " . $row["Precio"] . "<br>";
    }
} else {
    echo "No hay productos.";
}

$conn->close();
?>
