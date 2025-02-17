-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-02-2025 a las 13:33:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bite&grill`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `ID_Carrito` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Productos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Correo_electronico` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecarrito`
--

CREATE TABLE `detallecarrito` (
  `ID_DetalleCarrito` int(11) NOT NULL,
  `ID_Carrito` int(11) DEFAULT NULL,
  `ID_Productos` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Pedido` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `ID_Envio` int(11) NOT NULL,
  `ID_Pedido` int(11) DEFAULT NULL,
  `Direccion_Entrega` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locales`
--

CREATE TABLE `locales` (
  `ID_Local` int(11) NOT NULL,
  `Nombre_Local` varchar(100) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `locales`
--

INSERT INTO `locales` (`ID_Local`, `Nombre_Local`, `Direccion`) VALUES
(1, 'Sabor Urbano', 'Av. Andalucía 123, Sevilla'),
(2, 'La Parrilla Secreta', 'Av. Kansas City 456, Sevilla'),
(3, 'The Meat Lab', 'Av. de la Paz 121, Sevilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `ID_Pago` int(11) NOT NULL,
  `ID_Pedido` int(11) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `Metodo_Pago` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL,
  `Categoria` varchar(50) DEFAULT NULL,
  `Nombre_Producto` varchar(100) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Alergenos` text DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_Producto`, `Categoria`, `Nombre_Producto`, `Descripcion`, `Alergenos`, `Precio`, `Stock`) VALUES
(1, 'Bebidas', 'Margaritas', 'Cóctel de tequila, licor de naranja y lima', 'Contiene alcohol', 8.00, 100),
(2, 'Bebidas', 'Cerveza', 'Cerveza fría, refrescante', 'Contiene gluten', 5.00, 200),
(3, 'Bebidas', 'Refrescos', 'Bebidas gaseosas de diferentes sabores', 'Puede contener trazas de cafeína', 1.50, 300),
(4, 'Bebidas', 'Mojitos', 'Cóctel de ron, menta, lima y azúcar', 'Contiene alcohol', 8.00, 100),
(5, 'Ensaladas', 'Ensalada Mediterránea', 'Ensalada con tomate, pepino, aceitunas, cebolla roja, queso feta', 'Contiene lácteos', 4.50, 150),
(6, 'Ensaladas', 'Ensalada César', 'Ensalada con lechuga romana, crutones, aderezo César y queso parmesano', 'Contiene lácteos, gluten', 5.50, 150),
(7, 'Entrantes', 'Alitas Picantes', 'Alitas de pollo en salsa picante', 'Contiene gluten, puede contener trazas de soja', 9.00, 120),
(8, 'Entrantes', 'Tequeños', 'Pasta rellena de queso, frita hasta dorarse', 'Contiene gluten, lácteos', 10.00, 100),
(9, 'Entrantes', 'Aros de Cebolla', 'Cebolla empanada y frita', 'Contiene gluten', 5.00, 130),
(10, 'Entrantes', 'Tiras de pollo', 'Pollo empanado y frito, servido con salsa', 'Contiene gluten', 12.00, 110),
(11, 'Hamburguesas', 'La Giralda', 'Hamburguesa de carne de res con lechuga, tomate, cebolla y salsa especial', 'Contiene gluten', 9.00, 150),
(12, 'Hamburguesas', 'Maestranza', 'Hamburguesa de carne de res con queso cheddar, bacon y cebolla caramelizada', 'Contiene gluten, lácteos', 10.00, 140),
(13, 'Hamburguesas', 'El Alcázar', 'Hamburguesa de carne de res con queso azul, champiñones y cebolla caramelizada', 'Contiene gluten, lácteos', 12.00, 130),
(14, 'Hamburguesas', 'Torre del Oro', 'Hamburguesa de carne de res con huevo frito, bacon y salsa barbacoa', 'Contiene gluten, lácteos', 12.00, 120),
(15, 'Hamburguesas', 'Archivo de Indias', 'Hamburguesa de carne de res con guacamole, bacon y cebolla morada', 'Contiene gluten, lácteos', 15.00, 110),
(16, 'Hamburguesas', 'Alameda', 'Hamburguesa vegetariana con quinoa, espinacas, tomate y mayonesa vegana', 'Contiene gluten', 13.00, 100),
(17, 'Postres', 'Tarta Oreo', 'Tarta con galletas Oreo y crema de queso', 'Contiene gluten, lácteos', 5.00, 80),
(18, 'Postres', 'Tarta Galleta', 'Tarta de galletas con crema de chocolate', 'Contiene gluten, lácteos', 4.00, 90),
(19, 'Postres', 'Tarta Pistacho', 'Tarta con crema de pistacho y base crujiente', 'Contiene frutos secos, lácteos', 5.00, 70),
(20, 'Postres', 'Tarta Chocolate', 'Tarta de chocolate negro con base de galleta', 'Contiene gluten, lácteos', 6.00, 60),
(21, 'Postres', 'Tarta Queso', 'Tarta de queso con mermelada de frutos rojos', 'Contiene gluten, lácteos', 5.50, 80),
(22, 'Postres', 'Batidos', 'Batidos cremosos de diferentes sabores', 'Contiene lácteos', 7.00, 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `ID_Reserva` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Local` int(11) DEFAULT NULL,
  `Fecha_Hora` datetime DEFAULT NULL,
  `Numero_Personas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`ID_Carrito`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Productos` (`ID_Productos`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD UNIQUE KEY `Correo_electronico` (`Correo_electronico`);

--
-- Indices de la tabla `detallecarrito`
--
ALTER TABLE `detallecarrito`
  ADD PRIMARY KEY (`ID_DetalleCarrito`),
  ADD KEY `ID_Carrito` (`ID_Carrito`),
  ADD KEY `ID_Productos` (`ID_Productos`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Pedido` (`ID_Pedido`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`ID_Envio`),
  ADD KEY `ID_Pedido` (`ID_Pedido`);

--
-- Indices de la tabla `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`ID_Local`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_Pago`),
  ADD KEY `ID_Pedido` (`ID_Pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`ID_Reserva`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Local` (`ID_Local`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`ID_Productos`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `detallecarrito`
--
ALTER TABLE `detallecarrito`
  ADD CONSTRAINT `detallecarrito_ibfk_1` FOREIGN KEY (`ID_Carrito`) REFERENCES `carrito` (`ID_Carrito`),
  ADD CONSTRAINT `detallecarrito_ibfk_2` FOREIGN KEY (`ID_Productos`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`ID_Local`) REFERENCES `locales` (`ID_Local`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
