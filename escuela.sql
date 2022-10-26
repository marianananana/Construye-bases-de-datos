-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 05:22:34
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('065', 'Fisica II', 4, 127),
('101', 'Cálculo Integral', 5, 127),
('112', 'CTSV', 4, 127),
('142', 'Construye BD', 6, 127),
('143', 'Desarrolla Aplicaciones Web', 6, 127),
('204', 'Ingles V', 5, 127);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(15) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `lider_academia` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Contabilidad', 'Mixto', NULL),
('Electricidad', 'Matutino', NULL),
('Logistica', 'Mixto', NULL),
('Mecánica', 'Matutino', NULL),
('Programación', 'Mixto', 'Ricardo Méndez Rojas'),
('Recursos Humano', 'Mixto', NULL),
('Soporte Tecnico', 'Mixto', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(14) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `edad` tinyint(4) NOT NULL,
  `domicilio` text NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `nombre`, `apellidos`, `edad`, `domicilio`, `telefono`, `grupo`) VALUES
('20336875920004', 'Rogelio', 'Hernadez Rodriguez', 17, '15 de Septiembre No. 17', '4181576630', '5PV'),
('56996258774054', 'Omar Antonio', 'Avalos Aguillon', 17, 'Vicente Guerrero No. 27', '4181501680', '5PV'),
('56998753871254', 'Cynthia Janet', 'Granados Estrada', 17, 'Rio laja No. 2b', '4181135633', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(30) NOT NULL,
  `fecha` date NOT NULL,
  `semestres` varchar(4) NOT NULL,
  `calificacion` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestres`, `calificacion`) VALUES
('20336875920004', '065', '2022-10-18', '5', '10'),
('20336875920004', '101', '2022-10-18', '5', '10'),
('20336875920004', '112', '2022-10-18', '5', '10'),
('20336875920004', '142', '2022-10-18', '5', '10'),
('20336875920004', '143', '2022-10-18', '5', '10'),
('20336875920004', '204', '2022-10-18', '5', '10'),
('56998753871254', '142', '2022-10-18', '5', '9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(3) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(60) DEFAULT NULL,
  `tutor` varchar(60) DEFAULT NULL,
  `carrera` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5CM', 'Matutino', NULL, NULL, 'Contabilidad'),
('5CV', 'Vespertino', NULL, NULL, 'Contabilidad'),
('5EM', 'Matutino', NULL, NULL, 'Electricidad'),
('5LM', 'Matutino', NULL, NULL, 'Logistica'),
('5LV', 'Vespertino', NULL, NULL, 'Logistica'),
('5MM', 'Matutino', NULL, NULL, 'Mecánica'),
('5PM', 'Matutino', 'Gael Quintana Romero', 'Ricardo Mendez Rojas', 'Programación'),
('5PV', 'Vespertino', 'Dulce Alejandra', 'Silvia Cecilia Carrillo Mastache', 'Programación'),
('5RM', 'Matutino', NULL, NULL, 'Recursos Humano'),
('5RV', 'Vespertino', NULL, NULL, 'Recursos Humano'),
('5SM', 'Matutino', NULL, NULL, 'Soporte Tecnico'),
('5SV', 'Vespertino', NULL, NULL, 'Soporte Tecnico');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`(4),`asignatura`),
  ADD KEY `asignatura` (`asignatura`),
  ADD KEY `num_control` (`num_control`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
