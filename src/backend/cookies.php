<?php
header("Access-Control-Allow-Origin: http://127.0.0.1:5500"); // Cambia * si usas credenciales
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Credentials: true"); // Solo si manejas cookies o autenticación

if ($_SERVER["REQUEST_METHOD"] === "OPTIONS") {
    http_response_code(200);
    exit();
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST["cookiesStatus"])) {
        echo "Cookie status recibido: " . htmlspecialchars($_POST["cookiesStatus"]);
    } else {
        echo "No se recibió ninguna variable cookiesStatus";
    }
} else {
    http_response_code(405);
    echo "Método no permitido";
}
?>
