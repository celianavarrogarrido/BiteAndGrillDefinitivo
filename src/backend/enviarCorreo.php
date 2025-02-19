<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// 💡 Ajuste de ruta al autoload de Composer
require __DIR__ . '/../../vendor/autoload.php';

// Obtener datos desde el JavaScript
$data = json_decode(file_get_contents("php://input"), true);

$nombre = $data['nombre'] ?? 'Cliente';
$email = $data['email'] ?? 'correo@ejemplo.com';
$direccion = $data['direccion'] ?? 'Sin dirección';
$telefono = $data['telefono'] ?? 'Sin teléfono';
$total = $data['total'] ?? '0.00';

try {
    $mail = new PHPMailer(true);

    // Configuración SMTP (Gmail en este ejemplo)
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'biteandgrill@gmail.com'; //
    $mail->Password = 'kgvq nfbn grre jwuv'; // Clave de Aplicación para que sea más seguro
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port = 587;

    // Remitente y destinatario
    $mail->setFrom('biteandgrill@gmail.com', 'Bite & Grill');
    $mail->addAddress($email, $nombre);

    // Contenido del correo
    $mail->isHTML(true);
    $mail->Subject = 'Confirmacion de tu pedido - Bite & Grill';
    $mail->Body = "
    <h2>¡Gracias por tu pedido, $nombre!</h2>
    <p><strong>Dirección:</strong> $direccion</p>
    <p><strong>Teléfono:</strong> $telefono</p>
    <p><strong>Total del pedido:</strong> $total €</p>
    <br>
    <p>En breve comenzaremos a preparar tu pedido. ¡Buen provecho! 🍔🔥</p>";

    // Enviar correo
    if ($mail->send()) {
        echo "✅ Correo enviado correctamente.";
    } else {
        echo "❌ Error al enviar el correo.";
    }

} catch (Exception $e) {
    echo "❌ Error al enviar el correo: {$mail->ErrorInfo}";
}
?>
