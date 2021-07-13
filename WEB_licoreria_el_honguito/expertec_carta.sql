-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 22-06-2021 a las 12:35:39
-- Versión del servidor: 5.6.41-84.1
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `expertec_carta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `name`, `email`, `phone`, `address`, `created`, `modified`, `status`) VALUES
(1, 'admin', 'info@expertecperu.com', '996134217', 'Lima, Lima', '2018-02-17 08:21:25', '2018-02-17 08:21:25', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mis_productos`
--

CREATE TABLE `mis_productos` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mis_productos`
--

INSERT INTO `mis_productos` (`id`, `name`, `description`, `price`, `created`, `modified`, `status`) VALUES
(1, 'ASTICA MERLOT MALBEC X 750 ML', 'Argentica - Vino Tinto', 22.90, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(2, 'SANTA HELENA CABERNET SAUVI X 750 ML', 'Chile - Vino Tinto', 34.90, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(3, 'ASTICA SAUVIGNON BLANC SEMILLON X 750 ML', 'Argentina - Vino Blanco', 22.90, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(4, 'TRAPICHE MEDALLA CHARDONNAY X 750 ML', 'Argentina - Vino Blanco', 152.90, '2016-08-17 08:21:25', '2016-08-17 08:21:25', '1'),
(5, 'BLACK TOWER ROSE X 750 ML', 'Alemania - Vino Rosados', 39.90, '2021-06-17 17:07:25', '2021-06-17 17:07:25', '1'),
(6, 'PROTOS ROSADO X 750 ML', 'España - Vino Rosado', 69.90, '2021-06-17 17:14:13', '2021-06-17 17:14:13', '1'),
(7, 'ESPUMATE ANNA CODORNIU BRUT SPRING 750 ML', 'Espumante y Cavas', 41.94, '2021-06-17 17:17:25', '2021-06-17 17:17:25', '1'),
(8, 'PROTOS RESERVA X 750 ML', 'Espumante y Cavas', 242.90, '2021-06-17 17:19:11', '2021-06-17 17:19:11', '1'),
(9, 'TRAPICHE VINEYARDS SAUVIGNON X 750 ML', 'ARGENTINA - VINO TINTO', 42.90, '2021-06-17 17:30:18', '2021-06-17 17:30:18', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `customer_id`, `total_price`, `created`, `modified`, `status`) VALUES
(6, 1, 25.00, '2021-06-17 13:21:46', '2021-06-17 13:21:46', '1'),
(7, 1, 40.00, '2021-06-17 13:25:18', '2021-06-17 13:25:18', '1'),
(8, 1, 40.00, '2021-06-17 15:24:01', '2021-06-17 15:24:01', '1'),
(9, 1, 40.00, '2021-06-17 15:31:40', '2021-06-17 15:31:40', '1'),
(10, 1, 277.80, '2021-06-17 19:09:00', '2021-06-17 19:09:00', '1'),
(11, 1, 131.60, '2021-06-22 11:24:41', '2021-06-22 11:24:41', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_articulos`
--

CREATE TABLE `orden_articulos` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `orden_articulos`
--

INSERT INTO `orden_articulos` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 6, 4, 1),
(2, 7, 2, 1),
(3, 7, 3, 1),
(4, 8, 3, 1),
(5, 8, 4, 1),
(6, 9, 3, 1),
(7, 9, 4, 1),
(8, 10, 8, 1),
(9, 10, 2, 1),
(10, 11, 1, 2),
(11, 11, 9, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mis_productos`
--
ALTER TABLE `mis_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indices de la tabla `orden_articulos`
--
ALTER TABLE `orden_articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mis_productos`
--
ALTER TABLE `mis_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `orden_articulos`
--
ALTER TABLE `orden_articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden_articulos`
--
ALTER TABLE `orden_articulos`
  ADD CONSTRAINT `orden_articulos_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orden` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
