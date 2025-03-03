# Bite & Grill - Proyecto Web Completo

## Descripción
Bite & Grill es un sitio web desarrollado para gestionar un restaurante de hamburguesas. Incluye funcionalidades como:
- Visualización del menú con productos dinámicos desde la base de datos.
- Gestión de pedidos a domicilio y reservas.
- Envío de correos de confirmación para reservas.
- Integración con Uber Eats para pedidos.
- Diseño responsivo y atractivo.

## Tecnologías Utilizadas
- **Frontend:** HTML, CSS, Bootstrap, JavaScript
- **Backend:** PHP con conexión a MySQL
- **Base de Datos:** MySQL (`bite_grill.sql`)
- **Email SMTP:** Envío de correos con PHP
- **Composer:** Gestión de dependencias PHP

## Requisitos de Instalación
Antes de ejecutar el proyecto, asegúrate de tener instalado:
- **PHP 7.4 o superior**
- **MySQL 5.7 o superior**
- **Composer**
- **Servidor local (XAMPP, WAMP, MAMP, Laragon)**

## Configuración de la Base de Datos
1. Importa el archivo `bite_grill.sql` en MySQL.
2. Modifica `src/backend/db.php` con tus credenciales de base de datos:
```php
$host = "localhost";
$user = "root"; // Cambiar si es necesario
$password = ""; // Cambiar si es necesario
$database = "bite_grill";
```

## Configuración del Servidor SMTP (Correo Electrónico)
Para que el sistema de reservas funcione correctamente, configura el envío de correos en `src/backend/enviarCorreo.php` y `src/backend/enviarReserva.php`:
```php
$mail->Host = 'smtp.tudominio.com'; // Servidor SMTP
$mail->Username = 'tuemail@tudominio.com'; // Correo remitente
$mail->Password = 'tucontraseña'; // Contraseña del correo
$mail->SMTPSecure = 'tls';
$mail->Port = 587;
```

## Instalación y Ejecución
1. Clona el repositorio:
```bash
git clone https://github.com/celianavarrogarrido/BiteAndGrillDefinitivo.git
```
2. Accede al directorio del proyecto:
```bash
cd BiteAndGrillDefinitivo
```
3. Instala las dependencias de PHP:
```bash
composer install
```
4. Inicia el servidor local:
```bash
php -S localhost:8000 -t .
```
5. Abre en el navegador:
```
http://localhost:8000/
```

## Estructura del Proyecto
```
BiteAndGrillDefinitivo/
│── src/
│   ├── backend/ (Archivos PHP del servidor)
│   ├── images/ (Imágenes y recursos estáticos)
│── index.html (Página principal)
│── bite_grill.sql (Base de datos)
│── composer.json (Dependencias PHP)
│── README.md (Este archivo)
```

## Contacto
Si tienes dudas o mejoras, contáctanos en:
📧 Email: contacto@biteandgrill.com

