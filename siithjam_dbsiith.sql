-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-10-2022 a las 09:08:44
-- Versión del servidor: 10.3.36-MariaDB-cll-lve
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `siithjam_dbsiith`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id_actividad` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `identificacion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `is_presencial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `horas_formativas` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entidad_actividad` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `motivo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `calificacion` bit(1) DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id_actividad`, `nombre`, `identificacion`, `fecha_ini`, `fecha_fin`, `is_presencial`, `direccion`, `horas_formativas`, `entidad_actividad`, `estado`, `archivo`, `motivo`, `calificacion`, `consecutivo`, `cantidad`, `descripcion`) VALUES
(1, 'Prueba 1', '2022-1', '2022-06-16', '2022-06-16', 'PRESENCIAL', 'palacio municipal', '8', 'SURA', '', 'views/archivos/actividades/_1655407877_62ab850546c3a-prueba.1655407877_62ab850546c3a.pdf', '', b'1', 1, 0, NULL),
(2, 'Ramiro angarita', '2022-2', '2022-06-16', '2022-06-16', 'PRESENCIAL', '123123', '15', 'Entidad que realiza la actividad ', 'REALIZADO', '', '', b'1', 2, 50, NULL),
(3, 'jghjghjghjtgyjtyuj', '2022-3', '2022-08-09', '2022-08-09', 'PRESENCIAL', 'ytyutyuut', 'undefined', 'ertetertert', 'REALIZADO', '', '', b'1', 3, 40, NULL),
(8, 'jyujyujyujyuj', '2022-5', '2022-08-18', '2022-08-18', 'PRESENCIAL', 'plaza 10', 'undefined', 'Autogestión', 'REALIZADO', '', '', b'1', 5, 150, 'se dieron galletas por el día de la madre'),
(7, 'Prueba 11-08-2022', '2022-4', '2022-08-11', '2022-08-18', 'PRESENCIAL', 'Coliseo Cubierto', 'undefined', 'Recurso Humano', 'REALIZADO', '', '', b'0', 4, 40, 'Integracion dia de la independencia todas las areas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividadesprogramadas_funcionario`
--

CREATE TABLE `actividadesprogramadas_funcionario` (
  `id_actividadprogramadasfuncionario` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_actividadprogramada` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `asistencia` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades_programadas`
--

CREATE TABLE `actividades_programadas` (
  `id_actividadprogramada` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `identificacion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `is_presencial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recursos` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entidad_actividad` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `motivo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `calificacion` bit(1) DEFAULT NULL,
  `ciclo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor_total` int(11) DEFAULT NULL,
  `observacion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `tiempo_gen` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `actividades_programadas`
--

INSERT INTO `actividades_programadas` (`id_actividadprogramada`, `nombre`, `identificacion`, `fecha_ini`, `fecha_fin`, `is_presencial`, `direccion`, `recursos`, `entidad_actividad`, `estado`, `archivo`, `motivo`, `calificacion`, `ciclo`, `valor_total`, `observacion`, `consecutivo`, `tiempo_gen`) VALUES
(1, 'Divulgacion politica sst', '2022-1', '2022-07-01', '2022-07-26', 'MIXTA', 'todas las sedes', 'AMBOS', 'Equipo SST', NULL, '', NULL, NULL, 'PLANEAR', NULL, NULL, 1, '2022-06-17 12:17:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_funcionario`
--

CREATE TABLE `actividad_funcionario` (
  `id_actividad_funcionario` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_actividad` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `asistencia` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `actividad_funcionario`
--

INSERT INTO `actividad_funcionario` (`id_actividad_funcionario`, `id_funcionario`, `id_actividad`, `fecha_asignacion`, `asistencia`) VALUES
(1, 7, 15, '2022-04-06', NULL),
(2, 29, 16, '2022-04-06', NULL),
(3, 33, 16, '2022-04-06', NULL),
(4, 37, 16, '2022-04-06', NULL),
(5, 39, 16, '2022-04-06', NULL),
(6, 41, 16, '2022-04-06', NULL),
(7, 54, 16, '2022-04-06', NULL),
(8, 33, 17, '2022-05-28', NULL),
(9, 37, 17, '2022-05-28', NULL),
(10, 39, 17, '2022-05-28', NULL),
(35, 8, 2, '2022-06-16', NULL),
(20, 56, 19, '2022-06-15', NULL),
(14, 7, 18, '2022-06-14', NULL),
(34, 7, 2, '2022-06-16', NULL),
(33, 576, 2, '2022-06-16', NULL),
(36, 56, 2, '2022-06-16', NULL),
(37, 174, 2, '2022-06-16', NULL),
(38, 4, 2, '2022-06-16', NULL),
(39, 7, 3, '2022-08-09', NULL),
(40, 56, 3, '2022-08-09', NULL),
(41, 576, 3, '2022-08-09', NULL),
(42, 8, 3, '2022-08-09', NULL),
(43, 39, 8, '2022-08-18', NULL),
(44, 56, 8, '2022-08-18', NULL),
(45, 531, 8, '2022-08-18', NULL),
(46, 276, 8, '2022-08-18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arl`
--

CREATE TABLE `arl` (
  `id_arl` int(11) NOT NULL,
  `arl` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `arl`
--

INSERT INTO `arl` (`id_arl`, `arl`, `descripcion`, `fecha_upd`) VALUES
(1, 'Positiva', NULL, '2021-11-07 05:48:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_compensacion`
--

CREATE TABLE `caja_compensacion` (
  `id_cajacompensacion` int(11) NOT NULL,
  `caja_compensacion` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_upd` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `caja_compensacion`
--

INSERT INTO `caja_compensacion` (`id_cajacompensacion`, `caja_compensacion`, `fecha_upd`) VALUES
(1, 'Confenalco', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitaciones`
--

CREATE TABLE `capacitaciones` (
  `id_capacitacion` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `identificacion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `is_presencial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `horas_formativas` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conocimiento_previo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `entidadCapacitadora` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `motivo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `calificacion` bit(1) DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `capacitaciones`
--

INSERT INTO `capacitaciones` (`id_capacitacion`, `nombre`, `identificacion`, `fecha_ini`, `fecha_fin`, `is_presencial`, `direccion`, `horas_formativas`, `conocimiento_previo`, `entidadCapacitadora`, `estado`, `motivo`, `archivo`, `calificacion`, `consecutivo`, `cantidad`) VALUES
(1, 'Prueba 1', '2022-1', '2022-06-16', '2022-06-16', 'PRESENCIAL', 'Palacio municipal', '1', 'Estos es una prueba', 'gestión Institucional', 'REALIZADO', '', 'views/archivos/capacitacion/_1655409054_62ab899e2dc61-prueba.1655409054_62ab899e2dc61.pdf', b'1', 1, NULL),
(2, 'Prueba 2', '2022-2', '2022-06-16', '2022-06-16', 'PRESENCIAL', 'Palacio municipal', '1 hora', 'esto es una prueba ', 'Gestión Institucional', 'REALIZADO', '', '', b'1', 2, 5),
(4, 'Test 1', '2022-4', '2022-06-28', '2022-06-28', 'PRESENCIAL', 'Palacio Municipal', '1 hora', 'esto lo hago par divertirme', 'Entidad Territorial', 'SUSPENDIDO', NULL, NULL, b'1', 4, NULL),
(3, 'Prueba 3', '2022-3', '2022-06-16', '2022-06-16', 'VIRTUAL', 'www.sena.edu.co', '1 hora', 'esto es otra prueba', 'SENA', 'REALIZADO', '', '', b'1', 3, 10),
(5, 'Test5', '2022-5', '2022-06-28', '2022-06-28', 'PRESENCIAL', 'Parque principal', '1', 'esto lo hago para divertirme', 'contratista', 'REALIZADO', '', '', b'0', 5, 20),
(6, 'kiukuikui', '2022-6', '2022-07-19', '2022-07-19', 'PRESENCIAL', 'iukuikuiku', '40', 'ikuikuikuikuikuik', 'rfsedsdgrtghrhyhyh', 'REALIZADO', '', '', b'1', 6, 4),
(7, '522416541664164', '2022-7', '2022-07-04', '2022-07-08', 'MIXTA', 'hhkhjkghjk', '50', 'jñl,yñjk,jkyl,u.jlñy,ujñly,ujñlyu,jñlyu,.j}yu.-jk}y', 'ujyujytutyurty', 'REALIZADO', '', '', b'1', 7, 10),
(8, 'hfghgghf', '2022-8', '2022-08-03', '2022-08-09', 'PRESENCIAL', 'gtrgrtr', '40', 'reterterter', 'rtertrter', NULL, NULL, NULL, b'1', 8, NULL),
(9, '.mlnl', '2022-9', '2022-08-08', '2022-08-09', 'PRESENCIAL', 'lknmlml', '1', 'hjghjghjgjgyj', 'tyretewrw3r', NULL, NULL, NULL, b'1', 9, NULL),
(10, '1234567891011111', '2022-10', '2022-08-15', '2022-08-16', 'PRESENCIAL', 'Cra 46 #13a-66 segundo piso', '16', '54160131641613103165413131', '111111111111111111111', NULL, NULL, NULL, b'1', 10, NULL),
(11, 'fferferfeferf', '2022-11', '2022-08-15', '2022-08-18', 'PRESENCIAL', 'Google Meet', '30', 'vfdvdfvdfv', 'dfgdfgdfgv', 'REALIZADO', '', '', b'1', 11, 30),
(12, 'zzzzzzzzzzzzzzzzzzzzzz', '2022-12', '2022-08-23', '2022-08-30', 'PRESENCIAL', ' IMDERE', '12', 'DGGDFGDGDFGDFGDFG', 'COMFENALCO', NULL, NULL, NULL, b'1', 12, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacionesprogramadas_funcionario`
--

CREATE TABLE `capacitacionesprogramadas_funcionario` (
  `id_capacitacionprogramadasfuncionario` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_capacitacionprogramada` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `asistencia` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitaciones_programadas`
--

CREATE TABLE `capacitaciones_programadas` (
  `id_capacitacionprogramada` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `identificacion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `is_presencial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recursos` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entidad_actividad` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `motivo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `calificacion` bit(1) DEFAULT NULL,
  `grupo_objetivo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor_total` int(11) DEFAULT NULL,
  `observacion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `tiempo_gen` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `capacitaciones_programadas`
--

INSERT INTO `capacitaciones_programadas` (`id_capacitacionprogramada`, `nombre`, `identificacion`, `fecha_ini`, `fecha_fin`, `is_presencial`, `direccion`, `recursos`, `entidad_actividad`, `estado`, `archivo`, `motivo`, `calificacion`, `grupo_objetivo`, `valor_total`, `observacion`, `consecutivo`, `tiempo_gen`) VALUES
(14, 'Cuidado de manos', '2022-1', '2022-08-18', '2022-08-18', 'PRESENCIAL', 'Biblioteca municipal', 'AMBOS', 'Equipo SST', 'REALIZADO', 'C:\\fakepath\\HISTORIA DANIEL.pdf', '', NULL, NULL, NULL, '', 1, '2022-06-17 12:05:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacion_funcionario`
--

CREATE TABLE `capacitacion_funcionario` (
  `id_capacitacion_funcionario` int(11) NOT NULL,
  `id_capacitacion` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `asistencia` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `capacitacion_funcionario`
--

INSERT INTO `capacitacion_funcionario` (`id_capacitacion_funcionario`, `id_capacitacion`, `id_funcionario`, `fecha_asignacion`, `asistencia`) VALUES
(1, 19, 545, '2022-02-12', NULL),
(2, 19, 558, '2022-02-12', NULL),
(3, 20, 7, '2022-04-06', NULL),
(4, 20, 8, '2022-04-06', NULL),
(5, 20, 9, '2022-04-06', NULL),
(6, 20, 12, '2022-04-06', NULL),
(29, NULL, 7, NULL, NULL),
(33, 24, 19, '2022-05-30', NULL),
(32, 24, 8, '2022-05-30', NULL),
(28, NULL, 576, NULL, NULL),
(64, 2, 576, '2022-06-16', NULL),
(63, 2, 7, '2022-06-16', NULL),
(62, 2, 8, '2022-06-16', NULL),
(68, 3, 24, '2022-06-16', NULL),
(67, 3, 9, '2022-06-16', NULL),
(66, 3, 576, '2022-06-16', NULL),
(40, 1, 576, '2022-06-16', NULL),
(41, 1, 7, '2022-06-16', NULL),
(42, 1, 8, '2022-06-16', NULL),
(65, 3, 7, '2022-06-16', NULL),
(69, 3, 37, '2022-06-16', NULL),
(70, 3, 39, '2022-06-16', NULL),
(71, 5, 576, '2022-06-28', NULL),
(72, 5, 7, '2022-06-28', NULL),
(73, 6, 56, '2022-07-19', NULL),
(74, 6, 253, '2022-07-19', NULL),
(75, 6, 501, '2022-07-19', NULL),
(76, 6, 500, '2022-07-19', NULL),
(77, 7, 576, '2022-07-19', NULL),
(78, 7, 7, '2022-07-19', NULL),
(79, 7, 8, '2022-07-19', NULL),
(80, 7, 23, '2022-07-19', NULL),
(81, 7, 37, '2022-07-19', NULL),
(82, 7, 57, '2022-07-19', NULL),
(83, 7, 58, '2022-07-19', NULL),
(84, 7, 99, '2022-07-19', NULL),
(85, 7, 102, '2022-07-19', NULL),
(99, 11, 11, '2022-08-18', NULL),
(98, 11, 260, '2022-08-18', NULL),
(97, 11, 137, '2022-08-18', NULL),
(96, 11, 58, '2022-08-18', NULL),
(95, 11, 7, '2022-08-18', NULL),
(94, 11, 276, '2022-08-18', NULL),
(93, 11, 56, '2022-08-18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id_cargo` int(11) NOT NULL,
  `cargo` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_nivelfuncionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `cargo`, `fecha_upd`, `id_nivelfuncionario`) VALUES
(1, 'Asesor de control interno', '2021-11-06 03:56:50', 1),
(2, 'Asesor de control interno disciplinado', '2021-11-06 03:56:50', 1),
(3, 'Auxiliar administrativo', '2021-11-06 03:56:51', 2),
(4, 'Auxiliar de servicios generales', '2021-11-06 03:56:51', 2),
(5, 'Ayudante', '2021-11-06 03:56:51', 2),
(6, 'Celador', '2021-11-06 03:56:51', 2),
(7, 'Conductor mecánico', '2021-11-06 03:56:51', 2),
(8, 'Inspector de Galería', '2021-11-06 03:56:52', 2),
(9, 'Secretario ', '2021-11-06 03:56:52', 2),
(10, 'Secretario ejecutivo', '2021-11-06 03:56:52', 2),
(11, 'Secretario ejecutivo despacho', '2021-11-06 03:56:52', 2),
(12, 'Alcalde', '2021-11-06 03:56:52', 7),
(13, 'Jefe de oficina', '2021-11-06 03:56:52', 3),
(14, 'Secretario de Despacho', '2021-11-06 03:56:53', 3),
(15, 'Almacenista general', '2021-11-06 03:56:53', 4),
(16, 'Comisario de familia', '2021-11-06 03:56:53', 4),
(17, 'Profesional Universitario', '2021-11-06 03:56:53', 4),
(18, 'Tesorero General', '2021-11-06 03:56:53', 4),
(19, 'Agente de tránsito', '2021-11-06 03:56:53', 5),
(20, 'Inspector de policía', '2021-11-06 03:56:54', 5),
(21, 'Inspector de tránsito y transporte', '2021-11-06 03:56:54', 5),
(22, 'Instructor de arte y cultura', '2021-11-06 03:56:54', 5),
(23, 'Técnico administrativo', '2021-11-06 03:56:54', 5),
(24, 'Técnico operativo', '2021-11-06 03:56:54', 5),
(25, 'N.A.', '2022-04-03 18:09:52', 1),
(26, 'Secretaria de despacho', '2022-04-03 22:06:23', 3),
(27, 'Tecnico Administrativo', '2022-04-03 22:12:44', 5),
(28, 'Obrero Especializado', '2022-04-03 22:23:16', 6),
(29, 'Obrero', '2022-04-03 22:24:52', 6),
(30, 'Obrero de mantenimiento', '2022-04-03 22:32:12', 6),
(31, 'Secretaria', '2022-04-03 22:35:27', 2),
(32, 'Operador de maquinaria esp. II', '2022-04-03 22:37:15', 6),
(33, 'Operador de maquinaria esp. I', '2022-04-03 22:38:38', 6),
(34, 'Operador de maquinaria esp. I (portera)', '2022-04-03 22:39:44', 6),
(35, 'Tecnico Operativo', '2022-04-03 22:42:29', 5),
(36, 'Oficial de mantenimiento', '2022-04-03 22:58:47', 7),
(37, 'Archivo Técnico Operativo', '2022-04-03 23:01:07', 5),
(38, 'Secretaria ejecutica', '2022-04-03 23:02:31', 2),
(39, 'Coordinadora operativa de maquinaria ', '2022-04-04 09:01:33', 6),
(40, 'Personero', '2022-04-04 09:28:14', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo`
--

CREATE TABLE `codigo` (
  `id_codigo` int(11) NOT NULL,
  `codigo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='																																																																																																																																																																																																																																																																																																																																																																																																																																																					';

--
-- Volcado de datos para la tabla `codigo`
--

INSERT INTO `codigo` (`id_codigo`, `codigo`, `fecha_upd`, `id_cargo`) VALUES
(1, '105', '2021-11-06 03:56:54', 1),
(2, '105', '2021-11-06 03:56:54', 2),
(3, '407', '2021-11-06 03:56:55', 3),
(4, '470', '2021-11-06 03:56:55', 4),
(5, '472', '2021-11-06 03:56:55', 5),
(6, '477', '2021-11-06 03:56:55', 6),
(7, '482', '2021-11-06 03:56:55', 7),
(8, '416', '2021-11-06 03:56:56', 8),
(9, '440', '2021-11-06 03:56:56', 9),
(10, '425', '2021-11-06 03:56:56', 10),
(11, '438', '2021-11-06 03:56:56', 11),
(12, '5', '2021-11-06 03:56:57', 12),
(13, '6', '2021-11-06 03:56:57', 13),
(14, '20', '2021-11-06 03:56:57', 14),
(15, '215', '2021-11-06 03:56:58', 15),
(16, '202', '2021-11-06 03:56:58', 16),
(17, '219', '2021-11-06 03:56:58', 17),
(18, '201', '2021-11-06 03:56:59', 18),
(19, '340', '2021-11-06 03:56:59', 19),
(20, '303', '2021-11-06 03:56:59', 20),
(21, '312', '2021-11-06 03:56:59', 21),
(22, '313', '2021-11-06 03:57:00', 22),
(23, '367', '2021-11-06 03:57:00', 23),
(24, '314', '2021-11-06 03:57:00', 24),
(25, '000', '2022-04-03 18:10:10', 25),
(26, '361', '2022-04-04 13:28:02', 27),
(27, '368', '2022-04-04 13:28:32', 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencias`
--

CREATE TABLE `dependencias` (
  `id_dependencia` int(11) NOT NULL,
  `dependencia` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_activa` bit(1) NOT NULL DEFAULT b'1',
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `dependencias`
--

INSERT INTO `dependencias` (`id_dependencia`, `dependencia`, `descripcion`, `is_activa`, `fecha_upd`) VALUES
(1, 'Agricultura', NULL, b'1', '2021-11-06 03:57:10'),
(2, 'Ambiente', NULL, b'1', '2021-11-06 03:57:10'),
(3, 'Asuntos étnicos', NULL, b'1', '2021-11-06 03:57:11'),
(4, 'Consejo', NULL, b'1', '2021-11-06 03:57:11'),
(5, 'Cultura', NULL, b'1', '2021-11-06 03:57:11'),
(6, 'Desarrollo Social', NULL, b'1', '2021-11-06 03:57:12'),
(7, 'Despacho del alcalde', NULL, b'1', '2021-11-06 03:57:12'),
(8, 'Educación', NULL, b'1', '2021-11-06 03:57:12'),
(9, 'Educación SGP', NULL, b'1', '2021-11-06 03:57:13'),
(10, 'General', NULL, b'1', '2021-11-06 03:57:13'),
(11, 'Gestión inst', NULL, b'1', '2021-11-06 03:57:13'),
(12, 'Gobierno', NULL, b'1', '2021-11-06 03:57:14'),
(13, 'Hacienda', NULL, b'1', '2021-11-06 03:57:14'),
(14, 'Infraestructura', NULL, b'1', '2021-11-06 03:57:14'),
(15, 'Jurídica', NULL, b'1', '2021-11-06 03:57:15'),
(16, 'O. Comunicaciones', NULL, b'1', '2021-11-06 03:57:15'),
(17, 'O. Control Interno', NULL, b'1', '2021-11-06 03:57:15'),
(18, 'O. Control Interno Disciplinario', NULL, b'1', '2021-11-06 03:57:16'),
(19, 'O. Cooperación Inst', NULL, b'1', '2021-11-06 03:57:16'),
(20, 'O. equidad general', NULL, b'1', '2021-11-06 03:57:16'),
(21, 'O. juventudes', NULL, b'1', '2021-11-06 03:57:17'),
(22, 'O. Minas', NULL, b'1', '2021-11-06 03:57:17'),
(23, 'O. Posconflicto', NULL, b'1', '2021-11-06 03:57:17'),
(24, 'O. programas especiales', NULL, b'1', '2021-11-06 03:57:17'),
(25, 'O. tic', NULL, b'1', '2021-11-06 03:57:18'),
(26, 'Personería', NULL, b'1', '2021-11-06 03:57:18'),
(27, 'Planeación', NULL, b'1', '2021-11-06 03:57:18'),
(28, 'Salud', NULL, b'1', '2021-11-06 03:57:19'),
(29, 'Transito', NULL, b'1', '2021-11-06 03:57:19'),
(30, 'Turismo', NULL, b'1', '2021-11-06 03:57:19'),
(31, 'Vivienda', NULL, b'1', '2021-11-06 03:57:20'),
(46, 'Juridica', NULL, b'1', '2021-11-07 05:48:41'),
(50, 'O. Cooperación Int', NULL, b'1', '2021-11-07 05:48:42'),
(51, 'O. Equidad Género', NULL, b'1', '2021-11-07 05:48:42'),
(54, 'O. Porconflicto', NULL, b'1', '2021-11-07 05:48:43'),
(55, 'P. Programas especiales', NULL, b'1', '2021-11-07 05:48:43'),
(62, 'Todas las dependencias', NULL, b'1', '2021-11-07 05:48:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `id_eps` int(11) NOT NULL,
  `eps` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`id_eps`, `eps`, `descripcion`, `fecha_upd`) VALUES
(1, 'No tiene/No lo han vinculado', NULL, '2021-11-07 05:48:31'),
(2, 'Asmet salud', NULL, '2021-11-07 05:48:31'),
(3, 'Comfenalco', NULL, '2021-11-07 05:48:31'),
(4, 'Coomeva', NULL, '2021-11-07 05:48:31'),
(5, 'Coosalud', NULL, '2021-11-07 05:48:32'),
(6, 'Condfandi', NULL, '2021-11-07 05:48:32'),
(9, 'Cosmitet', NULL, '2021-11-07 05:48:33'),
(10, 'Enssanar', NULL, '2021-11-07 05:48:33'),
(11, 'Nueva eps', NULL, '2021-11-07 05:48:33'),
(12, 'S.O.S', NULL, '2021-11-07 05:48:34'),
(13, 'Salud total', NULL, '2021-11-07 05:48:34'),
(14, 'Sanitas', NULL, '2021-11-07 05:48:34'),
(15, 'Sura', NULL, '2021-11-07 05:48:34'),
(16, 'Fosyga', NULL, '2022-04-05 11:22:08'),
(17, 'Compensar EPS', NULL, '2022-04-05 11:24:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE `estado_civil` (
  `id_estadocivil` int(11) NOT NULL,
  `estado_civil` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estado_civil`
--

INSERT INTO `estado_civil` (`id_estadocivil`, `estado_civil`) VALUES
(1, 'Casado'),
(2, 'Divorciado'),
(3, 'Soltero'),
(4, 'Unión Libre'),
(5, 'Viudo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etnia`
--

CREATE TABLE `etnia` (
  `id_etnia` int(11) NOT NULL,
  `etnia` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `etnia`
--

INSERT INTO `etnia` (`id_etnia`, `etnia`, `descripcion`) VALUES
(1, 'Ninguna', NULL),
(2, 'Afrocolombiano', NULL),
(3, 'Indígena', NULL),
(4, 'Gitanos', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `id_evaluacion` int(11) NOT NULL,
  `periodo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `valor_evaluacion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluaciones`
--

INSERT INTO `evaluaciones` (`id_evaluacion`, `periodo`, `valor_evaluacion`, `id_funcionario`) VALUES
(1936, '2020 - 2021    ', '66.83', 42),
(1937, '2020 - 2021    ', '95.26', 570),
(1938, '2020 - 2021    ', '99', 497),
(1939, '2020 - 2021    ', '97', 21),
(1940, '2020 - 2021    ', '100', 116),
(1941, '2020 - 2021    ', '100', 56),
(1942, '2020 - 2021    ', '100', 322),
(1943, '2020 - 2021    ', '95.75', 74),
(1944, '2020 - 2021    ', '100', 400),
(1945, '2020 - 2021    ', '97', 201),
(1946, '2020 - 2021    ', '94.2', 313),
(1947, '2020 - 2021    ', '100', 155),
(1948, '2020 - 2021    ', '94.81', 207),
(1949, '2020 - 2021    ', '92.28', 387),
(1950, '2020 - 2021    ', '97.73', 216),
(1951, '2020 - 2021    ', '96.5', 39),
(1952, '2020 - 2021    ', '99', 111),
(1953, '2020 - 2021    ', '95.75', 231),
(1954, '2020 - 2021    ', '96.6', 291),
(1955, '2020 - 2021    ', '100', 279),
(1956, '2020 - 2021    ', '86.22', 49),
(1957, '2020 - 2021    ', '99.7', 245),
(1958, '2020 - 2021    ', '98.51', 294),
(1959, '2020 - 2021    ', '100', 220),
(1960, '2020 - 2021    ', '98.94', 150),
(1961, '2020 - 2021    ', '100', 144),
(1962, '2020 - 2021    ', '100', 398),
(1963, '2020 - 2021    ', '91.05', 37),
(1964, '2020 - 2021    ', '96.31', 271),
(1965, '2020 - 2021    ', '100', 420),
(1966, '2020 - 2021    ', '92.75', 474),
(1967, '2020 - 2021    ', '95.01', 104),
(1968, '2020 - 2021    ', '96', 281),
(1969, '2020 - 2021    ', '100', 449),
(1970, '2020 - 2021    ', '100', 140),
(1971, '2020 - 2021    ', '99', 119),
(1972, '2020 - 2021    ', '98.3', 550),
(1973, '2020 - 2021    ', '99.53', 41),
(1974, '2020 - 2021    ', '96.03', 312),
(1975, '2020 - 2021    ', '94.75', 175),
(1976, '2020 - 2021    ', '97', 224),
(1977, '2020 - 2021    ', '100', 406),
(1978, '2020 - 2021    ', '100', 510),
(1979, '2020 - 2021    ', '96', 549),
(1980, '2020 - 2021    ', '98', 315),
(1981, '2020 - 2021    ', '99', 488),
(1982, '2020 - 2021    ', '100', 87),
(1983, '2020 - 2021    ', '95.75', 374),
(1984, '2020 - 2021    ', '100', 365),
(1985, '2020 - 2021    ', '88.56', 501),
(1986, '2020 - 2021    ', '100', 128),
(1987, '2020 - 2021    ', '93.47', 438),
(1988, '2020 - 2021    ', '93.68', 389),
(1989, '2020 - 2021    ', '92.35', 440),
(1990, '2020 - 2021    ', '87.25', 401),
(1991, '2020 - 2021    ', '98', 85),
(1992, '2020 - 2021    ', '96', 273),
(1993, '2020 - 2021    ', '97.96', 409),
(1994, '2020 - 2021    ', '91.75', 362),
(1995, '2020 - 2021    ', '95.75', 75),
(1996, '2020 - 2021    ', '99.45', 379),
(1997, '2020 - 2021    ', '92.13', 142),
(1998, '2020 - 2021    ', '96.86', 202),
(1999, '2020 - 2021    ', '100', 248),
(2000, '2020 - 2021    ', '100', 93),
(2001, '2020 - 2021    ', '97', 208),
(2002, '2020 - 2021    ', '86.65', 159),
(2003, '2020 - 2021    ', '88.54', 323),
(2004, '2020 - 2021    ', '94.71', 120),
(2005, '2020 - 2021    ', '96.15', 79),
(2006, '2020 - 2021    ', '95.75', 131),
(2007, '2020 - 2021    ', '95.73', 310),
(2008, '2020 - 2021    ', '97.97', 503),
(2009, '2020 - 2021    ', '95.58', 481),
(2010, '2020 - 2021    ', '45.4', 436),
(2011, '2020 - 2021    ', '96.09', 505),
(2012, '2020 - 2021    ', '100', 464),
(2013, '2020 - 2021    ', '82.17', 492),
(2014, '2020 - 2021    ', '99.49', 394),
(2015, '2020 - 2021    ', '76.82', 369),
(2016, '2020 - 2021    ', '97', 151),
(2017, '2020 - 2021    ', '69.5', 502),
(2018, '2020 - 2021    ', '90.06', 182),
(2019, '2020 - 2021    ', '94.57', 189),
(2020, '2020 - 2021    ', '100', 459),
(2021, '2020 - 2021    ', '78.86', 489),
(2022, '2020 - 2021    ', '90.05', 199),
(2023, '2020 - 2021    ', '93.75', 15),
(2024, '2020 - 2021    ', '92.63', 432),
(2025, '2020 - 2021    ', '91.87', 190),
(2026, '2020 - 2021    ', '88.5', 516),
(2027, '2020 - 2021    ', '92.76', 327),
(2028, '2020 - 2021    ', '93.27', 71),
(2029, '2020 - 2021    ', '100', 2),
(2030, '2020 - 2021    ', '91.5', 429),
(2031, '2020 - 2021    ', '91.5', 251),
(2032, '2020 - 2021    ', '95.75', 546),
(2033, '2020 - 2021    ', '92.17', 303),
(2034, '2020 - 2021    ', '95.3', 554),
(2035, '2020 - 2021    ', '100', 38),
(2036, '2020 - 2021    ', '95.45', 288),
(2037, '2020 - 2021    ', '92.75', 55),
(2038, '2020 - 2021    ', '96.97', 378),
(2039, '2020 - 2021    ', '86.15', 539),
(2040, '2020 - 2021    ', '87.5', 537),
(2041, '2020 - 2021    ', '96', 276),
(2042, '2020 - 2021    ', '96.45', 448),
(2043, '2020 - 2021    ', '100', 386),
(2044, '2020 - 2021    ', '90.56', 272),
(2045, '2020 - 2021    ', '100', 473),
(2046, '2020 - 2021    ', '91.5', 107),
(2047, '2020 - 2021    ', '100', 301),
(2048, '2020 - 2021    ', '84.08', 5),
(2049, '2020 - 2021    ', '91.5', 67),
(2050, '2020 - 2021    ', '97', 498),
(2051, '2020 - 2021    ', '89.63', 241),
(2052, '2020 - 2021    ', '66.05', 235),
(2053, '2020 - 2021    ', '93.63', 309),
(2054, '2020 - 2021    ', '96.94', 244),
(2055, '2020 - 2021    ', '92.02', 344),
(2056, '2020 - 2021    ', '95.76', 239),
(2057, '2020 - 2021    ', '89.62', 162),
(2058, '2020 - 2021    ', '91.71', 58),
(2059, '2020 - 2021    ', '99.5', 96),
(2060, '2020 - 2021    ', '95.43', 561),
(2061, '2020 - 2021    ', '88.92', 287),
(2062, '2020 - 2021    ', '98.5', 232),
(2063, '2020 - 2021    ', '89.06', 4),
(2064, '2020 - 2021    ', '96.48', 204),
(2065, '2020 - 2021    ', '90.36', 50),
(2066, '2020 - 2021    ', '97.73', 149),
(2067, '2020 - 2021    ', '95.73', 152),
(2068, '2020 - 2021    ', '100', 253),
(2069, '2020 - 2021    ', '96.5', 346),
(2070, '2020 - 2021    ', '90.38', 350),
(2071, '2020 - 2021    ', '100', 469),
(2072, '2020 - 2021    ', '98.09', 357),
(2073, '2020 - 2021    ', '87.13', 358),
(2074, '2020 - 2021    ', '93.44', 443),
(2075, '2020 - 2021    ', '100', 30),
(2076, '2020 - 2021    ', '99', 484),
(2077, '2020 - 2021    ', '95.75', 35),
(2078, '2020 - 2021    ', '88.52', 211),
(2079, '2020 - 2021    ', '99.5', 397),
(2080, '2020 - 2021    ', '95.75', 275),
(2081, '2020 - 2021    ', '78.46', 129),
(2082, '2020 - 2021    ', '97.39', 261),
(2083, '2020 - 2021    ', '100', 243),
(2084, '2020 - 2021    ', '95.96', 547),
(2085, '2020 - 2021    ', '85.5', 89),
(2086, '2020 - 2021    ', '97', 512),
(2087, '2020 - 2021    ', '97', 195),
(2088, '2020 - 2021    ', '93.75', 520),
(2089, '2020 - 2021    ', '98.01', 292),
(2090, '2020 - 2021    ', '73.72', 311),
(2091, '2020 - 2021    ', '100', 141),
(2092, '2020 - 2021    ', '91.94', 255),
(2093, '2020 - 2021    ', '94.86', 302),
(2094, '2020 - 2021    ', '99.71', 174),
(2095, '2020 - 2021    ', '92.05', 118),
(2096, '2020 - 2021    ', '100', 48),
(2097, '2020 - 2021    ', '95.75', 363),
(2098, '2020 - 2021    ', '96', 428),
(2099, '2020 - 2021    ', '97', 23),
(2100, '2020 - 2021    ', '100', 553),
(2101, '2020 - 2021    ', '90.5', 92),
(2102, '2020 - 2021    ', '92.17', 414),
(2103, '2020 - 2021    ', '90.65', 324),
(2104, '2020 - 2021    ', '173.5', 412),
(2105, '2020 - 2021    ', '48.45', 508),
(2106, '2020 - 2021    ', '92.45', 83),
(2107, '2020 - 2021    ', '91.68', 544),
(2108, '2020 - 2021    ', '91.52', 169),
(2109, '2020 - 2021    ', '97', 499),
(2110, '2020 - 2021    ', '96', 439),
(2111, '2020 - 2021    ', '94.9', 306),
(2112, '2020 - 2021    ', '100', 493),
(2113, '2020 - 2021    ', '95.18', 240),
(2114, '2020 - 2021    ', '99', 370),
(2115, '2020 - 2021    ', '92.62', 536),
(2116, '2020 - 2021    ', '95.75', 305),
(2117, '2020 - 2021    ', '93.04', 543),
(2118, '2020 - 2021    ', '87.5', 180),
(2119, '2020 - 2021    ', '87.5', 371),
(2120, '2020 - 2021    ', '93.45', 134),
(2121, '2020 - 2021    ', '100', 476),
(2122, '2020 - 2021    ', '66.11', 59),
(2123, '2020 - 2021    ', '93.73', 228),
(2124, '2020 - 2021    ', '100', 454),
(2125, '2020 - 2021    ', '93.17', 402),
(2126, '2020 - 2021    ', '93.27', 197),
(2127, '2020 - 2021    ', '95.75', 468),
(2128, '2020 - 2021    ', '100', 478),
(2129, '2020 - 2021    ', '99.7', 103),
(2130, '2020 - 2021    ', '90.47', 364),
(2131, '2020 - 2021    ', '97.45', 418),
(2132, '2020 - 2021    ', '100', 53),
(2133, '2020 - 2021    ', '97', 200),
(2134, '2020 - 2021    ', '100', 316),
(2135, '2020 - 2021    ', '92.75', 68),
(2136, '2020 - 2021    ', '100', 434),
(2137, '2020 - 2021    ', '100', 470),
(2138, '2020 - 2021    ', '98', 504),
(2139, '2020 - 2021    ', '100', 421),
(2140, '2020 - 2021    ', '100', 333),
(2141, '2020 - 2021    ', '88.9', 494),
(2142, '2020 - 2021    ', '98', 496),
(2143, '2020 - 2021    ', '99.75', 257),
(2144, '2020 - 2021    ', '96', 495),
(2145, '2020 - 2021    ', '98.7', 390),
(2146, '2020 - 2021    ', '95.63', 388),
(2147, '2020 - 2021    ', '87.75', 542),
(2148, '2020 - 2021    ', '97.45', 274),
(2149, '2020 - 2021    ', '97', 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_previa`
--

CREATE TABLE `experiencia_previa` (
  `id_experienciaprevia` int(11) NOT NULL,
  `empresa` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_retiro` date NOT NULL,
  `funciones` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `experiencia_previa`
--

INSERT INTO `experiencia_previa` (`id_experienciaprevia`, `empresa`, `cargo`, `fecha_ingreso`, `fecha_retiro`, `funciones`, `fecha_upd`, `id_funcionario`) VALUES
(1, 'sosftnet', 'dev', '2022-06-01', '2022-06-26', 'dev', '2022-06-27 11:33:42', 577),
(2, 'SOFTVENTA', 'DEV', '2022-06-27', '2022-06-27', 'DEV', '2022-06-27 11:45:14', 579);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo_cesantias`
--

CREATE TABLE `fondo_cesantias` (
  `id_fondocesantias` int(11) NOT NULL,
  `fondo_cesantias` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fondo_cesantias`
--

INSERT INTO `fondo_cesantias` (`id_fondocesantias`, `fondo_cesantias`, `fecha_upd`) VALUES
(1, 'Porvenir', '2021-11-07 05:48:36'),
(2, 'Proteccion', '2021-11-07 05:48:37'),
(3, 'Fondo Nacional del Ahorro', '2021-11-07 05:48:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo_pension`
--

CREATE TABLE `fondo_pension` (
  `id_fondopension` int(11) NOT NULL,
  `fondo_pension` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fondo_pension`
--

INSERT INTO `fondo_pension` (`id_fondopension`, `fondo_pension`, `descripcion`, `fecha_upd`) VALUES
(1, 'No sabe/No tiene', NULL, '2021-11-07 05:48:35'),
(2, 'Colfondos', NULL, '2021-11-07 05:48:35'),
(3, 'Colpensiones', NULL, '2021-11-07 05:48:35'),
(4, 'Fondo Nacional del Ahorrro', NULL, '2021-11-07 05:48:35'),
(5, 'Porvenir', NULL, '2021-11-07 05:48:36'),
(6, 'Proteccion', NULL, '2021-11-07 05:48:36'),
(7, 'Skandia', NULL, '2021-11-07 05:48:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacion_academica`
--

CREATE TABLE `formacion_academica` (
  `id_formacionacademica` int(11) NOT NULL,
  `nivel_formacion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abreviacion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `documento` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_actualizado` bit(1) DEFAULT b'0',
  `fecha_ingreso_nombra` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profesion` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genero` enum('M','F','OTRO') COLLATE utf8_unicode_ci DEFAULT 'M',
  `direccion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `cantidad_hijos` int(2) DEFAULT NULL,
  `condicion_medica` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_activo` bit(1) DEFAULT b'1',
  `id_sede` int(11) DEFAULT NULL,
  `tipo_documento` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'CEDULA DE CIUDADANIA',
  `id_etnia` int(11) DEFAULT NULL,
  `id_rh` int(11) DEFAULT NULL,
  `id_dependencia` int(11) DEFAULT NULL,
  `id_tipovinculacion` int(11) DEFAULT NULL,
  `id_niveleducativo` int(11) DEFAULT NULL,
  `id_nivelfuncionario` int(11) DEFAULT NULL,
  `id_codigo` int(11) DEFAULT NULL,
  `id_victimaviolencia` int(11) DEFAULT NULL,
  `madre_padre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cabeza_familia` varchar(45) COLLATE utf8_unicode_ci DEFAULT '0',
  `is_viviendapropia` bit(1) DEFAULT NULL,
  `estado_vivienda` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'BUENA',
  `is_procesodisciplinario` bit(1) DEFAULT b'0',
  `numero_proceso_dis` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_proceso_dis` date DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `id_grado` int(11) DEFAULT NULL,
  `posgrado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_posesion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_posesion` date DEFAULT NULL,
  `numero_resolucion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_resolucion` date DEFAULT NULL,
  `modo_trabajo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo_laboral` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ano_ingreso` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `id_estadocivil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`) VALUES
(1, 'CARLOS EDUARDO', 'ARCE VALENCIA', '16825042', b'0', '2020-09-08', 'Bachiller Academico', 'M', '', 'arceeduardovalencia@gmail.com', '3113616141', '1965-03-28', 57, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 9, 4, NULL, 2, 6, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 6, 11, '', '212-eeee', '2022-04-08', '2333-wwee', '2022-04-07', 'Presencial', '', '', '2020', 22, NULL),
(2, 'ACOSTA REVELO ELIECER OSWALDO', NULL, '16842660', NULL, '2017-11-02', NULL, 'M', NULL, 'eliecer43@hotmail.com', '3155041643', '0000-00-00', 42, NULL, NULL, b'0', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017', NULL, NULL),
(3, 'AGUDELO MARTINEZ MIGUEL ANGEL', NULL, '1112478030', NULL, '2015-06-10', NULL, 'M', NULL, 'miguelangelagu@gmail.com', '3002762295', '0000-00-00', 29, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(4, 'ARCE VALENCIA EMILIA', NULL, '31526913', b'1', '1998-01-02', 'técnico en contabilidad y sistemas', 'F', 'Calle 1f # 12-32 Villa Monica', 'emily_arce@hotmail.com', '3145510029', '0000-00-00', 54, 1, 'no', b'0', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 8, 1, 3, 5, 23, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', 2, 4),
(5, 'CARVAJAL DIAZ MERCEDES', NULL, '31230636', NULL, '1995-01-25', NULL, 'F', 'CALLE 19 #8-47 CENTENARIO', 'mercedescar0120@hotmail.com', '3178558230', '0000-00-00', 122, NULL, NULL, b'0', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 10, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995', 2, NULL),
(6, 'BOHÓRQUEZ CANO JHON SILVIO', NULL, '1112458824', NULL, '2021-02-01', 'ABOGADO', 'M', 'CARRERA 12 #14-46', 'jhonsilviob.abogado@gmail.com', '3174298810', '0000-00-00', 36, NULL, NULL, b'0', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 23, 4, NULL, 3, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 3),
(7, 'AGUILAR SALDAÑA MARIA JOSEFA', NULL, '31533405', b'1', '2020-02-26', 'bachiller tecnico', 'F', 'Carrera 4  N. 23-07', 'majosefa2706@hotmail.com', '3163894621', '0000-00-00', 47, 2, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 3, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(8, 'ARENAS GUZMAN ANDRES FELIPE', NULL, '1112472429', NULL, '2020-03-18', 'tecnologia en gestion empesarial', 'M', NULL, 'PIPE.1.7@HOTMAIL.COM', '3187338885', '0000-00-00', 31, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(9, 'ARENAS MARIN JOSE LISIMACO', NULL, '16887875', NULL, '1997-10-16', 'Bachiller Academico', 'M', NULL, 'joliarma8020@gmail.com', '3144630051', '0000-00-00', 49, NULL, NULL, b'0', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL),
(10, 'CASTAÑEDA ROCHA JENNIFER', NULL, '1112474640', b'1', '2020-01-02', 'ABOGADA', 'F', 'CARRERA 5 SUR #10A BIS-02', 'jennicasta1220@gmail.com', '3115373722', '0000-00-00', 30, 0, 'NO', b'0', 4, '\"CEDULA DE CIUDADANIA\"', 1, 3, 8, 1, 10, 3, 11, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 11, 16, NULL, '202277777', '2022-04-02', '202277777', '2022-04-04', 'Presencial', NULL, NULL, '2020', 2, 3),
(11, 'CARABALI GARCIA INES', '', '31527130', b'1', '2002-11-25', 'lic en lengua castellana', 'F', 'CORREGIMIENTO DE QUINAMAYÓ VALLE', 'INESCARABALI4@GMAIL.COM', '3137609422', NULL, 54, 2, 'NO', b'0', 1, 'Cedula de Ciudadania', 2, 7, 9, 5, 6, 2, 4, 1, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 4, 8, '', '', NULL, '', NULL, 'null', '', '', '2002', 2, 3),
(12, 'ALCALDE SOTO CARLOS HOLMES', NULL, '16784036', NULL, '1997-11-01', 'Bachiller', 'M', NULL, 'cjalcalde3021@gmail.com', '3207802353', '0000-00-00', 51, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL),
(13, 'ZANDRA PATRICIA', 'ALTAMIRANO HURTADO ', '31535278', b'1', '2011-12-29', 'Tecnologia en Formulación de Proyectos', 'M', 'carrera 6 sur 2-03 b/ urb. cazadores', 'zandra0750@hotmail.com', '3188986073', '1975-08-22', 46, 3, 'NO', b'1', 2, 'Cedula de Ciudadania', NULL, 3, 51, 5, 3, 8, 3, 2, 'MADRE', '0', b'1', 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-18_at_9.42.25_AM.1661876232_630e3808aa7bf.jpeg', '2011', 22, 1),
(14, 'BOLIVAR GUILLERMO', NULL, '16450862', NULL, '2015-06-11', NULL, 'M', NULL, NULL, '3215944459', '0000-00-00', 57, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(15, 'CASTAÑO MAFLA HECTOR FABIO', NULL, '16825685', NULL, '2005-03-03', NULL, 'M', NULL, 'kutufla6609@hotmail.com', '3174669146', '0000-00-00', 55, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005', NULL, NULL),
(16, 'ARIAS SALAZAR ALEJANDRO', NULL, '16832826', NULL, '2016-01-08', NULL, 'M', NULL, 'alejandro16832826@gmail.com', '3158276874', '0000-00-00', 49, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(17, 'ARIAS GARCIA ALEJANDRA', NULL, '1130614692', b'1', '2020-01-02', 'Antropologa y politologa/ Especialista en Gobierno y Polític', 'F', ' CIUDAD COUNTRY UNIDAD AZOR CASA 31', 'oficina.equidaddegenero@jamundi.gov.co', '3108204711', '0000-00-00', 34, 0, 'NO', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 1, 7, 51, 4, 10, 3, 6, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(18, 'KATHERINE', 'ARISTIZABAL COLORADO ', '1112475238', b'1', '2019-12-31', 'Adminstración de empresas', 'F', 'CALLE 13 No.7-36 Libertadores', 'kataristi1113@hotmail.com', '3215638534', '1992-03-29', 30, 1, 'no ', b'1', 2, 'Cedula de Ciudadania', 1, 3, 51, 5, 6, 2, 9, 2, 'MADRE', '1', b'0', 'BUENA', b'0', '', NULL, 9, 14, '', 'DEC. 0403', '2019-12-31', '0200', '2019-12-31', 'Presencial', '', 'views/archivos/fotos/Katherine_Aristizabal.1663607940_6328a484023e7.jpg', '2019', 22, 3),
(19, 'ATEHORTUA LOPEZ MARICELA', '', '31536941', b'0', '2014-11-10', 'lic en matematicas', 'F', '', 'mary.ate.lop@hotmail.com', '3166263128', NULL, 45, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 9, 1, NULL, 2, 3, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 3, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-24_at_10.21.49_AM_-_Maricela_Atehortua.1661875934_630e36de7bb1d.jpeg', '2014', NULL, NULL),
(20, 'AVENDAÑO ANA CECILIA', NULL, '31860091', b'1', '1985-02-16', 'bachiller', 'F', 'barrio belalcazar', 'cristinamina0528@gmail.com', '3232956442', '0000-00-00', 61, 3, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 8, 14, 6, 2, 6, NULL, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985', 2, 3),
(21, 'AVENDAÑO SUAREZ NEYDER HARLEY', NULL, '1019111290', NULL, '2020-07-20', 'administrador publibo-tec contabilidad- tec contabilidad y f', 'M', 'CARRERA 98 B #48-127', 'neyderavendano@gmail.com', '3214841972', '0000-00-00', 26, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(22, 'AVILA ORTIZ FRANCY YENI', NULL, '29567615', b'1', '2011-12-15', 'tecnico en sst y secretariado ejecutivo en sistemas', 'F', 'Calle 9A N. 5-40', 'francyjenny1978@hotmail.com', '3147366605', '0000-00-00', 43, 2, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 7, 14, 6, 3, 6, NULL, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, 3),
(23, 'AVILA ROMERO YURANIS DEL CARMEN', NULL, '55306152', b'1', '2020-07-07', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CALLE 57 #8-23 LA BASE', 'Yura200922@hotmail.com', '3218327719', '0000-00-00', 37, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 3, 10, 1, 6, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(24, 'AVILES VELASCO GERMAN ALBERTO', NULL, '16696395', NULL, '2020-04-06', 'bachiller academico', 'M', NULL, 'gatomancho14@hotmail.com', '3152530795', '0000-00-00', 58, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(25, 'AZA REYES OLGA BEATRIZ', NULL, '31532916', NULL, '2009-11-12', NULL, 'F', NULL, 'olgabety2767@gmail.com', '3148779432', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019', NULL, NULL),
(26, 'BALANTA ARARAT DIVIER', NULL, '14884214', NULL, '2020-01-07', NULL, 'M', NULL, 'dibalar@gmail.com', '3104580940', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, NULL, 4, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(27, 'BALANTA  RODRIGO', NULL, '14675151', NULL, '2002-11-25', 'Bachiller Academico', 'M', NULL, 'rodrigobalanta20@gmail.com', '3218548796', '0000-00-00', 62, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', NULL, NULL),
(28, 'HENAO MARIN BLANCA NELLY', NULL, '31872181', b'1', '1992-06-23', 'basica primaria', 'F', 'Carrera 1BN n.5-29 portal del jordan', NULL, '0', '0000-00-00', 68, 1, 'no', b'1', 6, '\"CEDULA DE CIUDADANIA\"', 1, 7, 14, 6, 1, 6, NULL, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992', 2, 1),
(29, 'BALANTA RODRIGUEZ ANA PATRICIA', NULL, '31530438', b'1', '2020-02-26', 'Bachiller Academico', 'F', 'Calle 18 N. 13-14', 'anapati1502@gmail.com', '3186255338', '0000-00-00', 51, 1, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 2, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(30, 'BALANTA SALINAS ANA MARIA', NULL, '31539325', b'1', '2015-12-04', 'ADMINISTRADORA DE EMPRESAS', 'F', 'Calle 17 # 3-28', 'anamariabasa@hotmail.com', '3215700043', '0000-00-00', 43, 0, 'NINGUNA', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 2, 7, 13, 1, 10, 4, 17, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 2, 2),
(31, 'BALANTA YANETH', NULL, '31522659', b'1', '2011-02-24', 'primaria', 'F', 'Calle 21 5-32 barrio panamericano', NULL, '3172594202', '0000-00-00', 58, 3, 'no', b'1', 8, '\"CEDULA DE CIUDADANIA\"', 2, 3, 14, 6, 1, 6, NULL, 1, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, 3),
(32, 'BALANTA ZAPATA HECTOR FABIO', NULL, '6336026', NULL, '1997-08-26', 'bachiller agropecuario', 'M', NULL, NULL, '3137241262', '0000-00-00', 65, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL),
(33, 'ALTAMIRANO VIERA MARIA CONSUELO', NULL, '31525478', b'1', '2021-05-21', 'Tècnico contable', 'F', 'Cra 1A norte n. 5-29', 'consueloaltamirano@hotmail.com', '3007781722', '0000-00-00', 56, 1, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 3, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 3),
(34, 'BARONA BERMUDEZ LUIS ALEJANDRO', NULL, '1112472198', NULL, '2011-12-15', NULL, 'M', NULL, 'alejandrobarona@hotmail.com', '3174944190', '0000-00-00', 31, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(35, 'ALVAREZ ACOSTA PAOLA ANDREA', NULL, '31572880', b'1', '2020-04-06', 'finanzas y negocios internacionales', 'F', 'Km 4 via Rio Claro Haciendas de Potrerito GUA', 'Paola5911@gmail.com', '3154812486', '0000-00-00', 42, 1, 'no', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 6, 4, 17, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(36, 'BARONA CARACAS MARIA EUGENIA', NULL, '315324850', b'1', '1994-10-03', 'ABOGADA', 'F', 'calle 17 no. 17 a 31 ', 'mariaeudoctora@hotmail.com', '3155717336', '0000-00-00', 47, NULL, 'NO', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 2, 3, 12, 1, 10, 4, 16, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 16, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1994', 2, 3),
(37, 'BARONA CASTILLO VIVIANA', NULL, '1112465449', b'1', '2020-07-07', 'Técnica en procesos administrativos', 'F', 'CALLE 9A #17-34', 'vivianabar12@hotmail.com', '3158505202', '0000-00-00', 33, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', 1, 3, 27, 1, NULL, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(38, 'ALVAREZ PALMARINI GABRIELA MILENA', '', '22507780', b'1', '2020-02-26', 'PSICOLOGIA', 'F', 'calle 18 No 61 29 barrio cañavarelas 2 apto i', 'gabyalpa@yahoo.com', '3207891931', NULL, 41, NULL, 'no', b'1', 4, 'Cedula de Ciudadania', 1, 7, 3, 1, 6, 5, 26, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Gabriela_Alvarez_Palmarini.1663617277_6328c8fd5eed0.jpg', '2020', 1, 1),
(39, 'AMEZQUITA GOLONDRINO MARY ISABEL', NULL, '1085248175', b'1', '2012-02-07', NULL, 'F', 'LOS NARANJOS MANZANA 5 APTO 302 TORRE 2', 'maisabel1308@gmail.com', '3193261738', '0000-00-00', 36, 2, 'No', b'1', 5, '\"CEDULA DE CIUDADANIA\"', 1, 7, 28, 1, 6, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', 2, 3),
(40, 'ANDRADE FORERO JIMENA MARIA', NULL, '52582347', b'1', '2020-09-17', 'ARTISTA', 'F', 'Lagos de verde alfaguara 12c -1001', 'andradejimena@gmail.com', '3166536788', '0000-00-00', 51, 1, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 5, 4, 10, 3, 14, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 26, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(41, 'AMU ABONIA DANIEL ALEJANDRO', '', '1112485790', b'0', '2020-03-18', '', 'M', '', 'daniel.amu@correounivalle.edu.co', '3168460920', NULL, 26, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 11, 1, NULL, 2, 5, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 5, 10, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/foto_-_Daniel_Amú.1662559484_6318a4fc3a334.jpg', '2020', NULL, NULL),
(42, 'ANGOLA GONZALEZ ADRIANA MARIA', NULL, '31447018', b'1', '2020-07-07', 'ABOGADA', 'F', 'CARRERA 2 #5b- 34', 'adrianaangola@yahoo.es', '3218890446', '0000-00-00', 41, 3, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 2, 3, 10, 1, 6, 5, 23, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 43, 3),
(43, 'APONZA VIAFARA DIDIMO', NULL, '10549501', NULL, '1988-08-20', NULL, 'M', NULL, 'aponza06@hotmail.com didiaponza03@gmail.com', '3215630106', '0000-00-00', 56, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988', NULL, NULL),
(44, 'ARAGON ARROYO ANTONIO', NULL, '16828178', NULL, '2015-06-24', NULL, 'M', NULL, NULL, '3136798120', '0000-00-00', 52, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(45, 'ARAGON CALAPSU WALTER', '', '1112477932', b'0', '2011-02-24', '', 'M', '', 'walter_ara93@hotmail.com', '3104536400', NULL, 29, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 28, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-08_at_11.00.17_AM.1659994615_62f181f7d3340.jpeg', '2011', NULL, NULL),
(46, 'ARAGON GARCIA CARLOS ROBERTO', NULL, '76045420', NULL, '2019-01-14', NULL, 'M', NULL, 'carlitos-ara@hotmail.com', '3165705210', '0000-00-00', 43, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019', NULL, NULL),
(47, 'ARAMBULO POLO CLAUDIA PAOLA', NULL, '1075211927', b'1', '2021-03-08', 'ADMINISTRADORA DE EMPRESAS', 'F', 'Carrera 9 N.7-61 segundo piso', 'Claudia_200808@hotmail.com', '3013191031', '0000-00-00', 35, 0, 'no', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 8, 1, 10, 4, 17, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 3),
(48, 'ARANGO CANTILLO INES MARGARITA', '', '45481138', b'1', '2020-03-13', 'CONTADORA PUBLICA', 'F', 'bulevar alfaguara calle farallones conjunto r', 'inarca1130@hotmail.com', '3206939434', NULL, 53, 3, '', b'1', 4, 'Cedula de Ciudadania', NULL, 7, 12, 1, NULL, 5, 26, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Ines_Margarita_Arango.1662996440_631f4fd825337.jpg', '2020', 2, 1),
(49, 'ARANGO SUAREZ EDUARDO', NULL, '1107056751', NULL, '2020-04-01', NULL, 'M', 'Calle 49 # 120-52 apto. P202', 'eduarsuarez89@hotmail.com', '3178721620', '0000-00-00', 32, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 15, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(50, 'ARBOLEDA LLANOS MARIA CENSION', NULL, '31527292', b'1', '1998-01-06', 'LICENCIATURA EN LITERATURA/ MAGISTER EN GESTION PUBLICA', 'F', 'CALL 11 B Nº 15-39 sachamate', 'mariacllanos419@gmail.com', '3174446591', '0000-00-00', 54, 2, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 2, 7, 10, 1, 10, 5, 23, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', 2, 4),
(51, 'BONILLA ALEXANDER', NULL, '16831239', NULL, '2015-09-06', NULL, 'M', NULL, NULL, '3162085398', '0000-00-00', 50, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(52, 'BONILLA HERRERA YESSICA', NULL, '1143932285', b'1', '2020-02-26', 'Ingeniera de aliminetos', 'F', 'CALLE 79D #23 A 37 Vallegrande', 'yesbohe@gmail.com', '3146478876', '0000-00-00', 32, 1, 'NO', b'1', 10, '\"CEDULA DE CIUDADANIA\"', 2, 1, 10, 1, 6, 5, 8, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 4),
(53, 'BONILLA HURTADO ANDRES JAVIER', NULL, '1098622791', NULL, '2020-07-07', 'DERECHO- ESPECIALIZACION DERECHO FAMILIAR', 'M', NULL, 'ajbonillahurtado@gmail.com', '3015378983', '0000-00-00', 35, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(54, 'BORJA TORO NEIFI', NULL, '31479339', b'1', '2020-03-05', 'Bachiller Academico', 'F', 'Calle 3 N.6a-55', 'neifiborjatoro@gmail.com', '3137025548', '0000-00-00', 46, 2, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 2, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(55, 'BORRE LOZADA GINA PAOLA', NULL, '25562378', b'1', '2020-06-05', NULL, 'F', 'Villas de Altagracia cra 1era numero 10c 55 ', 'ginaborre@hotmail.com', '3123573113', '0000-00-00', 38, NULL, 'no', b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, 1, 27, 1, NULL, 4, 17, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(56, 'MARIA ISABEL', 'BRAVO HERNANDEZ ', '1053832518', b'1', '2020-12-03', 'ABOGADA', 'F', 'CALLE 8 10-32 APTO 301 ', 'isa9422@gmail.com', '3113584753', '1994-02-02', 28, 0, 'no', b'1', 4, 'Cedula de Ciudadania', 1, 1, 11, 1, 6, 5, 23, 2, 'NO', '0', b'0', 'BUENA', b'0', '', NULL, 23, 34, '', 'DECRETO 35-16-001', '2020-12-03', '35-01-2356', '2020-06-25', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-18_at_9.25.57_AM.1660832786_62fe4c126bfd3.jpeg', '2020', 22, 3),
(57, 'BUILES RODRIGUEZ HENRY', NULL, '16826385', NULL, '2013-10-01', 'bachiller academico', 'M', NULL, NULL, '3152581167', '0000-00-00', 55, NULL, NULL, b'0', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL),
(58, 'CIELO LILIANA', 'BURITICA ', '31522571', b'1', '1998-04-16', 'bachiller academico', 'F', 'Vereda el jordan', 'cielolilianab@gmail.com', '3225687421', NULL, 63, 3, 'no', b'1', 12, 'Cedula de Ciudadania', 1, NULL, 11, 1, 2, 2, 2, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 2, 2, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/IMG_20220824_084246_-_cielo_liliana_buritica.1662562106_6318af3a2fe2d.jpg', '1998', 22, 4),
(59, 'CABEZAS REYES PETERSON ALIPIO', NULL, '87430458', NULL, '1992-08-24', NULL, 'M', 'calle 11 sur# 10e - 111', 'petersoncabezas2021@gmail.com', '3012076309', '0000-00-00', 61, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 5, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992', 2, NULL),
(60, 'CABRERA TOBAR YOHANA', NULL, '31538942', NULL, '2018-09-20', NULL, 'F', NULL, 'jhoacabrerat@gmail.com', '3146000262', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(61, 'CABRERA PERDIGON CARLOS ALBERTO', NULL, '16829692', NULL, '2011-02-24', NULL, 'M', NULL, NULL, '3147964178', '0000-00-00', 50, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(62, 'CADENA MUNOZ PATRICIA', NULL, '29570123', NULL, '2013-07-05', 't.p. en secretariado', 'M', NULL, 'kimberly1199@hotmail.com', '3113420983', '0000-00-00', 55, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 9, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL),
(63, 'BARONA JORGE ELIECER', NULL, '16827739', NULL, '2014-07-03', NULL, 'M', 'CARRERA 17ma 10-200', 'jorge.barona@hotmail.com', '3153573398', '0000-00-00', 53, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 50, 5, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014', 2, NULL),
(64, 'BARONA RODRIGUEZ SERGIO RAUL', NULL, '16828084', NULL, '2011-02-28', NULL, 'M', NULL, 'viholba20@hotmail.com', '3146334021', '0000-00-00', 52, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(65, 'GUZMAN CARDONA CARMEN LUDIVIA', NULL, '31526767', NULL, '2005-03-03', NULL, 'F', NULL, 'melita-1968@hotmail.com', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 26, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(66, 'HUGO FRANZ', 'BARRETO OROZCO', '16849435', b'0', '2019-06-26', '', 'M', 'CARRERA 16 SUR #2-72', 'hboroz@gmail.com', '3176811691', NULL, 38, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 7, 5, 6, 4, 17, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 22, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-08_at_11.22.12_AM.1660252300_62f5708cb0ec2.jpeg', '2019', 2, NULL),
(67, 'CAICEDO AVELLANEDA ANA MARIA', NULL, '31320154', b'1', '2020-03-20', 'derecho', 'F', 'CIUDAD COUNTRY CONDOMINIO ALONDRA CASA 127', 'ana.caicedo.ivcj@gmail.com mariean13@hotmail.com', '3176807674', '0000-00-00', 39, 2, 'NO', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 1, 9, 1, 10, 4, 17, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(68, 'CAINA SERNA CLAUDIA FERNANDA', '', '66856337', b'1', '2020-12-14', 'SECRETARIA', 'F', 'CARRERA 1A SUR #6A 68 Rincon Zaragoza', 'klafer27@hotmail.com', '3174730108', NULL, 48, 2, 'NO', b'1', 5, 'Cedula de Ciudadania', 1, 1, 28, 1, 3, 2, 3, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 5, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Fernanda_Caina_-_Josselyn_Perdigón.1661800464_630d10105e875.JPG', '2020', 2, 1),
(69, 'BARRIOS MARTINEZ JESUS ANTONIO', NULL, '16823243', NULL, '2016-01-18', NULL, 'M', NULL, 'jesusantoniobarrios@hotmail.com', '3184372502', '0000-00-00', 59, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(70, ' ANA MILENA', 'PERDIGON IDROBO', '31523440', b'1', '1997-04-16', '', 'F', 'CALLE 13 7-30 B/ LIBERTADORES', 'caroflaca1991@gmail.com', '3152191345', '1964-10-02', 57, NULL, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 7, 14, 6, 1, 6, NULL, 2, 'MADRE', '1', b'1', 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.29.34_AM.1661783460_630ccda49794c.jpeg', '1997', 22, 4),
(71, 'CALDERON VALENCIA NESTOR ANTONIO', NULL, '16842080', NULL, '2016-03-31', NULL, 'M', 'calle 12 # 4a - 92', 'nestor80calderon@gmail.com', '3113065292', '0000-00-00', 41, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, NULL),
(72, 'JENNY CAROLINA', 'BARRETO OROZCO ', '31445630', b'1', '2019-12-31', 'técnico en sistemas', 'F', 'Palmeras de Verde Alfaguara Apto 704 torre B', 'carolaxoxo121279@gmail.com', '3106432237', '1979-12-12', 42, 0, 'cirugía de humero y platillos tibiales, dificultad para subir escaleras', b'1', 4, 'Cedula de Ciudadania', 1, 1, 11, 5, 3, 2, 9, 2, 'NO', '0', b'0', 'BUENA', b'0', '', NULL, 9, 14, '', 'Decreto No. 0405', '2019-12-31', '0204', '2019-12-31', 'Alternancia', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-08_at_10.39.31_AM.1659994172_62f1803c0a6bb.jpeg', '2019', 22, 3),
(73, 'CALERO LUZ MILENA', NULL, '31538727', NULL, '2011-03-19', NULL, 'F', NULL, 'milenacalero12@gmail.com', '0', '0000-00-00', 44, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(74, 'REALPE MEZA CLARA XIMENA', NULL, '1061753820', b'1', '2020-08-10', 'ABOGADA', 'F', 'calle 10 No a 04 APTO 205', 'clara_rmeza@hotmail.com', '3122434009', '0000-00-00', 29, NULL, 'no ', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 1, 3, 12, 1, 10, 4, 17, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(75, 'BASTO CORTES JAMES', NULL, '1144134047', NULL, '2020-02-28', 'administracion de empresas', 'M', 'Carrera 1k # 59b-23 cali', 'jbasto.edu@gmail.com', '3215223612', '0000-00-00', 32, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(76, 'CALERO SANCHEZ CLAUDIA DANEYI', NULL, '38670224', b'1', '2015-06-01', 'Tècnico en salud y seguridad en el trabajo', 'F', 'Cra 17 sur N.2-04', 'caleroclaudia59@gmail.com', '3158813143', '0000-00-00', 38, 5, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 7, 14, 6, 3, 6, NULL, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 2, 3),
(77, 'CASTILLO QUISOBONI JAIRO JAVIER', NULL, '4627752', NULL, '1997-04-16', NULL, 'M', NULL, NULL, '3126569584', '0000-00-00', 58, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL),
(78, 'HERRERA PINZON ADA SHIRLEY', NULL, '31536443', NULL, '2011-02-28', NULL, 'F', NULL, 'shirleyherrera7832@gmail.com', '3166248488', '0000-00-00', 45, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(79, 'CALONJE LOZANO EDUARDO', NULL, '14839072', NULL, '2020-03-02', NULL, 'M', 'CALLE 43 # 69-35 APTO 201 TORRE 5', 'EDUARDO.CALONJE@GMAIL.COM', '3017716868', '0000-00-00', 41, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(80, 'JHONATAN', 'CAMARGO MORENO ', '79760495', b'0', '2020-09-04', 'ADMINISTRADOR DE EMPRESAS', 'M', 'calle farallones 1 - 10 B/ Alfaguara', 'jhonatan.camargo1978@gmail.com', '3505963177', '1978-04-30', 44, NULL, 'no', b'1', NULL, 'Cedula de Ciudadania', 1, 7, 12, 4, 6, 3, 14, 2, 'PADRE', '0', b'1', 'BUENA', b'0', '', NULL, 14, 19, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-17_at_3.32.22_PM.1661877178_630e3bba90400.jpeg', '2020', 22, 1),
(81, 'CAMILO RODRIGUEZ WILMER ANDRES', NULL, '16837312', NULL, '2011-12-15', NULL, 'M', NULL, 'diany192009@hotmail.com', '3193578844', '0000-00-00', 44, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(82, 'BEDOYA HINCAPIE MARIA NUBIA', NULL, '31520573', b'1', '1999-02-01', 'primaria incompleta', 'F', 'Calle 9 n.1a-12', NULL, '3154210427', '0000-00-00', 62, 3, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 2, 14, 6, 1, 6, NULL, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999', 2, 5),
(83, 'CAMPO JIMENEZ DIEGO FERNANDO', NULL, '6335170', NULL, '2014-07-03', NULL, 'M', NULL, 'diegocampo910@gmail.com', '3045884026', '0000-00-00', 36, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 3, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014', NULL, NULL),
(84, 'BEJARANO ARCE CARLOS EFREN', NULL, '6398967', NULL, '2011-12-15', NULL, 'M', NULL, 'francyjenny1978@hotmail.com', '3147504441', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(85, 'CAMPO MAFLA DANNY VANESSA', NULL, '1144041646', NULL, '2017-04-11', NULL, 'F', 'carrera 15 sur # 2 - 20', NULL, '3206839817', '0000-00-00', 31, NULL, NULL, b'1', 3, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017', 2, NULL),
(86, 'GIRALDO SALCEDO HAROLD ARTURO', NULL, '16824578', NULL, '2014-08-10', NULL, 'M', NULL, 'haroldgs2014@hotmail.com', '3215061757', '0000-00-00', 57, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014', NULL, NULL),
(87, 'QUIJANO CERQUERA FERNELLY', '', '1130588706', b'0', '2020-04-30', '', 'M', 'Carrera 19 # 8-109 apto. 801 T3', 'fernellyquijano@hotmail.com', '3187908130', NULL, 35, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 15, 1, NULL, 4, 17, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 26, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Fernelly_Quijano.1662999111_631f5a476908f.jpeg', '2020', 2, NULL),
(88, 'CAMPO OROZCO CLAUDIA LLURANY', NULL, '1112459608', b'1', '2015-12-31', NULL, 'F', 'PORTAL DE JAMUNDÍ', 'CAMPOOROZCOCLAUDIA2385@HOTMAIL.COM', '3156218363', '0000-00-00', 37, 2, 'NO', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 1, 1, 12, 5, NULL, 2, 9, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 2, 1),
(89, 'CANDELA LOURIDO CONSUELO', NULL, '34513036', b'1', '2020-02-28', 'ABOGADA', 'F', 'CRA 56 N SUR 12A 22 ', 'NILSONANDRES@LIVE.COM ', '3135242211', '0000-00-00', 54, 2, 'NINGUNA', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 2, 7, 12, 1, 10, 4, 17, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(90, 'BELTRAN PEÑA YESID ALEJANDRO', NULL, '94522783', NULL, '2012-01-17', NULL, 'M', 'CRA 9 A 24-39', 'nanobeltranpena@gmail.com', '3187679247', '0000-00-00', 43, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, NULL),
(91, 'PEREZ PULGARIN ANYELI VANESSA', NULL, '1112477118', b'1', '2013-02-18', 'administraciòn pùblica', 'F', 'Carrera 8 n. 8-73', 'avpp104@gmail.com', '3166230592', '0000-00-00', 29, 0, 'no', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 1, 1, NULL, 5, 6, 2, 9, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', 2, 4),
(92, 'LEGARDA MARTINEZ MARIA CRISTINA', NULL, '59821070', b'1', '2020-05-05', 'BACHILLER', 'F', 'CONJUNTO RESIDENCIAL LA ARBOLEDA TORRE 3 APTO', 'cristina.legardam@gmail.com', '3178072549', '0000-00-00', 49, 1, 'NINGUNA', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 12, 1, 2, 2, 5, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 2),
(93, 'RESTREPO ABONIA OSCAR JAVIER', '', '1151967989', b'0', '2020-07-01', '', 'M', '', 'restrepoaboniaoscar@gmail.com', '3116796962', NULL, 23, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 6, 1, NULL, 2, 5, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 5, 10, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Oscar_Javier_Restrepo_Abonia.1663622966_6328df367869f.jpeg', '2020', NULL, NULL),
(94, 'BERMUDEZ LUCUMI LUZ ELENA', NULL, '31534721', b'1', '2011-12-15', 'Bachiller Academico', 'F', 'vereda paso de la bolsa', 'luz2012elenita@hotmail.com', '3153013226', '0000-00-00', 48, 2, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 8, 14, 6, 2, 6, NULL, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, 3),
(95, 'CAÑAVERAL URIBE NILSON JULIAN', NULL, '16836826', NULL, '2011-12-26', NULL, 'M', NULL, 'juliancanaveral02@gmail.com', '3178546228', '0000-00-00', 46, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(96, 'CAPOTE GLORIA INES', '', '31523612', b'1', '1998-01-02', 'TECNICO ADMINISTRATIVO', 'F', 'Carrera 5 No 20 - 24 B/ Panamericano', 'gloriacapote@gmail.com', '3164824399', NULL, 0, 1, 'NO', b'1', 3, 'Cedula de Ciudadania', 1, 2, 5, 1, 3, 2, 2, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 2, 2, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Gloria_Ines_Capote_.1663618585_6328ce1907d75.jpg', '1998', 2, 3),
(97, 'BERMUDEZ OCAMPO JUAN DAVID', NULL, '1112470386', NULL, '2015-06-10', NULL, 'M', NULL, 'juanpintura2014@gmail.com', '3126132217', '0000-00-00', 31, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(98, 'CARABALI  EDUARD RAMIRO', NULL, '14675129', NULL, '2004-01-19', 'basica primaria', 'M', NULL, 'kimberly1199@hotmail.com', '3105941454', '0000-00-00', 61, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004', NULL, NULL),
(99, 'CARABALI  ROBERTO', NULL, '10488558', NULL, '2020-04-07', 'bachiller academico', 'M', NULL, 'robertocarabali8@gmail.com', '3115594698', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(100, 'BETANCOURT MIRA IVAN FELIPE', NULL, '1112468796', NULL, '2019-05-02', NULL, 'M', 'CRA 16 Nº 19-140 la pradera', NULL, '3103980279', '0000-00-00', 32, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 30, 5, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019', 2, NULL),
(101, 'CARABALI ARBOLEDA LAURA DEL MAR', NULL, '1112480928', b'1', '2019-02-01', 'lenguas extrangerasen curso', 'F', 'torres del portal de jamundí Torre 12a Apto 5', 'laura.carabali02@usc.edu.co', '3172303902', '0000-00-00', 28, 1, 'no', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 2, 1, 12, 5, 6, 2, 9, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019', 2, 3),
(102, 'CARABALI BALANTA ERENIAS', NULL, '16824046', NULL, '2002-11-19', 'Bachiller Academico', 'M', NULL, NULL, '3127458801', '0000-00-00', 60, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', NULL, NULL),
(103, 'BETANCOURT RIOS ADIELA', '', '48574708', b'1', '2020-07-07', 'Abogada', 'F', 'calle 10·#8-13 santander de quilichao', 'adielabetancourtrios29@gmail.com', '3106515780', NULL, 42, 2, 'no', b'1', 3, 'Cedula de Ciudadania', 1, 7, 9, 1, 6, 5, 26, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Adiela_betancourth.1663012780_631f8fac860de.jpg', '2020', 2, 4),
(104, 'CARABALI CARABALI YULI VANESSA', NULL, '1112470947', b'1', '2020-03-16', 'TECNICA EN ESTETICA', 'F', 'carrera 6 # 8 - 32', 'vanessita0728@gmail.com', '3166378400', '0000-00-00', 31, 0, 'NO', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 2, 1, 10, 1, 3, 2, 5, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(105, 'CANDELO AGUDELO HERMES', NULL, '16836990', NULL, '2021-01-26', 'ARQUITECTO', 'M', NULL, 'hermescandelo@gmail.com', '3165026502', '0000-00-00', 44, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 5, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', NULL, NULL),
(106, 'CARABALI GARCIA LIBARDO', NULL, '14675220', NULL, '2015-09-06', NULL, 'M', NULL, NULL, '3205935600', '0000-00-00', 55, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(107, 'BETANCOURT UL BLANCA NURY', NULL, '29661457', b'1', '2020-02-25', 'administradora de empresas', 'F', 'calle 9B # 54sur-16 Las Flores', 'blancanury.betancourt@gmail.com', '3154610466', '0000-00-00', 43, 0, 'no', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 8, 1, 6, 5, 23, 1, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(108, 'CARABALI LUCUMI EDUARDO', NULL, '16830417', NULL, '2012-01-03', 'lic en lengua castellana', 'M', NULL, 'eduardocarabali@yahoo.com', '3148283417', '0000-00-00', 50, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', NULL, NULL),
(109, 'CARABALI MEZU SERGIO', NULL, '16835504', NULL, '2015-09-06', NULL, 'M', 'CORREGIMIENTO VILLA PAZ', 'cargio33@hotmail.com', '3217366064', '0000-00-00', 46, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 2, NULL),
(110, 'CARABALI MORENO IVAN', NULL, '16827709', NULL, '2014-11-10', 't.p. en secretariado ejecutivo', 'M', NULL, 'icarabalimoreno@yahoo.es', '3136371282', '0000-00-00', 53, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014', NULL, NULL),
(111, 'BETANCOURTH TORRES FERNANDO SIMON', '', '1085278478', b'0', '2020-02-28', '', 'M', '', '', '0', NULL, 32, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 11, 1, NULL, 4, 17, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 22, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/simon_betancourth.1662560628_6318a97438188.jpg', '2020', NULL, NULL),
(112, 'CARABALI VIVEROS HUGO FERNEY', '', '16833132', b'0', '2019-11-01', '', 'M', 'Cra 5 sur N° 8a - 70', 'hugocarabali@yahoo.es', '3148720662', NULL, 48, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 22, 4, NULL, 3, 13, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 13, 18, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/hugo_ferney_carabali.1662565059_6318bac351ecf.jpeg', '2019', 2, NULL),
(113, 'CARDENAS RENDON MARIA LAURENTINA', NULL, '31419364', b'1', '2012-06-12', 'ABOADA ESPECIALISTA EN DERECHO ADMINISTRATIVO', 'F', 'CALLE 20 NO. 14-32', 'lauracar1973@gmail.com', '3183605652', '0000-00-00', 49, 2, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 27, 1, 10, 4, 17, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', 2, 1),
(114, 'BETANCOURTH VEGA ELIECER', NULL, '16838423', NULL, '2011-12-30', NULL, 'M', 'calle 9 # 13 - 15', 'guarda_05@hotmail.com', '3145430520', '0000-00-00', 43, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 5, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, NULL),
(115, 'CARDONA DUQUE WILLIAM ALBERTO', NULL, '16837685', NULL, '2020-09-11', NULL, 'M', 'Cra 25 N° 5a sur - 43', 'williamcardona@gmail.com', '3186420971', '0000-00-00', 44, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 2, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(116, 'CARDONA ROMAN NESTOR JULIAN', NULL, '1053772180', NULL, '2020-03-13', NULL, 'M', NULL, 'njcardonar@misena.edu.co', '3104634503', '0000-00-00', 35, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, NULL, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(117, 'CARDOZO CUELLAR LIZBETH', NULL, '38666540', b'1', '2019-12-31', 'TECNICO EN SISTEMAS Y MECÁNICA DENTAL', 'F', 'CARRERA 12A #5-41 / 502 TORRE 3 LOS NARANJOS ', 'LZCARDOZO1182@GMAIL.COM', '3222114893', '0000-00-00', 39, 1, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 50, 5, 3, 2, 9, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019', 2, 3),
(118, 'BETANCUR AGUDELO MARIELLY', '', '41929361', b'1', '2020-08-25', 'Contabilidad sistematizada', 'F', 'CRA 12 No. 10-55', 'mariellybetancur@hotmail.com', '3218128441', NULL, 48, 2, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 1, 6, 1, 3, 2, 3, 1, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Marielly_Betancur.1663622739_6328de5342c44.jpg', '2020', 2, 3),
(119, 'CARO VILLAMIL MAYERLIN', NULL, '1112483345', b'1', '2020-08-28', 'TECNICO EN ASISTENCIA EN ORGANIZACION DE ARCHIVO', 'F', 'CALLE 21 #3-34 PANAMERICANO', 'mcaro331@gmail.com', '3178708151', '0000-00-00', 27, 0, 'NO', b'1', 7, '\"CEDULA DE CIUDADANIA\"', 1, 6, 10, 1, 3, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(120, 'BISCUE JOSE LUIS', NULL, '14650461', b'1', '2013-01-10', 'TEC LAB GESTION DEL RIESGO Y ATENCION DE DESASTRES', 'M', 'CALLE 10C #1-81 APTO 302 5A', 'jlbiscue@hotmail.com', '3154451317', '0000-00-00', 49, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 1, 12, 1, 3, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, 4),
(121, 'BLANCO GALLEGO LEOVIGILDO', NULL, '2678686', NULL, '2015-10-30', NULL, 'M', NULL, 'vigildoblanco@gmail.com', '3023687582', '0000-00-00', 50, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(122, 'CEBALLOS CALDAS ROGER ALEXANDER', NULL, '6334138', NULL, '2011-12-23', NULL, 'M', NULL, 'rogeracc0014@hotmail.com', '3045894274', '0000-00-00', 36, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(123, 'CHAGUENDO RAMIREZ FERNELLY', NULL, '16834756', NULL, '2011-02-28', NULL, 'M', NULL, 'fernelychramirez@gmail.com', '3218247064', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(124, 'CHALARCA DOMINGUEZ LUIS ALBERTO', NULL, '16845078', NULL, '2011-12-23', NULL, 'M', NULL, 'makondo1205@hotmail.com', '3002765342', '0000-00-00', 39, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(125, 'ESTUPIÑAN ESTUPIÑAN JOHN JAVIER', NULL, '14471584', NULL, '2020-04-06', 'Tecnologia en electronica', 'M', NULL, 'johneses@gmail.com', '3162517970', '0000-00-00', 41, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(126, 'FACUNDO PENAGOS MARIVEL', NULL, '1112465724', NULL, '2015-12-31', NULL, 'F', 'Calle 16 N° 7 - 21', 'marivelfacundo@gmail.com', '3178953148', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, NULL, 5, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 2, NULL),
(127, 'FAJARDO NAVARRO MARTHA YANETH', NULL, '31536517', NULL, '2015-02-04', 'basica primaria', 'F', NULL, 'jessicalocura.2009@hotmail.com', '3167504377', '0000-00-00', 45, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL);
INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`) VALUES
(128, 'FERNANDEZ DIANA SHIRLEY', '', '1130659248', b'1', '2020-03-03', 'Técnico en Asistencia de organización de archivos', 'F', 'Carrera 1 C 4 No 79-16', 'angela28081ul@gmail.com', '3168794235', NULL, 34, 2, 'NO', b'1', 8, 'Cedula de Ciudadania', 1, 7, 5, 1, 3, 2, 4, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 4, 8, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Diana_Shirley_Fernandez.1663618753_6328cec1af2f2.jpeg', '2020', 1, 3),
(129, 'FERNANDEZ RUIZ YOLANDA', NULL, '31909358', NULL, '1995-01-23', NULL, 'F', NULL, 'yolisferu@hotmail.com', '3117223007', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995', 2, NULL),
(130, 'FERNANDEZ YULE FRANCISCO HULMER', '', '16823848', b'0', '2016-01-21', 'Bachiller Academico', 'M', '', 'franciscofyule972@gmail.com', '3156506391', NULL, 57, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 9, 1, NULL, 2, 6, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 6, 11, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/foto_francisco_hulmer_fernandez_yule.1661875552_630e35607a3af.jpeg', '2016', NULL, NULL),
(131, 'FERNANDEZ ZARAMA CARLOS MARIO', NULL, '15816373', NULL, '2020-03-03', 'derecho', 'M', 'Cra 12 # 34N-204 torre 4 apto 401 cond La Riv', 'cmario482@hotmail.com', '3128207769', '0000-00-00', 39, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(132, 'FIGUEROA GOMEZ AUGUSTO', NULL, '10554070', NULL, '2015-06-10', NULL, 'M', NULL, NULL, '3155771359', '0000-00-00', 62, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(133, 'FILIGRANA BELALCAZAR FERNANDO JOSE', NULL, '1112464499', NULL, '2011-12-15', NULL, 'M', NULL, NULL, '3168470095', '0000-00-00', 34, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(134, 'FORERO MOLANO CESAR ALFONSO', NULL, '80539040', NULL, '2020-03-16', NULL, 'M', 'Cra 83a 48-24', 'forecesar@gmail.com', '3203639319', '0000-00-00', 47, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(135, 'FORY NILSE EDITH', NULL, '31536110', b'1', '2015-06-17', 'bachiller academico', 'F', 'corregimiento paso de la bolsa', ' Jamundi\"', '0', '0000-00-00', 0, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 2, NULL, 14, 6, 2, 6, NULL, 2, 'UNIÓN LIBRE', 'Madre', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 2, NULL),
(136, 'FRANCO RODRIGUEZ JOSE LUIS', NULL, '16827229', NULL, '2015-06-01', NULL, 'M', NULL, 'josebombero11@gmail.com', '3173472185', '0000-00-00', 54, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(137, 'GALINDO SANCHEZ ZOILA NUBIA', NULL, '31531426', b'1', '2002-09-02', 't.p. en secretariado ejecutivo', 'F', 'Carrera 17 sur N.2-73', 'nubia_galindo2009@hotmail.com', '3104342564', '0000-00-00', 49, 2, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 1, 9, 1, 3, 2, 9, 1, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', 2, 4),
(138, 'CHALARCA DOMINGUEZ MARIA VIVIANA', NULL, '31523370', b'1', '2010-01-29', 'primaria', 'F', 'cra 5ta 10a 02 popular', NULL, '3162814658', '0000-00-00', 57, 1, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 14, 6, 1, 6, NULL, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010', 2, 3),
(139, 'MORENO VIVEROS VALENTINA', NULL, '1143839858', NULL, '2020-01-02', NULL, 'F', 'CALLE 12 SUR #10-81', 'valentina.moreno@jamundi.gov.co', '3137651347', '0000-00-00', 30, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 25, 4, NULL, 3, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(140, 'GALLEGO DIAZ JULIANA ANDREA', NULL, '1112480319', b'1', '2020-07-07', 'Tecnico Auxiliar Administrativo', 'F', 'CARRERA 1 #5A -49 Portal Jordan', 'juli_gadiaz@hotmail.com', '3176381714', '0000-00-00', 28, 2, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, NULL, 1, 3, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(141, 'KARINA ANDREA', 'CHALARES VALENCIA ', '38602799', b'1', '2020-03-02', 'ECONOMISTA', 'F', 'CARRERA 18 SUR # 2-17 RIBERAS DEL ROSARIO ', 'kvalencia@gmail.com', '3232409596', '1982-12-29', 39, 0, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 5, 11, 1, 6, 4, 17, 2, 'NO', '0', b'0', 'BUENA', b'0', '', NULL, 17, 26, '', 'DECRETO 30-16-0097', '2020-03-02', '35-01-0138', '2020-02-11', 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_10.40.09_AM.1661877032_630e3b284927b.jpeg', '2020', 22, 4),
(142, 'GALVIS MINA LUIS ALEXIS', NULL, '1144141544', NULL, '2020-03-06', NULL, 'M', 'CALLE 17 # 16-28 LA PRADERA', 'LUISGALVISM1@GMAIL.COM', '3185311818', '0000-00-00', 31, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(143, 'CHAPARRO TORO ANA MARIA', NULL, '31321507', NULL, '2020-01-02', NULL, 'F', 'CARRERA 46 #1-124', 'am.chaparro260@gmail.com', '3209037009', '0000-00-00', 38, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 5, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(144, 'GARCES MONTAÑO MARIA DEL CARMEN', NULL, '1111764828', b'1', '2020-02-28', 'Abogada', 'F', 'Carrera 1a bis sur n.637 rincòn de zaragosa m', 'Mdcgarces.mg@gmaIl.com', '3148648213', '0000-00-00', 33, 0, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 14, 1, 10, 4, 17, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(145, 'GARCIA ARCE DIDASIO', NULL, '16837857', NULL, '2011-12-23', NULL, 'M', NULL, 'nicojuanas1923@gmail.com', '3104969576', '0000-00-00', 44, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(146, 'ESCOBAR OSPINA VANESA', NULL, '1144091731', b'1', '2020-09-09', 'ciencia politica y antropología', 'F', 'boulevar la fontana condomio lagos de verde a', 'vescobarchat@hotmail.com', '3044582751', '0000-00-00', 25, 0, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 1, 21, 4, 6, 3, 6, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(147, 'GARCIA AYDE', NULL, '38670058', b'1', '1999-02-01', 'Bachiller academico', 'F', 'Calle 3D n.13-62 Villa Tatiana', 'varejonal62@gmail.com', '3127783239', '0000-00-00', 59, 2, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 2, 1, 14, 6, 2, 6, NULL, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999', 2, 4),
(148, 'GARCIA BEDON JOSE MANUEL', NULL, '76289158', NULL, '2016-01-15', 'Bachiller Academico', 'M', NULL, 'mojorro2015@hotmail.com', '3155893418', '0000-00-00', 51, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(149, 'GARCIA MOLANO LUZ ANGELA', '', '31527556', b'1', '2012-12-13', 'Tecnico Secretariado ejecutivo', 'F', 'Cra 14a N° 16-62 La pradera', 'langelita68@hotmail.com', '3148852488', NULL, 53, 2, 'NO', b'1', 11, 'Cedula de Ciudadania', 1, 7, 2, 1, 3, 2, 3, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 3, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Luz_Angela_Garcia_Molano.1663611013_6328b085958ac.jpg', '2012', 2, 3),
(150, 'GARCIA PATIÑO JONATHAN STEVEN', NULL, '1110489185', NULL, '2020-09-15', 'ingenieria agroindustrial', 'M', NULL, 'joesgar89@gmail.com', '3166195611', '0000-00-00', 32, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(151, 'GARCIA RIVERA RAMIRO', NULL, '16820867', NULL, '1998-01-02', NULL, 'M', 'CARRERA 13 #8-81', NULL, '3166750014', '0000-00-00', 65, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 7, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', 2, NULL),
(152, 'GARCIA SANTAMARIA BLANCA VIVIANA', NULL, '31528019', b'1', '1998-04-16', 'Contadora pùblica', 'F', 'Vìa parque central N 2-54', 'viviana.garciasantamaria@gmail.com', '3113691424', '0000-00-00', 53, 0, 'no', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 13, 1, 10, 4, 17, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', 2, 4),
(153, 'GARCIA SANTAMARIA FABIO ALBERTO', NULL, '16624678', NULL, '2011-12-23', NULL, 'M', NULL, NULL, '3122593958', '0000-00-00', 62, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(154, 'GARCIA VIERA SANDRA IVONNE', NULL, '1144031652', b'1', '2020-03-19', 'profesional en recreación', 'F', 'Carrera 44 N. 18-80', 'sandra.garcia@correounivalle.edu.co', '3147317856', '0000-00-00', 32, 1, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 1, 9, 1, 10, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(155, 'DIANA JIMENA', 'CHARRUPI GOMEZ ', '1067461067', b'1', '2020-03-04', 'INGENIERO INDUSTRIAL', 'F', 'CRA 5AS Nº 8A-10 LA ARBOLEDA', 'dianacharrupi@gmail.com', '3146538873', '1986-08-24', 35, 0, 'NO', b'1', 4, 'Cedula de Ciudadania', 2, 3, 11, 1, 10, 2, 26, 2, 'NO', '0', b'1', 'BUENA', b'0', '', NULL, 27, NULL, '', '30-16-0100', '2020-02-11', '35-01-0151', '2020-03-04', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_11.04.06_AM.1660061648_62f287d0e5844.jpeg', '2020', 22, 3),
(156, 'GIL RIOS GLORIA ESTELLA', NULL, '38670336', b'1', '2019-12-31', NULL, 'F', 'Cra 6 nº 8A -57 Urb La Arboleda', 'gollita_0711@hotmail.com', '3115112578', '0000-00-00', 41, 0, 'No', b'1', 5, '\"CEDULA DE CIUDADANIA\"', 1, 3, 28, 5, 3, 5, 23, 2, 'No tiene hijos', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019', 2, 3),
(157, 'GIRALDO ROJAS IVONNE', NULL, '38665189', b'1', '2021-01-08', 'ODONTOLOGA', 'F', 'CALLE 11 No.4-80 Belalcazar', 'ivonnegiraldorojas@gmail.com', '3206173437', '0000-00-00', 39, 2, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 6, 4, 6, 3, 14, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 4),
(158, 'GUZMAN ESQUIVEL MARIA VICTORIA', NULL, '31849353', b'1', '2011-09-26', 'Economista', 'F', 'Carrera 1k n.59-41', 'mvguzman19@gmail.com', '3005120963', '0000-00-00', 61, 0, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 10, 5, 24, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 24, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 1, 3),
(159, 'ENRIQUEZ FERNANDEZ JORGE EFRAIN', NULL, '12977487', NULL, '2020-03-20', NULL, 'M', NULL, 'jorgeenfer62@hotmail.com', '3163005927', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 11, 1, NULL, 4, 15, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(160, 'GIRALDO TORRES HUGO', NULL, '16822269', NULL, '2011-12-15', NULL, 'M', NULL, 'hugogiraldo0203@gmail.com', '3148413038', '0000-00-00', 61, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(161, 'MORAN RAMIREZ OSCAR ANDRES', NULL, '1112464406', NULL, '2015-06-01', NULL, 'M', NULL, 'oscaranmoran@hotmail.com', '3186612206', '0000-00-00', 34, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(162, 'ARBOLEDA VEGA ELIZABETH', NULL, '31522370', b'1', '2020-11-10', 'Secretariado ejecutivo y auxiliar d econtabilidad ', 'F', 'calle 3c 21 108 ', 'lizarboleda61@gmail.com', '3173199965', '0000-00-00', 60, 1, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 1, 13, 1, 2, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(163, 'GOMEZ RESTREPO CARLOS ENRIQUE', NULL, '10269738', NULL, '2020-03-02', 'administracion de empresas', 'M', NULL, 'cegomez15@hotmail.com', '3006112252', '0000-00-00', 57, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(164, ' GERARDO RAFAEL', 'GUERRERO ROSERO', '2575419', b'1', '2015-06-10', 'BACHILLER TECNICO AGRICOLA', 'M', 'CALLE 17 17-22 B/ LA PRADERA', 'gerardorafaelguero@gmail.com', '3122296024', '1959-04-04', 63, NULL, 'NO', b'1', NULL, 'Cedula de Ciudadania', 1, 8, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', b'1', 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.53.40_AM.1661786756_630cda841267d.jpeg', '2015', 22, 4),
(165, 'GOMEZ GOMEZ GERNEY ELIUD', NULL, '16820476', NULL, '2017-01-03', NULL, 'M', NULL, NULL, '3233101232', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(166, 'GOMEZ MUÑOZ MARITZA', NULL, '31529729', NULL, '2019-01-25', NULL, 'F', NULL, 'maritzagomezmu@hotmail.com', '3192341879', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019', NULL, NULL),
(167, 'ARCE ALTAMIRANO JONATHAN HUMBERTO', NULL, '1112468669', NULL, '2017-04-11', NULL, 'M', 'carrera 15a # 9 - 43', 'yoti-8989@hotmail.com', '3206420517', '0000-00-00', 32, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 5, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017', 2, NULL),
(168, 'GONZALES ALVAREZ GUILLERMO LEONIDAS', NULL, '16831983', NULL, '2015-06-05', NULL, 'M', NULL, 'guillermoleonidas@hotmail.com', '3212759367', '0000-00-00', 58, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, 3),
(169, 'GUERRON PINTO HERNAN DARIO', '', '6405961', b'0', '2011-02-25', '', 'M', 'Carrera 8 # 15-22', 'hernang61@hotmail.com', '3192550425', NULL, 39, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 15, 1, NULL, 2, 23, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 23, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Hernan_Dario_Guerron_Pinto.1663877209_632cc059950d1.jpeg', '2011', 2, NULL),
(170, 'GONZALEZ AGUDELO JUAN DAVID', NULL, '1125718020', NULL, '2020-10-14', 'INGENIERO CIVIL', 'M', 'Calle 22B #19-120', 'JUDGONZALEZAG@GMAIL.COM', '3155387921', '0000-00-00', 36, 1, 'NO', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 1, 29, 5, 10, 4, 17, 2, 'Padre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(171, 'GONZALEZ ARICAPA DUVALIER', NULL, '6498997', NULL, '2020-03-10', 'administracion de empresas', 'M', NULL, NULL, '3166915711', '0000-00-00', 43, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(172, 'GONZALEZ BALANTA MAIRA ALEJANDRA', '', '1112475284', b'0', '2018-07-19', '', 'M', '', 'saraysalome1503@gmail.com', '3147400004', NULL, 30, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/IMG-20220824-WA0064_-_Maira_Alejandra_Gonzalez_Balanta.1661802850_630d1962bdd88.jpg', '2018', NULL, NULL),
(173, 'GUEVARA IDARRAGA VELKIYENIFER', '', '31537582', b'1', '2019-12-31', 'AUXILIAR ENFERMERIA', 'F', 'Cra 7 Nº 16B-24 Bello Horizonte', 'belki.guevara31@gmail.com', '3155344946', NULL, 45, 2, 'NO', b'1', 2, 'Cedula de Ciudadania', 1, 1, NULL, 5, 3, 2, 3, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 5, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Velki_Yennifer_Guevara.1663613747_6328bb333cd14.jpeg', '2019', 2, 1),
(174, 'RODAS LONDOÑO YOLANDA', NULL, '41775475', b'1', '2012-12-21', 'ECONOMIA', 'F', 'AV CHIPAYA KM1 CALLEJOS LOS NARANJOS - CONJUN', 'yolarodas@hotmail.com', '3003267293', '0000-00-00', 62, 1, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 1, NULL, 1, 6, 4, 23, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', 2, 1),
(175, 'GONZALEZ CHARA NATHALIA', NULL, '1112492327', b'1', '2020-07-31', 'TECNOLOGA DE SISTEMAS DE INFORMACION', 'F', 'calle 10 c# 1-81', 'onza1000@hotmail.com', '3219192799', '0000-00-00', 24, 0, 'no', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 2, 3, 8, 1, 3, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(176, 'GUTIERREZ GUTIERREZ JHON EDISON', NULL, '1112463251', NULL, '2015-06-11', NULL, 'M', NULL, 'jhongugu32@hotmail.com', '3163240318', '0000-00-00', 34, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(177, 'GUTIERREZ MOLANO DAVID ALEXANDER', NULL, '1061739022', b'1', '2021-08-26', 'abogado', 'M', 'Km 21 vía Cali-Jamundí cedros del castillo ca', 'davidgutierrezm@hotmail.com', '3103821698', '0000-00-00', 30, 0, 'NO', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 29, 4, 10, 3, 14, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 1),
(178, 'GUZMAN BALANTA DIEGO', NULL, '16827292', NULL, '2015-06-10', NULL, 'M', NULL, NULL, '3107003475', '0000-00-00', 53, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(179, 'CAMPO JIMENEZ MAURICIO ESTEBAN', NULL, '1112465316', NULL, '2017-11-01', NULL, 'M', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(180, 'VEGA BARONA DIEGO ALBERTO', '', '79748411', b'0', '2016-01-04', '', 'M', '', 'divega20@hotmail.com', '0', NULL, 44, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 31, 1, NULL, 4, 17, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 24, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Diego_Alberto_Vega_Barona.1663602776_6328905853bd8.jpeg', '2016', NULL, NULL),
(181, 'GUZMAN GALVIS CARLOS FERNANDO', NULL, '16837949', NULL, '2015-06-04', NULL, 'M', NULL, 'caradulce26@hotmail.com', '3167569063', '0000-00-00', 43, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(182, 'COLLAZOS HERNANDEZ ALVARO', NULL, '16822907', NULL, '1993-04-02', NULL, 'M', 'cra 1 bis sur 5A 37', 'alvaro.collazos@hotmail.com', '3116170767', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993', 2, NULL),
(183, 'GUZMAN GALVIS OMAR HUMBERTO', NULL, '94402899', NULL, '2015-09-06', NULL, 'M', NULL, 'oguzmangalvis@hotmail.com', '3154721455', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(184, 'LAGUNA DIAZ JULIO CESAR', NULL, '16843844', NULL, '2015-06-03', NULL, 'M', NULL, 'juliolaguna1982@gmail.com', '3108971563', '0000-00-00', 40, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(185, 'LARRAHONDO GONZALEZ MONICA', NULL, '31539577', b'1', '2020-01-13', 'ADMINISTRADOR EMPRESAS', 'F', 'CALLE 9 #10-21 Juan Ampudia', 'monila_20@hotmail.com', '3187936337', '0000-00-00', 43, 1, 'No', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 7, 4, 6, 2, 11, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 38, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(186, 'GUZMAN GUTIERREZ ALBANIA', NULL, '31537154', b'1', '2015-06-16', 'Técnico en seguridad y salud en el trabajo', 'F', 'Calle 11 transversal 14 23 ', 'alba102010@hotmail.com', '3107069162', '0000-00-00', 46, 3, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 1, 14, 6, 3, 6, NULL, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 2, 3),
(187, 'EFIGENIA', 'LASSO BALANTA ', '31525254', b'1', '2011-12-23', 'Bachiller ACADEMICA', 'F', 'Corregimiento de Villa paz', 'Efigenialasso.1966@gmail.com', '3147373557', '1966-04-03', 56, 2, 'recomendacion medica por situación en columna vertebral', b'1', 11, 'Cedula de Ciudadania', 2, 8, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', b'1', 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.58.40_AM.1661786027_630cd7abe3d2f.jpeg', '2011', 22, 3),
(188, 'LASSO CARABALI EVERLEY', NULL, '16375052', NULL, '1992-07-13', NULL, 'M', NULL, NULL, '3117861027', '0000-00-00', 63, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992', NULL, NULL),
(189, 'HENAO AVILA ARBEY', NULL, '16824419', NULL, '2009-02-11', NULL, 'M', 'carrera 4 a sur # 8b - 16', 'ahenaoavila@hotmail.com', '3113050614', '0000-00-00', 56, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009', 2, NULL),
(190, 'COLLAZOS HURTADO WILSON', NULL, '16835597', NULL, '2020-02-17', NULL, 'M', 'Transversal 5c # 12-25', 'Wilssoncollazoshurtado@gmail.com', '3206301152', '0000-00-00', 45, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, NULL),
(191, 'LASSO VELEZ JAIME LUIS', NULL, '16827465', NULL, '2010-11-18', NULL, 'M', NULL, NULL, '3147204937', '0000-00-00', 54, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010', NULL, NULL),
(192, 'COLLAZOS TELLO CARLOS', NULL, '1112461144', NULL, '2015-06-11', NULL, 'M', NULL, NULL, '3186945409', '0000-00-00', 35, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(193, 'PEREA SANCHEZ CARLOS ANDRES', NULL, '16847369', NULL, '2019-12-31', NULL, 'M', 'calle 12 sur 1081 apto 502b', 'carlos.perea00@hotmail.com', '3183725006', '0000-00-00', 38, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, NULL),
(194, 'GONZALEZ RENGIFO NESTOR RAUL', NULL, '16828585', NULL, '2016-01-13', NULL, 'M', NULL, 'nestor.gonzalez70@hotmail.com', '3175310190', '0000-00-00', 52, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(195, 'GRANDEZ FLOREZ RESFA NASMILLER', NULL, '34563789', b'1', '2020-04-27', 'SECRETARIADO EDUCATIVO', 'F', 'CALLE 15D #8-27 CIUDAD SUR', 'resfa229@hotmail.com', '3207851721', '0000-00-00', 50, 1, 'No', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 1, 10, 1, 3, 2, 5, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(196, 'COLORADO MONTAÑO AURA CARMELA', NULL, '66862773', b'1', '2017-08-09', 'técnico en sistemas y técnico en mercadeo y ventas', 'F', NULL, 'auracarmela@hotmail.com', '3117796835', '0000-00-00', 50, 3, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 7, 14, 6, 3, 6, NULL, 1, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017', 2, 3),
(197, 'HERNANDEZ ARCOS EDUARDO', NULL, '94538658', NULL, '2017-04-11', NULL, 'M', 'Cra 12 sur # 10 a s 48', 'eduardohernandezarcos@hotmail.com', '3173094762', '0000-00-00', 37, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017', 2, NULL),
(198, 'GRIJALBA RAUL', NULL, '16823343', NULL, '2011-02-24', NULL, 'M', NULL, NULL, '3128056981', '0000-00-00', 60, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(199, 'GRISALES SANZ EDGAR', NULL, '16825123', NULL, '2020-02-18', NULL, 'M', 'carrera 11 # 4 - 25', 'grisalessanz@hotmail.com', '3168389999', '0000-00-00', 56, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, NULL),
(200, 'HERNANDEZ DORADO CARLOS ANDRES', NULL, '16849773', NULL, '2020-07-08', NULL, 'M', 'calle 10D #5 - cs 16', 'jamundicgs.carloshernandez@gmail.com', '3172924206', '0000-00-00', 37, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(201, 'GUAMANGA MARTINEZ ANGELA MARCELA', NULL, '1061777774', b'1', '2020-03-13', 'CONTADORA PÚBLICA', 'F', 'CAALLE 4B N 1 DIAG SUR 20', 'algm910@gmail.com', '3174843264', '0000-00-00', 26, 0, 'NINGUNA', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 13, 1, 6, 5, 23, 1, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(202, 'GUAMPE CARABALI LEIDY TATIANA', '', '1144158275', b'1', '2020-04-07', 'Tecnologa en gestion adminsitrativa', 'F', 'CRA11 No. 7-56 ', 'tati_9216@hotmail.com', '3113195382', NULL, 29, 0, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 7, 6, 1, 3, 5, 26, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Leidy_tatiana_Guampe_Carabali.1663622918_6328df06370ed.jpg', '2020', 2, 3),
(203, 'HERNANDEZ IDROBO YALILA', NULL, '66703526', b'1', '2011-12-15', '\"tècnico de revestimiento estructural. Tècnico en construcci', 'F', 'Carrera 5 sur portal de jamundi', 'angieestacio0214@gmail.com', '3205498413', '0000-00-00', 57, 4, ' pero no declarò por miedo\"', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 2, NULL, 14, 6, 3, 6, NULL, 1, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, 2),
(204, 'OROZCO BALCAZAR RUTH JANETH', '', '31527016', b'1', '1988-09-12', 'ABOGADA especalizada en derecho administrativo ', 'F', '\"cra 10b No. 14bis sur 24 San benito 1\"', 'ruth-janneth@hotmail.com', '3162249963', NULL, 55, 2, 'NO', b'1', 2, 'Cedula de Ciudadania', 1, 3, 12, 1, 10, 5, 17, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 25, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Ruth_Yaneth_Orozco.1662995783_631f4d47e8996.jpeg', '1988', 2, 4),
(205, 'GUERRERO NAVIA CRISTIAN DAVID', NULL, '1112475136', NULL, '2020-02-27', 'Bachiller Academico', 'M', NULL, 'cristiandavidguerrero@gmail.com', '3113488994', '0000-00-00', 30, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(206, 'HERNANDEZ LEON NANCY STELA', NULL, '31532161', b'1', '2011-12-30', '\"Auxiliar de contabilidad y secretariado', '', 'F', 'jamundi', '0', '0000-00-00', 0, 0, 'NO', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 2, NULL, 14, 6, 3, 6, NULL, 2, 'UNIÓN LIBRE', 'Madre', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, NULL),
(207, 'GUERRERO OTERO HUGO DARIO', NULL, '10751572', NULL, '2020-03-13', NULL, 'M', 'calle 17 a # 17-40', 'hdgotero@gmail.com', '0', '0000-00-00', 55, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(208, 'LEGARDA MARTINEZ YONNY FRANCISCO', NULL, '12747976', NULL, '2020-05-05', NULL, 'M', 'CONJUNTO RESIDENCIAL LA ARBOLEDA TORRE 2 APTO', 'yonnylegarda@hotmail.com', '3113532122', '0000-00-00', 42, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 10, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(209, 'LENIS PALACIOS ELIAS', NULL, '1112480270', NULL, '2020-03-02', 'bachiller tecnico', 'M', NULL, 'eliaslenis93@gmail.com', '3225331533', '0000-00-00', 28, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(210, 'HERNANDEZ LLANOS DIANA PAMELA', NULL, '1144197513', b'1', '2020-03-19', 'bachiller comercial - empresarial', 'F', 'Carrera 24a n.T29-33', 'pamela.her96@gmail.com', '3184940750', '0000-00-00', 25, 0, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 3, 9, 1, 2, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(211, 'LEON PAREDES ROSALBA', NULL, '31867554', NULL, '1995-02-01', NULL, 'F', NULL, NULL, '3153369056', '0000-00-00', 61, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, NULL, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995', NULL, NULL),
(212, 'LERMA SALAZAR SANDRA VIVIANA', NULL, '38667277', NULL, '2011-12-23', NULL, 'F', NULL, 'sandralerma41@gmail.com', '3146434805', '0000-00-00', 38, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(213, 'HERNANDEZ MUÑOZ ROSA HERLINDA', NULL, '25543947', b'1', '2020-06-04', 'Bachiller Academico', 'F', 'CARRERA 1 BIS  6 - 117 CANTABRIA ', 'FABIYSEBAS2020H@GMAIL.COM', '3116816779', '0000-00-00', 55, 2, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 2, 7, 9, 5, 2, 2, 4, 1, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(214, 'MEJIA GIRALDO HENRY ALIRIO', NULL, '16830995', NULL, '2016-03-31', NULL, 'M', 'Carrera 8a #1a-08', 'henryalirio25@gmail.com', '3122210644', '0000-00-00', 50, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 5, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, NULL),
(215, 'LOBOA LARRAHONDO ERNEY', NULL, '6336190', NULL, '2002-10-21', 'Bachiller Academico', 'M', NULL, 'erneyloboa0863@gmail.com', '3148930356', '0000-00-00', 58, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', NULL, NULL),
(216, 'MELO TRUJILLO KATHERINE ALEXANDRA', NULL, '1077871783', b'1', '2021-01-07', 'ADMINISTRADORA DE EMPRESAS', 'F', 'Conjunto los naranjos', 'kamelotrujillo@gmail.com', '3202094683', '0000-00-00', 26, 1, 'no', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 8, 1, 10, 5, 23, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 3),
(217, 'CAICEDO VALENCIA ANA MARIA', NULL, '1112484992', NULL, '2017-01-03', NULL, 'F', NULL, 'ana-maria1022@hotmail.com', '3178421509', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(218, 'HERNANDEZ TORRES LEYSI CRISTINA', NULL, '1061746925', b'1', '2020-07-17', 'técnico profesional en secretariado ejecutivo', 'F', 'Corregimiento Robles', 'leisy.cristina@hotmail.com', '3216279322', '0000-00-00', 30, 0, 'ninguna', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 5, 3, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(219, 'MENDEZ  ROCIO', NULL, '31526902', NULL, '1997-08-25', 'tecnologia en educacion basica primaria', 'M', NULL, NULL, '3146807657', '0000-00-00', 54, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL),
(220, 'JARAMILLO QUINTERO ALEJANDRA JANETH', '', '1107091906', b'1', '2020-03-13', 'ABOGADA', 'F', 'Carrera 19 No 8 - 109 Torre 2 Apto 904', 'jaramilloquintero20@gmail.com', '3173628951', NULL, 25, NULL, '', b'1', 4, 'Cedula de Ciudadania', NULL, NULL, 12, 1, 6, 5, 26, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Alejandra_Jaramillo.1662996951_631f51d771651.jpg', '2020', 2, NULL),
(221, 'HERRERA MEDINA PAULA ANDREA', NULL, '31536805', NULL, '2011-12-23', NULL, 'F', NULL, 'paula.herrera2331@gmail.com', '3155610613', '0000-00-00', 46, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(222, 'MENDEZ HOYOS JULIO CESAR', NULL, '1112478868', NULL, '2017-04-11', NULL, 'M', NULL, 'julio_mendez4@hotmail.com', '0', '0000-00-00', 28, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 5, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017', NULL, NULL),
(223, 'LOBOA SANDOVAL YESID', NULL, '16849146', NULL, '2011-12-15', NULL, 'M', NULL, 'loboa.loboasandoval@hotmail.com', '3226140926', '0000-00-00', 37, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(224, 'ROJAS RAMIREZ JESSICA MARIA', NULL, '1113682638', NULL, '2020-03-16', NULL, 'F', 'Cra 42b # 46-30', 'jemrojasra@gmail.com', '3166052565', '0000-00-00', 25, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(225, 'LONDOÑO CEBALLOS XIMENA', NULL, '1112474579', b'1', '2021-08-02', 'ABOGADA', 'F', 'Calle 13 # 7-34 piso 2', 'ximeceballo28@hotmail.com', '3102742739', '0000-00-00', 30, 0, 'NO', b'1', NULL, '\"CEDULA DE CIUDADANIA\"', 1, 3, 15, 4, 10, 3, NULL, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 3),
(226, 'MEZU LUCUMI ROBINSON', NULL, '16834798', NULL, '2011-12-23', NULL, 'M', NULL, 'robin0274@hotmail.com', '3214775553', '0000-00-00', 47, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(227, 'HERRERA MONTOYA HUMBERTO', NULL, '16246598', NULL, '2010-01-12', NULL, 'M', NULL, 'humbertoherrera1420@gmail.com', '3147225990', '0000-00-00', 69, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010', NULL, NULL),
(228, 'LOPEZ CERON ADRIAN BENITO', NULL, '87573936', NULL, '2020-07-01', NULL, 'M', 'CALLE 15 T # 11-17', 'adrianest1@gmail.com', '3164373701', '0000-00-00', 42, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 1, NULL, 5, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(229, 'MEZU PEÑA NORALBA', NULL, '31525524', NULL, '2002-12-11', 'lic educacion basica primaria', 'M', NULL, 'xgm17@hotmail.com', '3233400033', '0000-00-00', 67, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', NULL, NULL),
(230, 'MICOLTA VARGAS CARLOS', NULL, '16821274', NULL, '2011-10-11', 'Bachiller', 'M', NULL, 'carlos_micolta@hotmail.com', '3154258032', '0000-00-00', 63, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(231, 'LOPEZ CORAL ROIMAR ARLEY', NULL, '1086980846', NULL, '2020-02-21', NULL, 'M', 'Cll 12 SUR 10E 57 Torre B Apto 201 Cond. San ', 'roiman16@hotmail.com', '3147085418', '0000-00-00', 34, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(232, ' LILIANA', 'GOMEZ BARONA', '31526685', b'1', '2013-11-07', 'NORMALISTA SUPERIOR - TECNICO EN RECURSOS HUMANOS', 'F', 'CRA 21 BIS N 8SUR 07', 'lilianago.67@hotmail.com', '3166243164', '1967-10-14', 54, 1, 'nodulo tiroideo', b'1', 4, 'Cedula de Ciudadania', 2, 7, 10, 1, 3, 2, 3, 2, 'MADRE', '1', b'0', 'BUENA', b'0', '', NULL, 3, 3, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-17_at_2.55.57_PM_(1).1660837206_62fe5d56b2756.jpeg', '2013', 22, 3),
(233, 'MILLER GALLEGO HERING ULISES', NULL, '16824890', NULL, '2011-01-03', NULL, 'M', NULL, 'heringmiller1@gmail.com', '3184291380', '0000-00-00', 56, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(234, 'LOPEZ GARCIA RAUL', NULL, '14890389', NULL, '2011-02-24', NULL, 'M', NULL, 'raullopezgarcia46@yahoo.es', '3156975454', '0000-00-00', 54, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(235, 'MINA LOZADA VICTORIA EUGENIA', NULL, '31447512', b'1', '2012-08-16', 'LICENCIADA EN LENGA CASTELLANA Y COMUNICACIÓN', 'F', 'CORREGIMIENTO VILLA PAZ ', 'vickylosada-25@hotmail.com', '3218297321', '0000-00-00', 41, 2, 'NO ', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 2, 1, 12, 1, 10, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', 2, 1),
(236, 'LOPEZ HURTADO ANGIE MELISSA', '', '1143924681', b'1', '2021-06-01', 'Administradora pública', 'F', 'carrera 49A SUR #20-32', 'anmelohur89@gmail.com', '3165323619', NULL, 32, 0, 'no', b'1', 4, 'Cedula de Ciudadania', 2, 5, 3, 4, 6, 3, 14, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 14, 19, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Angie_Melissa_Lopez_Hurtado.1663617328_6328c930cdb24.jpg', '2021', 2, 3),
(237, 'MONTOYA ALVAREZ YURANI ANDREA', NULL, '1130671009', NULL, '2017-11-01', NULL, 'F', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(238, 'HOLGUIN MARIA VIVIANA', '', '31526225', b'1', '2013-09-03', 'Tecnico en administración de empresas 6 semestres', 'F', 'CALLE 17 No. 7-42', 'viholba20@hotmail.com', '3008439646', NULL, 54, 2, 'Perdida visual 100% de un ojo (tiene protesis)', b'1', 4, 'Cedula de Ciudadania', 1, 3, 6, 5, 3, 2, 9, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Maria_Viviana_Holguin.1663622565_6328dda55fcd0.jpeg', '2013', 2, 4),
(239, 'MOLINA NAVARRETE HERMENCIA', NULL, '31522118', b'1', '1995-01-02', 'Contadora pùblica', 'F', 'Carrera 7 N.10-250', 'hermencia@gmail.com', '3153059867', '0000-00-00', 59, 2, 'NO ', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 1, 13, 1, 6, 4, 17, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995', 2, 1),
(240, 'LOPEZ HURTADO CLAUDIA LORENA', '', '66967437', b'1', '2020-07-07', 'Bachiller', 'F', 'Calle 12 D Nº 51 sur - 33 Terranova', 'claren79@hotmail.com', '3002353705', NULL, 42, 2, 'NO', b'1', 4, 'Cedula de Ciudadania', 2, 3, 31, 1, 2, 2, 3, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 5, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Claudia_Lorena_Lopez_Hurtado.1663619566_6328d1ee026e7.jpg', '2020', 2, 3),
(241, 'HOLGUIN SALGADO INES', NULL, '31445875', b'1', '2015-12-05', 'Administradora de empresas', 'F', 'CALLE 8 G 51 SUR 100', 'INHOSA0209@GMAIL.COM', '3175329278', '0000-00-00', 42, 1, 'no', b'1', 5, '\"CEDULA DE CIUDADANIA\"', 1, 1, 27, 1, 6, 5, 23, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 2, 3),
(242, 'MONTAÑO BALANTA JAVIER', NULL, '76289004', NULL, '2015-06-10', NULL, 'M', NULL, NULL, '3127583399', '0000-00-00', 58, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(243, 'MONTES ROMERO LILIANA PATRICIA', NULL, '32271552', b'1', '2020-07-07', '\"técnico en mantenimiento de equipo de computo', '', 'F', 'Jamundi', '0', '0000-00-00', 0, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, NULL, 14, 1, 4, 2, 4, 2, 'SOLTERO', 'Madre', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(244, 'LOPEZ SANCHEZ MARIA RUTH', NULL, '31520989', b'1', '1995-02-01', 'TECNICO EN ASISTENTE ADMINISRATIVIO', 'F', 'Calle 5 No 1 - 12 Portal del Jordan', 'mrjplapa@hotmail.com  marishalo1221@gmail.com', '3163294206', '0000-00-00', 63, 3, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 1, 5, 1, 3, 5, 9, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995', 2, 3),
(245, 'MONTILLA DEICY LORENA', '', '1107057600', b'1', '2020-07-07', 'FINANZAS Y NEGOCIOS INTERNACIONALES NO GRADUADA- CONTABILIDA', 'F', 'calle 14 n. 19-78', 'montillalorena27@gmail.com', '3123306076', NULL, 32, 2, 'no', b'1', 4, 'Cedula de Ciudadania', 1, 7, 12, 1, 3, 2, 3, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Lorena_Montilla.1662996797_631f513d5f0da.jpg', '2020', 2, 3),
(246, 'LUCUMI CORTES OSCAR MARINO', NULL, '6334315', NULL, '2016-01-22', NULL, 'M', NULL, 'olucumi@misena.edu.co', '3206310881', '0000-00-00', 36, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL),
(247, 'MORALES BONILLA JUAN DAVID', NULL, '1112474530', NULL, '2021-02-01', 'TOPOGRAFO', 'M', NULL, 'juanmoraboni@gmail.com', '3147586553', '0000-00-00', 30, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 5, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', NULL, 3),
(248, 'HOYOS ARBOLEDA MONICA', NULL, '1151946402', b'1', '2020-07-09', 'Técnico en archivo y técnico administrativo', 'F', 'Diagonal 45 n.54C-41', 'monicahoy22@gmail.com', '3194721714', '0000-00-00', 29, 0, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 11, 1, 3, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(249, 'MORALES BONILLA LUIJAN', NULL, '1112486420', NULL, '2020-09-01', 'BACHILLER', 'M', 'TRANSVERSAL 5A D12-18', NULL, '3178044017', '0000-00-00', 26, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 7, 4, NULL, 2, 11, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 10, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(250, 'EPIFANIA', 'LUCUMI LEON ', '31527378', b'1', '2015-06-11', 'bachiller agricola', 'F', 'corregimiento de chagres', 'epi0408@hotmail.com', '3127579901', '1967-04-08', 55, 4, 'hipertensa', b'1', 11, 'Cedula de Ciudadania', 2, 1, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', b'1', 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.55.14_AM.1661785616_630cd6109b679.jpeg', '2015', 22, 1),
(251, 'MORALES LORA ALEXANDER', NULL, '16844746', NULL, '2011-12-16', 'ingenieria electronica', 'M', 'trasv 14# 7-43', 'alexandermoraleslora@gmail.com', '3103829104', '0000-00-00', 39, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, NULL),
(252, 'LUNA ACOSTA VIVIANA AMPARO', NULL, '29361309', NULL, '2017-11-01', NULL, 'F', NULL, 'amparoluna.1982@gmail.com', '3215721909', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(253, 'ELIZABETH', 'HOYOS HOYOS ', '31529201', b'1', '2020-11-10', 'tecnico auxiliar administrativo', 'F', 'CALLE 22A # 16-31 B/ La pradera', 'isabeth111@hotmail.com', '3147162285', '1968-12-30', 53, 4, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 7, 11, 1, 3, 2, 3, 2, 'MADRE', '0', b'0', 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-16_at_5.00.24_PM.1661877674_630e3daac6d07.jpeg', '2020', 22, 1),
(254, 'MORENO CARABALI EDUIN ENRIQUE', NULL, '16836815', NULL, '2011-12-16', NULL, 'M', NULL, 'eduinemc@hotmail.com', '3137127007', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`) VALUES
(255, 'LUCUMI ZAPATA SOFIA DEL PILAR', NULL, '38667799', b'1', '2020-02-21', 'BACHILLER', 'F', 'Cra 8AS Nº 8-60 Billa Pyme', 'sofialaspri@gmail.com', '3226136020', '0000-00-00', 38, 2, 'NO', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 2, 7, NULL, 1, 2, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(256, 'MORENO GARCIA CLAUDIA PATRICIA', NULL, '31536079', NULL, '2015-03-02', NULL, 'F', NULL, 'concejojamundi15@hotmail.com', '3173344010', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(257, 'LUGO CARVAJAL LUZ MERY', '', '31883877', b'1', '2020-07-16', 'ABOGADA', 'F', 'cra 19A# 8-93 Reserva Bambu Casa 2B', 'lumelu_07@hotmail.com', '3013236399', NULL, 59, 4, 'NO', b'1', 3, 'Cedula de Ciudadania', 1, 7, 8, 1, 6, 4, 17, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 22, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/MI_FOTO_-_luz_mery.1661876089_630e3779d7220.jpg', '2020', 2, 1),
(258, 'MORENO SANCHEZ MYRIAN', NULL, '31524305', NULL, '2011-11-26', NULL, 'F', NULL, 'moreno.myriam@gmail.com', '3217198453', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(259, 'MORALES MOLINA JAIME ANDRES', NULL, '98392658', NULL, '2020-02-28', 'Bachiller Academico', 'M', NULL, 'jaime75.morales@gmail.com', '3105034488', '0000-00-00', 46, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(260, 'CORAL PEREA LUCY', NULL, '66731533', b'1', '2009-07-17', 'ADMINISTRADORA EMPRESAS', 'F', 'CALLE 9 #9-29 Barrio Juan Ampudia', 'coralperea.lucy@gmail.com', '3217239886', '0000-00-00', 56, NULL, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 2, 7, NULL, 4, 10, 1, 1, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009', 2, 3),
(261, 'HOYOS HOYOS NELLY', '', '31969652', b'1', '2020-02-14', '\"PSICOLOGA', 'F', 'F', 'nellyhoy1967@hotmail.com', '0', NULL, 0, 0, 'NO', b'1', 4, 'Cedula de Ciudadania', 3, NULL, 6, 1, 7, 5, 26, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Nelly_Hoyos.1663622636_6328ddec8f0a1.jpg', '2020', 2, NULL),
(262, 'MORALES RODRIGUEZ CAROLINA', NULL, '52951560', b'1', '2020-03-19', 'medicina veterinaria', 'F', 'CARRERA 9 N 12-53', 'caro.mr11@gmail.com', '3212663041', '0000-00-00', 39, 0, 'NINGUNA', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 10, 4, 17, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(263, 'LUGO MEDINA CESAR AUGUSTO', NULL, '16841917', NULL, '2011-12-23', NULL, 'M', NULL, NULL, '3177922949', '0000-00-00', 41, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(264, 'JAIME VICENTE', 'CORDOBA MELO ', '87530436', b'1', '2015-10-30', '', 'M', 'carrera 4 b lote No. 3 B/ VILLA PYME ETAPA II', 'jaimevicentecordobamelo@gmail.com', '3107376823', '1963-11-14', 58, NULL, 'NO', b'1', NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 1, 6, NULL, 2, 'PADRE', '0', b'1', 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_2.39.45_PM.1661802452_630d17d46640d.jpeg', '2015', 22, 4),
(265, 'CHURI AGUILAR MARILUZ', NULL, '38665822', b'1', '2020-02-26', 'bachiller tecnico', 'F', 'trans 5c dia12 No. 12 - 40 la adrianita', 'maryluzchury82@gmail.com', '3126474886', '0000-00-00', 39, 2, 'no', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 2, 3, 9, 1, 2, 2, 4, 1, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(266, 'HURTADO MESA WILMER', NULL, '16785307', NULL, '2015-06-01', NULL, 'M', NULL, 'chinchehurtado@hotmail.com', '3175066141', '0000-00-00', 51, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(267, 'MACHADO PEREZ SARA', NULL, '1112487304', NULL, '2020-01-02', NULL, 'F', 'CARRERA 18 SUR #-2-61', 'saramachadope@gmail.com', '3206967761', '0000-00-00', 26, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 7, 4, NULL, 2, 11, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 38, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(268, 'MORAN VICUÑA OSCAR', NULL, '16821398', NULL, '1980-12-12', NULL, 'M', NULL, NULL, '3145378490', '0000-00-00', 62, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980', NULL, NULL),
(269, 'CORTES MEJIA NELSON FERNANDO', NULL, '6228200', NULL, '2016-02-17', NULL, 'M', NULL, 'ncortes@javerianacali.edu.co', '0', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(270, 'MACIAS ORDOÑEZ JUAN SEBASTIAN', NULL, '6333463', NULL, '2011-12-15', NULL, 'M', NULL, 'juansebma@hotmail.com', '3185958248', '0000-00-00', 36, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(271, 'BELTRAN OSCAR EDUARDO', '', '1112465887', b'0', '2020-07-28', 'TECN CONTROL AMBIENTAL', 'M', 'Cra 8 N° 17 - 76', 'oscarebeltran7@gmail.com', '3153463049', NULL, 33, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 2, 1, NULL, 2, 5, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 5, 10, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Oscar_eduardo_Beltran.1663611299_6328b1a3afc98.png', '2020', 2, NULL),
(272, 'IBARGUEN VIVIANA', NULL, '29182079', b'1', '2020-02-25', 'Tecnico en administración de empresas', 'F', 'CRA 54 C Nº 42-14', 'vivianaibarguen1980@gmail.com', '3155212030', '0000-00-00', 41, 3, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 2, 7, 27, 1, 3, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(273, 'GARCIA PENILLA CRISTHIAN ORLANDO', NULL, '1144052712', NULL, '2020-03-03', NULL, 'M', 'CALLE 31B # T25-57', 'cristhianorlandogarcia@gmail.com', '3104233190', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(274, 'MAFLA GOMEZ MARLON EDUARDO', NULL, '16843505', NULL, '2009-07-21', NULL, 'M', 'CALLE 13 #50-133', 'marlonmafla@yahoo.com', '3167267777', '0000-00-00', 40, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 18, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 1),
(275, 'CORTES ORTIZ NELLY DEL CARMEN', NULL, '31891761', b'1', '2020-07-29', '\"lic en ciencias de la educacion desarrollo intelectual y ed', 'F', 'calle 26 A # 10-40 CASA b 22 CONUTRY 3', 'nellydcco@hotmail.com', '3146203102', '0000-00-00', 59, 3, 'no ', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 10, 4, 17, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(276, 'MARY JASMIN', 'MORENO ZUÑIGA ', '29111329', b'1', '2020-07-07', 'TECNOLOGA FORMULACION PROYECTOS', 'F', 'CARRERA 18 SUR 10A-03 B/ MARBELLA', 'maryjas-26@hotmail.com', '3053166600', '1978-06-26', 44, 2, 'NO', b'1', 5, 'Cedula de Ciudadania', 1, 1, 28, 1, 3, 2, 4, 2, 'MADRE', '0', b'1', 'BUENA', b'0', '', NULL, 4, 7, '', 'DECRETO 02/47', '2020-07-07', '35-01-0262', '2020-06-17', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-17_at_3.27.17_PM.1660833119_62fe4d5fe35bf.jpeg', '2020', 22, 4),
(277, 'IBARRA MERA LUCY MIRELLA', NULL, '66957993', b'1', '2020-07-22', 'PSICOLOGA', 'F', 'Calle 43 Nº 69-35 bloque 4 Apto 203 Ciudad 20', 'santi.y.i@hotmail.com', '3115321873', '0000-00-00', 46, 2, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 6, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 1),
(278, 'MAFLA RODRIGUEZ PEDRO', NULL, '6332162', NULL, '2013-10-21', NULL, 'M', NULL, 'pedromafla56@hotmail.com', '3012629456', '0000-00-00', 65, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL),
(279, 'CRUZ ARANGO MIRYAM ANDREA', NULL, '1106899356', b'1', '2020-12-10', 'ABOGADA', 'F', 'cra 48 c # 47a 25', 'miandreacruzarango@gmail.com', '3105851174', '0000-00-00', 24, NULL, 'no ', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 8, 1, 6, 5, 27, 2, 'No tiene hijos', NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(280, 'MORERA POSSO JUAN CARLOS', NULL, '94550781', NULL, '2020-01-07', NULL, 'M', NULL, NULL, '3016948010', '0000-00-00', 36, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 24, 4, NULL, 3, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(281, 'MAFLA SALDAÑA CESAR AUGUSTO', NULL, '1112476312', NULL, '2020-02-17', NULL, 'M', 'CAREERA 13 #9-65', 'cesarmafla.saludjamundi@gmail.com', '3173790732', '0000-00-00', 29, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, NULL),
(282, 'MOSCOSO CARLOS ALBERTO', NULL, '16821340', NULL, '1990-12-29', NULL, 'M', NULL, 'carlosmoscoso5909@hotmail.com', '3163429409', '0000-00-00', 62, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990', NULL, NULL),
(283, 'CRUZ SAMBONI MARIA FERNANDA', NULL, '31537374', b'1', '2020-01-02', 'ADMKINISTRADORA PUBLICA', 'F', 'VEREDA VAREJONALCORREGIMIENDO GUACHINTE', ' jamundi\"', '0', '0000-00-00', 0, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 2, NULL, 3, 4, 6, 3, 14, 2, 'UNIÓN LIBRE', 'Madre', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(284, ' MARTHA CECILIA', 'IBARRA MOSQUERA', '66917286', b'1', '2015-06-01', 'bachiller tecnico', 'F', 'Carrera 75 N.1b-135 B/ PRADOS DEL SUR', 'darlinencarnacion0622@gmail.com', '3135814813', '1974-08-01', 48, 2, 'NO', b'1', 11, 'Cedula de Ciudadania', 2, 7, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', b'1', 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.24.44_AM.1661783869_630ccf3dcfadd.jpeg', '2015', 1, 4),
(285, 'MOSCOSO COLLAZOS CARLOS ANDRES', NULL, '16843994', NULL, '2011-12-15', NULL, 'M', NULL, NULL, '3184682849', '0000-00-00', 39, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(286, 'MAFLA VASQUEZ ROBERTH', NULL, '1112469307', NULL, '2020-07-24', 'bachiller tecnico', 'M', NULL, 'roberthmaflav@gmail.com', '3165351394', '0000-00-00', 32, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(287, 'CUADROS QUINTANA MARTHA ITALIA', '', '31524141', b'1', '1998-01-02', 'TECNICO ADMINISTRATIVO', 'F', 'carrera 1 norte 21a - 03', 'marthaicuadrosq@hotmail.com', '3014728547', NULL, 56, 2, 'NO', b'1', 3, 'Cedula de Ciudadania', 1, 8, 12, 1, 3, 2, 2, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 2, 2, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Martha_Italia_Cuadros.1662995565_631f4c6deb798.jpeg', '1998', 2, 2),
(288, 'MOSQUERA FIGUEROA LUZ YANIT', NULL, '25287565', b'1', '2020-02-25', 'TEC LABORAL EN ASIST DE ALTA GERENCIA', 'F', 'CALLE 17 N 12 -05', 'LUZYANIT@HOTMAIL.ES', '3104688104', '0000-00-00', 40, 1, 'NINGUNA', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 25, 1, 3, 2, 4, 1, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(289, 'MOSQUERA QUINTO FRANCISCO JESUS', NULL, '11705201', NULL, '2004-02-27', 'Bachiller Academico', 'M', NULL, 'franciscomosquera1953@gmail.com', '3206928364', '0000-00-00', 68, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004', NULL, NULL),
(290, 'MARIN CAMACHO OSCAR MAURICIO', NULL, '1112472724', NULL, '2020-01-02', NULL, 'M', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 31, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(291, 'IBARRA PALACIOS RODRIGO ANDRES', '', '1088972397', b'0', '2020-10-28', 'ABOGADO', 'M', '', 'raipp1989@gmail.com', '3175539500', NULL, 32, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 12, 1, NULL, 5, 26, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Rodrigo_Andres_Ibarra.1662996681_631f50c96a645.jpg', '2020', NULL, 3),
(292, 'MOSQUERA TROCHEZ LUZ DARY', NULL, '34604506', b'1', '2013-01-02', 'ADMINISTRADORA EMPRESAS - ABOGADA', 'F', 'Calle 3ANº 92-31 melendez', 'darymto@yahoo.es', '3122188267', '0000-00-00', 46, 2, 'NO', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 2, 1, NULL, 1, 10, 5, NULL, 1, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', 1, 1),
(293, 'CUARTAS COMETA HECTOR ARBEY', NULL, '16839313', NULL, '2011-12-15', NULL, 'M', NULL, NULL, '3206257590', '0000-00-00', 43, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(294, 'TRUJILLO ARROYAVE SEBASTIAN', NULL, '1107079070', NULL, '2020-03-11', NULL, 'M', NULL, 'SEBAS_437@hotmail.com', '3185566567', '0000-00-00', 28, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(295, 'MUÑOZ LUZ ELENA', NULL, '31538256', NULL, '2017-11-01', NULL, 'F', NULL, 'nenamun03@hotmail.com', '3182007272', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(296, 'CUATINDIOY PAPAMIJA ALEXANDER', NULL, '16840317', NULL, '2020-12-02', 'Bachiller Academico', 'M', NULL, '\"alexcupai328@gmail.com', '0', '0000-00-00', 0, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(297, 'MULATO LEDESMA SILVIO ADOLFO', NULL, '16827328', NULL, '2011-02-28', NULL, 'M', NULL, NULL, '0', '0000-00-00', 57, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(298, 'MAMIAN  CLAUDIA PATRICIA', NULL, '1061711687', b'1', '2020-10-05', 'DOCENCIA', 'F', 'Villas de Altagracia Apt 401 Torre B', 'patico2333@hotmail.com', '3217074451', '0000-00-00', 33, 2, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 3, 9, 1, 10, 2, 9, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(299, 'IDARRAGA SANCHEZ JEYVER', NULL, '1112482938', NULL, '2017-11-01', NULL, 'M', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(300, 'MUÑOZ ALFONSO ROSALBA', NULL, '39724847', NULL, '2020-03-17', 'Bachiller Academico', 'F', NULL, 'roisamual@hotmail.com', '3128596423', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(301, 'MARIN ARIAS CLAUDIA PATRICIA', '', '30336523', b'1', '2020-02-26', 'ADMINISTRADORA DE NEGOCIOS', 'F', 'CRA 19 # 8-109 TORRE 1 APTO 502', 'cpasuntosetnicos@gmail.com', '3146851004', NULL, 45, 2, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 3, 3, 1, 10, 5, 26, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Claudia_Marín.1663617364_6328c954df01f.jpg', '2020', 2, 2),
(302, 'CUELLAR RODRIGUEZ MAYRA ELEONORA', '', '38668911', b'1', '2020-04-27', 'TECNICA EN SEGURIDAD OCUPACIONAL', 'F', 'CRA 5SUR No. 6-56', 'mayra.1114@hotmail.com', '3175085607', NULL, 38, 2, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 7, 6, 1, 3, 2, 5, 1, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 5, 10, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/MAYRA_ELEONORA_CUELLAR_RODRIGUEZ.1663622688_6328de2015a8b.jpg', '2020', 2, 1),
(303, 'MUÑOZ ARTEAGA MILTON EDUARDO', NULL, '16943182', NULL, '2016-03-31', NULL, 'M', 'calle 24a - # 15 - 03', 'edmundoqwer@hotmail.es', '3057494670', '0000-00-00', 40, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, NULL),
(304, 'MARIN DE JESUS KATHERINE', NULL, '1143828151', b'1', '2020-07-28', 'ABOGADA -TECNOLOGA ADMINISTRACION', 'F', 'Km 6 Via Pance Casa 2', 'katherin-md@hotmail.com', '3164915461', '0000-00-00', 32, 1, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 6, 2, 9, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(305, 'INSIGNARES NIETO RAMON ALBERTO', NULL, '72132034', NULL, '2020-02-26', NULL, 'M', 'CALLE 50 #  94-32', 'ramoninsignares@hotmail.com', '3046032181', '0000-00-00', 55, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(306, 'MUÑOZ GUZMAN LUZ ADRIANA', NULL, '66906759', b'1', '2020-02-24', 'TECNICO ASISTENCIA ADMINISTRATIVA', 'F', 'Cra 1cn # 5-45 Portal Jordan', 'nana662010@hotmail.com', '3152662529', '0000-00-00', 47, 1, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 8, 1, 3, 2, 9, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(307, 'MARIN GARZON ALVARO', NULL, '16604361', NULL, '2015-06-23', NULL, 'M', NULL, 'almamonitor@hotmail.com', '3135905832', '0000-00-00', 67, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(308, 'CUERO BORRERO MYRIAN AMPARO', NULL, '29562930', b'1', '2002-11-25', 'tecnologia en educacion preescolar', 'F', 'Calle 9A N. 3-51', 'miriancuero32@gmail.com', '3226133600', '0000-00-00', 68, 3, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 2, 7, 9, 1, 3, 2, 4, 1, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', 2, 5),
(309, 'MUÑOZ RAMIREZ MARTHA LORENA', '', '31449630', b'1', '2020-02-19', '\"TRABAJADORA SOCIAL especilización en cultura de paz y derec', 'F', 'cra 24 no. 8a 31 barrio arbolad ', 'lorenamramirez@hotmail.com', '3175788622', NULL, 39, 1, 'no', b'1', 2, 'Cedula de Ciudadania', 1, 7, 12, 1, 10, 4, 17, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 26, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Martha_Lorena_Muñoz.1662995286_631f4b561229d.jpeg', '0', 2, 1),
(310, 'CUESTA QUINTERO DAVID JESUS', NULL, '15914992', NULL, '2013-10-16', NULL, 'M', 'CALLE 8 #5B-34', 'davidcuesta62@yahoo.es', '3155124042', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', 2, NULL),
(311, 'IPIA CHAVES MARIA CRISTINA', NULL, '34606520', NULL, '2020-03-12', NULL, 'F', 'Carrera 4 No 10B - 107', 'macri7711@hotmail.com', '3122599116', '0000-00-00', 44, 2, 'NINGUNA', b'1', 6, '\"CEDULA DE CIUDADANIA\"', 1, 3, 5, 1, NULL, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(312, 'MUÑOZ VELEZ ANDRES FELIPE', '', '1112486706', b'0', '2020-03-11', '', 'M', 'CRA 4SUR No 9A-21', 'afmunoz48@gmail.com', '3176767712', NULL, 26, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 6, 1, NULL, 5, 26, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/ANDRES_FELIPE_MUÑOZ_VELEZ.1663622873_6328ded9cae53.jpg', '2020', 2, NULL),
(313, 'MARIN HERMOSA RONALD JHOVANNY', NULL, '1062331566', NULL, '2020-07-01', NULL, 'M', 'CALLE 12 No.4A-157', 'ronaldphw@gmail.com', '3175302665', '0000-00-00', 23, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 21, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, NULL),
(314, 'MURILLO GARCIA JOHANNA ALEXANDRA', NULL, '52779475', b'1', '2021-07-21', 'arquitecta', 'F', 'Km 21 vìa Jamundì hacienda el castillo conjun', 'arquitectajohannamurillo@gmail.com', '3057122434', '0000-00-00', 38, 3, 'NO', b'1', 9, '\"CEDULA DE CIUDADANIA\"', 1, 1, 14, 5, 6, 4, 17, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 4),
(315, 'CURIEL ZARZA LUIS MANUEL', NULL, '1118839102', b'1', '2020-02-26', 'INGENIERO INDUSTRIAL', 'M', 'Calle 10 n. 9-04 apto 203', 'luismanuel.curiel@hotmail.com', '3003078079', '0000-00-00', 30, 0, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 2, 7, 15, 1, 6, 5, 23, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(316, 'IZQUIERDO ROMERO CLARA ALICIA', '', '31889627', b'1', '2020-07-07', 'TL SISTEMAS DE INF', 'F', '\"cra 18 a sur  No. 2-36 riveras del rosario', 'cizquier1@yahoo.com', '0', NULL, 0, 0, 'NO', b'1', 2, 'Cedula de Ciudadania', 2, NULL, 12, 1, 6, 2, 3, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Clara_Izquierdo.1662996225_631f4f0157bba.png', '2020', 2, NULL),
(317, 'OCHOA TAMAYO LORENA', NULL, '38665846', NULL, '2017-11-01', NULL, 'F', NULL, 'loreochoa83@hotmail.com', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 9, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(318, 'MARIN OROZCO SARA', NULL, '1006231783', b'1', '2020-08-10', 'AUXILIAR CONTABLE', 'F', 'Calle 20 I Nª 35 Sur 76 El Rodeo', 'saramao18@gmail.com', '3104003061', '0000-00-00', 36, 1, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 5, 3, 2, 4, 1, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(319, 'NAVIA BONILLA LUIS ALFONSO', NULL, '16826293', NULL, '2011-12-24', NULL, 'M', NULL, 'betyar32@gmail.com', '3188281565', '0000-00-00', 60, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(320, 'JARAMILLO ABELLA LINO', NULL, '16610450', NULL, '2020-10-10', NULL, 'M', NULL, 'linjaramillo@hotmail.com', '3145511435', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 5, NULL, 4, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1),
(321, 'CALAMBAS MORCILLO LIBARDO ANTONIO', NULL, '6331349', NULL, '2011-12-23', NULL, 'M', NULL, NULL, '3135835547', '0000-00-00', 71, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(322, 'NOGUERA LEIDY DAYAN', NULL, '1061688612', b'1', '2020-09-22', 'TECNICA EN ARCHIVISTICA', 'F', 'CRA 8 # 17-76 Ciudad Sur', 'leidynoguera46@gmail.com', '3104046734', '0000-00-00', 36, 1, 'no', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 3, 8, 1, 3, 5, 23, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(323, 'DELGADO DIOGENES ALIRIO', NULL, '12985171', NULL, '2005-03-03', NULL, 'M', 'CARRERA 8A #8-95', 'aliriodeljamundi@yahoo.com', '3136413476', '0000-00-00', 56, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005', 2, NULL),
(324, 'MARMOLEJO PEREZ HARVEY', NULL, '6331653', NULL, '1998-01-02', NULL, 'M', 'Calle 8 #14-65', 'harvey140252@gmail.com', '3177827995', '0000-00-00', 70, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', 2, NULL),
(325, 'NOREÑA PATIÑO NIDIA', NULL, '31959657', b'1', '2014-10-05', 'Bachiller academico', 'F', 'Calle 16 N.6-21 ciudad sur', 'nidia2229@gmail.com', '3218533005', '0000-00-00', 55, 1, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 7, 14, 6, 2, 6, NULL, 1, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014', 2, 5),
(326, 'DELGADO ROJAS SAMUEL', NULL, '16795953', NULL, '2015-06-05', NULL, 'M', NULL, 'wilson.delgado@hotmail.com', '3175788507', '0000-00-00', 50, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(327, 'MARTINEZ ALBAN CARLOS ANDRES', NULL, '16837881', NULL, '2020-02-17', NULL, 'M', 'Cra 17 # 3-70 los naranjos', 'carlos.martinez.alban@gmail.com', '3183703589', '0000-00-00', 43, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, NULL),
(328, 'OBANDO MARTINEZ YEXICA KARIME', NULL, '1112470281', b'1', '2016-06-20', 'ADMINISTRADORA DE EMPRESAS/ESPECIALIZACIÓN GERENCIA SOCIAL', 'F', 'CALLE 3C  No.21-96', 'mime_816@hotmail.com', '3164925571', '0000-00-00', 31, 2, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 50, 5, 10, 4, 17, 1, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016', 2, 4),
(329, 'MARTINEZ BUITRAGO PABLO', NULL, '1094902382', NULL, '2020-07-09', 'Bachiller Academico', 'M', NULL, 'pmartinezb25@gmail.com', '3168910979', '0000-00-00', 33, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(330, 'JARAMILLO CABRERA MARCO ANTONIO', NULL, '98215695', NULL, '2020-02-27', 'tecnico', 'M', NULL, 'markojaramillo@yahoo.es', '3217204360', '0000-00-00', 39, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(331, 'DIAZ DIAZ ELSA', NULL, '34550410', b'1', '2020-02-26', 'Bachiller Academico', 'F', 'Carrera 2 N.10-03', 'saeldiaz67@gmail.com', '3226310179', '0000-00-00', 55, 2, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 2, 3, 9, 1, 2, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(332, 'OCAMPO BRAND KATERINE', NULL, '1112958232', NULL, '2020-09-11', 'COMUNICADOR SOCIAL', 'F', 'CALLE 12 SUR #10-81', 'kathebrand.90@gmail.com', '3177012205', '0000-00-00', 32, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 16, 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(333, 'MARTINEZ MEJIA JORGE IVAN', NULL, '94551332', NULL, '2020-07-08', 'ADM DE EMPRESAS NO GRADUADO - TEC EN DESARROLLO DE MERCADOS ', 'M', NULL, 'jorge_ivan4@hotmail.com', '3183896225', '0000-00-00', 36, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(334, 'URREA OSPINA VIVIANA', NULL, '31448242', b'1', '2021-02-16', 'CONTADORA PUBLICA', 'F', 'CALLE 9 N 4-18', 'viur30@gmail.com', '3167404383', '0000-00-00', 39, 0, 'NINGUNA', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 13, 4, 6, 3, 18, 2, 'No tiene hijos', 'N/A', NULL, 'BUENA', NULL, NULL, NULL, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 3),
(335, 'DIAZ HAROLD', NULL, '6331994', NULL, '2011-12-15', NULL, 'M', NULL, 'veronicadiazviera@gmail.com', '3136660195', '0000-00-00', 68, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(336, 'OCORO DE MARULANDA CARMENZA', NULL, '31520889', b'1', '2013-02-07', 'TECNICO REJENCIA DE FARMACIA', 'F', 'CARRERA 16 #19-52', 'caro592@hotmail.com', '3006530838', '0000-00-00', 63, 2, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 18, 5, 3, 2, 9, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', 2, 1),
(337, 'DIAZ OCAMPO FRANCI ELIANA', NULL, '29110793', NULL, '2012-01-07', NULL, 'F', NULL, 'elianadiaz0@gmail.com', '3182936238', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(338, 'MARULANDA GONZALEZ JAIME', NULL, '6331685', NULL, '2013-01-04', NULL, 'M', NULL, 'caro592@hotmail.com', '3006087195', '0000-00-00', 68, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL),
(339, 'OIDOR VIDAL ANNER', NULL, '16824202', NULL, '2015-06-11', NULL, 'M', NULL, 'sgtogrey@hotmail.com', '3208895138', '0000-00-00', 58, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(340, 'ECHAVARRIA GUTIERREZ MARIA YOLIMA', NULL, '31522210', NULL, '2015-12-31', NULL, 'F', NULL, 'penrril8112@hotmail.com', '0', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(341, 'OLAYA ALEXANDER', NULL, '80438499', NULL, '2013-01-30', NULL, 'M', NULL, 'alexolaya19711@hotmail.com', '3182197857', '0000-00-00', 51, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL),
(342, 'JATIVA LEGARDA ANJY JOHANA', NULL, '1085330392', b'1', '2020-07-22', 'bachiller tecnico', 'F', 'CONJUNTO RESIDENCIAL LA ARBOLEDA TORRE 3 APTO', 'anjyjativa@gmail.com', '3218664451', '0000-00-00', 24, 0, 'NINGUNA', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 1, 9, 1, 3, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(343, 'MEJIA GUTIERREZ JORGE IVAN', NULL, '14590876', NULL, '2018-06-20', NULL, 'M', NULL, 'ivanmejia24@hotmail.com', '3188169322', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 26, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(344, 'OLAYA ALVAREZ AMANDA', NULL, '31521841', NULL, '1980-07-12', 'BACHILLER', 'F', NULL, 'inspolicia_olaya@hotmail.com', '3104335269', '0000-00-00', 63, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 5, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980', NULL, NULL),
(345, 'ECHEVERRI CESAR FABIO', NULL, '16770997', NULL, '2011-12-15', NULL, 'M', NULL, 'echeverry1969@hotmail.com', '3184589726', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(346, 'OLAYA REYES NANCY', NULL, '31529567', b'1', '1994-08-12', 'AUXILIAR TECNICO CONTABLE', 'F', 'CARRERA 4 #19A-27 PANAMERICANO', 'onesimovillamil@hotmail.com', '3172498728', '0000-00-00', 50, 1, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 8, 7, 1, 3, 2, 10, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 38, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1994', 2, 1),
(347, 'JIMENEZ FIGUEROA ALONSO', NULL, '6334039', NULL, '2016-03-31', NULL, 'M', 'Carrera 96 # 8-53', 'alonso.jimenez.jamundi@gmail.com', '3205556736', '0000-00-00', 36, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 5, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, NULL),
(348, 'MARULANDA JARAMILLO OSCAR WILLIAM', NULL, '6461811', NULL, '1993-01-02', NULL, 'M', NULL, 'oscarma61@gmail.com', '3163689359', '0000-00-00', 60, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993', NULL, NULL),
(349, 'BALANTA ARBOLEDA MARCELLY', NULL, '31527077', b'1', '2015-12-04', 'contadora pública', 'F', 'cra 7 No. 10 - 12 ', 'marcellybalanta@gmail.com', '3153060844', '0000-00-00', 55, 1, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 13, 5, 10, 4, 17, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 2, 3),
(350, 'MAYOR FERNANDEZ DAMARIS', NULL, '31531065', b'1', '1998-01-02', 'Administradora de empresas', 'F', 'carrera 15 sur # 2 - 28', 'damafe136@hotmail.com', '3166925346', '0000-00-00', 50, 3, 'no ', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 29, 1, 10, 2, 9, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', 2, 4),
(351, 'ECHEVERRY PINEDA ROSAURA', NULL, '31520700', b'1', '1997-08-07', 'Primaria', 'F', 'Calle 10A- BARRIO POPULAR', NULL, '3206597581', '0000-00-00', 69, 3, 'Problemas con el lado izquierdo', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 14, 6, 1, 6, NULL, 1, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', 2, 5),
(352, 'JIMENEZ MAZO MARIO', NULL, '94020002', NULL, '2011-12-23', NULL, 'M', NULL, NULL, '3117203033', '0000-00-00', 62, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(353, 'ORDOÑEZ SANCHEZ RICARDO ANDRES', NULL, '1112485607', NULL, '2015-06-01', NULL, 'M', NULL, 'ricardoandres16@hotmail.com', '3022877464', '0000-00-00', 26, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(354, 'MEDINA SILVA SAÚL', NULL, '14637800', b'1', '2021-06-01', 'Ingeniero Agricola', 'M', 'Calle 9E # 54B SUR -47', 'saulmedinasilva@gmail.com', '3002457305', '0000-00-00', 38, 0, 'no', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 1, 7, NULL, 4, 6, 3, 14, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 1),
(355, 'ZARZA CANABAL INES DEL ROSARIO', NULL, '64577361', NULL, '2013-07-24', 't.p. en contabilidad', 'F', 'MANZANA H CASA 15 SIGLO XXI', 'izca710@hotmail.com', '3003259396', '0000-00-00', 45, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 9, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', 2, NULL),
(356, 'BENITEZ OSPINA ADRIANA MARIA', NULL, '31322638', b'1', '2004-03-11', 'administradora de empresas', 'F', 'Carrera 4 sur n.8-22', 'admaos322@hotmail.com', '3165342296', '0000-00-00', 38, 1, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 1, 9, 1, 6, 2, 9, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004', 2, 4),
(357, 'JIMENEZ MEJIA MARIA VIRGINIA', NULL, '31532642', NULL, '1993-05-25', NULL, 'M', 'Carrera 13 # 14-29', 'mariavjimenez@hotmail.com', '3146797138', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 15, 1, NULL, 2, 9, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, NULL),
(358, 'ORREGO JIMENEZ SANDRA MILENA', NULL, '31533921', NULL, '1998-04-16', NULL, 'F', NULL, 'sandraoj1574@hotmail.com', '3205669436', '0000-00-00', 47, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 4, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', NULL, NULL),
(359, 'ESCOBAR BERNAL RUSMAN ALBERTO', NULL, '16838305', NULL, '2008-05-02', NULL, 'M', 'calle 14bn # 14-39', 'rusalbes@gmail.com', '3013350797', '0000-00-00', 43, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 5, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008', 2, NULL),
(360, 'PALACIO RESTREPO LUIS CARLOS', NULL, '16823538', NULL, '2017-01-03', NULL, 'M', NULL, NULL, '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(361, 'ESCOBAR GONZALES FREDDY', NULL, '18004539', NULL, '2011-12-23', NULL, 'M', NULL, 'fregoescobar@gmail.com', '3122699048', '0000-00-00', 45, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(362, 'ORTEGA URBANO YUDI VIVIANA', NULL, '1144071835', b'1', '2020-03-13', 'ADMINISTRACION SALUD OCUPACIONAL', 'F', 'CARRERA 12 BIS #13-31Simon Bolivar', 'vivi.secretariadesaludjamundi@gmail.com', '3114663246', '0000-00-00', 27, 0, 'NO', b'1', 5, '\"CEDULA DE CIUDADANIA\"', 1, 1, 28, 1, 6, 2, 5, 2, 'No tiene hijos', NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(363, 'JOAQUI IBACHY EDUARD ALBERTO', '', '4627329', b'0', '2020-07-31', '', 'M', '', 'ealbertoj0612@gmail.com', '3148282852', NULL, 61, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 12, 1, NULL, NULL, 16, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 16, 21, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/foto_Comisario_-_EDGAR_FERNANDO_QUIROZ_MORAN.1661875387_630e34bbbad44.jpeg', '2020', NULL, NULL),
(364, 'ESCOBAR GONZALEZ APOLINAR', '', '2575468', b'0', '1992-10-26', '', 'M', 'Carrera 4 sur n.o. 10 bis 22', 'poloescobar11@gmail.com', '3116235867', NULL, 60, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 27, 1, NULL, 2, 4, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 4, 7, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/foto_polo_-_Secretaría_de_Planeacion.1661875202_630e340227a49.png', '1992', 2, NULL),
(365, 'ORTIZ CORTES JUAN SEBASTIAN', '', '1130641984', b'0', '2020-07-22', 'MUSICO', 'M', 'Km 1.5 vía Jamundí - Potrerito', 'sebastian511@gmail.com', '3183385419', NULL, 23, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 5, 1, NULL, 5, 26, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Juan_Sebastián_Ortiz_Cortés.1663618696_6328ce882d1c0.jpeg', '2020', 2, NULL),
(366, 'ORTIZ JHON JAIRO', NULL, '16822400', NULL, '2009-02-02', NULL, 'M', NULL, 'fcmjjortiz@hotmail.com', '3104367217', '0000-00-00', 61, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009', NULL, NULL),
(367, 'ESCOBAR LIZANO JULIO ALFREDO', NULL, '1112466982', NULL, '2020-01-02', NULL, 'M', NULL, 'julio.escobar@jamundi.gov.co', '3104329066', '0000-00-00', 32, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(368, 'LADINO CORTES FREDY ANTONIO', NULL, '16832487', NULL, '2016-04-11', NULL, 'M', 'Calle14 # 5-53', 'ladinofreddyantonio@gmail.com', '3165079395', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 5, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017', 2, NULL),
(369, 'MARIO FERNANDO', 'OSPINA GOMEZ ', '16778608', b'0', '2013-07-02', 'Administración de empresas', 'M', 'calle 12 a 1-64 B/ Colseguros', 'ospmaf@gmail.com', '3167223336', '1970-05-16', 52, NULL, 'no', b'1', 4, 'Cedula de Ciudadania', 1, 3, 12, 1, 3, 5, 24, 2, 'NO', '0', b'1', 'BUENA', b'0', '', NULL, 24, 35, '', '', NULL, '', NULL, 'Presencial', '', '', '2013', 1, 3),
(370, 'OTERO GIRALDO ANA MARIA', '', '67040269', b'1', '2020-04-07', 'INGENIERA SANITARIA', 'F', 'Calle 13 A Nº 85 A  - 61 El Ingenio', 'anamarogi@yahoo.es', '3155677541', NULL, 36, 0, 'No', b'1', 4, 'Cedula de Ciudadania', 1, 3, 31, 1, 10, 4, 17, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 22, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Foto_Carné_-_Ana_Maria_Otero.1662567298_6318c382e6cee.JPG', '2020', 1, 4),
(371, 'PALACIOS EDGAR HUMBERTO', NULL, '79792530', NULL, '2020-07-22', 'INGENIERO AGRICOLA', 'M', 'Carrera 17 # 19-47', 'jhumbertp2010.jamundi@gmail.com', '3113331161', '0000-00-00', 44, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(372, 'PALACIOS ORJUELA WILLIAM', NULL, '16831746', NULL, '2011-12-15', NULL, 'M', NULL, 'betyar32@gmail.com', '3226279624', '0000-00-00', 49, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(373, 'PALACIOS PALACIOS LUZ MERY', NULL, '1112468297', b'1', '2020-03-17', 'Tecnico en Sistemas', 'F', 'cra 24 B NºA Sur - 71 La Alborada', 'luzme89@hotmail.com', '3012467691', '0000-00-00', 32, 0, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 2, 7, 9, 1, 3, 2, 4, 2, 'No tiene hijos', 'N/A', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(374, 'PALTA VELASCO IVONNE ADRIANA', '', '1130592519', b'1', '2020-03-16', '\"ADMINISTRADOR DE NEGOCIOS-TEC ANALISIS ORGANIZACIONAL eSPEC', 'F', 'calle 24 No. 14 14 ', 'iapalta0511@gmail.com', '3208410866', NULL, 34, NULL, 'no ', b'1', 2, 'Cedula de Ciudadania', 1, 3, 12, 1, 10, 5, 26, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Ivonne_Adriana_Palta_Velasco.1662997267_631f5313b7843.jpg', '2020', 2, 4),
(375, 'PARRA DURAN JORGE YONATAN', NULL, '16941419', NULL, '2020-09-01', 'CONDUCTOR', 'M', NULL, NULL, '3045896071', '0000-00-00', 40, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 7, 1, NULL, 2, 7, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(376, 'PASTRANA MOSQUERA CARLOS ALBERTO', NULL, '16832016', NULL, '2011-06-24', NULL, 'M', NULL, 'pastranacarlosalberto13@gmail.com', '3148772939', '0000-00-00', 52, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(377, 'PENA RODALLEGA ALFREDIX', NULL, '16825650', NULL, '2002-11-25', 'Bachiller Academico', 'M', NULL, 'alfredix2019@gmail.com', '3148942302', '0000-00-00', 55, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', NULL, NULL),
(378, 'ADOLFO LEON', 'PEÑA ARBOLEDA ', '2575396', b'0', '1992-08-12', '', 'M', 'carrera 5as 9-63 B/ La arboleda', 'arboledaadolfoleon@gmail.com', '3206558644', '1955-07-30', 67, NULL, 'no', b'1', NULL, 'Cedula de Ciudadania', 1, 5, 12, 1, 2, 2, 4, 2, 'PADRE', '0', b'1', 'BUENA', b'0', '', NULL, 4, 8, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-17_at_4.50.20_PM.1660832490_62fe4aea6601f.jpeg', '1992', 22, 3),
(379, 'PEÑA REYES ANGIE LORENA', NULL, '1144139774', b'1', '2020-04-07', 'tècnologo en logistica industrial', 'F', 'Calle 10 C No 5 sur 03', 'alp.neger@gmail.com', '3044757031', '0000-00-00', 31, 1, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 3, 24, 1, 3, 5, 23, 1, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(380, 'PEÑUELA RIVERA ROBERT', '', '6334410', b'0', '2020-03-02', 'bachiller tecnico', 'M', '', 'dany62795@gmail.com', '3004460741', NULL, 37, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 9, 1, NULL, 2, 6, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 6, 11, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Screenshot_2022-08-23-20-35-18-543_com.miui.gallery_-_Robert_Peñuela.1661874098_630e2fb2f14fd.jpg', '2020', NULL, NULL),
(381, 'PERAFAN ZUÑIGA JAMES', NULL, '76221434', NULL, '2020-02-27', 'Bachiller Academico', 'M', NULL, 'jamesps1973@gmail.com', '3114098554', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(382, 'CHARRIA  CESAR HERNEY', NULL, '16824115', NULL, '2013-07-05', 'Bachiller', 'M', NULL, 'puebloderoblescesar@hotmail.com', '3206961006', '0000-00-00', 57, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL),
(383, 'PRADO RODRIGUEZ BETTY JOHANA', NULL, '1112477876', NULL, '2017-01-03', NULL, 'F', NULL, 'minijohana.2030@hotmail.com', '3215055438', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL);
INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`) VALUES
(384, 'PERDIGON VILLEGAS JACKELINE', NULL, '31538498', b'1', '2011-12-23', 'tecnologa en control ambiental', 'F', 'Carrera 12 N. 482 piso 2', 'jackelinperdigon@gmail.com', '3153571298', '0000-00-00', 44, 2, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 8, 14, 6, 3, 6, NULL, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, 3),
(385, 'BECERRA BERMUDEZ JESUS ALBEIRO', NULL, '16649529', NULL, '1998-04-06', 'Bachiller Academico', 'M', NULL, 'nancyparra123@hotmail.com', '3127122624', '0000-00-00', 62, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', NULL, NULL),
(386, ' ANDREA', 'PEREZ ECHEVERRY', '29122815', b'1', '2020-02-14', 'ABOGADA', 'F', 'CALLE 2 N 19-250 CASA 61', 'andrea_perez1179@hotmail.com', '3175031133', '1979-11-09', 42, 1, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 5, 11, 1, 10, 4, 17, 2, 'MADRE', '0', b'1', 'BUENA', b'0', '', NULL, 17, 22, '', '30-16-0084', '2020-02-14', '35-01-0058', '2020-02-11', 'Alternancia', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_3.13.19_PM.1661876608_630e398073596.jpeg', '2020', 22, 1),
(387, 'CANTERO FIGUEROA CESAR TULIO', NULL, '10756284', NULL, '2012-05-02', NULL, 'M', 'Cra 8 # 8-28', 'cesarcant@gmail.com', '3104531488', '0000-00-00', 38, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', 2, NULL),
(388, 'PERLAZA MONTAÑO IRMA', '', '66749810', b'1', '2020-08-19', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CALLE 120 No24-06', 'irmaperlaza@gmail.com', '3138624366', NULL, 47, 2, 'NO', b'1', 4, 'Cedula de Ciudadania', 2, 7, 6, 1, 6, 5, 26, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Irma_Perlaza.1663622785_6328de81294fe.jpeg', '2020', 1, 1),
(389, 'PUENTES MORANTE LUIS BRYAN', NULL, '1143846719', NULL, '2020-03-04', NULL, 'M', 'CARRERA 46 A # 14C - 71', 'bryanmovilidadcali@gmail.com', '3165166141', '0000-00-00', 29, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(390, ' CARMEN INES', 'QUEVEDO AGREDO', '66813320', b'1', '1991-06-14', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CRA 7 10-200 Conjunto Country Plaza II', 'cainque@hotmail.com', '3154522742', '1970-03-07', 52, 2, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 3, 11, 1, 6, 5, 27, 2, 'MADRE', '0', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/foto_carmen_ines.1660772634_62fd611a26a08.JPG', '1991', 22, 1),
(391, 'CASTAÑO SOLARTE ROBERT ANDRES', NULL, '1112464630', NULL, '2015-06-04', NULL, 'M', NULL, 'andrescsolarte@gmail.com', '3204836801', '0000-00-00', 34, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(392, 'QUIJANO CORREA KAREN DANIELA', NULL, '1112488109', b'1', '2016-04-20', 'TECNICO EN AGENTE DE TRANSITO Y CRIMINALISTICA', 'F', 'CARRERA 15 N 24 A12', 'quijanokaren81@gmail.com', '3187640449', '0000-00-00', 25, 1, 'NO', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 5, 29, 5, 3, 5, 19, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, 3),
(393, 'QUIJANO VALENCIA ANA CAROLINA', NULL, '31324580', b'1', '2020-08-19', 'FINANZAS Y NEGOCIOS INTERNACIONALES', 'F', 'Calle 48 Bis Nº 83 C- 63 Caney Apt 407', 'anacarolina.quijano@gmail.com', '3152620439', '0000-00-00', 38, 0, 'NO', b'0', 11, '\"CEDULA DE CIUDADANIA\"', 2, 7, 8, 4, 10, 3, 14, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(394, 'QUIJANO VALLECILLA RICAURTE', NULL, '16778467', NULL, '2020-07-01', 'ingeniería agrónoma', 'M', 'CRA 27  T 29-17 PISO 3 CALI', 'riquiva70@hotmail.com', '3163253889', '0000-00-00', 51, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(395, 'QUILINDO SANCHEZ WILLIAM', NULL, '94430649', NULL, '2020-02-26', 'administracion de empresas', 'M', NULL, 'wilquisan0508@gmail.com', '3146118461', '0000-00-00', 46, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(396, 'QUINAYAS TRUJILLO LUIS ROSEMBERG', NULL, '4948908', NULL, '2011-12-23', NULL, 'M', NULL, 'quinayasluis4@gmail.com', '3117726382', '0000-00-00', 58, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(397, 'QUINTERO LOPEZ MARLENE', '', '31890139', b'0', '1983-04-11', '', 'F', '', 'marquinlo@hotmail.com', '3017766920', NULL, 61, NULL, '', b'1', 4, 'Cedula de Ciudadania', NULL, NULL, 11, 1, NULL, 5, 27, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/marlene_quintero.1662563381_6318b4352eb52.jpg', '1983', 2, NULL),
(398, ' JULIAN ALFONSO', 'QUINTERO MEJIA', '1112463962', b'1', '2020-04-06', 'Profesional en finanzas y negocios internacionales', 'M', 'Calle 47 # 80 - 118', 'julianqm1987@gmail.com', '3186054191', '1987-04-21', 35, 0, 'no', b'1', 4, 'Cedula de Ciudadania', 1, 8, 11, 1, 6, 5, 26, 2, 'NO', '0', b'1', 'BUENA', b'0', '', NULL, 27, NULL, '', 'DEC. 0144', '2020-04-06', '3501270196', '2020-03-20', 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_10.27.57_AM.1660058936_62f27d38b4ca5.jpeg', '2020', 1, 3),
(399, 'RAMIREZ RESTREPO ANDRES FELIPE', NULL, '16841562', NULL, '2020-01-01', NULL, 'M', NULL, 'jamundiserespeta@gmail.com', '3104732467', '0000-00-00', 41, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 7, 2, NULL, 7, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, 1),
(400, 'GALLEGO CHAPARRAL KATERINE', NULL, '1061776239', b'1', '2020-07-09', '\"técnico en sistemas', '', 'F', 'JAMUNDI', '0', '0000-00-00', 0, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, NULL, 14, 1, 3, 2, 4, 2, 'SOLTERO', 'Madre', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(401, 'RENDON HERNANDEZ LAURA VALENTINA', NULL, '1143875227', b'1', '2020-07-07', 'bachicher', 'F', 'Via El rosario Callejon Vallejo Km 8 La buitr', 'rendonlaura904@gmail.com', '3206803368', '0000-00-00', 23, 1, 'no ', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 1, 3, NULL, 1, 2, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 4),
(402, 'GONZALEZ BENAVIDEZ ANDERSON', NULL, '94491921', NULL, '2020-02-25', NULL, 'M', 'carrera 84 # 5 - 141', 'andersongbsanti@gmail.com', '3178714855', '0000-00-00', 45, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(403, 'RESTREPO GONZALEZ DIEGO ANDRES', NULL, '16838442', NULL, '2013-08-08', NULL, 'M', NULL, 'diego-andres78@hotmail.com', '3123135395', '0000-00-00', 43, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL),
(404, 'RESTREPO NIÑO OLGA LUCIA', NULL, '65747556', b'1', '2004-05-14', 'ADMINISTRADOR EMPRESAS', 'F', 'Cra 8 H Nº 50-75 apt 401 B Conjunto El Prado ', 'olgalucia0107@gmail.com', '3174001132', '0000-00-00', 52, 2, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 2, 3, 9, 1, 6, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004', 1, 3),
(405, 'RIASCOS DIAZ DANIEL', NULL, '10552830', NULL, '2015-06-22', NULL, 'M', NULL, NULL, '3156263121', '0000-00-00', 67, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(406, ' DIANA PATRICIA', 'RINCON CARDONA', '1115066235', b'1', '2020-02-25', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CALLE 25 # 19-185 b/Pangola', 'dianarincon1771@gmail.com', '3163186348', '1987-05-15', 35, 0, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 7, 11, 1, 6, 4, 17, 2, 'NO', '0', b'0', 'BUENA', b'0', '', NULL, 17, 26, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/DIANA_RINCON.1662562993_6318b2b1a5308.jpeg', '2020', 22, 3),
(407, 'RINCON MONTERO JUAN CARLOS', NULL, '16828549', NULL, '1997-08-25', 'basica primaria', 'M', NULL, 'jcarlosrincon69@hotmail.com', '3178295286', '0000-00-00', 52, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL),
(408, 'ALEYDA', 'RINCON RESTREPO ', '31533190', b'1', '2011-12-30', 'TECNICO PREESCOLAR', 'F', 'CALLE 8 B N 1CS-16', 'valeria7428@hotmail.com', '3157955988', '1974-03-28', 48, 3, 'tiroides - rinitis cronica', b'1', 4, 'Cedula de Ciudadania', 1, 7, 11, 5, 3, 2, 10, 2, 'MADRE', '1', b'0', 'BUENA', b'0', '', NULL, 10, 15, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_3.35.37_PM.1660077396_62f2c55400f2b.jpeg', '2011', 22, 3),
(409, 'RIOS RAMIREZ KATERIN NATALIA', NULL, '1144064672', b'1', '2020-03-09', 'ABOGADA', 'F', 'CRA112 NO. 48-92 APTO 707  TORRE  3 K112 pino', 'katerios2207@gmail.com', '3195744190', '0000-00-00', 28, 0, 'no', b'1', 2, '\"CEDULA DE CIUDADANIA\"', 1, 7, 12, 1, 6, 5, 23, 2, 'No tiene hijos', 'no', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(410, 'RIOS VELASCO MARCO AURELIO', NULL, '16832934', NULL, '2020-07-10', NULL, 'M', 'Dir transversal 6 N. 11 - 83', 'marquillo062@hotmail.com', '3147962899', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 5, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(411, 'RIVERA MENDEZ LUIS ANTONIO', NULL, '2571460', NULL, '2015-10-30', NULL, 'M', NULL, 'proimageninstitucional@hotmail.com', '3207030923', '0000-00-00', 61, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(412, 'SANCHEZ LENIS VICTOR HUGO', NULL, '6332082', NULL, '1998-01-05', NULL, 'M', NULL, 'vhsl1808@hotmail.com', '0', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 5, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(413, 'RIVERA MINA EVER', NULL, '14675090', NULL, '1999-02-01', NULL, 'M', NULL, NULL, '3113951213', '0000-00-00', 65, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999', NULL, NULL),
(414, 'RIZO COLL HUMBERTO', NULL, '6331566', NULL, '1990-06-26', NULL, 'M', 'Cra 10 #9-48', 'humbertorizo7@gmail.com', '3168024346', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990', 2, NULL),
(415, 'SALDAÑA MONTOYA HENRY', NULL, '16822875', NULL, '1990-08-17', NULL, 'M', NULL, 'hesamojp38@yahoo.com', '3158142917', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990', NULL, NULL),
(416, 'RIVERA MOTATO MARGARITA MARIA', NULL, '43602714', b'1', '2021-05-20', 'Comunicadora social', 'F', 'Calle 30 N. 1B 100 10 Cinco Soles La América', 'margaritariveramotato@gmail.com', '3014113710', '0000-00-00', 45, 0, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 1, 10, 4, 10, 3, 14, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 3),
(417, 'SALDAÑA SALINAS GIOVANNY', NULL, '16836110', NULL, '2015-06-01', NULL, 'M', NULL, 'gisasa36@hotmail.com', '3044315754', '0000-00-00', 45, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(418, 'RIZO MORALES ANDRES FELIPE', NULL, '16836624', NULL, '2011-12-26', 'ingenieria industrial', 'M', 'calle 20 # 14-64', 'afelipe27@gmail.com', '3146697900', '0000-00-00', 46, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, NULL),
(419, 'SANCHEZ ROJAS PEDRO ANTONIO', NULL, '16641206', NULL, '2012-01-02', NULL, 'M', NULL, 'peansaro@gmail.com', '3103733389', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 2, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', NULL, NULL),
(420, 'RODALLEGA POPO DANIELA', NULL, '1112467081', b'1', '2011-12-27', 'Ingeniera topografica', 'F', 'Calle 14a n.5a-28', 'drodallega.infraestructura@gmail.com', '3105175855', '0000-00-00', 33, 1, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 2, 1, 14, 1, 10, 4, 17, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, 1),
(421, 'SALDAÑA VASQUEZ JHON JAIRO', '', '6334345', b'0', '2020-06-05', 'TEC ELECTRONICA Y REDES-TL EN SISTEMAS', 'M', '', 'jhonjasalva@hotmail.com', '3147117941', NULL, 36, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 12, 1, NULL, 2, 3, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 3, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/foto_jhon_jairo_-_jhon_jairo_saldaña_vasquez.1661874436_630e310471e95.jpg', '2020', NULL, NULL),
(422, 'OLMOS LUIS GUSTAVO', NULL, '19139872', NULL, '1995-05-15', NULL, 'M', NULL, 'tavo-olmos@hotmail.com', '3147178226', '0000-00-00', 71, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995', NULL, NULL),
(423, 'RODRIGUEZ RAMOS CESAR HERNANDO', NULL, '94540987', NULL, '2020-01-02', NULL, 'M', 'CONJUNTO LAGOS DE VERDE ALFAGUARA APTO 101C', 'cesarrodriguezramos@hotmail.com', '3183723936', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 10, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(424, 'SALINAS CAMPO CARLOS HUMBERTO', NULL, '1130626658', NULL, '2015-06-01', NULL, 'M', NULL, 'carloshsalinas@hotmail.com', '3207327898', '0000-00-00', 35, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(425, 'RODRIGUEZ CAMILO', NULL, '1112459357', b'1', '2021-03-15', 'terminando derecho', 'M', 'Carrera 5 # 16-34 ', 'kamilor86@gmail.com', '3225117441', '0000-00-00', 35, 0, 'NO', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 7, 29, 5, 6, 5, 21, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 21, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 3),
(426, 'SAMBONI MEDINA CARLOS  ARTURO', NULL, '75157727', NULL, '2020-02-27', 'Celador', 'M', NULL, 'carlos31s@yahoo.com', '3125271859', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(427, 'RODRIGUEZ CARDOZO LINA MARIA', NULL, '1144033924', b'1', '2020-01-02', 'Economista', 'F', 'Calle 14 Nª 19-78 Barrio L Reserva', 'lina.rodriguez.cardozo@gmail.com', '3156704889', '0000-00-00', 31, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 1, 31, 4, 10, 3, 6, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(428, 'SAMBONI ORDOÑEZ AIDA NEYI', NULL, '48648766', b'1', '2020-12-01', 'Auxiliar Contable', 'F', 'Calle 9 # 13-13', 'neyisamboni@gmail.com', '3226586924', '0000-00-00', 39, 1, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 15, 1, 3, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(429, 'RODRIGUEZ GUERRERO ALVARO ENRIQUE', NULL, '16844120', NULL, '2020-02-26', 'lic en filosofia', 'M', 'cra 24 8 a sur 31 alborada', 'alvaroenriquerodriguez@hotmail.com', '3178404047', '0000-00-00', 39, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(430, 'RODRIGUEZ LOBOA JAIRO ALBERTO', NULL, '16829508', NULL, '2015-06-24', NULL, 'M', NULL, 'jairoalbertorodriguez@outlook.com', '3152916185', '0000-00-00', 52, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(431, 'SANCHEZ CASTRO ANA MILENA', '', '31537192', b'1', '2011-12-23', 'técnico en seguridad y salud en el trabajo', 'F', 'Calle 12a sur n.10-57', 'kiara_14997@hotmail.com', '3226790569', NULL, 45, 3, 'no', b'1', 3, 'Cedula de Ciudadania', 1, 7, 14, 6, 3, 6, NULL, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 34, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_2.37.48_PM.1661802613_630d1875a748f.jpeg', '2011', 2, 3),
(432, 'RODRIGUEZ LULIGO CESAR AUGUSTO', '', '16829234', b'0', '1998-01-02', '', 'M', '', 'cesaruls@hotmail.com', '3016681906', NULL, 51, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, NULL, 1, NULL, 5, 26, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Cesar_Augusto_Rodriguez_Luligo.1663612345_6328b5b93acf1.jpg', '1998', NULL, NULL),
(433, 'SANCHEZ MUÑOZ YURY', NULL, '1144075395', b'1', '2019-06-17', 'MEDICO GENERAL', 'F', 'Calle 12 Sur Nº10 -81 Torre B APt 701 Quintas', 'yuyi07-11@hotmail.com', '3104238586', '0000-00-00', 27, 1, 'NO', b'1', 5, '\"CEDULA DE CIUDADANIA\"', 1, 7, 28, 5, 10, 4, 17, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019', 2, 3),
(434, 'SANCHEZ RIASCOS DIANA CAROLINA', '', '34316792', b'0', '2020-07-02', 'TEC GESTION EMPRESARIAL', 'F', '', 'diana_sanchez26@misena.edu.co', '3226940813', NULL, 40, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 12, 1, NULL, 5, 24, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 24, 35, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Diana_Carolina_Sanchez.1662996327_631f4f6797da4.jpeg', '2020', NULL, NULL),
(435, 'RODRIGUEZ MAMPOTES RODRIGO', NULL, '16833864', NULL, '2013-01-15', NULL, 'M', NULL, 'higorodriguez51@hotmail.com', '3168002581', '0000-00-00', 49, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL),
(436, 'RODRIGUEZ RUIZ EDWIN', NULL, '16497660', NULL, '2012-12-12', 'TL COMERCIO EXTERIOR', 'M', NULL, 'edwrodriguez8@hotmail.com', '3214132672', '0000-00-00', 52, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', NULL, NULL),
(437, 'SANDOVAL TORO ANDRES FELIPE', NULL, '1143826423', NULL, '2020-01-02', NULL, 'M', 'CALLE 12 SUR #10-81  403 C', 'andres.sandoval@jamundi.gov.co', '3162938595', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(438, 'RODRIGUEZ SALDAÑA CRISTIAN CAMILO', '', '1143837492', b'0', '2020-05-18', '', 'M', '', '', '0', NULL, 30, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 31, 1, NULL, 5, 26, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-26_at_3.30.38_PM_-_CRISTIAN_CAMILO_RODRIGUEZ_SALDANA.1662567796_6318c57486030.jpeg', '2020', NULL, NULL),
(439, 'SANCHEZ TABA MARIA IRLESA', NULL, '66854884', b'1', '2020-07-09', 'TECNICA EDUCACION PREESCOLAR', 'F', 'Calle 9A # 17-54  Apto 202 El Dorado', 'misanchezsalud@gmail.com  sanchezirlesa1@gmail.com', '3167214545', '0000-00-00', 49, 1, 'NO', b'1', 5, '\"CEDULA DE CIUDADANIA\"', 1, 7, 28, 1, 3, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(440, 'TABORDA MARIN JOHN STHIVEN', NULL, '1143863914', NULL, '2020-02-24', 'TEC ASISTENCIA ADM', 'M', NULL, 'johnsthiven@gmail.com', '3207329062', '0000-00-00', 26, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 2, 9, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(441, ' EDWIN BERNARDO', 'SANCHEZ URREA', '16837364', b'1', '2005-03-03', 'BACHILLER ACADEMICO', 'M', 'CARRERA 7 10-200 b/ COUNTRY PLAZA II', 'edwinsanchez719@hotmail.com', '3207406035', '1977-11-12', 44, NULL, 'NO', b'1', NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', b'1', 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/foto_Edwin_Bernardo_Sanchez_Urrea.1661780985_630cc3f9ba92c.jpg', '2005', 22, 1),
(442, 'RODRIGUEZ VALDEZ JOSE ANUAR', NULL, '16450339', NULL, '2015-06-10', NULL, 'M', NULL, NULL, '3203034795', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(443, 'SANCHEZ URREA SANDRA VIVIANA', NULL, '31535957', b'1', '1998-01-02', 'CONTADORA', 'F', 'cra7 10-200 casa C-20', 'savisa_76@hotmail.com', '3184184220', '0000-00-00', 45, 2, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 13, 1, 10, 4, 17, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', 2, 1),
(444, 'RODRIGUEZ VELASCO ARABELLA', NULL, '66812277', NULL, '2020-01-02', NULL, 'F', NULL, 'arabellarodriguezvelasco@yahoo.com', '3104932150', '0000-00-00', 51, NULL, NULL, b'1', 4, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 30, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(445, 'SIERRA ORDOÑEZ YOLANDA', NULL, '66822636', NULL, '2020-01-02', NULL, 'F', NULL, 'yolysi9@hotmail.com', '3215422886', '0000-00-00', 122, NULL, NULL, b'0', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 4, NULL, 3, 18, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(446, 'ROMAN PULGARIN FRANCISCO JAVIER', NULL, '79853001', b'1', '2021-05-21', 'Tècnico en educaciòn fisica', 'M', 'Calle 7 N.8-30', 'nicoramirezb7@gmail.com', '3507538110', '0000-00-00', 44, 2, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 7, 4, 3, 2, 7, 2, 'Padre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 4),
(447, 'SANDOVAL  PATRICIA', NULL, '31526568', b'1', '1990-04-20', 'Secretaria', 'F', 'Calle 10 Nº 18-59 Sachamate', 'sebasysaray@hotmail.com', '3104634076', '0000-00-00', 57, 3, 'no', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 3, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990', 2, 2),
(448, 'ROJAS MOSQUERA INGRID JULIET', '', '29111484', b'1', '2020-03-05', 'INGENIERA TOPOGRAFICA', 'F', 'Call 16 C Nº 7-20 piso 2 Ciudad Sur', 'ingrid.jrojas@gmail.com', '3014542301', NULL, 43, 0, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 7, 31, 1, 10, 5, 26, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/ROJAS_INGRID_-_Ingrid_Juliet_Rojas_Mosquera.1661801378_630d13a206a41.jpg', '2020', 2, 3),
(449, 'SANDOVAL GOMEZ MELISSA', '', '1112476627', b'1', '2020-02-12', 'ABOGADA-TEC ADM JUDICIAL', 'F', 'cra 6ta No. 23 68 alferez real ', 'melissavictimasjamundi@gmail.com', '3185216900', NULL, 29, 1, 'no', b'1', 2, 'Cedula de Ciudadania', 2, 8, 12, 1, 6, 3, 14, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 14, 19, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Melissa_Sandoval.1662997129_631f52891f7b6.jpg', '2020', 2, 1),
(450, 'MAFLA ZULUAGA ROBERT', NULL, '16827791', NULL, '2020-07-15', 'Bachiller', 'M', NULL, 'laura.mafla@correounivalle.edu.co', '3167865971', '0000-00-00', 53, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(451, 'SANDOVAL MANZANO UBERNEY', NULL, '79526007', NULL, '2020-02-19', 'tecnologia en control ambiental', 'M', NULL, 'uberneysandovalmanzano@gmail.com', '3127299944', '0000-00-00', 52, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(452, 'ROMERO MONTOYA JOSE DANILO', NULL, '4077605', NULL, '2011-03-28', NULL, 'M', NULL, 'sosdaromo@gmail.com', '3107036281', '0000-00-00', 60, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(453, 'SANDOVAL RIVERA CARMEN LILIANA', NULL, '31532822', NULL, '2011-12-30', NULL, 'F', NULL, NULL, '3105140494', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(454, 'ROSERO MONTUFAR EDMUNDO JAVIER', NULL, '87944135', NULL, '2020-11-17', 'ingenieria de sistemas y computacion', 'M', NULL, 'javierroseromontufar@hotmail.com', '3226404552', '0000-00-00', 39, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(455, 'SANTOS RUIZ DAVID ANDRES', NULL, '80827239', b'1', '2021-05-20', 'politologo', 'M', 'Calle 12ª N. 5-55 apto 301 Bl4 Los Naranjos 5', 'davidandresantos@gmail.com', '3144541135', '0000-00-00', 37, 1, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 50, 4, 10, 3, 6, 2, 'Padre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 4),
(456, 'SARDI DURAN PEDRO NEL', NULL, '16829455', NULL, '2011-12-15', NULL, 'M', NULL, 'Pedronelsardi21@gmail.com', '3164639255', '0000-00-00', 51, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(457, 'SARRIA GARCIA YEFERSON', NULL, '1107101639', NULL, '2019-12-31', NULL, 'M', 'CALLE12 SUR No. 10-81', 'yeferson_sarria@hotmail.com', '3152138855', '0000-00-00', 25, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 6, 5, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019', 2, NULL),
(458, 'SIERRA MANCILLA SONIA ANDREA', NULL, '52421996', b'1', '2020-06-11', 'abogada', 'F', 'CRA 38A # 9A OESTE 39', 'sierrandrea55@hotmail.com', '3108560531', '0000-00-00', 43, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 11, 4, 10, 3, 14, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(459, 'SIERRA VIERA JUAN CARLOS', '', '16824787', b'0', '1998-01-05', '', 'M', 'Calle 15 No 6 - 77', 'jcbandola@hotmail.com', '3175136116', NULL, 58, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 5, 1, NULL, 5, 26, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-26_at_12.15.02_PM.1661786214_630cd8662922a.jpeg', '1998', 2, NULL),
(460, 'SILVA MUÑOZ NANCY OLIVA', NULL, '67001911', b'1', '2021-09-15', 'Estudiante Derecho', 'F', 'Cra 16 #14-11 Barrio la pradera', 'nancyk1523@hotmail.com', '3146662894', '0000-00-00', 46, 1, 'no', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, 1, 29, 5, 2, 5, 23, 2, 'Padre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 4),
(461, 'SOLARTE JUAN CARLOS', NULL, '76044019', NULL, '2018-06-20', NULL, 'M', NULL, 'juancarlossolarte.jamundi@gmail.com', '3154176514', '0000-00-00', 51, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018', NULL, NULL),
(462, 'MARIN PALOMINO ANA LUCIDIA', NULL, '31931459', b'1', '2011-09-26', 'BACHILLER ACADEMICO', 'F', 'corrigimiento la Buitrera Km 7', 'analuc_10@hotmail.com', '3185482240', '0000-00-00', 58, 1, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 1, 9, 1, 2, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 1, 1),
(463, 'ESCOBAR SANDOVAL DANILO', NULL, '6330999', NULL, '1973-10-01', 'Bachiller Academico', 'M', NULL, 'dahele54@yahoo.es', '3156899602', '0000-00-00', 75, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1973', NULL, NULL),
(464, 'ESCOBAR VASQUEZ ORLANDO', NULL, '16651888', NULL, '2020-07-01', NULL, 'M', NULL, 'orlandoescobar.v@gmail.com', '3103475415', '0000-00-00', 61, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(465, 'ENRICO', 'ESPINOSA ORTEGA ', '16721246', b'1', '2017-02-02', 'ELECTRICIDAD INDRUSTRIAL', 'M', 'calle 1a sur 15-25 B/ Riberas del Rosario', 'enrico.espinosa.o@gmail.com', '3128092045', '1966-01-20', 56, NULL, 'Hipertension', b'1', NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 6, 6, NULL, 2, 'PADRE', '0', b'0', 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_8.28.24_AM.1661779777_630cbf4115968.jpeg', '2017', 22, 4),
(466, 'QUINTERO SALAZAR JULIO CESAR', NULL, '1112471625', NULL, '2011-12-15', NULL, 'M', NULL, 'julioc_2590@hotmail.com', '3165372483', '0000-00-00', 31, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(467, 'QUIÑONEZ HURTADO LUIS FERNANDO', NULL, '16656074', NULL, '2011-09-26', 'tecnologia agroindustrial', 'M', NULL, 'lfquinones0@hotmail.com', '3184927171', '0000-00-00', 61, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 5, 24, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 24, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(468, 'QUIROZ MORAN EDGAR FERNANDO', '', '98357663', b'0', '2020-02-26', 'ABOGADO', 'M', '', 'fernandoquirozm@gmail.com', '3154204598', NULL, 40, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 12, 1, NULL, 4, 17, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 26, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Edgar_Fernando_Quiroz.1662996557_631f504dc0f65.jpeg', '2020', NULL, NULL),
(469, 'DIANA CRISTINA', 'RADA GIRALDO ', '31532628', b'1', '1998-01-02', 'ABOGADA', 'F', 'VEREDA RIO CLARO CORREGIMIENTO POTRERITO', 'dianaradagiraldo@hotmail.com', '3153021120', '1973-12-25', 48, 1, 'NINGUNA', b'1', 4, 'Cedula de Ciudadania', 1, 1, 29, 1, 10, 2, 9, 2, 'MADRE', '1', b'0', 'BUENA', b'0', '', NULL, 9, 14, '', '387', '2022-06-17', '1690', '2022-06-17', 'Alternancia', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-17_at_4.03.04_PM.1660770432_62fd58807d6b5.jpeg', '1998', 22, 3),
(470, 'TUNJO SALAZAR HERLINTON ROBINSON', '', '16710132', b'0', '2020-07-08', 'PSICOLOGO', 'M', 'CRA 24 B   No. 8A-SUR-27', 'HRTUNJOSALAZAR@GMAIL.COM', '3173423129', NULL, 57, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 6, 1, NULL, 5, 26, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Herlinton_Robinson_Tunjo_salazar.1663622399_6328dcffae824.jpg', '2020', 2, NULL),
(471, 'URBANO HERRERA JOSE HELMER', NULL, '16824458', NULL, '2015-06-01', NULL, 'M', NULL, 'joselim1963@hotmail.com', '3207838359', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(472, 'ZAMORA  JHON JAIRO', NULL, '16842322', NULL, '2015-09-01', 'Bachiller Academico', 'M', NULL, 'jhonjairozamora851@gmail.com', '3233370114', '0000-00-00', 43, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(473, 'URRESTE ROMERO LORENA', NULL, '29360980', b'1', '2020-02-19', 'ADMINISTRADOR EMPRESAS', 'F', 'CARRERA 31 #15-33 Cristobal Colon', 'lorenaur1982@gmail.com', '3008884550', '0000-00-00', 39, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, NULL, 1, 10, 4, 17, 2, 'No tiene hijos', 'N/A', NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(474, 'URRESTY VIAFARA KELLY DADIANA', NULL, '1112467502', b'1', '2020-07-07', 'TÉCNICO EN ASISTENCIA Y ORGANIZACIÓN DE ARCHIVOS', 'F', 'CALLE 9A 4-30 BARRIO POPULAR', 'K.URRESTY@GMAIL.COM', '3173231085', '0000-00-00', 32, 0, 'NINGUNA', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 27, 1, 3, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(475, ' PAOLA ANDREA', 'USMA VALENCIA', '29568060', b'1', '2011-12-23', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CARRERA 9A 16B-36 B/ CENTENARIO', 'paolusma@hotmail.com', '3184121324', '1979-08-09', 43, 2, 'NINGUNA', b'1', 4, 'Cedula de Ciudadania', 1, 7, 14, 6, 6, 6, NULL, 2, 'MADRE', '1', b'1', 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.56.22_AM.1661785122_630cd42279ae6.jpeg', '2011', 22, 3),
(476, 'VACCA MATAMOROS JULIAN FELIPE', NULL, '81717531', NULL, '2020-07-07', 'COMERCIO INTERNACIONAL-TEC GESTION DE COMERCIO EXTERIOR- TEC', 'M', NULL, 'julian10919@hotmail.com', '3125198384', '0000-00-00', 36, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(477, 'VALDES  SAYURI', NULL, '38601466', b'1', '2020-09-11', 'TECNICO CONTADURIA', 'F', 'Corregimiento Quinamayo Via Guaino', 'sayurivaldes2@hotmail.com', '3134224650', '0000-00-00', 39, 2, 'Enfermedad Catastrofica.', b'0', 7, '\"CEDULA DE CIUDADANIA\"', 1, 1, 4, 1, 3, 2, 1, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 1, 1, NULL, 'A-1234578', '2022-06-20', '123', '2022-06-20', 'Presencial', NULL, NULL, '2020', 2, 3),
(478, 'VALENCIA CASTAÑO LUIS ARTURO', '', '9915162', b'0', '2020-03-13', 'TEC EN FINANZAS-', 'M', '', 'internetviterbo@gmail.com', '3146864634', NULL, 38, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 12, 1, NULL, 5, 26, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Arturo_Valencia.1662995156_631f4ad451cc1.jpg', '2020', NULL, NULL),
(479, 'VALENCIA FAJARDO ALBA NELLY', NULL, '31536009', NULL, '2013-07-05', 'lic en matematicas', 'M', NULL, 'albanellyv@yahoo.com', '3113639142', '0000-00-00', 45, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL),
(480, 'VALENCIA GONZALEZ JOAQUIN ANTONIO', NULL, '6332323', NULL, '2005-03-03', NULL, 'M', NULL, 'floritasol1959@hotmail.com', '3155155927', '0000-00-00', 66, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005', NULL, NULL),
(481, 'VALENCIA JARAMILLO WILBER', NULL, '16493969', NULL, '2020-03-03', 'CONTADOR PUBLICO', 'M', 'km 3 via chipayá', 'wilbervalencia@gmail.com', '3104708386', '0000-00-00', 53, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(482, 'VARELA RUA PAULA ANDREA', NULL, '1112462916', b'1', '2021-06-01', 'Médico', 'F', 'Cra 22 N.3 sur 30 Casa 207 conjunto resindenc', 'paulavarela241@gmail.com', '3017444509', '0000-00-00', 34, 2, 'NO', b'1', 5, '\"CEDULA DE CIUDADANIA\"', 1, 7, 28, 4, 10, 3, 14, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, 1),
(483, 'VARGAS GIL ROSA MARIA', NULL, '31202195', b'1', '2011-01-21', 'bachiller academico', 'F', 'Calle 13 N.15-15', NULL, '3235091403', '0000-00-00', 57, 2, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 7, 14, 6, 2, 6, NULL, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, 1),
(484, 'VASQUEZ FLOREZ DARLYN', NULL, '31569096', b'1', '2020-03-02', 'PROFESIONAL EN CIENCIAS DE LA INFORMACION Y LA DOCUMENTACIÓN', 'F', 'Clle 3 # 92-116 Melendez casa 78 ', 'evedany31@yahoo.com', '3163930781', '0000-00-00', 42, 2, 'NO', b'1', 6, '\"CEDULA DE CIUDADANIA\"', 1, 7, 5, 1, 10, 5, 23, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 1),
(485, 'VASQUEZ HURTADO CESAR JAIRO', NULL, '1629349', NULL, '2019-12-31', 'TEC VETERINARIO', 'M', 'CRA1  No. 10c-55', 'cejavas829@gmail.com', '3044426409', '0000-00-00', 53, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 6, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019', 2, NULL),
(486, 'VASQUEZ OSORIO MARIA EUGENIA', NULL, '31987667', b'1', '2020-10-05', 'Bachiller comercial - empresarial', 'F', 'Calle 5 Nº 1BL-81 Barrio Jordan ', 'vasquezosoriomaria@gmail.com', '3175289466', '0000-00-00', 53, 2, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 2, 2, 9, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(487, 'VASQUEZ QUINAYAS VANESSA', '', '1144148298', b'1', '2019-12-31', 'INGENIERA AMBIENTAL - TECNOLOGA ECOLOGIA Y MANEJO AMBIENTAL', 'F', 'Cra 10 Km 1.5 via Potrerito ', 'vasquezquinayas@gmail.com', '3004304486', NULL, 30, 0, 'NO', b'1', 11, 'Cedula de Ciudadania', 1, 7, 2, 5, 6, 4, 17, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 23, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/DSC_1173._-_vanessa_quinayas.1661803888_630d1d70e2127.jpg', '2019', 2, 4),
(488, 'MERINO RUALES JOSE LUIS', NULL, '1126448761', NULL, '2020-10-01', 'CONTADOR PUBLICO', 'M', NULL, 'jose.merinocp@gmail.com', '3128205226', '0000-00-00', 33, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(489, 'VEGA MAFLA BISMARCK ERICK', NULL, '16824802', NULL, '1987-03-02', 'BACHILLER', 'M', NULL, 'ericvmafla@outlook.es', '3137244157', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 5, 24, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 37, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987', NULL, NULL),
(490, 'VEGA MAFLA VICTOR HUGO', NULL, '16822396', NULL, '2011-12-15', NULL, 'M', NULL, NULL, '3218405461', '0000-00-00', 60, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(491, 'VELANDIA VALCARCEL AURA MILENA', NULL, '1052392412', b'1', '2020-01-02', 'ABOGADA ESPECIALISTA EN  DERECHO ADMINISTRATIVO', 'F', 'carrera 12a # 3-81  Torre 6 Apto 504 Los nara', 'aura.milena.velandia@gmail.com', '3184043619', '0000-00-00', 31, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 3, 15, 4, 10, 3, 14, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(492, 'VEGA VELASQUEZ FERNANDO ANTONIO', NULL, '16724127', NULL, '2013-08-01', NULL, 'M', 'Cra 28A # 10A-45', 'feravev@gmail.com', '3007742695', '0000-00-00', 55, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 6, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', 1, NULL),
(493, 'SANDRA MILENA', 'VELASCO CARABALI ', '66924703', b'0', '2020-07-09', '', 'F', 'carrera 12 bis 26-81', 'sandravelascounad@gmail.com', '3182959873', '1974-12-31', 47, NULL, 'no', b'1', 4, 'Cedula de Ciudadania', 2, 7, 11, 1, 2, 2, 3, 1, 'MADRE', '1', b'0', 'BUENA', b'0', '', NULL, 3, 5, '', '30-16-0250', '2020-07-09', '35-01-0269', '2020-06-17', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_4.08.08_PM.1660079309_62f2cccdb86ce.jpeg', '2020', 32, 3),
(494, 'VELASCO CORDOBA LADY LORENA', NULL, '1061782199', b'1', '2020-06-17', 'Ingeniera forestal', 'F', 'Calle 10A Nª 1S-04 Portal Jamundi', 'leidy.velasco.95@gmail.com', '3012031059', '0000-00-00', 26, 0, 'NO', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 1, 7, 2, 1, 10, 5, 23, 2, 'No tiene hijos', 'N/A', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(495, 'VELASCO HURTADO YADERLY', NULL, '1143932728', b'1', '2020-07-14', 'TECNOLOGA ADMINISTRACCION EMPRESAS', 'F', 'CALLE 9A # 1 SUR -57 Villa Paulina', 'yader9015@hotmail.com', '3052204466', '0000-00-00', 31, 0, 'NO', b'1', 5, '\"CEDULA DE CIUDADANIA\"', 1, 7, 28, 1, 3, 2, 4, 2, 'No tiene hijos', 'N/A', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(496, 'VELASQUEZ LOPEZ LEYDI JHOANNA', NULL, '38562379', b'1', '2020-07-07', '\"PROFESIONAL EN CIENCIAS DE LA INFORMACION Y LA DE DOCUMENTA', '', 'F', 'JAMUNDÍ', '0', '0000-00-00', 0, 0, 'NO', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 1, NULL, 29, 1, 3, 2, 4, 2, 'UNIÓN LIBRE', 'Madre', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(497, 'VELEZ GIRALDO DIANA CAROLINA', NULL, '1112472120', b'1', '2020-07-09', 'TECNOLOGA EN CONTABILIDAD Y FINANZAS', 'F', 'VEREDA EL GUABAL', 'carolina.velezgiraldo17@gmail.com', '3115642231', '0000-00-00', 30, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 2, 7, 3, 1, 3, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(498, 'VELEZ GOMEZ VIVIANA ANDREA', NULL, '31322223', b'1', '2020-07-07', 'TEC GESTION EMPRESARIAL', 'F', 'CALLE 30 #24-43', 'vivivelez917@gmail.com', '3166004152', '0000-00-00', 37, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 2, 10, 1, 3, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3),
(499, 'VELEZ TORREZ YANETH', NULL, '66822828', b'1', '2017-08-14', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CARRERA 4 SUR #9A-21 El Socorro', 'yaneth0307@hotmail.es', '3167504728', '0000-00-00', 51, 2, 'Uso Gafas', b'1', 5, '\"CEDULA DE CIUDADANIA\"', 1, 5, 28, 1, 6, 2, 9, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, 1),
(500, 'VENEGAS PEREZ JAVIER ORLANDO', NULL, '80156705', NULL, '2020-05-05', 'Bachiller Academico', 'M', NULL, 'xavier.425@hotmail.com', '3133715895', '0000-00-00', 40, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(501, 'VERA MERCADO JENNIFER VIVIANA', NULL, '1130652642', b'1', '2020-02-26', 'tecnologa admon empresas ', 'F', 'VIA CIRCUNVALAR VIA LOCAL # 180', 'JEVIVI6@GMAIL.COM', '3137535468', '0000-00-00', 34, 1, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 27, 1, 3, 2, 10, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 38, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(502, 'VERA TOVAR SILVIO ALBERTO', NULL, '16820903', NULL, '1992-06-13', NULL, 'M', NULL, NULL, '3173785247', '0000-00-00', 64, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 1, NULL, 2, 7, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992', NULL, NULL),
(503, 'VIAFARA BERMUDEZ JOSE RUBEN', NULL, '16375118', NULL, '1992-07-13', NULL, 'M', NULL, 'rubenchovi@hotmail.com', '3147068380', '0000-00-00', 57, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, NULL, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992', NULL, NULL),
(504, 'SOLIS MARTINEZ JAVIER', NULL, '1112470743', NULL, '2020-07-07', NULL, 'M', 'calle 17a # 4 - 33', 'javier.solis.sttj@gmail.com', '3117974798', '0000-00-00', 31, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(505, 'SUAREZ ALVAREZ LUIS FERNANDO', '', '16620150', b'0', '2020-02-24', '', 'M', 'Cra 15a N° 22 - 67', 'luisfersuarez1958@gmail.com', '3187116405', NULL, 63, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 2, 1, NULL, 4, 17, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 17, 22, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Luis_Fernando_Suarez_Alvarez.1663609016_6328a8b8b976e.jpg', '2020', 2, NULL),
(506, 'VIAFARA ELVER', NULL, '14675084', NULL, '1997-12-31', NULL, 'M', NULL, NULL, '3147425724', '0000-00-00', 65, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL),
(507, 'SULEZ GOMEZ SEBASTIAN', NULL, '1112476080', NULL, '2020-01-02', NULL, 'M', 'cra 34 # 100a 150', 'sebastian.sg92@gmail.com', '3218507678', '0000-00-00', 29, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL),
(508, 'VINASCO MONTOYA JUVENAL', NULL, '6332309', NULL, '1988-08-18', 'TL ADM MUNICIPAL', 'M', NULL, 'juvenalvinasco27@hotmail.com', '3153030030', '0000-00-00', 122, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988', NULL, NULL);
INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`) VALUES
(509, 'VIAFARA VELA MARCOS ALBERTO', NULL, '6334866', NULL, '1997-06-24', 'Bachiller Academico', 'M', NULL, 'ferfasierra@hotmail.com', '3147434700', '0000-00-00', 62, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL),
(510, 'TABARES BOTERO RICARDO', NULL, '1115187633', NULL, '2020-10-26', 'INGENIERO DE SISTEMAS Y COMPUTACION', 'M', NULL, 'rtabares1990@gmail.com', '3207388284', '0000-00-00', 31, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, 3),
(511, 'VICTORIA RANGEL GERLIN KLEITON', NULL, '94383290', NULL, '2015-06-11', NULL, 'M', NULL, 'jamundivalle@hotmail.com', '3166160750', '0000-00-00', 48, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(512, 'VIDAL ALEGRIA MARIA EUGENIA', NULL, '34546983', b'1', '2020-02-25', 'ADMINISTRADOR DE EMPRESAS', 'F', 'CRA 1 N 10C 55 APTO 401B', 'magenavidal@gmail.com', '3127974738', '0000-00-00', 56, 1, 'NINGUNA', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 13, 1, 10, 4, 17, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(513, 'TABARES RIVERA HERNAN DE JESUS', NULL, '16735693', NULL, '2020-03-18', 'Bachiller Academico', 'M', NULL, 'hernantr2009@hotmail.com', '3155175054', '0000-00-00', 55, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(514, 'VIDAL MINA NEFIR AMPARO', NULL, '31533976', b'1', '2011-12-23', 'Bachillerato ', 'F', 'Cra 6 n. 15b.22', 'amparovidal2015@gmail.com', '3053926312', '0000-00-00', 48, 3, 'no', b'1', 11, '\"CEDULA DE CIUDADANIA\"', 2, 3, 14, 6, 2, 6, NULL, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, 1),
(515, 'TABERA VELEZ BENJAMIN', NULL, '16830510', NULL, '2017-11-08', NULL, 'M', 'calle 5 sur # 6a - 43', 'benjamin101971@hotmail.com', '3152098439', '0000-00-00', 50, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 5, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017', 2, NULL),
(516, 'VIDAL MOLINA VICTOR HUGO', NULL, '16837551', NULL, '2020-04-27', 'INGENIERIA INDUSTRIAL', 'M', 'CALLE 13 No 12-33', 'victorhugovi@yahoo.com', '3007830607', '0000-00-00', 44, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(517, 'MENDEZ HERRERA STELLA', NULL, '29122993', b'1', '2020-04-06', 'lic educacion basica Enfasis Ciencias Sociales', 'F', 'Cra 100 B Nª 1 Oeste - 21 Melendez', 'smendez126@gmail.com', '3184585429', '0000-00-00', 42, 2, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 6, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 4),
(518, 'VILLAMIL HIDALGO LUIS MARIO', '', '1107065201', b'0', '2021-01-05', 'ADMINISTRADOR DE EMPRESAS', 'M', 'CRA64 No.13-75', 'mariovillamil114@gmail.com', '3173770585', NULL, 31, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 6, 1, NULL, 5, 26, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Luis_Mario_Villamil_Hidalgo.1663622831_6328deaf28ce0.jpeg', '2021', 1, 3),
(519, 'VIVAS MANRIQUE SINTHIA', NULL, '67007492', b'1', '2018-10-01', 'Bachiller Academico', 'F', 'Cra 20 A Nº 8 Sur - 24 Condado del Sur', 'synthi12@hotmail.com', '3105697096', '0000-00-00', 44, 3, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 8, 9, 5, 2, 5, 24, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 24, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018', 2, 2),
(520, 'TELLO MOLANO MARIA CRISTINA', NULL, '34602704', b'1', '2020-02-19', 'ARQUITECTA', 'F', 'CRA 7 No 10-260 COUNTRY PLAZA O CASA 26', 'macristel2@gmail.com', '3128954449', '0000-00-00', 47, 1, 'NINGUNA', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 1, 27, 1, 6, 4, 17, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 1),
(521, 'VILLAQUIRAN MARTINEZ CARLOS FERNANDO', NULL, '16829507', NULL, '2011-12-15', NULL, 'M', NULL, NULL, '3163378696', '0000-00-00', 52, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(522, 'TELLO VIAFARA HARNE', NULL, '16825409', NULL, '2016-01-12', NULL, 'M', 'Carrera 6 No 23-74 B/ Alferez real', 'harnetello@hotmail.com', '3137898176', '0000-00-00', 56, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 5, 5, NULL, 5, 22, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 22, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016', 2, NULL),
(523, 'MORENO ZAMORA JAVIER', NULL, '16832152', NULL, '2008-04-01', NULL, 'M', NULL, 'eljavi62@gmail.com', '3187730202', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(524, 'VILLEGAS CASANOVA DIANA CAROLINA', NULL, '1130610115', NULL, '2020-01-02', NULL, 'F', NULL, 'carolina.villegas@jamundi.gov.co', '3167425888', '0000-00-00', 37, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(525, 'ARGUELLO COLLAZOS BEATRIZ ELENA', '', '31539750', b'1', '2018-07-04', 'Tecnico Laboral Educacion Preescolar', 'F', 'CARRERA 9 #8-15 PISO 3 Barrio Camacho', 'betyar32@gmail.com', '3147169574', NULL, 43, 3, 'NO', b'1', 8, 'Cedula de Ciudadania', 1, 1, 5, 5, 3, 2, 3, 2, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 3, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Beatriz_Elena_Arguello_Collazos.1663602494_63288f3e37bb9.jpg', '2018', 2, 4),
(526, 'VILLEGAS RESTREPO ERIC ALEXANDER', NULL, '1112461641', NULL, '2011-03-19', NULL, 'M', NULL, 'ericvillegas743@yahoo.com', '3117089727', '0000-00-00', 35, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(527, 'WAGNER ARIAS LUZ MARIA', NULL, '31520750', b'1', '1979-09-13', 'TECNOLOGIA SECRETARIADO EJECUTIVO', 'F', 'Cra 98 B Nº 48-52 Apt 321 Valle Lili', 'luzmawagner@hotmail.com', '3146201102', '0000-00-00', 61, 2, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 3, 9, 1, 3, 2, 9, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1979', 1, 1),
(528, 'TOBAR GONZALES VICTOR HUGO', NULL, '16824638', NULL, '2015-06-24', NULL, 'M', NULL, 'jairo10concejo@hotmail.com', '3136957680', '0000-00-00', 57, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(529, 'WAGNER GALLEGO WILFREDO DE JESUS', NULL, '6331602', NULL, '2011-11-30', NULL, 'M', NULL, 'wagnerwilfredo@gmail.com', '3126688064', '0000-00-00', 71, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(530, 'VINASCO MURIEL EDGAR MAURICIO', '', '16839318', b'0', '2019-12-31', '', 'M', 'KM 3 VIA CHIPAYA CASA 37A', 'vinasco657@gmail.com', '3174785591', NULL, 42, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Edgar_Mauricio_Vinasco.1663876142_632cbc2e2fec9.jpeg', '2019', 2, NULL),
(531, 'WAGNER GRISALES ENRIQUE', NULL, '16825799', NULL, '2015-06-10', NULL, 'M', NULL, NULL, '3158154931', '0000-00-00', 55, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(532, 'TORRES ARANZAZU DAVINSON', NULL, '16897207', NULL, '2015-09-06', NULL, 'M', NULL, NULL, '3177111174', '0000-00-00', 37, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(533, 'WAGNER GRISALES JORGE ELIECER', NULL, '16835227', NULL, '2011-12-15', NULL, 'M', NULL, 'jewg1995@hotmail.com', '3166303009', '0000-00-00', 46, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(534, 'TORRES DORADO CRISTHIAM CAMILO', NULL, '1130595239', b'1', '2011-12-15', 'tecnico en diseño grafico ', 'M', 'CALLE 12SUR#10E-57', 'CRISTHIANDORADO30@GMAIL.COM', '3147721827', '0000-00-00', 34, 3, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 14, 6, 3, 6, NULL, 2, 'Padre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 2, 4),
(535, 'YANDI HERMIDA ANGEL ARNOBIO', NULL, '16820491', NULL, '2011-02-25', NULL, 'M', NULL, NULL, '0', '0000-00-00', 64, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(536, 'TORRES LOPEZ CARLOS', NULL, '6768607', NULL, '2017-03-02', NULL, 'M', 'Calle 11b # 18 - 58', 'maticlanjar@yahoo.com', '3137176994', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 1, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017', 2, NULL),
(537, 'ZAMBRANO LEON TERESA MARLENY', NULL, '27374024', NULL, '2020-07-01', 'INGENIERA CIVIL', 'F', 'Calle 9#9-44 Juan de Ampudia', 'marlenyzam36@gmail.com', '3186960773', '0000-00-00', 49, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(538, 'TORRES MELO DAVID ESTEBAN', NULL, '1193265979', NULL, '2020-07-01', 'bachiller academico', 'M', NULL, 'davidestorres3197@gmail.com', '3127437892', '0000-00-00', 23, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(539, 'TORRES PEÑA CELENY', NULL, '26632020', b'1', '2013-01-14', 'admin empresas ', 'F', 'Cra 21 bis No 8 sur 04', 'cetope1311@yahoo.es', '3166901895', '0000-00-00', 45, 3, 'no', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 27, 1, 6, 5, 23, 1, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', 2, 1),
(540, 'ZUÑIGA HERNANDEZ YULI', NULL, '1112463949', NULL, '2017-11-01', NULL, 'F', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(541, 'MARIA YANETH', 'RUA GOMEZ ', '31523427', b'1', '2015-02-11', '', 'F', 'CALLE 9 18-45 B/ SACHAMATE', 'mariarua353@gmail.com', '3174102022', '1963-12-01', 58, NULL, 'CIRUGIA CRANEOENSEFALICA POR TUMOR MALIGNO EN HUESOS DE CARA Y CRANEO. RECOMENDACION. NO TOMAR SOL', b'1', NULL, 'Cedula de Ciudadania', 2, 3, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', b'1', 'BUENA', b'0', '', NULL, 33, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/foto_yaneth_rua.1661801170_630d12d2e2b3d.jpg', '2015', 22, 4),
(542, 'TORRES RAMIREZ LILIANA', NULL, '31526444', NULL, '1998-04-16', NULL, 'F', NULL, 'leidylorena1008@hotmail.com', '3183839751', '0000-00-00', 52, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 1, NULL, 5, 9, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', NULL, NULL),
(543, 'CAMPO MENDEZ WALTER RAMIRO', '', '76319056', b'0', '1998-01-02', '', 'M', '', 'walter.ramiro@hotmail.com', '3135076527', NULL, 49, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, NULL, 1, NULL, 5, 27, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Walter_Ramiro_Campo_Mendez.1663612553_6328b68977cb1.jpeg', '1998', NULL, NULL),
(544, 'ZAMORA JAMES HUMBERTO', NULL, '6336056', NULL, '1986-09-01', NULL, 'M', 'Cra 1 d sur # 5-26', NULL, '3226825816', '0000-00-00', 65, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986', 2, NULL),
(545, 'RUA GOMEZ REINALDO ALECSI', NULL, '16827799', NULL, '2015-06-01', NULL, 'M', NULL, 'delaruageneralservis@gmail.com', '3505174934', '0000-00-00', 53, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(546, 'TRIVIÑO QUINAYAS MILTON ANTONIO', NULL, '16847610', NULL, '2020-03-02', NULL, 'M', 'Carrera 8 Sur #4-35 Urb. Las Palmas', 'miltri14@gmail.com', '3168246521', '0000-00-00', 38, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(547, 'ZAMORA VALENCIA NORMA LIDIA', NULL, '34512092', NULL, '1987-10-26', NULL, 'F', 'trv 15 # 14-14', 'nolizava@gmail.com', '3155337334', '0000-00-00', 56, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987', 2, NULL),
(548, 'TENORIO ARIZALA JEYCSON', NULL, '16378068', NULL, '2020-05-01', 'tecnologia industrial', 'M', NULL, 'hernandezangela01@outlook.com', '3104125444', '0000-00-00', 37, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(549, 'ZAPATA DURAN HERMAN CAMILO', NULL, '1118305267', NULL, '2020-02-27', NULL, 'M', 'CALLE 25 #19-185 APTO 22 TORRE D', 'herman1458@gmail.com', '3127098423', '0000-00-00', 26, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(550, 'RUA MICOLTA DANIELA', NULL, '1112484707', b'1', '2020-07-07', 'Administradora de empresas', 'F', 'calle9 No. 9-11', 'daniirua8@gmail.com', '3014432179', '0000-00-00', 26, 0, 'NO', b'1', 4, '\"CEDULA DE CIUDADANIA\"', 1, 3, 50, 1, 6, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(551, 'TRUJILLO BOHOJORGE SARA IDALIA', NULL, '1061534977', b'1', '2020-08-19', 'ADMINISTRADOR EMPRESAS', 'F', 'Calle 15 C Nº 8-34 Ciudad Sur', 'sahara324@gmail.com', '3116028366', '0000-00-00', 31, 1, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 6, 2, 4, 1, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 4),
(552, 'ZAPATA ORJUELA MARIA ELDICARDIS', NULL, '29812731', b'1', '2002-11-25', 'Primaria', 'F', 'calle 11  6S Nº 4-35 Jorge eliecer Gaitan', NULL, '3127277439', '0000-00-00', 61, 3, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 5, 1, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', 2, 3),
(553, 'DAYANA MARISELL', 'RUALES IBARRA ', '59395795', b'1', '2020-04-06', 'CONTADORA PÚBLICA', 'F', 'CRA 1 B SUR # 6A 74 B/ RINCON DE ZARAGOZA', 'dayanamarisell@gmail.com', '3117067714', '1982-07-08', 40, 0, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 1, 11, 1, 6, 5, 26, 2, 'NO', '0', b'0', 'BUENA', b'0', '', NULL, 27, NULL, '', '30-16-0110', '2020-04-06', '35-01-27-019', '2020-02-11', 'Alternancia', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_11.02.16_AM.1660062641_62f28bb10c153.jpeg', '2020', 22, 4),
(554, 'TRUJILLO VARGAS CARLOS AUGUSTO', NULL, '17325936', NULL, '2020-08-28', 'CONTADOR PUBLICO', 'M', NULL, 'catruva_24@yahoo.es', '3113409909', '0000-00-00', 58, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, NULL),
(555, 'ZAPATA RAMIREZ GONZALO', NULL, '6403615', NULL, '2004-01-16', 'Bachiller Academico', 'M', NULL, 'gzapata041965@gmail.com', '3155816853', '0000-00-00', 56, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004', NULL, NULL),
(556, 'RUEDA ANGULO ELIZABETH', NULL, '43798535', b'1', '2020-02-24', 'Bachiller Academico', 'F', 'Cra 47 Sur Nº 20B- 17 Ciudadela Tarranova', 'eliru2009@hotmail.com', '3174774463', '0000-00-00', 55, 2, 'NO', b'1', 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 2, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 2, 3),
(557, 'TRUQUE ALBARRACIN JOSE VICENTE', NULL, '6334905', NULL, '1984-05-03', NULL, 'M', NULL, 'viholba20@hotmail.com', '3217985577', '0000-00-00', 59, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1984', NULL, NULL),
(558, 'RODRIGUEZ TORO HANS', NULL, '16829515', NULL, '2011-04-26', NULL, 'M', NULL, 'hanstertoro@hotmail.com', '3218372301', '0000-00-00', 51, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(559, 'RUIZ RENDON ROOSEVELT', NULL, '16855853', NULL, '2020-07-23', NULL, 'M', NULL, 'rorure5126@gmail.com', '3187690823', '0000-00-00', 62, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 5, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(560, 'ZEA JIMENEZ LORENA', NULL, '66877680', b'1', '2015-12-17', 'Bachiller Academico', 'F', 'calle 2 No. 7a 52 corregimiento el cabuyal', 'lorenji45@hotmail.com lorenji4521@gmail.com', '3117660836', '0000-00-00', 47, 1, 'no', b'1', 3, '\"CEDULA DE CIUDADANIA\"', 2, 1, 9, 1, 2, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', 2, 3),
(561, 'SAAVEDRA VILLEGAS MIRIAM DEL SOCORRO', NULL, '31523764', NULL, '1992-07-29', NULL, 'F', 'cra 1b sur # 5a 37', 'ms112640@gmail.com', '3153030030', '0000-00-00', 58, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992', 2, NULL),
(562, 'ZEA PANESSO LUZ XIMENA', '', '31537179', b'1', '2013-01-28', 'técnica de la primera infancia ', 'F', 'carrera 12 no. 6 - 52 la estación ', 'katerinzeita@hotmail.com', '3166236882', NULL, 46, 1, 'no', b'1', 2, 'Cedula de Ciudadania', 1, 7, 12, 5, 3, 2, 9, 1, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Luz_Ximena_Zea.1662996033_631f4e419f8d4.jpeg', '2013', 2, 1),
(563, 'VARGAS OSPINA ALEXANDRA', NULL, '1112476707', NULL, '2017-11-01', NULL, 'F', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(564, 'SALAZAR OSPINA NICOLAS ALEXANDER', NULL, '1125618855', NULL, '2015-06-01', NULL, 'M', NULL, 'nico_alex1988@hotmail.com', '3154625944', '0000-00-00', 33, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL),
(565, 'ZULUAGA DELGADILLO ANA MARIA', NULL, '34606155', NULL, '2020-12-01', 'tecnologia en gestion comercial y de negocios', 'F', NULL, 'anyzuluaga@hotmail.com', '0', '0000-00-00', 44, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(566, 'ZUÑIGA ORTEGA RICARDO ARBEY', NULL, '10692318', NULL, '2020-10-04', 'contaduria publica', 'M', NULL, 'ricardoarbey2016@hotmail.com', '0', '0000-00-00', 53, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL),
(567, 'SALAZAR RUIZ ALEXANDER', NULL, '1143938265', NULL, '2021-01-19', 'derecho', 'M', 'CRA 121 # 47 A 123', 'alexsalazarruiz@gmail.com', '3108366129', '0000-00-00', 31, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 2, NULL),
(568, 'SALDAÑA GONZALES JOSE ALEJANDRO', NULL, '6334169', NULL, '2011-12-15', NULL, 'M', NULL, 'jose-alejo85@hotmail.com', '3178371364', '0000-00-00', 36, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(569, 'ZUÑIGA SARRIA JULIO CESAR', NULL, '16825299', NULL, '2011-02-25', NULL, 'M', NULL, NULL, '3175307099', '0000-00-00', 56, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(570, 'SALDAÑA GONZALEZ ADRIANA', '', '31447134', b'0', '2020-02-26', '', 'F', '', 'asg1121@hotmail.com', '3152760112', NULL, 41, NULL, '', b'1', NULL, 'Cedula de Ciudadania', NULL, NULL, 13, 1, NULL, 2, 3, NULL, 'null', 'null', b'0', 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Adriana_Saldaña_Gonzalez.1663614824_6328bf6869bfe.png', '2020', 2, NULL),
(571, 'ZUÑIGA VIERA DIEGO', NULL, '16827245', NULL, '2018-10-27', NULL, 'M', NULL, NULL, '3188706444', '0000-00-00', 53, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018', NULL, NULL),
(572, 'FLOREZ OSPINA DIANA PATRICIA', NULL, '66976615', b'1', '2021-10-01', 'Administradora de empresas', 'F', 'Calle 32A #35-06 ', 'dianapaty24@gmail.com', '3152852788', '0000-00-00', 45, 1, 'NO', b'1', 5, '\"CEDULA DE CIUDADANIA\"', 1, 1, 28, 1, 6, 5, 23, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', 1, 1),
(573, 'SANCHEZ CAÑAS JOHANA MARIA', NULL, '38613240', NULL, '2012-01-24', NULL, 'F', NULL, NULL, '3117221790', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 9, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(574, 'SALDAÑA JORGE EDUARDO', NULL, '6338532', NULL, '2011-12-15', NULL, 'M', NULL, 'malsagon@hotmail.com', '3137946684', '0000-00-00', 56, NULL, NULL, b'1', NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL),
(576, 'Ramiro', 'Angarita', '1042445587', b'0', '2022-05-24', 'desarrollador', 'M', 'calle falsa 123', 'msr.ramiro@gmail.com', '3445678', '2022-05-24', 0, NULL, '', b'1', 7, 'Cedula de Ciudadania', 1, 3, 1, 1, 4, 1, 1, 1, 'MADRE', '1', b'0', 'BUENA', b'0', '', NULL, 1, 1, '', '', '2022-05-24', '', '2022-05-24', 'Presencial', '', NULL, '2022', 22, 1),
(577, 'ramiro', 'angarita', '1042465589', b'0', '2022-06-27', 'dev', 'M', 'callefalsa123', 'msr.ramiro@gmail.com', '3445678', '1993-04-30', 29, NULL, 'no', b'1', 7, 'Cedula de Ciudadania', 1, 1, 3, 1, 4, 5, 13, 2, 'PADRE', '1', b'0', 'BUENA', b'0', '', NULL, 13, 18, '', '145-A', '2022-06-27', 'AA2235-4', '2022-06-30', 'Presencial', '', NULL, '2022', 31, 4),
(579, 'PEDRO', 'NIEBLES', '104445678', b'0', '2022-06-27', 'DEVELOP', 'M', 'calle falsa123', 'pedro@gmail', '3445678', '1993-06-30', 28, NULL, 'NINGUNA', b'1', 6, 'Cedula de Ciudadania', 2, 2, 2, 1, 1, 2, 1, 2, 'PADRE', '0', b'0', 'BUENA', b'0', '', NULL, 1, 1, '', '01-A', '2022-06-27', 'AA454', '2022-06-27', 'Virtual', 'views/archivos/hojavida/_1656344716_62b9d08cba749-prueba.1656344716_62b9d08cba749.pdf', NULL, '2022', 22, 4),
(582, 'MARITZA', 'CORREA RODRIGUEZ', '38610553', b'1', '2022-09-01', 'Técnico en Administración de empresas', 'F', 'Cra 12A #3-81 MZ 3 Bl 5 apto 403 Los Naranjos', 'Maritza_correa@hotmail.es', '3122609069', '1983-01-07', 39, NULL, 'no', b'1', 3, 'Cedula de Ciudadania', 1, 7, 10, 5, 3, 2, 3, 2, 'MADRE', '0', b'0', 'BUENA', b'0', '', NULL, 3, 6, '', '35-16-059', '2022-09-01', '35-01-27-179', '2022-08-29', 'Presencial', 'views/archivos/hojavida/Doc_posesión_MARITZA_CORREA.1662041890_6310bf2212995.pdf', 'views/archivos/fotos/WhatsApp_Image_2022-09-01_at_8.57.56_AM.1662041890_6310bf2212d2b.jpeg', '2022', 22, 1),
(583, 'MARGARITA MARIA', 'RESTREPO POLO', '31445247', b'1', '2022-09-01', 'Técnico laboral por competencias administrativas', 'F', 'Cra 13 #1h-12 Villa Monica', 'mechas1929@hotmail.com', '3165058497', '1980-01-13', 42, NULL, 'NO', b'1', 4, 'Cedula de Ciudadania', 1, 7, 6, 5, 3, 2, 3, 2, 'NO', '0', b'0', 'BUENA', b'0', '', NULL, 3, 6, '', '35-16-060', '2022-09-01', '35-01-27-181', '2022-08-29', 'Virtual', '', '', '2022', 22, 3),
(585, 'VANESSA ANDREA', 'MINA CHARRY', '1112464685', b'1', '2022-09-02', 'Bachiller academico', 'F', 'Carrera 1B Norte #5-25', 'vanessamina149@gmail.com', '3207443429', '1987-09-30', 34, NULL, 'no', b'1', 8, 'Cedula de Ciudadania', 1, 7, 1, 5, 2, 2, 3, 2, 'MADRE', '1', b'0', 'BUENA', b'0', '', NULL, 3, 6, '', '35-16-061', '2022-09-02', '35-01-27-182', '2022-08-29', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-09-02_at_3.40.04_PM.1662153309_6312725d8c686.jpeg', '2022', 22, 3),
(587, 'JUAN CAMILO', 'CARDONA PEREZ', '1144036163', b'1', '2022-09-13', 'Economista y negociador internacional', 'M', 'Calle 15 #121-66 Cali, Valle', 'Juancamilo0615@gmail.com', '3116460537', '1990-06-15', 32, NULL, 'no', b'1', 3, 'Cedula de Ciudadania', 1, 8, 13, 4, 6, 3, 14, 2, 'PADRE', '0', b'0', 'BUENA', b'0', '', NULL, 14, 19, '', '30-16-236', '2022-09-13', '35-01-27-194', '2022-09-12', 'Presencial', 'views/archivos/hojavida/Nombramiento_Juan_camilo_Cardona_Perez.1663280231_6323a46756ce1.pdf', '', '2022', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id_grado` int(11) NOT NULL,
  `grado` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id_grado`, `grado`, `fecha_upd`, `id_codigo`) VALUES
(1, '01', '2021-11-06 03:57:00', 1),
(2, '01', '2021-11-06 03:57:01', 2),
(3, '09', '2021-11-06 03:57:01', 3),
(4, '08', '2021-11-06 03:57:01', 3),
(5, '05', '2021-11-06 03:57:02', 3),
(6, '02', '2021-11-06 03:57:02', 3),
(7, '03', '2021-11-06 03:57:02', 4),
(8, '02', '2021-11-06 03:57:03', 4),
(9, '01', '2021-11-06 03:57:03', 4),
(10, '01', '2021-11-06 03:57:03', 5),
(11, '02', '2021-11-06 03:57:03', 6),
(12, '07', '2021-11-06 03:57:04', 7),
(13, '09', '2021-11-06 03:57:04', 8),
(14, '04', '2021-11-06 03:57:04', 9),
(15, '06', '2021-11-06 03:57:04', 10),
(16, '08', '2021-11-06 03:57:04', 11),
(17, '003', '2021-11-06 03:57:05', 12),
(18, '01', '2021-11-06 03:57:05', 13),
(19, '02', '2021-11-06 03:57:05', 14),
(20, '03', '2021-11-06 03:57:06', 15),
(21, '05', '2021-11-06 03:57:06', 16),
(22, '05', '2021-11-06 03:57:06', 17),
(23, '04', '2021-11-06 03:57:06', 17),
(24, '03', '2021-11-06 03:57:07', 17),
(25, '02', '2021-11-06 03:57:07', 17),
(26, '01', '2021-11-06 03:57:07', 17),
(27, '06', '2021-11-06 03:57:07', 18),
(28, '01', '2021-11-06 03:57:08', 19),
(29, '03', '2021-11-06 03:57:08', 20),
(30, '03', '2021-11-06 03:57:08', 21),
(31, '03', '2021-11-06 03:57:08', 22),
(32, '03', '2021-11-06 03:57:09', 23),
(33, '02', '2021-11-06 03:57:09', 23),
(34, '01', '2021-11-06 03:57:09', 23),
(35, '01', '2021-11-06 03:57:10', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_objetivo`
--

CREATE TABLE `grupo_objetivo` (
  `id_grupoobjetivo` int(11) NOT NULL,
  `id_capacitacionprogramada` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `cargo` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `grupo_objetivo`
--

INSERT INTO `grupo_objetivo` (`id_grupoobjetivo`, `id_capacitacionprogramada`, `id_cargo`, `cargo`) VALUES
(23, 14, 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incapacidad`
--

CREATE TABLE `incapacidad` (
  `id_incapacidad` int(11) NOT NULL,
  `dias` int(11) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `diagnostico` text COLLATE utf8_unicode_ci NOT NULL,
  `tipo_incapacidad` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `archivo_incapacidad` text COLLATE utf8_unicode_ci NOT NULL,
  `id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `incapacidad`
--

INSERT INTO `incapacidad` (`id_incapacidad`, `dias`, `fecha_ini`, `fecha_fin`, `diagnostico`, `tipo_incapacidad`, `archivo_incapacidad`, `id_funcionario`) VALUES
(1, 3, '2022-06-14', '2022-06-16', 'Gripe', 'EG', 'views/archivos/incapacidad/No_Aplica.1655260880_62a946d084cdb.pdf', 28),
(2, 3, '2022-06-15', '2022-06-17', 'Gripe', 'EG', 'views/archivos/incapacidad/RAMIRO_ANTONIO_ANGARITA_NIEBLES.1655353748_62aab19400741.pdf', 28),
(3, 3, '2022-06-15', '2022-06-17', 'Gripe', 'EG', 'views/archivos/incapacidad/RAMIRO_ANTONIO_ANGARITA_NIEBLES.1655353845_62aab1f51f4ac.pdf', 28),
(4, 3, '2022-06-15', '2022-06-17', 'Gripe', 'SOAT', '', 28),
(5, 3, '2022-06-21', '2022-06-23', 'Gripe', 'SOAT', '', 28),
(6, 3, '2022-06-01', '2022-06-03', 'Gripe', 'EG', '', 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion`
--

CREATE TABLE `inspeccion` (
  `id_inspeccion` int(11) NOT NULL,
  `id_dependencia` int(11) NOT NULL,
  `identificacion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_inspeccion` int(10) DEFAULT NULL,
  `responsable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `modalidad` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `motivo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `tiempo_gen` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion`
--

INSERT INTO `inspeccion` (`id_inspeccion`, `id_dependencia`, `identificacion`, `tipo_inspeccion`, `responsable`, `fecha_ini`, `fecha_fin`, `modalidad`, `estado`, `archivo`, `motivo`, `observacion`, `consecutivo`, `tiempo_gen`) VALUES
(7, 62, '2022-1', 2, 'asesor ARL', '2022-07-01', '2022-07-30', 'PRESENCIAL', NULL, '', NULL, NULL, 1, '2022-06-17 11:48:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logger`
--

CREATE TABLE `logger` (
  `id_logger` int(11) NOT NULL,
  `opcion` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo_gen` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `logger`
--

INSERT INTO `logger` (`id_logger`, `opcion`, `usuario`, `descripcion`, `tiempo_gen`) VALUES
(1, 'ACTIVIDADES PROGRAMADAS', 'siithjam_dbsiith', 'CREACION ACTIVIDAD PROGRAMADA', '2022-02-14 22:14:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriz`
--

CREATE TABLE `matriz` (
  `id_matriz` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `lugar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `origen_hallazgo` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion_hallazgo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `elemento_interviene` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recomendacion` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_accion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechapropuesta_cierre` date DEFAULT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `accion_tomada` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_entidad` bit(1) DEFAULT NULL,
  `sede` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `denominacion` int(11) DEFAULT NULL,
  `documento_soporte` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `avance` int(10) DEFAULT NULL,
  `estado` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo_gen` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `matriz`
--

INSERT INTO `matriz` (`id_matriz`, `id_funcionario`, `lugar`, `fecha`, `origen_hallazgo`, `descripcion_hallazgo`, `elemento_interviene`, `recomendacion`, `tipo_accion`, `responsable`, `fechapropuesta_cierre`, `fecha_cierre`, `accion_tomada`, `is_entidad`, `sede`, `denominacion`, `documento_soporte`, `avance`, `estado`, `tiempo_gen`) VALUES
(10, 34, '', '2022-02-09', 'Quejas y Reclamos', 'khgjh', 'Revisión gerencial', 'khbjhb', 'A. Correctiva', 'khbjh', '2022-02-09', '2022-02-16', 'khbjhb', b'1', 'Biblioteca', 14, '', 10, 'ABIERTO', '2022-02-10 19:02:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movilidad`
--

CREATE TABLE `movilidad` (
  `id_movilidad` int(11) NOT NULL,
  `funciones` text NOT NULL,
  `salario` varchar(45) NOT NULL,
  `fecha_ini` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_dependencia` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `numero_posesion` varchar(45) DEFAULT NULL,
  `fecha_posesion` date DEFAULT NULL,
  `numero_resolucion` varchar(45) DEFAULT NULL,
  `fecha_resolucion` date DEFAULT NULL,
  `modo_trabajo` varchar(45) DEFAULT NULL,
  `archivo_laboral` varchar(255) DEFAULT NULL,
  `id_tipovinculacion` int(11) DEFAULT NULL,
  `id_nivel` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `id_codigo` int(11) DEFAULT NULL,
  `id_grado` int(11) DEFAULT NULL,
  `motivo` varchar(45) DEFAULT NULL,
  `otro` varchar(255) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `entrega_cargo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movilidad`
--

INSERT INTO `movilidad` (`id_movilidad`, `funciones`, `salario`, `fecha_ini`, `fecha_fin`, `id_funcionario`, `id_dependencia`, `id_sede`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `id_tipovinculacion`, `id_nivel`, `id_cargo`, `id_codigo`, `id_grado`, `motivo`, `otro`, `fecha_creacion`, `entrega_cargo`) VALUES
(1, 'djdsjksdjsd', '111111', '2022-04-07 00:00:00', '2022-04-14 00:00:00', 1, 9, 6, '212', '2022-04-08', '2333', '2022-04-07', 'Presencial', '', 4, 5, 15, 15, 20, 'Encargo', '', '2022-04-07', 'SI'),
(3, 'hfhhhvhvg', '2000000', '2022-04-01 00:00:00', '2022-04-20 00:00:00', 10, 8, 4, '202277777', '2022-04-02', '202277777', '2022-04-04', 'Presencial', '', 1, 3, 11, 11, 16, 'Encargo', '', '2022-04-08', 'NO'),
(4, 'ssssssssssssssssss', '0444444', '2022-06-30 00:00:00', NULL, 469, 11, 4, '388', '2022-06-30', '1690', '2022-06-30', 'Presencial', '', 1, 4, 17, 17, 22, 'Reubicacion', '', '2022-06-17', 'SI'),
(5, 'ssssssssssssssssss', '0444444', '2022-06-17 00:00:00', '2022-12-31 00:00:00', 469, 12, 4, '387', '2022-06-17', '1690', '2022-06-17', 'Alternancia', 'views/archivos/movilidad/No_Aplica.1655504430_62acfe2e5fbb7.pdf', 1, 4, 13, 13, 18, 'Comision', '', '2022-06-17', 'undefined'),
(6, 'FUNCIONES', '1500000', '2022-06-21 00:00:00', '2022-05-30 00:00:00', 477, 4, 7, 'A-1234578', '2022-06-20', '123', '2022-06-20', 'Presencial', '', 1, 2, 1, 1, 1, 'Encargo', '', '2022-06-20', 'NO'),
(7, 'VARIAS', '2226382', '2022-07-08 00:00:00', NULL, 276, 11, 4, 'DECRETO 35-16-037', '2022-07-13', '3501129', '2022-07-08', 'Presencial', '', 1, 2, 4, 4, 7, 'Encargo', '', '2022-08-09', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL,
  `municipio` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id_municipio`, `municipio`, `codigo`) VALUES
(1, 'CALI', '76001'),
(2, 'ALCALÁ', '76020'),
(3, 'ANDALUCÍA', '76036'),
(4, 'ANSERMANUEVO', '76041'),
(5, 'ARGELIA', '76054'),
(6, 'BOLÍVAR', '76100'),
(7, 'BUENAVENTURA', '76109'),
(8, 'BUGA', '76111'),
(9, 'BUGALAGRANDE', '76113'),
(10, 'CAICEDONIA', '76122'),
(11, 'CALIMA', '76126'),
(12, 'CANDELARIA', '76130'),
(13, 'CARTAGO', '76147'),
(14, 'DAGUA', '76233'),
(15, 'EL ÁGUILA', '76243'),
(16, 'EL CAIRO', '76246'),
(17, 'EL CERRITO', '76248'),
(18, 'EL DOVIO', '76250'),
(19, 'FLORIDA', '76275'),
(20, 'GINEBRA', '76306'),
(21, 'GUACARÍ', '76318'),
(22, 'JAMUNDÍ', '76364'),
(23, 'LA CUMBRE', '76377'),
(24, 'LA UNIÓN', '76400'),
(25, 'LA VICTORIA', '76403'),
(26, 'OBANDO', '76497'),
(27, 'PALMIRA', '76520'),
(28, 'PRADERA', '76563'),
(29, 'RESTREPO', '76606'),
(30, 'RIOFRÍO', '76616'),
(31, 'ROLDANILLO', '76622'),
(32, 'SAN PEDRO', '76670'),
(33, 'SEVILLA', '76736'),
(34, 'TORO', '76823'),
(35, 'TRUJILLO', '76828'),
(36, 'TULUÁ', '76834'),
(37, 'ULLOA', '76845'),
(38, 'VERSALLES', '76863'),
(39, 'VIJES', '76869'),
(40, 'YOTOCO', '76890'),
(41, 'YUMBO', '76892'),
(42, 'ZARZAL', '76895'),
(43, 'CAUCA', '15022');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_educativo`
--

CREATE TABLE `nivel_educativo` (
  `id_niveleducativo` int(11) NOT NULL,
  `nivel_educativo` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `nivel_educativo`
--

INSERT INTO `nivel_educativo` (`id_niveleducativo`, `nivel_educativo`) VALUES
(1, 'Primaria'),
(2, 'Bachiller'),
(3, 'Técnica'),
(4, 'Tecnológica'),
(5, 'Tecnológica Especializada'),
(6, 'Universitaria'),
(7, 'Especialización'),
(8, 'Maestría o Magister'),
(9, 'Doctorado o PHD'),
(10, 'Posgrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_funcionario`
--

CREATE TABLE `nivel_funcionario` (
  `id_nivelfuncionario` int(11) NOT NULL,
  `nivel` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `nivel_funcionario`
--

INSERT INTO `nivel_funcionario` (`id_nivelfuncionario`, `nivel`, `fecha_upd`) VALUES
(1, 'Asesor', '2021-11-06 03:56:50'),
(2, 'Asistencial', '2021-11-06 03:56:50'),
(3, 'Directivo', '2021-11-06 03:56:50'),
(4, 'Profesional', '2021-11-06 03:56:50'),
(5, 'Técnico', '2021-11-06 03:56:50'),
(6, 'T.Oficial', '2022-04-03 22:22:58'),
(7, 'Ejecutivo', '2022-04-03 22:46:01'),
(8, 'Provisionalidad', '2022-04-03 23:49:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nucleo_familiar`
--

CREATE TABLE `nucleo_familiar` (
  `id_nucleofamiliar` int(11) NOT NULL,
  `nombres` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_funcionario` int(11) NOT NULL,
  `id_parentesco` int(11) NOT NULL,
  `is_emergencia` bit(1) DEFAULT b'0',
  `contacto` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentesco` varchar(85) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `nucleo_familiar`
--

INSERT INTO `nucleo_familiar` (`id_nucleofamiliar`, `nombres`, `apellidos`, `edad`, `fecha_nacimiento`, `fecha_upd`, `id_funcionario`, `id_parentesco`, `is_emergencia`, `contacto`, `parentesco`) VALUES
(32, 'shadday', 'angarita', 2, '2020-05-10', '2022-06-27 11:33:43', 577, 4, b'1', '3445678', ''),
(33, 'ramiro', 'Angarita', 0, '2022-06-27', '2022-06-27 11:45:14', 579, 4, b'1', '3557896', ''),
(39, 'victor hugo', 'barreto perdomo', 74, '1979-12-12', '2022-08-08 12:02:08', 66, 5, b'0', '', ''),
(40, 'Rocio ', 'Orozco Cardona', 65, '1979-12-12', '2022-08-08 12:14:24', 66, 5, b'0', '', ''),
(43, 'yolanda', 'calapsu', 62, '1960-08-15', '2022-08-08 17:36:55', 45, 3, b'0', '', ''),
(44, 'Rocio ', 'Orozco Cardona', 65, '1957-08-27', '2022-08-08 17:41:31', 72, 3, b'0', '', ''),
(45, 'JAIRO ALFONSO', 'QUINTERO LOPEZ', 66, '1988-11-21', '2022-08-09 11:26:18', 398, 5, b'0', '', ''),
(46, 'LUZ ', 'MEJIA BEDOYA', 58, '1988-11-21', '2022-08-09 11:26:18', 398, 5, b'0', '', ''),
(47, 'DILLETTE ROCIO', 'QUINTERO MEJIA', 34, '1988-11-21', '2022-08-09 11:26:18', 398, 5, b'1', '3154215232', ''),
(48, 'JAIRO ALFONSO', 'QUINTERO LOPEZ', 66, '1988-11-21', '2022-08-09 11:28:56', 398, 5, b'0', '', ''),
(49, 'LUZ ', 'MEJIA BEDOYA', 58, '1988-11-21', '2022-08-09 11:28:56', 398, 5, b'0', '', ''),
(50, 'DILLETTE ROCIO', 'QUINTERO MEJIA', 34, '1988-11-21', '2022-08-09 11:28:56', 398, 5, b'1', '3154215232', ''),
(51, 'AURA ROSA ', 'VALENCIA VELASQUEZ', 80, '1985-04-19', '2022-08-09 11:40:39', 141, 6, b'0', '', ''),
(52, 'DIEGO FERNANDO', 'BECERRA ', 37, '1985-04-19', '2022-08-09 11:40:39', 141, 6, b'1', '3205210390', ''),
(53, 'LUZ AMPARO ', 'HERNANDEZ MOLINA', 48, '1974-10-03', '2022-08-09 11:53:15', 56, 3, b'1', '3206787671', ''),
(54, 'CLIMACO', 'CHARRUPI POPO', 58, '1964-08-26', '2022-08-09 12:14:09', 155, 2, b'1', '3137504213', ''),
(55, 'FLOR DE LIZ', 'GOMEZ CARABALI', 57, '1965-04-19', '2022-08-09 12:14:09', 155, 3, b'0', '', ''),
(56, 'MARCO ', 'RUALES MONTERO', 80, '1942-05-14', '2022-08-09 12:30:41', 553, 2, b'0', '', ''),
(57, 'MARIELA', 'IBARRA CORDOBA', 76, '1946-08-29', '2022-08-09 12:30:41', 553, 3, b'0', '', ''),
(58, 'YAMILE', 'RUALES IBARRA', 46, '1976-06-27', '2022-08-09 12:30:41', 553, 5, b'1', '3103771694', ''),
(59, 'ROGER ', 'CHAMORRO RIVAS', 43, '1979-12-01', '2022-08-09 12:30:41', 553, 1, b'0', '', ''),
(60, 'DIANA MARCELA', 'AVILA LINARES', 40, '1982-09-13', '2022-08-09 12:47:37', 80, 1, b'1', '3007782231', ''),
(61, 'VALERIA ', 'GUZMAN RINCON', 14, '2008-02-17', '2022-08-09 16:36:36', 408, 4, b'0', '', ''),
(62, 'MELANI SOFIA', 'GIRALDO RINCON', 11, '2011-11-26', '2022-08-09 16:36:36', 408, 6, b'0', '', 'NIETA'),
(63, 'SANTIAGO ', 'NARVAEZ PEREZ', 20, '2002-04-08', '2022-08-09 16:38:07', 386, 4, b'1', '3155840481', ''),
(64, 'JULIANA ANDREA', 'VILLEGAS VELASCO', 20, '2002-09-28', '2022-08-09 17:08:29', 493, 4, b'1', '3187430125', ''),
(65, 'SILVIA PATRICIA', 'VELASCO CARABALI', 32, '1990-02-06', '2022-08-09 17:08:29', 493, 5, b'1', '3217061122', ''),
(66, 'BRETSMAN', 'USMA CANO', 49, '2004-09-05', '2022-08-09 17:32:00', 276, 4, b'1', '3176988099', ''),
(67, 'DIANA ', 'USMA MORENO', 27, '2004-09-05', '2022-08-09 17:32:00', 276, 4, b'1', '3052348293', ''),
(68, 'JEFERSON', 'USMA MORENO', 18, '2004-09-05', '2022-08-09 17:32:00', 276, 4, b'1', '3246362732', ''),
(69, 'Jenny Carolina', 'Barreto Orozco', 43, '1979-12-12', '2022-08-11 12:01:23', 66, 5, b'1', '3106432237', ''),
(70, 'paula andrea', 'yandy altamirano', 23, '1999-08-30', '2022-08-16 16:24:54', 13, 4, b'1', '3137285442', ''),
(71, 'nestor daniel ', 'yandy altamirano', 23, '1999-08-30', '2022-08-16 16:24:54', 13, 4, b'1', '3154543921', ''),
(72, 'thiago', 'yandy aristizabal', 3, '1992-12-18', '2022-08-16 16:31:40', 18, 6, b'0', '', ''),
(73, 'edgar andrey', 'yandy diaz', 30, '1992-12-18', '2022-08-16 16:31:40', 18, 6, b'1', '3008136054', ''),
(74, 'kevin javier', 'Viloria Hoyos', 30, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'0', '', ''),
(75, 'mauricio Esteban ', 'Diaz Hoyos', 24, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'0', '', ''),
(76, 'Pedro Antonio ', 'Diaz Hoyos', 17, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'0', '', ''),
(77, 'Nataly', 'Correa Hoyos', 30, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'0', '', ''),
(78, 'Pedro Antonio', 'Diaz García', 50, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'1', '3118993975', ''),
(79, 'kevin javier', 'Viloria Hoyos', 30, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'0', '', ''),
(80, 'mauricio Esteban ', 'Diaz Hoyos', 24, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'0', '', ''),
(81, 'Pedro Antonio ', 'Diaz Hoyos', 17, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'0', '', ''),
(82, 'Nataly', 'Correa Hoyos', 30, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'0', '', ''),
(83, 'Pedro Antonio', 'Diaz García', 50, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'1', '3118993975', ''),
(84, 'Eneida Teresita', 'Gomez de Ospina', 90, '1932-01-28', '2022-08-17 16:06:26', 369, 3, b'0', '', ''),
(85, 'Alejandro ', 'Ospina Gomez', 56, '1966-06-01', '2022-08-17 16:06:26', 369, 5, b'1', '3015722500', ''),
(86, 'JUAN DAVID', 'ARBOLEDA RADA', 24, '1998-02-20', '2022-08-17 17:07:12', 469, 4, b'1', '3156661228', ''),
(87, 'Edwin Bernardo', 'Sanchez ', 45, '1976-11-12', '2022-08-17 17:36:05', 390, 1, b'1', '3207406035', ''),
(91, 'fsfdfsdf', 'fsfsdf', 0, NULL, '2022-08-17 20:09:19', 11, 5, b'0', '', ''),
(92, 'ESTEBAN ', 'FIGEROA GOMEZ', 30, '1992-05-01', '2022-08-18 11:40:06', 232, 4, b'1', '3215067464', ''),
(93, 'MARIA ZOILA ', 'ORTEGA MORALES', 80, '1942-01-15', '2022-08-29 09:25:14', 465, 3, b'0', '', ''),
(94, 'ROSSANA', 'ANDRADE MOJARRANGO', 27, '1995-01-27', '2022-08-29 09:25:14', 465, 1, b'1', '324171698', ''),
(95, 'MARIA ZOILA ', 'ORTEGA MORALES', 80, '1942-01-15', '2022-08-29 09:29:37', 465, 3, b'0', '', ''),
(96, 'ROSSANA', 'ANDRADE MOJARRANGO', 27, '1995-01-27', '2022-08-29 09:29:37', 465, 1, b'1', '324171698', ''),
(97, 'DIANA CAROLINA', 'ECHEVERRY PERDIGON', 30, '1991-09-01', '2022-08-29 10:29:15', 70, 4, b'1', '3164133732', ''),
(98, 'DIANA CAROLINA', 'ECHEVERRY PERDIGON', 30, '1991-09-01', '2022-08-29 10:31:00', 70, 4, b'1', '3164133732', ''),
(99, 'ANGELA MARCELA', 'DIAZ IBARRA', 30, '1991-09-30', '2022-08-29 10:37:49', 284, 4, b'1', '3226136838', ''),
(100, 'DARLYN DANIELA', 'ENCARNACION IBARRA', 22, '2000-06-10', '2022-08-29 10:37:49', 284, 4, b'1', '3219927294', ''),
(101, 'CARLOS FREYDEN ', 'FORY', 49, '1973-02-12', '2022-08-29 10:37:49', 284, 6, b'0', '', 'COMPAÑERO SENTIMENTAL'),
(102, 'JUAN PABLO ', 'GUERRERO RODRIGUEZ', 12, '2010-07-31', '2022-08-29 10:46:28', 164, 6, b'0', '', 'nieto'),
(103, 'MARIA MELBA', 'NAVIA', 59, '1962-10-11', '2022-08-29 10:46:28', 164, 1, b'1', '3235037894', ''),
(104, 'MARIANA ', 'GARCIA USMA', 9, '2000-10-02', '2022-08-29 10:54:09', 475, 6, b'0', '', ''),
(105, 'KALETH', 'VELA USMA', 3, '2000-10-02', '2022-08-29 10:54:09', 475, 6, b'0', '', ''),
(106, 'ALEXANDRA', 'GUERRERO', 50, '1971-09-12', '2022-08-29 10:54:09', 475, 6, b'1', '3167853194', ''),
(107, 'MARIANA ', 'GARCIA USMA', 9, '2000-10-02', '2022-08-29 10:58:42', 475, 6, b'0', '', ''),
(108, 'KALETH', 'VELA USMA', 3, '2000-10-02', '2022-08-29 10:58:42', 475, 6, b'0', '', ''),
(109, 'ALEXANDRA', 'GUERRERO', 21, '2000-10-02', '2022-08-29 10:58:42', 475, 6, b'1', '3167853194', ''),
(110, 'jorge enrique', 'APONZA', 69, '1953-08-24', '2022-08-29 11:06:56', 250, 1, b'1', '3128232660', ''),
(111, 'LUZ KARIME ', 'APONZA LUCUMI', 22, '2000-02-19', '2022-08-29 11:06:56', 250, 4, b'0', '', ''),
(112, 'JESSICA', 'GONZALEZ LUCUMI', 21, '2001-02-28', '2022-08-29 11:06:56', 250, 4, b'1', '3045279653', ''),
(113, 'ERIKA PAOLA', 'CARABALI LASSO', 17, '2004-12-12', '2022-08-29 11:13:11', 187, 4, b'0', '', ''),
(114, 'YEISON', 'CARABALI LASSO', 34, '1988-01-10', '2022-08-29 11:13:11', 187, 4, b'1', '3146079585', ''),
(115, 'ERIKA PAOLA', 'CARABALI LASSO', 17, '2004-12-12', '2022-08-29 11:13:47', 187, 4, b'1', '3233412361', ''),
(116, 'YEISON', 'CARABALI LASSO', 34, '1988-01-10', '2022-08-29 11:13:47', 187, 4, b'1', '3146079585', ''),
(117, 'JORGE EDWIN ', 'CASTRO RUA', 32, '1990-05-04', '2022-08-29 15:26:11', 541, 4, b'1', '3105238780', ''),
(118, 'YEFERSON ALEARSI', 'CORDOBA QUIJANO', 11, '2010-10-22', '2022-08-29 15:47:32', 264, 4, b'0', '', ''),
(119, 'AURA CECILIA', 'QUIJANO', 0, NULL, '2022-08-29 15:47:32', 264, 1, b'1', '3216257644', ''),
(120, 'Danny', 'Mejia Navia', 39, '1982-12-01', '2022-09-01 10:18:10', 582, 1, b'1', '3105034654', ''),
(121, 'Santiago', 'Mejia Correa', 14, '2008-01-02', '2022-09-01 10:18:10', 582, 4, b'0', '', ''),
(122, 'Carmenza', 'Polo', 65, '1957-02-02', '2022-09-01 16:07:10', 583, 3, b'1', '3177275964', ''),
(123, 'Maria Camila', 'Zuleta Mina', 17, '1963-10-02', '2022-09-02 16:53:03', 585, 3, b'0', '', ''),
(124, 'Keller', 'Mendoza Mina', 9, '1963-10-02', '2022-09-02 16:53:03', 585, 3, b'0', '', ''),
(125, 'Maria Nelly', 'Charry', 58, '1963-10-02', '2022-09-02 16:53:03', 585, 3, b'1', '3137274248', ''),
(126, 'ROCIO', 'OROZCO CARDONA', 65, '1957-08-27', '2022-09-06 09:12:10', 72, 3, b'1', '3106432237', ''),
(127, 'VICTOR HUGO', 'BARRETO PERDOMO', 75, '1947-06-15', '2022-09-06 09:12:10', 72, 2, b'0', '', ''),
(128, 'ROCIO', 'OROZCO CARDONA', 65, '1957-08-27', '2022-09-06 09:16:59', 72, 3, b'1', '3162977398', ''),
(129, 'VICTOR HUGO ', 'BARRETO PERDOMO', 75, '1947-06-15', '2022-09-06 09:16:59', 72, 2, b'0', '', ''),
(130, 'Juana', 'Cardona Rodriguez', 1, '1991-09-09', '2022-09-13 18:56:20', 587, 6, b'0', '', ''),
(131, 'Daniela', 'Rodriguez Hoyos', 31, '1991-09-09', '2022-09-13 18:56:20', 587, 6, b'1', '3155310325', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `idopcion` int(11) NOT NULL,
  `opcion` varchar(255) NOT NULL,
  `id_opcionpadre` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`idopcion`, `opcion`, `id_opcionpadre`) VALUES
(1, 'funcionarios', 1),
(2, 'Seguridad social', 2),
(3, 'Incapacidad', 2),
(4, 'Movilidad', 3),
(5, 'Entrega del cargo', 3),
(6, 'Capacitaciones', 4),
(7, 'Actividades', 5),
(8, 'Reporte de Funcionarios', 1),
(9, 'Reporte de Actividades y Capacitaciones', 6),
(10, 'Subir reporte de evaluación', 7),
(11, 'Consultar evaluación', 7),
(12, 'Inspección', 8),
(13, 'Matriz de cumplimiento', 8),
(14, 'Actividades', 8),
(15, 'Capacitaciones', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_asignadas`
--

CREATE TABLE `opciones_asignadas` (
  `id_opcionesasg` int(11) NOT NULL,
  `id_opcion` int(11) DEFAULT NULL,
  `id_opcionpadre` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `is_write` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opciones_asignadas`
--

INSERT INTO `opciones_asignadas` (`id_opcionesasg`, `id_opcion`, `id_opcionpadre`, `id_usuario`, `is_write`) VALUES
(788, 15, 8, 77, 0),
(787, 14, 8, 77, 0),
(786, 13, 8, 77, 0),
(785, 12, 8, 77, 0),
(784, 11, 7, 77, 1),
(783, 10, 7, 77, 1),
(782, 9, 6, 77, 0),
(781, 7, 5, 77, 0),
(780, 6, 4, 77, 0),
(779, 4, 3, 77, 0),
(688, 14, 8, 75, 0),
(689, 15, 8, 75, 0),
(798, 11, 7, 76, 0),
(797, 9, 6, 76, 1),
(796, 7, 5, 76, 1),
(795, 6, 4, 76, 1),
(794, 5, 3, 76, 1),
(793, 4, 3, 76, 0),
(792, 3, 2, 76, 0),
(791, 2, 2, 76, 0),
(790, 8, 1, 76, 0),
(789, 1, 1, 76, 1),
(778, 2, 2, 77, 0),
(777, 8, 1, 77, 0),
(776, 1, 1, 77, 0),
(673, 14, 8, 74, 1),
(674, 15, 8, 74, 1),
(675, 1, 1, 75, 0),
(676, 8, 1, 75, 0),
(677, 2, 2, 75, 0),
(678, 3, 2, 75, 0),
(679, 4, 3, 75, 1),
(680, 5, 3, 75, 0),
(681, 6, 4, 75, 0),
(682, 7, 5, 75, 0),
(683, 9, 6, 75, 0),
(684, 10, 7, 75, 0),
(685, 11, 7, 75, 0),
(686, 12, 8, 75, 0),
(687, 13, 8, 75, 0),
(672, 13, 8, 74, 1),
(671, 12, 8, 74, 1),
(670, 11, 7, 74, 1),
(775, 15, 8, 73, 0),
(774, 14, 8, 73, 0),
(773, 13, 8, 73, 0),
(772, 12, 8, 73, 0),
(771, 11, 7, 73, 0),
(660, 1, 1, 74, 1),
(661, 8, 1, 74, 1),
(662, 2, 2, 74, 1),
(663, 3, 2, 74, 1),
(664, 4, 3, 74, 1),
(665, 5, 3, 74, 1),
(666, 6, 4, 74, 1),
(667, 7, 5, 74, 1),
(668, 9, 6, 74, 1),
(669, 10, 7, 74, 1),
(770, 10, 7, 73, 0),
(769, 9, 6, 73, 0),
(768, 7, 5, 73, 0),
(767, 6, 4, 73, 0),
(766, 5, 3, 73, 0),
(765, 4, 3, 73, 0),
(764, 3, 2, 73, 0),
(763, 2, 2, 73, 0),
(762, 8, 1, 73, 0),
(761, 1, 1, 73, 0),
(644, 11, 7, 72, 0),
(643, 9, 6, 72, 0),
(642, 3, 2, 72, 1),
(641, 2, 2, 72, 1),
(640, 8, 1, 72, 0),
(639, 1, 1, 72, 0),
(624, 1, 1, 1, 1),
(625, 8, 1, 1, 1),
(626, 2, 2, 1, 1),
(627, 3, 2, 1, 1),
(628, 4, 3, 1, 1),
(629, 5, 3, 1, 1),
(630, 6, 4, 1, 1),
(631, 7, 5, 1, 1),
(632, 9, 6, 1, 1),
(633, 10, 7, 1, 1),
(634, 11, 7, 1, 1),
(635, 12, 8, 1, 1),
(636, 13, 8, 1, 1),
(637, 14, 8, 1, 1),
(638, 15, 8, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcionpadre`
--

CREATE TABLE `opcionpadre` (
  `idopcionpadre` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opcionpadre`
--

INSERT INTO `opcionpadre` (`idopcionpadre`, `descripcion`) VALUES
(1, 'Datos del funcionario'),
(2, 'Seguridad social'),
(3, 'Movilidad del funcionario'),
(4, 'Capacitación'),
(5, 'Bienestar'),
(6, 'Reportes'),
(7, 'Reporte de evaluación'),
(8, 'Plan de trabajo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `id_parentesco` int(11) NOT NULL,
  `parentesco` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parentesco`
--

INSERT INTO `parentesco` (`id_parentesco`, `parentesco`) VALUES
(1, 'Esposa/o'),
(2, 'Padre'),
(3, 'Madre'),
(4, 'Hijo'),
(5, 'Hermano'),
(6, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesos_disciplinarios`
--

CREATE TABLE `procesos_disciplinarios` (
  `id_procesosdisciplinarios` int(11) NOT NULL,
  `tipo_proceso` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_crea` date NOT NULL,
  `otro` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `motivo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retiro`
--

CREATE TABLE `retiro` (
  `id_retiro` int(11) NOT NULL,
  `acta_informe` enum('SI','NO','NO APLICA') COLLATE utf8_unicode_ci DEFAULT NULL,
  `examen_medico` enum('SI','NO','NO APLICA') COLLATE utf8_unicode_ci DEFAULT NULL,
  `comprovante_devolucion` enum('SI','NO','NO APLICA') COLLATE utf8_unicode_ci DEFAULT NULL,
  `hoja_sigep` enum('SI','NO','NO APLICA') COLLATE utf8_unicode_ci DEFAULT NULL,
  `declaracion_sigep` enum('SI','NO','NO APLICA') COLLATE utf8_unicode_ci DEFAULT NULL,
  `carnet_servidor` enum('SI','NO','NO APLICA') COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_funcionario_receptor` varchar(85) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `id_funcionario` int(11) NOT NULL,
  `paz_salvo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_causaretiro` int(11) DEFAULT NULL,
  `tipo_retiro` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otro` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_retiro` date DEFAULT NULL,
  `estado` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `retiro`
--

INSERT INTO `retiro` (`id_retiro`, `acta_informe`, `examen_medico`, `comprovante_devolucion`, `hoja_sigep`, `declaracion_sigep`, `carnet_servidor`, `nombre_funcionario_receptor`, `fecha_recepcion`, `id_funcionario`, `paz_salvo`, `id_causaretiro`, `tipo_retiro`, `otro`, `fecha_retiro`, `estado`) VALUES
(2, 'SI', 'SI', 'SI', 'SI', 'SI', 'SI', NULL, '2022-04-07', 6, '', 3, 'Retiro', '', '2022-04-06', NULL),
(3, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 6, '', 16, 'Entrega del cargo', '', '2022-04-06', NULL),
(4, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 10, '', 16, 'Entrega del cargo', '', '2022-04-20', 'pendiente'),
(5, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 2, '', 16, 'Entrega del cargo', '', '2022-04-25', NULL),
(6, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 9, '', 16, 'Entrega del cargo', '', '2022-04-26', NULL),
(7, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 9, '', 16, 'Entrega del cargo', '', '2022-04-20', 'pendiente'),
(8, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 11, 'views/archivos/retiro/cpa_school_test.1651426411_626ec46b33a31.pdf', 16, 'Entrega del cargo', '', '2022-04-27', 'pendiente'),
(9, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 4, '', 16, 'Retiro', '', '2022-04-21', NULL),
(10, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 5, '', 16, 'Retiro', '', '2022-05-01', NULL),
(11, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 57, '', 16, 'Retiro', '', '2022-05-24', NULL),
(12, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 445, '', 3, 'Retiro', '', '2022-05-30', 'pendiente'),
(13, 'SI', 'SI', 'SI', 'SI', 'SI', 'SI', NULL, NULL, 393, 'views/archivos/retiro/No_Aplica.1653952664_62955098aa745.pdf', 6, 'Retiro', '', '2022-05-29', 'pendiente'),
(14, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 477, '', 16, 'Retiro', '', '2022-05-30', NULL),
(15, 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', 'NO APLICA', NULL, NULL, 477, '', 16, 'Retiro', '', '2022-05-30', NULL),
(16, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', NULL, NULL, 477, '', 10, 'Retiro', '', '2022-05-30', 'ok');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL,
  `sede` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_crea` date NOT NULL,
  `fecha_upd` datetime DEFAULT current_timestamp(),
  `is_activo` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`id_sede`, `sede`, `descripcion`, `direccion`, `fecha_crea`, `fecha_upd`, `is_activo`) VALUES
(1, 'Instituciones educativas', NULL, NULL, '0000-00-00', '2021-11-06 03:56:44', b'1'),
(2, 'Confandi', NULL, NULL, '0000-00-00', '2021-11-06 03:56:44', b'1'),
(3, 'Caña dulce', NULL, NULL, '0000-00-00', '2021-11-06 03:56:45', b'1'),
(4, 'Palacio municipal ', NULL, NULL, '0000-00-00', '2021-11-06 03:56:45', b'1'),
(5, 'Salud', NULL, NULL, '0000-00-00', '2021-11-06 03:56:46', b'1'),
(6, 'Biblioteca', NULL, NULL, '0000-00-00', '2021-11-06 03:56:47', b'1'),
(7, 'Archivo central', NULL, NULL, '0000-00-00', '2021-11-06 03:56:47', b'1'),
(8, 'Casa de la cultura', NULL, NULL, '0000-00-00', '2021-11-06 03:56:48', b'1'),
(9, 'COE ', NULL, NULL, '0000-00-00', '2021-11-06 03:56:48', b'1'),
(10, 'La Galería', NULL, NULL, '0000-00-00', '2021-11-06 03:56:49', b'1'),
(11, 'Sede cambiante', NULL, NULL, '0000-00-00', '2021-11-06 03:56:49', b'1'),
(12, 'Trabajo en casa', NULL, NULL, '0000-00-00', '2021-11-06 03:56:49', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguridad_social`
--

CREATE TABLE `seguridad_social` (
  `id_seguridadsocial` int(11) NOT NULL,
  `fecha_retiro` date DEFAULT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_eps` int(11) DEFAULT NULL,
  `id_fondopension` int(11) DEFAULT NULL,
  `id_arl` int(11) DEFAULT NULL,
  `id_fondocesantias` int(11) DEFAULT NULL,
  `id_cajacompensacion` int(11) DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `seguridad_social`
--

INSERT INTO `seguridad_social` (`id_seguridadsocial`, `fecha_retiro`, `id_funcionario`, `id_eps`, `id_fondopension`, `id_arl`, `id_fondocesantias`, `id_cajacompensacion`, `salario`, `fecha_creacion`) VALUES
(30, '2022-04-25', 2, 3, 1, 1, NULL, 1, 0, '0000-00-00 00:00:00'),
(31, NULL, 3, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(32, '2022-04-21', 4, 12, 3, 1, NULL, 1, 0, '0000-00-00 00:00:00'),
(33, NULL, 6, 15, 3, 1, 1, 1, 0, '0000-00-00 00:00:00'),
(34, '2022-04-20', 10, 11, 3, 1, NULL, 1, 0, '0000-00-00 00:00:00'),
(35, NULL, 13, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(36, NULL, 14, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(37, NULL, 15, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(38, NULL, 16, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(39, NULL, 17, 13, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(40, NULL, 18, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(41, NULL, 20, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(42, NULL, 21, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(43, NULL, 22, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(44, NULL, 23, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(45, NULL, 25, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(46, NULL, 28, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(47, NULL, 30, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(48, NULL, 31, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(49, NULL, 34, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(50, NULL, 37, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(51, NULL, 38, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(52, NULL, 39, 5, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(53, NULL, 41, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(54, NULL, 42, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(55, NULL, 43, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(56, NULL, 44, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(57, NULL, 45, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(58, NULL, 46, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(59, NULL, 47, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(60, NULL, 48, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(61, NULL, 49, 12, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(62, NULL, 50, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(63, NULL, 51, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(64, NULL, 52, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(65, NULL, 53, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(66, NULL, 55, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(67, NULL, 56, 14, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(68, NULL, 59, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(69, NULL, 60, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(70, NULL, 61, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(71, NULL, 63, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(72, NULL, 64, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(73, NULL, 65, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(74, NULL, 66, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(75, NULL, 68, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(76, NULL, 69, 3, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(77, NULL, 70, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(78, NULL, 71, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(79, NULL, 72, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(80, NULL, 73, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(81, NULL, 74, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(82, NULL, 76, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(83, NULL, 77, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(84, NULL, 78, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(85, NULL, 79, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(86, NULL, 80, 16, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(87, NULL, 81, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(88, NULL, 82, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(89, NULL, 83, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(90, NULL, 84, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(91, NULL, 85, 14, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(92, NULL, 86, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(93, NULL, 87, 15, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(94, NULL, 88, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(95, NULL, 89, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(96, NULL, 91, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(97, NULL, 92, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(98, NULL, 93, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(99, NULL, 94, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(100, NULL, 95, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(101, NULL, 96, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(102, NULL, 97, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(103, NULL, 100, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(104, NULL, 101, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(105, NULL, 104, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(106, NULL, 105, 3, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(107, NULL, 106, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(108, NULL, 107, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(109, NULL, 109, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(110, NULL, 111, 10, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(111, NULL, 112, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(112, NULL, 113, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(113, NULL, 114, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(114, NULL, 115, 3, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(115, NULL, 117, 13, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(116, NULL, 118, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(117, NULL, 119, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(118, NULL, 120, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(119, NULL, 121, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(120, NULL, 122, 17, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(121, NULL, 123, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(122, NULL, 124, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(123, NULL, 128, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(124, NULL, 132, 3, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(125, NULL, 133, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(126, NULL, 134, 13, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(127, NULL, 135, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(128, NULL, 136, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(129, NULL, 138, 3, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(130, NULL, 139, 5, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(131, NULL, 140, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(132, NULL, 141, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(133, NULL, 142, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(134, NULL, 144, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(135, NULL, 145, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(136, NULL, 146, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(137, NULL, 147, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(138, NULL, 149, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(139, NULL, 151, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(140, NULL, 152, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(141, NULL, 153, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(142, NULL, 155, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(143, NULL, 156, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(144, NULL, 157, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(145, NULL, 159, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(146, NULL, 160, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(147, NULL, 161, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(148, NULL, 162, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(149, NULL, 164, 12, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(150, NULL, 167, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(151, NULL, 168, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(152, NULL, 169, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(153, NULL, 170, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(154, NULL, 172, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(155, NULL, 173, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(156, NULL, 174, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(157, NULL, 175, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(158, NULL, 176, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(159, NULL, 178, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(160, NULL, 179, 3, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(161, NULL, 180, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(162, NULL, 181, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(163, NULL, 182, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(164, NULL, 183, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(165, NULL, 184, 3, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(166, NULL, 185, 12, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(167, NULL, 186, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(168, NULL, 187, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(169, NULL, 188, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(170, NULL, 189, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(171, NULL, 190, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(172, NULL, 191, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(173, NULL, 192, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(174, NULL, 193, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(175, NULL, 194, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(176, NULL, 195, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(177, NULL, 196, 11, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(178, NULL, 197, 14, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(179, NULL, 198, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(180, NULL, 199, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(181, NULL, 200, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(182, NULL, 201, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(183, NULL, 202, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(184, NULL, 203, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(185, NULL, 204, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(186, NULL, 206, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(187, NULL, 207, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(188, NULL, 208, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(189, NULL, 211, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(190, NULL, 212, 3, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(191, NULL, 214, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(192, NULL, 216, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(193, NULL, 217, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(194, NULL, 220, 16, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(195, NULL, 221, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(196, NULL, 222, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(197, NULL, 223, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(198, NULL, 224, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(199, NULL, 225, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(200, NULL, 226, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(201, NULL, 227, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(202, NULL, 228, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(203, NULL, 231, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(204, NULL, 232, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(205, NULL, 233, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(206, NULL, 234, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(207, NULL, 235, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(208, NULL, 236, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(209, NULL, 237, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(210, NULL, 238, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(211, NULL, 239, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(212, NULL, 240, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(213, NULL, 241, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(214, NULL, 242, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(215, NULL, 243, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(216, NULL, 244, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(217, NULL, 245, 14, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(218, NULL, 246, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(219, NULL, 247, 3, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(220, NULL, 248, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(221, NULL, 250, 13, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(222, NULL, 252, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(223, NULL, 253, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(224, NULL, 255, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(225, NULL, 256, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(226, NULL, 257, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(227, NULL, 261, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(228, NULL, 263, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(229, NULL, 264, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(230, NULL, 266, 3, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(231, NULL, 267, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(232, NULL, 268, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(233, NULL, 270, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(234, NULL, 271, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(235, NULL, 272, 13, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(236, NULL, 274, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(237, NULL, 276, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(238, NULL, 278, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(239, NULL, 279, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(240, NULL, 281, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(241, NULL, 282, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(242, NULL, 284, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(243, NULL, 285, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(244, NULL, 287, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(245, NULL, 288, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(246, NULL, 291, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(247, NULL, 292, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(248, NULL, 293, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(249, NULL, 294, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(250, NULL, 295, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(251, NULL, 297, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(252, NULL, 301, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(253, NULL, 302, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(254, NULL, 303, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(255, NULL, 305, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(256, NULL, 306, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(257, NULL, 307, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(258, NULL, 309, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(259, NULL, 310, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(260, NULL, 311, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(261, NULL, 312, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(262, NULL, 313, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(263, NULL, 314, 13, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(264, NULL, 315, 11, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(265, NULL, 316, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(266, NULL, 317, 3, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(267, NULL, 319, 13, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(268, NULL, 321, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(269, NULL, 322, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(270, NULL, 323, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(271, NULL, 324, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(272, NULL, 325, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(273, NULL, 326, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(274, NULL, 327, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(275, NULL, 328, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(276, NULL, 333, 13, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(277, NULL, 334, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(278, NULL, 335, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(279, NULL, 336, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(280, NULL, 337, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(281, NULL, 338, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(282, NULL, 339, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(283, NULL, 340, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(284, NULL, 341, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(285, NULL, 343, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(286, NULL, 344, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(287, NULL, 345, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(288, NULL, 346, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(289, NULL, 348, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(290, NULL, 349, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(291, NULL, 350, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(292, NULL, 351, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(293, NULL, 352, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(294, NULL, 353, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(295, NULL, 354, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(296, NULL, 357, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(297, NULL, 358, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(298, NULL, 359, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(299, NULL, 360, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(300, NULL, 361, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(301, NULL, 362, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(302, NULL, 363, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(303, NULL, 364, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(304, NULL, 365, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(305, NULL, 366, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(306, NULL, 367, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(307, NULL, 368, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(308, NULL, 369, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(309, NULL, 370, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(310, NULL, 372, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(311, NULL, 374, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(312, NULL, 375, 14, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(313, NULL, 376, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(314, NULL, 378, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(315, NULL, 379, 14, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(316, NULL, 383, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(317, NULL, 384, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(318, NULL, 386, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(319, NULL, 387, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(320, NULL, 388, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(321, NULL, 389, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(322, NULL, 390, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(323, NULL, 391, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(324, NULL, 392, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(325, NULL, 396, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(326, NULL, 397, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(327, NULL, 398, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(328, NULL, 399, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(329, NULL, 400, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(330, NULL, 401, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(331, NULL, 402, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(332, NULL, 403, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(333, NULL, 405, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(334, NULL, 406, 14, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(335, NULL, 408, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(336, NULL, 409, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(337, NULL, 410, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(338, NULL, 411, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(339, NULL, 413, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(340, NULL, 415, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(341, NULL, 416, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(342, NULL, 417, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(343, NULL, 420, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(344, NULL, 421, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(345, NULL, 422, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(346, NULL, 424, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(347, NULL, 425, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(348, NULL, 428, 2, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(349, NULL, 431, 15, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(350, NULL, 432, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(351, NULL, 433, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(352, NULL, 434, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(353, NULL, 435, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(354, NULL, 438, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(355, NULL, 439, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(356, NULL, 440, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(357, NULL, 441, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(358, NULL, 442, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(359, NULL, 443, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(360, NULL, 444, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(361, NULL, 448, 14, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(362, NULL, 449, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(363, NULL, 452, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(364, NULL, 453, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(365, NULL, 455, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(366, NULL, 456, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(367, NULL, 457, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(368, NULL, 458, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(369, NULL, 459, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(370, NULL, 460, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(371, NULL, 461, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(372, NULL, 464, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(373, NULL, 465, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(374, NULL, 466, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(375, NULL, 468, 11, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(376, NULL, 469, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(377, NULL, 470, 10, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(378, NULL, 471, 12, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(379, NULL, 473, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(380, NULL, 474, 15, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(381, NULL, 475, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(382, NULL, 476, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(383, NULL, 478, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(384, NULL, 480, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(385, NULL, 481, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(386, NULL, 483, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(387, NULL, 484, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(388, NULL, 487, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(389, NULL, 488, 13, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(390, NULL, 489, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(391, NULL, 490, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(392, NULL, 492, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(393, NULL, 493, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(394, NULL, 494, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(395, NULL, 495, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(396, NULL, 496, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(397, NULL, 497, 11, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(398, NULL, 498, 12, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(399, NULL, 499, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(400, NULL, 501, 13, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(401, NULL, 502, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(402, NULL, 503, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(403, NULL, 504, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(404, NULL, 505, 14, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(405, NULL, 507, 12, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(406, NULL, 510, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(407, NULL, 511, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(408, NULL, 512, 14, 4, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(409, NULL, 514, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(410, NULL, 515, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(411, NULL, 516, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(412, NULL, 518, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(413, NULL, 520, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(414, NULL, 521, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(415, NULL, 522, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(416, NULL, 523, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(417, NULL, 524, 14, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(418, NULL, 525, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(419, NULL, 526, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(420, NULL, 528, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(421, NULL, 529, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(422, NULL, 530, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(423, NULL, 531, NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00'),
(424, NULL, 532, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(425, NULL, 533, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(426, NULL, 534, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(427, NULL, 535, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(428, NULL, 536, 16, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(429, NULL, 537, 5, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(430, NULL, 539, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(431, NULL, 540, 5, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(432, NULL, 541, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(433, NULL, 542, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(434, NULL, 543, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(435, NULL, 544, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(436, NULL, 545, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(437, NULL, 546, 3, 2, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(438, NULL, 547, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(439, NULL, 549, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(440, NULL, 550, 15, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(441, NULL, 553, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(442, NULL, 554, 14, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(443, NULL, 557, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(444, NULL, 558, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(445, NULL, 559, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(446, NULL, 561, 11, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(447, NULL, 562, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(448, NULL, 563, 12, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(449, NULL, 564, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(450, NULL, 568, 12, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(451, NULL, 569, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(452, NULL, 570, 3, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(453, NULL, 571, 5, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(454, NULL, 572, 15, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(455, NULL, 573, 3, 1, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(456, NULL, 574, 11, 3, 1, NULL, 1, NULL, '0000-00-00 00:00:00'),
(466, NULL, 1, 3, 5, 1, 1, 1, 0, '2022-04-18 00:00:00'),
(467, '2022-04-20', 9, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-27 00:00:00'),
(468, '2022-04-27', 11, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-27 00:00:00'),
(469, '2022-05-01', 5, NULL, NULL, NULL, NULL, NULL, 0, '2022-05-01 00:00:00'),
(470, NULL, 29, 4, 2, 1, 1, 1, 223344, '2022-05-24 00:00:00'),
(471, NULL, 57, 1, 1, 1, 1, 1, 0, '2022-05-24 00:00:00'),
(472, '2022-05-30', 445, 2, 1, 1, 1, 1, 0, '2022-05-30 00:00:00'),
(473, NULL, 33, 4, 3, 1, 2, 1, 0, '2022-05-30 00:00:00'),
(474, '2022-05-29', 393, 5, 2, 1, 2, 1, 0, '2022-05-30 00:00:00'),
(475, '2022-05-30', 477, 2, 2, 1, 1, 1, 0, '2022-05-30 00:00:00'),
(476, '2022-05-30', 477, 2, 3, 1, 1, 1, 0, '2022-05-30 00:00:00'),
(477, '2022-05-30', 477, 2, 3, 1, 1, 1, 0, '2022-05-30 00:00:00'),
(479, '2022-05-30', 477, 2, 2, 1, 1, 1, 0, '2022-05-30 20:19:58'),
(480, '2022-05-30', 477, 2, 2, 1, 1, 1, 0, '2022-05-30 20:20:51'),
(481, NULL, 229, 11, 2, 1, 1, 1, 0, '2022-06-14 14:48:02'),
(482, NULL, 509, 2, 2, 1, 1, 1, 0, '2022-06-14 14:48:51'),
(483, NULL, 177, 15, 3, 1, 1, 1, 0, '2022-06-14 18:05:52'),
(484, NULL, 205, 3, 2, 1, 1, 1, 0, '2022-06-28 12:47:24'),
(485, NULL, 205, 10, 6, 1, 2, 1, 0, '2022-06-28 12:48:58'),
(486, NULL, 72, 15, 5, 1, 1, 1, 0, '2022-07-29 11:03:50'),
(487, NULL, 72, 15, 5, 1, 1, 1, 0, '2022-07-29 11:03:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_retiro`
--

CREATE TABLE `tipos_retiro` (
  `id_tiposretiro` int(11) NOT NULL,
  `tipo_retiro` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_retiro` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_retiro`
--

INSERT INTO `tipos_retiro` (`id_tiposretiro`, `tipo_retiro`, `descripcion`, `is_retiro`) VALUES
(1, 'Por declaratoria de insubsistencia del nombramiento en los empleos de libre nombramiento y remoción', NULL, b'1'),
(2, 'Por declaratoria de insubsistencia del nombramiento, como consecuencia del resultado no satisfactorio en la evaluación del desempeño laboral de un empleado de carrera administrativa', NULL, b'1'),
(3, 'Por renuncia regularmente aceptada;', NULL, b'1'),
(4, 'Retiro por haber obtenido la pensión de jubilación o vejez', NULL, b'1'),
(5, 'Por invalidez absoluta', NULL, b'1'),
(6, 'Por edad de retiro forzoso', NULL, b'1'),
(7, 'Por destitución, como consecuencia de proceso disciplinario', NULL, b'1'),
(8, 'Por declaratoria de vacancia del empleo en el caso de abandono del mismo', NULL, b'1'),
(9, 'Por revocatoria del nombramiento por no acreditar los requisitos para el desempeño del empleo, de conformidad con el artículo 5° de la Ley 190 de 1995, y las normas que lo adicionen o modifiquen', NULL, b'1'),
(10, 'Por orden o decisión judicial', NULL, b'1'),
(11, 'Por supresión del empleo', NULL, b'1'),
(12, 'Por muerte', NULL, b'1'),
(13, 'Por las demás que determinen la Constitución Política y las leyes', NULL, b'1'),
(14, 'Traslado', NULL, b'0'),
(15, 'Licencia', NULL, b'0'),
(16, 'Terminación de encargo', NULL, b'0'),
(17, 'Otro', NULL, b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipodocumento` int(11) NOT NULL,
  `abreviacion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_documento` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `is_activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipodocumento`, `abreviacion`, `descripcion`, `tipo_documento`, `is_activo`) VALUES
(2, 'CC', NULL, 'Cédula de Ciudadanía', b'1'),
(3, 'CE', NULL, 'Cédula Extranjería', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sanguineo`
--

CREATE TABLE `tipo_sanguineo` (
  `id_rh` int(11) NOT NULL,
  `rh` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_sanguineo`
--

INSERT INTO `tipo_sanguineo` (`id_rh`, `rh`) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'B+'),
(4, 'B-'),
(5, 'AB+'),
(6, 'AB-'),
(7, 'O+'),
(8, 'O-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vinculacion`
--

CREATE TABLE `tipo_vinculacion` (
  `id_tipovinculacion` int(11) NOT NULL,
  `tipo_vinculacion` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_activa` bit(1) NOT NULL DEFAULT b'1',
  `fecha_upd` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_vinculacion`
--

INSERT INTO `tipo_vinculacion` (`id_tipovinculacion`, `tipo_vinculacion`, `descripcion`, `is_activa`, `fecha_upd`) VALUES
(1, 'Carrera administrativa', NULL, b'1', '2021-11-07 05:48:29'),
(2, 'Elección popular', NULL, b'1', '2021-11-07 05:48:29'),
(3, 'Electo por el consejo', NULL, b'1', '2021-11-07 05:48:29'),
(4, 'Libre nombramiento', NULL, b'1', '2021-11-07 05:48:30'),
(5, 'Provisionalidad', NULL, b'1', '2021-11-07 05:48:30'),
(6, 'Trabajador oficial', NULL, b'1', '2021-11-07 05:48:30'),
(7, 'T.Oficial', NULL, b'1', '2022-04-03 22:16:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_crea` date NOT NULL DEFAULT current_timestamp(),
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `password`, `fecha_crea`, `fecha_upd`, `nivel`) VALUES
(1, 'J@mundi', '204815fe1211bff62dade7ba90374d7a', '2022-04-15', '2022-04-15 19:48:53', 1),
(72, '1115066235', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 12:37:49', 2),
(73, '79760495', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 17:52:39', 2),
(74, '31445630', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 18:06:27', 1),
(75, '31532628', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 18:32:37', 2),
(76, '1053832518', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 19:15:35', 2),
(77, '59395795 ', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 22:35:59', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `victima_violencia`
--

CREATE TABLE `victima_violencia` (
  `id_victimaviolencia` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `victima_violencia`
--

INSERT INTO `victima_violencia` (`id_victimaviolencia`, `nombre`) VALUES
(1, 'SI'),
(2, 'NO'),
(3, 'SI, PERO NO DECLARO POR MIEDO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id_actividad`),
  ADD UNIQUE KEY `identificacion_UNIQUE` (`identificacion`);

--
-- Indices de la tabla `actividadesprogramadas_funcionario`
--
ALTER TABLE `actividadesprogramadas_funcionario`
  ADD PRIMARY KEY (`id_actividadprogramadasfuncionario`),
  ADD KEY `fk_actividadesp_funcionario_actividades_programadas1_idx` (`id_actividadprogramada`),
  ADD KEY `fk_actividadesp_funcionario_funcionarios1_idx` (`id_funcionario`);

--
-- Indices de la tabla `actividades_programadas`
--
ALTER TABLE `actividades_programadas`
  ADD PRIMARY KEY (`id_actividadprogramada`),
  ADD UNIQUE KEY `identificacion_UNIQUE` (`identificacion`);

--
-- Indices de la tabla `actividad_funcionario`
--
ALTER TABLE `actividad_funcionario`
  ADD PRIMARY KEY (`id_actividad_funcionario`),
  ADD KEY `fk_actividad_funcionario_actividad1_idx` (`id_actividad`),
  ADD KEY `fk_actividad_funcionario_funcionarios1_idx` (`id_funcionario`);

--
-- Indices de la tabla `arl`
--
ALTER TABLE `arl`
  ADD PRIMARY KEY (`id_arl`);

--
-- Indices de la tabla `caja_compensacion`
--
ALTER TABLE `caja_compensacion`
  ADD PRIMARY KEY (`id_cajacompensacion`);

--
-- Indices de la tabla `capacitaciones`
--
ALTER TABLE `capacitaciones`
  ADD PRIMARY KEY (`id_capacitacion`),
  ADD UNIQUE KEY `identificacion_UNIQUE` (`identificacion`);

--
-- Indices de la tabla `capacitacionesprogramadas_funcionario`
--
ALTER TABLE `capacitacionesprogramadas_funcionario`
  ADD PRIMARY KEY (`id_capacitacionprogramadasfuncionario`),
  ADD KEY `fk_capacitacionesp_funcionario_capacitaciones_programadas1_idx` (`id_capacitacionprogramada`),
  ADD KEY `fk_capacitacionesp_funcionario_funcionarios1_idx` (`id_funcionario`);

--
-- Indices de la tabla `capacitaciones_programadas`
--
ALTER TABLE `capacitaciones_programadas`
  ADD PRIMARY KEY (`id_capacitacionprogramada`),
  ADD UNIQUE KEY `identificacion_UNIQUE` (`identificacion`);

--
-- Indices de la tabla `capacitacion_funcionario`
--
ALTER TABLE `capacitacion_funcionario`
  ADD PRIMARY KEY (`id_capacitacion_funcionario`),
  ADD KEY `fk_capacitacion_funcionario_capacitacion1_idx` (`id_capacitacion`),
  ADD KEY `fk_capacitacion_funcionario_funcionarios1_idx` (`id_funcionario`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id_cargo`),
  ADD KEY `fk_denominacion_nivel_funcionario1_idx` (`id_nivelfuncionario`);

--
-- Indices de la tabla `codigo`
--
ALTER TABLE `codigo`
  ADD PRIMARY KEY (`id_codigo`),
  ADD KEY `fk_codigo_denominacion1_idx` (`id_cargo`);

--
-- Indices de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  ADD PRIMARY KEY (`id_dependencia`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`id_eps`);

--
-- Indices de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  ADD PRIMARY KEY (`id_estadocivil`);

--
-- Indices de la tabla `etnia`
--
ALTER TABLE `etnia`
  ADD PRIMARY KEY (`id_etnia`);

--
-- Indices de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`id_evaluacion`),
  ADD KEY `fk_evaluaciones_funcionarios1_idx` (`id_funcionario`);

--
-- Indices de la tabla `experiencia_previa`
--
ALTER TABLE `experiencia_previa`
  ADD PRIMARY KEY (`id_experienciaprevia`),
  ADD KEY `fk_experiencia_previa_funcionarios1_idx` (`id_funcionario`);

--
-- Indices de la tabla `fondo_cesantias`
--
ALTER TABLE `fondo_cesantias`
  ADD PRIMARY KEY (`id_fondocesantias`);

--
-- Indices de la tabla `fondo_pension`
--
ALTER TABLE `fondo_pension`
  ADD PRIMARY KEY (`id_fondopension`);

--
-- Indices de la tabla `formacion_academica`
--
ALTER TABLE `formacion_academica`
  ADD PRIMARY KEY (`id_formacionacademica`);

--
-- Indices de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD UNIQUE KEY `documento_UNIQUE` (`documento`),
  ADD KEY `fk_funcionarios_sede_idx` (`id_sede`),
  ADD KEY `fk_funcionarios_tipo_documento1_idx` (`tipo_documento`),
  ADD KEY `fk_funcionarios_etnia1_idx` (`id_etnia`),
  ADD KEY `fk_funcionarios_tipo_sanguineo1_idx` (`id_rh`),
  ADD KEY `fk_funcionarios_dependencias1_idx` (`id_dependencia`),
  ADD KEY `fk_funcionarios_tipo_vinculacion1_idx` (`id_tipovinculacion`),
  ADD KEY `fk_funcionarios_nivel_educativo1_idx` (`id_niveleducativo`),
  ADD KEY `fk_funcionarios_nivel_funcionario1_idx` (`id_nivelfuncionario`),
  ADD KEY `fk_funcionarios_victima_violencia1_idx` (`id_victimaviolencia`),
  ADD KEY `fk_funcionarios_codigo1_idx` (`id_codigo`),
  ADD KEY `fk_funcionarios_grado1_idx` (`id_grado`),
  ADD KEY `fk_funcionarios_cargos1_idx` (`id_cargo`),
  ADD KEY `fk_funcionario_municipio1_idx` (`id_municipio`),
  ADD KEY `fk_funcionarios_estado_civil1_idx` (`id_estadocivil`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id_grado`),
  ADD KEY `fk_grado_codigo1_idx` (`id_codigo`);

--
-- Indices de la tabla `grupo_objetivo`
--
ALTER TABLE `grupo_objetivo`
  ADD PRIMARY KEY (`id_grupoobjetivo`),
  ADD KEY `fk_capacitacion_gupoobjetivo1_idx` (`id_capacitacionprogramada`);

--
-- Indices de la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  ADD PRIMARY KEY (`id_incapacidad`),
  ADD KEY `fk_incapacidad_funcionarios1_idx` (`id_funcionario`);

--
-- Indices de la tabla `inspeccion`
--
ALTER TABLE `inspeccion`
  ADD PRIMARY KEY (`id_inspeccion`),
  ADD UNIQUE KEY `identificacion_UNIQUE` (`identificacion`),
  ADD KEY `fk_inspeccion_dependencias1_idx` (`id_dependencia`);

--
-- Indices de la tabla `logger`
--
ALTER TABLE `logger`
  ADD PRIMARY KEY (`id_logger`);

--
-- Indices de la tabla `matriz`
--
ALTER TABLE `matriz`
  ADD PRIMARY KEY (`id_matriz`),
  ADD KEY `fk_matriz_funcionarios1_idx` (`id_funcionario`);

--
-- Indices de la tabla `movilidad`
--
ALTER TABLE `movilidad`
  ADD PRIMARY KEY (`id_movilidad`),
  ADD KEY `fk_movilidad_funcionarios1_idx` (`id_funcionario`),
  ADD KEY `fk_movilidad_dependencias1_idx` (`id_dependencia`),
  ADD KEY `fk_movilidad_sede1_idx` (`id_sede`),
  ADD KEY `fk_movilidad_grado1_idx` (`id_grado`),
  ADD KEY `fk_movilidad_nivel1_idx` (`id_nivel`),
  ADD KEY `fk_movilidad_codigo1_idx` (`id_codigo`),
  ADD KEY `fk_movilidad_cargo1_idx` (`id_cargo`),
  ADD KEY ` fk_movilidad_tipo_vinculacion1_idx` (`id_tipovinculacion`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id_municipio`);

--
-- Indices de la tabla `nivel_educativo`
--
ALTER TABLE `nivel_educativo`
  ADD PRIMARY KEY (`id_niveleducativo`);

--
-- Indices de la tabla `nivel_funcionario`
--
ALTER TABLE `nivel_funcionario`
  ADD PRIMARY KEY (`id_nivelfuncionario`);

--
-- Indices de la tabla `nucleo_familiar`
--
ALTER TABLE `nucleo_familiar`
  ADD PRIMARY KEY (`id_nucleofamiliar`),
  ADD KEY `fk_nucleo_familiar_funcionarios1_idx` (`id_funcionario`),
  ADD KEY `fk_nucleo_familiar_parentesco1_idx` (`id_parentesco`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`idopcion`),
  ADD UNIQUE KEY `idopcion_UNIQUE` (`idopcion`);

--
-- Indices de la tabla `opciones_asignadas`
--
ALTER TABLE `opciones_asignadas`
  ADD PRIMARY KEY (`id_opcionesasg`);

--
-- Indices de la tabla `opcionpadre`
--
ALTER TABLE `opcionpadre`
  ADD PRIMARY KEY (`idopcionpadre`),
  ADD UNIQUE KEY `idopcionpadre_UNIQUE` (`idopcionpadre`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`id_parentesco`);

--
-- Indices de la tabla `procesos_disciplinarios`
--
ALTER TABLE `procesos_disciplinarios`
  ADD PRIMARY KEY (`id_procesosdisciplinarios`),
  ADD KEY `fk_procesos_disciplinarios_funcionarios1_idx` (`id_funcionario`);

--
-- Indices de la tabla `retiro`
--
ALTER TABLE `retiro`
  ADD PRIMARY KEY (`id_retiro`),
  ADD KEY `fk_retiro_funcionarios1_idx` (`id_funcionario`),
  ADD KEY `fk_retiro_tipo_retiro1_idx` (`id_causaretiro`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`),
  ADD UNIQUE KEY `sede_UNIQUE` (`sede`);

--
-- Indices de la tabla `seguridad_social`
--
ALTER TABLE `seguridad_social`
  ADD PRIMARY KEY (`id_seguridadsocial`),
  ADD KEY `fk_seguridad_social_funcionarios1_idx` (`id_funcionario`),
  ADD KEY `fk_seguridad_social_eps1_idx` (`id_eps`),
  ADD KEY `fk_seguridad_social_fondo_pension1_idx` (`id_fondopension`),
  ADD KEY `fk_seguridad_social_arl1_idx` (`id_arl`),
  ADD KEY `fk_seguridad_social_fondo_cesantias1_idx` (`id_fondocesantias`),
  ADD KEY `fk_seguridad_social_caja_compensacion1_idx` (`id_cajacompensacion`);

--
-- Indices de la tabla `tipos_retiro`
--
ALTER TABLE `tipos_retiro`
  ADD PRIMARY KEY (`id_tiposretiro`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id_tipodocumento`);

--
-- Indices de la tabla `tipo_sanguineo`
--
ALTER TABLE `tipo_sanguineo`
  ADD PRIMARY KEY (`id_rh`);

--
-- Indices de la tabla `tipo_vinculacion`
--
ALTER TABLE `tipo_vinculacion`
  ADD PRIMARY KEY (`id_tipovinculacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario_UNIQUE` (`usuario`);

--
-- Indices de la tabla `victima_violencia`
--
ALTER TABLE `victima_violencia`
  ADD PRIMARY KEY (`id_victimaviolencia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `actividadesprogramadas_funcionario`
--
ALTER TABLE `actividadesprogramadas_funcionario`
  MODIFY `id_actividadprogramadasfuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `actividades_programadas`
--
ALTER TABLE `actividades_programadas`
  MODIFY `id_actividadprogramada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `actividad_funcionario`
--
ALTER TABLE `actividad_funcionario`
  MODIFY `id_actividad_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `arl`
--
ALTER TABLE `arl`
  MODIFY `id_arl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `caja_compensacion`
--
ALTER TABLE `caja_compensacion`
  MODIFY `id_cajacompensacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `capacitaciones`
--
ALTER TABLE `capacitaciones`
  MODIFY `id_capacitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `capacitacionesprogramadas_funcionario`
--
ALTER TABLE `capacitacionesprogramadas_funcionario`
  MODIFY `id_capacitacionprogramadasfuncionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capacitaciones_programadas`
--
ALTER TABLE `capacitaciones_programadas`
  MODIFY `id_capacitacionprogramada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `capacitacion_funcionario`
--
ALTER TABLE `capacitacion_funcionario`
  MODIFY `id_capacitacion_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `codigo`
--
ALTER TABLE `codigo`
  MODIFY `id_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  MODIFY `id_dependencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `eps`
--
ALTER TABLE `eps`
  MODIFY `id_eps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  MODIFY `id_estadocivil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `etnia`
--
ALTER TABLE `etnia`
  MODIFY `id_etnia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `id_evaluacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2150;

--
-- AUTO_INCREMENT de la tabla `experiencia_previa`
--
ALTER TABLE `experiencia_previa`
  MODIFY `id_experienciaprevia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fondo_cesantias`
--
ALTER TABLE `fondo_cesantias`
  MODIFY `id_fondocesantias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fondo_pension`
--
ALTER TABLE `fondo_pension`
  MODIFY `id_fondopension` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `formacion_academica`
--
ALTER TABLE `formacion_academica`
  MODIFY `id_formacionacademica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=588;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id_grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `grupo_objetivo`
--
ALTER TABLE `grupo_objetivo`
  MODIFY `id_grupoobjetivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  MODIFY `id_incapacidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inspeccion`
--
ALTER TABLE `inspeccion`
  MODIFY `id_inspeccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `logger`
--
ALTER TABLE `logger`
  MODIFY `id_logger` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `matriz`
--
ALTER TABLE `matriz`
  MODIFY `id_matriz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `movilidad`
--
ALTER TABLE `movilidad`
  MODIFY `id_movilidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `nivel_educativo`
--
ALTER TABLE `nivel_educativo`
  MODIFY `id_niveleducativo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `nivel_funcionario`
--
ALTER TABLE `nivel_funcionario`
  MODIFY `id_nivelfuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `nucleo_familiar`
--
ALTER TABLE `nucleo_familiar`
  MODIFY `id_nucleofamiliar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `idopcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `opciones_asignadas`
--
ALTER TABLE `opciones_asignadas`
  MODIFY `id_opcionesasg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=799;

--
-- AUTO_INCREMENT de la tabla `opcionpadre`
--
ALTER TABLE `opcionpadre`
  MODIFY `idopcionpadre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `id_parentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `procesos_disciplinarios`
--
ALTER TABLE `procesos_disciplinarios`
  MODIFY `id_procesosdisciplinarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `retiro`
--
ALTER TABLE `retiro`
  MODIFY `id_retiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `seguridad_social`
--
ALTER TABLE `seguridad_social`
  MODIFY `id_seguridadsocial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=488;

--
-- AUTO_INCREMENT de la tabla `tipos_retiro`
--
ALTER TABLE `tipos_retiro`
  MODIFY `id_tiposretiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id_tipodocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_sanguineo`
--
ALTER TABLE `tipo_sanguineo`
  MODIFY `id_rh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipo_vinculacion`
--
ALTER TABLE `tipo_vinculacion`
  MODIFY `id_tipovinculacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `victima_violencia`
--
ALTER TABLE `victima_violencia`
  MODIFY `id_victimaviolencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD CONSTRAINT `fk_denominacion_nivel_funcionario1` FOREIGN KEY (`id_nivelfuncionario`) REFERENCES `nivel_funcionario` (`id_nivelfuncionario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `codigo`
--
ALTER TABLE `codigo`
  ADD CONSTRAINT `fk_codigo_denominacion1` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `experiencia_previa`
--
ALTER TABLE `experiencia_previa`
  ADD CONSTRAINT `fk_experiencia_previa_funcionarios1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `fk_funcionario_municipio1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_funcionarios_cargos1` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_funcionarios_codigo1` FOREIGN KEY (`id_codigo`) REFERENCES `codigo` (`id_codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_funcionarios_dependencias1` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_funcionarios_estado_civil1` FOREIGN KEY (`id_estadocivil`) REFERENCES `estado_civil` (`id_estadocivil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_funcionarios_etnia1` FOREIGN KEY (`id_etnia`) REFERENCES `etnia` (`id_etnia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_funcionarios_grado1` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_funcionarios_nivel_educativo1` FOREIGN KEY (`id_niveleducativo`) REFERENCES `nivel_educativo` (`id_niveleducativo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_funcionarios_nivel_funcionario1` FOREIGN KEY (`id_nivelfuncionario`) REFERENCES `nivel_funcionario` (`id_nivelfuncionario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_funcionarios_sede` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_funcionarios_tipo_sanguineo1` FOREIGN KEY (`id_rh`) REFERENCES `tipo_sanguineo` (`id_rh`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_funcionarios_tipo_vinculacion1` FOREIGN KEY (`id_tipovinculacion`) REFERENCES `tipo_vinculacion` (`id_tipovinculacion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_funcionarios_victima_violencia1` FOREIGN KEY (`id_victimaviolencia`) REFERENCES `victima_violencia` (`id_victimaviolencia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `grado`
--
ALTER TABLE `grado`
  ADD CONSTRAINT `fk_grado_codigo1` FOREIGN KEY (`id_codigo`) REFERENCES `codigo` (`id_codigo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  ADD CONSTRAINT `fk_incapacidad_funcionarios1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movilidad`
--
ALTER TABLE `movilidad`
  ADD CONSTRAINT ` fk_movilidad_tipo_vinculacion1` FOREIGN KEY (`id_tipovinculacion`) REFERENCES `tipo_vinculacion` (`id_tipovinculacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movilidad_cargo1` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movilidad_codigo1` FOREIGN KEY (`id_codigo`) REFERENCES `codigo` (`id_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movilidad_dependencias1` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movilidad_funcionarios1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movilidad_grado1` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movilidad_nivel1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel_funcionario` (`id_nivelfuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movilidad_sede1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nucleo_familiar`
--
ALTER TABLE `nucleo_familiar`
  ADD CONSTRAINT `fk_nucleo_familiar_funcionarios1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nucleo_familiar_parentesco1` FOREIGN KEY (`id_parentesco`) REFERENCES `parentesco` (`id_parentesco`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `procesos_disciplinarios`
--
ALTER TABLE `procesos_disciplinarios`
  ADD CONSTRAINT `fk_procesos_disciplinarios_funcionarios1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `retiro`
--
ALTER TABLE `retiro`
  ADD CONSTRAINT `fk_retiro_funcionarios1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `seguridad_social`
--
ALTER TABLE `seguridad_social`
  ADD CONSTRAINT `fk_seguridad_social_arl1` FOREIGN KEY (`id_arl`) REFERENCES `arl` (`id_arl`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seguridad_social_caja_compensacion1` FOREIGN KEY (`id_cajacompensacion`) REFERENCES `caja_compensacion` (`id_cajacompensacion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seguridad_social_eps1` FOREIGN KEY (`id_eps`) REFERENCES `eps` (`id_eps`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seguridad_social_fondo_cesantias1` FOREIGN KEY (`id_fondocesantias`) REFERENCES `fondo_cesantias` (`id_fondocesantias`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seguridad_social_fondo_pension1` FOREIGN KEY (`id_fondopension`) REFERENCES `fondo_pension` (`id_fondopension`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seguridad_social_funcionarios1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
