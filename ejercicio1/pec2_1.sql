CREATE DATABASE pec2_1;

-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2017 a las 20:23:04
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31
USE pec2_1;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pedidos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `CodCat` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`CodCat`, `Nombre`, `Descripcion`) VALUES
(1, 'Comida', 'Platos e ingredientes'),
(2, 'Bedidas sin', 'Bebidas sin alcohol'),
(3, 'Bebidas con', 'Bebidas con alcohol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `CodPed` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Enviado` int(11) NOT NULL,
  `Restaurante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosproductos`
--

CREATE TABLE `pedidosproductos` (
  `CodPredProd` int(11) NOT NULL,
  `CodPed` int(11) NOT NULL,
  `CodProd` int(11) NOT NULL,
  `Unidades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `CodProd` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(90) NOT NULL,
  `Peso` float NOT NULL,
  `Stock` int(11) NOT NULL,
  `CodCat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`CodProd`, `Nombre`, `Descripcion`, `Peso`, `Stock`, `CodCat`) VALUES
(1, 'Harina', '8 paquetes de 1kg de harina cada uno', 8, 100, 1),
(2, 'Azúcar', '20 paquetes de 1kg cada uno', 20, 3, 1),
(3, 'Agua 0.5', '100 botellas de 0.5 litros cada una', 51, 100, 2),
(4, 'Agua 1.5', '20 botellas de 1.5 litros cada una', 31, 50, 2),
(5, 'Cerveza Alhambra tercio', '24 botellas de 33cl', 10, 0, 3),
(6, 'Vino tinto Rioja 0.75', '6 botellas de 0.75 ', 5.5, 10, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurantes`
--

CREATE TABLE `restaurantes` (
  `CodRes` int(11) NOT NULL,
  `Correo` varchar(90) NOT NULL,
  `Clave` varchar(45) NOT NULL,
  `Pais` varchar(45) NOT NULL,
  `CP` int(5) DEFAULT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `restaurantes`
--

INSERT INTO `restaurantes` (`CodRes`, `Correo`, `Clave`, `Pais`, `CP`, `Ciudad`, `Direccion`) VALUES
(1, 'madrid1@empresa.com', '$2y$10$fG4EKUiaUiYkGWxuHFCrEu7B0MTlg0oyFkume17EUqsS8lV98AIoS', 'España', 28002, 'Madrid', 'C/ Padre  Claret, 8'),
(2, 'cadiz1@empresa.com', '$2y$10$fG4EKUiaUiYkGWxuHFCrEu7B0MTlg0oyFkume17EUqsS8lV98AIoS', 'España', 11001, 'Cádiz', 'C/ Portales, 2 ');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`CodCat`),
  ADD UNIQUE KEY `UN_NOM_CAT` (`Nombre`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`CodPed`),
  ADD KEY `Restaurante` (`Restaurante`);

--
-- Indices de la tabla `pedidosproductos`
--
ALTER TABLE `pedidosproductos`
  ADD PRIMARY KEY (`CodPredProd`),
  ADD KEY `CodPed` (`CodPed`),
  ADD KEY `CodProd` (`CodProd`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`CodProd`);

--
-- Indices de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  ADD PRIMARY KEY (`CodRes`),
  ADD UNIQUE KEY `UN_RES_COR` (`Correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `CodCat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `CodPed` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pedidosproductos`
--
ALTER TABLE `pedidosproductos`
  MODIFY `CodPredProd` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `CodProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  MODIFY `CodRes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`CodCat`) REFERENCES `categorias` (`CodCat`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Restaurante`) REFERENCES `restaurantes` (`CodRes`);

--
-- Filtros para la tabla `pedidosproductos`
--
ALTER TABLE `pedidosproductos`
  ADD CONSTRAINT `pedidosproductos_ibfk_1` FOREIGN KEY (`CodPed`) REFERENCES `pedidos` (`CodPed`),
  ADD CONSTRAINT `pedidosproductos_ibfk_2` FOREIGN KEY (`CodProd`) REFERENCES `productos` (`CodProd`);

ALTER TABLE `restaurantes`
  ADD Rol int(11) NOT NULL DEFAULT 0,
  MODIFY Clave VARCHAR(255);

--
-- Volcado de usuario administrador 
--

INSERT INTO `restaurantes` (`Correo`, `Clave`, `Pais`, `CP`, `Ciudad`, `Direccion`,`Rol`) VALUES
('admin@empresa.com', '$2y$10$fG4EKUiaUiYkGWxuHFCrEu7B0MTlg0oyFkume17EUqsS8lV98AIoS', 'España', 28002, 'Madrid', 'C/ Padre  Claret, 8',1);


INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Manzanas', 'Frescas y jugosas manzanas de la región', 0.25, 100, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Naranjas', 'Dulces y jugosas naranjas recién cosechadas', 0.30, 80, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Plátanos', 'Plátanos maduros de la costa', 0.20, 50, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Fresas', 'Fresas frescas y dulces', 0.15, 60, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Sandía', 'Sandías grandes y jugosas de verano', 5.0, 20, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Melón', 'Melones dulces y refrescantes', 2.0, 30, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Uvas', 'Uvas rojas y verdes de la región', 0.5, 70, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Tomates', 'Tomates frescos y maduros', 0.3, 90, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Lechuga', 'Lechugas frescas y crujientes', 0.2, 120, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Espinacas', 'Espinacas frescas y saludables', 0.25, 80, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Pepino', 'Pepinos crujientes y saludables', 0.25, 70, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Zanahoria', 'Zanahorias frescas y saludables', 0.3, 60, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Calabaza', 'Calabazas frescas y saludables', 2.0, 30, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Papa', 'Papas frescas y deliciosas', 0.3, 80, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Arroz', 'Arroz blanco y suave', 1.0, 50, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Frijoles', 'Frijoles rojos y deliciosos', 0.5, 60, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Lentejas', 'Lentejas verdes y nutritivas', 0.4, 40, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Maíz', 'Maíz fresco y saludable', 1.0, 30, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Avena', 'Avena orgánica y saludable', 0.5, 50, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Leche', 'Leche fresca y nutritiva', 1.0, 40, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Queso', 'Queso fresco y sabroso', 0.25, 60, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Huevo', 'Huevos frescos y nutritivos', 0.05, 100, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Pollo', 'Pollo fresco y saludable', 1.0, 30, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Carne de res', 'Carne de res de calidad', 1.5, 20, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Pescado', 'Pescado fresco y delicioso', 0.5, 30, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Mariscos', 'Mariscos frescos y sabrosos', 0.3, 40, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Aceite de oliva', 'Aceite de oliva extra virgen', 0.5, 50, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Vinagre balsámico', 'Vinagre balsámico italiano', 0.25, 40, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Salsa de tomate', 'Salsa de tomate casera', 0.3, 60, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Salsa de soja', 'Salsa de soja tradicional', 0.3, 50, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Miel', 'Miel pura y natural', 0.5, 30, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Sal', 'Sal marina natural', 0.2, 80, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Mantequilla', 'Mantequilla de alta calidad', 0.25, 50, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Aceite de coco', 'Aceite de coco virgen', 0.5, 40, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Aceitunas', 'Aceitunas verdes rellenas', 0.25, 30, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Ajo', 'Ajo fresco y aromático', 0.1, 50, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Cebolla', 'Cebolla blanca fresca', 0.2, 60, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Pimiento', 'Pimiento rojo fresco', 0.1, 40, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Piñas', 'Piñas frescas y deliciosas', 0.5, 30, 1);
INSERT INTO productos (Nombre, Descripcion, Peso, Stock, CodCat) VALUES ('Yogurt', 'Yogurt natural cremoso', 0.2, 40, 1);

INSERT INTO `pedidos` (`Fecha`, `Enviado`, `Restaurante`) VALUES
('2024-03-06 04:29:21', 0, 3),
('2024-03-04 06:41:30', 0, 3),
('2024-03-03 07:15:40', 0, 3),
('2024-03-01 07:16:15', 0, 3),
('2024-03-02 07:16:35', 0, 3);


INSERT INTO `pedidosproductos` (`CodPed`, `CodProd`, `Unidades`) VALUES
(1, 6, 3),
(1, 5, 1),
(1, 4, 1),
(1, 3, 4),
(2, 1, 16),
(3, 7, 1),
(3, 11, 1),
(3, 22, 1),
(3, 20, 1),
(3, 1, 2),
(4, 5, 27),
(4, 4, 19),
(4, 3, 3),
(5, 7, 36),
(5, 2, 12),
(5, 1, 1);

COMMIT;

  
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
