<?php

//Este archivo recibe la decisión del usuario y crea una cookie para almacenarla en el servidor.

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["cookiesStatus"])) {
    $status = $_POST["cookiesStatus"];

    // Duración de la cookie: 1 año
    setcookie("cookiesAccepted", $status, time() + (365 * 24 * 60 * 60), "/");

    echo "Cookie configurada con estado: " . $status;
}
?>




