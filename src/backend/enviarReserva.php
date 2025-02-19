<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require __DIR__ . '/../../vendor/autoload.php'; // Asegúrate de que el autoload de Composer esté correcto

// Obtener datos desde el JavaScript
$data = json_decode(file_get_contents("php://input"), true);
$nombre = $data['nombre'] ?? 'Cliente';
$correo = $data['correo'] ?? 'correo@prueba.com';
$telefono = $data['telefono'] ?? 'Sin teléfono';
$restaurante = $data['restaurante'] ?? 'No especificado';
$personas = $data['personas'] ?? '0';
$fechaHora = $data['fechaHora'] ?? 'Sin fecha';

try {
    $mail = new PHPMailer(true);

    // Configuración del servidor SMTP
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'biteandgrill@gmail.com';
    $mail->Password = 'kgvq nfbn grre jwuv'; // Clave de Aplicación para que sea más seguro
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port = 587;

    // Remitente y destinatario
    $mail->setFrom('biteandgrill@gmail.com', 'Bite & Grill');
    $mail->addAddress($correo, $nombre);

    // Contenido del correo
    $mail->isHTML(true);
    $mail->Subject = 'Confirmacion de tu reserva - Bite & Grill';
    $mail->Body = "
    <h2>¡Hola, $nombre!</h2>
    <p>Tu reserva en <strong>$restaurante</strong> ha sido confirmada.</p>
    <p><strong>Fecha y Hora:</strong> $fechaHora</p>
    <p><strong>Número de personas:</strong> $personas</p>
    <p><strong>Teléfono:</strong> $telefono</p>
    <br>
    <p>¡Gracias por elegirnos! Te esperamos en <strong>$restaurante</strong>. 🍔🔥</p>";

    // Enviar el correo
    if ($mail->send()) {
        echo "Reserva confirmada y correo enviado correctamente.";
    } else {
        echo "Error al enviar el correo.";
    }

} catch (Exception $e) {
    echo "Error al enviar el correo: {$mail->ErrorInfo}";
}
?>
