<?php
header("Access-Control-Allow-Origin: *"); // Permite cualquier origen (cuidado en producción)
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

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
