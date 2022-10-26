-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 03:26:12
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `maricafé`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `numControl` varchar(10) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `seccionLaboral` varchar(15) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `sueldo` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `numPedido` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `costo` varchar(100) NOT NULL,
  `pedido` varchar(10) NOT NULL,
  `nombreCliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productorentable`
--

CREATE TABLE `productorentable` (
  `clave` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `costo` varchar(100) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productovendible`
--

CREATE TABLE `productovendible` (
  `clave` varchar(10) NOT NULL,
  `proporcion` varchar(20) NOT NULL,
  `costo` varchar(100) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`numControl`),
  ADD UNIQUE KEY `numControl` (`numControl`),
  ADD UNIQUE KEY `seccionLaboral` (`seccionLaboral`),
  ADD UNIQUE KEY `seccionLaboral_2` (`seccionLaboral`),
  ADD UNIQUE KEY `seccionLaboral_3` (`seccionLaboral`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`numPedido`),
  ADD UNIQUE KEY `nombreCliente` (`nombreCliente`);

--
-- Indices de la tabla `productorentable`
--
ALTER TABLE `productorentable`
  ADD PRIMARY KEY (`clave`),
  ADD UNIQUE KEY `nombreProducto` (`nombreProducto`);

--
-- Indices de la tabla `productovendible`
--
ALTER TABLE `productovendible`
  ADD PRIMARY KEY (`clave`),
  ADD UNIQUE KEY `nombreProducto` (`nombreProducto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`seccionLaboral`) REFERENCES `pedido` (`numPedido`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`numControl`) REFERENCES `productovendible` (`clave`);

--
-- Filtros para la tabla `productorentable`
--
ALTER TABLE `productorentable`
  ADD CONSTRAINT `productorentable_ibfk_1` FOREIGN KEY (`clave`) REFERENCES `empleado` (`numControl`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
