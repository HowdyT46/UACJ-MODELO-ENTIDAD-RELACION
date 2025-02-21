-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2025 a las 17:56:11
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
-- Base de datos: `uacj`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `Codigo` varchar(15) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Edad` int(5) NOT NULL,
  `Telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`Codigo`, `Nombre`, `Apellido`, `Edad`, `Telefono`) VALUES
('1245', 'Eric', 'Buaza', 23, '656 667321'),
('23121', 'Stuart', 'Williams', 21, '656 213878'),
('256321', 'Arturo', 'Montana', 21, '656 987654'),
('46532', 'Maria', 'Elena', 18, '656 123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `Codigo` varchar(15) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Duracion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`Codigo`, `Nombre`, `Duracion`) VALUES
('E', 'Ingeneria en Electronica', '4 años'),
('S', 'Sistemas Computacionales', '4 años'),
('T', 'Animacion a Mano', '4 años'),
('X', 'Animacion Digital', '4 años');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `CodigoInscripcion` int(11) NOT NULL,
  `Fecha` varchar(25) NOT NULL,
  `CodigoAlumno` varchar(25) NOT NULL,
  `CodigoCarrera` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`CodigoInscripcion`, `Fecha`, `CodigoAlumno`, `CodigoCarrera`) VALUES
(192, '19-feb-2025', '23121', 'E'),
(201, '19-feb-2025', '46532', 'E'),
(432, '19-feb-2025', '1245', 'T'),
(567, '19-feb-2025', '256321', 'X');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`CodigoInscripcion`),
  ADD KEY `FK Alumno` (`CodigoAlumno`),
  ADD KEY `FK Carrera` (`CodigoCarrera`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `CodigoInscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`CodigoAlumno`) REFERENCES `alumno` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`CodigoCarrera`) REFERENCES `carrera` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
