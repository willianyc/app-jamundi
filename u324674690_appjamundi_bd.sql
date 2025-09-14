-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-08-2025 a las 15:42:55
-- Versión del servidor: 10.11.10-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u324674690_appjamundi_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id_actividad` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `identificacion` varchar(45) DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `is_presencial` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `horas_formativas` varchar(45) DEFAULT NULL,
  `entidad_actividad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `calificacion` bit(1) DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `fecha_inicio_suspencion` date DEFAULT NULL,
  `fecha_final_suspencion` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id_actividad`, `nombre`, `identificacion`, `fecha_ini`, `fecha_fin`, `is_presencial`, `direccion`, `horas_formativas`, `entidad_actividad`, `estado`, `archivo`, `motivo`, `calificacion`, `consecutivo`, `cantidad`, `descripcion`, `observacion`, `fecha_inicio_suspencion`, `fecha_final_suspencion`) VALUES
(18, 'Charla Prevención acoso laboral y sexual y abuso de poder.', '2023-15', '2023-11-23', '2023-11-23', 'VIRTUAL', 'Meet', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', '', '', b'1', 15, 232, 'Charla Prevención acoso laboral y sexual y abuso de poder.', '', NULL, NULL),
(15, 'Activación Código de Integridad', '2023-12', '2023-03-17', '2023-06-15', 'PRESENCIAL', 'Sedes de la Administración Municipal', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', '', '', b'0', 12, 83, 'Activación Código de Integridad', '', NULL, NULL),
(16, 'Baúl de los malos hábitos', '2023-13', '2023-09-12', '2023-09-12', 'PRESENCIAL', 'Sedes de la Administración Municipal', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', 'views/archivos/actividades/CIRCULAR_ACTIVIDAD_BAÚL_DE_LOS_MALOS_HÁBITOS.1701197818_656637fa4970b.pdf', '', b'1', 13, 215, 'Baúl de los malos hábitos', '', NULL, NULL),
(17, 'Charla brecha pensional', '2023-14', '2023-04-27', '2023-04-27', 'PRESENCIAL', 'Salón Auxiliar Casa de la Cultura', 'undefined', 'Global seguros', 'REALIZADO', 'views/archivos/actividades/CIRCULAR_CHARLA_EDUCACION_FINANCIERA.1701198197_6566397518296.pdf', '', b'0', 14, 6, 'Charla brecha pensional', '', NULL, NULL),
(14, 'Conmemoración día de la Mujer', '2023-11', '2023-03-08', '2023-03-05', 'PRESENCIAL', 'Palacio Municipal', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', '', '', b'1', 11, 44, 'Conmemoración día de la Mujer', '', NULL, NULL),
(13, 'Taller Muros Mentales', '2023-10', '2023-04-04', '2023-04-04', 'PRESENCIAL', 'Biblioteca Municipal Abel Eli Guerrero', 'undefined', 'Adolfo Vásquez Orozco', 'REALIZADO', 'views/archivos/actividades/Asistencia_Muros_Mentales.1681163839_6434863f9c035.pdf', '', b'0', 10, 8, 'Desarrollar actividades de que promuevan el bienestar espiritual y emocional', '', NULL, NULL),
(19, 'Concierto Banda Departamental', '2023-16', '2023-10-05', '2023-10-05', 'PRESENCIAL', 'Auditorio Casa de la Cultura', 'undefined', 'Secretaría de Cultura', 'REALIZADO', 'views/archivos/actividades/CIRCULAR_INVITACION_ACTIVIDAD_ARTISTICA_Y_CULTURAL.1701198427_65663a5bce878.pdf', '', b'0', 16, 15, 'Concierto Banda Departamental', '', NULL, NULL),
(20, 'Conmemoración día de la Madre', '2023-17', '2023-05-12', '2023-05-12', 'PRESENCIAL', 'Auditorio Casa de la Cultura', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', 'views/archivos/actividades/CIRCULAR_DIA_DE_LA_MADRE.1701199519_65663e9f78df8.pdf', '', b'1', 17, 30, 'Conmemoración día de la Madre', '', NULL, NULL),
(21, 'Conmemoración día del Padre', '2023-18', '2023-06-23', '2023-06-23', 'PRESENCIAL', 'Palacio Municipal', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', 'views/archivos/actividades/circular_actividades_día_del_padre.1701199736_65663f7881b01.pdf', '', b'1', 18, 8, 'Conmemoración día del Padre', '', NULL, NULL),
(22, 'Conmemoración Día del Trabajo', '2023-19', '2023-05-01', '2023-05-01', 'VIRTUAL', 'Correo eletrónico', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', 'views/archivos/actividades/CONMEMORACIÓN_DÍA_DEL_TRABAJO.1701200038_656640a6a2833.pdf', '', b'1', 19, 534, 'Conmemoración Día del Trabajo', '', NULL, NULL),
(23, 'Crucigrama de Valores', '2023-20', '2023-06-27', '2023-06-27', 'VIRTUAL', 'Educaplay', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', 'views/archivos/actividades/Circular_día_del_servidor_público.1701201694_6566471e90700.pdf', '', b'1', 20, 59, 'Crucigrama de Valores', '', NULL, NULL),
(24, 'Feria Educativa Institucional', '2023-21', '2023-05-26', '2023-06-26', 'PRESENCIAL', 'Palacio Municipal', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', 'views/archivos/actividades/CIRCULAR_INCRIPCIONES_I_FERIA_EDUCATIVA_INSTITUCIONAL.1701201844_656647b4898cf.pdf', '', b'0', 21, 23, 'Feria Educativa Institucional', '', NULL, NULL),
(25, 'Lego Empresarial', '2023-22', '2023-08-10', '2023-08-10', 'PRESENCIAL', 'Linci San Pedro', 'undefined', 'Comfenalco Valle', 'REALIZADO', 'views/archivos/actividades/CIRCULAR_ACTIVIDAD_LEGO_EMPRESARIAL.1701201938_65664812b1dba.pdf', '', b'0', 22, 13, 'Lego Empresarial', '', NULL, NULL),
(26, 'Medición Clima Laboral', '2023-23', '2023-07-04', '2023-08-17', 'VIRTUAL', 'Formulario Google', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', 'views/archivos/actividades/Circular_Clima.1701202073_656648990f7ec.pdf', '', b'1', 23, 183, 'Medición Clima Laboral', '', NULL, NULL),
(27, 'Pausa cultural al ritmo del buen servicio', '2023-24', '2023-10-19', '2023-10-19', 'PRESENCIAL', 'Secretaría de Salud', 'undefined', 'Comfenalco Valle', 'REALIZADO', 'views/archivos/actividades/CIRCULAR_INVITACIÓN_PAUSA_CULTURAL.1701202170_656648fa8c241.pdf', '', b'1', 24, 23, 'Pausa cultural al ritmo del buen servicio', '', NULL, NULL),
(28, 'Pausa cultural manejo del estrés ', '2023-25', '2023-02-17', '2023-02-17', 'PRESENCIAL', 'Cañadulce', 'undefined', 'Comfenalco Valle', 'REALIZADO', 'views/archivos/actividades/INVITACIÓN_PAUSA_CULTURAL_MANEJO_DEL_ESTRÉS_E_INTELIGENCIA_EMOCIONAL.1701204221_656650fd2010b.pdf', '', b'1', 25, 32, 'Pausa cultural manejo del estrés ', '', NULL, NULL),
(29, 'Pedagogía del código de integridad', '2023-26', '2023-07-17', '2023-07-19', 'PRESENCIAL', 'Sedes de la Administración Municipal', 'undefined', 'Secretaría de Gestión Institucional', 'REALIZADO', '', '', b'1', 26, 225, 'Pedagogía del código de integridad', '', NULL, NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `actividadesprogramadas_funcionario`
--

INSERT INTO `actividadesprogramadas_funcionario` (`id_actividadprogramadasfuncionario`, `id_funcionario`, `id_actividadprogramada`, `fecha_asignacion`, `asistencia`) VALUES
(17, 332, 3, '2023-01-19', NULL),
(16, 260, 3, '2023-01-19', NULL),
(15, 576, 3, '2023-01-19', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades_programadas`
--

CREATE TABLE `actividades_programadas` (
  `id_actividadprogramada` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `identificacion` varchar(45) DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `is_presencial` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `recursos` varchar(45) DEFAULT NULL,
  `entidad_actividad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'PENDIENTE',
  `archivo` varchar(255) DEFAULT NULL,
  `calificacion` bit(1) DEFAULT NULL,
  `ciclo` varchar(45) DEFAULT NULL,
  `valor_total` int(11) DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `fecha_inicio_suspencion` date DEFAULT NULL,
  `fecha_final_suspencion` date DEFAULT NULL,
  `fecha_` date DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `tiempo_gen` datetime NOT NULL DEFAULT current_timestamp(),
  `motivo` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `actividades_programadas`
--

INSERT INTO `actividades_programadas` (`id_actividadprogramada`, `nombre`, `identificacion`, `fecha_ini`, `fecha_fin`, `is_presencial`, `direccion`, `recursos`, `entidad_actividad`, `estado`, `archivo`, `calificacion`, `ciclo`, `valor_total`, `observacion`, `fecha_inicio_suspencion`, `fecha_final_suspencion`, `fecha_`, `consecutivo`, `tiempo_gen`, `motivo`) VALUES
(1, 'fghfg', '2023-1', '2023-01-16', '2023-01-16', 'PRESENCIAL', 'ghg', 'FINANCIERO', 'gjgh', 'CANCELADO', '', NULL, 'PLANEAR', NULL, 'Trazabiliad', NULL, NULL, '2023-01-17', 1, '2023-01-16 15:53:09', 'Trazabiliad'),
(2, 'fsdf', '2023-2', '2023-01-16', '2023-01-16', 'PRESENCIAL', 'fds', 'ADMINISTRATIVO', 'dfs', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 2, '2023-01-16 16:33:54', NULL),
(3, 'fsdfds', '2023-3', '2023-01-19', '2023-01-19', 'PRESENCIAL', '2344324', 'FINANCIERO', '4324324', 'REALIZADO', '', NULL, 'HACER', 5435, '', NULL, NULL, '2023-01-18', 3, '2023-01-19 10:32:07', ''),
(4, 'prueba 4', '2023-4', '2023-03-07', '2023-03-07', 'PRESENCIAL', 'Parque principal', 'ADMINISTRATIVO', 'SSST', 'REALIZADO', '', NULL, 'PLANEAR', 0, 'SE CAMBIO.', NULL, NULL, NULL, 4, '2023-03-07 19:19:52', 'SE CAMBIO.'),
(5, 'Evaluación Inicial', '2023-5', '2023-12-01', '2023-04-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Profesional SST especialista ', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 5, '2023-04-10 15:02:38', NULL),
(6, 'Publicación y Socialización de la Política de SST y Objetivo', '2023-6', '2023-02-01', '2023-03-09', 'MIXTA', 'Todas las sedes  ', 'ADMINISTRATIVO', 'Equipo SST', 'REALIZADO', '', NULL, 'PLANEAR', 0, 'mediante acto administrativo Resolución 030 del 24 febrero del 2023, por medio del cual se adopta actualización realizada a la Política y los objetivos de Seguridad salud en el trabajo de la Alcaldía Municipal, los cuales enmarcan los principios, el compromiso gerencial y establece el marco de referencia para promover la mejora continua en las condiciones de salud y seguridad en los centros de trabajo de la Institución. la cual se divulgo a los correos de las dependencias, funcionarios, por correspondencia SISNET, carteleras y en las secciones de reinduccion e induccion.  ', NULL, NULL, NULL, 6, '2023-04-10 15:04:20', 'mediante acto administrativo Resolución 030 del 24 febrero del 2023, por medio del cual se adopta actualización realizada a la Política y los objetivos de Seguridad salud en el trabajo de la Alcaldía Municipal, los cuales enmarcan los principios, el compromiso gerencial y establece el marco de referencia para promover la mejora continua en las condiciones de salud y seguridad en los centros de trabajo de la Institución. la cual se divulgo a los correos de las dependencias, funcionarios, por correspondencia SISNET, carteleras y en las secciones de reinduccion e induccion.  '),
(7, 'Actualización  Matriz de identificación de peligros y valoración de los riesgos', '2023-7', '2023-08-01', '2023-08-30', 'MIXTA', 'Todas las Sedes', 'ADMINISTRATIVO', 'Profesional en SST , COPASST y ARL', 'SUSPENDIDO', '', NULL, 'PLANEAR', 0, 'Actividad que se programo con asesor de la ARL, de lo que se ha realizado visitas en campo, queda pendiente terminar visitas e informe para el mes de noviembre.', '2023-11-08', '2023-11-30', NULL, 7, '2023-04-10 15:08:40', 'Actividad que se programo con asesor de la ARL, de lo que se ha realizado visitas en campo, queda pendiente terminar visitas e informe para el mes de noviembre.'),
(8, 'Documentación de la designación del  responsable del Sistema de Gestión de Seguridad y Salud en el Trabajo, con la respectiva asignación de responsabilidades', '2023-8', '2023-01-01', '2023-01-31', 'MIXTA', 'Todas las Sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 8, '2023-04-10 15:16:49', NULL),
(9, 'Documentación de  las responsabilidades específicas en el Sistema de Gestión de la Seguridad y Salud en el Trabajo a todos los niveles de la Institución', '2023-9', '2023-02-01', '2023-02-28', 'MIXTA', 'todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 9, '2023-04-10 15:18:16', NULL),
(10, 'Solicitar al responsable del SG-SST (SIG)  certificado de aprobación del curso virtual de cincuenta (50) horas en Seguridad y Salud en el Trabajo', '2023-10', '2023-01-02', '2023-01-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 10, '2023-04-10 15:19:40', NULL),
(11, 'Actualización de la matriz de requisitos legales', '2023-11', '2023-03-01', '2023-03-31', 'VIRTUAL', 'Palacio municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 11, '2023-04-10 15:25:03', NULL),
(12, 'Actualización de la matriz de requisitos legales', '2023-12', '2023-06-01', '2023-06-30', 'VIRTUAL', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 12, '2023-04-10 15:26:53', NULL),
(13, 'Actualización de la matriz de requisitos legales', '2023-13', '2023-09-01', '2023-12-31', 'VIRTUAL', 'Palacio Municipal ', 'ADMINISTRATIVO', 'equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 13, '2023-04-10 15:28:02', NULL),
(14, 'Actualización de la matriz de requisitos legales', '2023-14', '2023-12-01', '2023-12-31', 'VIRTUAL', 'Palacio Municipal ', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 14, '2023-04-10 15:29:39', NULL),
(15, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-15', '2023-01-01', '2023-01-31', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 15, '2023-04-10 15:32:09', NULL),
(16, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-16', '2023-02-01', '2023-02-28', 'MIXTA', 'Todas las Sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 16, '2023-04-10 15:35:32', NULL),
(17, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-17', '2023-03-01', '2023-03-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 17, '2023-04-10 15:40:11', NULL),
(18, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-18', '2023-04-01', '2023-04-30', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 18, '2023-04-10 15:45:14', NULL),
(19, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-19', '2023-05-01', '2023-05-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 19, '2023-04-10 16:12:55', NULL),
(20, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-20', '2023-06-01', '2023-06-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, '', NULL, NULL, NULL, 20, '2023-04-10 16:15:07', ''),
(21, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-21', '2023-07-01', '2023-07-30', 'MIXTA', 'Palacio municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, '', NULL, NULL, NULL, 21, '2023-04-10 16:25:13', ''),
(22, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-22', '2023-08-01', '2023-08-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 22, '2023-04-10 16:30:15', NULL),
(23, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-23', '2023-09-01', '2023-09-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 23, '2023-04-10 16:32:43', NULL),
(24, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-24', '2023-10-01', '2023-10-31', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 24, '2023-04-10 16:34:18', NULL),
(25, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-25', '2023-11-01', '2023-11-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 25, '2023-04-10 16:35:22', NULL),
(26, 'Seguimiento al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-26', '2023-12-01', '2023-12-31', 'PRESENCIAL', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 26, '2023-04-10 16:39:12', NULL),
(27, 'Realizar la capacitación al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-27', '2023-02-02', '2023-02-28', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'REALIZADO', '', NULL, 'PLANEAR', 0, 'Se realizo capacitación en seguridad vial a los integrantes del Comite Paritario de Seguridad y Salud en el Trabajo ya que requieren competencias al ser comite integrado con el Comite de Seguridad Vial. ', NULL, NULL, NULL, 27, '2023-04-10 16:43:09', 'Se realizo capacitación en seguridad vial a los integrantes del Comite Paritario de Seguridad y Salud en el Trabajo ya que requieren competencias al ser comite integrado con el Comite de Seguridad Vial. '),
(28, 'Realizar la capacitación al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-28', '2023-07-01', '2023-07-31', 'MIXTA', 'Todos las dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 28, '2023-04-10 16:53:05', NULL),
(29, 'Realizar la capacitación al Comité Paritario de Seguridad y Salud en el Trabajo', '2023-29', '2023-10-01', '2023-10-30', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 29, '2023-04-10 16:55:44', NULL),
(30, 'Seguimiento al Comité de convivencia laboral', '2023-30', '2023-02-01', '2023-02-28', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 30, '2023-04-10 17:04:04', NULL),
(31, 'Seguimiento al Comité de convivencia laboral', '2023-31', '2023-06-01', '2023-06-30', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 31, '2023-04-10 17:05:09', NULL),
(32, 'Seguimiento al Comité de convivencia laboral', '2023-32', '2023-09-01', '2023-09-30', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 32, '2023-04-10 17:05:59', NULL),
(33, 'Seguimiento al Comité de convivencia laboral', '2023-33', '2023-12-01', '2023-12-31', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 33, '2023-04-10 17:06:46', NULL),
(34, 'Capacitar al Comité de Convivencia Laboral', '2023-34', '2023-04-03', '2023-04-30', 'MIXTA', 'Todas as sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 34, '2023-04-10 17:08:36', NULL),
(35, 'Capacitar al Comité de Convivencia Laboral', '2023-35', '2023-07-03', '2023-07-31', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 35, '2023-04-10 17:10:32', NULL),
(36, 'Capacitar al Comité de Convivencia Laboral', '2023-36', '2023-10-02', '2023-10-31', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 36, '2023-04-10 17:12:52', NULL),
(37, 'Ejecutar el programa de Capacitación y entrenamiento de SST', '2023-37', '2023-02-01', '2023-04-30', 'MIXTA', 'Todas sedes', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 37, '2023-04-10 19:09:39', NULL),
(38, 'Registro anual donde se evidencie que las personas con responsabilidades en el SG-SST realizaron la rendición de cuenta sobre su desempeño', '2023-38', '2023-12-04', '2023-12-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 38, '2023-04-10 19:11:49', NULL),
(39, 'Implementación el procedimiento de gestión del cambio', '2023-39', '2023-05-01', '2023-05-30', 'MIXTA', 'Todas las dependencias y sedes', 'ADMINISTRATIVO', 'Equipo SST y Equipo Calidad', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 39, '2023-04-10 19:13:31', NULL),
(40, 'Actualizarlos procedimientos, instructivos, formatos, fichas protocolos para control de riesgos', '2023-40', '2023-09-01', '2023-09-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 40, '2023-04-10 19:15:00', NULL),
(41, 'Ejecutar el programa de inspección', '2023-41', '2023-05-01', '2023-05-31', 'PRESENCIAL', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 41, '2023-04-10 19:18:11', NULL),
(42, 'Implementar y divulgar los mecanismos para la comunicación, autorreporte en el sistema de Gestión SST', '2023-42', '2023-02-01', '2023-02-28', 'MIXTA', 'Todas las sedes ', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 42, '2023-04-10 19:22:45', NULL),
(43, 'Ejecutar el procedimiento del Sistema de Gestión de la Seguridad y Salud en el Trabajo', '2023-43', '2023-03-01', '2023-03-31', 'MIXTA', 'Palacio Municipal ', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 43, '2023-04-10 19:25:15', NULL),
(44, 'Realizar de Exámenes Periódicos y retiro  ocupacionales a los funcionarios', '2023-44', '2023-08-01', '2023-08-31', 'PRESENCIAL', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, '', NULL, NULL, NULL, 44, '2023-04-10 19:28:16', ''),
(45, 'Elaborar la caracterización de las condiciones de salud', '2023-45', '2023-12-01', '2023-12-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 45, '2023-04-10 19:30:55', NULL),
(46, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-46', '2023-01-02', '2023-01-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 46, '2023-04-10 19:34:26', NULL),
(47, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-47', '2023-02-02', '2023-02-28', 'MIXTA', 'Palacio Municipal ', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 47, '2023-04-10 19:36:07', NULL),
(48, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-48', '2023-03-01', '2023-03-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 48, '2023-04-10 19:37:36', NULL),
(49, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-49', '2023-04-02', '2023-04-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 49, '2023-04-10 19:38:46', NULL),
(50, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-50', '2023-05-01', '2023-05-30', 'MIXTA', 'Palacio Municipal ', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 50, '2023-04-10 19:43:45', NULL),
(51, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-51', '2023-06-01', '2023-06-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 51, '2023-04-10 19:45:25', NULL),
(52, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-52', '2023-07-03', '2023-07-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 52, '2023-04-10 19:47:49', NULL),
(53, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-53', '2023-08-01', '2023-08-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 53, '2023-04-10 19:49:21', NULL),
(54, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-54', '2023-09-03', '2023-09-01', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 54, '2023-04-10 19:52:17', NULL),
(55, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-55', '2023-10-01', '2023-10-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 55, '2023-04-10 19:55:28', NULL),
(56, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-56', '2023-11-01', '2023-11-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 56, '2023-04-10 19:57:59', NULL),
(57, 'Registro, reporte e investigación de las enfermedades laborales, los incidentes y accidentes del trabajo', '2023-57', '2023-12-01', '2023-12-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 57, '2023-04-10 19:59:27', NULL),
(58, 'Elaborar la descripción socio-demográfica de los trabajadores', '2023-58', '2023-08-01', '2023-08-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Secretaría Gestión Institucional', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 58, '2023-04-10 20:08:12', NULL),
(59, 'Realizar la evaluación y análisis de las estadísticas sobre la salud de los trabajadores tanto de origen laboral como común', '2023-59', '2023-03-01', '2023-03-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST, medico laboral y arl', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 59, '2023-04-10 21:50:38', NULL),
(60, 'Realizar la evaluación y análisis de las estadísticas sobre la salud de los trabajadores tanto de origen laboral como común', '2023-60', '2023-06-01', '2023-06-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST, medico laboral y ARL', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 60, '2023-04-10 21:51:45', NULL),
(61, 'Realizar la evaluación y análisis de las estadísticas sobre la salud de los trabajadores tanto de origen laboral como común', '2023-61', '2023-09-01', '2023-09-30', 'MIXTA', 'Palacio municipal', 'ADMINISTRATIVO', 'Equipo SST, medico laboral y ARL', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 61, '2023-04-10 21:52:44', NULL),
(62, 'Realizar la evaluación y análisis de las estadísticas sobre la salud de los trabajadores tanto de origen laboral como común', '2023-62', '2023-12-01', '2023-12-31', 'MIXTA', 'Palacio municipal', 'ADMINISTRATIVO', 'Equipo SST, medico laboral y ARL', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 62, '2023-04-10 21:53:54', NULL),
(63, 'Ejecutar el programa de estilo de vida saludable, incluyendo campañas específicas tendientes a la prevención y control, de la farmacodependencia, el alcoholismo y el tabaquismo, entre otros', '2023-63', '2023-03-01', '2023-03-31', 'MIXTA', 'Todas las dependencias y sedes', 'ADMINISTRATIVO', 'Equipo SST, medico laboral  y ARL', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 63, '2023-04-10 21:56:06', NULL),
(64, 'Implementación y seguimiento al plan estratégico de seguridad vial', '2023-64', '2023-03-01', '2023-03-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'equipo SST, comite del PESV', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 64, '2023-04-10 21:57:27', NULL),
(65, 'Implementar el programa para riesgo químico', '2023-65', '2023-10-01', '2023-10-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'profesional SST y ARL', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 65, '2023-04-10 21:59:24', NULL),
(66, 'Ejecutar actividades tendientes al cuidado ambiental y manejo de residuos', '2023-66', '2023-04-03', '2023-04-30', 'MIXTA', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 66, '2023-04-10 22:00:48', NULL),
(67, 'Ejecutar actividades tendientes al cuidado ambiental y manejo de residuos', '2023-67', '2023-08-01', '2023-08-31', 'MIXTA', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 67, '2023-04-10 22:03:23', NULL),
(68, 'Ejecutar actividades tendientes al cuidado ambiental y manejo de residuos', '2023-68', '2023-11-01', '2023-11-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 68, '2023-04-10 22:04:16', NULL),
(69, 'Implementar el programa de riesgo para trabajos en alturas', '2023-69', '2023-03-01', '2023-03-31', 'MIXTA', 'Palacio Municipal, infraestructura fisica', 'ADMINISTRATIVO', 'Profesional SST, ARL', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 69, '2023-04-10 22:07:22', NULL),
(70, 'Implementación actividades de prevención y control para trabajos de alto riesgo ( Espacios confinados, eléctricos, maquinaria pesada)', '2023-70', '2023-10-01', '2023-10-31', 'MIXTA', 'Palacio Municipal, Secretaria Infraestructura', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, NULL, NULL, NULL, NULL, 70, '2023-04-10 22:08:42', NULL),
(71, 'Ejecutar programa o protocolo de riesgo publico', '2023-71', '2023-05-01', '2023-05-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'profesional SST y ARL', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 71, '2023-04-10 22:10:16', NULL),
(72, 'Realizar registros de ausentismo por enfermedad común y cuando se presente por enfermedad laboral y accidentes de trabajo', '2023-72', '2023-07-01', '2023-07-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 72, '2023-04-10 22:11:57', NULL),
(73, 'Realizar registros de ausentismo por enfermedad común y cuando se presente por enfermedad laboral y accidentes de trabajo', '2023-73', '2023-12-01', '2023-12-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 73, '2023-04-10 22:13:12', NULL),
(74, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-74', '2023-01-01', '2023-01-31', 'MIXTA', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 74, '2023-04-10 22:16:45', NULL),
(75, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-75', '2023-02-01', '2023-02-28', 'PRESENCIAL', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 75, '2023-04-10 22:21:55', NULL),
(76, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-76', '2023-03-01', '2023-03-31', 'MIXTA', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 76, '2023-04-10 22:22:49', NULL),
(77, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-77', '2023-04-01', '2023-04-30', 'PRESENCIAL', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 77, '2023-04-10 22:23:30', NULL),
(78, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-78', '2023-05-01', '2023-05-31', 'MIXTA', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 78, '2023-04-10 22:24:16', NULL),
(79, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-79', '2023-06-01', '2023-06-30', 'PRESENCIAL', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 79, '2023-04-10 22:25:05', NULL),
(80, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-80', '2023-07-03', '2023-07-31', 'PRESENCIAL', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 80, '2023-04-10 22:26:05', NULL),
(81, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-81', '2023-08-01', '2023-08-30', 'PRESENCIAL', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 81, '2023-04-10 22:27:10', NULL),
(82, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-82', '2023-09-01', '2023-09-30', 'PRESENCIAL', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 82, '2023-04-10 22:34:05', NULL),
(83, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-83', '2023-10-02', '2023-10-31', 'PRESENCIAL', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 83, '2023-04-10 22:34:59', NULL),
(84, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-84', '2023-11-01', '2023-11-30', 'PRESENCIAL', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 84, '2023-04-10 22:35:38', NULL),
(85, 'Realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos,  con la participación del COPASST', '2023-85', '2023-12-31', '2023-12-31', 'PRESENCIAL', 'Todas las sedes y dependencias ', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 85, '2023-04-10 22:36:28', NULL),
(86, 'Hacer seguimiento al plan de mantenimiento periódico de instalaciones, equipos, máquinas, herramientas de la entidad', '2023-86', '2023-05-01', '2023-05-30', 'PRESENCIAL', 'Secretaria de infraestructura', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 86, '2023-04-10 22:47:22', NULL),
(87, 'Realizar inspecciones de seguridad de extintores y redes contra incendio con participación del COPASST', '2023-87', '2023-11-01', '2023-11-30', 'PRESENCIAL', 'todas las sedes', 'ADMINISTRATIVO', 'Equipo sst, copasst y brigada', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 87, '2023-04-10 22:52:41', NULL),
(88, 'Realizar inspecciones de seguridad elementos de primeros auxilios con participación del COPASST', '2023-88', '2023-03-01', '2023-03-30', 'PRESENCIAL', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST, copasst y brigada', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 88, '2023-04-10 22:54:02', NULL),
(89, 'Realizar inspecciones de seguridad elementos de primeros auxilios con participación del COPASST', '2023-89', '2023-07-03', '2023-07-31', 'PRESENCIAL', 'Todas las sedes ', 'ADMINISTRATIVO', 'Equipo SST, Copasst, brigada', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 89, '2023-04-10 22:55:07', NULL),
(90, 'Realizar inspecciones de seguridad elementos de primeros auxilios con participación del COPASST', '2023-90', '2023-10-01', '2023-10-31', 'PRESENCIAL', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST, Copasst, brigada', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 90, '2023-04-10 22:56:06', NULL),
(91, 'Realizar inspecciones de seguridad señalización y demarcaciones con participación del COPASST', '2023-91', '2023-09-01', '2023-09-30', 'PRESENCIAL', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST, Copasst', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 91, '2023-04-10 22:57:15', NULL),
(92, 'Realizar inspecciones y entregas de elementos de protección personal. Con la participacion del COPASST', '2023-92', '2023-03-01', '2023-03-31', 'PRESENCIAL', 'Todas las dependencias ', 'ADMINISTRATIVO', 'Equipo SST y Copasst', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 92, '2023-04-10 22:58:49', NULL),
(93, 'Realizar inspecciones y entregas de elementos de protección personal. Con la participacion del COPASST', '2023-93', '2023-06-01', '2023-06-30', 'PRESENCIAL', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST y copasst', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 93, '2023-04-10 23:00:00', NULL),
(94, 'Realizar inspecciones y entregas de elementos de protección personal. Con la participacion del COPASST', '2023-94', '2023-08-01', '2023-08-31', 'PRESENCIAL', 'Todas las sedes ', 'ADMINISTRATIVO', 'equipo SST y copasst', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 94, '2023-04-10 23:16:39', NULL),
(95, 'Realizar inspecciones y entregas de elementos de protección personal. Con la participacion del COPASST', '2023-95', '2023-11-01', '2023-12-31', 'PRESENCIAL', 'Todas las sedes', 'ADMINISTRATIVO', 'Equipo SST y Copasst', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 95, '2023-04-10 23:19:44', NULL),
(96, 'Realizar la semana de la salud', '2023-96', '2023-11-01', '2023-11-30', 'PRESENCIAL', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 96, '2023-04-11 13:25:22', NULL),
(97, 'Actualizar el plan de emergencia e implementacion de las medidas', '2023-97', '2023-04-03', '2023-04-30', 'MIXTA', 'Todas las sedes', 'ADMINISTRATIVO', 'Profesional SST y ARL', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 97, '2023-04-11 13:26:39', NULL),
(98, 'Capacitar  a las Brigadas de Emergencias', '2023-98', '2023-02-01', '2023-02-28', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'profesional SST y Equipo SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 98, '2023-04-11 13:28:03', NULL),
(99, 'Dotar a las  Brigadas de Emergencias', '2023-99', '2023-09-01', '2023-09-30', 'PRESENCIAL', 'Palacio Municipal', 'FINANCIERO', 'Profesional SST', 'PENDIENTE', '', NULL, 'HACER', 10000000, '', NULL, NULL, NULL, 99, '2023-04-11 13:29:22', ''),
(100, 'Recarga y mantenimiento de extintores', '2023-100', '2023-11-01', '2023-11-30', 'PRESENCIAL', 'Palacio Municipal', 'FINANCIERO', 'Equipo contratación con apoyo SST', 'PENDIENTE', '', NULL, 'HACER', 10000000, NULL, NULL, NULL, NULL, 100, '2023-04-11 13:31:12', NULL),
(101, 'Análisis de puestos de trabajo, evaluaciones higiénicas e implementacioin medidas de control.', '2023-101', '2023-02-01', '2023-02-28', 'PRESENCIAL', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST, ARL y Proveedeor del servicio', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 101, '2023-04-11 13:35:07', NULL),
(102, 'Analisis de puestos de trabajo, evaluaciones higienicas e implementacioin medidas de control.', '2023-102', '2023-04-03', '2023-04-30', 'PRESENCIAL', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST, ARL y proveedor del servicio', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 102, '2023-04-11 13:36:35', NULL),
(103, 'Analisis de puestos de trabajo, evaluaciones higienicas e implementacioin medidas de control.', '2023-103', '2023-06-01', '2023-06-30', 'PRESENCIAL', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST, ARL y Proveedor de servicio', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 103, '2023-04-11 13:38:37', NULL),
(104, 'Análisis de puestos de trabajo, evaluaciones higienicas e implementacion medidas de control.', '2023-104', '2023-08-01', '2023-08-31', 'PRESENCIAL', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST ARL y proveedor del servicio.', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 104, '2023-04-11 13:46:27', NULL),
(105, 'Analisis de puestos de trabajo, evaluaciones higienicas e implementacioin medidas de control.', '2023-105', '2023-10-02', '2023-10-31', 'PRESENCIAL', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST, ARL y proveedor de servicio. ', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 105, '2023-04-11 13:47:33', NULL),
(106, 'Análisis de puestos de trabajo, evaluaciones higiénicas e implementacioin medidas de control.', '2023-106', '2023-12-01', '2023-12-31', 'PRESENCIAL', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST, ARL y proveedor del servicio. ', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 106, '2023-04-11 13:54:27', NULL),
(107, 'Compra , entrega e inspecciones de EPP', '2023-107', '2023-04-03', '2023-04-30', 'PRESENCIAL', 'Palacio Municipal', 'FINANCIERO', 'Equipo contratación con apoyo SST', 'PENDIENTE', '', NULL, 'HACER', 65000000, NULL, NULL, NULL, NULL, 107, '2023-04-11 13:57:38', NULL),
(108, 'Compra , entrega e inspecciones de EPP', '2023-108', '2023-08-01', '2023-08-31', 'PRESENCIAL', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo contratación con apoyo de SST', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 108, '2023-04-11 13:59:29', NULL),
(109, 'Implementación de medidas de control y preventivas para riesgo psicosocial', '2023-109', '2023-09-01', '2023-09-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'equipo sst, bienestar y psicologa ', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 109, '2023-04-11 14:03:22', NULL),
(110, 'Realizar simulacros de emergencia', '2023-110', '2023-10-01', '2023-12-31', 'PRESENCIAL', 'Todas las sedes y dependencia.', 'ADMINISTRATIVO', 'Equipo SST y brigadas', 'PENDIENTE', '', NULL, 'HACER', 0, NULL, NULL, NULL, NULL, 110, '2023-04-11 14:04:58', NULL),
(111, 'Definir indicadores de gestión  SG-SST de acuerdo con las condiciones de la empresa', '2023-111', '2023-01-01', '2023-01-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'VERIFICAR', 0, NULL, NULL, NULL, NULL, 111, '2023-04-11 14:06:22', NULL),
(112, 'Revisión anual por la alta dirección (Informe rendición cuentas)', '2023-112', '2023-12-01', '2023-12-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST, control interno y planeacion', 'PENDIENTE', '', NULL, 'VERIFICAR', 0, NULL, NULL, NULL, NULL, 112, '2023-04-11 14:08:40', NULL),
(113, 'Auditoria al Sistema de Gestión de la Seguridad y salud en el trabajo', '2023-113', '2023-12-01', '2023-12-31', 'MIXTA', 'palacio municipal', 'ADMINISTRATIVO', 'Control interno y copasst', 'PENDIENTE', '', NULL, 'VERIFICAR', 0, NULL, NULL, NULL, NULL, 113, '2023-04-11 14:10:22', NULL),
(114, 'Ejecución y seguimiento al matriz de hallazgos y controles.', '2023-114', '2023-02-01', '2023-02-28', 'MIXTA', 'Palacio Municipal ', 'ADMINISTRATIVO', 'responsable SST y equipo SST', 'PENDIENTE', '', NULL, 'ACTUAR', 0, NULL, NULL, NULL, NULL, 114, '2023-04-11 14:13:13', NULL),
(115, 'Ejecución y seguimiento al matriz de hallazgos y controles.', '2023-115', '2023-11-01', '2023-11-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Responsable SST y su equipo', 'PENDIENTE', '', NULL, 'ACTUAR', 0, NULL, NULL, NULL, NULL, 115, '2023-04-11 14:14:15', NULL),
(116, 'Seguimiento a programas sgsst', '2023-116', '2023-12-01', '2023-12-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Responsable SST y equipo', 'PENDIENTE', '', NULL, 'ACTUAR', 0, NULL, NULL, NULL, NULL, 116, '2023-04-11 14:15:24', NULL),
(117, 'Seguimiento ausentismo laboral', '2023-117', '2023-12-01', '2023-12-31', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST, control interno', 'PENDIENTE', '', NULL, 'ACTUAR', 0, NULL, NULL, NULL, NULL, 117, '2023-04-11 14:16:43', NULL),
(118, 'Seguimiento al Comité de convivencia laboral. ', '2023-118', '2023-04-23', '2023-04-30', 'MIXTA', 'Palacio Municipal', 'ADMINISTRATIVO', 'Equipo SST', 'PENDIENTE', '', NULL, 'PLANEAR', 0, '', NULL, NULL, NULL, 118, '2023-04-13 20:51:54', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_funcionario`
--

CREATE TABLE `actividad_funcionario` (
  `id_actividad_funcionario` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_actividad` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `asistencia` bit(1) DEFAULT NULL,
  `nota` varchar(25) DEFAULT NULL,
  `aprobo` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `actividad_funcionario`
--

INSERT INTO `actividad_funcionario` (`id_actividad_funcionario`, `id_funcionario`, `id_actividad`, `fecha_asignacion`, `asistencia`, `nota`, `aprobo`) VALUES
(64, 379, 13, '2023-04-01', NULL, '1', NULL),
(65, 107, 13, '2023-04-01', NULL, '1', NULL),
(66, 288, 13, '2023-04-01', NULL, '1', NULL),
(67, 311, 13, '2023-04-01', NULL, '1', NULL),
(68, 244, 13, '2023-04-01', NULL, '1', NULL),
(69, 643, 13, '2023-04-01', NULL, '1', NULL),
(70, 47, 13, '2023-04-01', NULL, '1', NULL),
(71, 470, 13, '2023-04-01', NULL, '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arl`
--

CREATE TABLE `arl` (
  `id_arl` int(11) NOT NULL,
  `arl` varchar(45) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `caja_compensacion` varchar(65) NOT NULL,
  `fecha_upd` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `caja_compensacion`
--

INSERT INTO `caja_compensacion` (`id_cajacompensacion`, `caja_compensacion`, `fecha_upd`) VALUES
(1, 'Comfenalco', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitaciones`
--

CREATE TABLE `capacitaciones` (
  `id_capacitacion` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `identificacion` varchar(45) DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `is_presencial` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `horas_formativas` varchar(45) DEFAULT NULL,
  `conocimiento_previo` text DEFAULT NULL,
  `entidadCapacitadora` varchar(255) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `archivo` text DEFAULT NULL,
  `calificacion` bit(1) DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `observacion` varchar(400) DEFAULT NULL,
  `fecha_inicio_suspencion` date DEFAULT NULL,
  `fecha_final_suspencion` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `capacitaciones`
--

INSERT INTO `capacitaciones` (`id_capacitacion`, `nombre`, `identificacion`, `fecha_ini`, `fecha_fin`, `is_presencial`, `direccion`, `horas_formativas`, `conocimiento_previo`, `entidadCapacitadora`, `estado`, `motivo`, `archivo`, `calificacion`, `consecutivo`, `cantidad`, `observacion`, `fecha_inicio_suspencion`, `fecha_final_suspencion`) VALUES
(31, 'Cierre de Gobierno y empalme', '2023-31', '2023-05-16', '2023-05-31', 'VIRTUAL', 'Moodle ESAP', '16', 'Cierre de Gobierno y empalme\r\n', 'ESAP', 'REALIZADO', '', 'views/archivos/capacitacion/Circular_No._35-08-01-52.1701117175_6564fcf7da05a.pdf', b'1', 31, 1, NULL, NULL, NULL),
(30, 'Prevención y atención a las violencias contra las mujeres y discriminación racial en el ámbito del trabajo', '2023-30', '2023-05-02', '2023-05-12', 'VIRTUAL', 'Moodle ESAP', '16', 'Prevención y atención a las violencias contra las mujeres y discriminación racial en el ámbito del trabajo\r\n', 'ESAP', 'REALIZADO', '', 'views/archivos/capacitacion/Circular_No._35-08-01-49.1701117141_6564fcd5854b9.pdf', b'0', 30, 10, NULL, NULL, NULL),
(29, 'Diplomado en Organización Documental', '2023-29', '2023-04-28', '2023-06-08', 'VIRTUAL', 'Moodle ESAP', '80', 'Diplomado en Organización Documental\r\n', 'ESAP', 'REALIZADO', '', '', b'0', 29, 68, NULL, NULL, NULL),
(28, 'Seguridad en Riesgo Eléctrico', '2023-28', '2023-04-19', '2023-05-23', 'PRESENCIAL', 'Sede Sintrajamundi', '48', 'Curso Seguridad en Riesgo Eléctrico', 'SENA', 'REALIZADO', '', '', b'1', 28, 23, NULL, NULL, NULL),
(27, 'Inducción', '2023-27', '2023-03-30', '2023-11-30', 'PRESENCIAL', 'Linci San Pedro', '4', 'Inducción institucional', 'Secretaría de Gestión Institucional', 'REALIZADO', '', '', b'1', 27, 26, NULL, NULL, NULL),
(26, 'Inglés', '2023-26', '2023-03-15', '2023-04-12', 'PRESENCIAL', 'Salón Comunal San Pedro', '48', 'Inglés nivel 1', 'SENA', 'REALIZADO', '', 'views/archivos/capacitacion/Circular_inscripciones_curso_ingles_1.1701115481_6564f659f3d9e.pdf', b'1', 26, 21, NULL, NULL, NULL),
(25, 'Código Único Disciplinario', '2023-25', '2023-03-02', '2023-03-02', 'PRESENCIAL', 'Salón Rizo', '3', 'Nuevo régimen disciplinario', 'Oficina de Control Interno Disciplinario', 'REALIZADO', '', 'views/archivos/capacitacion/Circular_inscripciones_Código_Único_Disciplinario_(1).1701114906_6564f41ad0470.pdf', b'1', 25, 64, NULL, NULL, NULL),
(24, 'MIPG', '2023-24', '2023-03-07', '2023-03-21', 'PRESENCIAL', 'LINCI SAN PEDRO', '10', 'Fundamentos modelo integrado de planeación y gestión', 'Secretaría de Planeación', 'REALIZADO', '', '', b'1', 24, 30, NULL, NULL, NULL),
(23, 'Trabajo Seguro en Alturas', '2023-23', '2023-02-20', '2023-10-25', 'PRESENCIAL', 'Instalaciones SENA', '16', 'Trabajador autorizado - Coordinador - Avanzado y reentrenamiento 2024', 'SENA', 'REALIZADO', '', '', b'1', 23, 18, NULL, NULL, NULL),
(22, 'Servicio al ciudadano ', '2023-22', '2023-02-22', '2023-02-22', 'PRESENCIAL', 'Auditorio casa de la cultura', '2 horas', '-Fundamentos normativos del servicio al ciudadano.\r\n-Características del servicio a la ciudadanía\r\n-Componentes de la política pública de servicio a la ciudadanía correspondientes de la ventanilla hacia adentro.\r\n-Componentes de la política pública de servicio a la ciudadanía correspondientes de la ventanilla hacia fuera', 'Secretaría General', 'REALIZADO', '', 'views/archivos/capacitacion/Circular_35-08-01-11.1701113689_6564ef59337b8.pdf', b'1', 22, 43, NULL, NULL, NULL),
(21, 'Taller de Lectura, Escritura y Oralidad ', '2023-21', '2023-02-28', '2023-02-28', 'PRESENCIAL', 'Biblioteca Municipal Abel Eli Guerrero', '2', 'Fortalecer las competencias a través de procesos de enseñanza y aprendizaje de la lectura y escritura', 'Secretaría de Cultura', 'REALIZADO', '', '', b'0', 21, 11, NULL, NULL, NULL),
(32, 'Diplomado Políticas Públicas', '2023-32', '2023-05-18', '2023-06-30', 'VIRTUAL', 'Moodle ESAP', '80', 'Políticas Públicas\r\n', 'ESAP', 'REALIZADO', '', 'views/archivos/capacitacion/2023-SGI-1410_Asuntos_Étnicos.1701117312_6564fd8002f91.pdf', b'1', 32, 3, NULL, NULL, NULL),
(33, 'Herramientas digitales', '2023-33', '2023-05-01', '2023-06-30', 'VIRTUAL', 'Meet', '1', 'Aprende a usar tu correo electrónico de manera eficiente, cómo filtrar y organizar tu bandeja de entrada. (Miércoles, 24 de mayo de 10:30 a 11:30 a.m.)\r\n\r\nAprende sobre la Inteligencia artificial CHAT GPT (Jueves, 25 de mayo de 03:30 a 05:00 p.m.)\r\n\r\nAprende a usar la red social Telegram (miércoles, 7 de junio de 10:30 a 11:30 a.m.)\r\n', 'Oficina TIC', 'REALIZADO', '', 'views/archivos/capacitacion/CIRCULAR_TALLERES_VIRTUALES_DE_HERRAMIENTAS_INFORMATICAS.1701117610_6564feaa6a16e.pdf', b'0', 33, 39, NULL, NULL, NULL),
(34, 'Informática Microsoft Word, Excel e Internet', '2023-34', '2023-06-16', '2023-07-30', 'VIRTUAL', 'Meet', '40', 'Informática Microsoft Word, Excel e Internet', 'SENA', 'REALIZADO', '', 'views/archivos/capacitacion/CIRCULAR_INSCRIPCIONES_CURSO_INFORMATICA.1701117721_6564ff198fdab.pdf', b'1', 34, 40, NULL, NULL, NULL),
(35, 'Herramientas ofimáticas', '2023-35', '0203-06-13', '2023-06-21', 'VIRTUAL', 'Meet', '1', 'Aprende a administrar tus bases de datos con Excel\r\nAprende a realizar presentaciones efectivas con Power Point\r\nWord: Combinación de correspondencia, configuración de márgenes, orientación de página, agregar tablas o gráficos\r\n', 'Oficina TIC', 'REALIZADO', '', 'views/archivos/capacitacion/CIRCULAR_TALLERES_VIRTUALES_HERRAMIENTAS_OFIMATICAS.1701117837_6564ff8d9d88e.pdf', b'1', 35, 51, NULL, NULL, NULL),
(36, 'Diplomado Innovación en el sector público', '2023-36', '2023-06-23', '2023-08-17', 'VIRTUAL', 'Moodle Esap', '80', 'Diplomado Innovación en el sector público\r\n', 'ESAP', 'REALIZADO', '', 'views/archivos/capacitacion/Circular_inscripciones_innovación.1701117975_65650017ac84d.pdf', b'1', 36, 30, NULL, NULL, NULL),
(37, 'Diplomado en Resolución de Conflictos', '2023-37', '2027-07-10', '2027-08-30', 'VIRTUAL', 'Moodle Esap', '80', 'Diplomado en Resolución de Conflictos\r\n', 'ESAP', 'REALIZADO', '', 'views/archivos/capacitacion/Circular_inscripciones_innovación.1701118148_656500c4e0eba.pdf', b'1', 37, 19, NULL, NULL, NULL),
(38, 'Gestión del Cambio', '2023-38', '2023-08-03', '2023-08-03', 'PRESENCIAL', 'Linci San Pedro', '2', 'Gestión del Cambio\r\n', 'Secretaría de Gestión Institucional', 'REALIZADO', '', 'views/archivos/capacitacion/CIRCULAR_GESTION_DE_CAMBIO.1701118240_65650120adc33.pdf', b'1', 38, 6, NULL, NULL, NULL),
(39, 'Gestión de Riesgos', '2023-39', '2023-08-18', '0203-08-18', 'PRESENCIAL', 'Linci San Pedro', '4', 'Gestión de Riesgos\r\n', 'Secretaría de Planeación', 'REALIZADO', '', 'views/archivos/capacitacion/CIRCULAR_INSCRIPCIONES_CAPACITACION_GESTION_DE_RIESGOS.1701118335_6565017f5bf0c.pdf', b'1', 39, 14, NULL, NULL, NULL),
(40, 'Diplomado Proceso de Contratación en Línea con el Estado Colombiano', '2023-40', '2023-08-24', '2023-09-24', 'VIRTUAL', 'Moodle Esap', '80', 'Normatividad, Registro de Usuario del Secop II, Etapa precontractual, contractual y poscontractual, Sistema de información de la contratación pública.', 'ESAP', 'REALIZADO', '', 'views/archivos/capacitacion/CIRCULAR_INSCRIPCIONES_DIPLOMADO_PROCESO_CONTRATACION_EN_LINEA.1701118458_656501fa53b15.pdf', b'1', 40, 28, NULL, NULL, NULL),
(41, 'Reinducción', '2023-41', '2023-08-30', '2023-08-30', 'VIRTUAL', 'Meet', '2', 'Reinducción', 'Secretaría de Gestión Institucional', 'REALIZADO', '', 'views/archivos/capacitacion/CIRCULAR_CITACION_INDUCCION_Y_REINDUCCION.1701118592_65650280ca158.pdf', b'1', 41, 270, NULL, NULL, NULL),
(42, 'Formulación e implementación de proyectos enfocados en la economía popular y comunitaria en los municipios', '2023-42', '2023-09-01', '2023-09-30', 'VIRTUAL', 'Moodle', '80', 'Formulación e implementación de proyectos enfocados en la economía popular y comunitaria en los municipios\r\n', 'SENA-Federación Colombiana de Municipios', 'REALIZADO', '', 'views/archivos/capacitacion/DIPLOMADO_FORMULACION_E_IMPLEMANTACION_DE_PROYECTOS.1701118918_656503c6c975a.pdf', b'0', 42, 12, NULL, NULL, NULL),
(43, 'Trabajo en Equipo', '2023-43', '2023-10-27', '2023-10-27', 'PRESENCIAL', 'Salón Auxiliar Casa de la Cultura', '1', 'Trabajo en Equipo\r\n', 'Comfenalco Valle', 'REALIZADO', '', 'views/archivos/capacitacion/CIRCULAR_CONVOCATORIA_CAPACITACION_TRABAJO_EN_EQUIPO.1701119016_65650428d24bb.pdf', b'1', 43, 26, NULL, NULL, NULL),
(44, 'Finanzas Públicas Territoriales', '2023-44', '2023-11-21', '2023-11-21', 'PRESENCIAL', 'Salón auxiliar Casa de la Cultura', '1', 'Finanzas Públicas Territoriales\r\n', 'Universidad Icesi', 'REALIZADO', '', 'views/archivos/capacitacion/CIRCULAR_INSCRIPCIONES_FINANZAS_PÚBLICAS_TERRITORIALES.1701119127_65650497e3994.pdf', b'1', 44, 14, NULL, NULL, NULL),
(45, 'Liderazgo', '2023-45', '2023-11-24', '2023-11-24', 'VIRTUAL', 'Zoom', '1', 'Liderazgo\r\n', 'Comfenalco Valle', 'REALIZADO', '', 'views/archivos/capacitacion/CIRCULAR_CAPACITACIÓN_LIDERAZGO.1701119208_656504e836e4e.pdf', b'1', 45, 16, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacionesprogramadas_funcionario`
--

CREATE TABLE `capacitacionesprogramadas_funcionario` (
  `id_capacitacionprogramadasfuncionario` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_capacitacionprogramada` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `asistencia` bit(1) DEFAULT NULL,
  `nota` varchar(40) DEFAULT NULL,
  `aprobo` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `capacitacionesprogramadas_funcionario`
--

INSERT INTO `capacitacionesprogramadas_funcionario` (`id_capacitacionprogramadasfuncionario`, `id_funcionario`, `id_capacitacionprogramada`, `fecha_asignacion`, `asistencia`, `nota`, `aprobo`) VALUES
(40, 4, 4, '2023-03-07', NULL, '', NULL),
(39, 2, 4, '2023-03-07', NULL, '7', 1),
(29, 5, 5, '2023-03-20', NULL, '10', 1),
(28, 2, 5, '2023-03-20', NULL, '9', 1),
(27, 4, 5, '2023-03-20', NULL, '5', 0),
(30, 646, 6, '2023-03-31', NULL, '10', 1),
(31, 52, 46, '2023-06-09', NULL, '1', NULL),
(32, 89, 46, '2023-06-09', NULL, '1', NULL),
(33, 120, 46, '2023-06-09', NULL, '1', NULL),
(34, 128, 46, '2023-06-09', NULL, '1', NULL),
(35, 155, 46, '2023-06-09', NULL, '1', NULL),
(36, 169, 46, '2023-06-09', NULL, '1', NULL),
(37, 311, 46, '2023-06-09', NULL, '1', NULL),
(38, 312, 46, '2023-06-09', NULL, '1', NULL),
(41, 5, 4, '2023-03-07', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitaciones_programadas`
--

CREATE TABLE `capacitaciones_programadas` (
  `id_capacitacionprogramada` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `identificacion` varchar(45) DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `is_presencial` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `recursos` varchar(45) DEFAULT NULL,
  `entidad_actividad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `calificacion` bit(1) DEFAULT NULL,
  `grupo_objetivo` text DEFAULT NULL,
  `valor_total` int(11) DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `tiempo_gen` datetime DEFAULT current_timestamp(),
  `fecha_inicio_suspencion` date DEFAULT NULL,
  `fecha_final_suspencion` date DEFAULT NULL,
  `fecha_` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `capacitaciones_programadas`
--

INSERT INTO `capacitaciones_programadas` (`id_capacitacionprogramada`, `nombre`, `identificacion`, `fecha_ini`, `fecha_fin`, `is_presencial`, `direccion`, `recursos`, `entidad_actividad`, `estado`, `archivo`, `motivo`, `calificacion`, `grupo_objetivo`, `valor_total`, `observacion`, `consecutivo`, `tiempo_gen`, `fecha_inicio_suspencion`, `fecha_final_suspencion`, `fecha_`) VALUES
(1, 'capacitacion trazabilidad', '2023-1', '2023-01-16', '2023-01-16', 'PRESENCIAL', 'dasd', 'ADMINISTRATIVO', 'dasd', 'REALIZADO', '', '', NULL, NULL, NULL, 'prueba trazabilidad\n', 1, '2023-01-16 16:34:30', NULL, NULL, NULL),
(2, '43242343', '2023-2', '2023-01-19', '2023-01-19', 'PRESENCIAL', 'fsdfdsf', 'FINANCIERO', 'fdsfsdfdsf', 'REALIZADO', '', '', NULL, NULL, NULL, '', 2, '2023-01-19 10:53:17', NULL, NULL, NULL),
(3, 'fsdfds', '2023-3', '2023-01-19', '2023-01-11', 'PRESENCIAL', 'fdsfdsf', 'FINANCIERO', 'fdsfdsf', 'SUSPENDIDO', '', '', NULL, NULL, 423432, '', 3, '2023-01-19 10:57:34', '2023-01-19', '2023-01-16', NULL),
(4, 'capacitación 4', '2023-4', '2023-03-07', '2023-03-07', 'PRESENCIAL', 'Palacion', 'ADMINISTRATIVO', 'SSST', 'REALIZADO', '', '', NULL, NULL, NULL, '', 4, '2023-03-07 19:27:29', NULL, NULL, NULL),
(5, 'Prueba 8', '2023-5', '2023-03-10', '2023-03-10', 'PRESENCIAL', 'Salón comunal centro', 'ADMINISTRATIVO', 'SSST', 'REALIZADO', '', 'Por mal clima', NULL, NULL, NULL, 'Se realizó satisfactoriamente ', 5, '2023-03-10 15:45:34', NULL, NULL, NULL),
(6, 'Inducción en el SG-SST', '2023-6', '2023-01-01', '2023-01-31', 'MIXTA', 'Todas las Dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'REALIZADO', '', 'Se re programa nueva fecha en 31 marzo en coordinacion con bienestar para todos los nuevos funcionarios', NULL, NULL, NULL, 'Se realizo el día 31 marzo 2023 salón del Linci San Pedro. ', 6, '2023-04-11 15:03:29', '2023-03-30', '2023-03-31', NULL),
(7, 'Inducción en el SG-SST', '2023-7', '2023-02-01', '2023-02-28', 'PRESENCIAL', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 7, '2023-04-11 15:27:44', NULL, NULL, NULL),
(8, 'Inducción en el SG-SST', '2023-8', '2023-03-01', '2023-03-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 8, '2023-04-11 15:30:41', NULL, NULL, NULL),
(9, 'Inducción en el SG-SST', '2023-9', '2023-04-03', '2023-04-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 9, '2023-04-11 15:32:19', NULL, NULL, NULL),
(10, 'Inducción en el SG-SST', '2023-10', '2023-05-01', '2023-05-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 10, '2023-04-11 15:33:03', NULL, NULL, NULL),
(11, 'Inducción en el SG-SST', '2023-11', '2023-06-01', '2023-06-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 11, '2023-04-11 15:33:55', NULL, NULL, NULL),
(12, 'Inducción en el SG-SST', '2023-12', '2023-07-01', '2023-07-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 12, '2023-04-11 15:34:39', NULL, NULL, NULL),
(13, 'Inducción en el SG-SST', '2023-13', '2023-08-01', '2023-08-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 13, '2023-04-11 15:35:33', NULL, NULL, NULL),
(14, 'Inducción en el SG-SST', '2023-14', '2023-09-01', '2023-09-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 14, '2023-04-11 15:36:18', NULL, NULL, NULL),
(15, 'Inducción en el SG-SST', '2023-15', '2023-10-01', '2023-10-31', 'MIXTA', 'Equipo SST', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 15, '2023-04-11 15:37:51', NULL, NULL, NULL),
(16, 'Inducción en el SG-SST', '2023-16', '2023-11-01', '2023-11-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 16, '2023-04-11 15:38:36', NULL, NULL, NULL),
(17, 'Inducción en el SG-SST', '2023-17', '2023-12-01', '2023-12-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 17, '2023-04-11 15:39:19', NULL, NULL, NULL),
(18, 'Re inducción en el SG-SST', '2023-18', '2023-01-01', '2023-01-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 18, '2023-04-11 15:48:36', NULL, NULL, NULL),
(19, 'Re inducción en el SG-SST', '2023-19', '2023-02-01', '2023-02-28', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 19, '2023-04-11 15:49:25', NULL, NULL, NULL),
(20, 'Re inducción en el SG-SST', '2023-20', '2023-03-01', '2023-03-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 20, '2023-04-11 15:54:47', NULL, NULL, NULL),
(21, 'Re inducción en el SG-SST', '2023-21', '2023-04-02', '2023-04-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 21, '2023-04-11 15:55:33', NULL, NULL, NULL),
(22, 'Re inducción en el SG-SST', '2023-22', '2023-05-01', '2023-04-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 22, '2023-04-11 15:56:30', NULL, NULL, NULL),
(23, 'Re inducción en el SG-SST', '2023-23', '2023-06-01', '2023-05-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 23, '2023-04-11 15:57:19', NULL, NULL, NULL),
(24, 'Re inducción en el SG-SST', '2023-24', '2023-07-02', '2023-07-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 24, '2023-04-11 15:58:10', NULL, NULL, NULL),
(25, 'Re inducción en el SG-SST', '2023-25', '2023-08-01', '2023-08-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST ', NULL, '', NULL, NULL, NULL, NULL, NULL, 25, '2023-04-11 15:58:54', NULL, NULL, NULL),
(26, 'Re inducción en el SG-SST', '2023-26', '2023-09-01', '2023-09-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 26, '2023-04-11 15:59:55', NULL, NULL, NULL),
(27, 'Re inducción en el SG-SST', '2023-27', '2023-10-01', '2023-10-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 27, '2023-04-11 16:00:36', NULL, NULL, NULL),
(28, 'Re inducción en el SG-SST', '2023-28', '2023-11-01', '2023-11-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 28, '2023-04-11 16:01:29', NULL, NULL, NULL),
(29, 'Re inducción en el SG-SST', '2023-29', '2023-12-01', '2023-12-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 29, '2023-04-11 16:02:08', NULL, NULL, NULL),
(30, 'Resolución 1010 de 2006 \"Acoso Laboral\" y manejo de complicitos.', '2023-30', '2023-04-01', '2023-04-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST, comite convivencia', NULL, '', NULL, NULL, NULL, NULL, NULL, 30, '2023-04-11 16:03:47', NULL, NULL, NULL),
(31, 'Resolución 1010 de 2006 Acoso Laboral y manejo de conflicitos.', '2023-31', '2023-07-01', '2023-07-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Profesional SST, comite convivencia', NULL, '', NULL, NULL, NULL, NULL, NULL, 31, '2023-04-11 16:06:03', NULL, NULL, NULL),
(32, 'Resolución 1010 de 2006 \"Acoso Laboral\" y manejo de complicitos.', '2023-32', '2023-10-01', '2023-10-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST, comite de convivencia', NULL, '', NULL, NULL, NULL, NULL, NULL, 32, '2023-04-11 16:07:12', NULL, NULL, NULL),
(33, 'Capacitación en orden y aseo estrategia de mejoramiento continuo', '2023-33', '2023-02-01', '2023-02-28', 'PRESENCIAL', 'Todas las sedes y dependencas.', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 33, '2023-04-11 16:08:17', NULL, NULL, NULL),
(34, 'Capacitación en orden y aseo estrategia de mejoramiento continuo', '2023-34', '2023-05-01', '2023-05-31', 'MIXTA', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 34, '2023-04-11 16:09:20', NULL, NULL, NULL),
(35, 'Capacitación en orden y aseo estrategia de mejoramiento continuo', '2023-35', '2023-08-01', '2023-08-31', 'MIXTA', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 35, '2023-04-11 16:10:23', NULL, NULL, NULL),
(36, 'Capacitación en orden y aseo estrategia de mejoramiento continuo', '2023-36', '2023-11-01', '2023-11-30', 'MIXTA', 'Todas las sedes y dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 36, '2023-04-11 16:11:31', NULL, NULL, NULL),
(37, 'Seguridad vial para Comité PESTV', '2023-37', '2023-03-01', '2023-03-31', 'MIXTA', 'Por definir', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 37, '2023-04-11 16:12:43', NULL, NULL, NULL),
(38, 'Seguridad vial para conductores', '2023-38', '2023-06-01', '2023-06-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST, comite de seguridad vial', NULL, '', NULL, NULL, NULL, NULL, NULL, 38, '2023-04-11 16:13:52', NULL, NULL, NULL),
(39, 'Seguridad vial para peatones y usuarios del transporte.', '2023-39', '2023-09-01', '2023-09-30', 'MIXTA', 'Todas las dependencias ', 'ADMINISTRATIVO', 'Equipo SST, comite seguridad vial', NULL, '', NULL, NULL, NULL, NULL, NULL, 39, '2023-04-11 16:15:12', NULL, NULL, NULL),
(40, 'Curso avanzado de Trabajo seguro en altura ', '2023-40', '2023-02-01', '2023-02-28', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST, Equipo bienestar', NULL, '', NULL, NULL, NULL, NULL, NULL, 40, '2023-04-11 16:17:45', NULL, NULL, NULL),
(41, 'Prevención de accidentes por caídas ', '2023-41', '2023-08-01', '2023-08-31', 'MIXTA', 'Todas las dependencias ', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 41, '2023-04-11 16:19:13', NULL, NULL, NULL),
(42, 'Prevención accidentes en manos y manejo de herramientas  ', '2023-42', '2023-04-01', '2023-04-30', 'PRESENCIAL', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 42, '2023-04-11 16:20:30', NULL, NULL, NULL),
(43, 'Divulgación de estándares para las actividades criticas (TSA, Manipulación de cargas, trabajos eléctricos)', '2023-43', '2023-10-01', '2023-10-31', 'MIXTA', 'Secretaria Infraestructura Fisica', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 43, '2023-04-11 16:24:29', NULL, NULL, NULL),
(44, 'Prevención del riesgo eléctrico', '2023-44', '2023-10-01', '2023-10-31', 'MIXTA', 'Secretaria Infraestructura Fisica', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 44, '2023-04-11 16:26:03', NULL, NULL, NULL),
(45, 'Gestión del riesgo químico (divulgación de hojas de seguridad)', '2023-45', '2023-10-01', '2023-10-30', 'MIXTA', 'Todas las dependencias ', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 45, '2023-04-11 16:29:23', NULL, NULL, NULL),
(46, 'Capacitación brigada de emergencia (Incendio, PAE, primeros auxilios básico, evacuación, simulacro)', '2023-46', '2023-02-01', '2023-02-28', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', 'REALIZADO', 'C:\\fakepath\\09-06-23 CAPACITACION BRIGADISTAS COMPORTAMIENTO SEGURO.pdf', '', NULL, NULL, NULL, 'Se realizo capacitación brigadas según cronograma anual de manera satisfactoria. ', 46, '2023-04-11 16:30:36', NULL, NULL, NULL),
(47, 'Elementos de protección personal ', '2023-47', '2023-03-01', '2023-03-31', 'MIXTA', 'Todas las dependencias ', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 47, '2023-04-11 16:33:02', NULL, NULL, NULL),
(48, 'Elementos de protección personal ', '2023-48', '2023-09-01', '2023-09-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 48, '2023-04-11 16:42:31', NULL, NULL, NULL),
(49, 'Elementos de protección personal ', '2023-49', '2023-06-01', '2023-06-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 49, '2023-04-11 16:43:28', NULL, NULL, NULL),
(50, 'Capacitación enfocada en el riesgo biológico (mordeduras y picaduras)', '2023-50', '2023-07-01', '2023-07-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 50, '2023-04-11 16:54:33', NULL, NULL, NULL),
(51, 'Prevención del riesgo publico ', '2023-51', '2023-05-01', '2023-05-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 51, '2023-04-11 16:55:45', NULL, NULL, NULL),
(52, 'Capacitación sobre conservación auditiva', '2023-52', '2023-06-01', '2023-06-30', 'MIXTA', 'Secretaria Infraestructura Fisica', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 52, '2023-04-11 16:57:07', NULL, NULL, NULL),
(53, 'Intervención del riesgo psicosocial  (Manejo de conflictos, trabajo en equipo, liderazgo,  estrés laboral)', '2023-53', '2023-05-01', '2023-05-31', 'MIXTA', 'Todas las dependencias ', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 53, '2023-04-11 16:58:02', NULL, NULL, NULL),
(54, 'Divulgación de los mecanismos para reportar actos y condiciones inseguras.', '2023-54', '2023-01-01', '2023-01-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 54, '2023-04-11 16:59:10', NULL, NULL, NULL),
(55, 'Capacitación en responsabilidades y obligaciones SST', '2023-55', '2023-04-01', '2023-04-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 55, '2023-04-11 17:00:03', NULL, NULL, NULL),
(56, 'Capacitación en responsabilidades, Inspecciones, Investigación de AT', '2023-56', '2023-02-01', '2023-02-28', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST ', NULL, '', NULL, NULL, NULL, NULL, NULL, 56, '2023-04-11 17:02:44', NULL, NULL, NULL),
(57, 'Capacitación en responsabilidades, Inspecciones, Investigación de AT', '2023-57', '2023-07-01', '2023-07-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 57, '2023-04-11 17:03:49', NULL, NULL, NULL),
(58, 'Capacitación en responsabilidades, Inspecciones, Investigación de AT', '2023-58', '2023-10-01', '2023-10-30', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 58, '2023-04-11 17:04:40', NULL, NULL, NULL),
(59, 'Estilos de vida saludable', '2023-59', '2023-03-01', '2023-03-31', 'MIXTA', 'Todas las dependencias ', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 59, '2023-04-11 17:10:12', NULL, NULL, NULL),
(60, 'Estilos de vida saludable', '2023-60', '2023-05-01', '2023-05-31', 'MIXTA', 'Todas las dependencias', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 60, '2023-04-11 17:11:06', NULL, NULL, NULL),
(61, 'Estilos de vida saludable', '2023-61', '2023-11-01', '2023-11-30', 'MIXTA', 'Todas las dependencias ', 'ADMINISTRATIVO', 'Equipo SST', NULL, '', NULL, NULL, NULL, NULL, NULL, 61, '2023-04-11 17:12:01', NULL, NULL, NULL),
(62, 'INDUCCION', '2025-62', '2025-02-25', '2025-02-28', 'PRESENCIAL', 'innolab', 'ADMINISTRATIVO', 'SST', NULL, 'C:\\fakepath\\P-4318.pdf', NULL, NULL, NULL, NULL, NULL, 62, '2025-02-25 19:39:07', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacion_funcionario`
--

CREATE TABLE `capacitacion_funcionario` (
  `id_capacitacion_funcionario` int(11) NOT NULL,
  `id_capacitacion` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `asistencia` bit(1) DEFAULT NULL,
  `nota` varchar(20) DEFAULT NULL,
  `aprobo` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `capacitacion_funcionario`
--

INSERT INTO `capacitacion_funcionario` (`id_capacitacion_funcionario`, `id_capacitacion`, `id_funcionario`, `fecha_asignacion`, `asistencia`, `nota`, `aprobo`) VALUES
(29, NULL, 7, NULL, NULL, NULL, NULL),
(28, NULL, 576, NULL, NULL, NULL, NULL),
(260, 21, 301, '2023-03-28', NULL, '1', NULL),
(259, 21, 466, '2023-03-28', NULL, '1', NULL),
(258, 21, 169, '2023-03-28', NULL, '1', NULL),
(257, 21, 107, '2023-03-28', NULL, '1', NULL),
(256, 21, 253, '2023-03-28', NULL, '1', NULL),
(255, 21, 643, '2023-03-28', NULL, '1', NULL),
(254, 21, 311, '2023-03-28', NULL, '1', NULL),
(253, 21, 288, '2023-03-28', NULL, '1', NULL),
(252, 21, 50, '2023-03-28', NULL, '1', NULL),
(251, 21, 420, '2023-03-28', NULL, '1', NULL),
(250, 21, 635, '2023-03-28', NULL, '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id_cargo` int(11) NOT NULL,
  `cargo` varchar(65) NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_nivelfuncionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `codigo` varchar(45) NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='																																																																																																																																																																																																																																																																																																																																																																																																																																																					';

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
  `dependencia` varchar(85) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `is_activa` bit(1) NOT NULL DEFAULT b'1',
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `eps` varchar(80) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`id_eps`, `eps`, `descripcion`, `fecha_upd`) VALUES
(1, 'No tiene/No lo han vinculado', NULL, '2021-11-07 05:48:31'),
(2, 'Asmet salud', NULL, '2021-11-07 05:48:31'),
(3, 'Comfenalco', NULL, '2021-11-07 05:48:31'),
(4, 'Coomeva', NULL, '2021-11-07 05:48:31'),
(5, 'Coosalud', NULL, '2021-11-07 05:48:32'),
(6, 'Comfandi', NULL, '2021-11-07 05:48:32'),
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
  `estado_civil` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `etnia` varchar(45) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `periodo` varchar(45) NOT NULL,
  `valor_evaluacion` varchar(45) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `evaluaciones`
--

INSERT INTO `evaluaciones` (`id_evaluacion`, `periodo`, `valor_evaluacion`, `id_funcionario`) VALUES
(2364, '2020 - 2021    ', '66.83', 42),
(2365, '2020 - 2021    ', '95.26', 570),
(2366, '2020 - 2021    ', '99', 497),
(2367, '2020 - 2021    ', '97', 21),
(2368, '2020 - 2021    ', '100', 116),
(2369, '2020 - 2021    ', '100', 56),
(2370, '2020 - 2021    ', '100', 322),
(2371, '2020 - 2021    ', '95.75', 74),
(2372, '2020 - 2021    ', '100', 400),
(2373, '2020 - 2021    ', '97', 201),
(2374, '2020 - 2021    ', '94.2', 313),
(2375, '2020 - 2021    ', '100', 155),
(2376, '2020 - 2021    ', '94.81', 625),
(2377, '2020 - 2021    ', '92.28', 387),
(2378, '2020 - 2021    ', '97.73', 216),
(2379, '2020 - 2021    ', '96.5', 39),
(2380, '2020 - 2021    ', '99', 111),
(2381, '2020 - 2021    ', '95.75', 231),
(2382, '2020 - 2021    ', '96.6', 291),
(2383, '2020 - 2021    ', '100', 279),
(2384, '2020 - 2021    ', '86.22', 49),
(2385, '2020 - 2021    ', '99.7', 245),
(2386, '2020 - 2021    ', '98.51', 294),
(2387, '2020 - 2021    ', '100', 220),
(2388, '2020 - 2021    ', '98.94', 150),
(2389, '2020 - 2021    ', '100', 144),
(2390, '2020 - 2021    ', '100', 398),
(2391, '2020 - 2021    ', '91.05', 37),
(2392, '2020 - 2021    ', '96.31', 271),
(2393, '2020 - 2021    ', '100', 420),
(2394, '2020 - 2021    ', '92.75', 474),
(2395, '2020 - 2021    ', '95.01', 104),
(2396, '2020 - 2021    ', '96', 281),
(2397, '2020 - 2021    ', '100', 449),
(2398, '2020 - 2021    ', '100', 140),
(2399, '2020 - 2021    ', '99', 119),
(2400, '2020 - 2021    ', '98.3', 550),
(2401, '2020 - 2021    ', '99.53', 41),
(2402, '2020 - 2021    ', '96.03', 312),
(2403, '2020 - 2021    ', '94.75', 175),
(2404, '2020 - 2021    ', '97', 224),
(2405, '2020 - 2021    ', '100', 406),
(2406, '2020 - 2021    ', '100', 510),
(2407, '2020 - 2021    ', '96', 549),
(2408, '2020 - 2021    ', '98', 315),
(2409, '2020 - 2021    ', '99', 488),
(2410, '2020 - 2021    ', '100', 87),
(2411, '2020 - 2021    ', '95.75', 374),
(2412, '2020 - 2021    ', '100', 365),
(2413, '2020 - 2021    ', '88.56', 501),
(2414, '2020 - 2021    ', '100', 128),
(2415, '2020 - 2021    ', '93.47', 438),
(2416, '2020 - 2021    ', '93.68', 389),
(2417, '2020 - 2021    ', '92.35', 440),
(2418, '2020 - 2021    ', '87.25', 401),
(2419, '2020 - 2021    ', '98', 85),
(2420, '2020 - 2021    ', '96', 273),
(2421, '2020 - 2021    ', '97.96', 409),
(2422, '2020 - 2021    ', '91.75', 362),
(2423, '2020 - 2021    ', '95.75', 75),
(2424, '2020 - 2021    ', '99.45', 379),
(2425, '2020 - 2021    ', '92.13', 142),
(2426, '2020 - 2021    ', '96.86', 202),
(2427, '2020 - 2021    ', '100', 248),
(2428, '2020 - 2021    ', '100', 93),
(2429, '2020 - 2021    ', '97', 208),
(2430, '2020 - 2021    ', '86.65', 159),
(2431, '2020 - 2021    ', '88.54', 323),
(2432, '2020 - 2021    ', '94.71', 120),
(2433, '2020 - 2021    ', '96.15', 79),
(2434, '2020 - 2021    ', '95.75', 131),
(2435, '2020 - 2021    ', '95.73', 310),
(2436, '2020 - 2021    ', '97.97', 503),
(2437, '2020 - 2021    ', '95.58', 481),
(2438, '2020 - 2021    ', '45.4', 436),
(2439, '2020 - 2021    ', '96.09', 505),
(2440, '2020 - 2021    ', '100', 464),
(2441, '2020 - 2021    ', '82.17', 492),
(2442, '2020 - 2021    ', '99.49', 394),
(2443, '2020 - 2021    ', '76.82', 369),
(2444, '2020 - 2021    ', '97', 151),
(2445, '2020 - 2021    ', '69.5', 502),
(2446, '2020 - 2021    ', '90.06', 182),
(2447, '2020 - 2021    ', '94.57', 189),
(2448, '2020 - 2021    ', '100', 459),
(2449, '2020 - 2021    ', '78.86', 489),
(2450, '2020 - 2021    ', '90.05', 199),
(2451, '2020 - 2021    ', '93.75', 15),
(2452, '2020 - 2021    ', '92.63', 432),
(2453, '2020 - 2021    ', '91.87', 190),
(2454, '2020 - 2021    ', '88.5', 516),
(2455, '2020 - 2021    ', '92.76', 327),
(2456, '2020 - 2021    ', '93.27', 71),
(2457, '2020 - 2021    ', '100', 2),
(2458, '2020 - 2021    ', '91.5', 429),
(2459, '2020 - 2021    ', '91.5', 251),
(2460, '2020 - 2021    ', '95.75', 546),
(2461, '2020 - 2021    ', '92.17', 303),
(2462, '2020 - 2021    ', '95.3', 554),
(2463, '2020 - 2021    ', '100', 38),
(2464, '2020 - 2021    ', '95.45', 288),
(2465, '2020 - 2021    ', '92.75', 55),
(2466, '2020 - 2021    ', '96.97', 378),
(2467, '2020 - 2021    ', '86.15', 539),
(2468, '2020 - 2021    ', '87.5', 537),
(2469, '2020 - 2021    ', '96', 276),
(2470, '2020 - 2021    ', '96.45', 448),
(2471, '2020 - 2021    ', '100', 386),
(2472, '2020 - 2021    ', '90.56', 272),
(2473, '2020 - 2021    ', '100', 473),
(2474, '2020 - 2021    ', '91.5', 107),
(2475, '2020 - 2021    ', '100', 301),
(2476, '2020 - 2021    ', '84.08', 5),
(2477, '2020 - 2021    ', '91.5', 67),
(2478, '2020 - 2021    ', '97', 498),
(2479, '2020 - 2021    ', '89.63', 241),
(2480, '2020 - 2021    ', '66.05', 235),
(2481, '2020 - 2021    ', '93.63', 309),
(2482, '2020 - 2021    ', '96.94', 244),
(2483, '2020 - 2021    ', '92.02', 344),
(2484, '2020 - 2021    ', '95.76', 239),
(2485, '2020 - 2021    ', '89.62', 162),
(2486, '2020 - 2021    ', '91.71', 58),
(2487, '2020 - 2021    ', '99.5', 96),
(2488, '2020 - 2021    ', '95.43', 561),
(2489, '2020 - 2021    ', '88.92', 287),
(2490, '2020 - 2021    ', '98.5', 232),
(2491, '2020 - 2021    ', '89.06', 4),
(2492, '2020 - 2021    ', '96.48', 204),
(2493, '2020 - 2021    ', '90.36', 50),
(2494, '2020 - 2021    ', '97.73', 149),
(2495, '2020 - 2021    ', '95.73', 152),
(2496, '2020 - 2021    ', '100', 253),
(2497, '2020 - 2021    ', '96.5', 346),
(2498, '2020 - 2021    ', '90.38', 350),
(2499, '2020 - 2021    ', '100', 469),
(2500, '2020 - 2021    ', '98.09', 357),
(2501, '2020 - 2021    ', '87.13', 358),
(2502, '2020 - 2021    ', '93.44', 443),
(2503, '2020 - 2021    ', '100', 30),
(2504, '2020 - 2021    ', '99', 484),
(2505, '2020 - 2021    ', '95.75', 35),
(2506, '2020 - 2021    ', '88.52', 211),
(2507, '2020 - 2021    ', '99.5', 397),
(2508, '2020 - 2021    ', '95.75', 275),
(2509, '2020 - 2021    ', '78.46', 129),
(2510, '2020 - 2021    ', '97.39', 261),
(2511, '2020 - 2021    ', '100', 243),
(2512, '2020 - 2021    ', '95.96', 547),
(2513, '2020 - 2021    ', '85.5', 89),
(2514, '2020 - 2021    ', '97', 512),
(2515, '2020 - 2021    ', '97', 195),
(2516, '2020 - 2021    ', '93.75', 520),
(2517, '2020 - 2021    ', '98.01', 292),
(2518, '2020 - 2021    ', '73.72', 311),
(2519, '2020 - 2021    ', '100', 141),
(2520, '2020 - 2021    ', '91.94', 255),
(2521, '2020 - 2021    ', '94.86', 302),
(2522, '2020 - 2021    ', '99.71', 174),
(2523, '2020 - 2021    ', '92.05', 118),
(2524, '2020 - 2021    ', '100', 48),
(2525, '2020 - 2021    ', '95.75', 363),
(2526, '2020 - 2021    ', '96', 428),
(2527, '2020 - 2021    ', '97', 23),
(2528, '2020 - 2021    ', '100', 553),
(2529, '2020 - 2021    ', '90.5', 92),
(2530, '2020 - 2021    ', '92.17', 414),
(2531, '2020 - 2021    ', '90.65', 324),
(2532, '2020 - 2021    ', '173.5', 412),
(2533, '2020 - 2021    ', '48.45', 508),
(2534, '2020 - 2021    ', '92.45', 83),
(2535, '2020 - 2021    ', '91.68', 544),
(2536, '2020 - 2021    ', '91.52', 169),
(2537, '2020 - 2021    ', '97', 499),
(2538, '2020 - 2021    ', '96', 439),
(2539, '2020 - 2021    ', '94.9', 306),
(2540, '2020 - 2021    ', '100', 493),
(2541, '2020 - 2021    ', '95.18', 240),
(2542, '2020 - 2021    ', '99', 370),
(2543, '2020 - 2021    ', '92.62', 536),
(2544, '2020 - 2021    ', '95.75', 305),
(2545, '2020 - 2021    ', '93.04', 543),
(2546, '2020 - 2021    ', '87.5', 180),
(2547, '2020 - 2021    ', '87.5', 371),
(2548, '2020 - 2021    ', '93.45', 134),
(2549, '2020 - 2021    ', '100', 476),
(2550, '2020 - 2021    ', '66.11', 59),
(2551, '2020 - 2021    ', '93.73', 228),
(2552, '2020 - 2021    ', '100', 454),
(2553, '2020 - 2021    ', '93.17', 402),
(2554, '2020 - 2021    ', '93.27', 197),
(2555, '2020 - 2021    ', '95.75', 468),
(2556, '2020 - 2021    ', '100', 478),
(2557, '2020 - 2021    ', '99.7', 103),
(2558, '2020 - 2021    ', '90.47', 364),
(2559, '2020 - 2021    ', '97.45', 418),
(2560, '2020 - 2021    ', '100', 53),
(2561, '2020 - 2021    ', '97', 200),
(2562, '2020 - 2021    ', '100', 316),
(2563, '2020 - 2021    ', '92.75', 68),
(2564, '2020 - 2021    ', '100', 434),
(2565, '2020 - 2021    ', '100', 470),
(2566, '2020 - 2021    ', '98', 504),
(2567, '2020 - 2021    ', '100', 421),
(2568, '2020 - 2021    ', '100', 333),
(2569, '2020 - 2021    ', '88.9', 494),
(2570, '2020 - 2021    ', '98', 496),
(2571, '2020 - 2021    ', '99.75', 257),
(2572, '2020 - 2021    ', '96', 495),
(2573, '2020 - 2021    ', '98.7', 390),
(2574, '2020 - 2021    ', '95.63', 388),
(2575, '2020 - 2021    ', '87.75', 542),
(2576, '2020 - 2021    ', '97.45', 274),
(2577, '2020 - 2021    ', '97', 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_previa`
--

CREATE TABLE `experiencia_previa` (
  `id_experienciaprevia` int(11) NOT NULL,
  `empresa` varchar(155) NOT NULL,
  `cargo` varchar(155) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_retiro` date NOT NULL,
  `funciones` text NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `experiencia_previa`
--

INSERT INTO `experiencia_previa` (`id_experienciaprevia`, `empresa`, `cargo`, `fecha_ingreso`, `fecha_retiro`, `funciones`, `fecha_upd`, `id_funcionario`) VALUES
(1, 'sosftnet', 'dev', '2022-06-01', '2022-06-26', 'dev', '2022-06-27 11:33:42', 577),
(2, 'SOFTVENTA', 'DEV', '2022-06-27', '2022-06-27', 'DEV', '2022-06-27 11:45:14', 579),
(4, 'adad', 'adad', '2022-12-10', '2022-12-10', 'adada', '2022-12-10 11:49:07', 590),
(5, 'wrwr', 'rwrwrw', '2022-11-30', '2022-12-12', 'dadad', '2022-12-12 10:04:05', 591),
(7, '3123213', '3123213', '2023-02-14', '2023-02-25', 'asdasdasdasdd', '2023-02-25 16:29:08', 597),
(8, 'dasdsadas', 'dasdasdasd', '2023-02-06', '2023-02-06', 'dadsdasdsadasdasdas', '2023-02-25 16:29:08', 597),
(12, 'ALCALDIA DE JAMUNDI', 'CONTRATISTA', '2022-08-05', '2022-12-30', '0', '2023-04-10 22:25:21', 646),
(13, 'ALCALDIA DE JAMUNDI', 'CONTRATISTA', '2022-07-08', '2022-08-01', 'N/A', '2023-04-10 22:25:21', 646),
(14, 'ALCALDIA DE JAMUNDI', 'CONTRATISTA', '2022-01-18', '2022-07-30', 'N/A', '2023-04-10 22:25:21', 646),
(15, 'ALCALDIA DE JAMUNDI', 'TECNICO ADMINISTRATIVO', '2011-12-24', '2020-03-24', 'REALIZAR AUDITORIAS INTERNAS E INFORMES DE AUDITORIAS. SEGUIMIENTOS A LOS PLANES DE MEJORAMIENTOS INTERNOS Y EXTERNOS. REALIZAR LOS OFICIOS NECESARIOS DE LA OFICINA, UTILIZANDO TODOS LOS CONOCIMIENTOS EN LOS DIFERENTES PROGRAMAS DEL SISTEMA  ', '2023-04-27 15:54:42', 647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo_cesantias`
--

CREATE TABLE `fondo_cesantias` (
  `id_fondocesantias` int(11) NOT NULL,
  `fondo_cesantias` varchar(65) NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `fondo_pension` varchar(75) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `nivel_formacion` varchar(45) DEFAULT NULL,
  `abreviacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `documento` varchar(40) DEFAULT NULL,
  `is_actualizado` bit(1) DEFAULT b'0',
  `fecha_ingreso_nombra` varchar(20) DEFAULT NULL,
  `profesion` varchar(60) DEFAULT NULL,
  `genero` enum('M','F','OTRO') DEFAULT 'M',
  `direccion` varchar(500) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `cantidad_hijos` int(2) DEFAULT NULL,
  `condicion_medica` text DEFAULT NULL,
  `is_activo` int(1) DEFAULT 1,
  `id_sede` int(11) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT 'CEDULA DE CIUDADANIA',
  `id_etnia` int(11) DEFAULT NULL,
  `id_rh` int(11) DEFAULT NULL,
  `id_dependencia` int(11) DEFAULT NULL,
  `id_tipovinculacion` int(11) DEFAULT NULL,
  `id_niveleducativo` int(11) DEFAULT NULL,
  `id_nivelfuncionario` int(11) DEFAULT NULL,
  `id_codigo` int(11) DEFAULT NULL,
  `id_victimaviolencia` int(11) DEFAULT NULL,
  `madre_padre` varchar(45) DEFAULT NULL,
  `cabeza_familia` varchar(45) DEFAULT '0',
  `is_viviendapropia` int(11) DEFAULT 0,
  `estado_vivienda` varchar(45) DEFAULT 'BUENA',
  `is_procesodisciplinario` bit(1) DEFAULT b'0',
  `numero_proceso_dis` varchar(45) DEFAULT NULL,
  `fecha_proceso_dis` date DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `id_grado` int(11) DEFAULT NULL,
  `posgrado` varchar(45) DEFAULT NULL,
  `numero_posesion` varchar(255) DEFAULT NULL,
  `fecha_posesion` date DEFAULT NULL,
  `numero_resolucion` varchar(255) DEFAULT NULL,
  `fecha_resolucion` date DEFAULT NULL,
  `modo_trabajo` varchar(45) DEFAULT NULL,
  `archivo_laboral` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `ano_ingreso` varchar(45) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `id_estadocivil` int(11) DEFAULT NULL,
  `pais_nacimiento` varchar(255) DEFAULT NULL,
  `ciudad_nacimiento` varchar(255) DEFAULT NULL,
  `otro_municipio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`, `pais_nacimiento`, `ciudad_nacimiento`, `otro_municipio`) VALUES
(1, 'CARLOS EDUARDO', 'ARCE VALENCIA', '16825042', b'1', '2020-09-08', 'Bachiller Academico', 'M', 'Cll 8 No 2 bis -10', 'arceeduardovalencia@gmail.com', '3113616141', '1965-03-28', 57, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 2, 7, 8, 5, 2, 2, 6, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 6, 11, '', '35-01-27-0233', '2022-04-08', '2333', '2020-09-08', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(2, ' ELIECER OSWALDO', 'ACOSTA REVELO', '16842660', b'1', '2017-11-02', 'Arquitecto ', 'M', 'Carrera 6 # 9B 34', 'eliecer43@hotmail.com', '3155041643', '1979-06-24', 43, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 1, 7, 4, 17, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 17, 26, '', '', NULL, '', NULL, 'null', 'views/archivos/hojavida/L23_-_AL_-_FOLLETO.1745446310_680965a6e25fb.pdf', '', '2017', 22, 4, 'COLOMBIA', 'CALI', NULL),
(3, ' MIGUEL ANGEL', 'AGUDELO MARTINEZ', '1112478030', b'1', '2015-06-10', '', 'M', 'Calle 11a #4a-88', 'miguelangelagu@gmail.com', '3002762295', '1993-02-22', 30, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 3, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 3, 'COLOMBIA', 'CALI', NULL),
(4, 'ARCE VALENCIA EMILIA', '', '31526913', b'1', '1998-01-02', 'técnico en contabilidad y sistemas', 'F', 'Calle 1f # 12-32 Villa Monica', 'emily_arce@hotmail.com', '3145510029', NULL, 54, 1, 'no', 0, 7, 'Cedula de Ciudadania', 1, 7, 10, 1, 3, 1, 1, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 1, 1, '', '111', '2023-03-10', '111', '2023-03-10', 'Presencial', '', '', '1998', 22, 4, 'COLOMBIA', 'CALI', NULL),
(5, 'CARVAJAL DIAZ MERCEDES', '', '31230636', b'0', '1995-01-25', '', 'F', 'CALLE 19 #8-47 CENTENARIO', 'mercedescar0120@hotmail.com', '3178558230', NULL, 122, NULL, '', 0, NULL, 'Cedula de Ciudadania', NULL, NULL, 10, 1, NULL, 5, 27, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '1995', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(6, 'JHON SILVIO', 'BOHÓRQUEZ CANO ', '1112458824', b'0', '2021-02-01', 'ABOGADO', 'M', 'CARRERA 12 #14-46', 'jhonsilviob.abogado@gmail.com', '3174298810', NULL, 36, NULL, '', 0, NULL, 'Cedula de Ciudadania', NULL, NULL, 23, 4, NULL, 3, 13, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 13, NULL, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(7, ' MARIA JOSEFA', 'AGUILAR SALDAÑA', '31533405', b'1', '2020-02-26', 'Técnico salud ocupacional ', 'F', 'Kra  4 # 23-07 alférez real ', 'majosefa2706@hotmail.com', '3163894621', '1974-07-01', 48, 2, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 2, 7, 8, 1, 3, 2, 3, 2, 'MADRE', '1', 1, 'EN ZONA DE RIESGO', b'0', '', NULL, 3, 6, '', 'Decreto 0120', '2020-02-26', '35-01-0117', '2020-02-11', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(8, ' ANDRES FELIPE', 'ARENAS GUZMAN', '1112472429', b'1', '2020-03-18', 'tecnologia en gestion empesarial', 'M', 'Calle 11 Transversal 14-17', 'PIPE.1.7@HOTMAIL.COM', '3187338885', '1990-12-05', 32, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 9, 1, 4, 2, 3, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 3, 5, '', '30-16-0158', '2020-03-18', '35-01-0185', '2020-03-02', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(9, 'ARENAS MARIN JOSE LISIMACO', NULL, '16887875', NULL, '1997-10-16', 'Bachiller Academico', 'M', NULL, 'joliarma8020@gmail.com', '3144630051', '0000-00-00', 49, NULL, NULL, 0, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(10, 'JENNIFER', 'CASTAÑEDA ROCHA', '1112474640', b'1', '2020-01-02', 'ABOGADA', 'F', 'CARRERA 5 SUR #10A BIS-02', 'jennicasta1220@gmail.com', '3115373722', '1991-12-20', 31, 0, 'NINGUNA', 0, 4, 'Cedula de Ciudadania', 1, 3, 17, 4, 7, 1, 1, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 1, 1, 'SI', '202277777', '2022-04-02', '202277777', '2022-04-04', 'Presencial', 'views/archivos/hojavida/CIRCULAR_INFORMATIVA_CURSO_DE_INTEGRIDAD.1746044522_6812866a03206.pdf', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(11, 'CARABALI GARCIA INES', '', '31527130', b'1', '2002-11-25', 'lic en lengua castellana', 'F', 'CORREGIMIENTO DE QUINAMAYÓ VALLE', 'INESCARABALI4@GMAIL.COM', '3137609422', NULL, 54, 2, 'NO', 0, 1, 'Cedula de Ciudadania', 2, 7, 9, 5, 6, 2, 4, 1, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 4, 8, '', '', NULL, '', NULL, 'null', '', '', '2002', 22, 3, 'COLOMBIA', 'CALI', NULL),
(12, 'ALCALDE SOTO CARLOS HOLMES', NULL, '16784036', NULL, '1997-11-01', 'Bachiller', 'M', NULL, 'cjalcalde3021@gmail.com', '3207802353', '0000-00-00', 51, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(13, 'ZANDRA PATRICIA', 'ALTAMIRANO HURTADO ', '31535278', b'1', '2011-12-29', 'Tecnologia en Formulación de Proyectos', 'M', 'carrera 6 sur 2-03 b/ urb. cazadores', 'zandra0750@hotmail.com', '3188986073', '1975-08-22', 46, 3, 'NO', 1, 2, 'Cedula de Ciudadania', NULL, 3, 51, 5, 3, 8, 3, 2, 'MADRE', '0', 1, 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-18_at_9.42.25_AM.1661876232_630e3808aa7bf.jpeg', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(14, 'GUILLERMO', 'BOLIVAR ', '16450862', b'1', '2015-06-11', '', 'M', 'CALLE 8 A # 127, BARRIO LAS ACACIAS', 'sintraxamundi@gmail.com', '3215944459', '1964-04-29', 58, NULL, 'HIPERTENSO-DIABETICO', 1, NULL, 'Cedula de Ciudadania', 3, 1, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(15, 'CASTAÑO MAFLA HECTOR FABIO', NULL, '16825685', NULL, '2005-03-03', NULL, 'M', NULL, 'kutufla6609@hotmail.com', '3174669146', '0000-00-00', 55, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(16, 'ARIAS SALAZAR ALEJANDRO', NULL, '16832826', NULL, '2016-01-08', NULL, 'M', NULL, 'alejandro16832826@gmail.com', '3158276874', '0000-00-00', 49, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(17, 'ARIAS GARCIA ALEJANDRA', '', '1130614692', b'1', '2020-01-02', 'Antropologa y politologa/ Especialista en Gobierno y Polític', 'F', ' CIUDAD COUNTRY UNIDAD AZOR CASA 31', 'oficina.equidaddegenero@jamundi.gov.co', '3108204711', NULL, 34, 0, 'NO', 1, 2, 'Cedula de Ciudadania', 1, 7, 51, 4, 10, 3, 13, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 13, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(18, 'KATHERINE', 'ARISTIZABAL COLORADO ', '1112475238', b'1', '2019-12-31', 'Adminstración de empresas', 'F', 'CALLE 13 No.7-36 Libertadores', 'kataristi1113@hotmail.com', '3215638534', '1992-03-29', 30, 1, 'no ', 1, 2, 'Cedula de Ciudadania', 1, 3, 51, 5, 6, 2, 9, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 9, 14, '', 'DEC. 0403', '2019-12-31', '0200', '2019-12-31', 'Presencial', '', 'views/archivos/fotos/Katherine_Aristizabal.1663607940_6328a484023e7.jpg', '2019', 22, 3, 'COLOMBIA', 'CALI', NULL),
(19, 'MARICELA', 'ATEHORTUA LOPEZ', '31536941', b'1', '2004-03-17', 'Técnica Profesional en Secretaria Ejecutivo', 'F', 'Calle 3 # 14-52 ', 'mary.ate.lop@hotmail.com', '3212478720', '1977-02-19', 46, NULL, 'Hipertensa', 1, 1, 'Cedula de Ciudadania', 2, 2, 8, 5, 3, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 3, '', '0274', '2004-03-17', '2004-1760', '2004-02-18', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-24_at_10.21.49_AM_-_Maricela_Atehortua.1661875934_630e36de7bb1d.jpeg', '2004', 22, 1, 'COLOMBIA', 'CALI', NULL),
(20, ' ANA CECILIA', 'AVENDAÑO', '31860091', b'1', '1985-02-16', 'bachiller', 'F', 'Carrera 6 # 12A-49 B/ Belalcazar II', 'cristinamina0528@gmail.com', '3206850459', '1960-09-20', 62, 3, 'Hipertensión', 1, 11, 'Cedula de Ciudadania', 2, 8, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '1985', 22, 3, 'COLOMBIA', 'CALI', NULL),
(21, 'AVENDAÑO SUAREZ NEYDER HARLEY', NULL, '1019111290', NULL, '2020-07-20', 'administrador publibo-tec contabilidad- tec contabilidad y f', 'M', 'CARRERA 98 B #48-127', 'neyderavendano@gmail.com', '3214841972', '0000-00-00', 26, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL, 'COLOMBIA', 'CALI', NULL),
(22, ' FRANCY YENI', 'AVILA ORTIZ', '29567615', b'1', '2011-12-15', 'Seguridad y salud en el trabajo ', 'F', 'Calle 9 A No. 5-40 Barrio Popular ', 'francyjenny1978@hotmail.com', '3147366605', '1978-07-23', 44, 2, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 1, 7, 14, 6, 3, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 39, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(23, 'YURANIS DEL CARMEN', 'AVILA ROMERO ', '55306152', b'1', '2020-07-07', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CALLE 57 #8-23 LA BASE', 'Yura200922@hotmail.com', '3218327719', '1984-12-06', 38, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 3, 10, 1, 6, 2, 3, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 3, 5, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(24, 'AVILES VELASCO GERMAN ALBERTO', NULL, '16696395', NULL, '2020-04-06', 'bachiller academico', 'M', NULL, 'gatomancho14@hotmail.com', '3152530795', '0000-00-00', 58, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(25, ' OLGA BEATRIZ', 'AZA REYES', '31532916', b'1', '2009-11-12', '', 'F', 'Calle 3 # 1a-26', 'olgabety2767@gmail.com', '3148779432', '1973-11-27', 49, NULL, 'Tratamiento de CA 4 de tiroides', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2009', 22, 4, 'COLOMBIA', 'CALI', NULL),
(26, 'BALANTA ARARAT DIVIER', NULL, '14884214', NULL, '2020-01-07', NULL, 'M', NULL, 'dibalar@gmail.com', '3104580940', '0000-00-00', 59, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, NULL, 4, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(27, 'BALANTA  RODRIGO', NULL, '14675151', NULL, '2002-11-25', 'Bachiller Academico', 'M', NULL, 'rodrigobalanta20@gmail.com', '3218548796', '0000-00-00', 62, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(28, 'BLANCA NELLY', 'HENAO MARIN', '31872181', b'1', '1991-06-22', 'basica primaria', 'F', 'CARRERA 1BN 5-29 B/ Portal del Jordan', 'BLANCAHM0110@GMAIL.COM', '3174782020', '1953-10-01', 69, 1, 'Hipertensión, dolor en el pecho', 1, 6, 'Cedula de Ciudadania', 1, 7, 14, 6, 1, 6, 4, 2, 'MADRE', '0', 1, 'BUENA', b'0', '', NULL, 4, 9, '', '', NULL, '', NULL, 'Presencial', '', '', '1991', 22, 1, 'COLOMBIA', 'CALI', NULL),
(29, ' ANA PATRICIA', 'BALANTA RODRIGUEZ', '31530438', b'1', '2020-02-26', 'Auxiliar Administrativo', 'F', 'Calle 18 N. 13-14', 'anapati1502@gmail.com', '3186255338', '1971-02-15', 52, 1, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 2, 7, 8, 1, 2, 2, 4, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 4, 8, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(30, ' ANA MARIA', 'BALANTA SALINAS', '31539325', b'1', '2015-12-03', 'ADMINISTRADORA DE EMPRESAS', 'F', 'Calle 17 # 3-28', 'anamariabasa@hotmail.com', '3215700043', '1978-06-30', 44, 0, 'HEMOGLOBINA BAJA', 1, 3, 'Cedula de Ciudadania', 2, 7, 13, 1, 7, 4, 17, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 17, 26, 'SI', '', '2020-02-12', '', '2015-12-03', 'Presencial', '', '', '2015', 22, 3, 'COLOMBIA', 'CALI', NULL),
(31, 'YANETH', 'BALANTA ', '31522659', b'1', '2011-02-25', 'Bachiller academico', 'F', 'Calle 21 5-32 barrio panamericano', 'yason1963@gmail.com', '3172594202', '1963-04-24', 59, 3, 'NINGUNA', 1, 8, 'Cedula de Ciudadania', 2, 3, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(32, 'BALANTA ZAPATA HECTOR FABIO', NULL, '6336026', NULL, '1997-08-26', 'bachiller agropecuario', 'M', NULL, NULL, '3137241262', '0000-00-00', 65, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(33, 'ALTAMIRANO VIERA MARIA CONSUELO', '', '31525478', b'1', '2021-05-21', 'Tècnico contable', 'F', 'Cra 1A norte n. 5-29', 'consueloaltamirano@hotmail.com', '3007781722', NULL, 56, 1, 'no', 1, 1, 'Cedula de Ciudadania', 1, 7, 9, 1, 3, 2, 3, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 3, NULL, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(34, 'BARONA BERMUDEZ LUIS ALEJANDRO', NULL, '1112472198', NULL, '2011-12-15', NULL, 'M', NULL, 'alejandrobarona@hotmail.com', '3174944190', '0000-00-00', 31, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(35, 'ALVAREZ ACOSTA PAOLA ANDREA', '', '31572880', b'1', '2020-04-06', 'finanzas y negocios internacionales', 'F', 'Km 4 via Rio Claro Haciendas de Potrerito GUA', 'Paola5911@gmail.com', '3154812486', NULL, 42, 1, 'no', 1, 3, 'Cedula de Ciudadania', 1, 7, 9, 1, 6, 4, 17, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 17, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(36, 'BARONA CARACAS MARIA EUGENIA', '', '315324850', b'1', '1994-10-03', 'ABOGADA', 'F', 'calle 17 no. 17 a 31 ', 'mariaeudoctora@hotmail.com', '3155717336', NULL, 47, NULL, 'NO', 1, 2, 'Cedula de Ciudadania', 2, 3, 12, 1, 10, 4, 16, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 16, NULL, '', '', NULL, '', NULL, 'null', '', '', '1994', 22, 3, 'COLOMBIA', 'CALI', NULL),
(37, 'VIVIANA', 'BARONA CASTILLO', '1112465449', b'1', '2020-07-07', 'AUXILIAR ADMINISTRATIVO GRADO 2', 'F', 'carrera 2 No 4A-12 Portal del jordan', 'vivianabar12@hotmail.com', '3158505202', '1988-07-12', 34, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 3, 27, 1, 3, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', '2020-07-07', '', NULL, 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(38, 'GABRIELA MILENA', 'ALVAREZ PALMARINI', '22507780', b'1', '2020-02-26', 'PSICOLOGIA', 'F', 'calle 18 No 61 29 barrio cañavarelas 2 apto i', 'gabyalpa@yahoo.com', '3207891931', '1980-05-18', 42, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 3, 1, 6, 5, 26, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '0090', '2020-02-26', '35-01-0109', '2020-02-11', 'Presencial', '', 'views/archivos/fotos/Gabriela_Alvarez_Palmarini.1663617277_6328c8fd5eed0.jpg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(39, ' MARY ISABEL', 'AMEZQUITA GOLONDRINO', '1085248175', b'1', '2012-02-07', 'CONTADORA PUBLICA', 'F', 'LOS NARANJOS MANZANA 5 APTO 302 TORRE 2', 'maisabel1308@gmail.com', '3193261738', '1985-08-13', 37, 2, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 7, 28, 1, 6, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', '', '2012', 22, 4, 'COLOMBIA', 'CALI', NULL),
(40, 'ANDRADE FORERO JIMENA MARIA', '', '52582347', b'1', '2020-09-17', 'ARTISTA', 'F', 'Lagos de verde alfaguara 12c -1001', 'andradejimena@gmail.com', '3166536788', NULL, 51, 1, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 7, 5, 4, 10, 3, NULL, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 26, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(41, 'DANIEL ALEJANDRO', 'AMU ABONIA ', '1112485790', b'1', '2020-03-18', 'Sociologo en curso', 'M', 'Calle 1ra Oeste #21-29', 'daniel.amu@correounivalle.edu.co', '3168460920', '1995-09-12', 27, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 1, 11, 1, 2, 2, 5, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 5, 10, '', '35-01-0184', '2020-03-18', '35-01-0184', '2020-03-18', 'Presencial', '', 'views/archivos/fotos/foto_-_Daniel_Amú.1662559484_6318a4fc3a334.jpg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(42, 'ADRIANA MARIA', 'ANGOLA GONZALEZ', '31447018', b'1', '2020-06-07', 'ABOGADA', 'F', 'CARRERA 2 #5b- 34', 'adrianaangola@yahoo.es', '3218890446', '1980-11-08', 42, 3, 'Drepanositos ', 1, 4, 'Cedula de Ciudadania', 2, 3, 10, 1, 6, 5, 27, 2, 'MADRE', '1', 1, 'AGRIETADA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(43, 'DIDIMO', 'APONZA VIAFARA', '10549501', b'1', '1988-08-20', 'LICENCIADO CIENCIAS SOCIALES ', 'M', 'corregimiento de quinamayo', 'aponza06@hotmail.com', '3215630106', '1966-02-18', 57, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 7, 14, 6, 6, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 28, NULL, '', '', NULL, '', NULL, 'Presencial', '', '', '1988', 22, 1, 'COLOMBIA', 'CALI', NULL),
(44, 'ARAGON ARROYO ANTONIO', NULL, '16828178', NULL, '2015-06-24', NULL, 'M', NULL, NULL, '3136798120', '0000-00-00', 52, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(45, ' WALTER', 'ARAGON CALAPSU', '1112477932', b'1', '2011-02-24', 'Abogado', 'M', 'Carrera 19a No. 8-93', 'walter_ara93@hotmail.com', '3104536400', '1993-02-10', 30, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 6, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 28, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-08_at_11.00.17_AM.1659994615_62f181f7d3340.jpeg', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(46, ' CARLOS ROBERTO', 'ARAGON GARCIA', '76045420', b'1', '2019-01-14', '', 'M', 'Carrera 18 No 20-36 ', 'carlitos-ara@hotmail.com', '3165705210', '1978-09-16', 44, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 29, NULL, '', '', NULL, '', NULL, 'null', '', '', '2019', 22, 1, 'COLOMBIA', 'CALI', NULL),
(47, 'CLAUDIA PAOLA', 'ARAMBULO POLO ', '1075211927', b'1', '2021-03-08', 'ADMINISTRADORA DE EMPRESAS', 'F', 'Carrera 9 N.7-61 segundo piso', 'Claudia_200808@hotmail.com', '3013191031', '1986-04-14', 36, 0, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 8, 1, 7, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '', '2021-03-08', '35-01-27-107', NULL, 'Presencial', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(48, 'INES MARGARITA', 'ARANGO CANTILLO ', '45481138', b'1', '2020-03-13', 'CONTADORA PUBLICA', 'F', 'Boulevard Alfaguara Calle Farallones, Conjunto residencial Lagos de Verde Alfaguara, apto. 901 A', 'inarca1130@hotmail.com', '3206939434', '1968-11-30', 54, 3, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 12, 1, 6, 5, 26, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 27, NULL, '', '30-16-0144', '2020-03-13', '35-01-0169', '2020-03-02', 'Presencial', '', 'views/archivos/fotos/Ines_Margarita_Arango.1662996440_631f4fd825337.jpg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(49, 'ARANGO SUAREZ EDUARDO', NULL, '1107056751', NULL, '2020-04-01', NULL, 'M', 'Calle 49 # 120-52 apto. P202', 'eduarsuarez89@hotmail.com', '3178721620', '0000-00-00', 32, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 15, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL, 'COLOMBIA', 'CALI', NULL),
(50, 'MARIA CENSION', 'ARBOLEDA LLANOS ', '31527292', b'1', '1997-12-09', 'LICENCIATURA EN LITERATURA/ MAGISTER EN GESTION PUBLICA', 'F', 'CALL 11 B Nº 15-39 sachamate', 'mariacllanos419@gmail.com', '3174446591', '1967-12-05', 55, 2, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 7, 10, 1, 8, 5, 26, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '', NULL, '', NULL, 'null', '', '', '1997', 22, 4, 'COLOMBIA', 'CALI', NULL),
(51, 'BONILLA ALEXANDER', NULL, '16831239', NULL, '2015-09-06', NULL, 'M', NULL, NULL, '3162085398', '0000-00-00', 50, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(52, ' YESSICA', 'BONILLA HERRERA', '1143932285', b'1', '2020-02-26', 'Ingeniera de aliminetos', 'F', 'CALLE 79D #23 A 37 Vallegrande', 'yesbohe@gmail.com', '3146478876', '1990-01-25', 33, 1, 'NINGUNA', 1, 10, 'Cedula de Ciudadania', 2, 1, 10, 1, 6, 2, 8, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 8, 13, '', ' Decreto No. 0072 del 11 de febrero de 2020', '2020-02-26', '', '2020-02-11', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(53, 'ANDRES JAVIER', 'BONILLA HURTADO ', '1098622791', b'1', '2020-07-07', 'DERECHO- ESPECIALIZACION DERECHO FAMILIAR', 'M', 'carrera 10 #9-74', 'ajbonillahurtado@gmail.com', '3246817295', '1986-09-18', 36, NULL, 'Depresión y Ansiedad', 1, NULL, 'Cedula de Ciudadania', 1, 1, 12, 1, 7, 4, 17, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 17, 24, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(54, ' NEIFI', 'BORJA TORO', '31479339', b'1', '2020-03-05', 'Bachiller Academico', 'F', 'Cll 18 # 23 - 34 Aranjuez ', 'neifiborjatoro@gmail.com', '3137025548', '1976-03-05', 47, 2, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 8, 6, 2, 2, 4, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, 8, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(55, ' GINA PAOLA', 'BORRE LOZADA', '25562378', b'1', '2020-06-30', 'Ingeniera Industrial', 'F', 'Villas de Altagracia cra 1era numero 10c 55 ', 'ginaborre@hotmail.com', '3123573113', '1984-01-16', 39, NULL, ' NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 27, 1, 7, 4, 17, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 17, NULL, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(56, 'MARIA ISABEL', 'BRAVO HERNANDEZ ', '1053832518', b'1', '2020-12-03', 'ABOGADA', 'F', 'CALLE 8 10-32 APTO 301 ', 'isa9422@gmail.com', '3113584753', '1994-02-02', 28, 0, 'no', 1, 4, 'Cedula de Ciudadania', 1, 1, 11, 1, 6, 5, 23, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 23, 34, '', 'DECRETO 35-16-001', '2020-12-03', '35-01-2356', '2020-06-25', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-18_at_9.25.57_AM.1660832786_62fe4c126bfd3.jpeg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(57, 'BUILES RODRIGUEZ HENRY', NULL, '16826385', NULL, '2013-10-01', 'bachiller academico', 'M', NULL, NULL, '3152581167', '0000-00-00', 55, NULL, NULL, 0, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(58, 'CIELO LILIANA', 'BURITICA ', '31522571', b'1', '1995-04-16', 'bachiller academico', 'F', 'Vereda el Jordán cgto San vicente', 'cielolilianab@gmail.com', '3225687421', '1958-05-28', 64, 3, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 27, 5, 2, 2, 9, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 9, NULL, '', '', '1998-04-16', '', NULL, 'Presencial', '', 'views/archivos/fotos/IMG_20220824_084246_-_cielo_liliana_buritica.1662562106_6318af3a2fe2d.jpg', '1995', 22, 4, 'COLOMBIA', 'CALI', NULL),
(59, 'CABEZAS REYES PETERSON ALIPIO', '', '87430458', b'0', '1992-08-24', '', 'M', 'calle 11 sur# 10e - 111', 'petersoncabezas2021@gmail.com', '3012076309', NULL, 61, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 5, 1, NULL, 5, 27, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '1992', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(60, 'CABRERA TOBAR YOHANA', NULL, '31538942', NULL, '2018-09-20', NULL, 'F', NULL, 'jhoacabrerat@gmail.com', '3146000262', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(61, 'CABRERA PERDIGON CARLOS ALBERTO', NULL, '16829692', NULL, '2011-02-24', NULL, 'M', NULL, NULL, '3147964178', '0000-00-00', 50, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(62, 'PATRICIA', 'CADENA MUNOZ', '29570123', b'1', '2014-06-06', 't.p. en secretariado', 'F', 'Corregimiento  Chagres', 'kimberly1199@hotmail.com', '3113420983', '1966-09-11', 56, NULL, 'Hipotiroidismo', 1, 1, 'Cedula de Ciudadania', 2, 7, 8, 1, 3, 2, 9, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 9, 14, '', '0148', '2014-06-06', '35-01-27-007', '2014-06-06', 'Presencial', '', '', '2014', 22, 1, 'COLOMBIA', 'CALI', NULL),
(63, ' JORGE ELIECER', 'BARONA', '16827739', b'1', '2014-07-03', 'Administrador de empresas ', 'M', 'Transversal 14 # 9-59 barrio El Rosario ', 'jorge.barona@hotmail.com', '3153573398', '1969-03-17', 54, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 3, 3, 5, 8, 4, 17, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 17, 25, 'SI', ' Decreto 35-16-065', '2023-12-29', '35-01-27-287', '2023-12-28', 'Alternancia', '', '', '2014', 22, 1, 'COLOMBIA', 'JAMUNDI', NULL),
(64, ' SERGIO RAUL', 'BARONA RODRIGUEZ', '16828084', b'1', '2011-02-28', 'LISCENCIADO EN EDUCACION FISICA', 'M', 'cra20a 8 sur 24 barrio el condado', 'serbaro1969@gmail.com', '316334021', '1969-08-18', 53, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 7, 14, 6, 6, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 28, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(65, 'GUZMAN CARDONA CARMEN LUDIVIA', NULL, '31526767', NULL, '2005-03-03', NULL, 'F', NULL, 'melita-1968@hotmail.com', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 26, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(66, 'HUGO FRANZ', 'BARRETO OROZCO', '16849435', b'1', '2019-06-15', 'Diseñador Gráfico', 'M', 'Km 3 vía Chipayá Bosques de verde horizonte', 'hboroz@gmail.com', '3176811691', '1984-12-02', 38, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 16, 5, 6, 4, 17, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 17, 24, '', '', NULL, '', NULL, 'Virtual', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-08_at_11.22.12_AM.1660252300_62f5708cb0ec2.jpeg', '2019', 22, 1, 'COLOMBIA', 'CALI', NULL),
(67, 'CAICEDO AVELLANEDA ANA MARIA', '', '31320154', b'1', '2020-03-20', 'derecho', 'F', 'CIUDAD COUNTRY CONDOMINIO ALONDRA CASA 127', 'ana.caicedoivcj@gmail.com', '3176807674', NULL, 39, 2, 'NO', 1, 3, 'Cedula de Ciudadania', 1, 1, 9, 1, 10, 4, 17, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 17, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(68, 'CLAUDIA FERNANDA', 'CAINA SERNA ', '66856337', b'1', '2020-12-14', 'SECRETARIA Y TECNICA EN CONTABILIDAD', 'F', 'CARRERA 1A SUR #6A 68 Rincon Zaragoza', 'klafer27@hotmail.com', '3174730108', '1973-05-28', 49, 2, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 1, 28, 1, 3, 2, 3, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Fernanda_Caina_-_Josselyn_Perdigón.1661800464_630d10105e875.JPG', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(69, 'BARRIOS MARTINEZ JESUS ANTONIO', NULL, '16823243', NULL, '2016-01-18', NULL, 'M', NULL, 'jesusantoniobarrios@hotmail.com', '3184372502', '0000-00-00', 59, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(70, ' ANA MILENA', 'PERDIGON IDROBO', '31523440', b'1', '1997-04-16', '', 'F', 'CALLE 13 7-30 B/ LIBERTADORES', 'caroflaca1991@gmail.com', '3152191345', '1964-10-02', 57, NULL, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 7, 14, 6, 1, 6, NULL, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.29.34_AM.1661783460_630ccda49794c.jpeg', '1997', 22, 4, 'COLOMBIA', 'CALI', NULL),
(71, ' NESTOR ANTONIO', 'CALDERON VALENCIA', '16842080', b'1', '2001-12-02', 'Agente de tránsito ', 'M', 'Carrera 6a sur # 2-03 lote 30 manzana B', 'nestor80calderon@gmail.com', '3113065292', '1980-12-26', 42, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 3, 29, 1, 3, 5, 19, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'null', '', '', '2001', 22, 4, 'COLOMBIA', 'CALI', NULL),
(72, 'JENNY CAROLINA', 'BARRETO OROZCO ', '31445630', b'1', '2019-12-31', 'técnico en sistemas', 'F', 'ClleLaFontana1-1Apto704TBPalmdeVerdeAlfaguara', 'carolaxoxo121279@gmail.com', '3052482779', '1979-12-12', 42, 0, 'cirugía de humero y platillos tibiales, dificultad para subir escaleras', 1, 4, 'Cedula de Ciudadania', 1, 1, 11, 5, 3, 2, 9, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 9, 14, '', 'Decreto No. 0405', '2019-12-31', '0204', '2019-12-31', 'Alternancia', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-08_at_10.39.31_AM.1659994172_62f1803c0a6bb.jpeg', '2019', 22, 3, 'COLOMBIA', 'CALI', NULL),
(73, ' LUZ MILENA', 'CALERO', '31538727', b'1', '2011-03-19', '', 'F', 'Calle 15 # 15-48 B/ La pradera', 'milenacalero12@gmail.com', '3217897741', '1978-02-02', 45, NULL, 'DOLENCIAS EN MIEMBROS SUPERIORES', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(74, 'REALPE MEZA CLARA XIMENA', '', '1061753820', b'1', '2020-08-10', 'ABOGADA', 'F', 'calle 10 No a 04 APTO 205', 'clara_rmeza@hotmail.com', '3122434009', NULL, 29, NULL, 'no ', 1, 2, 'Cedula de Ciudadania', 1, 3, 12, 1, 10, 4, 17, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 17, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(75, 'BASTO CORTES JAMES', NULL, '1144134047', NULL, '2020-02-28', 'administracion de empresas', 'M', 'Carrera 1k # 59b-23 cali', 'jbasto.edu@gmail.com', '3215223612', '0000-00-00', 32, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL, 'COLOMBIA', 'CALI', NULL),
(76, 'CALERO SANCHEZ CLAUDIA DANEYI', '', '38670224', b'1', '2015-06-01', 'Tècnico en salud y seguridad en el trabajo', 'F', 'Cra 17 sur N.2-04', 'caleroclaudia59@gmail.com', '3158813143', NULL, 38, 5, 'no', 1, 11, 'Cedula de Ciudadania', 1, 7, 14, 6, 3, 6, NULL, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 3, 'COLOMBIA', 'CALI', NULL),
(77, 'CASTILLO QUISOBONI JAIRO JAVIER', NULL, '4627752', NULL, '1997-04-16', NULL, 'M', NULL, NULL, '3126569584', '0000-00-00', 58, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(78, ' ADA SHIRLEY', 'HERRERA PINZON', '31536443', b'1', '2011-02-28', 'Secretariado contable en sistemas', 'F', 'Calle14No13-16-2dopisoB/cirovelazco1raetapa', 'shirleyherrera7832@gmail.com', '3154014859', '1976-10-01', 46, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 3, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(79, ' EDUARDO', 'CALONJE LOZANO', '14839072', b'1', '2020-03-02', 'Ingeniero Mecatrónico', 'M', 'CALLE 43 # 69-35 APTO 201 TORRE 5', 'EDUARDO.CALONJE@GMAIL.COM', '3017716868', '1980-10-04', 42, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 27, 1, 7, 4, 17, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 26, 'SI', '', NULL, '', NULL, 'Presencial', '', '', '2020', 1, 1, 'COLOMBIA', 'CALI', NULL),
(80, 'JHONATAN', 'CAMARGO MORENO ', '79760495', b'1', '2020-09-04', 'ADMINISTRADOR DE EMPRESAS', 'M', 'calle farallones 1 - 10 B/ Alfaguara', 'jhonatan.camargo1978@gmail.com', '3505963177', '1978-04-30', 44, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 12, 4, 6, 3, 14, 2, 'PADRE', '0', 1, 'BUENA', b'0', '', NULL, 14, 19, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-17_at_3.32.22_PM.1661877178_630e3bba90400.jpeg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(81, ' WILMER ANDRES', 'CAMILO RODRIGUEZ', '16837312', b'1', '2011-12-15', '', 'M', 'Calle 12 sur número 10 e .57', 'diany192009@hotmail.com', '3193578844', '1977-12-19', 45, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 8, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 33, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(82, ' MARIA NUBIA', 'BEDOYA HINCAPIE', '31520573', b'1', '1999-02-01', 'primaria incompleta', 'F', 'Calle 9 # 1A-12 B/ la Hoajarasca', 'angelamariaparrab@hotmail.com', '3154210427', '1959-09-26', 63, 3, 'Anticuagulada, tiroides y diabetes', 1, 11, 'Cedula de Ciudadania', 1, 1, 14, 6, 1, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '1999', 22, 3, 'COLOMBIA', 'CALI', NULL),
(83, 'DIEGO FERNANDO', 'CAMPO JIMENEZ ', '6335170', b'1', '2014-07-02', 'TECNOLOGO EN FORMULACIÓN DE PROYECTOS DE INVERSIÓN', 'M', 'Transversal 4 # 12 64', 'campodiego434@gmail.com', '3045884026', '1985-12-09', 37, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 3, 1, 4, 5, 23, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 23, 33, '', '', NULL, '', NULL, 'Presencial', '', '', '2014', 22, 3, 'COLOMBIA', 'CALI', NULL),
(84, ' CARLOS EFREN', 'BEJARANO ARCE', '6398967', b'1', '2011-12-15', 'Operario Maquinaria Amarilla ', 'M', 'Calle 33 H No. 25 A 52', 'francyjenny1978@hotmail.com', '3147504441', '1963-03-14', 59, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 2, 14, 6, 3, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(85, ' DANNY VANESSA', 'CAMPO MAFLA', '1144041646', b'1', '2017-04-18', 'AGENTE DE TRANSITO ', 'F', 'carrera 15 sur # 2 - 20', 'dannyvanessa91@gmail.com', '3246831431', '1991-01-07', 32, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 29, 1, 3, 5, 19, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'null', '', '', '2017', 22, 3, 'COLOMBIA', 'CALI', NULL),
(86, ' HAROLD ARTURO', 'GIRALDO SALCEDO', '16824578', b'1', '2014-07-10', 'Empleado', 'M', 'calle 10 No. 6-41', 'haroldgs2014@hotmail.com', '3215061757', '1964-10-04', 58, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 14, 6, 1, 2, NULL, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'Presencial', '', '', '2014', 22, 3, 'COLOMBIA', 'CALI', NULL),
(87, 'FERNELLY', 'QUIJANO CERQUERA ', '1130588706', b'1', '2020-04-30', 'Abogado', 'M', 'Carrera 19 # 8-109 apto. 801 T3', 'fernellyquijano@hotmail.com', '3187907130', '1986-10-01', 36, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 2, 15, 1, 7, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Fernelly_Quijano.1662999111_631f5a476908f.jpeg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(88, ' CLAUDIA LLURANY', 'CAMPO OROZCO', '1112459608', b'1', '2015-12-31', '', 'F', 'barrio Villa Flor', 'CAMPOOROZCOCLAUDIA2385@HOTMAIL.COM', '3233278565', '1985-02-23', 37, 2, 'NINGUNA', 1, 2, 'Cedula de Ciudadania', 1, 1, 12, 5, 2, 2, 9, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(89, 'CONSUELO', 'CANDELA LOURIDO', '34513036', b'1', '2020-02-26', 'ABOGADA', 'F', 'Cra 19a No- 8-93', 'NILSONANDRES@LIVE.COM', '3135242211', '1967-03-23', 55, 2, 'NINGUNA', 1, 2, 'Cedula de Ciudadania', 2, 1, 12, 1, 8, 4, 17, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(90, 'BELTRAN PEÑA YESID ALEJANDRO', '', '94522783', b'0', '2012-01-17', '', 'M', 'CRA 9 A 24-39', 'nanobeltranpena@gmail.com', '3187679247', NULL, 43, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 8, 5, NULL, 4, 17, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 17, NULL, '', '', NULL, '', NULL, 'null', '', '', '0', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(91, 'ANYELI VANESSA', 'PEREZ PULGARIN ', '1112477118', b'1', '2013-02-18', 'administraciòn pùblica', 'F', 'Carrera 16 No. 19-31 La Pradera ', 'avpp104@gmail.com', '3166230592', '1992-10-04', 30, 0, 'Hipoteroidismo', 1, 2, 'Cedula de Ciudadania', 1, 1, NULL, 5, 6, 2, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'null', '', '', '2013', 22, 4, 'COLOMBIA', 'CALI', NULL),
(92, 'MARIA CRISTINA', 'LEGARDA MARTINEZ ', '59821070', b'1', '2020-05-04', 'BACHILLER', 'F', 'Conjunto Paseo de Pangola, torre D apto 807', 'cristina.legardam@gmail.com', '3178072549', '1971-10-02', 51, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 12, 1, 2, 2, 5, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 5, 10, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 2, 'COLOMBIA', 'CALI', NULL),
(93, 'OSCAR JAVIER', 'RESTREPO ABONIA', '1151967989', b'1', '2020-07-01', 'tecnologo agroambiental', 'M', 'Cra 1s #9-40', 'restrepoaboniaoscar@gmail.com', '3146803448', '1998-10-04', 24, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 6, 1, 4, 2, 5, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 5, 10, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Oscar_Javier_Restrepo_Abonia.1663622966_6328df367869f.jpeg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(94, 'LUZ ELENA', 'BERMUDEZ LUCUMI ', '31534721', b'1', '2011-12-15', 'Bachiller Academico', 'F', 'vereda paso de la bolsa', 'luz2012elenita@hotmail.com', '3153013226', '1973-12-14', 49, 2, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 2, 1, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(95, 'CAÑAVERAL URIBE NILSON JULIAN', NULL, '16836826', NULL, '2011-12-26', NULL, 'M', NULL, 'juliancanaveral02@gmail.com', '3178546228', '0000-00-00', 46, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(96, 'GLORIA INES', 'CAPOTE', '31523612', b'1', '1998-01-02', 'TECNICO ADMINISTRATIVO', 'F', 'CARRERA 5 #20-24', 'gloriacapote@gmail.com', '3164824399', '1963-06-08', 59, 1, 'LESIÓN DE MENISCO Y LIGAMENTO INTERNO RODILLA DERECHA -QUISTE INTERNO RODILLA IZQUIERDA', 1, 4, 'Cedula de Ciudadania', 1, 2, 5, 1, 3, 2, 9, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 9, 14, '', 'RESOLUCION 198', '1998-01-02', '017-1998', '1997-12-24', 'Presencial', '', 'views/archivos/fotos/Gloria_Ines_Capote_.1663618585_6328ce1907d75.jpg', '1998', 22, 3, 'COLOMBIA', 'CALI', NULL),
(97, 'JUAN DAVID', 'BERMUDEZ OCAMPO', '1112470386', b'1', '2015-06-10', 'Técnico en Producción Agropecuaria', 'M', 'corregimiento de timba', 'juanpintura2014@gmail.com', '3126132217', '1990-04-07', 32, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 7, 14, 6, 3, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 33, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 3, 'COLOMBIA', 'CALI', NULL),
(98, 'CARABALI  EDUARD RAMIRO', NULL, '14675129', NULL, '2004-01-19', 'basica primaria', 'M', NULL, 'kimberly1199@hotmail.com', '3105941454', '0000-00-00', 61, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(99, 'CARABALI  ROBERTO', NULL, '10488558', NULL, '2020-04-07', 'bachiller academico', 'M', NULL, 'robertocarabali8@gmail.com', '3115594698', '0000-00-00', 48, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(100, ' IVAN FELIPE', 'BETANCOURT MIRA', '1112468796', b'1', '2019-04-02', 'tecnico en administracion de empresas', 'M', 'Cl 14 # 19-78 Carbonero Parque Residencial', 'felipe10betancourt@hotmail.com', '3125082103', '1989-12-09', 33, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 30, 5, 3, 5, 26, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '2019', 22, 3, 'COLOMBIA', 'CALI', NULL),
(101, 'CARABALI ARBOLEDA LAURA DEL MAR', '', '1112480928', b'1', '2019-02-01', 'lenguas extrangerasen curso', 'F', 'torres del portal de jamundí Torre 12a Apto 5', 'laura.carabali02@usc.edu.co', '3172303902', NULL, 28, 1, 'no', 1, 2, 'Cedula de Ciudadania', 2, 1, 12, 5, 6, 2, 9, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 9, NULL, '', '', NULL, '', NULL, 'null', '', '', '2019', 22, 3, 'COLOMBIA', 'CALI', NULL),
(102, 'CARABALI BALANTA ERENIAS', NULL, '16824046', NULL, '2002-11-19', 'Bachiller Academico', 'M', NULL, NULL, '3127458801', '0000-00-00', 60, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(103, 'ADIELA', 'BETANCOURT RIOS ', '48574708', b'1', '2020-07-07', 'Abogada', 'F', 'calle 10 no. T9-87', 'adielabetancourtrios29@gmail.com', '3106515780', '1980-01-29', 43, 2, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 9, 1, 7, 5, 26, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '', '2020-07-07', '35-01-0253', '2020-07-07', 'Presencial', '', 'views/archivos/fotos/Adiela_betancourth.1663012780_631f8fac860de.jpg', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(104, 'YULI VANESSA', 'CARABALI CARABALI ', '1112470947', b'1', '2020-03-18', 'TECNICA EN ESTETICA', 'F', 'Carrera 6 # 8-32 / Primero de Mayo', 'vanessita0728@gmail.com', '3166378400', '1990-07-28', 32, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 1, 29, 1, 3, 2, 5, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 5, 10, '', '30-16-0155', '2020-03-16', '35-01-0177', '2020-03-02', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(105, 'HERMES', 'CANDELO AGUDELO', '16836990', b'1', '2021-01-26', 'ARQUITECTO', 'M', 'calle14c# t14-34', 'hermescandelo@gmail.com', '3165026502', '1977-10-05', 45, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 14, 5, 6, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 26, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(106, 'CARABALI GARCIA LIBARDO', NULL, '14675220', NULL, '2015-09-06', NULL, 'M', NULL, NULL, '3205935600', '0000-00-00', 55, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(107, ' BLANCA NURY', 'BETANCOURT UL', '29661457', b'1', '2020-02-25', 'administradora de empresas', 'F', 'calle 9B # 54sur-16 Las Flores', 'blancanury.betancourt@gmail.com', '3154610466', '1979-03-20', 44, 0, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 8, 1, 6, 5, 26, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(108, 'CARABALI LUCUMI EDUARDO', NULL, '16830417', NULL, '2012-01-03', 'lic en lengua castellana', 'M', NULL, 'eduardocarabali@yahoo.com', '3148283417', '0000-00-00', 50, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(109, ' SERGIO', 'CARABALI MEZU', '16835504', b'1', '2015-06-09', 'EMPLEADO', 'M', 'CORREGIMIENTO VILLA PAZ', 'cargio33@hotmail.com', '3217366064', '1976-03-23', 47, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 7, 14, 6, 2, 2, 4, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 4, 7, '', '', NULL, '', NULL, 'Presencial', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(110, 'CARABALI MORENO IVAN', NULL, '16827709', NULL, '2014-11-10', 't.p. en secretariado ejecutivo', 'M', NULL, 'icarabalimoreno@yahoo.es', '3136371282', '0000-00-00', 53, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(111, ' FERNANDO SIMON', 'BETANCOURTH TORRES', '1085278478', b'1', '2020-02-28', 'Abogado', 'M', 'Calle 12 N° 13 -28', 'fercho64beto@hotmaill.com', '3128144797', '1989-11-24', 33, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 11, 1, 7, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 26, 'SI', '', NULL, '', NULL, 'Alternancia', '', 'views/archivos/fotos/simon_betancourth.1662560628_6318a97438188.jpg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(112, ' HUGO FERNEY', 'CARABALI VIVEROS', '16833132', b'1', '2019-11-01', 'BIOINGENIERO', 'M', 'Cra 5 sur N° 8a - 70', 'hugocarabali@yahoo.es', '3148720662', '1973-12-15', 49, NULL, 'Hipertensión ', 1, 6, 'Cedula de Ciudadania', 2, 7, 22, 4, 8, 3, 13, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 13, 18, 'SI', '', '2019-11-01', '', '2019-11-01', 'Presencial', '', 'views/archivos/fotos/hugo_ferney_carabali.1662565059_6318bac351ecf.jpeg', '2019', 22, 4, 'COLOMBIA', 'CALI', NULL),
(113, ' MARIA LAURENTINA', 'CARDENAS RENDON', '31419364', b'1', '2012-06-12', 'ABOGADA ESPECIALISTA EN DERECHO ADMINISTRATIVO', 'F', 'CALLE 20 NO. 14-32', 'lauracar1973@gmail.com', '3183605652', '1973-02-14', 50, 2, 'visual', 1, 4, 'Cedula de Ciudadania', 1, 7, 27, 1, 7, 4, 17, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 17, NULL, 'SI', '', '2011-12-23', '', NULL, 'Presencial', '', '', '2012', 22, 1, 'COLOMBIA', 'CALI', NULL),
(114, ' ELIECER', 'BETANCOURTH VEGA', '16838423', b'1', '2001-12-01', 'AGENTE DE TRÁNSITO', 'M', 'calle 9 # 13 - 15', 'guarda_05@hotmail.com', '3145430520', '1978-12-21', 44, NULL, 'TUNEL CARPIANO, HERNIA DISCAL, DISCAPACIDAD VISUAL, MANCHAS EN LA PIEL, ROSACEA, OBESIDAD EN TRATAMIENTO, ', 1, NULL, 'Cedula de Ciudadania', 1, 7, 29, 5, 3, 5, 19, 3, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'null', '', '', '2001', 22, 3, 'COLOMBIA', 'CALI', NULL),
(115, 'WILLIAM ALBERTO', 'CARDONA DUQUE ', '16837685', b'1', '2020-09-11', 'BIOLOGO', 'M', 'Carrera 22A # 2-63', 'williamcardona@gmail.com', '3186420971', '1978-03-18', 44, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 2, 4, 9, 3, 14, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 14, 19, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(116, 'CARDONA ROMAN NESTOR JULIAN', NULL, '1053772180', NULL, '2020-03-13', NULL, 'M', NULL, 'njcardonar@misena.edu.co', '3104634503', '0000-00-00', 35, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, NULL, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(117, 'LIZBETH', 'CARDOZO CUELLAR ', '38666540', b'1', '2019-12-31', 'TECNICO EN SISTEMAS Y MECÁNICA DENTAL', 'F', 'CARRERA 12A #5-41 / 502 TORRE 3 LOS NARANJOS ', 'LZCARDOZO1182@GMAIL.COM', '3222114893', '1982-07-11', 40, 1, 'NINGUNA', 1, 7, 'Cedula de Ciudadania', 1, 7, 50, 5, 3, 5, 23, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 23, NULL, '', '', NULL, '', NULL, 'Alternancia', '', '', '2019', 22, 1, 'COLOMBIA', 'CALI', NULL);
INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`, `pais_nacimiento`, `ciudad_nacimiento`, `otro_municipio`) VALUES
(118, 'MARIELLY', 'BETANCUR AGUDELO ', '41929361', b'1', '2020-08-25', 'Contabilidad sistematizada', 'F', 'Barrio la esmeralda calle 8 # 10-45 ', 'mariellybetancur@hotmail.com', '3218128441', '1973-07-07', 49, 2, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 6, 1, 3, 2, 3, 1, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 5, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Marielly_Betancur.1663622739_6328de5342c44.jpg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(119, 'MAYERLIN', 'CARO VILLAMIL ', '1112483345', b'1', '2020-08-28', 'TECNICO EN ASISTENCIA EN ORGANIZACION DE ARCHIVO', 'F', 'CALLE 21 #3-34 PANAMERICANO', 'mcaro331@gmail.com', '3178708151', '1994-12-06', 28, 0, 'NINGUNA', 1, 7, 'Cedula de Ciudadania', 1, 6, 10, 1, 3, 2, NULL, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 3, NULL, '', 'Decreto 30-16-0247', '2020-08-28', '35-01-0313', '2020-06-17', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(120, 'JOSE LUIS', 'BISCUE ', '14650461', b'1', '2012-12-27', 'TEC LAB GESTION DEL RIESGO Y ATENCION DE DESASTRES', 'M', 'CALLE 10C #1-81 APTO 302 5A', 'jlbiscue@hotmail.com', '3154451317', '1973-03-07', 50, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 8, 1, 3, 2, 3, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 3, 3, '', '', '2012-01-10', '', NULL, 'Presencial', '', '', '2012', 22, 4, 'COLOMBIA', 'CALI', NULL),
(121, 'BLANCO GALLEGO LEOVIGILDO', NULL, '2678686', NULL, '2015-10-30', NULL, 'M', NULL, 'vigildoblanco@gmail.com', '3023687582', '0000-00-00', 50, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(122, 'ROGER ALEXANDER', 'CEBALLOS CALDAS ', '6334138', b'1', '2011-12-23', 'Administrador de Empresas ', 'M', 'Carrera 1 No. 4b-07 casa 6', 'rogeracc0014@hotmail.com', '3045894274', '1985-08-05', 37, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 8, 14, 6, 6, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 28, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(123, ' FERNELLY', 'CHAGUENDO RAMIREZ', '16834756', b'1', '2011-02-28', 'TECNICO EN SEGURIDAD INDUSTRIAL', 'M', 'calle 14 trasv 14 t 54B/ SACHAMATE', 'fernelychramirez@gmail.com', '3157006139', '1973-08-10', 49, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 3, 6, NULL, 1, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 33, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(124, 'CHALARCA DOMINGUEZ LUIS ALBERTO', NULL, '16845078', NULL, '2011-12-23', NULL, 'M', NULL, 'makondo1205@hotmail.com', '3002765342', '0000-00-00', 39, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(125, 'JOHN JAVIER', 'ESTUPIÑAN ESTUPIÑAN ', '14471584', b'1', '2020-04-06', 'Tecnología en Electrónica - Lic. en Matemáticas y Fisica', 'M', 'KR 10A 58-84 AP 302 BR LA BASE', 'johneses@gmail.com', '3162517970', '1981-01-17', 42, NULL, 'Hipertensión', 1, 1, 'Cedula de Ciudadania', 1, 7, 8, 1, 4, 2, 3, 2, 'PADRE', '1', 0, 'MAL', b'0', '', NULL, 3, 5, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(126, 'FACUNDO PENAGOS MARIVEL', '', '1112465724', b'0', '2015-12-31', '', 'F', 'Calle 16 N° 7 - 21', 'marivelfacundo@gmail.com', '3178953148', NULL, 122, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, NULL, 5, NULL, 4, 17, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 17, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(127, 'FAJARDO NAVARRO MARTHA YANETH', NULL, '31536517', NULL, '2015-02-04', 'basica primaria', 'F', NULL, 'jessicalocura.2009@hotmail.com', '3167504377', '0000-00-00', 45, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(128, 'DIANA SHIRLEY', 'FERNANDEZ', '1130659248', b'1', '2020-03-03', 'Técnico en Asistencia de organización de archivos', 'F', 'Carrera 1 C 4 No 79-16', 'angela28081ul@gmail.com', '3168794235', '1988-01-21', 35, 2, 'NINGUNA', 1, 8, 'Cedula de Ciudadania', 1, 7, 5, 1, 3, 2, 4, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, 8, '', 'decreto 30-16-0089 ', '2020-03-03', '35-01-0145', '2020-02-11', 'Presencial', '', 'views/archivos/fotos/Diana_Shirley_Fernandez.1663618753_6328cec1af2f2.jpeg', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(129, 'FERNANDEZ RUIZ YOLANDA', '', '31909358', b'0', '1995-01-23', '', 'F', '', 'yolisferu@hotmail.com', '3117223007', NULL, 122, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 29, 1, NULL, 4, 17, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 17, NULL, '', '', NULL, '', NULL, 'null', '', '', '1995', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(130, 'FRANCISCO HULMER', 'FERNANDEZ YULE', '16823848', b'1', '2016-01-21', 'Técnico en Vigilancia ', 'M', 'Vereda Pueblo nuevo, Potrerito - Jamundí', 'franciscofyule972@gmail.com', '3156506391', '1964-07-13', 58, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 8, 5, 2, 2, 6, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 6, 11, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/foto_francisco_hulmer_fernandez_yule.1661875552_630e35607a3af.jpeg', '2016', 22, 1, 'COLOMBIA', 'CALI', NULL),
(131, ' CARLOS MARIO', 'FERNANDEZ ZARAMA', '15816373', b'1', '2020-03-03', 'derecho', 'M', 'conjunto la Estación apto 505 torre d Popayán ', 'cmario482@hotmail.com', '3128207769', '1982-05-04', 40, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 9, 1, 7, 4, 17, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 17, 24, 'SI', '0062 ', '2020-03-03', '0144', '2020-02-11', 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(132, ' AUGUSTO', 'FIGUEROA GOMEZ', '10554070', b'1', '2015-06-15', '', 'M', 'CARRERA 15 # 24-20 BARRIO LA PRADERA.', 'sintraxamundi@gmail.com', '3155771359', '1959-04-20', 63, NULL, 'HIPERTENSO', 1, NULL, 'Cedula de Ciudadania', 2, 7, 14, 6, 1, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(133, 'FILIGRANA BELALCAZAR FERNANDO JOSE', NULL, '1112464499', NULL, '2011-12-15', NULL, 'M', NULL, NULL, '3168470095', '0000-00-00', 34, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(134, 'CESAR ALFONSO', 'FORERO MOLANO ', '80539040', b'1', '2020-03-16', 'Ingeniero de sistemas e informática ', 'M', 'Cra 83a 48-24 Caney', 'forecesar@gmail.com', '3203639319', '1974-05-30', 48, NULL, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 1, 27, 1, 8, 4, 17, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '30-16-0174', '2020-03-16', '35-01-0175', '2020-03-02', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(135, ' NILSE EDITH', 'FORY', '31536110', b'1', '2015-06-17', 'bachiller academico', 'F', 'corregimiento paso de la bolsa', 'nilsefori188@gmail.com', '3108414025', '1975-05-11', 47, 0, 'HIPERTENSO', 1, 4, 'Cedula de Ciudadania', 2, 3, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(136, ' JOSE LUIS', 'FRANCO RODRIGUEZ', '16827229', b'1', '2011-12-29', 'CONSTRUCTOR ', 'M', 'Cra1rabsurNo5-29B/PORTALDELJORDAN ', 'josebombero11@gmail.com', '3173472185', '1967-12-15', 55, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 3, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(137, 'GALINDO SANCHEZ ZOILA NUBIA', '', '31531426', b'1', '2002-09-02', 't.p. en secretariado ejecutivo', 'F', 'Carrera 17 sur N.2-73', 'nubia_galindo2009@hotmail.com', '3104342564', NULL, 49, 2, 'no', 1, 1, 'Cedula de Ciudadania', 1, 1, 9, 1, 3, 2, 9, 1, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 9, NULL, '', '', NULL, '', NULL, 'null', '', '', '2002', 22, 4, 'COLOMBIA', 'CALI', NULL),
(138, 'CHALARCA DOMINGUEZ MARIA VIVIANA', '', '31523370', b'1', '2010-01-29', 'primaria', 'F', 'cra 5ta 10a 02 popular', '', '3162814658', NULL, 57, 1, 'no', 1, 4, 'Cedula de Ciudadania', 1, 7, 14, 6, 1, 6, NULL, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2010', 22, 3, 'COLOMBIA', 'CALI', NULL),
(139, ' VALENTINA', 'MORENO VIVEROS', '1143839858', b'1', '2020-01-02', 'Ingeniera Electrónica', 'F', 'CALLE 12 SUR #10-81  apto 504D', 'vamovi11@gmail.com', '3137651347', '1991-10-11', 31, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 25, 4, 8, 3, 13, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 13, 18, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(140, 'JULIANA ANDREA', 'GALLEGO DIAZ ', '1112480319', b'1', '2020-07-07', 'Tecnico Auxiliar Administrativo', 'F', 'Cra 7 #8-21', 'juli_gadiaz@hotmail.com', '3176381714', '1993-12-08', 29, 2, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 17, 1, 3, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(142, ' LUIS ALEXIS', 'GALVIS MINA', '1144141544', b'1', '2020-03-06', '', 'M', 'carrera 7C bis # 70-79', 'LUISGALVISM1@GMAIL.COM', '3185311818', '1990-08-16', 32, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 1, 27, 1, NULL, 5, 26, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(143, 'CHAPARRO TORO ANA MARIA', NULL, '31321507', NULL, '2020-01-02', NULL, 'F', 'CARRERA 46 #1-124', 'am.chaparro260@gmail.com', '3209037009', '0000-00-00', 38, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 5, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL, 'COLOMBIA', 'CALI', NULL),
(144, ' MARIA DEL CARMEN', 'GARCES MONTAÑO', '1111764828', b'1', '2020-02-28', 'Abogada', 'F', 'Cll 6·1csur49MultifamiParquesdeCastilla2', 'Mdcgarces.mg@gmaIl.com', '3148648213', '1988-08-06', 34, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 7, 14, 1, 6, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 24, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(145, 'GARCIA ARCE DIDASIO', NULL, '16837857', NULL, '2011-12-23', NULL, 'M', NULL, 'nicojuanas1923@gmail.com', '3104969576', '0000-00-00', 44, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(146, 'ESCOBAR OSPINA VANESA', '', '1144091731', b'1', '2020-09-09', 'ciencia politica y antropología', 'F', 'boulevar la fontana condomio lagos de verde a', 'vescobarchat@hotmail.com', '3044582751', NULL, 25, 0, 'no', 1, 4, 'Cedula de Ciudadania', 1, 1, 21, 4, 6, 3, 13, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 13, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(147, 'AYDE', 'GARCIA ', '38670058', b'1', '1999-02-01', 'Bachiller academico', 'F', 'Calle 3D # 3 Sur-60 B/ Villa Tatiana', 'varejonal62@gmail.com', '3127783239', '1962-05-06', 60, 2, 'Túnel del carpio, problemas depresivos e hipertensión y principio de glaucoma', 1, 11, 'Cedula de Ciudadania', 2, 1, 14, 6, 2, 6, NULL, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '1999', 22, 4, 'COLOMBIA', 'CALI', NULL),
(148, 'GARCIA BEDON JOSE MANUEL', NULL, '76289158', NULL, '2016-01-15', 'Bachiller Academico', 'M', NULL, 'mojorro2015@hotmail.com', '3155893418', '0000-00-00', 51, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(149, ' LUZ ANGELA', 'GARCIA MOLANO', '31527556', b'1', '2012-12-13', 'Tecnico Secretariado ejecutivo', 'F', 'Cra 14a N° 16-62 La pradera', 'langelita68@hotmail.com', '3148852488', '1968-09-02', 54, 2, 'NINGUNA', 1, 6, 'Cedula de Ciudadania', 1, 7, 2, 1, 3, 2, 3, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 3, 3, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Luz_Angela_Garcia_Molano.1663611013_6328b085958ac.jpg', '2012', 22, 3, 'COLOMBIA', 'CALI', NULL),
(150, 'GARCIA PATIÑO JONATHAN STEVEN', NULL, '1110489185', NULL, '2020-09-15', 'ingenieria agroindustrial', 'M', NULL, 'joesgar89@gmail.com', '3166195611', '0000-00-00', 32, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL, 'COLOMBIA', 'CALI', NULL),
(151, ' RAMIRO', 'GARCIA RIVERA', '16820867', b'1', '1995-02-01', '', 'M', 'Carrera 13 # 8-81 B/ La estación ', 'onesimovillamil@hotmail.com', '3166750014', '1956-08-12', 66, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 7, 1, 1, 2, 4, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '1995', 22, 3, 'COLOMBIA', 'CALI', NULL),
(152, ' BLANCA VIVIANA', 'GARCIA SANTAMARIA', '31528019', b'1', '1998-04-16', 'Contadora pùblica', 'F', 'Viaparquecentral#254CiudadcountryAlondra', 'viviana.garciasantamaria@gmail.com', '3113691424', '1968-09-22', 54, 0, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 13, 1, 7, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 22, 'SI', '', NULL, '', NULL, 'null', '', '', '1998', 22, 4, 'COLOMBIA', 'CALI', NULL),
(153, ' FABIO ALBERTO', 'GARCIA SANTAMARIA', '16624678', b'1', '2011-12-23', 'Bachiller academico', 'M', 'Carrera 1A sur # 5A-29 Portal del Jordán', 'garciasantamaria1959@gmail.com', '3122593958', '1959-05-08', 63, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 1, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(154, 'GARCIA VIERA SANDRA IVONNE', NULL, '1144031652', b'1', '2020-03-19', 'profesional en recreación', 'F', 'Carrera 44 N. 18-80', 'sandra.garcia@correounivalle.edu.co', '3147317856', '0000-00-00', 32, 1, 'no', 1, 1, '\"CEDULA DE CIUDADANIA\"', 1, 1, 9, 1, 10, 2, 4, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3, 'COLOMBIA', 'CALI', NULL),
(155, 'DIANA JIMENA', 'CHARRUPI GOMEZ ', '1067461067', b'1', '2020-03-04', 'INGENIERO INDUSTRIAL', 'F', 'CRA 5AS Nº 8A-10 LA ARBOLEDA', 'dianacharrupi@gmail.com', '3146538873', '1986-08-24', 35, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 3, 11, 1, 10, 2, 26, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 27, NULL, '', '30-16-0100', '2020-02-11', '35-01-0151', '2020-03-04', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_11.04.06_AM.1660061648_62f287d0e5844.jpeg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(156, 'GLORIA ESTELLA', 'GIL RIOS', '38670336', b'1', '2019-12-31', 'Regente de Farmacia - Auxiliar de Enfermería ', 'F', 'Cra 6 nº 8A -57 Urb La Arboleda', 'gollita_0711@hotmail.com', '3115112578', '1980-11-07', 42, 0, 'Enfermedad Renal ', 1, 5, 'Cedula de Ciudadania', 3, 3, 28, 5, 4, 5, 27, 2, 'NO', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', '2020-01-02', '0201', '2019-12-31', 'Presencial', '', '', '2019', 22, 3, 'COLOMBIA', 'CALI', NULL),
(157, 'GIRALDO ROJAS IVONNE', '', '38665189', b'1', '2021-01-08', 'ODONTOLOGA', 'F', 'CALLE 11 No.4-80 Belalcazar', 'ivonnegiraldorojas@gmail.com', '3206173437', NULL, 39, 2, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 7, 6, 4, 6, 3, 14, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 14, NULL, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 4, 'COLOMBIA', 'CALI', NULL),
(158, 'GUZMAN ESQUIVEL MARIA VICTORIA', NULL, '31849353', b'1', '2011-09-26', 'Economista', 'F', 'Carrera 1k n.59-41', 'mvguzman19@gmail.com', '3005120963', '0000-00-00', 61, 0, 'no', 1, 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 10, 5, 24, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 24, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 1, 3, 'COLOMBIA', 'CALI', NULL),
(159, ' JORGE EFRAIN', 'ENRIQUEZ FERNANDEZ', '12977487', b'1', '2020-03-20', 'Economista', 'M', 'Cl 10C # 1-81 Bl 12A Apto 301 ', 'almacen@jamundi.gov.co', '3163005927', '1962-10-12', 60, NULL, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 1, 7, 11, 1, 6, 4, 15, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 15, 20, '', '0146', '2020-03-20', '35-01-0191', '2020-03-20', 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(160, ' HUGO', 'GIRALDO TORRES', '16822269', b'1', '2017-11-03', 'Salud Ocupacional', 'M', 'calle 5ta ANo 1-52 portal del jordan', 'hugotorres6161@gmail.com', '3148413038', '1961-03-02', 62, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 1, 31, 1, 6, 2, NULL, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 3, NULL, '', '', NULL, '', NULL, 'Presencial', '', '', '2017', 22, 1, 'COLOMBIA', 'CALI', NULL),
(161, 'OSCAR ANDRES', 'MORAN RAMIREZ ', '1112464406', b'1', '2015-06-01', '', 'M', 'Transversal 16 #10-07', 'oscaranmoran@hotmail.com', '3186612206', '1987-10-12', 35, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 8, 14, 6, 2, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 3, 'COLOMBIA', 'CALI', NULL),
(162, ' ELIZABETH', 'ARBOLEDA VEGA', '31522370', b'1', '1988-08-22', 'Secretariado ejecutivo y auxiliar d econtabilidad ', 'F', 'Calle 3c no. 21-108 barrio Anturios', 'lizarboleda61@gmail.com', '3173199965', '1961-05-11', 61, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 13, 1, 2, 2, 3, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 3, NULL, '', '', '1988-08-22', '', NULL, 'Presencial', '', '', '1988', 22, 1, 'COLOMBIA', 'CALI', NULL),
(163, 'GOMEZ RESTREPO CARLOS ENRIQUE', NULL, '10269738', NULL, '2020-03-02', 'administracion de empresas', 'M', NULL, 'cegomez15@hotmail.com', '3006112252', '0000-00-00', 57, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(164, ' GERARDO RAFAEL', 'GUERRERO ROSERO', '2575419', b'1', '2015-06-10', 'BACHILLER TECNICO AGRICOLA', 'M', 'CALLE 17 17-22 B/ LA PRADERA', 'gerardorafaelguero@gmail.com', '3122296024', '1959-04-04', 63, NULL, 'NO', 1, NULL, 'Cedula de Ciudadania', 1, 8, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', 1, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.53.40_AM.1661786756_630cda841267d.jpeg', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(165, 'GOMEZ GOMEZ GERNEY ELIUD', NULL, '16820476', NULL, '2017-01-03', NULL, 'M', NULL, NULL, '3233101232', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(166, ' MARITZA', 'GOMEZ MUÑOZ', '31529729', b'1', '2022-08-10', 'Técnica administrativa', 'F', 'Cra. 15 No. 15-68', 'maritzagomezmu@hotmail.com', '3192341879', '1971-02-02', 52, NULL, 'Hipotiroidismo', 1, 3, 'Cedula de Ciudadania', 1, 8, 8, 5, 3, 2, 5, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 5, 10, '', '35-16-054', '2022-08-10', '35-01-27-167', '2022-08-09', 'Presencial', '', '', '2022', 22, 1, 'COLOMBIA', 'CALI', NULL),
(167, 'ARCE ALTAMIRANO JONATHAN HUMBERTO', '', '1112468669', b'0', '2017-04-11', '', 'M', 'carrera 15a # 9 - 43', 'yoti-8989@hotmail.com', '3206420517', NULL, 32, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 29, 5, NULL, 5, 19, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 19, NULL, '', '', NULL, '', NULL, 'null', '', '', '2017', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(168, 'GONZALES ALVAREZ GUILLERMO LEONIDAS', NULL, '16831983', NULL, '2015-06-05', NULL, 'M', NULL, 'guillermoleonidas@hotmail.com', '3212759367', '0000-00-00', 58, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, 3, 'COLOMBIA', 'CALI', NULL),
(169, 'HERNAN DARIO', 'GUERRON PINTO', '6405961', b'1', '2011-02-25', 'ABOGADA', 'M', 'carrera 8 # 8-85', 'hernang61@hotmail.com', '3192550425', '1982-07-13', 40, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 15, 1, 6, 2, 4, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 4, 7, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Hernan_Dario_Guerron_Pinto.1663877209_632cc059950d1.jpeg', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(170, 'JUAN DAVID', 'GONZALEZ AGUDELO ', '1125718020', b'1', '2021-08-26', 'INGENIERO CIVIL', 'M', 'Calle22b no 19 120 apto 515D', 'JUDGONZALEZAG@GMAIL.COM', '3155387921', '1986-03-26', 36, 1, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 1, 29, 5, 8, 4, 17, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 23, 'SI', '35-01-200', '2021-08-26', '35-01-200', '2021-08-26', 'Presencial', '', '', '2021', 22, 1, 'COLOMBIA', 'CALI', NULL),
(171, 'GONZALEZ ARICAPA DUVALIER', NULL, '6498997', NULL, '2020-03-10', 'administracion de empresas', 'M', NULL, NULL, '3166915711', '0000-00-00', 43, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(172, ' MAIRA ALEJANDRA', 'GONZALEZ BALANTA', '1112475284', b'1', '2018-07-18', '', 'F', 'CORREGIMIENTO DE VILLA PAZ', 'saraysalome1503@gmail.com', '3147400004', '1991-06-23', 31, NULL, '', 1, NULL, 'Cedula de Ciudadania', 2, 1, 14, 4, 2, 6, NULL, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/IMG-20220824-WA0064_-_Maira_Alejandra_Gonzalez_Balanta.1661802850_630d1962bdd88.jpg', '2018', 22, 4, 'COLOMBIA', 'CALI', NULL),
(173, ' VELKIYENIFER', 'GUEVARA IDARRAGA', '31537582', b'1', '2019-12-31', 'AUXILIAR ENFERMERIA', 'F', 'Cra 7 Nº 16B-24 Bello Horizonte', 'belki.guevara31@gmail.com', '3155344946', '1977-01-31', 46, 2, 'NINGUNA', 1, 2, 'Cedula de Ciudadania', 1, 1, 23, 5, 3, 2, 3, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 3, 5, '', '0409', '2019-12-31', '0197', '2019-12-31', 'Presencial', '', 'views/archivos/fotos/Velki_Yennifer_Guevara.1663613747_6328bb333cd14.jpeg', '2019', 22, 1, 'COLOMBIA', 'CALI', NULL),
(174, ' YOLANDA', 'RODAS LONDOÑO', '41775475', b'1', '2012-11-30', 'ECONOMIA', 'F', 'Av. chipayakm1CondominioSenderodelasMercedes', 'yolarodas@hotmail.com', '3003267293', '1959-10-12', 63, 1, 'HIPERTENSO-CONDROMALACIA GRADO 4', 1, 4, 'Cedula de Ciudadania', 1, 1, NULL, 1, 6, 4, 27, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '2012', 22, 1, 'COLOMBIA', 'CALI', NULL),
(175, 'NATHALIA', 'GONZALEZ CHARA', '1112492327', b'1', '2020-07-31', 'TECNOLOGA DE SISTEMAS DE INFORMACION', 'F', 'calle 10 c# 1-81', 'onza1000@hotmail.com', '3219192799', '1997-08-31', 25, 0, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 2, 3, 8, 1, 4, 2, 3, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '35-16-013', '2020-07-31', '', '2020-07-13', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(176, 'JHON EDISON', 'GUTIERREZ GUTIERREZ ', '1112463251', b'1', '2015-06-11', '', 'M', 'Calle 13b nm 49 sur 45', 'jhongugu32@hotmail.com', '3163240318', '1987-06-17', 35, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 3, 14, 6, 3, 6, NULL, 1, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(177, 'GUTIERREZ MOLANO DAVID ALEXANDER', '', '1061739022', b'1', '2021-08-26', 'abogado', 'M', 'Km 21 vía Cali-Jamundí cedros del castillo ca', 'davidgutierrezm@hotmail.com', '3103821698', NULL, 30, 0, 'NO', 1, 3, 'Cedula de Ciudadania', 1, 7, 29, 4, 10, 3, 14, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 14, NULL, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 1, 'COLOMBIA', 'CALI', NULL),
(178, 'DIEGO', 'GUZMAN BALANTA ', '16827292', b'1', '2015-06-10', '', 'M', 'Calle 21#5-32B/panamericano', 'paratodocelu8@gmail.com', '3133206610', '1968-08-24', 54, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 7, 14, 6, 1, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(179, 'CAMPO JIMENEZ MAURICIO ESTEBAN', NULL, '1112465316', NULL, '2017-11-01', NULL, 'M', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(180, 'DIEGO ALBERTO', 'VEGA BARONA ', '79748411', b'1', '2001-01-02', 'Economista', 'M', 'Condominio Campestre Solares la Morada Etapa 7y8 Casa 5 Manzana C ', 'divega20@hotmail.com', '3104745299', '1977-10-12', 45, NULL, 'NINGUNA', 1, 2, 'Cedula de Ciudadania', 2, 8, 13, 4, 7, 3, NULL, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 18, 24, 'SI', '3', '2001-01-02', '006', '2001-01-02', 'Presencial', '', 'views/archivos/fotos/Diego_Alberto_Vega_Barona.1663602776_6328905853bd8.jpeg', '2001', 22, 3, 'COLOMBIA', 'CALI', NULL),
(181, 'CARLOS FERNANDO', 'GUZMAN GALVIS', '16837949', b'1', '2015-07-04', '', 'M', 'CRA 8  #9-06', 'cafeguz2@gmail.com', '3155377049', '1978-07-12', 44, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 5, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(182, 'COLLAZOS HERNANDEZ ALVARO', '', '16822907', b'0', '1993-04-02', '', 'M', 'cra 1 bis sur 5A 37', 'alvaro.collazos@hotmail.com', '3116170767', NULL, 59, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 13, 1, NULL, 4, 17, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 17, NULL, '', '', NULL, '', NULL, 'null', '', '', '1993', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(183, 'GUZMAN GALVIS OMAR HUMBERTO', NULL, '94402899', NULL, '2015-09-06', NULL, 'M', NULL, 'oguzmangalvis@hotmail.com', '3154721455', '0000-00-00', 48, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(184, ' JULIO CESAR', 'LAGUNA DIAZ', '16843844', b'1', '2015-06-01', 'TRABAJADOR OFICIAL ', 'M', 'ARBORE COUNTRY CLUB', 'juliolaguna1982@gmail.com', '3108971563', NULL, 40, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 3, 7, 14, 6, 4, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(185, 'MONICA', 'LARRAHONDO GONZALEZ ', '31539577', b'1', '2020-01-13', 'ADMINISTRADOR EMPRESAS', 'F', 'CALLE 9 #10-21 Juan Ampudia', 'monila_20@hotmail.com', '3187936337', '1978-08-20', 44, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 7, 5, 6, 2, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 38, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(186, 'ALBANIA', 'GUZMAN GUTIERREZ ', '31537154', b'1', '2015-06-15', 'Técnico en seguridad y salud en el trabajo', 'F', 'Calle 11 transversal 14-23 barrio Sachamate ', 'alba102010@hotmail.com', '3107069162', '1975-05-05', 47, 3, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 1, 1, 14, 6, 3, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 3, 'COLOMBIA', 'CALI', NULL),
(187, 'EFIGENIA', 'LASSO BALANTA ', '31525254', b'1', '2011-12-23', 'Bachiller ACADEMICA', 'F', 'Corregimiento de Villa paz', 'Efigenialasso.1966@gmail.com', '3147373557', '1966-04-03', 56, 2, 'recomendacion medica por situación en columna vertebral', 1, 11, 'Cedula de Ciudadania', 2, 8, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.58.40_AM.1661786027_630cd7abe3d2f.jpeg', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(188, 'LASSO CARABALI EVERLEY', NULL, '16375052', NULL, '1992-07-13', NULL, 'M', NULL, NULL, '3117861027', '0000-00-00', 63, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(189, ' ARBEY', 'HENAO AVILA', '16824419', b'1', '2020-02-13', 'AGENTE DE TRANSITO', 'M', 'carrera 4 a sur # 8b - 16 B/ el socorro', 'arbeyhenao2018@gmail.com', '3113050614', '1965-06-08', 57, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 29, 1, 3, 5, 19, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(190, ' WILSON', 'COLLAZOS HURTADO', '16835597', b'1', '2020-02-17', 'Agente de transito', 'M', 'Transversal 5c # 12-25', 'Wilssoncollazoshurtado@gmail.com', '3206301152', '1976-08-23', 46, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 29, 1, 3, 5, 19, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 19, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(191, 'LASSO VELEZ JAIME LUIS', NULL, '16827465', NULL, '2010-11-18', NULL, 'M', NULL, NULL, '3147204937', '0000-00-00', 54, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(192, 'COLLAZOS TELLO CARLOS', NULL, '1112461144', NULL, '2015-06-11', NULL, 'M', NULL, NULL, '3186945409', '0000-00-00', 35, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(193, 'PEREA SANCHEZ CARLOS ANDRES', '', '16847369', b'0', '2019-12-31', '', 'M', 'calle 12 sur 1081 apto 502b', 'carlos.perea00@hotmail.com', '3183725006', NULL, 38, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 8, 5, NULL, 4, 17, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 17, NULL, '', '', NULL, '', NULL, 'null', '', '', '0', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(194, ' NESTOR RAUL', 'GONZALEZ RENGIFO', '16828585', b'1', '2016-01-13', 'Bachiller academico', 'M', 'Carrera 4a # 10b30 barrio popular ', 'nestor.gonzalez70@hotmail.com', '3175310190', '1970-01-24', 53, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2016', 22, 4, 'COLOMBIA', 'CALI', NULL),
(195, 'GRANDEZ FLOREZ RESFA NASMILLER', '', '34563789', b'1', '2020-04-27', 'SECRETARIADO EDUCATIVO', 'F', 'CALLE 15D #8-27 CIUDAD SUR', 'resfa229@hotmail.com', '3207851721', NULL, 50, 1, 'No', 1, 4, 'Cedula de Ciudadania', 1, 1, 10, 1, 3, 2, 5, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 5, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(196, ' AURA CARMELA', 'COLORADO MONTAÑO', '66862773', b'1', '2017-08-09', 'Bachiller academico', 'F', 'Calle 21a # 36 sur 18 B/ EL RODEO ', 'auracarmela@hotmail.com', '3117796835', '1971-04-20', 51, 3, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 2, 7, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2017', 22, 3, 'COLOMBIA', 'CALI', NULL),
(197, ' EDUARDO', 'HERNANDEZ ARCOS', '94538658', b'1', '2017-05-07', 'Agente de tránsito ', 'M', 'Cra 28 e 4 72 y 49', 'eduardohernandezarcos@hotmail.com', '3173094762', '1985-01-22', 38, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 29, 1, 3, 5, 19, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'null', '', '', '2017', 22, 1, 'COLOMBIA', 'CALI', NULL),
(198, 'GRIJALBA RAUL', NULL, '16823343', NULL, '2011-02-24', NULL, 'M', NULL, NULL, '3128056981', '0000-00-00', 60, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(199, 'EDGAR', 'GRISALES SANZ ', '16825123', b'1', '1991-04-01', 'Agente de Transito', 'M', 'carrera 11 # 4 - 25 BARRIO EL ROSARIO', 'grisalessanz@hotmail.com', '3168389999', '1966-02-11', 57, NULL, 'Cirugía Corazón abierto', 1, NULL, 'Cedula de Ciudadania', 1, 7, 29, 1, 3, 5, 19, 1, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'null', '', '', '1991', 22, 1, 'COLOMBIA', 'CALI', NULL),
(200, ' CARLOS ANDRES', 'HERNANDEZ DORADO', '16849773', b'1', '2020-07-08', 'TECNICO EN SISTEMAS', 'M', 'calle 10D #5 - cs 16', 'jamundicgs.carloshernandez@gmail.com', '3172924206', '1984-08-18', 38, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 1, 29, 1, 3, 2, 3, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, NULL, '', '', '2020-07-08', '35-01-0265', '2020-07-08', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(201, 'ANGELA MARCELA', 'GUAMANGA MARTINEZ ', '1061777774', b'1', '2020-03-13', 'CONTADORA PÚBLICA', 'F', 'CL 19 17-04', 'algm910@gmail.com', '3174843264', '1995-02-15', 28, 0, 'ASMA', 1, 4, 'Cedula de Ciudadania', 1, 7, 13, 1, 8, 5, 27, 1, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '30-16-0156', '2020-03-13', '', '2020-03-02', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(202, 'LEIDY TATIANA', 'GUAMPE CARABALI', '1144158275', b'1', '2020-04-07', 'Administradora de Empresas', 'F', 'Carrera 11 # 7 -56 Barrio La Esmeralda', 'tati_9216@hotmail.com', '3113195382', '1992-05-15', 30, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 6, 1, 6, 5, 27, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', '2020-04-07', '35-01-0202', NULL, 'Alternancia', '', 'views/archivos/fotos/Leidy_tatiana_Guampe_Carabali.1663622918_6328df06370ed.jpg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(203, 'YALILA', 'HERNANDEZ  IDROBO', '66703526', b'1', '2010-12-15', '\"tècnico de revestimiento estructural. Tècnico en construcci', 'F', 'Carrera5a sur#10c20portaldejamundi', 'yalilahernandez143@gmail.com', '3205498413', '1964-12-06', 58, 4, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 2, 1, 14, 6, 3, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', '', '2010', 22, 2, 'COLOMBIA', 'CALI', NULL),
(204, ' RUTH JANETH', 'OROZCO BALCAZAR', '31527016', b'1', '1988-09-12', 'ABOGADA especalizada en derecho administrativo ', 'F', 'carrera 10 D sur N° 14 bis sur - 24 San Benito  I', 'ruth-janneth@hotmail.com', '3162249963', '1966-10-16', 56, 2, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 3, 12, 1, 7, 4, 17, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 26, 'SI', '', '1988-09-12', '', NULL, 'Presencial', '', 'views/archivos/fotos/Ruth_Yaneth_Orozco.1662995783_631f4d47e8996.jpeg', '1988', 22, 3, 'COLOMBIA', 'CALI', NULL),
(205, ' CRISTIAN DAVID', 'GUERRERO NAVIA', '1112475136', b'1', '2014-08-26', 'en proceso ', 'M', 'carrera 17 #1722', 'cristiandavidguerrero@gmail.com', '3113488994', '1992-02-27', 31, NULL, 'NINGUNA', 1, 7, 'Cedula de Ciudadania', 1, 7, 10, 5, 2, 2, 4, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 4, 7, '', '', '2014-08-26', '', '2014-08-26', 'Presencial', '', '', '2014', 22, 4, 'COLOMBIA', 'CALI', NULL),
(206, ' NANCY STELA', 'HERNANDEZ LEON', '31532161', b'1', '2011-12-30', 'Bachiller academico', 'F', 'condominiolosnaranjosmanzana1torre6apto904', 'nancystellahernandezleon@gmail.com', '3113241783', '1972-03-22', 50, 0, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 1, 1, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(208, ' YONNY FRANCISCO', 'LEGARDA MARTINEZ', '12747976', b'1', '2020-05-05', 'Contador Público', 'M', 'CONJUNTO RESIDENCIAL LA ARBOLEDA TORRE 2 APTO 1008', 'yonnylegarda@hotmail.com', '3113532122', '1979-07-04', 43, NULL, 'NINGUNA', 1, 7, 'Cedula de Ciudadania', 1, 3, 10, 1, 6, 2, 3, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 3, '', 'Decreto 085 de 2020', '2020-05-05', '35 01 0217', '2020-02-11', 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(209, 'LENIS PALACIOS ELIAS', NULL, '1112480270', NULL, '2020-03-02', 'bachiller tecnico', 'M', NULL, 'eliaslenis93@gmail.com', '3225331533', '0000-00-00', 28, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(210, ' DIANA PAMELA', 'HERNANDEZ LLANOS', '1144197513', b'1', '2020-03-19', 'ESTUDIANTE DE CONTADURÍA PUBLICA ', 'F', 'Carrera 24a n.T29-33', 'pamela.her96@gmail.com', '3184940750', '1996-07-04', 26, 0, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 3, 9, 1, 6, 2, 3, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 3, 5, '', '30-16-0158', '2020-03-19', '', '2020-03-02', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(211, ' ROSALBA', 'LEON PAREDES', '31867554', b'1', '1995-02-01', 'Técnico en contabilidad y sistemas', 'F', 'Vereda Tinajas - Robles', 'leonrosalba773@gmail.com', '3153369056', '1961-03-01', 62, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 8, NULL, 1, 3, 5, NULL, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '1995', 22, 4, 'COLOMBIA', 'CALI', NULL),
(212, ' SANDRA VIVIANA', 'LERMA SALAZAR', '38667277', b'1', '2011-12-23', 'Archivo', 'F', 'carrera 7 # 21-32', 'sandralerma41@gmail.com', '3146434805', '1983-09-09', 39, NULL, 'Ninguna', 1, 4, 'Cedula de Ciudadania', 1, 7, 11, 6, 3, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', 'DECRETO 30-16-0097', '2020-02-03', '35-01-0138', '2020-02-11', 'Presencial', '', '', '2011', 22, 3, 'COLOMBIA', 'Jamundi', NULL),
(213, 'HERNANDEZ MUÑOZ ROSA HERLINDA', '', '25543947', b'1', '2020-06-04', 'Bachiller Academico', 'F', 'CARRERA 1 BIS  6 - 117 CANTABRIA ', 'FABIYSEBAS2020H@GMAIL.COM', '3116816779', NULL, 55, 2, 'NO', 1, 1, 'Cedula de Ciudadania', 2, 7, 9, 5, 2, 2, 4, 1, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(214, ' HENRY ALIRIO', 'MEJIA GIRALDO', '16830995', b'1', '2016-03-31', '', 'M', 'Calle8a#8a-01', 'henryalirio25@gmail.com', '3122210644', '1972-03-17', 50, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 3, 7, 29, 5, 3, 5, 19, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 19, NULL, '', '', NULL, '', NULL, 'null', '', '', '2016', 22, 1, 'COLOMBIA', 'CALI', NULL),
(215, 'LOBOA LARRAHONDO ERNEY', NULL, '6336190', NULL, '2002-10-21', 'Bachiller Academico', 'M', NULL, 'erneyloboa0863@gmail.com', '3148930356', '0000-00-00', 58, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(216, 'MELO TRUJILLO KATHERINE ALEXANDRA', '', '1077871783', b'1', '2021-01-07', 'ADMINISTRADORA DE EMPRESAS', 'F', 'Conjunto los naranjos', 'kamelotrujillo@gmail.com', '3202094683', NULL, 26, 1, 'no', 1, 3, 'Cedula de Ciudadania', 1, 7, 8, 1, 10, 5, 27, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(217, 'CAICEDO VALENCIA ANA MARIA', NULL, '1112484992', NULL, '2017-01-03', NULL, 'F', NULL, 'ana-maria1022@hotmail.com', '3178421509', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(218, 'LEYSI CRISTINA', 'HERNANDEZ TORRES ', '1061746925', b'1', '2020-07-17', 'técnico profesional en secretariado ejecutivo', 'F', 'Corregimiento Robles', 'leisy.cristina@hotmail.com', '3216279322', '1992-03-28', 30, 0, 'Estado de gestación', 1, 1, 'Cedula de Ciudadania', 1, 7, 8, 5, 3, 2, 4, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, 8, '', '35-16-012', NULL, '', '2020-07-13', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(219, 'MENDEZ  ROCIO', NULL, '31526902', NULL, '1997-08-25', 'tecnologia en educacion basica primaria', 'M', NULL, NULL, '3146807657', '0000-00-00', 54, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(220, 'ALEJANDRA JANETH', 'JARAMILLO QUINTERO ', '1107091906', b'1', '2020-03-13', 'ABOGADA', 'F', 'calle 8 # 22 - 97 casa 127', 'jaramilloquintero20@gmail.com', '3173628951', '1995-10-19', 27, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 3, 12, 1, 6, 5, 26, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 27, NULL, '', 'DECRETO 0144', '2020-02-03', '35-01-0171', '2020-03-02', 'Presencial', '', 'views/archivos/fotos/Alejandra_Jaramillo.1662996951_631f51d771651.jpg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(221, ' PAULA ANDREA', 'HERRERA MEDINA', '31536805', b'1', '2011-12-23', 'Derecho', 'F', 'Transversal 16 No. 10-81  Sachamate', 'paola2331@hotmail.com', '3155610613', '1976-03-31', 46, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 6, 6, NULL, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 33, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(222, 'JULIO CESAR', 'MENDEZ HOYOS ', '1112478868', b'1', '2017-04-11', 'Agente de transito', 'M', 'Carrera 7 #10-200', 'julio_mendez4@hotmail.com', '3158095787', '1993-05-25', 29, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 29, 5, 3, 5, 19, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'null', '', '', '2017', 22, 3, 'COLOMBIA', 'CALI', NULL),
(223, 'LOBOA SANDOVAL YESID', NULL, '16849146', NULL, '2011-12-15', NULL, 'M', NULL, 'loboa.loboasandoval@hotmail.com', '3226140926', '0000-00-00', 37, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(224, 'JESSICA MARIA', 'ROJAS RAMIREZ ', '1113682638', b'1', '2020-03-16', 'Administración de Empresas', 'F', 'Carrera 17 # 17-124', 'jemrojasra@gmail.com', '3166052565', '1996-10-19', 26, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 13, 1, 6, 5, 27, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(225, 'LONDOÑO CEBALLOS XIMENA', '', '1112474579', b'1', '2021-08-02', 'ABOGADA', 'F', 'Calle 13 # 7-34 piso 2', 'ximeceballo28@hotmail.com', '3102742739', NULL, 30, 0, 'NO', 1, NULL, 'Cedula de Ciudadania', 1, 3, 15, 4, 10, 3, NULL, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 14, NULL, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(226, 'MEZU LUCUMI ROBINSON', NULL, '16834798', NULL, '2011-12-23', NULL, 'M', NULL, 'robin0274@hotmail.com', '3214775553', '0000-00-00', 47, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(227, 'HUMBERTO', 'HERRERA MONTOYA ', '16246598', b'1', '2010-01-13', 'Bachiller academico', 'M', 'Transversal 16 No. 10-81', 'paola2331@hotmail.com', '3114725990', '1953-01-09', 70, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2010', 22, 1, 'COLOMBIA', 'CALI', NULL),
(228, 'ADRIAN BENITO', 'LOPEZ CERON ', '87573936', b'1', '2022-07-01', 'Administrador público', 'M', 'Calle 15t # 11-17 barrio La Esperanza', 'adrianest1@gmail.com', '3164373701', '1980-02-10', 43, NULL, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 7, 28, 1, 8, 5, 27, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '30-16-0059', '2022-07-01', '35-01-0241', '2022-02-11', 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(229, 'MEZU PEÑA NORALBA', NULL, '31525524', NULL, '2002-12-11', 'lic educacion basica primaria', 'M', NULL, 'xgm17@hotmail.com', '3233400033', '0000-00-00', 67, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(230, 'MICOLTA VARGAS CARLOS', NULL, '16821274', NULL, '2011-10-11', 'Bachiller', 'M', NULL, 'carlos_micolta@hotmail.com', '3154258032', '0000-00-00', 63, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(231, 'ROIMAR ARLEY', 'LOPEZ CORAL ', '1086980846', b'1', '2020-02-21', 'ADMINISTRADOR DE EMPRESAS/CONTADOR PUBLICO', 'M', 'CR ARBORE COUNTRY CLUB MZ8CS6 JAMUNDI', 'roiman16@hotmail.com', '3147085418', '1987-07-27', 35, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 3, 7, 8, 1, 7, 4, 17, 2, 'PADRE', '0', 1, 'BUENA', b'0', '', NULL, 17, 25, 'SI', 'DECRETO 30-16-0081', '2020-02-21', '35-01-27-91', '2020-02-11', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(232, ' LILIANA', 'GOMEZ BARONA', '31526685', b'1', '2013-11-07', 'NORMALISTA SUPERIOR - TECNICO EN RECURSOS HUMANOS', 'F', 'CRA 21 BIS N 8SUR 07', 'lilianago.67@hotmail.com', '3166243164', '1967-10-14', 54, 1, 'nodulo tiroideo', 1, 4, 'Cedula de Ciudadania', 2, 7, 10, 1, 3, 2, 3, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 3, 3, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-17_at_2.55.57_PM_(1).1660837206_62fe5d56b2756.jpeg', '2013', 22, 3, 'COLOMBIA', 'CALI', NULL),
(233, ' HERING ULISES', 'MILLER GALLEGO', '16824890', b'1', '2011-01-03', '', 'M', 'Carrera 5 #15 A 14 Barrio el Jardin ', 'heringmiller1@gmail.com', '3152170699', '1965-12-30', 57, NULL, 'Operado tunen del carpo ambas manos,ansiedad, colon irritable, urticaria solar,reflujo gastroesofágico,problema de Bridas, Hemorroides.', 1, NULL, 'Cedula de Ciudadania', 2, 1, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(234, ' RAUL', 'LOPEZ GARCIA', '14890389', b'1', '2011-02-26', 'DOCENTE', 'M', 'KR 17 # 3 - 70 los Naranjos', 'raullopezgarcia46@yahoo.es', '3156975454', '1967-12-26', 55, NULL, 'Por establecer medicamente', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 6, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 28, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(235, 'MINA LOZADA VICTORIA EUGENIA', '', '31447512', b'1', '2012-08-16', 'LICENCIADA EN LENGA CASTELLANA Y COMUNICACIÓN', 'F', 'CORREGIMIENTO VILLA PAZ ', 'vickylosada-25@hotmail.com', '3218297321', NULL, 41, 2, 'NO ', 1, 2, 'Cedula de Ciudadania', 2, 1, 12, 1, 10, 2, 4, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '2012', 22, 1, 'COLOMBIA', 'CALI', NULL),
(236, 'ANGIE MELISSA', 'LOPEZ HURTADO', '1143924681', b'1', '2021-06-01', 'Administradora pública', 'F', 'carrera 49A SUR #20-32', 'anmelohur89@gmail.com', '3165323619', '2022-04-07', 0, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 5, 3, 4, 6, 4, 11, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 11, 16, '', '', '2021-06-01', '30-16-73', NULL, 'Presencial', '', 'views/archivos/fotos/Angie_Melissa_Lopez_Hurtado.1663617328_6328c930cdb24.jpg', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(237, 'MONTOYA ALVAREZ YURANI ANDREA', NULL, '1130671009', NULL, '2017-11-01', NULL, 'F', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL);
INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`, `pais_nacimiento`, `ciudad_nacimiento`, `otro_municipio`) VALUES
(238, 'MARIA VIVIANA', 'HOLGUIN', '31526225', b'1', '2013-08-04', 'Tecnico en administración de empresas 6 semestres', 'F', 'CALLE 17 No. 7-42 piso 2', 'viholba20@hotmail.com', '3008439646', '1967-11-10', 55, 2, 'Perdida visual 100% de un ojo (tiene protesis)', 1, 4, 'Cedula de Ciudadania', 1, 3, 6, 5, 3, 2, 9, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Maria_Viviana_Holguin.1663622565_6328dda55fcd0.jpeg', '2013', 22, 3, 'COLOMBIA', 'CALI', NULL),
(239, ' HERMENCIA', 'MOLINA NAVARRETE', '31522118', b'1', '1995-01-02', 'Contadora pùblica', 'F', 'Carrera 7 N.10-250', 'hermencia@gmail.com', '3153059867', '1962-05-20', 60, 2, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 2, 1, 13, 1, 6, 4, 17, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 22, '', '0199', '2019-06-26', '35-01-27-011', '2019-06-26', 'Presencial', '', '', '1995', 22, 1, 'COLOMBIA', 'CALI', NULL),
(240, 'CLAUDIA LORENA', 'LOPEZ HURTADO', '66967437', b'1', '2020-07-07', 'TRABAJADORA SOCIAL (EN FORMACION)', 'F', 'Calle 12 B Nº 51 sur - 33 Terranova', 'claren79@hotmail.com', '3002353705', '1979-09-19', 43, 2, 'Migraña', 1, 4, 'Cedula de Ciudadania', 2, 3, 31, 1, 6, 2, 3, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 3, 5, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Claudia_Lorena_Lopez_Hurtado.1663619566_6328d1ee026e7.jpg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(241, ' INES', 'HOLGUIN SALGADO', '31445875', b'1', '2015-12-04', 'Administradora de empresas', 'F', 'calle 12 4a-127', 'INHOSA0209@GMAIL.COM', '3175329278', '1979-09-02', 43, 1, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 1, 27, 5, 6, 5, 26, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 27, NULL, '', 'DECRETO 0436', '2020-02-10', '30-16-0055', '2015-12-04', 'Presencial', '', '', '2015', 22, 3, 'COLOMBIA', 'CALI', NULL),
(242, ' JAVIER', 'MONTAÑO BALANTA', '76289004', b'1', '2015-07-10', 'BACHILLER', 'M', 'Las Veraneras Timba - Valle', 'javiermontanobalanta@gmail.com', '3127583399', '1963-04-27', 59, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 2, 14, 6, 2, 6, 7, 3, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 7, 12, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(243, ' LILIANA PATRICIA', 'MONTES ROMERO', '32271552', b'1', '2020-07-07', 'ING. SISTEMAS', 'F', 'CALLE 3 SUR # 21-40', 'ANGELORMO1983@GMAIL.COM', '3145599688', '1986-11-17', 36, 0, 'NINGUNA', 1, 9, 'Cedula de Ciudadania', 1, 7, 14, 1, 6, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 3, '', '35-16-142-2021', '2021-11-22', '', '2021-11-22', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(244, 'LOPEZ SANCHEZ MARIA RUTH', '', '31520989', b'1', '1995-02-01', 'TECNICO EN ASISTENTE ADMINISRATIVIO', 'F', 'Calle 5 No 1 - 12 Portal del Jordan', 'mrjplapa@hotmail.com', '3163294206', NULL, 63, 3, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 1, 5, 1, 3, 5, 2, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 2, NULL, '', '', NULL, '', NULL, 'null', '', '', '1995', 22, 3, 'COLOMBIA', 'CALI', NULL),
(245, 'DEICY LORENA', 'MONTILLA', '1107057600', b'1', '2020-08-07', 'FINANZAS Y NEGOCIOS INTERNACIONALES NO GRADUADA- CONTABILIDA', 'F', 'Calle 15 a No 14- 51', 'montillalorena27@gmail.com', '3123306076', '1989-07-22', 33, 2, 'Hernias Discales', 1, 11, 'Cedula de Ciudadania', 1, 7, 12, 1, 3, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 5, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Lorena_Montilla.1662996797_631f513d5f0da.jpg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(246, 'LUCUMI CORTES OSCAR MARINO', NULL, '6334315', NULL, '2016-01-22', NULL, 'M', NULL, 'olucumi@misena.edu.co', '3206310881', '0000-00-00', 36, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(247, 'MORALES BONILLA JUAN DAVID', NULL, '1112474530', NULL, '2021-02-01', 'TOPOGRAFO', 'M', NULL, 'juanmoraboni@gmail.com', '3147586553', '0000-00-00', 30, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 5, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021', NULL, 3, 'COLOMBIA', 'CALI', NULL),
(248, 'HOYOS ARBOLEDA MONICA', NULL, '1151946402', b'1', '2020-07-09', 'Técnico en archivo y técnico administrativo', 'F', 'Diagonal 45 n.54C-41', 'monicahoy22@gmail.com', '3194721714', '0000-00-00', 29, 0, 'no', 1, 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 11, 1, 3, 2, 4, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3, 'COLOMBIA', 'CALI', NULL),
(249, 'MORALES BONILLA LUIJAN', '', '1112486420', b'0', '2020-09-01', 'BACHILLER', 'M', 'TRANSVERSAL 5A D12-18', '', '3178044017', NULL, 26, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 7, 4, NULL, 2, 10, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 10, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(250, 'EPIFANIA', 'LUCUMI LEON ', '31527378', b'1', '2015-06-11', 'bachiller agricola', 'F', 'corregimiento de chagres', 'epi0408@hotmail.com', '3127579901', '1967-04-08', 55, 4, 'hipertensa', 1, 11, 'Cedula de Ciudadania', 2, 1, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.55.14_AM.1661785616_630cd6109b679.jpeg', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(251, ' ALEXANDER', 'MORALES LORA', '16844746', b'1', '2011-12-27', 'ingenieria electronica', 'M', 'trasv 14# 7-43', 'alexandermoraleslora@gmail.com', '3103829104', '1982-07-24', 40, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 9, 1, 8, 4, 17, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '381', '2011-12-27', '162', '2011-12-27', 'Presencial', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(252, 'LUNA ACOSTA VIVIANA AMPARO', NULL, '29361309', NULL, '2017-11-01', NULL, 'F', NULL, 'amparoluna.1982@gmail.com', '3215721909', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(253, 'ELIZABETH', 'HOYOS HOYOS ', '31529201', b'1', '2020-11-10', 'tecnico auxiliar administrativo', 'F', 'CALLE 22A # 16-31 B/ La pradera', 'isabeth111@hotmail.com', '3147162285', '1968-12-30', 53, 4, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 11, 1, 3, 2, 3, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '35-16-087', '2022-11-03', '35-01-27-231', '2022-12-31', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-16_at_5.00.24_PM.1661877674_630e3daac6d07.jpeg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(254, 'MORENO CARABALI EDUIN ENRIQUE', NULL, '16836815', NULL, '2011-12-16', NULL, 'M', NULL, 'eduinemc@hotmail.com', '3137127007', '0000-00-00', 122, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(255, 'SOFIA DEL PILAR', 'LUCUMI ZAPATA ', '38667799', b'1', '2020-02-21', 'BACHILLER', 'F', 'Cra 8A SUR Nº 8-60 Billa Pyme', 'sofialaspri@gmail.com', '3218864443', '1983-09-26', 39, 2, 'HIPERTENSA', 1, 4, 'Cedula de Ciudadania', 2, 7, 15, 1, 2, 2, 4, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 4, 7, '', '', '2020-02-21', '089', NULL, 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(256, 'MORENO GARCIA CLAUDIA PATRICIA', NULL, '31536079', NULL, '2015-03-02', NULL, 'F', NULL, 'concejojamundi15@hotmail.com', '3173344010', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(257, ' LUZ MERY', 'LUGO CARVAJAL', '31883877', b'1', '2020-07-16', 'ABOGADA', 'F', 'cra 19A# 8-93 Reserva Bambu Casa 2B', 'lumelu_07@hotmail.com', '3013236399', '1962-08-01', 60, 4, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 8, 1, 6, 4, 17, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 25, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/MI_FOTO_-_luz_mery.1661876089_630e3779d7220.jpg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(258, 'MORENO SANCHEZ MYRIAN', NULL, '31524305', NULL, '2011-11-26', NULL, 'F', NULL, 'moreno.myriam@gmail.com', '3217198453', '0000-00-00', 122, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(259, 'MORALES MOLINA JAIME ANDRES', NULL, '98392658', NULL, '2020-02-28', 'Bachiller Academico', 'M', NULL, 'jaime75.morales@gmail.com', '3105034488', '0000-00-00', 46, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(260, 'CORAL PEREA LUCY', '', '66731533', b'1', '2009-07-17', 'ADMINISTRADORA EMPRESAS', 'F', 'CALLE 9 #9-29 Barrio Juan Ampudia', 'coralperea.lucy@gmail.com', '3217239886', NULL, 56, NULL, 'NO', 1, 4, 'Cedula de Ciudadania', 2, 7, NULL, 4, 10, 1, 1, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 1, 1, '', '', NULL, '', NULL, 'null', '', '', '2009', 22, 3, 'COLOMBIA', 'CALI', NULL),
(261, 'NELLY', 'HOYOS HOYOS ', '31969652', b'1', '2020-02-14', 'PSICOLOGA', 'F', 'Calle 3sur 14-37', 'nellyhoy1967@hotmail.com', '3184197110', '1967-10-07', 55, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 6, 1, 7, 5, 26, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Nelly_Hoyos.1663622636_6328ddec8f0a1.jpg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(262, 'CAROLINA', 'MORALES RODRIGUEZ ', '52951560', b'1', '2020-03-19', 'medicina veterinaria', 'F', 'CARRERA 9 N 12-53', 'caro.mr11@gmail.com', '3212663041', '1981-12-11', 41, 0, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 8, 1, 7, 4, 17, 2, 'NO', '0', 0, 'AGRIETADA', b'0', '', NULL, 17, 26, 'SI', '0116', '2020-03-19', '30-16-0116', '2020-02-11', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(263, 'CESAR AUGUSTO', 'LUGO MEDINA ', '16841917', b'1', '2010-12-15', 'Operador de Maquinaria Pesada', 'M', 'Carrera 5 #25-57', 'cesarlugome@gmail.com', '3177922949', '1980-12-10', 42, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 7, 14, 6, 3, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 33, NULL, '', '', NULL, '', NULL, 'null', '', '', '2010', 22, 4, 'COLOMBIA', 'CALI', NULL),
(264, 'JAIME VICENTE', 'CORDOBA MELO ', '87530436', b'1', '2015-10-30', '', 'M', 'carrera 4 b lote No. 3 B/ VILLA PYME ETAPA II', 'jaimevicentecordobamelo@gmail.com', '3107376823', '1963-11-14', 58, NULL, 'NO', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 1, 6, NULL, 2, 'PADRE', '0', 1, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_2.39.45_PM.1661802452_630d17d46640d.jpeg', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(265, ' MARILUZ', 'CHURI AGUILAR', '38665822', b'1', '2020-02-26', 'bachiller tecnico', 'F', 'trans 5c dia12 No. 12 - 40 la adrianita', 'maryluzchury82@gmail.com', '3126474886', '1982-10-20', 40, 2, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 2, 3, 8, 1, 2, 3, 4, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, 8, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(266, 'HURTADO MESA WILMER', NULL, '16785307', NULL, '2015-06-01', NULL, 'M', NULL, 'chinchehurtado@hotmail.com', '3175066141', '0000-00-00', 51, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(267, 'MACHADO PEREZ SARA', '', '1112487304', b'0', '2020-01-02', '', 'F', 'CARRERA 18 SUR #-2-61', 'saramachadope@gmail.com', '3206967761', NULL, 26, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 7, 4, NULL, 2, NULL, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 38, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(268, 'MORAN VICUÑA OSCAR', NULL, '16821398', NULL, '1980-12-12', NULL, 'M', NULL, NULL, '3145378490', '0000-00-00', 62, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(269, 'CORTES MEJIA NELSON FERNANDO', NULL, '6228200', NULL, '2016-02-17', NULL, 'M', NULL, 'ncortes@javerianacali.edu.co', '0', '0000-00-00', 122, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(270, 'JUAN SEBASTIAN', 'MACIAS ORDOÑEZ ', '6333463', b'1', '2011-12-15', '', 'M', 'Calle 14#19-78', 'juansebma@hotmail.com', '3185958248', '1985-04-30', 37, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 14, 6, 2, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(271, 'OSCAR EDUARDO', 'BELTRAN', '1112465887', b'1', '2020-06-28', 'TECN CONTROL AMBIENTAL', 'M', 'Cra 8 N° 17 - 76', 'oscarebeltran7@gmail.com', '3153463049', '1988-10-21', 34, NULL, 'NINGUNA', 1, 6, 'Cedula de Ciudadania', 1, 7, 2, 1, 4, 2, 5, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 5, 10, '', '', '2020-07-15', '', NULL, 'Presencial', '', 'views/archivos/fotos/Oscar_eduardo_Beltran.1663611299_6328b1a3afc98.png', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(272, ' VIVIANA', 'IBARGUEN', '29182079', b'1', '2020-02-25', 'Tecnico en administración de empresas', 'F', 'CRA 54 C Nº 42-14', 'vivianaibarguen1980@gmail.com', '3155212030', '1980-04-24', 42, 3, 'EN ESTUDIO', 1, 4, 'Cedula de Ciudadania', 1, 7, 27, 1, 3, 2, 4, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(273, 'GARCIA PENILLA CRISTHIAN ORLANDO', NULL, '1144052712', NULL, '2020-03-03', NULL, 'M', 'CALLE 31B # T25-57', 'cristhianorlandogarcia@gmail.com', '3104233190', '0000-00-00', 122, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL, 'COLOMBIA', 'CALI', NULL),
(274, ' MARLON EDUARDO', 'MAFLA GOMEZ', '16843505', b'1', '2009-07-21', 'ABOGADA', 'M', 'Calle 9 No 8-55', 'marlonmafla@yahoo.com', '3167267777', '1982-01-20', 41, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 18, 5, 7, 4, 16, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 16, 21, 'SI', '', NULL, '', NULL, 'null', '', '', '0', 22, 1, 'COLOMBIA', 'CALI', NULL),
(275, 'NELLY DEL CARMEN', 'CORTES ORTIZ ', '31891761', b'1', '2020-07-29', 'Abogada', 'F', 'calle 26 A # 10-40 CASA b 22 CONUTRY 3', 'nellydcco1962@gmail.com', '3146203102', '1962-09-09', 60, 3, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 9, 1, 7, 4, 17, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 17, NULL, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(276, 'MARY JASMIN', 'MORENO ZUÑIGA ', '29111329', b'1', '2020-07-07', 'TECNOLOGA FORMULACION PROYECTOS', 'F', 'CARRERA 18 SUR 10A-03 B/ MARBELLA', 'maryjas-26@hotmail.com', '3053166600', '1978-06-26', 44, 2, 'NO', 1, 5, 'Cedula de Ciudadania', 1, 1, 28, 1, 3, 2, 4, 2, 'MADRE', '0', 1, 'BUENA', b'0', '', NULL, 4, 7, '', 'DECRETO 02/47', '2020-07-07', '35-01-0262', '2020-06-17', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-17_at_3.27.17_PM.1660833119_62fe4d5fe35bf.jpeg', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(277, 'IBARRA MERA LUCY MIRELLA', NULL, '66957993', b'1', '2020-07-22', 'PSICOLOGA', 'F', 'Calle 43 Nº 69-35 bloque 4 Apto 203 Ciudad 20', 'santi.y.i@hotmail.com', '3115321873', '0000-00-00', 46, 2, 'NO', 1, 1, '\"CEDULA DE CIUDADANIA\"', 1, 7, 9, 1, 6, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 1, 'COLOMBIA', 'CALI', NULL),
(278, 'MAFLA RODRIGUEZ PEDRO', NULL, '6332162', NULL, '2013-10-21', NULL, 'M', NULL, 'pedromafla56@hotmail.com', '3012629456', '0000-00-00', 65, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(279, 'MIRYAM ANDREA', 'CRUZ ARANGO ', '1106899356', b'1', '2020-12-10', 'ABOGADA', 'F', 'cra 48 c # 47a 25', 'miandreacruzarango@gmail.com', '3105851174', '1997-07-29', 25, NULL, ' NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 8, 1, 7, 5, 27, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '36-16-0052', '2020-12-10', '', '2020-11-11', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(280, 'MORERA POSSO JUAN CARLOS', NULL, '94550781', NULL, '2020-01-07', NULL, 'M', NULL, NULL, '3016948010', '0000-00-00', 36, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 24, 4, NULL, 3, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(281, ' CESAR AUGUSTO', 'MAFLA SALDAÑA', '1112476312', b'1', '2016-04-15', 'Fisioterapeuta ', 'M', 'Carrera 19 # 8-109 apto 506 T1', 'cmaflasaldana@gmail.com', '3173790732', '1992-07-28', 30, NULL, 'Valvulopatía cardíaca incipiente. ', 1, NULL, 'Cedula de Ciudadania', 2, 7, 28, 1, 7, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '', NULL, '', NULL, 'null', '', '', '2016', 22, 3, 'COLOMBIA', 'CALI', NULL),
(282, ' CARLOS ALBERTO', 'MOSCOSO', '16821340', b'1', '1990-12-29', 'Operario Volqueta', 'M', 'Carrera 11 No. 6-30 Apto 102 Edificio JJ', 'carlosmoscoso59@hotmail.com', '3163429409', '1959-09-09', 63, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 5, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '1990', 22, 4, 'COLOMBIA', 'CALI', NULL),
(283, 'CRUZ SAMBONI MARIA FERNANDA', '', '31537374', b'1', '2020-01-02', 'ADMKINISTRADORA PUBLICA', 'F', 'VEREDA VAREJONALCORREGIMIENDO GUACHINTE', '', '0', NULL, 0, 0, 'NO', 1, 4, 'Cedula de Ciudadania', 2, NULL, 3, 4, 6, 3, 14, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 14, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(284, ' MARTHA CECILIA', 'IBARRA MOSQUERA', '66917286', b'1', '2015-06-01', 'bachiller tecnico', 'F', 'Carrera 75 N.1b-135 B/ PRADOS DEL SUR', 'darlinencarnacion0622@gmail.com', '3135814813', '1974-08-01', 48, 2, 'NO', 1, 11, 'Cedula de Ciudadania', 2, 7, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.24.44_AM.1661783869_630ccf3dcfadd.jpeg', '2015', 1, 4, 'COLOMBIA', 'CALI', NULL),
(285, 'CARLOS ANDRES', 'MOSCOSO COLLAZOS', '16843994', b'1', '2011-12-15', 'Bachiller academico', 'M', 'Calle 12 sur #10E-57 Torre D Apto 1003 ', 'Andresmoscoso1982@gmail.com', '3184682849', '1982-05-19', 40, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, NULL, 6, 2, NULL, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(286, 'MAFLA VASQUEZ ROBERTH', NULL, '1112469307', NULL, '2020-07-24', 'bachiller tecnico', 'M', NULL, 'roberthmaflav@gmail.com', '3165351394', '0000-00-00', 32, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(287, 'MARTHA ITALIA', 'CUADROS QUINTANA ', '31524141', b'1', '1993-08-01', 'TECNICO ADMINISTRATIVO', 'F', 'carrera 1 norte 21a - 03', 'marthaicuadrosq@hotmail.com', '3014728547', '1965-08-06', 57, 2, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 8, 12, 1, 3, 5, 9, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Martha_Italia_Cuadros.1662995565_631f4c6deb798.jpeg', '1993', 22, 3, 'COLOMBIA', 'CALI', NULL),
(288, ' LUZ YANIT', 'MOSQUERA FIGUEROA', '25287565', b'1', '2020-02-26', 'TEC LABORAL EN ASIST DE ALTA GERENCIA', 'F', 'CALLE 17 N 12 -05', 'agdcauca@gmail.com', '3104688104', '1980-07-04', 42, 1, 'Hipotiroidismo', 1, 11, 'Cedula de Ciudadania', 1, 7, 25, 1, 3, 2, 3, 1, 'MADRE', '1', 0, 'AGRIETADA', b'0', '', NULL, 3, NULL, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(289, 'MOSQUERA QUINTO FRANCISCO JESUS', NULL, '11705201', NULL, '2004-02-27', 'Bachiller Academico', 'M', NULL, 'franciscomosquera1953@gmail.com', '3206928364', '0000-00-00', 68, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(290, 'MARIN CAMACHO OSCAR MAURICIO', NULL, '1112472724', NULL, '2020-01-02', NULL, 'M', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 31, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(291, 'RODRIGO ANDRES', 'IBARRA PALACIOS ', '1088972397', b'1', '2020-10-28', 'ABOGADO', 'M', 'Calle 1 # 47-15 apto 104D', 'rodrigoibarra.abg@gmail.com', '3175539500', '1989-07-02', 33, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 3, 12, 1, 7, 5, 26, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '', '2020-10-28', '35-01-0341', NULL, 'Presencial', '', 'views/archivos/fotos/Rodrigo_Andres_Ibarra.1662996681_631f50c96a645.jpg', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(292, ' LUZ DARY', 'MOSQUERA TROCHEZ', '34604506', b'1', '2013-01-02', 'ABOGADO - ADMINISTRADOR DE EMPRESAS', 'F', 'Calle 3ANº 92-31 melendez', 'darymto@yahoo.es', '3122188267', '1976-01-27', 47, 2, 'Hipotiroidismo ', 1, 3, 'Cedula de Ciudadania', 3, 1, 15, 1, 7, 5, 27, 1, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '30-16-0357', '2013-01-02', '35-01-0001', '2012-11-30', 'Presencial', '', '', '2013', 22, 1, 'COLOMBIA', 'CALI', NULL),
(293, ' HECTOR ARBEY', 'CUARTAS COMETA', '16839313', b'1', '2011-12-15', 'Bachiller academico', 'M', 'calle 10 N 13-20 B/ simon bolivar', 'arveycuartas1@gmail.com', '3206257590', '1978-05-22', 44, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 3, 8, 14, 6, 2, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(294, 'TRUJILLO ARROYAVE SEBASTIAN', '', '1107079070', b'0', '2020-03-11', '', 'M', '', 'SEBAS_437@hotmail.com', '3185566567', NULL, 28, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 29, 1, NULL, 5, 27, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(295, 'MUÑOZ LUZ ELENA', NULL, '31538256', NULL, '2017-11-01', NULL, 'F', NULL, 'nenamun03@hotmail.com', '3182007272', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(296, 'CUATINDIOY PAPAMIJA ALEXANDER', NULL, '16840317', NULL, '2020-12-02', 'Bachiller Academico', 'M', NULL, '\"alexcupai328@gmail.com', '0', '0000-00-00', 0, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(297, 'MULATO LEDESMA SILVIO ADOLFO', NULL, '16827328', NULL, '2011-02-28', NULL, 'M', NULL, NULL, '0', '0000-00-00', 57, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(298, 'CLAUDIA PATRICIA', 'MAMIAN ', '1061711687', b'1', '2020-08-05', 'Secretaria', 'F', 'Cra 1 N° 10C 55', 'claudiapatico2333@gmail.com', '3217074451', '1988-07-07', 34, 2, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 3, 8, 1, 7, 2, 9, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 9, 14, '', '', '2020-08-05', '', '2020-08-05', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(299, 'IDARRAGA SANCHEZ JEYVER', NULL, '1112482938', NULL, '2017-11-01', NULL, 'M', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(300, 'MUÑOZ ALFONSO ROSALBA', NULL, '39724847', NULL, '2020-03-17', 'Bachiller Academico', 'F', NULL, 'roisamual@hotmail.com', '3128596423', '0000-00-00', 48, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(301, 'CLAUDIA PATRICIA', 'MARIN ARIAS', '30336523', b'1', '2020-02-26', 'ADMINISTRADORA DE NEGOCIOS', 'F', 'Carrera 19 #8-109 Torre 1 Apartamento 502 La Arboleda ', 'cpasuntosetnicos@gmail.com', '3146851004', '1975-06-13', 47, 2, 'NINE - Asma - Fibromialgia ', 1, 12, 'Cedula de Ciudadania', 1, 3, 3, 1, 6, 5, 26, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '', NULL, '', NULL, 'Virtual', '', 'views/archivos/fotos/Claudia_Marín.1663617364_6328c954df01f.jpg', '2020', 22, 2, 'COLOMBIA', 'CALI', NULL),
(302, 'MAYRA ELEONORA', 'CUELLAR RODRIGUEZ ', '38668911', b'1', '2020-04-27', 'TECNOLOGO EN GESTION DE LA SEGURIDAD Y SALUD EN EL TRABAJOL', 'F', 'Carrera 5 sur # 6-56 Parques de Castilla', 'mayra.1114@hotmail.com', '3175085607', '1984-01-16', 39, 2, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 6, 1, 4, 2, 5, 1, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 5, 10, '', '', '2020-04-27', '', NULL, 'Alternancia', '', 'views/archivos/fotos/MAYRA_ELEONORA_CUELLAR_RODRIGUEZ.1663622688_6328de2015a8b.jpg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(303, ' MILTON EDUARDO', 'MUÑOZ ARTEAGA', '16943182', b'1', '2016-03-01', 'AGENTE DE TRANSITO ', 'M', 'jamundi valle B/ ciudad de Dios 1 manzana E casa 14', 'transitoagente1123021982@gmail.com', '3168043743', '1982-02-23', 41, NULL, 'Gastritis y ulcera gastrica', 1, NULL, 'Cedula de Ciudadania', 1, 3, 29, 1, 3, 5, 19, 1, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'null', '', '', '2016', 22, 3, 'COLOMBIA', 'CALI', NULL),
(304, ' KATHERINE  DE JESUS', 'MARIN', '1143828151', b'1', '2020-07-28', 'ABOGADA -TECNOLOGA ADMINISTRACION', 'F', 'KRA 2 BIS # 6C-64', 'katherin-md@hotmail.com', '3164915461', '1989-11-02', 33, 1, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 8, 1, 6, 2, 9, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 9, 14, '', '', '2020-07-28', '35-01-0295', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(305, 'RAMON ALBERTO', 'INSIGNARES NIETO ', '72132034', b'1', '2020-02-25', 'ADMINISTRADOR DE EMPRESAS', 'M', 'CALLE 50 #  94-32', 'ramoninsignares@hotmail.com', '3046032181', '1966-04-04', 56, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 8, 8, 1, 7, 5, 27, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '', '2020-02-25', '', NULL, 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(306, ' LUZ ADRIANA', 'MUÑOZ GUZMAN', '66906759', b'1', '2020-02-24', 'TECNICO ASISTENCIA ADMINISTRATIVA', 'F', 'Cra 1cn # 5-45 Portal Jordan', 'nana662010@hotmail.com', '3152662529', '1974-06-06', 48, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 8, 1, 3, 2, 9, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 9, 14, '', 'decreto 0083', '2020-02-24', '35-01-0095', '2020-02-11', 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(307, 'MARIN GARZON ALVARO', NULL, '16604361', NULL, '2015-06-23', NULL, 'M', NULL, 'almamonitor@hotmail.com', '3135905832', '0000-00-00', 67, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(308, 'CUERO BORRERO MYRIAN AMPARO', '', '29562930', b'1', '2002-11-25', 'tecnologia en educacion preescolar', 'F', 'Calle 9A N. 3-51', 'miriancuero32@gmail.com', '3226133600', NULL, 68, 3, 'NO', 1, 1, 'Cedula de Ciudadania', 2, 7, 9, 1, 3, 2, 4, 1, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '2002', 22, 5, 'COLOMBIA', 'CALI', NULL),
(309, ' MARTHA LORENA', 'MUÑOZ RAMIREZ', '31449630', b'1', '2011-12-29', '\"TRABAJADORA SOCIAL especilización en cultura de paz y derec', 'F', 'carrera 24 N° 8A sur - 31 Alborada', 'lorenamramirez@hotmail.com', '3175788622', '1982-09-28', 40, 1, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 12, 1, 7, 4, 17, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 17, 26, 'SI', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Martha_Lorena_Muñoz.1662995286_631f4b561229d.jpeg', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(310, 'DAVID JESUS', 'CUESTA QUINTERO', '15914992', b'1', '2013-08-16', 'administracion de empresas', 'M', 'calle 8 # 5b-34 urbanizacion calama', 'davidcuesta62@yahoo.es', '3155124042', '1962-12-27', 60, NULL, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 2, 28, 1, 6, 4, 17, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 24, '', '', NULL, '', NULL, 'Presencial', '', '', '2013', 22, 1, 'COLOMBIA', 'CALI', NULL),
(311, 'IPIA CHAVES MARIA CRISTINA', '', '34606520', b'0', '2020-03-12', '', 'F', 'Carrera 4 No 10B - 107', 'macri7711@hotmail.com', '3122599116', NULL, 44, 2, 'NINGUNA', 1, 6, 'Cedula de Ciudadania', 1, 3, 5, 1, NULL, 2, 4, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(312, 'ANDRES FELIPE', 'MUÑOZ VELEZ', '1112486706', b'1', '2020-03-11', 'ADMINISTRACIÓN DE EMPRESAS', 'M', 'Calle 10A Transversal 17-09 Sachamate', 'afmunoz48@gmail.com', '3176767712', '1995-12-30', 27, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 3, 6, 1, 6, 5, 26, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', '2020-03-11', '35-01-0161', NULL, 'Presencial', '', 'views/archivos/fotos/ANDRES_FELIPE_MUÑOZ_VELEZ.1663622873_6328ded9cae53.jpg', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(313, 'RONALD JHOVANNY', 'MARIN HERMOSA', '1062331566', b'1', '1998-04-18', 'Abogado', 'M', 'CALLE 12 No.4A-157', 'ronaldphw@gmail.com', '3175302665', '1998-09-06', 24, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 29, 1, 7, 4, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 20, 7, 'SI', 'Decreto 35-16-085', '2022-11-01', '35-01-27-225', NULL, 'Presencial', '', '', '1998', 22, 3, 'COLOMBIA', 'CALI', NULL),
(314, 'JOHANNA ALEXANDRA', 'MURILLO GARCIA', '52779475', b'1', '2021-07-21', 'arquitecta', 'F', 'HaciendaEl Castillo,ConjuntoLlanurasCasa127', 'arquitectajohannamurillo@gmail.com', '3057122434', '1983-12-14', 39, 3, 'NINGUNA', 1, 9, 'Cedula de Ciudadania', 1, 1, 14, 5, 6, 4, 17, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 17, 24, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 4, 'COLOMBIA', 'CALI', NULL),
(315, 'CURIEL ZARZA LUIS MANUEL', '', '1118839102', b'1', '2020-02-26', 'INGENIERO INDUSTRIAL', 'M', 'Calle 10 n. 9-04 apto 203', 'luismanuel.curiel@hotmail.com', '3003078079', NULL, 30, 0, 'no', 1, 4, 'Cedula de Ciudadania', 2, 7, 15, 1, 6, 5, 27, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(316, 'CLARA ALICIA', 'IZQUIERDO ROMERO', '31889627', b'1', '2020-07-07', 'Tecnóloga en Sistemas ', 'F', 'Cra.18A Sur #2-36 RiVerasdelRosarioAlfaguara', 'cizquier1@yahoo.com', '3173744841', '1960-11-16', 62, 0, 'NINGUNA', 1, 2, 'Cedula de Ciudadania', 1, 3, 12, 1, 4, 2, 3, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/Clara_Izquierdo.1662996225_631f4f0157bba.png', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(317, 'OCHOA TAMAYO LORENA', NULL, '38665846', NULL, '2017-11-01', NULL, 'F', NULL, 'loreochoa83@hotmail.com', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 9, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(318, 'SARA', 'MARIN OROZCO ', '1006231783', b'1', '2020-08-10', 'CONTADURIA ', 'F', 'CALLE 20 I # 35 SUR 76 EDIFICIO D BLOQUE 60 APTO 501', 'saramao18@gmail.com', '3104003061', '1995-04-29', 27, 1, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 9, 5, 6, 2, 3, 1, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 3, 5, '', '30-16-280', '2020-08-10', '35-01-0303', '2020-08-10', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(319, 'LUIS ALFONSO', 'NAVIA BONILLA ', '16826293', b'1', '2011-12-24', '', 'M', 'Calle 15 a # 9-31 B/ el Rosario', 'sinttaxamundi@gmail.com', '3163067260', '1961-09-18', 61, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 1, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(320, 'JARAMILLO ABELLA LINO', NULL, '16610450', NULL, '2020-10-10', NULL, 'M', NULL, 'linjaramillo@hotmail.com', '3145511435', '0000-00-00', 122, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 5, NULL, 4, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 1, 'COLOMBIA', 'CALI', NULL),
(321, ' LIBARDO ANTONIO', 'CALAMBAS MORCILLO', '6331349', b'1', '2011-12-23', 'Bachiller academico', 'M', 'CALLE 14 # 19-78 B/ URBANIZACION SACHAMATE ', 'LIBARDOCM18@GMAIL.COM', '3175427108', '1950-10-18', 72, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 6, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(322, 'LEIDY DAYAN', 'NOGUERA ', '1061688612', b'1', '2020-09-22', 'Contaduría Publica', 'F', 'Cra 17 # 3-70 los naranjos 1 etapa apto 201 bloque 8', 'leidynoguera46@gmail.com', '3104046734', '1986-03-06', 37, 1, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 3, 8, 1, 6, 5, 27, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', '2020-09-22', '35-01-0332', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(323, ' DIOGENES ALIRIO', 'DELGADO', '12985171', b'1', '2005-03-04', 'Contador Público ', 'M', 'cra 12 # 8-53', 'aliriodeljamundi@yahoo.com', '3136413476', '1965-07-16', 57, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 27, 1, 7, 5, 23, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 23, 33, 'SI', '', NULL, '', NULL, 'null', '', '', '2005', 22, 3, 'COLOMBIA', 'CALI', NULL),
(324, 'MARMOLEJO PEREZ HARVEY', '', '6331653', b'0', '1998-01-02', '', 'M', 'Calle 8 #14-65', 'harvey140252@gmail.com', '3177827995', NULL, 70, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 17, NULL, '', '', NULL, '', NULL, 'null', '', '', '1998', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(325, 'NIDIA', 'NOREÑA PATIÑO ', '31959657', b'1', '2014-08-05', 'Bachiller academico', 'F', 'Cra44sur#2288', 'nidia2229@gmail.com', '3218533005', '1967-01-30', 56, 1, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 3, 1, 14, 6, 1, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2014', 22, 3, 'COLOMBIA', 'CALI', NULL),
(326, 'DELGADO ROJAS SAMUEL', NULL, '16795953', NULL, '2015-06-05', NULL, 'M', NULL, 'wilson.delgado@hotmail.com', '3175788507', '0000-00-00', 50, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(327, ' CARLOS ANDRES', 'MARTINEZ ALBAN', '16837881', b'1', '2020-02-17', 'Agente de tránsito ', 'M', 'Cra 17 # 3-70 los naranjos', 'carlos.martinez.alban@gmail.com', '3183703589', '1978-06-29', 44, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 29, 1, 3, 5, 19, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 19, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(328, 'YEXICA KARIME', 'OBANDO MARTINEZ ', '1112470281', b'1', '2016-06-20', 'ADMINISTRADORA DE EMPRESAS/ESPECIALIZACIÓN GERENCIA SOCIAL', 'F', 'Calle 3c 21-96 Anturios ', 'mime_816@hotmail.com', '3164925571', '1990-06-18', 32, 2, 'NINGUNA', 1, 7, 'Cedula de Ciudadania', 1, 7, 50, 5, 7, 4, 17, 1, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 17, 23, 'SI', '', NULL, '', NULL, 'Alternancia', '', '', '2016', 22, 3, 'COLOMBIA', 'CALI', NULL),
(329, 'PABLO', 'MARTINEZ BUITRAGO ', '1094902382', b'1', '2020-07-09', 'Licenciado Lenguas Modernas', 'M', 'Cll 11#2-91 Barrio Ceibita', 'pmartinezb25@gmail.com', '3217434053', '1988-12-31', 34, NULL, 'Trastorno de Ansiedad Generalizada', 1, 4, 'Cedula de Ciudadania', 1, 7, 9, 1, 6, 2, 4, 2, 'NO', '0', 0, 'MAL', b'0', '', NULL, 4, 8, '', '', '2020-07-09', '35-01-0268', '2020-07-09', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(330, ' MARCO ANTONIO', 'JARAMILLO CABRERA', '98215695', b'1', '2020-02-27', 'Electrónico y Redes ', 'M', 'Cra 10 #1-01 mz A casa 10 Ciudad de Dios vis', 'markojaramillo@yahoo.es', '3217204360', '1982-04-04', 40, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 1, 8, 1, 3, 2, 6, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 6, 11, '', '35-01-0126', '2020-02-27', '35-01-0126', '2020-02-27', 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(331, 'ELSA', 'DIAZ DIAZ ', '34550410', b'1', '2020-02-26', 'Bachiller Academico', 'F', 'Carrera 2 # 10 - 03 casa D-15 Conjunto cerrado Portal de Jamundi ', 'saeldiaz67@gmail.com', '3226310179', '1967-03-22', 56, 2, 'Hipotiroidismo ', 1, 1, 'Cedula de Ciudadania', 1, 3, 8, 1, 2, 2, 4, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 4, 8, '', 'No. 30-16-0120', '2020-02-26', '35-01-0118', '2020-02-11', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(332, 'KATERINE', 'OCAMPO BRAND ', '1112958232', b'1', '2022-04-04', 'COMUNICADOR SOCIAL', 'F', 'CALLE 12 SUR #10-81', 'kathebrand.90@gmail.com', '3177012205', '1990-02-13', 33, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 7, 16, 4, 6, 1, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 13, NULL, '', '', NULL, '', NULL, 'null', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(333, ' JORGE IVAN', 'MARTINEZ MEJIA', '94551332', b'1', '2020-07-08', 'ADM DE EMPRESAS NO GRADUADO - TEC EN DESARROLLO DE MERCADOS ', 'M', 'Calle 9 a 53 a sur 73', 'Jorgeivanmartinezmejia@gmail.com', '3183896225', '1985-09-04', 37, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 12, 1, 4, 5, 27, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(334, 'URREA OSPINA VIVIANA', '', '31448242', b'1', '2021-02-16', 'CONTADORA PUBLICA', 'F', 'CALLE 9 N 4-18', 'viur30@gmail.com', '3167404383', NULL, 39, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 13, 4, 6, 3, 10, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 10, NULL, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(335, 'DIAZ HAROLD', NULL, '6331994', NULL, '2011-12-15', NULL, 'M', NULL, 'veronicadiazviera@gmail.com', '3136660195', '0000-00-00', 68, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(336, 'CARMENZA', 'OCORO DE MARULANDA ', '31520889', b'1', '2013-02-03', 'TECNICO REJENCIA DE FARMACIA', 'F', 'CARRERA 16 #19-52', 'caro592@hotmail.com', '3006530838', '1957-12-18', 65, 2, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 7, 18, 5, 3, 2, 9, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'null', '', '', '2013', 22, 1, 'COLOMBIA', 'CALI', NULL),
(337, 'DIAZ OCAMPO FRANCI ELIANA', NULL, '29110793', NULL, '2012-01-07', NULL, 'F', NULL, 'elianadiaz0@gmail.com', '3182936238', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(338, ' JAIME', 'MARULANDA GONZALEZ', '6331685', b'1', '2013-01-03', 'Maquinaria Amarilla', 'M', 'Cra.16 # 19-52', 'Caromaru4@gmail.com', '3006087195', '1954-03-16', 68, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 2, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 7, NULL, '', '', NULL, '', NULL, 'null', '', '', '2013', 22, 1, 'COLOMBIA', 'CALI', NULL),
(339, ' ANNER', 'OIDOR VIDAL', '16824202', b'1', '2015-06-11', '', 'M', 'Calle 8a # 205', 'oidoranner@gmail.com', '3208895138', '1963-07-14', 59, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 3, 1, 14, 6, 2, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 3, 'COLOMBIA', 'CALI', NULL),
(340, 'ECHAVARRIA GUTIERREZ MARIA YOLIMA', NULL, '31522210', NULL, '2015-12-31', NULL, 'F', NULL, 'penrril8112@hotmail.com', '0', '0000-00-00', 59, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 8, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(341, ' ALEXANDER', 'OLAYA', '80438499', b'1', '2012-01-01', 'Conductor ', 'M', 'Timba cauca', 'alexolaya19711@hotmail.com', '3128879044', '1971-12-07', 51, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2012', 22, 1, 'COLOMBIA', 'CALI', NULL),
(342, 'JATIVA LEGARDA ANJY JOHANA', '', '1085330392', b'1', '2020-07-22', 'bachiller tecnico', 'F', 'CONJUNTO RESIDENCIAL LA ARBOLEDA TORRE 3 APTO', 'anjyjativa@gmail.com', '3218664451', NULL, 24, 0, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 1, 9, 1, 3, 2, 3, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 3, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(343, 'JORGE IVAN', 'MEJIA GUTIERREZ', '14590876', b'0', '2018-06-20', 'Abogado', 'M', '', 'ivanmejia24@hotmail.com', '3188169322', NULL, 122, NULL, '', 0, 2, 'Cedula de Ciudadania', NULL, NULL, 26, 3, 10, NULL, NULL, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 40, NULL, '', '', NULL, '', NULL, 'Presencial', '', '', '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(344, 'AMANDA', 'OLAYA ALVAREZ', '31521841', b'1', '1980-07-12', 'INSPECTORA DE POLICIA ', 'F', 'carrera 12#7-32', 'inspolicia_olaya@hotmail.com', '3104335269', '1958-08-10', 64, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 12, 1, 3, 5, 20, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 20, NULL, '', '', NULL, '', NULL, 'null', '', '', '1980', 22, 3, 'COLOMBIA', 'CALI', NULL),
(345, 'ECHEVERRI CESAR FABIO', NULL, '16770997', NULL, '2011-12-15', NULL, 'M', NULL, 'echeverry1969@hotmail.com', '3184589726', '0000-00-00', 59, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(346, ' NANCY', 'OLAYA REYES', '31529567', b'1', '1995-02-01', 'AUXILIAR TECNICO CONTABLE', 'F', 'Carrera 13 No 8-81 Barrio la Estación ', 'onesimovillamil@hotmail.com', '3166750014', '1956-08-12', 66, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 7, 1, 3, 2, 4, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '1995', 22, 3, 'COLOMBIA', 'CALI', NULL),
(347, 'JIMENEZ FIGUEROA ALONSO', NULL, '6334039', NULL, '2016-03-31', NULL, 'M', 'Carrera 96 # 8-53', 'alonso.jimenez.jamundi@gmail.com', '3205556736', '0000-00-00', 36, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 29, 5, NULL, 5, 19, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, NULL, 'COLOMBIA', 'CALI', NULL),
(348, ' OSCAR WILLIAM', 'MARULANDA JARAMILLO', '6461811', b'1', '1993-01-04', 'Electricista Automotriz ', 'M', 'Calle 11A # 4A-181', 'oscarma61@gmail.com', '3163689359', '1961-05-13', 61, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 14, 6, 3, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 28, NULL, '', '', NULL, '', NULL, 'null', '', '', '1993', 22, 4, 'COLOMBIA', 'CALI', NULL),
(349, 'MARCELLY', 'BALANTA ARBOLEDA', '31527077', b'1', '1997-03-13', 'contadora pública', 'F', 'cra 7 No. 10 - 200', 'marcellybalanta@gmail.com', '3153060844', '1966-10-22', 56, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 13, 5, 7, 4, 17, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '', NULL, '', NULL, 'null', '', '', '1997', 22, 3, 'COLOMBIA', 'CALI', NULL),
(350, ' DAMARIS', 'MAYOR FERNANDEZ', '31531065', b'1', '1998-01-02', 'Administradora de empresas', 'F', 'carrera 15 sur # 2 - 28 Riberas del rosario', 'damafe136@hotmail.com', '3166925346', '1971-02-04', 52, 3, 'diabetica e hipertensa', 1, 3, 'Cedula de Ciudadania', 1, 7, 29, 1, 7, 2, 2, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 2, 2, '', '', NULL, '', NULL, 'null', '', '', '1998', 22, 4, 'COLOMBIA', 'CALI', NULL),
(351, 'ROSAURA', 'ECHEVERRY PINEDA', '31520700', b'1', '1997-08-07', 'Primaria', 'F', 'CALLE 10a # 4-37 B/ POPULAR', 'l-anata@hotmail.com', '3206597581', '1952-07-21', 70, 3, 'Problemas con el lado izquierdo,NO PUEDE DESEMPEÑAR TAREAS DE SERVICIOS GENERALES POR ORDEN MEDICA', 1, 1, 'Cedula de Ciudadania', 1, 3, 14, 6, 1, 6, NULL, 1, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 6, NULL, '', '', NULL, '', NULL, 'null', '', '', '1997', 22, 5, 'COLOMBIA', 'CALI', NULL),
(352, 'MARIO', 'JIMENEZ MAZO ', '94020002', b'1', '2011-12-23', '', 'M', 'CALLE 17 A #4-110 BARRIO BELLO HORIZONTE', 'sintraxamundi@gmail.com', '3117203033', '1959-04-22', 63, NULL, 'DIABETICO-HIPERTENSION', 1, NULL, 'Cedula de Ciudadania', 3, 8, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(353, 'ORDOÑEZ SANCHEZ RICARDO ANDRES', NULL, '1112485607', NULL, '2015-06-01', NULL, 'M', NULL, 'ricardoandres16@hotmail.com', '3022877464', '0000-00-00', 26, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(354, 'SAÚL', 'MEDINA SILVA', '14637800', b'1', '2021-06-01', 'Ingeniero Agricola', 'M', 'Calle 9E # 54B SUR -47', 'saulmedinasilva@gmail.com', '3002457305', '2022-03-06', 0, 0, 'NINGUNA', 1, 2, 'Cedula de Ciudadania', 1, 7, NULL, 4, 6, 3, 14, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 14, 19, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 1, 'COLOMBIA', 'CALI', NULL),
(355, 'ZARZA CANABAL INES DEL ROSARIO', '', '64577361', b'0', '2013-07-24', 't.p. en contabilidad', 'F', 'MANZANA H CASA 15 SIGLO XXI', 'izca710@hotmail.com', '3003259396', NULL, 45, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 9, 1, NULL, 2, 9, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 9, NULL, '', '', NULL, '', NULL, 'null', '', '', '2013', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(356, 'ADRIANA MARIA', 'BENITEZ OSPINA', '31322638', b'1', '2004-03-11', 'administradora de empresas', 'F', 'Carrera 4 sur n.8-22', 'admaos322@hotmail.com', '3165342296', '1983-10-22', 39, 1, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 1, 8, 1, 6, 2, 9, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'Presencial', '', '', '2004', 22, 4, 'COLOMBIA', 'CALI', NULL);
INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`, `pais_nacimiento`, `ciudad_nacimiento`, `otro_municipio`) VALUES
(357, 'JIMENEZ MEJIA MARIA VIRGINIA', '', '31532642', b'0', '1993-05-25', '', 'M', 'Carrera 13 # 14-29', 'mariavjimenez@hotmail.com', '3146797138', NULL, 48, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 15, 1, NULL, 2, 2, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 2, NULL, '', '', NULL, '', NULL, 'null', '', '', '0', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(358, 'SANDRA MILENA', 'ORREGO JIMENEZ', '31533921', b'1', '2022-11-01', 'ABOGADA', 'F', 'Calle 15 6 09 B belarcazar', 'sandraoj1574@hotmail.com', '3158851250', '1974-07-15', 48, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 7, 4, 7, 3, 11, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 11, 16, 'SI', '', '2020-03-06', '', NULL, 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(359, ' RUSMAN ALBERTO', 'ESCOBAR BERNAL', '16838305', b'1', '2008-11-08', 'agente de transito ', 'M', 'kr 1 calle 10c casa 40c portal  de jamundi ', 'rusalbes@gmail.com', '3013350797', '1978-07-20', 44, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 7, 29, 5, 4, 5, 19, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 19, NULL, '', '', NULL, '', NULL, 'null', '', '', '2008', 22, 1, 'COLOMBIA', 'CALI', NULL),
(360, 'PALACIO RESTREPO LUIS CARLOS', NULL, '16823538', NULL, '2017-01-03', NULL, 'M', NULL, NULL, '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(361, ' FREDDY', 'ESCOBAR GONZALES', '18004539', b'1', '2011-12-23', 'CONDUCTOR', 'M', 'Calle  9# 14-57', 'fregoescobar@gmail.com', '3122699048', '1976-06-29', 46, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 3, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(362, 'YUDI VIVIANA', 'ORTEGA URBANO ', '1144071835', b'1', '2020-03-13', 'ADMINISTRACION EN SEGURIDAD Y SALUD EN EL TRABAJO', 'F', 'SACHAMATE ', 'VIVIANAORTEGA311@GMAIL.COM', '3177704272', '1994-06-22', 28, 0, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 1, 28, 1, 6, 2, 5, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 5, 10, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(363, ' EDUARD ALBERTO', 'JOAQUI IBACHY', '4627329', b'1', '2020-07-31', 'ABOGADO', 'M', 'calle 15 N° 16 - 15 La Pradera', 'socarvaja@hotmail.com', '3146926437', '1960-12-06', 62, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 3, 7, 12, 1, 7, 4, 16, 3, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 16, 21, 'SI', '', '2020-07-31', '', NULL, 'Presencial', '', 'views/archivos/fotos/foto_Comisario_-_EDGAR_FERNANDO_QUIROZ_MORAN.1661875387_630e34bbbad44.jpeg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(364, ' APOLINAR', 'ESCOBAR GONZALEZ', '2575468', b'1', '1992-10-26', 'Bachiller academico', 'M', 'Carrera 4 sur No. 10 bis 22  EL SOCORRO ', 'poloescobar11@hotmail.com', '3116235867', '1961-08-11', 61, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 7, 27, 1, 2, 2, 9, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 9, 14, '', '0174', '1992-10-30', '122-1992', '1992-10-26', 'Presencial', '', 'views/archivos/fotos/foto_polo_-_Secretaría_de_Planeacion.1661875202_630e340227a49.png', '1992', 22, 1, 'COLOMBIA', 'CALI', NULL),
(365, 'JUAN SEBASTIAN', 'ORTIZ CORTES ', '1130641984', b'1', '2020-07-22', 'MUSICO', 'M', 'Km 1.5 vía Jamundí - Potrerito Manzana 9 Casa 3.', 'sebastian511@gmail.com', '3183385419', '1988-05-11', 34, NULL, 'NINGUNA', 1, 8, 'Cedula de Ciudadania', 2, 3, 5, 1, 6, 5, 26, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 27, NULL, '', '35-16-005', '2020-07-22', '', '2020-07-03', 'Presencial', '', 'views/archivos/fotos/Juan_Sebastián_Ortiz_Cortés.1663618696_6328ce882d1c0.jpeg', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(366, 'ORTIZ JHON JAIRO', NULL, '16822400', NULL, '2009-02-02', NULL, 'M', NULL, 'fcmjjortiz@hotmail.com', '3104367217', '0000-00-00', 61, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(367, 'ESCOBAR LIZANO JULIO ALFREDO', NULL, '1112466982', NULL, '2020-01-02', NULL, 'M', NULL, 'julio.escobar@jamundi.gov.co', '3104329066', '0000-00-00', 32, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(368, ' FREDY ANTONIO', 'LADINO CORTES', '16832487', b'1', '2016-03-02', 'Agente de tránsito ', 'M', 'Calle 14  # 5-53 belalcázar 1 etapa', 'ladinofreddyantonio@gmail.com', '3165079395', '1973-07-08', 49, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 29, 5, 3, 5, 19, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'null', '', '', '2016', 22, 1, 'COLOMBIA', 'CALI', NULL),
(369, 'MARIO FERNANDO', 'OSPINA GOMEZ ', '16778608', b'0', '2013-07-02', 'Administración de empresas', 'M', 'calle 12 a 1-64 B/ Colseguros', 'ospmaf@gmail.com', '3167223336', '1970-05-16', 52, NULL, 'no', 1, 4, 'Cedula de Ciudadania', 1, 3, 12, 1, 3, 5, 24, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 24, 35, '', '', NULL, '', NULL, 'Presencial', '', '', '2013', 1, 3, 'COLOMBIA', 'CALI', NULL),
(370, ' ANA MARIA', 'OTERO GIRALDO', '67040269', b'1', '2020-04-07', 'INGENIERA SANITARIA', 'F', 'Calle 13a #85a-61 torre5 apto 101', 'anamarogi@yahoo.es', '3155677541', '1985-08-24', 37, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 3, 31, 1, 7, 4, 17, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 17, 22, 'SI', 'Decreto 0145', '2020-04-07', '35-01-0203', '2020-03-02', 'Presencial', '', 'views/archivos/fotos/Foto_Carné_-_Ana_Maria_Otero.1662567298_6318c382e6cee.JPG', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(371, ' EDGAR HUMBERTO', 'PALACIOS', '79792530', b'1', '2020-07-22', 'Administración de Empresas', 'M', 'Calle 22 # 17 23', 'jhumbertp2010.jamundi@gmail.com', '3113331161', '1977-09-13', 45, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 3, 27, 1, 8, 4, 17, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 17, 26, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(372, 'PALACIOS ORJUELA WILLIAM', NULL, '16831746', NULL, '2011-12-15', NULL, 'M', NULL, 'betyar32@gmail.com', '3226279624', '0000-00-00', 49, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(373, 'LUZ MERY', 'PALACIOS PALACIOS ', '1112468297', b'1', '2020-03-17', 'Tecnico en Sistemas', 'F', 'cra 24 B NºA Sur - 71 La Alborada', 'celacanto2014@gmail.com', '3012467691', '1989-08-05', 33, 0, 'DIABETIS TIPO 2', 1, 1, 'Cedula de Ciudadania', 2, 7, 11, 1, 3, 2, 3, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 3, 5, '', '', '2020-03-17', '35-01-0182', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(374, ' IVONNE ADRIANA', 'PALTA VELASCO', '1130592519', b'1', '2020-03-16', '\"ADMINISTRADOR DE NEGOCIOS-TEC ANALISIS ORGANIZACIONAL eSPEC', 'F', 'Cra 26 M 1 No. 56A -28', 'iapalta0511@gmail.com', '3208410866', '1987-05-11', 35, NULL, 'Hipertension ', 1, 3, 'Cedula de Ciudadania', 1, 3, 12, 1, 7, 5, 26, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '', '2020-03-16', '35-01-0174', NULL, 'Presencial', '', 'views/archivos/fotos/Ivonne_Adriana_Palta_Velasco.1662997267_631f5313b7843.jpg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(375, ' JORGE YONATAN', 'PARRA DURAN', '16941419', b'1', '2020-09-01', ' Auxiliar en Servicios Farmacéuticos', 'M', 'Carrera 4 19A-27', 'jhonparra66@gmail.com', '3045896071', '1981-12-29', 41, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 7, 4, 3, 2, 7, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 7, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(376, ' CARLOS ALBERTO', 'PASTRANA MOSQUERA', '16832016', b'1', '2011-06-26', '', 'M', 'Calle 2c #8sur-22', 'pastranacarlosalberto13@gmail.com', '3148772939', '1970-03-13', 52, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 14, 6, 1, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 33, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(377, ' ALFREDIX', 'PENA RODALLEGA', '16825650', b'1', '2002-11-25', 'Bachiller Academico', 'M', 'CALLE 8 # 3-15 BARRIO LAS ACACIAS ', 'alfredix2019@gmail.com', '3148942302', '1966-04-13', 56, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 2, 7, 8, 1, 2, 2, 6, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 6, 11, '', '187-D', '2002-11-25', '', '2002-11-25', 'Presencial', '', '', '2002', 22, 4, 'COLOMBIA', 'CALI', NULL),
(378, 'ADOLFO LEON', 'PEÑA ARBOLEDA ', '2575396', b'0', '1992-08-12', '', 'M', 'carrera 5as 9-63 B/ La arboleda', 'arboledaadolfoleon@gmail.com', '3206558644', '1955-07-30', 67, NULL, 'no', 1, NULL, 'Cedula de Ciudadania', 1, 5, 12, 1, 2, 2, 4, 2, 'PADRE', '0', 1, 'BUENA', b'0', '', NULL, 4, 8, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-17_at_4.50.20_PM.1660832490_62fe4aea6601f.jpeg', '1992', 22, 3, 'COLOMBIA', 'CALI', NULL),
(379, 'ANGIE LORENA', 'PEÑA REYES', '1144139774', b'1', '2020-04-07', 'tècnologo en logistica industrial', 'F', 'Carrera 19 No 6 -08 T 1 Apto 304', 'alp.neger@gmail.com', '3044757031', '1990-05-06', 32, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 3, 11, 1, 4, 5, NULL, 1, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 26, NULL, '', '30-16-0184', '2020-04-07', '35-01-0201', '2020-03-24', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(380, 'ROBERT', 'PEÑUELA RIVERA ', '6334410', b'1', '2020-03-02', 'Celador ', 'M', 'Calle 15c # 8-16', 'robertpenuelarivera1984@hotmail.com', '3004460741', '1984-09-04', 38, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 8, 1, 2, 2, 6, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 6, 11, '', '', '2020-03-02', '', NULL, 'Presencial', '', 'views/archivos/fotos/Screenshot_2022-08-23-20-35-18-543_com.miui.gallery_-_Robert_Peñuela.1661874098_630e2fb2f14fd.jpg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(381, 'JAMES', 'PERAFAN ZUÑIGA', '76221434', b'1', '2020-02-27', 'Bachiller Academico', 'M', 'calle 15 bis # T14-15 B/ covicedros', 'jamesps1973@gmail.com', '3114098554', '1973-09-02', 49, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 3, 1, 8, 1, 2, 2, 6, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 6, 11, '', '030-16-0119', '2020-02-27', '35-01-0120.', '2020-02-11', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(382, 'CHARRIA  CESAR HERNEY', NULL, '16824115', NULL, '2013-07-05', 'Bachiller', 'M', NULL, 'puebloderoblescesar@hotmail.com', '3206961006', '0000-00-00', 57, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(383, 'PRADO RODRIGUEZ BETTY JOHANA', NULL, '1112477876', NULL, '2017-01-03', NULL, 'F', NULL, 'minijohana.2030@hotmail.com', '3215055438', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(384, ' JACKELINE', 'PERDIGON VILLEGAS', '31538498', b'1', '2011-12-23', 'Tecnóloga Profesional en Control Ambiental', 'F', 'Tranversal 14 #5-22 b/ La Estación ', 'jackelinperdigon@gmail.com', '3153571298', '1978-03-16', 44, 2, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 1, 8, 14, 6, 4, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 33, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(385, 'BECERRA BERMUDEZ JESUS ALBEIRO', NULL, '16649529', NULL, '1998-04-06', 'Bachiller Academico', 'M', NULL, 'nancyparra123@hotmail.com', '3127122624', '0000-00-00', 62, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(386, ' ANDREA', 'PEREZ ECHEVERRY', '29122815', b'1', '2020-02-14', 'ABOGADA', 'F', 'CALLE 2 N 19-250 CASA 61', 'andrea_perez1179@hotmail.com', '3175031133', '1979-11-09', 42, 1, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 5, 11, 1, 10, 4, 17, 2, 'MADRE', '0', 1, 'BUENA', b'0', '', NULL, 17, 22, '', '30-16-0084', '2020-02-14', '35-01-0058', '2020-02-11', 'Alternancia', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_3.13.19_PM.1661876608_630e398073596.jpeg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(387, 'CESAR TULIO', 'CANTERO FIGUEROA', '10756284', b'1', '2012-05-02', 'Tecnico Contable', 'M', 'calle 3a 21 18', 'cesarcant@gmail.com', '3104531488', '1983-10-24', 39, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 13, 1, 3, 2, 3, 2, 'PADRE', '1', 0, 'MAL', b'0', '', NULL, 3, 3, '', '', NULL, '', NULL, 'Presencial', '', '', '2012', 22, 4, 'COLOMBIA', 'CALI', NULL),
(388, 'IRMA', 'PERLAZA MONTAÑO ', '66749810', b'1', '2020-08-19', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CALLE 120 No24-06', 'irmaperlaza@gmail.com', '3138624366', '1974-11-19', 48, 2, 'HIPERTENSA', 1, 4, 'Cedula de Ciudadania', 2, 7, 6, 1, 6, 5, 26, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Irma_Perlaza.1663622785_6328de81294fe.jpeg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(389, ' LUIS BRYAN', 'PUENTES MORANTE', '1143846719', b'1', '2020-03-04', 'AGENTE DE TRÁNSITO ', 'M', 'Carrera 46a 14 69', 'bryanmovilidadcali@gmail.com', '3165166141', '1993-02-07', 30, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 29, 1, 7, 5, 19, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 19, 28, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(390, ' CARMEN INES', 'QUEVEDO AGREDO', '66813320', b'1', '1991-06-14', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CRA 7 10-200 Conjunto Country Plaza II', 'cainque@hotmail.com', '3154522742', '1970-03-07', 52, 2, 'NO', 1, 3, 'Cedula de Ciudadania', 1, 3, 11, 1, 6, 5, 27, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/foto_carmen_ines.1660772634_62fd611a26a08.JPG', '1991', 22, 1, 'COLOMBIA', 'CALI', NULL),
(391, 'CASTAÑO SOLARTE ROBERT ANDRES', NULL, '1112464630', NULL, '2015-06-04', NULL, 'M', NULL, 'andrescsolarte@gmail.com', '3204836801', '0000-00-00', 34, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(392, 'QUIJANO CORREA KAREN DANIELA', NULL, '1112488109', b'1', '2016-04-20', 'TECNICO EN AGENTE DE TRANSITO Y CRIMINALISTICA', 'F', 'CARRERA 15 N 24 A12', 'quijanokaren81@gmail.com', '3187640449', '0000-00-00', 25, 1, 'NO', 1, 3, '\"CEDULA DE CIUDADANIA\"', 1, 5, 29, 5, 3, 5, 19, 2, 'Madre', 'SI', NULL, 'BUENA', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2, 3, 'COLOMBIA', 'CALI', NULL),
(393, 'QUIJANO VALENCIA ANA CAROLINA', NULL, '31324580', b'1', '2020-08-19', 'FINANZAS Y NEGOCIOS INTERNACIONALES', 'F', 'Calle 48 Bis Nº 83 C- 63 Caney Apt 407', 'anacarolina.quijano@gmail.com', '3152620439', '0000-00-00', 38, 0, 'NO', 0, 11, '\"CEDULA DE CIUDADANIA\"', 2, 7, 8, 4, 10, 3, 14, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3, 'COLOMBIA', 'CALI', NULL),
(394, ' RICAURTE', 'QUIJANO VALLECILLA', '16778467', b'1', '2020-07-01', 'ingeniería agrónoma', 'M', 'CRA 27  T 29-17 PISO 3 CALI', 'riquiva70@hotmail.com', '3163253889', '1970-04-11', 52, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 7, 9, 1, 7, 4, 17, 2, 'NO', '1', 1, 'BUENA', b'0', '', NULL, 17, 24, 'SI', '30-16-0248', '2020-07-01', '', '2020-06-17', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(395, 'WILLIAM', 'QUILINDO SANCHEZ ', '94430649', b'1', '2020-02-26', 'administracion de empresas', 'M', 'Cra 89 #1_32 apto 403c guayacanes (la Luisa)', 'wilquisan0508@gmail.com', '3146118461', '1975-05-08', 47, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 8, 1, 6, 2, 4, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 4, 8, '', '', '2020-02-26', '35-01-01-05', NULL, 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(396, 'LUIS ROSEMBERG', 'QUINAYAS TRUJILLO', '4948908', b'1', '2011-12-23', 'Operario vibrocompactador ', 'M', 'Calle 5A 2-44 Portales del Jordan', 'luisrosembergquinayastrujillo@gmail.com', '3117726382', '1963-12-07', 59, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'NO', '1', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(397, ' MARLENE', 'QUINTERO LOPEZ', '31890139', b'1', '1983-04-11', 'Técnico Contable', 'F', 'carrera 11 N° 9 -24 ', 'marquinlo@hotmail.com', '3017766920', '1960-11-26', 62, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 11, 1, 3, 5, 27, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 27, NULL, '', '', '1983-04-11', '', NULL, 'Alternancia', '', 'views/archivos/fotos/marlene_quintero.1662563381_6318b4352eb52.jpg', '1983', 22, 3, 'COLOMBIA', 'CALI', NULL),
(398, ' JULIAN ALFONSO', 'QUINTERO MEJIA', '1112463962', b'1', '2020-04-06', 'Profesional en finanzas y negocios internacionales', 'M', 'Calle 47 # 80 - 118', 'julianqm1987@gmail.com', '3186054191', '1987-04-21', 35, 0, 'no', 1, 4, 'Cedula de Ciudadania', 1, 8, 11, 1, 6, 5, 26, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 27, NULL, '', 'DEC. 0144', '2020-04-06', '3501270196', '2020-03-20', 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_10.27.57_AM.1660058936_62f27d38b4ca5.jpeg', '2020', 1, 3, 'COLOMBIA', 'CALI', NULL),
(399, 'RAMIREZ RESTREPO ANDRES FELIPE', NULL, '16841562', NULL, '2020-01-01', NULL, 'M', NULL, 'jamundiserespeta@gmail.com', '3104732467', '0000-00-00', 41, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 7, 2, NULL, 7, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, 1, 'COLOMBIA', 'CALI', NULL),
(400, 'KATERINE', 'GALLEGO CHAPARRAL ', '1061776239', b'1', '2020-07-10', 'Tecnologa en Gestión Documental ', 'F', 'Calle 4B # 2 - 13', 'kgallego93@misena.edu.co', '3206634356', '1994-10-24', 28, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 3, 7, 14, 1, 4, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(401, 'LAURA VALENTINA', 'RENDON HERNANDEZ ', '1143875227', b'1', '2020-07-07', 'Ingeniera industrial', 'F', 'la buitrera km 8 cali', 'rendonlaura904@gmail.com', '3206803368', NULL, 23, 1, 'NINGUNA', 1, 2, 'Cedula de Ciudadania', 1, 3, NULL, 1, 4, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(402, 'ANDERSON', 'GONZALEZ BENAVIDEZ ', '94491921', b'1', '2020-02-25', 'Tecnico sistemas,tecnico seguridad vial', 'M', 'carrera 84 # 5 - 141', 'andersongbsanti@gmail.com', '3178714855', '1976-10-24', 46, NULL, 'HIpertenso asmático ', 1, NULL, 'Cedula de Ciudadania', 1, 1, 29, 1, 3, 5, 19, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(403, 'RESTREPO GONZALEZ DIEGO ANDRES', NULL, '16838442', NULL, '2013-08-08', NULL, 'M', NULL, 'diego-andres78@hotmail.com', '3123135395', '0000-00-00', 43, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(404, 'OLGA LUCIA', 'RESTREPO NIÑO', '65747556', b'1', '2004-06-03', 'ADMINISTRADOR EMPRESAS', 'F', 'Cra 8 H Nº 50-75 apt 401 B Conjunto El Prado ', 'olgalucia0107@gmail.com', '3174001132', '1969-07-01', 53, 2, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 2, 3, 8, 1, 6, 2, 3, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 3, 5, '', 'Decreto 35-16011 ', '2020-07-24', 'Acta 35-01-0', '2020-07-13', 'Presencial', '', '', '2004', 22, 4, 'COLOMBIA', 'CALI', NULL),
(405, 'RIASCOS DIAZ DANIEL', NULL, '10552830', NULL, '2015-06-22', NULL, 'M', NULL, NULL, '3156263121', '0000-00-00', 67, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(406, ' DIANA PATRICIA', 'RINCON CARDONA', '1115066235', b'1', '2020-02-25', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CALLE 25 # 19-185 b/Pangola', 'dianarincon1771@gmail.com', '3163186348', '1987-05-15', 35, 0, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 7, 11, 1, 6, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 26, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/DIANA_RINCON.1662562993_6318b2b1a5308.jpeg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(407, ' JUAN CARLOS', 'RINCON MONTERO', '16828549', b'1', '1997-08-25', 'Bachiller Academico', 'M', 'Calle 19A # 50Sur-62', 'jcarlosrincon69@hotmail.com', '3178295286', '1969-12-22', 53, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 1, 8, 5, 2, 2, 6, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 6, 11, '', '2916', '1997-08-25', '663', '1997-08-15', 'Presencial', '', '', '1997', 22, 1, 'COLOMBIA', 'CALI', NULL),
(408, 'ALEYDA', 'RINCON RESTREPO ', '31533190', b'1', '2011-12-15', 'TECNICO PREESCOLAR', 'F', 'CALLE 8 B N 1CS-16', 'valeria7428@hotmail.com', '3157955988', '1974-03-28', 48, 3, 'tiroides - rinitis cronica', 1, 6, 'Cedula de Ciudadania', 1, 7, 16, 5, 3, 5, 10, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 10, 15, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_3.35.37_PM.1660077396_62f2c55400f2b.jpeg', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(409, 'RIOS RAMIREZ KATERIN NATALIA', NULL, '1144064672', b'1', '2020-03-09', 'ABOGADA', 'F', 'CRA112 NO. 48-92 APTO 707  TORRE  3 K112 pino', 'katerios2207@gmail.com', '3195744190', '0000-00-00', 28, 0, 'no', 1, 2, '\"CEDULA DE CIUDADANIA\"', 1, 7, 12, 1, 6, 5, 23, 2, 'No tiene hijos', 'no', NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3, 'COLOMBIA', 'CALI', NULL),
(410, 'MARCO AURELIO', 'RIOS VELASCO', '16832934', b'1', '2020-07-10', 'Tránsito y transporte ', 'M', 'Transversal 6 #11-83', 'marquillo062@hotmail.com', '3147962899', '1973-09-19', 49, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 29, 5, 3, 5, 19, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 19, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 2, 'COLOMBIA', 'CALI', NULL),
(411, 'RIVERA MENDEZ LUIS ANTONIO', NULL, '2571460', NULL, '2015-10-30', NULL, 'M', NULL, 'proimageninstitucional@hotmail.com', '3207030923', '0000-00-00', 61, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(412, 'SANCHEZ LENIS VICTOR HUGO', NULL, '6332082', NULL, '1998-01-05', NULL, 'M', NULL, 'vhsl1808@hotmail.com', '0', '0000-00-00', 122, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 5, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(413, 'RIVERA MINA EVER', NULL, '14675090', NULL, '1999-02-01', NULL, 'M', NULL, NULL, '3113951213', '0000-00-00', 65, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(414, 'RIZO COLL HUMBERTO', '', '6331566', b'0', '1990-06-26', '', 'M', 'Cra 10 #9-48', 'humbertorizo7@gmail.com', '3168024346', NULL, 122, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 13, 1, NULL, 5, 26, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '1990', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(415, 'SALDAÑA MONTOYA HENRY', NULL, '16822875', NULL, '1990-08-17', NULL, 'M', NULL, 'hesamojp38@yahoo.com', '3158142917', '0000-00-00', 59, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(416, 'MARGARITA MARIA', 'RIVERA MOTATO ', '43602714', b'1', '2021-05-20', 'Comunicadora social', 'F', 'Calle La Fontana 1 - 1 Apto 1002 T B. Palmeras de Verde Alfaguara', 'margaritariveramotato@gmail.com', '3014113710', '1976-05-07', 46, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 10, 4, 7, 3, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 26, NULL, 'SI', 'DECRETO N° 30-16-59', '2021-05-20', '35 01 27 152', '2021-05-18', 'Presencial', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(417, 'GIOVANNY', 'SALDAÑA SALINAS', '16836110', b'1', '2015-06-01', '', 'M', 'Cra 13A#16-52B/Ciro velasco ', 'gisasa36@hotmail.com', '3044315754', '1976-11-20', 46, NULL, 'SI', 1, NULL, 'Cedula de Ciudadania', 2, 1, 14, 6, 1, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(418, ' ANDRES FELIPE', 'RIZO MORALES', '16836624', b'1', '2011-12-27', 'ingenieria industrial', 'M', 'Calle 3 #21-121 casa 9 Brisas de Farallones', 'afelipe27@gmail.com', '3146697900', '1975-12-27', 47, NULL, 'Hipertensión', 1, 4, 'Cedula de Ciudadania', 1, 5, 9, 1, 6, 4, 17, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 25, '', '', NULL, '', NULL, 'Presencial', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(419, 'SANCHEZ ROJAS PEDRO ANTONIO', NULL, '16641206', NULL, '2012-01-02', NULL, 'M', NULL, 'peansaro@gmail.com', '3103733389', '0000-00-00', 122, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 2, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(420, 'DANIELA', 'RODALLEGA POPO', '1112467081', b'1', '2011-12-27', 'Ingeniera topografica', 'F', 'Calle 14a n.5a-28', 'drodallega.infraestructura@gmail.com', '3105175855', '1989-03-26', 33, 1, 'NINGUNA', 1, 9, 'Cedula de Ciudadania', 2, 1, 14, 1, 8, 4, 17, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 26, 'SI', '', NULL, '', NULL, 'Presencial', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(421, 'JHON JAIRO', 'SALDAÑA VASQUEZ ', '6334345', b'1', '2020-06-25', 'AUXILIAR ADMINISTRATIVO', 'M', 'transversal 5 numero 12 35', 'jhonjasalva@hotmail.com', '3147117941', '1985-09-19', 37, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 2, 4, 12, 1, 4, 2, 9, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/foto_jhon_jairo_-_jhon_jairo_saldaña_vasquez.1661874436_630e310471e95.jpg', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(422, 'OLMOS LUIS GUSTAVO', NULL, '19139872', NULL, '1995-05-15', NULL, 'M', NULL, 'tavo-olmos@hotmail.com', '3147178226', '0000-00-00', 71, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(423, 'RODRIGUEZ RAMOS CESAR HERNANDO', '', '94540987', b'0', '2020-01-02', '', 'M', 'CONJUNTO LAGOS DE VERDE ALFAGUARA APTO 101C', 'cesarrodriguezramos@hotmail.com', '3183723936', NULL, 122, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 10, 4, NULL, 3, 14, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 14, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(424, ' CARLOS HUMBERTO', 'SALINAS CAMPO', '1130626658', b'1', '2015-06-01', 'Administrador público ', 'M', 'Calle 16d#6-18', 'carloshsalinas@hotmail.com', '3207327898', '1986-05-10', 36, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 7, 14, 6, 6, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(425, ' CAMILO', 'RODRIGUEZ', '1112459357', b'1', '2021-03-15', 'terminando derecho', 'M', 'Carrera 5 # 16-34 ', 'kamilor86@gmail.com', '3225117441', '1986-05-01', 36, 0, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 29, 5, 6, 5, 21, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 21, NULL, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(426, 'CARLOS  ARTURO', 'SAMBONI MEDINA ', '75157727', b'1', '2020-02-27', 'TECNICO EN INGENIERIA DE SISTEMAS', 'M', 'calle 11B # T14-10 Barrio Sachamate', 'carlos31s@yahoo.com', '3125271859', '1973-05-10', 49, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 3, 7, 8, 1, 3, 2, 6, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 6, 11, '', '030-16-0119 ', '2020-02-27', '35-01-0119', '2020-02-11', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(427, 'RODRIGUEZ CARDOZO LINA MARIA', '', '1144033924', b'1', '2020-01-02', 'Economista', 'F', 'Calle 14 Nª 19-78 Barrio L Reserva', 'lina.rodriguez.cardozo@gmail.com', '3156704889', NULL, 31, 0, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 1, 31, 4, 10, 3, 14, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 14, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(428, 'AIDA NEYI', 'SAMBONI ORDOÑEZ ', '48648766', b'1', '2020-12-01', 'Auxiliar Contable', 'F', 'Calle 9 # 13-13', 'aidaneyi68@gmail.com', '3226586924', '1982-11-01', 40, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 15, 1, 3, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', '2020-12-01', '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(429, ' ALVARO ENRIQUE', 'RODRIGUEZ GUERRERO', '16844120', b'1', '2020-02-26', 'lic en filosofia', 'M', 'cra 24 8 a sur 31 alborada', 'alvaroenriquerodriguez@hotmail.com', '3178404047', '1982-06-06', 40, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 9, 1, 8, 4, 17, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '0107', '2020-02-26', '35-01-0110', '2020-02-11', 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(430, 'JAIRO ALBERTO', 'RODRIGUEZ LOBOA ', '16829508', b'1', '2015-06-24', '', 'M', 'Calle 8a N 5 52 B/ 1ro mayo', 'sintrajamundi1980@gmail.com', '3226260242', '1969-04-09', 53, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 2, 14, 6, 1, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 33, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 3, 'COLOMBIA', 'CALI', NULL),
(431, ' ANA MILENA', 'SANCHEZ CASTRO', '31537192', b'1', '2011-12-23', 'Inspectora en seguridad y salud en el trabajo', 'F', 'Cra 24#5a sur 63 la alborada 2', 'kiara_14997@hotmail.com', '3226790569', '1976-07-30', 46, 3, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 14, 7, 3, 6, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 34, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_2.37.48_PM.1661802613_630d1875a748f.jpeg', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(432, ' CESAR AUGUSTO', 'RODRIGUEZ LULIGO', '16829234', b'1', '2018-01-02', 'ingeniero Agronomo', 'M', 'Carera 17 sur. No.  1-33', 'cesaruls@hotmail.com', '3154597333', '1970-12-01', 52, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 1, 1, 6, 5, 26, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 27, NULL, '', 'resolucion 168', '1998-01-02', '019 de 1998', '1997-12-24', 'Presencial', '', 'views/archivos/fotos/Cesar_Augusto_Rodriguez_Luligo.1663612345_6328b5b93acf1.jpg', '2018', 22, 3, 'COLOMBIA', 'CALI', NULL),
(433, 'YURY', 'SANCHEZ MUÑOZ', '1144075395', b'1', '2019-06-17', 'MEDICO GENERAL', 'F', 'Calle 12 Sur Nº10 -81 Torre B APt 701 Quintas', 'yurysanchez0711@gmail.com', '3104238586', '1994-11-07', 28, 1, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 7, 28, 5, 8, 4, 17, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 17, 24, 'SI', '', NULL, '', NULL, 'null', '', '', '2019', 22, 3, 'COLOMBIA', 'CALI', NULL),
(434, ' DIANA CAROLINA', 'SANCHEZ RIASCOS', '34316792', b'1', '2020-07-02', 'Administradora de Empresas', 'F', 'Conjunto campestre los Naranjos Manzana 3', 'diana_sanchez26@misena.edu.co', '3226940813', '1982-03-26', 40, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 12, 1, 6, 5, 24, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 24, 35, '', '33-01-0243', NULL, '', '2020-07-02', 'Presencial', '', 'views/archivos/fotos/Diana_Carolina_Sanchez.1662996327_631f4f6797da4.jpeg', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(435, ' RODRIGO', 'RODRIGUEZ MAMPOTES', '16833864', b'1', '2013-01-15', 'Bachiller academico', 'M', 'CRA 1 B sur # 6 A 31 rincón de Zaragoza ', 'rodrirodri44@outllook.com', '3168002581', '1972-12-03', 50, NULL, 'Hipertenso y colon ', 1, NULL, 'Cedula de Ciudadania', 2, 2, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', '', '2013', 22, 1, 'COLOMBIA', 'CALI', NULL),
(436, 'RODRIGUEZ RUIZ EDWIN', NULL, '16497660', NULL, '2012-12-12', 'TL COMERCIO EXTERIOR', 'M', NULL, 'edwrodriguez8@hotmail.com', '3214132672', '0000-00-00', 52, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 28, 1, NULL, 5, 23, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(437, 'SANDOVAL TORO ANDRES FELIPE', '', '1143826423', b'0', '2020-01-02', '', 'M', 'CALLE 12 SUR #10-81  403 C', 'andres.sandoval@jamundi.gov.co', '3162938595', NULL, 122, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 28, 4, NULL, 3, 14, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 14, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(438, 'CRISTIAN CAMILO', 'RODRIGUEZ SALDAÑA', '1143837492', b'1', '2020-05-18', 'ADMINISTRADOR DE EMPRESAS', 'M', 'Carrera 24a # 56a - 22', 'cristian.rodriguez@correounivalle.edu.co', '3057680933', '1991-06-02', 31, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 31, 1, 6, 5, 27, 2, 'NO', '0', 2, 'MAL', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-26_at_3.30.38_PM_-_CRISTIAN_CAMILO_RODRIGUEZ_SALDANA.1662567796_6318c57486030.jpeg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(439, 'MARIA IRLESA', 'SANCHEZ TABA ', '66854884', b'1', '2020-07-09', 'TECNICA EDUCACION PREESCOLAR', 'F', 'Calle 9A # 17-54  Apto 202 El Dorado', 'misanchezsalud@gmail.com', '3167214545', '1972-04-16', 50, 1, 'hipertensa', 1, 5, 'Cedula de Ciudadania', 1, 7, 28, 1, 3, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', '2020-07-09', '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(440, 'JOHN STHIVEN', 'TABORDA MARIN ', '1143863914', b'1', '2020-02-24', 'TEC ASISTENCIA ADM', 'M', 'CR 41 A SUR 10 J 21 ', 'johnsthiven@gmail.com', '3207329062', '1995-10-24', 27, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 12, 1, 3, 2, 9, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(441, ' EDWIN BERNARDO', 'SANCHEZ URREA', '16837364', b'1', '2005-03-03', 'BACHILLER ACADEMICO', 'M', 'CARRERA 7 10-200 b/ COUNTRY PLAZA II', 'edwinsanchez719@hotmail.com', '3207406035', '1977-11-12', 44, NULL, 'NO', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', 1, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/foto_Edwin_Bernardo_Sanchez_Urrea.1661780985_630cc3f9ba92c.jpg', '2005', 22, 1, 'COLOMBIA', 'CALI', NULL),
(442, ' JOSE ANUAR', 'RODRIGUEZ VALDEZ', '16450339', b'1', '2015-06-10', 'Operador Maquinaria Amarilla', 'M', 'Calle 4 No. 2-57 Portales del Jordán', 'Joseanuarro0712@gmail.com', '3203034795', '1962-12-07', 60, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 3, 14, 6, 3, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(443, 'SANDRA VIVIANA', 'SANCHEZ URREA', '31535957', b'1', '1998-01-02', 'CONTADORA PUBLICA', 'F', 'cra7 10-200 casa C-20', 'savisa_76@hotmail.com', '3184184220', '1976-04-25', 46, 2, 'NINGUNA', 1, 8, 'Cedula de Ciudadania', 1, 7, 8, 1, 7, 2, 9, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 9, 14, 'SI', '', NULL, '026-5-01-199', NULL, 'Presencial', '', '', '1998', 22, 1, 'COLOMBIA', 'CALI', NULL),
(444, ' ARABELLA', 'RODRIGUEZ VELASCO', '66812277', b'1', '2022-10-28', 'ABOGADA', 'F', 'carrera 77 #13A1-29 AP 401A', 'arabellarodriguezvelasco@yahoo.com', '3104932150', '1970-06-28', 52, NULL, 'DIANOSTICO DE LUPUS ', 1, 4, 'Cedula de Ciudadania', 1, 1, 30, 4, 6, 3, 14, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 14, NULL, '', '', NULL, '', NULL, 'null', '', '', '2022', 22, 1, 'COLOMBIA', 'CALI', NULL),
(445, 'SIERRA ORDOÑEZ YOLANDA', NULL, '66822636', NULL, '2020-01-02', NULL, 'F', NULL, 'yolysi9@hotmail.com', '3215422886', '0000-00-00', 122, NULL, NULL, 0, 2, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 54, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 25, NULL, 'DECRETO 35-16-037', '2025-04-30', '11', '2025-04-17', 'Presencial', NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(446, ' FRANCISCO JAVIER', 'ROMAN PULGARIN', '79853001', b'1', '2022-07-21', 'Tècnico en educaciòn fisica', 'M', 'Calle 7 N.8-30', 'nicoramirezb7@gmail.com', '3507538110', '1977-07-21', 45, 2, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 7, 4, 3, 2, 7, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 7, 12, '', '', NULL, '', NULL, 'null', '', '', '2022', 22, 4, 'COLOMBIA', 'CALI', NULL),
(447, 'SANDOVAL  PATRICIA', '', '31526568', b'1', '1990-04-20', 'Secretaria', 'F', 'Calle 10 Nº 18-59 Sachamate', 'sebasysaray@hotmail.com', '3104634076', NULL, 57, 3, 'no', 1, 1, 'Cedula de Ciudadania', 1, 7, 9, 1, 3, 2, 3, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 3, NULL, '', '', NULL, '', NULL, 'null', '', '', '1990', 22, 2, 'COLOMBIA', 'CALI', NULL),
(448, 'INGRID JULIET', 'ROJAS MOSQUERA ', '29111484', b'1', '2020-03-05', 'INGENIERA TOPOGRAFICA', 'F', 'Calle 19 15A-20', 'ingrid.jrojas@gmail.com', '3014542301', '1978-07-17', 44, 0, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 1, 7, 31, 1, 6, 5, 26, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '30-16-0114', '2020-03-05', '35-01-0152', '2020-02-11', 'Presencial', '', 'views/archivos/fotos/ROJAS_INGRID_-_Ingrid_Juliet_Rojas_Mosquera.1661801378_630d13a206a41.jpg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(449, 'MELISSA', 'SANDOVAL GOMEZ ', '1112476627', b'1', '2020-02-12', 'ABOGADA-TEC ADM JUDICIAL', 'F', 'cra 6ta No. 23 68 alferez real ', 'melissavictimasjamundi@gmail.com', '3185216900', '1992-08-26', 30, 1, 'Alérgica a los aines ', 1, 3, 'Cedula de Ciudadania', 2, 8, 12, 1, 10, 4, 17, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 17, 26, 'SI', 'Decreto No. 30-16-0056', '2020-02-12', '35-01-0052', '2020-02-10', 'Presencial', '', 'views/archivos/fotos/Melissa_Sandoval.1662997129_631f52891f7b6.jpg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(450, 'MAFLA ZULUAGA ROBERT', NULL, '16827791', NULL, '2020-07-15', 'Bachiller', 'M', NULL, 'laura.mafla@correounivalle.edu.co', '3167865971', '0000-00-00', 53, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(451, 'SANDOVAL MANZANO UBERNEY', NULL, '79526007', NULL, '2020-02-19', 'tecnologia en control ambiental', 'M', NULL, 'uberneysandovalmanzano@gmail.com', '3127299944', '0000-00-00', 52, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(452, 'ROMERO MONTOYA JOSE DANILO', NULL, '4077605', NULL, '2011-03-28', NULL, 'M', NULL, 'sosdaromo@gmail.com', '3107036281', '0000-00-00', 60, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(453, 'SANDOVAL RIVERA CARMEN LILIANA', NULL, '31532822', NULL, '2011-12-30', NULL, 'F', NULL, NULL, '3105140494', '0000-00-00', 48, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(454, 'EDMUNDO JAVIER', 'ROSERO MONTUFAR ', '87944135', b'1', '2020-11-17', 'ingenieria de sistemas y computacion', 'M', 'Calle 12 Sur # 10-81 Apto 702B Quintas de Bolivar', 'javierroseromontufar@hotmail.com', '3226404552', '1983-01-29', 40, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 9, 1, 7, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '35-16-016', '2020-11-17', '35-01-0347', '2020-07-14', 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(455, 'SANTOS RUIZ DAVID ANDRES', '', '80827239', b'1', '2021-05-20', 'politologo', 'M', 'Calle 12ª N. 5-55 apto 301 Bl4 Los Naranjos 5', 'davidandresantos@gmail.com', '3144541135', NULL, 37, 1, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 7, 50, 4, 10, 3, 13, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 13, NULL, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 4, 'COLOMBIA', 'CALI', NULL),
(456, ' PEDRO NEL', 'SARDI DURAN', '16829455', b'1', '2011-12-15', 'Abogado', 'M', 'Carrera 7 # 10-250', 'Pedronelsardi21@gmail.com', '3164639255', '1970-06-28', 52, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 14, 6, 7, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 28, NULL, 'SI', '', NULL, '', NULL, 'null', '', '', '2011', 22, 5, 'COLOMBIA', 'CALI', NULL),
(457, 'YEFERSON', 'SARRIA GARCIA ', '1107101639', b'1', '2019-12-31', 'ODONTOLOGO', 'M', 'CALLE12 SUR No. 10-81', 'yeferson_sarria@hotmail.com', '3152138855', '1996-08-26', 26, NULL, 'ASA I', 1, NULL, 'Cedula de Ciudadania', 1, 5, 6, 5, 7, 4, 17, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '', NULL, '', NULL, 'null', '', '', '2019', 22, 3, 'COLOMBIA', 'CALI', NULL),
(458, 'SIERRA MANCILLA SONIA ANDREA', NULL, '52421996', b'1', '2020-06-11', 'abogada', 'F', 'CRA 38A # 9A OESTE 39', 'sierrandrea55@hotmail.com', '3108560531', '0000-00-00', 43, 0, 'NO', 1, 4, '\"CEDULA DE CIUDADANIA\"', 1, 7, 11, 4, 10, 3, 14, 2, 'No tiene hijos', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, 3, 'COLOMBIA', 'CALI', NULL),
(459, ' JUAN CARLOS', 'SIERRA VIERA', '16824787', b'1', '1998-01-05', 'Música ', 'M', 'Calle 15 No 6 - 77 barrio  Belalcazar ', 'jcbandola@hotmail.com', '3175136116', '1963-08-14', 59, NULL, 'Control glicemia', 1, 8, 'Cedula de Ciudadania', 2, 7, 5, 1, 3, 5, 26, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 27, NULL, '', 'Resolución No. 200 diciembre 24 de  1977 ', '1998-01-05', '', '1997-12-24', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-26_at_12.15.02_PM.1661786214_630cd8662922a.jpeg', '1998', 22, 3, 'COLOMBIA', 'CALI', NULL),
(460, 'NANCY OLIVA', 'SILVA MUÑOZ', '67001911', b'1', '2021-09-14', 'Estudiante Derecho', 'F', 'Cra 16 #14-11 Barrio la pradera', 'nancy.silvafc@gmail.com', '3148625825', '1976-03-01', 47, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 1, 8, 5, 4, 5, 27, 3, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 27, NULL, '', '30-16-123', '2021-09-15', '35-01-27-216', '2021-09-14', 'Presencial', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(461, ' JUAN CARLOS', 'SOLARTE', '76044019', b'1', '2017-04-15', 'conductor', 'M', 'Cr 20 a # 8a sur 47 condados del sur', 'juancarlossolarte.jamundi@gmail.com', '3154176514', '1971-08-06', 51, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 1, 12, 5, 2, 2, 3, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'null', '', '', '2017', 22, 4, 'COLOMBIA', 'CALI', NULL),
(462, 'MARIN PALOMINO ANA LUCIDIA', NULL, '31931459', b'1', '2011-09-26', 'BACHILLER ACADEMICO', 'F', 'corrigimiento la Buitrera Km 7', 'analuc_10@hotmail.com', '3185482240', '0000-00-00', 58, 1, 'NO', 1, 1, '\"CEDULA DE CIUDADANIA\"', 1, 1, 9, 1, 2, 2, 4, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', 1, 1, 'COLOMBIA', 'CALI', NULL),
(463, 'ESCOBAR SANDOVAL DANILO', NULL, '6330999', NULL, '1973-10-01', 'Bachiller Academico', 'M', NULL, 'dahele54@yahoo.es', '3156899602', '0000-00-00', 75, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1973', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(464, ' ORLANDO', 'ESCOBAR VASQUEZ', '16651888', b'1', '2020-07-01', 'Tecnólogo en Electricidad Industrial y de Potencia', 'M', 'Calle 53 28E50', 'orlandoescobar.v@gmail.com', '3103475415', '1961-03-11', 62, NULL, 'HIPERTENSIÓN', 1, 11, 'Cedula de Ciudadania', 2, 7, 14, 1, 4, 5, 27, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 27, NULL, '', '30-16-0094', '2020-07-01', '35-01-0237', '2020-02-11', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(465, 'ENRICO', 'ESPINOSA ORTEGA ', '16721246', b'1', '2017-02-02', 'ELECTRICIDAD INDRUSTRIAL', 'M', 'calle 1a sur 15-25 B/ Riberas del Rosario', 'enrico.espinosa.o@gmail.com', '3128092045', '1966-01-20', 56, NULL, 'Hipertension', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 6, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_8.28.24_AM.1661779777_630cbf4115968.jpeg', '2017', 22, 4, 'COLOMBIA', 'CALI', NULL),
(466, ' JULIO CESAR', 'QUINTERO SALAZAR', '1112471625', b'1', '2011-12-15', 'Administrador de empresas ', 'M', 'Carrera 7 #6-45', 'julioc_2590@hotmail.com', '3165372483', '1990-12-25', 32, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 3, 14, 6, 6, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 28, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(467, 'QUIÑONEZ HURTADO LUIS FERNANDO', NULL, '16656074', NULL, '2011-09-26', 'tecnologia agroindustrial', 'M', NULL, 'lfquinones0@hotmail.com', '3184927171', '0000-00-00', 61, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 5, 24, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 24, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(468, ' EDGAR FERNANDO', 'QUIROZ MORAN', '98357663', b'1', '2020-02-24', 'ABOGADO', 'M', 'apartamento 102 Torre A Villas de Altagracia', 'fernandoquirozm@gmail.com', '3154204598', '1981-05-20', 41, NULL, 'Porosidad Labrum de Cadera', 1, 3, 'Cedula de Ciudadania', 3, 7, 12, 1, 7, 4, 17, 3, 'PADRE', '1', 0, 'MAL', b'0', '', NULL, 17, 26, 'SI', 'DECRETO 30-16-0106', '2020-02-24', '', '2020-02-11', 'Presencial', '', 'views/archivos/fotos/Edgar_Fernando_Quiroz.1662996557_631f504dc0f65.jpeg', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(469, 'DIANA CRISTINA', 'RADA GIRALDO ', '31532628', b'1', '1998-01-02', 'ABOGADA', 'F', 'VEREDA RIO CLARO CORREGIMIENTO POTRERITO', 'dianaradagiraldo@hotmail.com', '3153021120', '1973-12-25', 48, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 29, 1, 10, 2, 9, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 9, 14, '', '387', '2022-06-17', '1690', '2022-06-17', 'Alternancia', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-17_at_4.03.04_PM.1660770432_62fd58807d6b5.jpeg', '1998', 22, 3, 'COLOMBIA', 'CALI', NULL),
(470, ' HERLINTON ROBINSON', 'TUNJO SALAZAR', '16710132', b'1', '2020-07-08', 'PSICOLOGO', 'M', 'CRA 24 B   No. 8A-SUR-27', 'HRTUNJOSALAZAR@GMAIL.COM', '3173423129', '1964-06-20', 58, NULL, 'Hipotiroidismo ', 1, 4, 'Cedula de Ciudadania', 1, 7, 6, 1, 6, 5, 26, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Herlinton_Robinson_Tunjo_salazar.1663622399_6328dcffae824.jpg', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(471, 'JOSE HELMER', 'URBANO HERRERA ', '16824458', b'1', '2015-06-01', '', 'M', 'Riveras del Rosario cra 18s # 8-16', 'joselim1963@hotmail.com', '3207838359', '1963-01-13', 60, NULL, 'Acido urico alto', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL);
INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`, `pais_nacimiento`, `ciudad_nacimiento`, `otro_municipio`) VALUES
(472, 'JHON JAIRO', 'ZAMORA ', '16842322', b'1', '2015-09-15', 'Auxiliar de servicios', 'M', 'Corregimiento de robles valle', 'jhonjairozamora851@gmail.com', '3233370114', '1978-10-27', 44, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 2, 1, 8, 5, 2, 2, 4, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, 8, '', '', NULL, '', NULL, 'Presencial', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(473, 'LORENA', 'URRESTE ROMERO', '29360980', b'1', '2020-02-19', 'ADMINISTRADOR EMPRESAS', 'F', 'CARRERA 31 #15-33 Cristobal Colon', 'lorenaur1982@gmail.com', '3008884550', '1982-07-19', 40, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, NULL, 1, 7, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 26, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 1, 3, 'COLOMBIA', 'CALI', NULL),
(474, 'KELLY DADIANA', 'URRESTY VIAFARA ', '1112467502', b'1', '2020-07-07', 'TÉCNICO EN ASISTENCIA Y ORGANIZACIÓN DE ARCHIVOS', 'F', 'CALLE 9A 4-30 BARRIO POPULAR', 'K.URRESTY@GMAIL.COM', '3173231085', '1989-05-16', 33, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 7, 27, 1, 3, 2, 3, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 3, 6, '', '30-02-0247', '2020-07-07', '35-01-0263', '2020-06-17', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(475, ' PAOLA ANDREA', 'USMA VALENCIA', '29568060', b'1', '2011-12-23', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CARRERA 9A 16B-36 B/ CENTENARIO', 'paolusma@hotmail.com', '3184121324', '1979-08-09', 43, 2, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 14, 6, 6, 6, NULL, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-29_at_9.56.22_AM.1661785122_630cd42279ae6.jpeg', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(476, 'JULIAN FELIPE', 'VACCA MATAMOROS ', '81717531', b'1', '2020-07-07', 'COMERCIO INTERNACIONAL-TEC GESTION DE COMERCIO EXTERIOR- TEC', 'M', 'CLL 22A 37SUR 05 Sector 06 apto 101B', 'julian10919@hotmail.com', '3125198384', '1985-12-05', 37, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 13, 1, 6, 2, 3, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(477, 'VALDES  SAYURI', '', '38601466', b'1', '2020-09-11', 'TECNICO CONTADURIA', 'F', 'Corregimiento Quinamayo Via Guaino', 'sayurivaldes2@hotmail.com', '3134224650', NULL, 39, 2, 'Enfermedad Catastrofica.', 0, 7, 'Cedula de Ciudadania', 1, 1, 4, 1, 3, 2, 1, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 1, 1, '', 'A-1234578', '2022-06-20', '123', '2022-06-20', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(478, ' LUIS ARTURO', 'VALENCIA CASTAÑO', '9915162', b'1', '2020-03-13', 'TECNOLOGO EN FINANZAS', 'M', 'cra 1bis nro 6-91', 'internetviterbo@gmail.com', '3146864634', '1983-09-11', 39, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 8, 12, 1, 4, 5, 26, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', '2020-03-13', '35-01-0168', '2020-03-02', 'Presencial', '', 'views/archivos/fotos/Arturo_Valencia.1662995156_631f4ad451cc1.jpg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(479, ' ALBA NELLY', 'VALENCIA FAJARDO', '31536009', b'1', '2002-11-19', 'TÉCNICO PROFESIONAL SECRETARIADO EJECUTIVO', 'F', 'CORREGIMIENTO TIMBA VALLE', 'albanellyv@yahoo.com', '3113639142', '1976-05-20', 46, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 2, 7, 8, 5, 3, 2, 9, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 9, 14, '', '121', NULL, '', '2002-11-19', 'Presencial', '', '', '2002', 22, 3, 'COLOMBIA', 'CALI', NULL),
(480, ' JOAQUIN ANTONIO', 'VALENCIA GONZALEZ', '6332323', b'1', '2005-03-03', 'ELECTRICISTA ', 'M', 'CALLE 11A No 13 34B/ la lucha ', 'floritasol1959@hotmail.com', '3155155927', '1966-02-25', 57, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 7, 14, 6, 3, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', '', '2005', 22, 1, 'COLOMBIA', 'CALI', NULL),
(481, ' WILBER', 'VALENCIA JARAMILLO', '16493969', b'1', '2020-03-03', 'CONTADOR PUBLICO', 'M', 'Km 3 Via chipaya, COndominio Guaduales de las Mercedes Casa 20', 'wilbervalencia@gmail.com', '3104708386', '1969-01-10', 54, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 2, 7, 13, 1, 7, 4, 17, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 25, 'SI', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(482, 'VARELA RUA PAULA ANDREA', '', '1112462916', b'1', '2021-06-01', 'Médico', 'F', 'Cra 22 N.3 sur 30 Casa 207 conjunto resindenc', 'paulavarela241@gmail.com', '3017444509', NULL, 34, 2, 'NO', 1, 5, 'Cedula de Ciudadania', 1, 7, 28, 4, 10, 3, 14, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 14, NULL, '', '', NULL, '', NULL, 'null', '', '', '2021', 22, 1, 'COLOMBIA', 'CALI', NULL),
(483, 'VARGAS GIL ROSA MARIA', '', '31202195', b'1', '2011-01-21', 'bachiller academico', 'F', 'Calle 13 N.15-15', '', '3235091403', NULL, 57, 2, 'no', 1, 11, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(484, ' DARLYN', 'VASQUEZ FLOREZ', '31569096', b'1', '2020-03-02', 'Bibliotecóloga', 'F', 'Clle 3A # 92-116 Melendez casa 78 ', 'evedany31@yahoo.com', '3163930781', '1979-09-15', 43, 2, 'NINGUNA', 1, 6, 'Cedula de Ciudadania', 1, 7, 5, 1, 7, 5, 26, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(485, 'VASQUEZ HURTADO CESAR JAIRO', '', '1629349', b'0', '2019-12-31', 'TEC VETERINARIO', 'M', 'CRA1  No. 10c-55', 'cejavas829@gmail.com', '3044426409', NULL, 53, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 6, 5, NULL, 2, 3, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 3, NULL, '', '', NULL, '', NULL, 'null', '', '', '2019', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(486, 'VASQUEZ OSORIO MARIA EUGENIA', '', '31987667', b'1', '2020-10-05', 'Bachiller comercial - empresarial', 'F', 'Calle 5 Nº 1BL-81 Barrio Jordan ', 'vasquezosoriomaria@gmail.com', '3175289466', NULL, 53, 2, 'NO', 1, 1, 'Cedula de Ciudadania', 1, 7, 9, 1, 2, 2, 9, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 9, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(487, 'VANESSA', 'VASQUEZ QUINAYAS', '1144148298', b'1', '2019-12-31', 'INGENIERA AMBIENTAL - TECNOLOGA ECOLOGIA Y MANEJO AMBIENTAL', 'F', 'CARRERA 100 # 34-96', 'vasquezquinayas@gmail.com', '3242098247', '1991-04-29', 31, 0, 'NINGUNA', 1, 6, 'Cedula de Ciudadania', 1, 7, 2, 5, 6, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 26, '', '', '2019-12-31', '', NULL, 'Presencial', '', 'views/archivos/fotos/DSC_1173._-_vanessa_quinayas.1661803888_630d1d70e2127.jpg', '2019', 22, 4, 'COLOMBIA', 'CALI', NULL),
(488, 'JOSE LUIS', 'MERINO RUALES', '1126448761', b'1', '2020-10-01', 'CONTADOR PUBLICO', 'M', 'Cra 23 # 8 - 55 Apto 208 Torre D, Unidad Solaria', 'jose.merinocp@gmail.com', '3128205226', '1988-01-28', 35, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 13, 1, 7, 4, 17, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 17, 26, 'SI', 'Decreto 35-16-0026 de Julio de 2020', '2020-10-01', '', '2020-07-28', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(489, 'BISMARCK ERICK', 'VEGA MAFLA ', '16824802', b'1', '1987-03-03', 'BACHILLER', 'M', 'Carrera  8- 791 barrio Angel Maria Camacho', 'ericvmafla@outlook.es', '3187261981', '1962-08-31', 60, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 12, 1, 2, 5, 23, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 23, 33, '', '', NULL, '', NULL, 'null', '', '', '1987', 22, 1, 'COLOMBIA', 'CALI', NULL),
(490, 'VICTOR HUGO', 'VEGA MAFLA', '16822396', b'1', '2011-12-15', '', 'M', 'carrera 12 # 10-52 juan de ampudia', 'victorhugovegamafla@gmail.com', '3218405461', '1961-09-06', 61, NULL, 'vena varice, lumbar ciatico,acido úrico, operación en tobillo derecho', 1, NULL, 'Cedula de Ciudadania', 3, 7, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(491, 'VELANDIA VALCARCEL AURA MILENA', '', '1052392412', b'1', '2020-01-02', 'ABOGADA ESPECIALISTA EN  DERECHO ADMINISTRATIVO', 'F', 'carrera 12a # 3-81  Torre 6 Apto 504 Los nara', 'aura.milena.velandia@gmail.com', '3184043619', NULL, 31, 0, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 3, 15, 4, 10, 3, 14, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 14, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(492, 'FERNANDO ANTONIO', 'VEGA VELASQUEZ', '16724127', b'1', '2013-08-01', 'ADMINISTRADOR DE EMPRESAS', 'M', 'Cra 28A # 10A-45', 'feravev@gmail.com', '3007742695', '1966-05-08', 56, NULL, 'Síndrome ansio-depresivo diagnosticado, HBP, Vértigos recurrentes, migrañas recurrentes, dificultad al caminar por cirugía de rodilla', 1, 4, 'Cedula de Ciudadania', 2, 2, 6, 1, 6, 4, 17, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 17, 23, '', '', NULL, '', NULL, 'Presencial', '', '', '2013', 22, 1, 'COLOMBIA', 'CALI', NULL),
(493, 'SANDRA MILENA', 'VELASCO CARABALI ', '66924703', b'1', '2020-07-09', '', 'F', 'carrera 12 bis 26-81', 'sandravelascounad@gmail.com', '3014530031', '1974-12-31', 47, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 7, 11, 1, 2, 2, 3, 1, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 3, 5, '', '30-16-0250', '2020-07-09', '35-01-0269', '2020-06-17', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_4.08.08_PM.1660079309_62f2cccdb86ce.jpeg', '2020', 22, 3, 'COLOMBIA', 'CALI', 'Santander de Quilichao'),
(494, 'VELASCO CORDOBA LADY LORENA', '', '1061782199', b'1', '2020-06-17', 'Ingeniera forestal', 'F', 'Calle 10A Nª 1S-04 Portal Jamundi', 'leidy.velasco.95@gmail.com', '3012031059', NULL, 26, 0, 'NO', 1, 11, 'Cedula de Ciudadania', 1, 7, 2, 1, 10, 5, 27, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(495, 'YADERLY', 'VELASCO HURTADO', '1143932728', b'1', '2020-07-14', 'TECNOLOGA ADMINISTRACCION EMPRESAS', 'F', 'CALLE 9A # 1 SUR -57 Villa Paulina', 'yader9015@hotmail.com', '3052204466', '1990-05-15', 32, 0, 'Hipoglicemia ', 1, 5, 'Cedula de Ciudadania', 1, 7, 28, 1, 5, 2, 3, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', '2020-07-14', '35-01-0274', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(496, 'LEYDI JHOANNA', 'VELASQUEZ LOPEZ ', '38562379', b'1', '2020-07-07', 'PROFESIONAL EN CIENCIA DE LA INFORMACIÓN y LA DOCUMENTACIÓN ', 'F', 'Fcarrera 2 # 8a - 16', 'ljvelasquezgestiondoc@gmail.com', '3173556824', '1982-05-07', 40, 0, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 1, 29, 1, 6, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, NULL, '', '', '2020-07-07', '', '2020-07-07', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(497, 'DIANA CAROLINA', 'VELEZ GIRALDO', '1112472120', b'1', '2020-07-09', 'TECNOLOGA EN CONTABILIDAD Y FINANZAS', 'F', 'VEREDA EL GUABAL', 'carolina.velezgiraldo17@gmail.com', '3115642231', '1991-02-17', 32, 0, 'Miopía, Astigmatismo, ', 1, 4, 'Cedula de Ciudadania', 1, 3, 3, 1, 4, 2, 3, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 3, NULL, '', '', '2020-07-09', '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(498, ' VIVIANA ANDREA', 'VELEZ GOMEZ', '31322223', b'1', '2020-07-07', 'TEC GESTION EMPRESARIAL', 'F', 'Cra 23C # 30-38 ', 'vivivelez917@gmail.com', '3166004152', '1983-09-17', 39, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 2, 10, 1, 4, 2, 3, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '', '2020-07-07', '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(499, 'YANETH', 'VELEZ TORREZ ', '66822828', b'1', '2017-08-14', 'ADMINISTRADORA DE EMPRESAS', 'F', 'CARRERA 4 SUR #9A-21 El Socorro', 'yaneth0307@hotmail.es', '3167504728', '1971-03-07', 52, 2, 'HIPOTIROIDISMO / DISCAPACIDAD AUDITIVA', 1, 5, 'Cedula de Ciudadania', 1, 5, 28, 1, 6, 2, 9, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'Presencial', '', '', '2017', 22, 1, 'COLOMBIA', 'CALI', NULL),
(500, 'JAVIER ORLANDO', 'VENEGAS PEREZ ', '80156705', b'1', '2020-05-05', 'gestion empresarial', 'M', 'calle 11 # 14T-34', 'javiervenegas859@gmail.com', '3133715895', '1981-08-18', 41, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 9, 1, 4, 2, 4, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, 8, '', 'decreto 0120 del 11 de febrero de 2020', '2020-05-05', '35-01-2019', '2020-05-05', 'Presencial', '', '', '2020', 22, 5, 'COLOMBIA', 'CALI', NULL),
(501, 'JENNIFER VIVIANA', 'VERA MERCADO', '1130652642', b'1', '2020-02-26', 'tecnologa admon empresas ', 'F', 'carrera 19 No. 24-50', 'JEVIVI6@GMAIL.COM', '3137535468', '1987-06-06', 35, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 27, 1, 4, 2, NULL, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 38, NULL, '', '', '2020-02-26', '35-01-0106', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(502, 'VERA TOVAR SILVIO ALBERTO', NULL, '16820903', NULL, '1992-06-13', NULL, 'M', NULL, NULL, '3173785247', '0000-00-00', 64, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 1, NULL, 2, 7, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(503, 'JOSE RUBEN', 'VIAFARA BERMUDEZ', '16375118', b'1', '2022-11-01', 'Ingeniera Industrial', 'M', 'Cra. 1b bis sur No. 5a . 30', 'rubenchovi@hotmail.com', '3147068380', '1964-04-09', 58, NULL, 'Colesterol.alto', 1, 8, 'Cedula de Ciudadania', 2, 1, 14, 4, 7, 3, 11, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 11, 16, 'SI', 'RESOLUSION 164- 24 DE DIC. 1197', NULL, '', NULL, 'Presencial', '', '', '2022', 22, 1, 'COLOMBIA', 'CALI', NULL),
(504, 'SOLIS MARTINEZ JAVIER', '', '1112470743', b'0', '2020-07-07', '', 'M', 'calle 17a # 4 - 33', 'javier.solis.sttj@gmail.com', '3117974798', NULL, 31, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 29, 1, NULL, 4, 17, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 17, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(505, 'LUIS FERNANDO', 'SUAREZ ALVAREZ', '16620150', b'1', '2020-02-24', 'LICENCIADO EN BIOLOGIA Y QUIMICA', 'M', 'Cra 15a N° 22 - 67', 'luisfersuarez1958@gmail.com', '3187116405', '1959-02-15', 64, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 2, 1, 6, 4, 17, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 26, '', '30-16-0102 ', NULL, '', '2020-02-11', 'Presencial', '', 'views/archivos/fotos/Luis_Fernando_Suarez_Alvarez.1663609016_6328a8b8b976e.jpg', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(506, 'VIAFARA ELVER', NULL, '14675084', NULL, '1997-12-31', NULL, 'M', NULL, NULL, '3147425724', '0000-00-00', 65, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(507, 'SULEZ GOMEZ SEBASTIAN', NULL, '1112476080', NULL, '2020-01-02', NULL, 'M', 'cra 34 # 100a 150', 'sebastian.sg92@gmail.com', '3218507678', '0000-00-00', 29, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 13, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', 1, NULL, 'COLOMBIA', 'CALI', NULL),
(508, 'VINASCO MONTOYA JUVENAL', NULL, '6332309', NULL, '1988-08-18', 'TL ADM MUNICIPAL', 'M', NULL, 'juvenalvinasco27@hotmail.com', '3153030030', '0000-00-00', 122, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 12, 1, NULL, 4, 17, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(509, 'VIAFARA VELA MARCOS ALBERTO', NULL, '6334866', NULL, '1997-06-24', 'Bachiller Academico', 'M', NULL, 'ferfasierra@hotmail.com', '3147434700', '0000-00-00', 62, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(510, 'RICARDO', 'TABARES BOTERO', '1115187633', b'1', '2020-11-26', 'INGENIERO DE SISTEMAS Y COMPUTACION', 'M', 'calle 12 sur ·10E-57', 'rtabares1990@gmail.com', '3207388284', '1990-04-21', 32, NULL, 'Asma', 1, 4, 'Cedula de Ciudadania', 1, 8, 8, 1, 6, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 25, '', '35-16-0053', '2020-11-26', '', '2020-11-11', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(511, ' GERLIN KLEITON', 'VICTORIA RANGEL', '94383290', b'1', '2015-06-23', '', 'M', 'Conj.residencialMadeiraCallejonCodinterCasa5', 'jamundivalle@hotmail.com', '3166160750', '1973-05-19', 49, NULL, 'Hipertensión', 1, NULL, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 7, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(512, 'MARIA EUGENIA', 'VIDAL ALEGRIA', '34546983', b'1', '2020-02-25', 'ADMINISTRADOR DE EMPRESAS', 'F', 'Carrera 1 # 10C 55 Apto 401B Villas de Altagracia', 'magenavidal@gmail.com', '3127974738', '1965-01-13', 58, 1, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 13, 1, 7, 4, 17, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 26, 'SI', '', '2020-02-25', '35-01-0103', '2020-02-11', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(513, ' HERNAN DE JESUS', 'TABARES RIVERA', '16735693', b'1', '2020-03-18', 'Bachiller Academico', 'M', 'calle 72R #28 B2 38 Barrio Comuneros dos', 'hernantr2009@hotmail.com', '3155175054', '1967-01-03', 56, NULL, ' presión Arterial', 1, 1, 'Cedula de Ciudadania', 1, 7, 9, 1, 2, 2, 6, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 6, 11, '', '030-16-0119', '2020-03-18', '35-01-0183', '2020-02-11', 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(514, 'VIDAL MINA NEFIR AMPARO', '', '31533976', b'1', '2011-12-23', 'Bachillerato ', 'F', 'Cra 6 n. 15b.22', 'amparovidal2015@gmail.com', '3053926312', NULL, 48, 3, 'no', 1, 11, 'Cedula de Ciudadania', 2, 3, 14, 6, 2, 6, NULL, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(515, 'TABERA VELEZ BENJAMIN', '', '16830510', b'0', '2017-11-08', '', 'M', 'calle 5 sur # 6a - 43', 'benjamin101971@hotmail.com', '3152098439', NULL, 50, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 29, 5, NULL, 5, 19, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 19, NULL, '', '', NULL, '', NULL, 'null', '', '', '2017', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(516, 'VIDAL MOLINA VICTOR HUGO', '', '16837551', b'0', '2020-04-27', 'INGENIERIA INDUSTRIAL', 'M', 'CALLE 13 No 12-33', 'victorhugovi@yahoo.com', '3007830607', NULL, 44, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 27, 1, NULL, 5, 26, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(517, 'STELLA', 'MENDEZ HERRERA', '29122993', b'1', '2020-04-06', 'lic educacion basica Enfasis Ciencias Sociales', 'F', 'Cra. 61 No. 18-61, Torre R, Apto. 571', 'smendez126@gmail.com', '3184585429', '1979-10-26', 43, 2, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 9, 1, 6, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, NULL, '', '30-16-0158', '2020-04-06', '35-01-0197', '2020-03-02', 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(518, 'LUIS MARIO', 'VILLAMIL HIDALGO', '1107065201', b'1', '2021-01-05', 'ADMINISTRADOR DE EMPRESAS', 'M', 'calle 3ra oesta 56 350 casa 111', 'mariovillamil114@gmail.com', '3173770585', '1990-11-26', 32, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 3, 6, 1, 7, 2, 3, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 3, 3, 'SI', '', '2021-01-05', '', NULL, 'Virtual', '', 'views/archivos/fotos/Luis_Mario_Villamil_Hidalgo.1663622831_6328deaf28ce0.jpeg', '2021', 22, 1, 'COLOMBIA', 'CALI', NULL),
(519, 'VIVAS MANRIQUE SINTHIA', '', '67007492', b'1', '2018-10-01', 'Bachiller Academico', 'F', 'Cra 20 A Nº 8 Sur - 24 Condado del Sur', 'synthi12@hotmail.com', '3105697096', NULL, 44, 3, 'NO', 1, 1, 'Cedula de Ciudadania', 1, 8, 9, 5, 2, 5, 24, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 24, NULL, '', '', NULL, '', NULL, 'null', '', '', '2018', 22, 2, 'COLOMBIA', 'CALI', NULL),
(520, ' MARIA CRISTINA', 'TELLO MOLANO', '34602704', b'1', '2020-10-07', 'ARQUITECTA', 'F', 'CRA 7 No 10-250 COUNTRY PLAZA 1 CASA 26', 'macristel2@gmail.com', '3128954449', '2022-10-13', 0, 1, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 27, 1, 6, 4, 17, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 17, 23, '', '', NULL, '', NULL, 'null', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(521, 'CARLOS FERNANDO', 'VILLAQUIRAN MARTINEZ', '16829507', b'1', '2011-12-15', 'AUXILIAR TECNICO EN VETERINARIA', 'M', 'CARRERA 9a # 11-44 BARRIO JUAN DE AMPUDIA', 'cafevi2911@gmail.com', '3225277321', '1969-11-02', 53, NULL, 'HIPERTENSO DIABETICO, CON PIE DE CHACOT, INSUFICIENCIA RENAL, TAQUICARDIA, ANGINA DE PECHO', 1, NULL, 'Cedula de Ciudadania', NULL, 3, 14, 6, 3, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(522, 'TELLO VIAFARA HARNE', '', '16825409', b'0', '2016-01-12', '', 'M', 'Carrera 6 No 23-74 B/ Alferez real', 'harnetello@hotmail.com', '3137898176', NULL, 56, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 5, 5, NULL, 5, 22, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 22, NULL, '', '', NULL, '', NULL, 'null', '', '', '2016', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(523, 'MORENO ZAMORA JAVIER', NULL, '16832152', NULL, '2008-04-01', NULL, 'M', NULL, 'eljavi62@gmail.com', '3187730202', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(524, 'VILLEGAS CASANOVA DIANA CAROLINA', NULL, '1130610115', NULL, '2020-01-02', NULL, 'F', NULL, 'carolina.villegas@jamundi.gov.co', '3167425888', '0000-00-00', 37, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 4, NULL, 3, 14, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(525, 'BEATRIZ ELENA', 'ARGUELLO COLLAZOS ', '31539750', b'1', '2018-07-04', 'Auxiliar administrativo ', 'F', 'Calle 10d #53sur-76 flores', 'betyar32@gmail.com', '3147169574', '1978-10-27', 44, 3, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 1, 1, 7, 4, 2, 2, 10, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 10, 15, '', '0263', '2018-07-04', '35-01-27-015', '2018-07-04', 'Presencial', '', 'views/archivos/fotos/Beatriz_Elena_Arguello_Collazos.1663602494_63288f3e37bb9.jpg', '2018', 22, 4, 'COLOMBIA', 'CALI', NULL),
(526, 'ERIC ALEXANDER', 'VILLEGAS RESTREPO', '1112461641', b'0', '2011-03-19', 'Técnico en obras civiles ', 'M', 'Carrera12#5-55torr5 apto503losnaranjos', 'ericvillegas743@yahoo.com', '3023576684', '1986-11-15', 36, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 1, 14, 6, 3, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(527, 'WAGNER ARIAS LUZ MARIA', NULL, '31520750', b'1', '1979-09-13', 'TECNOLOGIA SECRETARIADO EJECUTIVO', 'F', 'Cra 98 B Nº 48-52 Apt 321 Valle Lili', 'luzmawagner@hotmail.com', '3146201102', '0000-00-00', 61, 2, 'NO', 1, 1, '\"CEDULA DE CIUDADANIA\"', 1, 3, 9, 1, 3, 2, 9, 2, 'Madre', 'NO', NULL, 'BUENA', NULL, NULL, NULL, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1979', 1, 1, 'COLOMBIA', 'CALI', NULL),
(528, 'TOBAR GONZALES VICTOR HUGO', NULL, '16824638', NULL, '2015-06-24', NULL, 'M', NULL, 'jairo10concejo@hotmail.com', '3136957680', '0000-00-00', 57, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(529, 'WAGNER GALLEGO WILFREDO DE JESUS', NULL, '6331602', NULL, '2011-11-30', NULL, 'M', NULL, 'wagnerwilfredo@gmail.com', '3126688064', '0000-00-00', 71, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(530, 'EDGAR MAURICIO', 'VINASCO MURIEL', '16839318', b'1', '2019-12-31', 'Administración de empresas', 'M', 'km 3 via chipaya casa 37 a condomino las mercedes', 'vinasco657@gmail.com', '3174785591', '1979-06-20', 43, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 21, 5, 8, 2, 9, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 9, 14, 'SI', '', '2019-12-31', '', '2019-12-31', 'Presencial', '', 'views/archivos/fotos/Edgar_Mauricio_Vinasco.1663876142_632cbc2e2fec9.jpeg', '2019', 22, 3, 'COLOMBIA', 'CALI', NULL),
(531, ' ENRIQUE', 'WAGNER GRISALES', '16825799', b'1', '2015-06-10', 'Operario motoniveladora y volqueta', 'M', 'Corregimiento San Antonio vereda la Ortiz ', 'Enriquewagner123@gmail.com', '3158154931', '1966-11-27', 56, NULL, 'NINGUNA', 1, 9, 'Cedula de Ciudadania', 1, 1, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', '2011-02-28', '', NULL, 'Presencial', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(532, ' DAVINSON', 'TORRES ARANZAZU', '16897207', b'1', '2015-06-09', 'TECNICO OPERARIO DE PLANTA DE PROCESOS INDUSTRIALES', 'M', 'cra 5ta No 1A-14 B popular', 'torresdavi1524@gmail.com', '3166559733', '1984-04-15', 38, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 7, 14, 6, 3, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 1, 'COLOMBIA', 'CALI', NULL),
(533, 'WAGNER GRISALES JORGE ELIECER', NULL, '16835227', NULL, '2011-12-15', NULL, 'M', NULL, 'jewg1995@hotmail.com', '3166303009', '0000-00-00', 46, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(534, 'CRISTHIAM CAMILO', 'TORRES DORADO ', '1130595239', b'1', '2011-12-15', 'Tecnólogo Obras Civiles', 'M', 'CALLE 12SUR#10E-57 apto 1003F', 'CRISTHIANDORADO30@GMAIL.COM', '3147721827', '1987-05-30', 35, 3, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 7, 6, 4, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 36, NULL, '', '35-16-041', '2022-07-21', '', NULL, 'Presencial', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(535, 'YANDI HERMIDA ANGEL ARNOBIO', NULL, '16820491', NULL, '2011-02-25', NULL, 'M', NULL, NULL, '0', '0000-00-00', 64, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(536, 'TORRES LOPEZ CARLOS', '', '6768607', b'0', '2017-03-02', '', 'M', 'Calle 11b # 18 - 58', 'maticlanjar@yahoo.com', '3137176994', NULL, 59, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 29, 1, NULL, 5, 19, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 19, NULL, '', '', NULL, '', NULL, 'null', '', '', '2017', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(537, 'TERESA MARLENY', 'ZAMBRANO LEON ', '27374024', b'1', '2020-07-01', 'INGENIERA CIVIL', 'F', 'Calle 9#9-44 Juan de Ampudia', 'marlenyzam36@gmail.com', '3186960773', '1973-01-08', 50, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 27, 1, 7, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 23, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(538, 'TORRES MELO DAVID ESTEBAN', NULL, '1193265979', NULL, '2020-07-01', 'bachiller academico', 'M', NULL, 'davidestorres3197@gmail.com', '3127437892', '0000-00-00', 23, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(539, ' CELENY', 'TORRES PEÑA', '26632020', b'1', '2013-01-14', 'Administración de Empresas y Negocios Internacionales	', 'F', 'Cra 21 Bis No. 8 Sur 04 urbanización Condado Del Sur', 'cetope1311@yahoo.es', '3166901895', '1976-11-13', 46, 3, 'Antecedente isquémico ', 1, 4, 'Cedula de Ciudadania', 1, 7, 27, 1, 6, 5, NULL, 1, 'MADRE', '0', 2, 'BUENA', b'0', '', NULL, 27, NULL, '', '', '2020-01-13', '', NULL, 'null', '', '', '2013', 22, 1, 'COLOMBIA', 'CALI', NULL),
(540, 'ZUÑIGA HERNANDEZ YULI', NULL, '1112463949', NULL, '2017-11-01', NULL, 'F', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(541, 'MARIA YANETH', 'RUA GOMEZ ', '31523427', b'1', '2015-02-11', '', 'F', 'CALLE 9 18-45 B/ SACHAMATE', 'mariarua353@gmail.com', '3174102022', '1963-12-01', 58, NULL, 'CIRUGIA CRANEOENSEFALICA POR TUMOR MALIGNO EN HUESOS DE CARA Y CRANEO. RECOMENDACION. NO TOMAR SOL', 1, NULL, 'Cedula de Ciudadania', 2, 3, 14, 6, 2, 6, NULL, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 33, NULL, '', '', NULL, '', NULL, 'null', '', 'views/archivos/fotos/foto_yaneth_rua.1661801170_630d12d2e2b3d.jpg', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(542, 'TORRES RAMIREZ LILIANA', NULL, '31526444', NULL, '1998-04-16', NULL, 'F', NULL, 'leidylorena1008@hotmail.com', '3183839751', '0000-00-00', 52, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 27, 1, NULL, 5, 9, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(543, 'WALTER RAMIRO', 'CAMPO MENDEZ ', '76319056', b'1', '1998-01-01', 'INGENIERIA DE SISTEMAS', 'M', 'carrera 4 sur # 10bis-21', 'walter.ramiro@hotmail.com', '3135076527', '1972-10-30', 50, NULL, 'DIABETICO', 1, 11, 'Cedula de Ciudadania', 1, 7, 1, 1, 6, 5, 27, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Walter_Ramiro_Campo_Mendez.1663612553_6328b68977cb1.jpeg', '1998', 22, 1, 'COLOMBIA', 'CALI', NULL),
(544, ' JAMES HUMBERTO', 'ZAMORA', '6336056', b'1', '1986-09-01', 'AUXILIAR DE SERVICIOS GENERALES', 'M', 'Cra 1 d sur # 5-26 VEREDA TINAJAS ', 'jameshumbertozamora6336@gmail.com', '3225969742', '1956-12-06', 66, NULL, 'HIPERTENSION, BAJA VISITA A CORTA DISTANCIA', 1, 3, 'Cedula de Ciudadania', 2, 5, 13, 1, 2, 2, 4, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 4, 8, '', '041', NULL, '140', NULL, 'Presencial', '', '', '1986', 22, 1, 'COLOMBIA', 'CALI', NULL),
(545, ' REINALDO ALECSI', 'RUA GOMEZ', '16827799', b'1', '2015-06-01', '', 'M', 'Calle20acarrera52sur#52-32 B/PaisajelasFlores', 'delaruageneralservis@gmail.com', '3505174934', '1969-03-29', 53, NULL, 'lentes', 1, NULL, 'Cedula de Ciudadania', 1, 3, 14, 6, 2, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 5, NULL, '', '', NULL, '', NULL, 'null', '', '', '2015', 22, 4, 'COLOMBIA', 'CALI', NULL),
(546, ' MILTON ANTONIO', 'TRIVIÑO QUINAYAS', '16847610', b'1', '2020-03-02', 'Administrador de empresas', 'M', 'Carrera 8 Sur #4-35 Urb. Las Palmas', 'miltri14@gmail.com', '3168246521', '1983-11-14', 39, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 8, 1, 6, 4, 17, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 24, '', 'Decreto 0096', '2020-03-02', '35-01-0136', '2020-02-11', 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(547, ' NORMA LIDIA', 'ZAMORA VALENCIA', '34512092', b'1', '1987-10-26', 'ADMINISTRADORA DE EMPRESAS', 'F', 'Cra 7 # 10-250 - Casa 164', 'nolizava@gmail.com', '3155337334', '1966-03-27', 56, NULL, 'Osteoporosis', 1, 3, 'Cedula de Ciudadania', 2, 3, 13, 1, 6, 4, 17, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 22, '', '', NULL, '', NULL, 'Presencial', '', '', '1987', 22, 1, 'COLOMBIA', 'CALI', NULL),
(548, 'TENORIO ARIZALA JEYCSON', NULL, '16378068', NULL, '2020-05-01', 'tecnologia industrial', 'M', NULL, 'hernandezangela01@outlook.com', '3104125444', '0000-00-00', 37, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 5, NULL, 2, 6, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(549, ' HERMAN CAMILO', 'ZAPATA DURAN', '1118305267', b'1', '2020-02-27', 'GOBIERNO Y RELAICONES INTERNACIONALES', 'M', 'CALLE 25 #19-185 APTO 22 TORRE D', 'herman1458@gmail.com', '3127098423', '1995-08-02', 27, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 7, 28, 1, 7, 4, 17, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 17, 26, 'SI', '', NULL, '', NULL, 'null', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(550, ' DANIELA', 'RUA MICOLTA', '1112484707', b'1', '2020-07-07', 'Administradora de empresas', 'F', 'calle9 No. 9-11', 'daniirua8@gmail.com', '3014432179', '1995-05-10', 27, 0, 'NINGUNA', 1, 7, 'Cedula de Ciudadania', 1, 3, 50, 1, 6, 2, 3, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 3, 6, '', '', '2020-07-07', '', NULL, 'Alternancia', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(551, ' SARA IDALIA', 'TRUJILLO BOHOJORGE', '1061534977', b'1', '2020-08-19', 'ADMINISTRADOR EMPRESAS', 'F', 'Calle 3A # 21-18', 'sahara324@gmail.com', '3116028366', '1991-03-30', 31, 1, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 7, 8, 1, 7, 2, 3, 1, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 4, 'SI', '', '2020-08-19', '35-01-0306', NULL, 'Presencial', '', '', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(552, 'ZAPATA ORJUELA MARIA ELDICARDIS', '', '29812731', b'1', '2002-11-25', 'Primaria', 'F', 'calle 11  6S Nº 4-35 Jorge eliecer Gaitan', '', '3127277439', NULL, 61, 3, 'NO', 1, 1, 'Cedula de Ciudadania', 1, 7, 9, 5, 1, 2, 4, 2, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '', NULL, '', NULL, 'null', '', '', '2002', 22, 3, 'COLOMBIA', 'CALI', NULL),
(553, 'DAYANA MARISELL', 'RUALES IBARRA ', '59395795', b'1', '2020-04-06', 'CONTADORA PÚBLICA', 'F', 'CRA 1 B SUR # 6A 74 B/ RINCON DE ZARAGOZA', 'dayanamarisell@gmail.com', '3117067714', '1982-07-08', 40, 0, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 11, 1, 6, 5, 26, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 27, NULL, '', '30-16-0110', '2020-04-06', '35-01-27-019', '2020-02-11', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-08-09_at_11.02.16_AM.1660062641_62f28bb10c153.jpeg', '2020', 22, 4, 'COLOMBIA', 'CALI', NULL),
(554, 'CARLOS AUGUSTO', 'TRUJILLO VARGAS', '17325936', b'1', '2020-08-28', 'CONTADOR PUBLICO', 'M', 'CALLE 2  A   5 A  112', 'catruva_24@yahoo.es', '3113409909', '1963-07-21', 59, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 3, 13, 1, 6, 4, 17, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 17, 25, '', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(555, 'ZAPATA RAMIREZ GONZALO', '', '6403615', b'0', '2004-01-16', 'Bachiller Academico', 'M', '', 'gzapata041965@gmail.com', '3155816853', NULL, 56, NULL, '', 1, NULL, 'Cedula de Ciudadania', NULL, NULL, 9, 5, NULL, 2, 6, NULL, 'null', 'null', 0, 'BUENA', b'0', '', NULL, 6, NULL, '', '', NULL, '', NULL, 'null', '', '', '2004', 22, NULL, 'COLOMBIA', 'CALI', NULL),
(556, 'ELIZABETH', 'RUEDA ANGULO ', '43798535', b'1', '2020-02-24', 'Bachiller Academico', 'F', 'Cra 47 Sur Nº 20B- 17 Ciudadela Tarranova', 'eliru2009@hotmail.com', '3174774463', '1967-01-24', 56, 2, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 1, 8, 1, 2, 2, 4, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 4, 8, '', '', '2020-02-24', '', '2020-02-24', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(557, 'TRUQUE ALBARRACIN JOSE VICENTE', NULL, '6334905', NULL, '1984-05-03', NULL, 'M', NULL, 'viholba20@hotmail.com', '3217985577', '0000-00-00', 59, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1984', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(558, ' HANS', 'RODRIGUEZ TORO', '16829515', b'1', '2011-04-26', 'Lic. En Psicoterapia ', 'M', 'Cra 13a # 11-40', 'hanstertoro@hotmail.com', '3218372301', '1970-10-30', 52, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 1, 8, 14, 6, 6, 6, NULL, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(559, ' ROOSEVELT', 'RUIZ RENDON', '16855853', b'1', '2017-05-03', 'ABOGADO', 'M', 'Carrera 5 # 26-17 barrio Alférez Real', 'rorure5126@gmail.com', '3187690823', '1960-02-18', 63, NULL, 'Patología cardíaca vigilancia especial y pendiente recuperación reemplazo rodilla izquierda y reemplazo próximo año rodilla derecha.', 1, NULL, 'Cedula de Ciudadania', 1, 1, 12, 5, 6, 5, 26, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 27, NULL, '', '', NULL, '', NULL, 'null', '', '', '2017', 22, 4, 'COLOMBIA', 'CALI', NULL),
(560, 'LORENA', 'ZEA JIMENEZ', '66877680', b'1', '2015-12-17', 'Bachiller Academico', 'F', 'calle 2 No. 7a 52 corregimiento el cabuyal', 'lorenji4521@gmail.com', '3117660836', '1975-03-08', 48, 1, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 2, 1, 8, 1, 2, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 4, '', 'Decreto 1763', '2015-12-17', '35-01-27-043', '2015-11-18', 'Presencial', '', '', '2015', 22, 3, 'COLOMBIA', 'CALI', NULL),
(561, ' MIRIAM DEL SOCORRO', 'SAAVEDRA VILLEGAS', '31523764', b'1', '1992-07-29', 'ADMINISTRADORA DE EMPRESAS', 'F', 'cra 1b sur # 5a 37', 'ms112640@gmail.com', '3152754576', '1964-03-02', 59, NULL, 'HIPERTENSA ', 1, 4, 'Cedula de Ciudadania', 1, 7, 13, 1, 6, 4, 17, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 17, 24, '', '', NULL, '', NULL, 'Presencial', '', '', '1992', 22, 3, 'COLOMBIA', 'CALI', NULL),
(562, 'LUZ XIMENA', 'ZEA PANESSO', '31537179', b'1', '2012-02-01', 'TC Auxiliar de Enfermería y aux en atención primera infancia', 'F', 'cra 1 este N° 7 - 14 casa 5 callejón Codinter ', 'katerinzeita@hotmail.com', '3166236882', '1976-02-02', 47, 1, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 12, 5, 3, 5, 9, 1, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 9, 14, '', '', NULL, '', NULL, 'Presencial', '', 'views/archivos/fotos/Luz_Ximena_Zea.1662996033_631f4e419f8d4.jpeg', '2012', 22, 1, 'COLOMBIA', 'CALI', NULL),
(563, 'VARGAS OSPINA ALEXANDRA', NULL, '1112476707', NULL, '2017-11-01', NULL, 'F', NULL, '0', '0', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 5, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(564, 'SALAZAR OSPINA NICOLAS ALEXANDER', NULL, '1125618855', NULL, '2015-06-01', NULL, 'M', NULL, 'nico_alex1988@hotmail.com', '3154625944', '0000-00-00', 33, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 14, 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(565, 'ZULUAGA DELGADILLO ANA MARIA', NULL, '34606155', NULL, '2020-12-01', 'tecnologia en gestion comercial y de negocios', 'F', NULL, 'anyzuluaga@hotmail.com', '0', '0000-00-00', 44, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(566, 'ZUÑIGA ORTEGA RICARDO ARBEY', NULL, '10692318', NULL, '2020-10-04', 'contaduria publica', 'M', NULL, 'ricardoarbey2016@hotmail.com', '0', '0000-00-00', 53, NULL, NULL, 1, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 9, 1, NULL, 2, 4, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(567, ' ALEXANDER', 'SALAZAR RUIZ', '1143938265', b'1', '2021-01-16', 'Abogado', 'M', 'Ciudad country conjunto milano jamundi', 'alexsalazarruiz@gmail.com', '3108366129', '1991-03-07', 32, NULL, 'Antecedente de hernia discal, problemas en la columna y movilidad.', 1, 3, 'Cedula de Ciudadania', 1, 1, 8, 1, 7, 5, 27, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 27, NULL, 'SI', '', NULL, '', NULL, 'Alternancia', '', '', '2021', 22, 1, 'COLOMBIA', 'CALI', NULL),
(568, ' JOSE ALEJANDRO', 'SALDAÑA GONZALES', '6334169', b'1', '2011-12-15', '', 'M', 'Vereda el guabal ', 'jose-alejo85@hotmail.com', '3178371364', '1985-08-02', 37, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 1, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 30, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(569, 'JULIO CESAR', 'ZUÑIGA SARRIA ', '16825299', b'1', '2011-02-25', 'Trabajador Oficial Publico', 'M', 'Calle 12 No. T14-48 Apto. 301 3er piso ', 'jucezusa12@gmail.com', '3175307099', '1965-06-26', 57, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 3, 7, 14, 6, 4, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 32, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(570, ' ADRIANA', 'SALDAÑA GONZALEZ', '31447134', b'1', '2020-02-26', 'Administrador de Empresas', 'F', 'vereda el Guabal-Jamundí', 'asg1121@hotmail.com', '3152760112', '1980-11-21', 42, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 1, 13, 1, 6, 2, 3, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 3, 3, '', '30-16-0085', '2020-02-26', '35-01-0111', '2020-02-11', 'Presencial', '', 'views/archivos/fotos/Adriana_Saldaña_Gonzalez.1663614824_6328bf6869bfe.png', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(571, 'DIEGO', 'ZUÑIGA VIERA ', '16827245', b'1', '2018-11-27', 'Bachiller academico', 'M', 'Calle 8c#1-21barrioJuanPabloSegundo ', 'Dianytatiana1995@hotmail.com', '3188706444', '1968-07-10', 54, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 3, 14, 6, 2, 6, NULL, 1, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 29, NULL, '', '', NULL, '', NULL, 'null', '', '', '2018', 22, 4, 'COLOMBIA', 'CALI', NULL),
(572, 'DIANA PATRICIA', 'FLOREZ OSPINA ', '66976615', b'1', '2021-10-01', 'Administradora de empresas', 'F', 'Calle 32A #35-06 ', 'dianapaty24@gmail.com', '3152852788', '1976-12-24', 46, 1, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 1, 28, 1, 6, 5, 27, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 27, NULL, '', 'Decreto No 35-16-0132 ', '2021-10-01', '', '2021-09-13', 'Presencial', '', '', '2021', 22, 1, 'COLOMBIA', 'CALI', NULL),
(573, 'SANCHEZ CAÑAS JOHANA MARIA', NULL, '38613240', NULL, '2012-01-24', NULL, 'F', NULL, NULL, '3117221790', '0000-00-00', 122, NULL, NULL, NULL, NULL, '\"CEDULA DE CIUDADANIA\"', NULL, NULL, 4, 5, NULL, 2, 9, NULL, NULL, NULL, NULL, 'BUENA', NULL, NULL, NULL, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'COLOMBIA', 'CALI', NULL),
(574, ' JORGE EDUARDO', 'SALDAÑA', '6338532', b'1', '2011-12-15', 'Bachiller academico', 'M', 'Calle 5a No 1b bis 17 porral del jordan', 'malsagon@hotmail.com', '3137946684', '1966-02-11', 57, NULL, 'NINGUNA', 1, NULL, 'Cedula de Ciudadania', 2, 7, 14, 6, 2, 6, NULL, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 36, NULL, '', '', NULL, '', NULL, 'null', '', '', '2011', 22, 4, 'COLOMBIA', 'CALI', NULL),
(576, 'Ramiro', 'Angarita', '1042445587', b'0', '2022-05-24', 'desarrollador', 'M', 'calle falsa 123', 'msr.ramiro@gmail.com', '3445678', '2022-05-24', 0, NULL, '', 1, 7, 'Cedula de Ciudadania', 1, 3, 1, 1, 4, 1, 1, 1, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 1, 1, '', '', '2022-05-24', '', '2022-05-24', 'Presencial', '', NULL, '2022', 22, 1, 'COLOMBIA', 'CALI', NULL),
(577, 'ramiro', 'angarita', '1042465589', b'0', '2022-06-27', 'dev', 'M', 'callefalsa123', 'msr.ramiro@gmail.com', '3445678', '1993-04-30', 29, NULL, 'no', 1, 7, 'Cedula de Ciudadania', 1, 1, 3, 1, 4, 5, 13, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 13, 18, '', '145-A', '2022-06-27', 'AA2235-4', '2022-06-30', 'Presencial', '', '', '2022', 22, 4, 'COLOMBIA', 'CALI', NULL),
(579, 'PEDRO', 'NIEBLES', '104445678', b'0', '2022-06-27', 'DEVELOP', 'M', 'calle falsa123', 'pedro@gmail', '3445678', '1993-06-30', 28, NULL, 'NINGUNA', 1, 6, 'Cedula de Ciudadania', 2, 2, 2, 1, 1, 2, 1, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 1, 1, '', '01-A', '2022-06-27', 'AA454', '2022-06-27', 'Virtual', 'views/archivos/hojavida/_1656344716_62b9d08cba749-prueba.1656344716_62b9d08cba749.pdf', NULL, '2022', 22, 4, 'COLOMBIA', 'CALI', NULL),
(582, 'MARITZA', 'CORREA RODRIGUEZ', '38610553', b'1', '2022-09-01', 'Técnico en Administración de empresas', 'F', 'Cra 12A #3-81 MZ 3 Bl 5 apto 403 Los Naranjos', 'Maritza_correa@hotmail.es', '3122609069', '1983-01-07', 39, NULL, 'no', 1, 3, 'Cedula de Ciudadania', 1, 7, 10, 5, 3, 2, 3, 2, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '35-16-059', '2022-09-01', '35-01-27-179', '2022-08-29', 'Presencial', 'views/archivos/hojavida/Doc_posesión_MARITZA_CORREA.1662041890_6310bf2212995.pdf', 'views/archivos/fotos/WhatsApp_Image_2022-09-01_at_8.57.56_AM.1662041890_6310bf2212d2b.jpeg', '2022', 22, 1, 'COLOMBIA', 'CALI', NULL),
(583, 'MARGARITA MARIA', 'RESTREPO POLO', '31445247', b'1', '2022-09-01', 'Técnico laboral por competencias administrativas', 'F', 'Cra 13 #1h-12 Villa Monica', 'mechas1929@hotmail.com', '3165058497', '1980-01-13', 42, NULL, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 7, 6, 5, 3, 2, 3, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '35-16-060', '2022-09-01', '35-01-27-181', '2022-08-29', 'Virtual', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(585, 'VANESSA ANDREA', 'MINA CHARRY', '1112464685', b'1', '2022-09-02', 'Bachiller academico', 'F', 'Carrera 1B Norte #5-25', 'vanessamina149@gmail.com', '3207443429', '1987-09-30', 34, NULL, 'NINGUNA', 1, 8, 'Cedula de Ciudadania', 1, 7, 1, 5, 2, 2, 3, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '35-16-061', '2022-09-02', '35-01-27-182', '2022-08-29', 'Presencial', '', 'views/archivos/fotos/WhatsApp_Image_2022-09-02_at_3.40.04_PM.1662153309_6312725d8c686.jpeg', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(587, 'JUAN CAMILO', 'CARDONA PEREZ', '1144036163', b'1', '2022-09-13', 'Economista y negociador internacional', 'M', 'Calle 15 #121-66 Cali, Valle', 'Juancamilo0615@gmail.com', '3116460537', '1990-06-15', 32, NULL, 'no', 1, 3, 'Cedula de Ciudadania', 1, 8, 13, 4, 6, 3, 14, 2, 'PADRE', '0', 0, 'BUENA', b'0', '', NULL, 14, 19, '', '30-16-236', '2022-09-13', '35-01-27-194', '2022-09-12', 'Presencial', 'views/archivos/hojavida/Nombramiento_Juan_camilo_Cardona_Perez.1663280231_6323a46756ce1.pdf', '', '2022', 1, 4, 'COLOMBIA', 'CALI', NULL),
(588, 'Ivan', 'Majjul', '72176581', b'1', '2022-12-06', 'jdjdjdj', 'M', 'san Felipe', 'majju@gmail.com', '30073176551', '1971-08-09', 51, NULL, 'Ninguna', 1, 5, 'Cedula de Ciudadania', 1, 7, 9, 1, 4, 1, 8, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 8, 13, '', '424242', '1975-05-03', '242424', '1975-01-01', 'Presencial', '', '', '2022', 22, 3, NULL, NULL, NULL),
(590, 'djdjdj', 'djdjd', '5555', b'1', '2022-12-10', 'ddad', 'M', 'jdjdjdj', 'didsids@djdjd.co', '7373737', '2022-12-10', 0, NULL, '', 1, 2, 'Cedula de Ciudadania', 1, 5, 1, 1, 7, 1, 1, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 1, 1, 'ddada', '424', '2022-12-10', '42424', '2022-12-10', 'Presencial', '', '', '2022', 22, 1, 'Colombia', 'djdjdj', 'adadda'),
(591, 'Jairo', 'Pelaez', '242424', b'1', '2022-12-12', 'wfwfw', 'M', 'ddkdkdkkd', 'jdjdj@hhd.co', '77474774', '2022-12-12', 0, NULL, 'ffs', 1, 10, 'Cedula de Ciudadania', 2, 3, 7, 1, 3, 1, 5, 1, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 5, 10, '', '4424', '2022-12-05', '42424', '2022-12-12', 'Presencial', '', '', '2022', 50, 1, 'Argentina', 'Buenos Aires', 'la jagua'),
(593, 'Luz adiela', 'Alvarez salazar ', '1112462113', b'1', '2022-08-04', 'Profesional en deporte y actividad fisica', 'F', 'Carrera 3 # 4b16', 'adiela48kg@gmail.com', '3103890409', '1987-02-20', 36, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 21, 4, 7, 3, 13, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 13, 18, 'SI', '30-16-191', '2022-08-04', '35-01-27-160', NULL, 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(595, 'Jheferson', 'Basto Tovar', '1112460233', b'1', '2023-11-07', 'Ingeniero Biomédico ', 'M', 'CONDOMINIO CLUB LOS CEDROS CASA 8 MANZANA 1 VIA POTRERITO', 'jhetebt@gmail.com', '5530068', '1986-06-11', 36, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 50, 4, 6, 3, 13, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 13, 18, '', '30-16-280', '2023-11-07', '35-01-27-197', '2023-11-01', 'Presencial', '', '', '2023', 22, 3, 'COLOMBIA', 'CALI', NULL);
INSERT INTO `funcionarios` (`id_funcionario`, `nombre`, `apellidos`, `documento`, `is_actualizado`, `fecha_ingreso_nombra`, `profesion`, `genero`, `direccion`, `email`, `celular`, `fecha_nacimiento`, `edad`, `cantidad_hijos`, `condicion_medica`, `is_activo`, `id_sede`, `tipo_documento`, `id_etnia`, `id_rh`, `id_dependencia`, `id_tipovinculacion`, `id_niveleducativo`, `id_nivelfuncionario`, `id_codigo`, `id_victimaviolencia`, `madre_padre`, `cabeza_familia`, `is_viviendapropia`, `estado_vivienda`, `is_procesodisciplinario`, `numero_proceso_dis`, `fecha_proceso_dis`, `id_cargo`, `id_grado`, `posgrado`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `archivo`, `ano_ingreso`, `id_municipio`, `id_estadocivil`, `pais_nacimiento`, `ciudad_nacimiento`, `otro_municipio`) VALUES
(596, 'Rosa María', 'Vargas Gil', '310202195', b'1', '2011-01-21', 'Bachiller academico', 'F', 'Calle 13 # 15-15 barrio sachamate', 'rosamariavargasgil@gmail.com', '3235091403', '1964-05-04', 58, NULL, 'NINGUNA', 1, 9, 'Cedula de Ciudadania', 1, 7, 14, 6, 2, 6, 5, 2, 'MADRE', '0', 1, 'BUENA', b'0', '', NULL, 5, 10, '', '', NULL, '', NULL, 'Presencial', '', '', '2011', 22, 1, 'COLOMBIA', 'CALI', NULL),
(597, 'Funcionario', 'De Prueba', '1234567890', b'1', '2022-06-25', 'Profesión Funcionario', 'M', 'Dirección Funcionario de Prueba ', 'correoFuncionario@dePrueba.com.co', '3001234567', '2000-02-25', 23, NULL, '', 1, 6, 'Cedula de Ciudadania', 1, 5, 2, 7, 4, 2, 2, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 2, NULL, '', '12', '2023-02-25', '123123123123', '2023-02-25', 'Presencial', '', '', '2022', 22, 1, 'Colombia', 'Colombia', NULL),
(598, 'ELIANA PATRICIA', 'ESCOBAR CANO', '31535657', b'1', '2022-07-21', 'SECRETARIADO GERENCIAL CONTABLE', 'F', 'Calle 6 No. 1AN - 17', 'elianaescobar2910@gmail.com', '3166268796', '1975-10-29', 47, NULL, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 3, 28, 5, 3, 5, 5, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 5, 10, '', '35-16-040 DE 20200', '2022-07-21', '', '2022-01-24', 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(603, 'Maria alejandra', 'Alvarez delgado ', '38667530', b'1', '2022-07-13', 'Transito  y transporte', 'F', 'Cra 7 26 24 alférez real ', 'Superaleja25@hotmail.com', '3146189074', '1982-11-01', 40, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 1, NULL, 5, 3, 5, 19, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '', '2022-07-13', '35-01-27-133', NULL, 'Presencial', '', '', '2022', 22, 1, 'COLOMBIA', 'CALI', NULL),
(604, 'Jaime Augusto ', 'Herrera Ramirez ', '6335153', b'1', '2022-06-07', 'Técnico en tránsito y transporte ', 'M', 'Calle 19 9a-16', 'jaimeherrera586@gmail.com', '3023564525', '1986-02-01', 37, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 8, 29, 5, 3, 5, 19, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 19, 28, '', '35-16-030', '2022-06-07', '35-01-27-111', '2022-06-06', 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(605, 'Javier', 'Solis Martínez', '34514147', b'1', '2020-07-07', 'Ingeniero Industrial', 'M', 'Cra 4A sur # 10 A 65', 'javier.solis@correounivalle.edu.co', '3117974798', '1990-07-15', 32, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 2, 7, NULL, 1, 6, 4, 17, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 17, 26, '', '', '2020-07-07', '', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(606, 'Prueba', 'Familia', '00101010101', b'1', '2023-03-03', 'fsdfsdf', 'M', 'fsfsdfsd', 'sfdfsdf@csfdf.s', '324234234234', '1956-03-03', 67, NULL, 'dsd', 1, 7, 'Cedula de Ciudadania', 1, 1, 16, 8, 2, 5, 6, 1, 'MADRE', '0', 1, 'BUENA', b'0', '', NULL, 6, NULL, '', 'rewrwer', NULL, 'rwer', NULL, 'Virtual', '', '', '2023', 50, 2, 'Colombia', 'sdf', 'dsdsdf'),
(607, 'Trivia', 'Spotify', '312312', b'0', '2023-03-16', '', 'M', '42343243', 'ferm4324en1305@gmail.com', '432432432', '2023-03-01', 0, NULL, '34', 1, 10, 'Cedula de Ciudadania', 2, 2, NULL, 2, 1, 2, 5, 1, 'MADRE', '0', 0, 'BUENA', b'0', '', NULL, 5, 10, '', '2313321', '2023-03-03', 'adsdas', '2023-03-03', 'Presencial', '', '', '2023', 22, 2, 'Colombia', '2313213', NULL),
(608, 'vsdfsdfsd', 'fsdfdsfdsfsf', '423423432', b'0', '2023-03-05', 'fsadf', 'M', 'fsdfasdf', 'fer213313c33112332az01231407@gmail.com', '321321321', '2023-03-05', 0, NULL, '', 1, 2, 'Cedula de Ciudadania', 2, 2, 6, 8, 1, 1, NULL, 1, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 5, NULL, '', 'dasd', '2023-03-05', 'daASAD', '2023-03-05', 'Presencial', '', '', '2023', 26, 1, 'fsdfsdfdsf', 'fsfsdfsdfds', NULL),
(610, 'vsdfsdfsd', 'fsdfdsfdsfsf', '42342342', b'0', '2023-03-05', 'fsadf', 'M', 'fsdfasdf', 'fer213313c33112332az01231407@gmail.com', '321321321', '2023-03-05', 0, NULL, '', 1, 2, 'Cedula de Ciudadania', 2, 2, 6, 8, 1, 1, NULL, 1, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 5, NULL, '', 'dasd', '2023-03-05', 'daASAD', '2023-03-05', 'Presencial', '', '', '2023', 26, 1, 'fsdfsdfdsf', 'fsfsdfsdfds', NULL),
(611, 'Katerine ', 'Lucumí Velasco', '1112485373', b'1', '2022-07-13', 'Administración de empresas', 'F', '', 'katerinevelasco95@gmail.com', '3206301335', '1995-07-11', 27, NULL, 'Arritmia leve, hemoglobina baja', 1, 3, 'Cedula de Ciudadania', 1, 7, NULL, 4, 6, 2, 14, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 14, 19, '', '', NULL, '', NULL, 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(612, 'Otilia ', 'Olaya Jiménez ', '31522752', b'1', '2022-01-31', 'Directivo Docente ', 'F', 'Calle 14 # 19-78', 'otiliaolaya@gmail.com', '3217165230', '1962-04-22', 60, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 14, 4, 8, 4, 11, 2, 'MADRE', '1', 2, 'BUENA', b'0', '', NULL, 11, NULL, 'SI', '', '2020-01-13', '', NULL, 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(613, 'CARLOS ROBERTO', 'ARAGON GARCIA', '1112464021', b'1', '2019-01-14', 'Bachiller academico', 'M', 'cra 18 No 20-36', 'carlitos-ara@hotmail.com', '3165705210', '1978-09-16', 44, NULL, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 1, 1, NULL, 6, 2, 6, NULL, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 7, NULL, '', '', NULL, '', NULL, 'Presencial', '', '', '2019', 22, 1, 'COLOMBIA', 'CALI', NULL),
(614, 'Eucardo', 'Mancilla Mancilla', '10491810', b'1', '2022-10-21', 'ABOGADA', 'M', 'Calle 94 # 26 G4-04', 'chakaa2002@gmail.com', '3176415563', '1976-12-28', 46, NULL, 'NINGUNA', 1, 9, 'Cedula de Ciudadania', 1, 7, 14, 1, 6, 5, 19, 2, 'PADRE', '0', 1, 'BUENA', b'0', '', NULL, 19, 28, '', '', NULL, '', NULL, 'Presencial', '', '', '2022', 22, 4, 'COLOMBIA', 'CALI', NULL),
(615, 'Liliana Paola', 'Martinez Gómez ', '1112473960', b'1', '2022-10-28', 'Trabajo social', 'F', 'Carrera 5 sur #10a-28 portal de Jamundi ', 'Paolamartinezgomez16@gmail.com', '3157625208', '1991-10-16', 31, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 7, 14, 4, 6, 3, 15, 2, 'NO', '0', 1, 'BUENA', b'0', '', NULL, 14, 20, '', '35-16-080', NULL, '', NULL, 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(616, 'Francisco Antonio', 'Rodriguez Pozu', '16831270', b'1', '2022-10-28', 'Oficios varios', 'M', 'Corregimiento San Isidro ', 'franciscoantonio1220@hotmail.com', '3173233937', '1970-06-03', 52, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 2, 7, 14, 5, 2, 2, 5, 2, 'PADRE', '0', 1, 'BUENA', b'0', '', NULL, 5, 10, '', '', NULL, '', NULL, 'Presencial', '', '', '2022', 22, 4, 'COLOMBIA', 'CALI', NULL),
(617, 'Leyla Marcela ', 'Lozano Tovar ', '1106393797', b'1', '2020-03-06', 'Topógrafo ', 'F', 'Calle 9 # 9-35 piso 2 ', 'leymar04@hotmail.com', '3105987596', '1987-11-04', 35, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 14, 1, 4, 5, 23, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 23, 33, '', 'Decreto 30-16-265', '2022-10-28', '35-01-223', NULL, 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(618, 'Paola Andrea ', 'Valencia Parra', '1143840969', b'1', '1998-01-02', 'ADMINISTRADOR- GESTION DE PROYECTOS', 'F', 'Calle 12 sur # 10 E- 57 apto 502 torre F', 'Paovalencia92@hotmail.com', '3105987596', '2022-01-22', 1, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 14, 1, 7, 2, 9, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 9, 14, 'NO', '', NULL, '', NULL, 'Presencial', '', '', '1998', 22, 1, 'COLOMBIA', 'CALI', NULL),
(619, 'Patricia', 'Lañas Romero', '31988306', b'1', '2020-01-01', 'ECONOMISTA ', 'F', 'Calle 10 norte #10-12, apto 102', 'Patrilanas@gmail.com', '3164447076', '1969-03-02', 54, NULL, 'Asmatica', 1, 6, 'Cedula de Ciudadania', 1, 3, 5, 4, 6, 4, NULL, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 11, NULL, 'SI', '', NULL, '', NULL, 'Presencial', '', '', '2020', 22, 2, 'COLOMBIA', 'CALI', NULL),
(620, 'Cristian Camilo', 'Gonzalez  Florez', '1112473061', b'1', '2011-12-15', 'Bachiller academico', 'M', 'Calle 14 # 19-78 Sachamate', 'kmilogonzalez52124@gmail.com', '3173151489', '1991-06-24', 31, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 30, 6, 2, 6, NULL, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 4, NULL, '', '30-16-263', '2022-10-28', '35-01-224', NULL, 'Presencial', '', '', '2011', 22, 3, 'COLOMBIA', 'CALI', NULL),
(621, 'GERMAN ', 'CIFUENTES VILLOTA', '6104987', b'1', '2022-01-13', 'FINANZAS Y NEGOCIOS INTERNACIONALES', 'M', 'Cra 85 C No. 14 A-116 ', 'gecivi@hotmail.com', '3126280581', '1979-12-04', 43, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 2, 7, 29, 4, 7, 3, 14, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 14, 19, 'SI', '30-16-05', '2022-01-13', '35-01-015', '2022-01-13', 'Presencial', '', '', '2022', 1, 4, 'COLOMBIA', 'CALI', NULL),
(622, 'DIEGO FERNANDO ', 'TRUJILLO RODALLEGA', '6334403', b'1', '2021-10-15', 'MAGISTER EN GESTION PUBLICA', 'M', 'cra 2a#10-03 casa 10d', 'diego.cuto@hotmail.com', '3206494682', '1985-11-25', 37, NULL, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 2, 7, 31, 4, 8, 3, 11, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 11, 16, 'SI', '30-16-132', '2021-10-15', '35-01-233', '0021-10-11', 'Presencial', '', '', '2021', 22, 3, 'COLOMBIA', 'CALI', NULL),
(624, 'RICARDO ARBEY', 'ZUÑIGA ORTEGA', '106923181', b'1', '2020-11-04', 'CONTADOR PUBLICO', 'M', 'CL 26 A # 12 B 24 B/TUCAN', 'ricardoarbey2016@hotmail.com', '3207716733', '1969-01-27', 54, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 1, 8, 1, 6, 2, 3, 2, 'NO', '0', 1, 'MAL', b'0', '', NULL, 3, 5, '', ' DECRETO 36-16-011 ', '2020-11-04', ' 35-01 - 034', '2020-07-13', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', 'Santander de Quilichao'),
(625, 'hugo dario', 'guerrero otero', '10751572', b'1', '2020-03-13', 'administrador', 'M', 'calle 17 a 17-40', 'hdgotero@gmail.com', '3058182722', '1966-11-09', 56, NULL, 'perdida del nervio  séptimo par craneal', 1, 3, 'Cedula de Ciudadania', 1, 7, 13, 1, 6, 5, 23, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 23, 34, '', '', '2020-03-13', '', '2020-03-13', 'Presencial', '', '', '2020', 22, 1, 'COLOMBIA', 'CALI', NULL),
(627, 'jose ider', 'balanta mezu', '16831017', b'1', '2022-06-13', 'Bachiller academico', 'M', 'Corregimiento de Quinamayo valle', 'joider16@hotmail.com', '3205015655', '1972-09-16', 50, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 2, 3, 8, 5, 2, 2, 6, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 6, 11, '', '30-16-152- 2022', '2022-06-13', '35-01-115', '2022-06-02', 'Presencial', '', '', '2022', 22, 4, 'COLOMBIA', 'CALI', NULL),
(628, 'rodrigo', 'rodriguez manpotes', '16833865', b'1', '2013-01-15', 'EMPLEADO', 'M', 'cra 1 b sur No. 6a-31', 'rodrirodri44@outlook.com', '3168002581', '1972-12-03', 50, NULL, 'hipertenso', 1, 4, 'Cedula de Ciudadania', 2, 7, 14, 6, 2, 2, 4, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 4, 7, '', '', NULL, '', NULL, 'Presencial', '', '', '2013', 22, 1, 'COLOMBIA', 'CALI', NULL),
(629, 'Nancy', 'Olaya Reyes ', '31529566', b'1', '1994-08-12', 'Auxiliar técnico contable ', 'F', 'Carrera 15 No 22-41 barrio la Pradera ', 'onesimovillamil@hotmail.com', '3172498728', '1970-09-29', 52, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 8, 7, 1, 3, 2, 10, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 10, 15, '', '', NULL, '', NULL, 'Presencial', '', '', '1994', 22, 1, 'COLOMBIA', 'CALI', NULL),
(630, 'Lizeth Vanessa', 'Mosquera Rodriguez', '1143834138', b'1', '2022-08-01', 'ABOGADA', 'F', 'Carrera 96 # 48-53 torre 5 apto 203', 'lizvamoro@gmail.com', '3132380689', '1990-10-25', 32, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 7, 11, 5, 7, 4, 17, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 17, 24, 'SI', '30-16-44', '2022-08-01', '35-01-150', '2022-07-25', 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(635, 'Sergio Enrique ', 'Gutiérrez Serna', '1130618779', b'1', '2022-04-05', 'Ingeniero Agrícola', 'M', 'Carrera 78A # 1B-46', 'sergio.gutierrezs@hotmail.com', '3165360827', '1988-06-15', 34, NULL, 'NINGUNA', 1, 11, 'Cedula de Ciudadania', 1, 7, 1, 1, 6, 5, 23, 2, 'PADRE', '1', 2, 'BUENA', b'0', '', NULL, 23, 33, '', '31-16-016', '2022-04-05', '35-01-084', '2022-04-04', 'Presencial', '', '', '2022', 22, 1, 'COLOMBIA', 'CALI', NULL),
(636, 'KELLY JHOANA ', 'PERDOMO BUITRAGO', '1126600942', b'1', '2022-07-08', 'TRABAJADORA SOCIAL ', 'F', 'cr49#23-04', 'fotosgaelkelly@gmail.com', '3014291767', '1993-03-23', 30, NULL, 'NINGUNA', 1, 8, 'Cedula de Ciudadania', 1, 1, 5, 4, 6, 3, 11, 2, 'MADRE', '1', 1, 'BUENA', b'0', '', NULL, 11, 16, '', '30-16-179', '2022-07-08', '35-01-27-126', '2022-07-08', 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(637, 'MAIRA ALEJANDRA', 'SANCHEZ BOLAÑOS', '1112464841', b'1', '2022-01-17', 'ABOGADA', 'F', 'carrera 22 # 10-23', 'alejandrasanchezb6@gmail.com', '3046420655', '1988-06-01', 34, NULL, 'NINGUNA', 1, 5, 'Cedula de Ciudadania', 1, 7, 28, 4, 7, 3, 11, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 11, 16, 'SI', '30-16-008', '2022-01-17', '35-01-27-017', '2022-01-17', 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(638, 'claudia marcela', 'carvajal jaramillo', '1094909636', b'1', '2022-07-13', 'ABOGADA', 'F', 'carrera 19 #8-109 torre 2 apto 501', 'cmcdesarrollo@gmail.com', '3177478088', '1989-12-29', 33, NULL, 'transtorno afectivo bipolar', 1, 8, 'Cedula de Ciudadania', 1, 7, 6, 4, 7, 3, 13, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 13, 18, 'SI', 'decreto 30-16-184', '2022-07-13', '35-01-27-137', '2022-06-12', 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(639, 'Mauricio', 'Mafla  Sandoval', '1130620574', b'1', '2022-08-11', 'Ingeniero en Sistemas', 'M', 'Calle 32 #19-27 Torre 9 Apto 504', 'mauricio880904@gmail.com', '3163659545', '1988-09-04', 34, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 8, 5, 6, 4, 17, 2, 'NO', '0', 2, 'BUENA', b'0', '', NULL, 17, 26, '', '35-16-58', NULL, '', '2022-08-11', 'Presencial', '', '', '2022', 22, 3, 'COLOMBIA', 'CALI', NULL),
(640, 'Synthia', 'Vivas Manrrique', '66007492', b'1', '2004-06-28', 'Contaduria', 'F', 'Cra 20a N° 8sur-24', 'synthi12@hotmail.com', '3105697096', '1977-09-30', 45, NULL, 'NINGUNA', 1, 1, 'Cedula de Ciudadania', 1, 8, 8, 5, 3, 5, 24, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 24, 35, '', '', NULL, '', NULL, 'Presencial', '', '', '2004', 22, 2, 'COLOMBIA', 'CALI', NULL),
(641, 'Sandra viviana', 'Salazar sanchez', '38667917', b'1', '2022-07-22', 'Empleada publica', 'F', 'Calle6 #6c_77', 'Viviana.salazarsanchez@gmail.com', '3184070010', '1983-04-01', 39, NULL, 'NINGUNA', 1, 3, 'Cedula de Ciudadania', 1, 3, 10, 5, 2, 2, 5, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 5, 10, '', '30_16_0267 ', '2022-07-22', '35_01_27_149', '2018-07-10', 'Presencial', '', '', '2022', 22, 3, NULL, NULL, NULL),
(642, 'Resfa Nasmiller ', 'Grandez Florez ', '34653789', b'1', '2020-04-27', 'Secretaria Ejecutiva ', 'F', 'Cll 15d # 8-27', 'resfa229@hotmail.com', '3207851721', '1972-02-13', 51, NULL, 'NINGUNA', 1, 4, 'Cedula de Ciudadania', 1, 1, 10, 1, 3, 2, 5, 2, 'MADRE', '1', 0, 'BUENA', b'0', '', NULL, 5, 10, '', '', '2020-04-27', '35-01-0214', '2020-04-27', 'Presencial', '', '', '2020', 22, 3, 'COLOMBIA', 'CALI', NULL),
(643, 'CAROLINA', 'MARMOLEJO CASTRO', '31448331', b'1', '2023-02-10', '', 'F', 'Calle 8 # 14-62 BARRIO EL ROSARIO', 'kritomc81@hotmail.com', '3167488500', '1981-02-13', 42, NULL, '', 1, 4, 'Cedula de Ciudadania', 1, 7, 11, 5, 2, 2, 3, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 3, 6, '', '35-16-007', '2023-02-10', '35-01-27-037', '2023-02-09', 'Presencial', '', '', '2023', 22, 4, 'Colombia', 'JAMUNDI', NULL),
(644, 'QUIJANO CERQUERA JESUS MARIA', '', '16835841', b'1', '2023-03-01', 'Administración Pública', 'M', 'CALLE 7A  # 1A - 31 LAS ACASIAS', 'jesusmquijano@hotmail.com', '3164269166', '1976-11-07', 46, NULL, '', 1, 3, 'Cedula de Ciudadania', 2, 1, 9, 5, 6, 4, 17, 2, 'PADRE', '1', 0, 'BUENA', b'0', '', NULL, 17, 24, '', '35-16-10', '2023-03-01', '', '2023-02-23', 'Presencial', '', '', '2023', 22, 1, 'Colombia', NULL, NULL),
(646, 'ANGELA MARIA', 'CALERO MANCO', '66661351', b'1', '2023-03-03', 'INGENIERA INDUSTRIAL', 'F', 'VIA CALI-JAMUNDI EL CASTILLO CEDROS CASA 17', 'angelamaria131@hotmail.com', '3216484047', '1985-01-28', 38, NULL, '', 1, 9, 'Cedula de Ciudadania', 1, 4, 24, 4, 10, 3, 13, 2, 'MADRE', '0', 2, 'null', b'0', '', NULL, 13, 18, '', '30-16-072', '2023-03-03', '35-01-27-54', '2023-03-03', 'Presencial', '', '', '2023', 22, 1, 'COLOMBIA', 'EL CERRITO', NULL),
(647, 'MONICA PATRICIA', 'ROJAS RAMIREZ', '31528922', b'0', '2023-04-03', 'CONTADOR PUBLICO', 'F', 'CRA 9 No. 6-68 B/LA ESMERALDA', 'monik_filigrana@hotmail.com', '3104583753', '1970-08-27', 52, NULL, '', 1, 4, 'Cedula de Ciudadania', 1, 7, 15, 1, 7, 5, 23, 2, 'NO', '1', 2, 'BUENA', b'0', '', NULL, 23, 34, 'ESPECIALISTA EN AUDITORIA INTERNA', '162', '2023-04-03', '35012774', '2023-03-21', 'Presencial', '', '', '2023', 22, 1, 'Colombia', 'CALI', NULL),
(648, 'JORGE ARMANDO', 'BARONA FLOR', '1112468575', b'1', '2023-11-09', 'ADMINISTRACION DE NEGOCIOS INTERNACIONALES', 'M', 'CALLE 2 #19-250 CASA 55 HACIENDA EL PINO', 'JBARONA.JAMUNDI@GMAIL.COM', '3207344854', '1989-07-27', 34, NULL, 'NO', 1, 4, 'Cedula de Ciudadania', 1, 7, 11, 1, 7, 5, 23, 2, 'PADRE', '1', 1, 'BUENA', b'0', '', NULL, 23, 32, 'ESP. DESARROLLO HUMANO Y ORGANIZACIONAL', 'DECRETO No232', '2023-11-09', '35-01-27-200', '2023-11-08', 'Presencial', '', '', '2023', 22, 4, 'COLOMBIA', 'CALI', NULL),
(649, 'ISABELA', 'MEJIA VALENCIA', '1006235667', b'1', '2023-12-01', 'TRABAJADORA SOCIAL', 'F', 'CALLE 13 #9-49 BARRIO LIBERTADORES', 'ISABELAMEJIAVALENCIA@HOTMAIL.COM', '3154459062', '2000-09-15', 23, NULL, 'NO', 1, 8, 'Cedula de Ciudadania', 2, 7, 20, 4, 6, 3, 13, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 13, 18, '', '30-16-299', '2023-12-01', '35-01-27-210', '2023-11-29', 'Presencial', '', '', '2023', 22, 3, 'COLOMBIA', 'JAMUNDI', NULL),
(650, 'WENDY MARCELA', 'VILLEGAS CARABALI', '1112495801', b'1', '2023-11-24', 'TRABAJADORA SOCIAL', 'F', 'CORREGIMIENTO VILLA PAZ', 'WVILLEGAS992@GMAIL.COM', '3192175111', '1999-01-16', 24, NULL, 'NO', 1, 11, 'Cedula de Ciudadania', 2, 7, 24, 4, 6, 3, 13, 2, 'NO', '0', 0, 'BUENA', b'0', '', NULL, 13, 18, '', '30-16-292', '2023-11-24', '35-01-27-206', '2023-11-21', 'Presencial', '', '', '2023', 22, 3, 'COLOMBIA', 'JAMUNDI', NULL),
(651, 'CARLOS ALBERTO', 'RAMOS BOLAÑOS', '6334418', b'1', '2023-02-06', 'FORMULACIÓN DE PROYECTOS', 'M', 'Cra 8 # 15 - 45 B/ Libertadores', 'carlos.ramosb02@gmail.com', '3045324181', '1985-08-03', 38, NULL, '', 1, 4, 'Cedula de Ciudadania', 1, 7, 10, 5, 4, 2, 3, 2, 'NO', '1', 2, 'BUENA', b'0', '', NULL, 3, 6, '', 'DECRETO No. 35-16-006', '2023-02-06', '35-01-27-030', '2023-02-01', 'Presencial', '', '', '2023', 22, 4, 'COLOMBIA', 'JAMUNDI', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id_grado` int(11) NOT NULL,
  `grado` varchar(60) NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `cargo` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incapacidad`
--

CREATE TABLE `incapacidad` (
  `id_incapacidad` int(11) NOT NULL,
  `dias` int(11) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `diagnostico` text NOT NULL,
  `tipo_incapacidad` varchar(45) NOT NULL,
  `archivo_incapacidad` text NOT NULL,
  `id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `incapacidad`
--

INSERT INTO `incapacidad` (`id_incapacidad`, `dias`, `fecha_ini`, `fecha_fin`, `diagnostico`, `tipo_incapacidad`, `archivo_incapacidad`, `id_funcionario`) VALUES
(1, 3, '2022-06-14', '2022-06-16', 'Gripe', 'EG', 'views/archivos/incapacidad/No_Aplica.1655260880_62a946d084cdb.pdf', 28),
(2, 3, '2022-06-15', '2022-06-17', 'Gripe', 'EG', 'views/archivos/incapacidad/RAMIRO_ANTONIO_ANGARITA_NIEBLES.1655353748_62aab19400741.pdf', 28),
(3, 3, '2022-06-15', '2022-06-17', 'Gripe', 'EG', 'views/archivos/incapacidad/RAMIRO_ANTONIO_ANGARITA_NIEBLES.1655353845_62aab1f51f4ac.pdf', 28),
(4, 3, '2022-06-15', '2022-06-17', 'Gripe', 'SOAT', '', 28),
(5, 3, '2022-06-21', '2022-06-23', 'Gripe', 'SOAT', '', 28),
(6, 3, '2022-06-01', '2022-06-03', 'Gripe', 'EG', '', 28),
(7, 3, '2023-02-21', '2023-02-23', 'Gripe', 'EG', 'views/archivos/incapacidad/No_Aplica.1677603612_63fe331c4dd74.pdf', 2),
(8, 3, '2023-02-27', '2023-03-01', 'cefalea', 'EG', 'views/archivos/incapacidad/certificado-afiliacion-beneficiarios.1681339488_64373460441a9.pdf', 2),
(11, 2, '2023-03-01', '2023-03-02', 'cefalea', 'EG', 'views/archivos/incapacidad/ConsultaPagosRealizados_(7).1681339811_643735a3520d1.pdf', 406),
(12, 10, '2023-02-06', '2023-02-16', 'cefalea', 'EG', 'views/archivos/incapacidad/AMBIENTE_-_JESSICA_VARGAS_(1).1681339943_64373627881fd.pdf', 406),
(13, 2, '2024-02-25', '2024-02-29', 'Migraña', 'EG', 'views/archivos/incapacidad/DeclaracionJuramentada_1114883652.1710885863_65fa0be744b09.pdf', 406),
(14, 5, '2024-02-25', '2024-02-29', 'Migraña', 'EG', 'views/archivos/incapacidad/DeclaracionJuramentada_1114883652.1710885913_65fa0c1969eaf.pdf', 406);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion`
--

CREATE TABLE `inspeccion` (
  `id_inspeccion` int(11) NOT NULL,
  `id_dependencia` int(11) NOT NULL,
  `identificacion` varchar(45) DEFAULT NULL,
  `tipo_inspeccion` int(10) DEFAULT NULL,
  `responsable` varchar(255) DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `modalidad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `sede` int(11) NOT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `tiempo_gen` datetime DEFAULT current_timestamp(),
  `fecha_inicio_suspencion` date DEFAULT NULL,
  `fecha_final_suspencion` date DEFAULT NULL,
  `fecha_` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion`
--

INSERT INTO `inspeccion` (`id_inspeccion`, `id_dependencia`, `identificacion`, `tipo_inspeccion`, `responsable`, `fecha_ini`, `fecha_fin`, `modalidad`, `estado`, `archivo`, `motivo`, `observacion`, `descripcion`, `sede`, `consecutivo`, `tiempo_gen`, `fecha_inicio_suspencion`, `fecha_final_suspencion`, `fecha_`) VALUES
(1, 2, '2023-1', 7, 'dsdsad asdsad', '2023-01-16', '2023-01-16', 'PRESENCIAL', '', '', 'dasdasdsad', 'trazabiliadad de prueba', 'dasdasdas', 5, 1, '2023-01-16 16:35:46', '2023-01-12', '2023-01-05', NULL),
(2, 7, '2023-2', 2, 'sdasdasdasd', '2023-01-20', '2023-01-20', 'PRESENCIAL', 'REALIZADO', '', '', '', '', 3, 2, '2023-01-20 19:15:38', NULL, NULL, NULL),
(3, 1, '2023-3', 12, 'fdsfsdfdfsd', '2023-01-20', '2023-01-18', 'PRESENCIAL', 'SUSPENDIDO', '', '', '', 'fdsfsdfsdf', 6, 3, '2023-01-20 22:38:36', '2023-01-22', '2023-01-22', NULL),
(4, 46, '2023-4', 1, 'SSST', '2023-03-07', '2023-03-07', 'PRESENCIAL', 'REALIZADO', '', '', 'Esto es una prueba', '', 6, 4, '2023-03-07 19:40:03', NULL, NULL, NULL),
(5, 62, '2023-5', 1, 'Alcalde o su delegado', '2023-12-01', '2023-12-31', 'MIXTA', NULL, '', NULL, NULL, '', 4, 5, '2023-04-11 20:38:03', NULL, NULL, NULL),
(6, 62, '2023-6', 2, 'Profesional Area SST', '2023-06-01', '2023-06-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 4, 6, '2023-04-11 20:42:00', NULL, NULL, NULL),
(7, 62, '2023-7', 3, 'Equipo SST', '2023-03-01', '2023-03-31', 'PRESENCIAL', 'REALIZADO', 'C:\\fakepath\\28-06-2023 INSPECCION EPP- CUADRILLAS.pdf', '', 'Se realizo inspección de EPP a los trabajadores oficiales de cuadrillas. ', '', 11, 7, '2023-04-11 21:08:51', NULL, NULL, NULL),
(8, 62, '2023-8', 3, 'Equipo SST', '2023-06-01', '2023-06-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 8, '2023-04-11 21:09:40', NULL, NULL, NULL),
(9, 62, '2023-9', 3, 'Equipo SST', '2023-09-01', '2023-09-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 9, '2023-04-11 21:10:33', NULL, NULL, NULL),
(10, 62, '2023-10', 3, 'Equipo SST', '2023-12-01', '2023-12-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 10, '2023-04-11 21:11:24', NULL, NULL, NULL),
(11, 62, '2023-11', 5, 'Equipo SST, brigada, copasst', '2023-03-01', '2023-03-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 11, '2023-04-11 21:13:09', NULL, NULL, NULL),
(12, 62, '2023-12', 5, 'Equipo SST, brigada, copasst', '2023-06-01', '2023-06-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 12, '2023-04-11 21:13:57', NULL, NULL, NULL),
(13, 62, '2023-13', 5, 'Equipo SST, brigada, copasst', '2023-09-01', '2023-09-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 13, '2023-04-11 21:14:40', NULL, NULL, NULL),
(14, 62, '2023-14', 5, 'Equipo SST, brigada, copasst', '2023-12-01', '2023-12-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 14, '2023-04-11 21:15:20', NULL, NULL, NULL),
(15, 62, '2023-15', 6, 'Equipo SST, brigada, copasst', '2023-04-01', '2023-04-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 15, '2023-04-11 21:16:23', NULL, NULL, NULL),
(16, 62, '2023-16', 6, 'Equipo SST, brigada, copasst', '2023-08-01', '2023-08-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 16, '2023-04-11 21:17:40', NULL, NULL, NULL),
(17, 62, '2023-17', 6, 'Equipo SST, brigada, copasst', '2023-12-01', '2023-12-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 17, '2023-04-11 21:24:42', NULL, NULL, NULL),
(18, 62, '2023-18', 7, 'Equipo SST, brigada, copasst', '2023-04-01', '2023-04-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 18, '2023-04-11 21:25:27', NULL, NULL, NULL),
(19, 62, '2023-19', 7, 'Equipo SST, brigada, copasst', '2023-08-01', '2023-08-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 19, '2023-04-11 21:26:19', NULL, NULL, NULL),
(20, 62, '2023-20', 7, 'Equipo SST, brigada, copasst', '2023-12-01', '2023-12-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 20, '2023-04-11 21:26:59', NULL, NULL, NULL),
(21, 62, '2023-21', 8, 'Equipo SST', '2023-04-01', '2023-04-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 21, '2023-04-11 21:29:45', NULL, NULL, NULL),
(22, 62, '2023-22', 8, 'Equipo SST', '2023-08-01', '2023-08-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 22, '2023-04-11 21:30:25', NULL, NULL, NULL),
(23, 62, '2023-23', 8, 'Equipo SST', '2023-12-01', '2023-12-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 23, '2023-04-11 21:32:10', NULL, NULL, NULL),
(24, 62, '2023-24', 9, 'Equipo SST', '2023-03-01', '2023-03-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 24, '2023-04-11 21:33:45', NULL, NULL, NULL),
(25, 62, '2023-25', 4, 'Equipo SST', '2023-06-01', '2023-06-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 25, '2023-04-11 21:34:41', NULL, NULL, NULL),
(26, 62, '2023-26', 9, 'Equipo SST', '2023-09-01', '2023-09-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 26, '2023-04-11 21:35:26', NULL, NULL, NULL),
(27, 62, '2023-27', 9, 'Equipo SST', '2023-12-01', '2023-12-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 27, '2023-04-11 21:36:07', NULL, NULL, NULL),
(28, 62, '2023-28', 10, 'Equipo SST con apoyo copasst', '2023-04-01', '2023-04-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 28, '2023-04-11 22:17:05', NULL, NULL, NULL),
(29, 62, '2023-29', 10, 'Equipo SST con apoyo del Copasst', '2023-08-01', '2023-08-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 29, '2023-04-11 22:18:05', NULL, NULL, NULL),
(30, 62, '2023-30', 10, 'Equipo SST con apoyo del Copasst', '2023-12-01', '2023-12-31', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 30, '2023-04-11 22:18:37', NULL, NULL, NULL),
(31, 62, '2023-31', 11, 'Equipo SST con apoyo del Copasst', '2023-06-01', '2023-06-30', 'PRESENCIAL', NULL, '', NULL, NULL, '', 11, 31, '2023-04-11 22:19:43', NULL, NULL, NULL),
(32, 62, '2023-32', 12, 'Equipo SST', '2023-05-01', '2023-05-30', 'PRESENCIAL', NULL, '', NULL, NULL, 'Inspección uso adecuado de puntos ecológicos', 11, 32, '2023-04-11 22:24:07', NULL, NULL, NULL),
(33, 62, '2023-33', 12, 'Equipo SST', '2023-10-01', '2023-10-30', 'PRESENCIAL', NULL, '', NULL, NULL, 'Inspección uso adecuado de puntos ecológicos', 11, 33, '2023-04-11 22:25:27', NULL, NULL, NULL),
(34, 62, '2023-34', 12, 'Equipo SST', '2023-11-01', '2023-11-30', 'PRESENCIAL', NULL, '', NULL, NULL, 'Inspección señalizacion según  riesgos existentes en el lugar de trabajo', 11, 34, '2023-04-11 22:26:43', NULL, NULL, NULL),
(35, 62, '2023-35', 12, 'Equipo SST', '2023-04-01', '2023-04-30', 'PRESENCIAL', NULL, '', NULL, NULL, 'Inspección de equipos para trabajo en alturas (Andamios, escaleras  fijas )', 11, 35, '2023-04-11 22:28:09', NULL, NULL, NULL),
(36, 62, '2023-36', 12, 'Equipo SST', '2023-08-01', '2023-08-31', 'PRESENCIAL', NULL, '', NULL, NULL, 'Inspección de equipos para trabajo en alturas (Andamios, escaleras  fijas )', 11, 36, '2023-04-11 22:29:52', NULL, NULL, NULL),
(37, 62, '2023-37', 12, 'Equipo SST', '2023-12-01', '2023-12-31', 'PRESENCIAL', '', '', '', '', 'Inspección de equipos para trabajo en alturas (Andamios, escaleras  fijas )', 11, 37, '2023-04-11 22:30:52', NULL, NULL, NULL),
(38, 62, '2023-38', 12, 'Equipo SST, ARL, proveedor', '2023-04-01', '2023-04-30', 'PRESENCIAL', NULL, '', NULL, NULL, 'Inspecciones verificación condiciones  orden y aseo en los  Puesto de trabajo.', 11, 38, '2023-04-11 22:32:45', NULL, NULL, NULL),
(39, 62, '2023-39', 12, 'Equipo SST, ARL, proveedor', '2023-08-01', '2023-08-31', 'PRESENCIAL', NULL, '', NULL, NULL, 'Inspecciones verificación condiciones  orden y aseo en los  Puesto de trabajo.', 11, 39, '2023-04-11 22:33:54', NULL, NULL, NULL),
(40, 62, '2023-40', 12, 'Equipo SST, ARL, proveedor', '2023-12-01', '2023-12-31', 'PRESENCIAL', NULL, '', NULL, NULL, 'Inspecciones verificación condiciones  orden y aseo en los  Puesto de trabajo.', 11, 40, '2023-04-11 22:35:33', NULL, NULL, NULL),
(41, 62, '2023-41', 12, 'Equipo SST, ARL, proveedor', '2023-06-01', '2023-06-30', 'PRESENCIAL', NULL, '', NULL, NULL, 'Inspección  verificación condiciones ergonómicas puesto de trabajo', 11, 41, '2023-04-11 22:37:30', NULL, NULL, NULL),
(42, 62, '2023-42', 12, 'Equipo SST, ARL, proveedor', '2023-10-01', '2023-10-31', 'PRESENCIAL', 'REALIZADO', '', '', 'Se realizaron evaluaciones puesto de trabajo a postulantes de tele trabajo y APT a funcionaria para calificar origen enfermedad. ', 'Inspección  verificación condiciones ergonómicas puesto de trabajo.', 12, 42, '2023-04-11 22:38:50', NULL, NULL, NULL),
(43, 62, '2023-43', 5, 'Equipo SST', '2024-06-01', '2024-06-30', 'PRESENCIAL', 'REALIZADO', '', '', 'Se realizo Inspección a extintores de todas las sedes. ', '', 11, 43, '2023-12-07 14:10:05', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logger`
--

CREATE TABLE `logger` (
  `id_logger` int(11) NOT NULL,
  `opcion` varchar(155) DEFAULT NULL,
  `usuario` varchar(155) DEFAULT NULL,
  `descripcion` varchar(155) DEFAULT NULL,
  `tiempo_gen` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriz`
--

CREATE TABLE `matriz` (
  `id_matriz` int(11) NOT NULL,
  `is_entidad` bit(1) DEFAULT NULL,
  `lugar` text DEFAULT NULL,
  `sede` varchar(255) DEFAULT NULL,
  `dependencia` int(11) DEFAULT NULL,
  `denominacion` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `origen_hallazgo` varchar(250) DEFAULT NULL,
  `descripcion_hallazgo` text DEFAULT NULL,
  `elemento_interviene` varchar(250) DEFAULT NULL,
  `recomendacion` varchar(250) DEFAULT NULL,
  `tipo_accion` varchar(45) DEFAULT NULL,
  `responsable` varchar(255) DEFAULT NULL,
  `fechapropuesta_cierre` date DEFAULT NULL,
  `accion_tomada` varchar(150) DEFAULT NULL,
  `estado` varchar(150) DEFAULT NULL,
  `fecha_seguimiento` date DEFAULT NULL,
  `avance` int(10) DEFAULT NULL,
  `documento_soporte` text DEFAULT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `tiempo_gen` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `matriz`
--

INSERT INTO `matriz` (`id_matriz`, `is_entidad`, `lugar`, `sede`, `dependencia`, `denominacion`, `fecha`, `origen_hallazgo`, `descripcion_hallazgo`, `elemento_interviene`, `recomendacion`, `tipo_accion`, `responsable`, `fechapropuesta_cierre`, `accion_tomada`, `estado`, `fecha_seguimiento`, `avance`, `documento_soporte`, `fecha_cierre`, `tiempo_gen`) VALUES
(1, b'1', '', '7', 1, 2, '2023-01-16', 'Directriz Organizacional', 'yty', 'Integridad de Activos y Confiabilidad', 'ghjh', 'A. Correctiva', 'dasdsa', '2023-01-20', 'dasdasd', 'ABIERTO', '2023-02-02', 1, '', '2023-01-19', '2023-01-16 15:54:44'),
(2, b'1', '', '7', 2, 3, '2023-01-16', 'COPASST', 'dasd', 'Manejo de información y Documentación', 'dasd', 'A. Correctiva', 'dasd', '2023-01-16', 'dasd', 'ABIERTO', '2023-01-16', 0, '', NULL, '2023-01-16 16:37:05'),
(3, b'1', '', '7', 13, 12, '2023-01-17', 'COPASST', 'c', 'Cumplimiento de Requisitos y Estándares', 'ada', 'A. Correctiva', 'adad', '2023-01-10', 'hghghg', 'ABIERTO', '2023-01-19', 0, '', '2023-01-17', '2023-01-17 12:10:10'),
(4, b'1', '', '6', 3, 1, '2023-01-19', 'COPASST', 'sadasdasdsadasd', 'Cumplimiento de Requisitos y Estándares', 'dasdsadasfsdfdsafdsf', 'A. Correctiva', 'dsad', '2023-01-18', 'dsad', 'ABIERTO', '2023-01-18', 0, '', NULL, '2023-01-18 15:42:56'),
(5, b'1', '', '7', 1, 3, '2023-01-19', 'Directriz Organizacional', 'fasdfdsf', 'Cumplimiento de Requisitos y Estándares', 'fsdfad', 'A. Correctiva', 'sdfsdfsdfdsf', '2023-01-18', 'fdsfsdf', 'ABIERTO', '2023-01-18', 0, '', NULL, '2023-01-18 15:44:42'),
(6, b'1', '', '7', 1, 1, '2023-01-18', 'COPASST', 'todos lo campos', 'Cumplimiento de Requisitos y Estándares', 'todos los campos', 'A. Correctiva', 'dasdas', '2023-01-18', 'dsad', 'ABIERTO', '2023-01-18', 0, '', NULL, '2023-01-18 15:47:34'),
(7, b'1', '', '3', 4, 5, '2023-01-18', 'Quejas y Reclamos', 'kkkkkkkkkkkkkkkkkfff', 'Cumplimiento de Requisitos y Estándares', 'llllllllllllllllllllllllllllllll', 'A. Preventiva', 'hhhhhhhhh', '2023-01-31', '', 'EN PROCESO', '2023-01-20', 50, '', '2023-01-20', '2023-01-18 15:54:05'),
(8, b'1', '', '6', 4, 4, '2023-01-21', 'Inspección', 'dasd', 'Participación y comunicación con partes interesadas', 'dsadasd', NULL, '', NULL, '', 'ABIERTO', NULL, 0, '', '2023-01-21', '2023-01-21 10:59:25'),
(9, b'1', '', '7', 22, 3, '2023-03-07', 'COPASST', 'Esto es una prueda', 'Estructura y Responsabilidad', 'esto es una prueba', 'A. Correctiva', 'SSS', '2023-03-08', '', 'ABIERTO', NULL, 0, '', NULL, '2023-03-07 19:44:22'),
(10, b'1', '', '11', 14, 25, '2023-01-23', 'Inspección', 'Se  observa escalera con peldaños deteriorados cuadrilla de poda de arboles', 'Identificación de Peligros, Análisis de Riesgos y Controles', 'Se recomienda realizar cambio de escaleras defectuosas, mantenimiento preventivo y correctivo en las escaleras cuando de lugar. ', 'A. Correctiva', 'Secretaria de Infraestructura Física', '2023-02-17', '', 'ABIERTO', NULL, 0, '', NULL, '2023-04-12 16:05:46'),
(11, b'1', '', '11', 14, 25, '2023-01-20', 'Inspección', 'En cuadrilla de poda de arboles Se observa eslinga de posicionamiento  en mal estado generado por el uso. ', 'Identificación de Peligros, Análisis de Riesgos y Controles', 'Se recomienda realizar inspección periódica en los equipos para trabajo en alturas (poda de arboles)  y cambiar la eslinga por una que cumpla con las condiciones de seguridad.', 'A. Correctiva', 'Trabajador usuario', '2023-02-15', '', 'ABIERTO', NULL, 0, '', NULL, '2023-04-12 16:26:51'),
(12, b'1', '', '11', 14, 25, '2023-01-27', 'Inspección', 'En la cuadrilla de zonas verdes, se evidencia exposición continua  a ruido producido por el motor de las guadañas. ', 'Identificación de Peligros, Análisis de Riesgos y Controles', 'Se recomienda dotar de protectores auditivos de copas a trabajadores oficiales de la Cuadrillas de limpieza de zonas verdes.', 'A. Preventiva', 'Taller almacen y equpo sst', '2023-02-28', 'Se realizo informe y sensibilizacion a los trabajadores con recomendaciones, se gesto contrato compra EPP', 'CERRADO', '2023-04-13', 99, '', '2023-02-15', '2023-04-12 19:10:29'),
(13, b'1', '', '11', 14, 25, '2023-01-27', 'Inspección', 'En cuadrilla de limpieza de zonas verdes se evidencia trabajadores oficiales cuadrilla de zonas verdes, sin equipos de protección facial', 'Identificación de Peligros, Análisis de Riesgos y Controles', 'Se recomienda dotar a trabajadores con caretas faciales contra el material particulado proyectado por guadañas', 'A. Preventiva', 'Almacen taller y equipo SST', '2023-03-01', '', 'ABIERTO', NULL, 0, '', NULL, '2023-04-12 19:19:17'),
(14, b'1', '', '11', 14, 25, '2023-01-27', 'Inspección', 'cuadrilla de limpieza de zonas verdes se evidencia falta de señalizacion y barrera contra material particulado (barrera o manpara) en el desarrollo de actividades de limpieza de zonas verdes.', 'Identificación de Peligros, Análisis de Riesgos y Controles', 'Recomienda dotar de mamaparas para evitar daños  a terceros ( transeuntes, Vehiculos y viviendas aledañas) y señalizar zona de trabajo.', 'A. Preventiva', 'Secretaria de infraestructura', '2023-04-30', '', 'ABIERTO', NULL, 0, '', NULL, '2023-04-12 20:53:51'),
(15, b'1', '', '7', 10, 14, '2023-12-06', 'Inspección', 'SE encuentran obstaculizado el acceso al los extintores de emergencias, lo cuales deben estar en un area despejada y de fácil acceso. ', 'Identificación de Peligros, Análisis de Riesgos y Controles', 'Retirar obtaculos y señalizar los extintores. Si es necesario re-ubicar extintores a un área visible de fácil acceso. ', 'A. Correctiva', 'Equipo SST', '2023-12-30', 'Se retiro el obstáculo y esta pendiente instalar señalizacion', 'EN PROCESO', '2023-12-07', 80, '', '2023-12-07', '2023-12-07 13:52:24');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `movilidad`
--

INSERT INTO `movilidad` (`id_movilidad`, `funciones`, `salario`, `fecha_ini`, `fecha_fin`, `id_funcionario`, `id_dependencia`, `id_sede`, `numero_posesion`, `fecha_posesion`, `numero_resolucion`, `fecha_resolucion`, `modo_trabajo`, `archivo_laboral`, `id_tipovinculacion`, `id_nivel`, `id_cargo`, `id_codigo`, `id_grado`, `motivo`, `otro`, `fecha_creacion`, `entrega_cargo`) VALUES
(1, 'djdsjksdjsd', '111111', '2022-04-07 00:00:00', '2022-04-14 00:00:00', 1, 9, 6, '212', '2022-04-08', '2333', '2022-04-07', 'Presencial', '', 4, 5, 15, 15, 20, 'Encargo', '', '2022-04-07', 'SI'),
(3, 'hfhhhvhvg', '2000000', '2022-04-01 00:00:00', '2022-04-20 00:00:00', 10, 8, 4, '202277777', '2022-04-02', '202277777', '2022-04-04', 'Presencial', '', 1, 3, 11, 11, 16, 'Encargo', '', '2022-04-08', 'NO'),
(4, 'ssssssssssssssssss', '0444444', '2022-06-30 00:00:00', NULL, 469, 11, 4, '388', '2022-06-30', '1690', '2022-06-30', 'Presencial', '', 1, 4, 17, 17, 22, 'Reubicacion', '', '2022-06-17', 'SI'),
(5, 'ssssssssssssssssss', '0444444', '2022-06-17 00:00:00', '2022-12-31 00:00:00', 469, 12, 4, '387', '2022-06-17', '1690', '2022-06-17', 'Alternancia', 'views/archivos/movilidad/No_Aplica.1655504430_62acfe2e5fbb7.pdf', 1, 4, 13, 13, 18, 'Comision', '', '2022-06-17', 'undefined'),
(6, 'Todas las del cargo', '2000000', '2023-03-10 00:00:00', '2023-07-10 00:00:00', 477, 14, 4, 'A-1234578', '2023-03-10', '123', '2023-03-10', 'Presencial', 'views/archivos/movilidad/No_Aplica.1678483033_640b9e595d0ce.pdf', 1, 2, 17, 17, 22, 'Reubicacion', '', '2022-06-20', 'NO'),
(7, 'VARIAS', '2226382', '2022-07-08 00:00:00', NULL, 276, 11, 4, 'DECRETO 35-16-037', '2022-07-13', '3501129', '2022-07-08', 'Presencial', '', 1, 2, 4, 4, 7, 'Encargo', '', '2022-08-09', 'SI'),
(8, 'Todas las del cargo', '111111', '2023-03-10 00:00:00', '2023-07-10 00:00:00', 4, 10, 7, '111', '2023-03-10', '111', '2023-03-10', 'Presencial', 'views/archivos/movilidad/No_Aplica.1678496421_640bd2a5b167a.pdf', 1, 1, 1, 1, 1, 'Reubicacion', '', '2023-03-10', 'SI'),
(9, 'djdsjksdjsd', '111111', '2023-03-24 00:00:00', '2023-03-24 00:00:00', 1, 9, 6, '212', '2022-04-08', '2333', '2022-04-07', 'Presencial', '', 4, 5, 3, 3, 3, 'Encargo', '', '2022-04-07', 'undefined'),
(10, 'SDKJASDKSDS', '1200000', '2025-04-30 00:00:00', NULL, 445, 54, 2, 'DECRETO 35-16-037', '2025-04-30', '11', '2025-04-17', 'Presencial', 'views/archivos/movilidad/DECRETO_0344_DE_2023_ADOPTA_ARQUITECTURA_EMPRESARIAL_ALCALDIA_DE_CALI.1746045113_681288b9cf676.pdf', 1, 4, 17, 17, 25, 'Encargo', '', '2025-04-30', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL,
  `municipio` varchar(45) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
(43, 'CAUCA', '15022'),
(50, 'Otro Municipio', '50001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_educativo`
--

CREATE TABLE `nivel_educativo` (
  `id_niveleducativo` int(11) NOT NULL,
  `nivel_educativo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `nivel` varchar(45) NOT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_funcionario` int(11) NOT NULL,
  `id_parentesco` int(11) NOT NULL,
  `is_emergencia` bit(1) DEFAULT b'0',
  `contacto` varchar(45) DEFAULT NULL,
  `contacto_2` varchar(50) DEFAULT NULL,
  `parentesco` varchar(85) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `nucleo_familiar`
--

INSERT INTO `nucleo_familiar` (`id_nucleofamiliar`, `nombres`, `apellidos`, `edad`, `fecha_nacimiento`, `fecha_upd`, `id_funcionario`, `id_parentesco`, `is_emergencia`, `contacto`, `contacto_2`, `parentesco`) VALUES
(32, 'shadday', 'angarita', 2, '2020-05-10', '2022-06-27 11:33:43', 577, 4, b'1', '3445678', '', ''),
(33, 'ramiro', 'Angarita', 0, '2022-06-27', '2022-06-27 11:45:14', 579, 4, b'1', '3557896', '', ''),
(39, 'victor hugo', 'barreto perdomo', 74, '1979-12-12', '2022-08-08 12:02:08', 66, 2, b'1', '3176811691', '', ''),
(40, 'Rocio ', 'Orozco Cardona', 65, '1957-08-27', '2022-08-08 12:14:24', 66, 3, b'1', '3162977398', '', ''),
(43, 'Carmen Amparo ', 'Calapsú Valencia', 50, '1972-04-25', '2022-08-08 17:36:55', 45, 3, b'1', '3162897975', '', ''),
(45, 'JAIRO ALFONSO', 'QUINTERO LOPEZ', 66, '1988-11-21', '2022-08-09 11:26:18', 398, 5, b'0', '', '', ''),
(46, 'LUZ ', 'MEJIA BEDOYA', 58, '1988-11-21', '2022-08-09 11:26:18', 398, 5, b'0', '', '', ''),
(47, 'DILLETTE ROCIO', 'QUINTERO MEJIA', 34, '1988-11-21', '2022-08-09 11:26:18', 398, 5, b'1', '3154215232', '', ''),
(48, 'JAIRO ALFONSO', 'QUINTERO LOPEZ', 66, '1988-11-21', '2022-08-09 11:28:56', 398, 5, b'0', '', '', ''),
(49, 'LUZ ', 'MEJIA BEDOYA', 58, '1988-11-21', '2022-08-09 11:28:56', 398, 5, b'0', '', '', ''),
(50, 'DILLETTE ROCIO', 'QUINTERO MEJIA', 34, '1988-11-21', '2022-08-09 11:28:56', 398, 5, b'1', '3154215232', '', ''),
(53, 'LUZ AMPARO ', 'HERNANDEZ MOLINA', 48, '1974-10-03', '2022-08-09 11:53:15', 56, 3, b'1', '3206787671', '', ''),
(54, 'CLIMACO', 'CHARRUPI POPO', 58, '1964-08-26', '2022-08-09 12:14:09', 155, 2, b'1', '3137504213', '', ''),
(55, 'FLOR DE LIZ', 'GOMEZ CARABALI', 57, '1965-04-19', '2022-08-09 12:14:09', 155, 3, b'1', '3122233245', '', ''),
(56, 'MARCO ', 'RUALES MONTERO', 80, '1942-05-14', '2022-08-09 12:30:41', 553, 2, b'1', '3117067714', '', ''),
(57, 'MARIELA', 'IBARRA CORDOBA', 76, '1946-08-29', '2022-08-09 12:30:41', 553, 3, b'1', '3117067714', '', ''),
(58, 'YAMILE', 'RUALES IBARRA', 46, '1976-06-27', '2022-08-09 12:30:41', 553, 5, b'1', '3103771694', '', ''),
(59, 'ROGER ', 'CHAMORRO RIVAS', 43, '1979-12-01', '2022-08-09 12:30:41', 553, 1, b'1', '3117067714', '', ''),
(60, 'DIANA MARCELA', 'AVILA LINARES', 40, '1982-09-13', '2022-08-09 12:47:37', 80, 1, b'1', '3007782231', '', ''),
(61, 'VALERIA ', 'GUZMAN RINCON', 14, '2008-02-17', '2022-08-09 16:36:36', 408, 4, b'1', '3106703039', '', ''),
(62, 'MELANI SOFIA', 'GIRALDO RINCON', 11, '2011-11-26', '2022-08-09 16:36:36', 408, 6, b'1', '3157955988', '', 'NIETA'),
(63, 'SANTIAGO ', 'NARVAEZ PEREZ', 20, '2002-04-08', '2022-08-09 16:38:07', 386, 4, b'1', '3155840481', '', ''),
(64, 'JULIANA ANDREA', 'VILLEGAS VELASCO', 20, '2002-09-28', '2022-08-09 17:08:29', 493, 4, b'1', '3187430125', '', ''),
(65, 'SILVIA PATRICIA', 'VELASCO CARABALI', 32, '1990-02-06', '2022-08-09 17:08:29', 493, 5, b'1', '3217061122', '', ''),
(66, 'BRETSMAN', 'USMA CANO', 49, '2004-09-05', '2022-08-09 17:32:00', 276, 4, b'1', '3176988099', '', ''),
(67, 'DIANA ', 'USMA MORENO', 27, '2004-09-05', '2022-08-09 17:32:00', 276, 4, b'1', '3052348293', '', ''),
(68, 'JEFERSON', 'USMA MORENO', 18, '2004-09-05', '2022-08-09 17:32:00', 276, 4, b'1', '3246362732', '', ''),
(69, 'Jenny Carolina', 'Barreto Orozco', 43, '1979-12-12', '2022-08-11 12:01:23', 66, 5, b'1', '3106432237', '', ''),
(70, 'paula andrea', 'yandy altamirano', 23, '1999-08-30', '2022-08-16 16:24:54', 13, 4, b'1', '3137285442', '', ''),
(71, 'nestor daniel ', 'yandy altamirano', 23, '1999-08-30', '2022-08-16 16:24:54', 13, 4, b'1', '3154543921', '', ''),
(72, 'thiago', 'yandy aristizabal', 3, '1992-12-18', '2022-08-16 16:31:40', 18, 6, b'0', '', '', ''),
(73, 'edgar andrey', 'yandy diaz', 30, '1992-12-18', '2022-08-16 16:31:40', 18, 6, b'1', '3008136054', '', ''),
(74, 'kevin javier', 'Viloria Hoyos', 28, '1994-07-01', '2022-08-16 17:46:11', 253, 4, b'1', '3204590761', '', ''),
(75, 'mauricio Esteban ', 'Diaz Hoyos', 24, '1998-10-10', '2022-08-16 17:46:11', 253, 4, b'1', '3128100098', '', ''),
(76, 'Pedro Antonio ', 'Diaz Hoyos', 17, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'1', '3118993975', '', ''),
(77, 'Nataly', 'Correa Hoyos', 30, '1992-08-25', '2022-08-16 17:46:11', 253, 4, b'1', '3147162285', '', ''),
(80, 'mauricio Esteban ', 'Diaz Hoyos', 24, '1972-07-12', '2022-08-16 17:46:11', 253, 1, b'1', '3147162285', '', ''),
(84, 'Eneida Teresita', 'Gomez de Ospina', 90, '1932-01-28', '2022-08-17 16:06:26', 369, 3, b'0', '', '', ''),
(85, 'Alejandro ', 'Ospina Gomez', 56, '1966-06-01', '2022-08-17 16:06:26', 369, 5, b'1', '3015722500', '', ''),
(86, 'JUAN DAVID', 'ARBOLEDA RADA', 24, '1998-02-20', '2022-08-17 17:07:12', 469, 4, b'1', '3156661228', '', ''),
(87, 'Edwin Bernardo', 'Sanchez ', 45, '1977-12-11', '2022-08-17 17:36:05', 390, 1, b'1', '3207406035', '', ''),
(91, 'fsfdfsdf', 'fsfsdf', 13, '2010-06-14', '2022-08-17 20:09:19', 11, 5, b'0', '', '', ''),
(92, 'ESTEBAN ', 'FIGEROA GOMEZ', 30, '1992-05-01', '2022-08-18 11:40:06', 232, 4, b'1', '3215067464', '', ''),
(93, 'MARIA ZOILA ', 'ORTEGA MORALES', 80, '1942-01-15', '2022-08-29 09:25:14', 465, 3, b'0', '', '', ''),
(94, 'ROSSANA', 'ANDRADE MOJARRANGO', 27, '1995-01-27', '2022-08-29 09:25:14', 465, 1, b'1', '324171698', '', ''),
(95, 'MARIA ZOILA ', 'ORTEGA MORALES', 80, '1942-01-15', '2022-08-29 09:29:37', 465, 3, b'0', '', '', ''),
(96, 'ROSSANA', 'ANDRADE MOJARRANGO', 27, '1995-01-27', '2022-08-29 09:29:37', 465, 1, b'1', '324171698', '', ''),
(97, 'DIANA CAROLINA', 'ECHEVERRY PERDIGON', 30, '1991-09-01', '2022-08-29 10:29:15', 70, 4, b'1', '3164133732', '', ''),
(98, 'DIANA CAROLINA', 'ECHEVERRY PERDIGON', 30, '1991-09-01', '2022-08-29 10:31:00', 70, 4, b'1', '3164133732', '', ''),
(99, 'ANGELA MARCELA', 'DIAZ IBARRA', 30, '1991-09-30', '2022-08-29 10:37:49', 284, 4, b'1', '3226136838', '', ''),
(100, 'DARLYN DANIELA', 'ENCARNACION IBARRA', 22, '2000-06-10', '2022-08-29 10:37:49', 284, 4, b'1', '3219927294', '', ''),
(101, 'CARLOS FREYDEN ', 'FORY', 49, '1973-02-12', '2022-08-29 10:37:49', 284, 6, b'0', '', '', 'COMPAÑERO SENTIMENTAL'),
(102, 'JUAN PABLO ', 'GUERRERO RODRIGUEZ', 12, '2010-07-31', '2022-08-29 10:46:28', 164, 6, b'0', '', '', 'nieto'),
(103, 'MARIA MELBA', 'NAVIA', 59, '1962-10-11', '2022-08-29 10:46:28', 164, 1, b'1', '3235037894', '', ''),
(104, 'MARIANA ', 'GARCIA USMA', 9, '2000-10-02', '2022-08-29 10:54:09', 475, 6, b'0', '', '', ''),
(105, 'KALETH', 'VELA USMA', 3, '2000-10-02', '2022-08-29 10:54:09', 475, 6, b'0', '', '', ''),
(106, 'ALEXANDRA', 'GUERRERO', 50, '1971-09-12', '2022-08-29 10:54:09', 475, 6, b'1', '3167853194', '', ''),
(107, 'MARIANA ', 'GARCIA USMA', 9, '2000-10-02', '2022-08-29 10:58:42', 475, 6, b'0', '', '', ''),
(108, 'KALETH', 'VELA USMA', 3, '2000-10-02', '2022-08-29 10:58:42', 475, 6, b'0', '', '', ''),
(109, 'ALEXANDRA', 'GUERRERO', 21, '2000-10-02', '2022-08-29 10:58:42', 475, 6, b'1', '3167853194', '', ''),
(110, 'jorge enrique', 'APONZA', 69, '1953-08-24', '2022-08-29 11:06:56', 250, 1, b'1', '3128232660', '', ''),
(111, 'LUZ KARIME ', 'APONZA LUCUMI', 22, '2000-02-19', '2022-08-29 11:06:56', 250, 4, b'0', '', '', ''),
(112, 'JESSICA', 'GONZALEZ LUCUMI', 21, '2001-02-28', '2022-08-29 11:06:56', 250, 4, b'1', '3045279653', '', ''),
(113, 'ERIKA PAOLA', 'CARABALI LASSO', 17, '2004-12-12', '2022-08-29 11:13:11', 187, 4, b'0', '', '', ''),
(114, 'YEISON', 'CARABALI LASSO', 34, '1988-01-10', '2022-08-29 11:13:11', 187, 4, b'1', '3146079585', '', ''),
(115, 'ERIKA PAOLA', 'CARABALI LASSO', 17, '2004-12-12', '2022-08-29 11:13:47', 187, 4, b'1', '3233412361', '', ''),
(116, 'YEISON', 'CARABALI LASSO', 34, '1988-01-10', '2022-08-29 11:13:47', 187, 4, b'1', '3146079585', '', ''),
(117, 'JORGE EDWIN ', 'CASTRO RUA', 32, '1990-05-04', '2022-08-29 15:26:11', 541, 4, b'1', '3105238780', '', ''),
(118, 'YEFERSON ALEARSI', 'CORDOBA QUIJANO', 11, '2010-10-22', '2022-08-29 15:47:32', 264, 4, b'0', '', '', ''),
(119, 'AURA CECILIA', 'QUIJANO', 0, NULL, '2022-08-29 15:47:32', 264, 1, b'1', '3216257644', '', ''),
(120, 'Danny', 'Mejia Navia', 39, '1982-12-01', '2022-09-01 10:18:10', 582, 1, b'1', '3105034654', '', ''),
(121, 'Santiago', 'Mejia Correa', 14, '2008-01-02', '2022-09-01 10:18:10', 582, 4, b'0', '', '', ''),
(122, 'Carmenza', 'Polo', 65, '1957-02-02', '2022-09-01 16:07:10', 583, 3, b'1', '3177275964', '', ''),
(126, 'ROCIO', 'OROZCO CARDONA', 65, '1957-08-27', '2022-09-06 09:12:10', 72, 3, b'1', '3106432237', '', ''),
(127, 'VICTOR HUGO', 'BARRETO PERDOMO', 75, '1947-06-15', '2022-09-06 09:12:10', 72, 2, b'0', '', '', ''),
(130, 'Juana', 'Cardona Rodriguez', 1, '1991-09-09', '2022-09-13 18:56:20', 587, 6, b'0', '', '', ''),
(131, 'Daniela', 'Rodriguez Hoyos', 31, '1991-09-09', '2022-09-13 18:56:20', 587, 6, b'1', '3155310325', '', ''),
(132, 'a', 'a', 0, '2022-12-06', '2022-12-06 12:06:44', 588, 3, b'0', '', '', ''),
(134, 'a', 'a', 0, '2022-12-10', '2022-12-10 11:49:07', 590, 2, b'0', '', '', ''),
(135, 'a', 'b', 0, '2022-12-12', '2022-12-12 10:04:05', 591, 2, b'0', '', '', ''),
(137, 'Sebastian', 'Gil Lerma', 12, '2010-12-12', '2023-02-16 22:02:17', 212, 4, b'1', '3146434805', '', ''),
(138, 'Kiara Vanessa ', 'Viafara sanchez', 25, '1997-04-07', '2023-02-17 19:56:42', 431, 4, b'1', '3233629281', '', ''),
(139, 'Maria jose', 'Viafara sanchez', 19, '2003-11-05', '2023-02-17 19:56:42', 431, 4, b'1', '3195084800', '', ''),
(140, 'Sammy camilo', 'Viafara sanchez', 22, '2000-06-02', '2023-02-17 19:56:42', 431, 4, b'1', '3165124792', '', ''),
(141, 'Jaduer ', 'Carabali mezu ', 33, '1989-12-12', '2023-02-17 22:19:13', 172, 6, b'1', '3103550255', '', 'compañero'),
(142, 'Saray', 'Carabali Gonzalez ', 11, '2012-02-15', '2023-02-17 22:19:13', 172, 4, b'1', '3103550255', '', ''),
(143, 'Salome ', 'Carabali Gonzalez ', 6, '2016-11-03', '2023-02-17 22:19:13', 172, 4, b'1', '314740004', '', ''),
(144, 'STELLA', 'SALINAS', 64, '1958-09-23', '2023-02-17 22:28:22', 417, 3, b'1', '3052460108', '', ''),
(145, 'ANGEL DAVID', 'ESPINOSA SALDAÑA', 9, '2014-01-21', '2023-02-17 22:28:22', 417, 6, b'1', '3153455597', '', 'SOBRINO/HIJO'),
(146, 'KAREN ANDREA ', 'SALDAÑA SALINAS ', 31, '1991-10-09', '2023-02-17 22:28:22', 417, 5, b'1', '3242438098', '', ''),
(147, 'JAIRO', 'SARDI', 0, NULL, '2023-02-17 22:28:22', 417, 6, b'1', '3177060430', '', 'PADRASTRO'),
(148, 'luisa fernanda ', 'vega garcia', 26, '1996-04-05', '2023-02-17 22:35:38', 490, 4, b'1', '3218405461', '', ''),
(149, 'lucia', 'vega garcia', 20, '2002-11-06', '2023-02-17 22:35:38', 490, 4, b'1', '3218405461', '', ''),
(150, 'myriam', 'vega garcia', 27, '1995-11-05', '2023-02-17 22:35:38', 490, 4, b'1', '3218405461', '', ''),
(151, 'EDILMA', 'MARTINEZ', 72, '1950-10-29', '2023-02-17 22:42:00', 521, 3, b'1', '3225277321', '', ''),
(152, 'RAUL', 'VILLAQUIRAN', 77, '1945-05-27', '2023-02-17 22:42:00', 521, 2, b'1', '3225277321', '', ''),
(153, 'OLGA MARINA', 'SANZ', 80, '1942-02-19', '2023-02-17 22:52:43', 199, 3, b'1', '3168389999', '', ''),
(154, 'JAIRO', 'GRISALES SANZ', 53, '1970-02-01', '2023-02-17 22:52:43', 199, 5, b'1', '3166089090', '', ''),
(155, 'DANIELA  DE LOS ANGELES', 'RIVERO MOLINA', 28, '1995-02-15', '2023-02-17 22:52:43', 199, 1, b'1', '3157775510', '', ''),
(156, 'María camila ', 'Balanta arboleda ', 27, '1995-09-30', '2023-02-21 01:38:48', 349, 4, b'1', '3173705677', '', ''),
(157, 'Hortencia', 'Arboleda ', 0, NULL, '2023-02-21 01:38:48', 349, 3, b'1', '3153060844', '', ''),
(158, 'Luz consuelo ', 'Arboleda ', 0, NULL, '2023-02-21 01:38:48', 349, 5, b'1', '3153060844', '', ''),
(159, 'Sandra', 'Balanta arboleda', 0, NULL, '2023-02-21 01:38:48', 349, 5, b'1', '3154060844', '', ''),
(160, ' Juan Carlos ', 'Balanta Arboleda ', 0, NULL, '2023-02-21 01:38:48', 349, 5, b'1', '3154060844', '', ''),
(161, 'Omar', 'Guzmán gardeazabal', 0, '2022-08-25', '2023-02-21 01:47:39', 181, 2, b'1', '3155377049', '', ''),
(162, 'Luz mila', 'Galvis contreras', 6, '2016-12-01', '2023-02-21 01:47:39', 181, 3, b'1', '3155377049', '', ''),
(163, 'Claudia danelly ', 'Calero Sánchez ', 8, '2014-08-21', '2023-02-21 01:47:39', 181, 1, b'1', '3155377049', '', ''),
(164, 'Milena', 'Bermudes Ocampo', 50, '1972-10-26', '2023-02-21 01:56:22', 97, 3, b'1', '3126132217', '', ''),
(165, 'Carlos German', 'Andrade Fajardo', 54, '1968-08-01', '2023-02-21 01:56:22', 97, 6, b'1', '3126132217', '', 'padrastro'),
(166, 'Daniela Andrea', 'Bermudes Ocampo', 23, '1999-12-24', '2023-02-21 01:56:22', 97, 5, b'1', '3126132217', '', ''),
(167, 'Ana Isabella', 'Pineda Bermudes', 2, '2020-11-20', '2023-02-21 01:56:22', 97, 6, b'1', '3126132217', '', 'sobrina'),
(168, 'Mercedes', 'Landazuri Marulanda', 58, '1964-06-13', '2023-02-21 02:12:59', 178, 1, b'1', '3133206610', '', ''),
(169, 'Marleny', 'Guxman Muñoz', 27, '1995-07-05', '2023-02-21 02:12:59', 178, 4, b'1', '3133206610', '', ''),
(170, 'Samuel Santiago', 'Guzman Muñoz', 10, '2012-11-19', '2023-02-21 02:12:59', 178, 6, b'1', '3133206610', '', 'nieto'),
(171, 'Bertha Otilia ', 'Parra barona', 0, NULL, '2023-02-21 02:21:22', 263, 1, b'1', '3207230800', '', ''),
(172, 'Marcela ', 'Lugo Parra ', 0, NULL, '2023-02-21 02:21:22', 263, 4, b'1', '3207230800', '', ''),
(173, 'María Victoria ', 'Medina mezu ', 0, NULL, '2023-02-21 02:21:22', 263, 3, b'1', '3116395765', '', ''),
(174, 'Numan Napoleón ', 'Lugo peña ', 0, NULL, '2023-02-21 02:21:22', 263, 2, b'1', '3207230800', '', ''),
(175, 'Doris elena', 'Ramírez ', 0, NULL, '2023-02-21 02:31:51', 161, 3, b'1', '5530782', '', ''),
(176, 'Alanis ', 'Mendoza bedolla', 0, NULL, '2023-02-21 02:31:51', 161, 6, b'1', '3186612206', '', 'novia'),
(177, 'BEATRIZ', 'LASSO ORTEGA', 66, '1956-12-30', '2023-02-21 02:36:38', 14, 1, b'1', '3215944459', '', ''),
(178, 'ARALY', 'BANGUERO', 55, '1967-03-13', '2023-02-21 02:49:35', 132, 1, b'1', '3052233715', '', ''),
(179, 'MARIA ELENA', 'VALDERRAMA', 64, '1958-08-16', '2023-02-21 02:53:45', 352, 1, b'1', '6025923617', '', ''),
(180, 'Paula Andrea', 'Guachetá Muñoz', 50, '1993-01-01', '2023-02-21 02:59:28', 534, 1, b'1', '3175985574', '', ''),
(181, 'Martín', 'Torres Guachetá ', 30, '1993-01-13', '2023-02-21 02:59:28', 534, 4, b'0', '', '', ''),
(182, 'Thiago', 'Torres Guachetá ', 26, '1996-10-01', '2023-02-21 02:59:28', 534, 4, b'0', '', '', ''),
(184, 'Concepción ', 'Calambas ', 61, '1940-10-15', '2023-02-21 03:08:32', 396, 3, b'1', '3117726382', '', ''),
(185, 'Ana veiva  ', 'Trujillo', 82, '1940-10-15', '2023-02-21 03:08:32', 396, 3, b'1', '3117726382', '', ''),
(186, 'ANDRES ARLES', 'RODRIGUEZ JORY', 60, '1962-04-08', '2023-02-21 03:14:58', 275, 1, b'1', '3108276499', '', ''),
(187, 'ANDRES ARLES', 'RODRIGUEZ CORTÉS', 31, '1991-08-24', '2023-02-21 03:14:58', 275, 4, b'1', '3108276499', '', ''),
(188, 'MAURICIO ALBERTO ', 'SCARPETTA HERRERA', 36, '1986-12-11', '2023-02-21 03:19:48', 525, 1, b'1', '3147514105', '', ''),
(189, 'SARA MARIA', 'CERQUERA VERGARA', 70, '1952-04-30', '2023-02-21 03:26:34', 87, 3, b'1', '3164269166', '', ''),
(190, 'NILSON ANDRES', 'CHARA CANDELA', 24, '1972-09-07', '2023-02-21 03:33:52', 89, 6, b'1', '3014482362', '', ''),
(191, 'DANNA MARCELA', 'CHARA CANDELA', 16, '1972-09-07', '2023-02-21 03:33:52', 89, 6, b'1', '3154901595', '', ''),
(192, 'NILSON ', 'CHARA MAFLA', 50, '1972-09-07', '2023-02-21 03:33:52', 89, 6, b'1', '3135242211', '', ''),
(193, 'Oscar Javier ', 'Montoya Hernández', 37, '1985-04-23', '2023-02-21 03:52:10', 88, 1, b'1', '3185079766', '', ''),
(194, 'Oscar David ', 'Montoya Campo', 15, '2007-03-12', '2023-02-21 03:52:10', 88, 4, b'1', '3173664903', '', ''),
(195, 'Johan Felipe ', 'Montoya Campo', 13, '2009-04-17', '2023-02-21 03:52:10', 88, 4, b'1', '3186160254', '', ''),
(196, 'Leidy Vanessa', 'Campo Orozco', 36, '1987-01-02', '2023-02-21 03:52:10', 88, 5, b'1', '3006235939', '', ''),
(197, 'ANDRES EDUARDO ', 'RESTREPO ', 44, '1978-06-29', '2023-02-21 03:58:56', 344, 4, b'1', '3226161801', '', ''),
(198, 'NICOLAS  ', 'RESTREPO', 26, '1996-12-14', '2023-02-21 03:58:56', 344, 6, b'1', '3226161801', '', 'nieto'),
(199, 'Anjy Johana', 'Jativa Legarda', 26, '1996-08-10', '2023-02-21 04:09:44', 92, 4, b'1', '3218664451', '', ''),
(200, 'Luz Marina ', 'Botero Gaviria', 68, NULL, '2023-02-21 04:17:37', 489, 4, b'1', '3187261981', '', ''),
(201, 'Aura Maria', 'Vega Botero', 0, NULL, '2023-02-21 04:17:37', 489, 4, b'1', '3187261981', '', ''),
(202, 'Juan Sebastian', 'Vega Botero', 0, NULL, '2023-02-21 04:17:37', 489, 4, b'1', '3187261981', '', ''),
(203, 'Liseth Daniela', 'Vega Botero', 0, NULL, '2023-02-21 04:17:37', 489, 4, b'1', '3187261981', '', ''),
(204, 'Beissy Patricia ', 'Marin Cuervo', 53, '1969-10-06', '2023-02-21 04:25:53', 440, 3, b'1', '3206611572', '', ''),
(205, 'Oscar Manuel ', 'Taborda Martínez', 58, '1964-09-02', '2023-02-21 04:25:53', 440, 2, b'1', '3113963044', '', ''),
(206, 'Johanna Patricia ', 'Taborda Marin', 33, '1989-12-15', '2023-02-21 04:25:53', 440, 5, b'1', '3207329062', '', ''),
(207, 'Violetta ', 'Sarria Sanchez', 2, '2020-05-25', '2023-02-21 04:38:21', 457, 4, b'1', '3152138855', '', ''),
(208, 'Iza Yanet ', 'Garcia Sanchez', 51, '1971-08-23', '2023-02-21 04:38:21', 457, 3, b'1', '3113242429', '', ''),
(209, 'LAURA SOFIA', 'CAMPO OSORIO', 13, '2010-01-12', '2023-02-21 04:42:13', 83, 4, b'1', '3045884026', '', ''),
(210, 'María dora', 'Salazar', 63, '1957-04-25', '2023-02-22 01:16:16', 593, 2, b'1', '3108435694', '', ''),
(211, 'Javier antonio', 'Alvarez correo', 65, '1957-04-25', '2023-02-22 01:16:16', 593, 2, b'1', '3108435694', '', ''),
(212, 'Karen Johanna', 'Castaño Quintana', 36, '1986-12-29', '2023-02-22 01:24:55', 115, 1, b'1', '3108908145', '', ''),
(213, 'RAMIRO ', 'URRESTE BENAVIDES', 68, '1954-03-19', '2023-02-22 01:32:23', 473, 2, b'1', '3013249243', '', ''),
(214, 'FABIOLA ', 'ROMERO', 71, '1951-04-09', '2023-02-22 01:32:23', 473, 3, b'1', '3013249243', '', ''),
(215, 'MONICA', 'URRESTE ROMERO', 46, '1976-03-31', '2023-02-22 01:32:23', 473, 5, b'1', '3013249243', '', ''),
(216, 'RAMIRO ANDRES', 'URRESTE ROMERO', 45, '1977-04-09', '2023-02-22 01:32:23', 473, 5, b'1', '3013249243', '', ''),
(217, 'Luis Carlos ', 'Basto', 64, '1959-01-12', '2023-02-22 02:18:39', 595, 2, b'1', '3103727317', '', ''),
(218, 'Maria Nubia ', 'Tovar', 62, '1961-02-04', '2023-02-22 02:18:39', 595, 3, b'1', '6025530068', '', ''),
(219, 'Carlos Andrés ', 'Basto Tovar ', 31, '1992-02-05', '2023-02-22 02:18:39', 595, 5, b'1', '6025530068', '', ''),
(220, ' keller ', 'mendoza mina ', 9, '2005-08-25', '2023-02-22 02:33:13', 585, 4, b'1', '3207443429', '', ''),
(221, 'maria camila ', 'zuleta mina ', 17, '2005-08-25', '2023-02-22 02:33:13', 585, 4, b'1', '3207443429', '', ''),
(222, 'maria nelly ', 'charry ', 59, '1963-10-02', '2023-02-22 02:36:29', 585, 3, b'1', '3207443429', '', ''),
(223, 'Nohelia', 'Brand', 52, '1970-09-25', '2023-02-22 02:44:14', 332, 3, b'1', '3167170170', '', ''),
(224, 'LAURA VALENTINA', 'CASTILLO LÓPEZ', 21, '2001-04-15', '2023-02-22 02:50:58', 240, 4, b'1', '3014517571', '', ''),
(225, 'JUAN DAVID ', 'LÓPEZ HURTADO', 17, '2006-01-28', '2023-02-22 02:50:58', 240, 4, b'1', '3502472534', '', ''),
(228, 'ANDREA ', 'CASTAÑEDA RODAS', 0, NULL, '2023-02-22 03:20:19', 174, 4, b'1', '3043251449', '', ''),
(229, 'HERMANN', 'CASTAÑEDA SATIZABAL', 64, '1958-06-18', '2023-02-22 03:20:19', 174, 1, b'1', '3023760162', '', ''),
(230, 'REINELA ', 'LONDOÑO HINCAPIE', 84, '1938-04-26', '2023-02-22 03:20:19', 174, 3, b'1', '3003267293', '', ''),
(231, 'Juan Martin', 'Robledo Rendon', 2, '2020-09-06', '2023-02-22 03:37:52', 401, 4, b'1', '3206803368', '', ''),
(232, 'Marisol ', 'Hernandez Hernandez', 45, '1978-01-26', '2023-02-22 03:37:52', 401, 3, b'1', '3167519640', '', ''),
(233, 'german', 'Rendon Londoño', 70, '1952-08-01', '2023-02-22 03:37:52', 401, 2, b'1', '3108370412', '', ''),
(234, 'Juan Felipe', 'Robledo Villarraga', 25, '1997-06-24', '2023-02-22 03:37:52', 401, 6, b'1', '3016486284', '', ''),
(235, 'Jessica', 'Medina Silva ', 0, '2022-06-29', '2023-02-22 16:38:26', 354, 1, b'1', '3183940532', '', ''),
(236, 'Clemencia ', 'Silva Grisales ', 1, '2022-02-12', '2023-02-22 16:38:26', 354, 3, b'1', '3502417604', '', ''),
(237, 'Efraín ', 'Pérez Collazos', 51, '1971-07-09', '2023-02-22 16:48:16', 91, 2, b'1', '3163023232', '', ''),
(238, 'Stella', 'Pulgarin ', 50, '1972-05-23', '2023-02-22 16:48:16', 91, 3, b'1', '3162773284', '', ''),
(239, 'Diana Katherine ', 'Pérez Pulgarin ', 28, '1995-02-15', '2023-02-22 16:48:16', 91, 5, b'1', '3175126680', '', ''),
(240, 'Armando ', 'Loboa Altamirano ', 40, '1982-08-12', '2023-02-22 16:48:16', 91, 1, b'1', '3128221348', '', ''),
(241, 'NELSON ', 'ORTEGA VAEDEZ ', 58, '1964-06-24', '2023-02-22 17:03:17', 362, 2, b'1', '3147017101', '', ''),
(242, 'NELSON STIVEN ', 'ORTEGA URBANBO', 20, '2002-05-14', '2023-02-22 17:03:17', 362, 5, b'1', '3002999905', '', ''),
(243, 'LUZ DARY', 'URBANO', 53, '1969-05-24', '2023-02-22 17:03:17', 362, 3, b'1', '3207208819', '', ''),
(244, 'Gladys ', 'García Rivera ', 0, NULL, '2023-02-22 17:15:11', 346, 5, b'1', '3206410312', '', ''),
(245, 'Graciela ', 'Garcia Rivera', 74, '1948-04-09', '2023-02-22 17:15:11', 346, 5, b'1', '3177225027', '', ''),
(246, 'María José ', 'Bonilla', 14, '2009-01-08', '2023-02-22 18:28:25', 53, 4, b'1', '3246817295', '', ''),
(247, 'Sebastian', 'Bonilla', 5, '2017-06-12', '2023-02-22 18:28:25', 53, 4, b'1', '3246817295', '', ''),
(248, 'Ana Ruth ', 'Hurtado', 0, NULL, '2023-02-22 18:28:25', 53, 3, b'1', '3246817295', '', ''),
(249, 'Victor Manuel ', 'Bonilla', 0, NULL, '2023-02-22 18:28:25', 53, 2, b'1', '3246817295', '', ''),
(254, 'Paula Betty ', 'Montaño Estupiñan ', 58, '1965-01-15', '2023-02-22 19:54:25', 144, 3, b'1', '3116078470', '', ''),
(255, 'Claudia Patricia ', 'Barona Cajiao', 33, '1989-07-17', '2023-02-22 20:04:11', 122, 1, b'1', '3104935033', '', ''),
(256, 'Cristopher ', 'Ceballos Barona ', 8, '2014-08-16', '2023-02-22 20:04:11', 122, 4, b'1', '3104935033', '', ''),
(257, 'Pedro Freidel ', 'Sanchez Penagos', 68, '1954-04-24', '2023-02-22 20:15:24', 596, 1, b'1', '3177232237', '', ''),
(258, 'Diana Alexandra', 'Sanchez Vargas', 37, '1986-01-08', '2023-02-22 20:15:24', 596, 4, b'1', '3235091403', '', ''),
(259, 'Leidy Johana', 'Sanchez Vargas', 32, '1990-09-10', '2023-02-22 20:15:24', 596, 4, b'1', '3235091403', '', ''),
(260, 'Juan Sebastian ', 'Sánchez Gallego', 4, '2018-06-24', '2023-02-22 20:22:18', 400, 4, b'1', '3113141398', '', ''),
(261, 'JULIAN ANDRÉS ', 'SÁNCHEZ SERVERA', 42, '1981-01-05', '2023-02-22 20:35:36', 314, 1, b'1', '3057123776', '', ''),
(262, 'Milan', 'Sánchez Murillo ', 4, '2018-12-02', '2023-02-22 20:35:36', 314, 4, b'1', '3057123776', '', ''),
(263, 'Alejandro ', 'Sánchez Murillo ', 11, '2012-01-21', '2023-02-22 20:35:36', 314, 4, b'1', '3057123776', '', ''),
(264, 'Juliana', 'Sánchez Murillo ', 9, '2013-10-15', '2023-02-22 20:35:36', 314, 4, b'1', '3057123776', '', ''),
(265, 'Jessica Paola', 'Domínguez Ledesma ', 31, '2014-07-02', '2023-02-22 20:43:50', 526, 4, b'1', '3152184622', '', ''),
(266, 'Mariela ', 'Restrepo ', 66, '2014-07-02', '2023-02-22 20:43:50', 526, 4, b'1', '3023576684', '', ''),
(267, 'Silvio ', 'Villegas Sánchez ', 66, '2014-07-02', '2023-02-22 20:43:50', 526, 4, b'1', '3023576684', '', ''),
(268, 'Daniel ', 'Villegas Domínguez ', 8, '2014-07-02', '2023-02-22 20:43:50', 526, 4, b'1', '3152184622', '', ''),
(269, 'Leydy Johana', 'Muñoz Rosero', 38, '1984-10-29', '2023-02-22 21:20:26', 2, 1, b'1', '3167641424', '', ''),
(270, 'Juliana', 'Acosta', 7, '2015-11-25', '2023-02-22 21:20:26', 2, 4, b'1', '3167641424', '', ''),
(271, 'Danna Sophia ', 'Pino', 11, '2011-08-10', '2023-02-22 21:20:26', 2, 6, b'1', '3167641424', '', ''),
(272, 'Claudia Lorena ', 'Herrera Viñafalle', 0, NULL, '2023-02-22 21:56:54', 466, 1, b'1', '3165372483', '', ''),
(273, 'Mirluy ', 'Salazar Díaz ', 58, '1964-11-21', '2023-02-22 21:56:54', 466, 3, b'1', '3174118265', '', ''),
(274, 'Adriana ', 'vasques balanta', 50, '1973-01-25', '2023-02-22 22:05:13', 105, 1, b'1', '3135492955', '', ''),
(275, 'gustavo', 'candelo', 47, '1975-10-31', '2023-02-22 22:05:13', 105, 5, b'1', '3105222672', '', ''),
(276, 'Esteban', 'Sardi Fernández ', 22, '2000-08-31', '2023-02-22 22:09:20', 456, 4, b'1', '3146516247', '', ''),
(277, 'Julián alberto', 'Ortiz fernandez', 0, NULL, '2023-02-22 22:09:20', 456, 4, b'1', '3164639255', '', ''),
(278, 'EMMANUEL', ' CALDERON LARRAHONDO', 6, '2017-01-18', '2023-02-23 01:49:06', 185, 4, b'1', '3175900112', '', ''),
(279, 'JULIO CESAR', 'CALDERON VALENCIA', 43, '1980-02-19', '2023-02-23 01:49:06', 185, 1, b'1', '5166431', '', ''),
(280, 'YURI ALEJANDRA', 'GRUESO DIAZ', 36, '1986-12-09', '2023-02-23 01:57:14', 421, 1, b'1', '3117747113', '', ''),
(281, 'LUCIANA', 'SALDAÑA GRUESO', 8, '2014-04-14', '2023-02-23 01:57:14', 421, 4, b'1', '3117747113', '', ''),
(282, 'VALERIA', 'SALDAÑA GRUESO', 8, '2014-04-14', '2023-02-23 01:57:14', 421, 4, b'1', '3117747113', '', ''),
(283, 'Oscar Marino', 'Rodriguez Uribe', 44, '1978-09-20', '2023-02-23 02:16:17', 152, 1, b'1', '3128880130', '', ''),
(284, 'Manuela ', 'Rodríguez Izquierdo', 18, '2004-07-21', '2023-02-23 02:23:11', 316, 4, b'1', '3163487119', '', ''),
(285, 'Juan Camilo ', 'Rodríguez Izquierdo ', 25, '1997-07-26', '2023-02-23 02:23:11', 316, 4, b'1', '3163487119', '', ''),
(286, 'Luis Alfredo ', 'Rodríguez Saucedo', 61, '1961-05-31', '2023-02-23 02:23:11', 316, 1, b'1', '3043536286', '', ''),
(287, 'Rubí ', 'Rocha Gomez', 57, '1965-09-16', '2023-02-23 02:35:34', 10, 3, b'1', '5921122', '', ''),
(288, 'Carlos Roberto', 'Castañeda', 61, '1961-11-16', '2023-02-23 02:35:34', 10, 2, b'1', '3014201353', '', ''),
(289, 'Carlos Andres', 'Castañeda Rocha ', 34, '1988-06-01', '2023-02-23 02:35:34', 10, 5, b'1', '3166641122', '', ''),
(290, 'Matias', 'Mafla Colina', 7, '2015-04-15', '2023-02-23 02:40:48', 274, 4, b'1', '3167267777', '', ''),
(291, 'JAIME', 'MARULANDA G', 68, '1954-03-16', '2023-02-23 02:56:19', 336, 1, b'1', '3006087195', '', ''),
(299, 'ghgh', 'ghjg', 28, '2023-02-27', '2023-02-25 18:14:08', 597, 3, b'0', '', '', ''),
(300, 'ALBA MYRIAM ', 'PINZON PARRA', 74, '1948-05-28', '2023-02-26 00:42:18', 78, 3, b'1', '3207945529', '', ''),
(301, 'NESTOR ASMEDT', 'HERRERA PINZON', 56, '1966-07-21', '2023-02-26 00:42:18', 78, 5, b'1', '3229344205', '', ''),
(302, 'NULSON HERNAN', 'HERRERA PINZON', 50, '1972-11-15', '2023-02-26 00:42:18', 78, 5, b'1', '3166264585', '', ''),
(303, 'WALTER DIGERMAN', 'HERRERA PINZON', 48, '1974-05-15', '2023-02-26 00:42:18', 78, 5, b'1', '3162329218', '', ''),
(304, 'Elías David', 'Mesa villada ', 38, '1984-08-07', '2023-02-26 00:48:21', 25, 1, b'1', '3216247976', '', ''),
(305, 'Alejandro ', 'Patiño Aza', 28, '1994-08-07', '2023-02-26 00:48:21', 25, 4, b'1', '3105902686', '', ''),
(306, 'Gloria ', 'Reyes ', 66, '1956-08-07', '2023-02-26 00:48:21', 25, 3, b'1', '3216227902', '', ''),
(307, 'Lina vanessa', 'Aza Reyes ', 33, '1989-02-28', '2023-02-26 00:48:21', 25, 5, b'1', '3217189163', '', ''),
(308, 'Juan David ', 'Olaya ', 30, '1992-03-30', '2023-02-26 00:58:38', 341, 4, b'1', '3128879044', '', ''),
(309, 'Andrés Camilo ', 'Olaya Restrepo ', 26, '1996-04-09', '2023-02-26 00:58:38', 341, 4, b'1', '3128879044', '', ''),
(310, 'Kelly Yohana ', 'Henao toconas', 21, '2001-05-09', '2023-02-26 00:58:38', 341, 6, b'1', '3205021846', '', ''),
(311, 'Luisa Fernanda ', 'Uribe ', 32, '1990-10-09', '2023-02-26 01:04:36', 424, 1, b'1', '3146380948', '', ''),
(312, 'Mercedes ', 'Campo', 0, NULL, '2023-02-26 01:04:36', 424, 3, b'1', '3117363285', '', ''),
(316, 'Janeth', 'Daza vidal', 0, NULL, '2023-02-26 01:12:03', 194, 1, b'1', '3175310190', '', ''),
(317, 'Isabella ', 'González Daza', 19, '2003-03-05', '2023-02-26 01:12:03', 194, 4, b'1', '3172273971', '', ''),
(318, 'Valentina', 'González Marles', 0, NULL, '2023-02-26 01:12:03', 194, 4, b'1', '3172273971', '', ''),
(319, 'Yolanda  ', 'Rengifo García', 72, '1950-06-16', '2023-02-26 01:12:03', 194, 6, b'1', '2883398', '', ''),
(320, 'Diana Lorena ', 'Mejia morcillo', 0, NULL, '2023-02-26 01:17:39', 81, 1, b'1', '3147213119', '', ''),
(321, 'Ana Sofía ', 'Camilo mejia ', 0, NULL, '2023-02-26 01:17:39', 81, 4, b'1', '3147213119', '', ''),
(322, 'DIANA CAROLINA', 'OCORO ESCOBAR', 28, '1994-09-10', '2023-02-26 01:37:38', 598, 4, b'1', '3148428446', '', ''),
(323, 'MARIA VICTORIA', 'CANO OROZCO', 65, '1957-05-04', '2023-02-26 01:37:38', 598, 3, b'1', '3128903767', '', ''),
(324, 'JULIO CESAR', 'ESCOBAR CANO', 34, '1988-04-03', '2023-02-26 01:37:38', 598, 5, b'1', '3166268796', '', ''),
(325, 'EDWRAD', 'ESCOBAR CANO', 43, '1979-05-31', '2023-02-26 01:37:38', 598, 5, b'1', '3166268796', '', ''),
(326, 'Esmeralda ', 'Mosquera Benites ', 49, '1973-10-19', '2023-02-26 01:43:01', 242, 1, b'1', '3128153774', '', ''),
(327, 'Javier Andres ', 'Montaño Mosquera ', 30, '1992-07-10', '2023-02-26 01:43:01', 242, 4, b'1', '3128153774', '', ''),
(328, 'Jhan Carlos', 'Montaño Mosquera ', 20, '2002-05-29', '2023-02-26 01:43:01', 242, 4, b'1', '3206579776', '', ''),
(329, 'Consuelo ', 'Ordóñez ', 0, NULL, '2023-02-26 02:16:43', 270, 3, b'1', '3105114089', '', ''),
(332, 'Prueba', 'Familiar', 0, '2023-02-27', '2023-02-27 23:03:40', 597, 3, b'0', '', '', ''),
(333, 'Yeni sorani', 'Jimenez', 37, '1985-10-12', '2023-02-28 00:07:10', 176, 1, b'1', '3158500233', '', ''),
(334, 'Ismeni', 'Gutiérrez ', 69, '1953-11-21', '2023-02-28 00:07:10', 176, 3, b'1', '3155537102', '', ''),
(335, 'Matías ', 'Gutiérrez  Jiménez ', 10, '2013-02-19', '2023-02-28 00:07:10', 176, 4, b'1', '3155537102', '', ''),
(336, 'Martin', 'Gutiérrez jimenez', 1, '2022-01-08', '2023-02-28 00:07:10', 176, 4, b'1', '3155537102', '', ''),
(337, 'Isabel ', 'Fory', 68, '1954-11-21', '2023-02-28 00:20:34', 135, 3, b'1', '3148325859', '', ''),
(338, 'Martha yane', 'Ponton', 0, NULL, '2023-02-28 00:20:34', 135, 5, b'1', '3148325859', '', ''),
(339, 'Kevin', 'LUCUMi fory', 0, NULL, '2023-02-28 00:20:34', 135, 4, b'1', '3108414025', '', ''),
(340, 'Matia ', 'LUCUMi fory', 0, NULL, '2023-02-28 00:20:34', 135, 4, b'1', '3108414025', '', ''),
(341, 'ROSA JULIANA', 'BERNAL AMEZQUITA', 5, '2017-10-10', '2023-02-28 00:45:12', 39, 4, b'1', '3136290933', '', ''),
(342, 'LISBETH YISEL', 'GUERRON AMEZQUITA', 22, '2001-01-21', '2023-02-28 00:45:12', 39, 4, b'1', '3136290933', '', ''),
(343, 'Luisa maria', 'Becerra bermudez', 0, NULL, '2023-02-28 00:52:00', 94, 4, b'1', '3014011065', '', ''),
(344, 'Aura marina ', 'Lucumi', 0, NULL, '2023-02-28 00:52:00', 94, 3, b'1', '3014011065', '', ''),
(345, 'Heidy yhoana', 'Diaz', 0, NULL, '2023-02-28 00:52:00', 94, 4, b'1', '3146097304', '', ''),
(346, 'María de los Ángeles ', 'Delgado ', 92, '1930-09-22', '2023-02-28 00:55:35', 323, 3, b'1', '3136513476', '', ''),
(347, 'Clara ', 'Rodríguez Castro', 40, '1982-10-05', '2023-02-28 01:54:18', 559, 1, b'1', '3167504735', '', ''),
(348, 'Maria Jose', 'Rodriguez', 20, '2002-03-15', '2023-02-28 01:54:18', 559, 6, b'1', '3167910579', '', 'hijastra'),
(349, 'Oscar javier', 'Gomez', 0, NULL, '2023-02-28 02:24:00', 325, 4, b'1', '3122338709', '', ''),
(350, 'Mariana ', 'Muñoz', 0, NULL, '2023-02-28 02:24:00', 325, 4, b'1', '3138739927', '', ''),
(351, 'Carolina', 'Montoya', 0, NULL, '2023-02-28 02:24:00', 325, 6, b'1', '3138739927', '', ''),
(352, 'Violetta', 'Sarria Sánchez ', 2, '2020-05-25', '2023-03-01 01:09:08', 433, 4, b'1', '3186720045', '', ''),
(353, 'PEDRO LUIS', 'GOMEZ DÍAZ', 61, '1961-12-14', '2023-03-01 22:29:55', 147, 1, b'1', '3137393486', '', ''),
(354, 'JHOAN MANUEL', 'VILLEGAS GARCÍA', 42, '1980-10-28', '2023-03-01 22:29:55', 147, 4, b'1', '3017828873', '', ''),
(355, 'WENDY JHOOANA ', 'VILLEGAS GARCIA', 36, '1986-08-21', '2023-03-01 22:29:55', 147, 4, b'1', '3218820109', '', ''),
(356, 'ADRIANA ', 'DURAN QUIÑONES', 54, '1968-07-27', '2023-03-01 22:37:34', 549, 3, b'1', '3104337060', '', ''),
(357, 'JOSE HERMAN ', 'ZAPATA VIVAS', 61, '1962-02-23', '2023-03-01 22:37:34', 549, 2, b'1', '3104337060', '', ''),
(358, 'JUAN FELIPE ', 'ZAPATA DURAN', 24, '1998-09-05', '2023-03-01 22:37:34', 549, 5, b'1', '3104337060', '', ''),
(359, 'JULIAN ANTONIO ', 'ZAPATA DURAN', 21, '2001-08-22', '2023-03-01 22:37:34', 549, 5, b'1', '3185756902', '', ''),
(360, 'Yolima Andrea ', 'Vallejo alban', 41, '1982-02-22', '2023-03-01 22:43:12', 71, 1, b'1', '3217784129', '', ''),
(361, 'Evelyn Tatiana ', 'Calderon vallejo', 21, '2001-10-20', '2023-03-01 22:43:12', 71, 4, b'1', '3113881274', '', ''),
(362, 'Rubiela ', 'Valencia Velasquez ', 58, '1964-08-12', '2023-03-01 22:43:12', 71, 3, b'1', '3215976717', '', ''),
(363, 'Carlos Enrique ', 'Calderon Valencia ', 40, '1982-12-03', '2023-03-01 22:43:12', 71, 5, b'1', '3147301974', '', ''),
(364, 'Jerónimo ', 'Espinosa Alvarez ', 8, '2014-08-14', '2023-03-01 22:50:29', 603, 4, b'1', '3233828564', '', ''),
(365, 'Jose  Reynelio', 'Alvarez ', 0, NULL, '2023-03-01 22:50:29', 603, 2, b'1', '3146189074', '', ''),
(366, 'Marco Antonio ', 'Herrera Giraldo ', 6, '2016-04-11', '2023-03-01 22:58:54', 604, 4, b'1', '3023564525', '', ''),
(367, 'María enid ', 'Ramirez Moralez', 66, '1956-10-12', '2023-03-01 22:58:54', 604, 3, b'1', '3023564525', '', ''),
(368, 'Martha Irene ', 'Rengifo Díaz ', 33, '1989-09-01', '2023-03-01 23:12:35', 568, 1, b'1', '3162980999', '', ''),
(369, 'Cristopher ', 'Saldaña Rengifo ', 15, '2008-01-10', '2023-03-01 23:12:35', 568, 4, b'1', '3162980999', '', ''),
(370, 'DORLI ', 'CARABALI LUCUMI', 44, '1978-03-29', '2023-03-01 23:19:28', 545, 1, b'1', '3207573286', '', ''),
(371, 'MARIA DE JESUS', 'GOMEZ DE RUA', 76, '1946-05-27', '2023-03-01 23:19:28', 545, 3, b'1', '3207573286', '', ''),
(372, 'ANA CRISTINA ', 'MINA LARRAHONDO', 22, '2000-06-05', '2023-03-01 23:29:49', 20, 6, b'1', '3114202499', '', 'NIETA'),
(373, 'Paola Andrea ', 'Quintana cuellar', 44, '1978-12-28', '2023-03-01 23:34:49', 402, 1, b'1', '3147493549', '', ''),
(374, 'Santiago ', 'Gonzalez quintana ', 20, '2002-09-26', '2023-03-01 23:34:49', 402, 4, b'1', '3147493549', '', ''),
(375, 'Andrea ', 'Gonzalez quintana ', 15, '2007-03-07', '2023-03-01 23:34:49', 402, 4, b'1', '3147493549', '', ''),
(376, 'Liam ', 'Mendez tavera ', 5, '2018-02-26', '2023-03-01 23:37:52', 222, 4, b'1', '3158095787', '', ''),
(377, 'AURA MARIA ', 'HINCAPIE', 90, '1932-03-21', '2023-03-02 00:04:33', 82, 3, b'1', '3154210427', '', ''),
(378, 'ANGELA MARIA ', 'PARRA', 40, '1982-04-29', '2023-03-02 00:04:33', 82, 4, b'1', '3163621213', '', ''),
(379, 'JORGE ALBERTO', 'PARRA', 39, '1983-08-30', '2023-03-02 00:04:33', 82, 4, b'1', '3163621213', '', ''),
(380, 'BLANCA LIZETH', 'PARRA', 44, '1978-03-26', '2023-03-02 00:04:33', 82, 4, b'1', '3163621213', '', ''),
(381, 'Skarlett Samantha ', 'Palacios Mantilla', 4, '2018-11-22', '2023-03-02 00:10:55', 371, 4, b'1', '3113331161', '', ''),
(382, 'María de Jesús ', 'Palacios Cordoba', 64, '1958-09-13', '2023-03-02 00:10:55', 371, 3, b'1', '3117092241', '', ''),
(383, 'Manuela ', 'Muñoz Guzman', 21, '2001-06-13', '2023-03-02 00:18:29', 186, 4, b'1', '3117614554', '', ''),
(384, 'Nini Jhoana ', 'Muñoz Guzman ', 32, '1990-11-08', '2023-03-02 00:18:29', 186, 4, b'1', '3122455088', '', ''),
(385, 'Leidy Tatiana ', 'Muñoz Guzman ', 32, '1990-11-08', '2023-03-02 00:18:29', 186, 4, b'1', '3042987814', '', ''),
(386, 'MANUELA ', 'CHILITO TELLO ', 0, '2022-10-07', '2023-03-02 00:23:08', 520, 4, b'1', '3128954449', '', ''),
(387, 'CARLOS ', 'CHILITO ENCIZO ', 0, '2022-10-07', '2023-03-02 00:23:08', 520, 1, b'1', '3116411820', '', ''),
(388, 'Adriana ', 'Martínez bedoya', 43, '1979-04-01', '2023-03-02 00:26:06', 3, 3, b'1', '3128546225', '', ''),
(389, 'Dayanna ', 'Villegas Domínguez ', 7, '2015-08-18', '2023-03-02 00:29:02', 526, 4, b'1', '3023576684', '', ''),
(390, 'Danna Sofía ', 'Cifuentes Domínguez ', 12, '2010-07-09', '2023-03-02 00:29:02', 526, 4, b'1', '3023576684', '', ''),
(391, 'Maria Ximena', 'Erazo Agudelo', 49, '1973-05-07', '2023-03-02 00:34:35', 234, 1, b'1', '3028609488', '', ''),
(392, 'Laura Alejandra', 'López Erazo', 29, '1993-12-31', '2023-03-02 00:34:35', 234, 4, b'1', '3218162216', '', ''),
(393, 'Oscar Guillermo', 'López Erazo', 26, '1997-02-26', '2023-03-02 00:34:35', 234, 4, b'1', '3025968532', '', ''),
(394, 'Camilo', 'López Erazo', 23, '1999-12-08', '2023-03-02 00:34:35', 234, 4, b'1', '3225356926', '', ''),
(395, 'José Manuel ', 'Moncada Avila ', 19, '2003-10-04', '2023-03-02 00:38:17', 22, 4, b'1', '3126755618', '', ''),
(396, 'Jimena', 'Moncada Avila ', 16, '2006-06-26', '2023-03-02 00:38:17', 22, 4, b'1', '3147366605', '', ''),
(397, 'Sonia ', 'Oidor', 0, NULL, '2023-03-02 00:40:51', 339, 5, b'1', '3208895138', '', ''),
(398, 'DIEGO FERNANDO ', 'HERNANDEZ GONZALEZ', 46, '1976-11-20', '2023-03-02 00:45:15', 73, 1, b'1', '3137785551', '', ''),
(399, 'ISABEL ', 'HERNANDEZ CALERO', 29, '1994-01-03', '2023-03-02 00:45:15', 73, 4, b'1', '3192460749', '', ''),
(400, 'PAULA DANIELA', 'HERNANDEZ CALERO', 27, '1995-03-09', '2023-03-02 00:45:15', 73, 4, b'1', '3023392700', '', ''),
(401, 'Amanda', 'Martínez Machado', 53, '1969-07-30', '2023-03-02 00:50:40', 605, 3, b'1', '3212674209', '', ''),
(402, 'Javier', 'Solis Martínez', 56, '1966-05-18', '2023-03-02 00:50:40', 605, 2, b'1', '3176974370', '', ''),
(403, 'Isabella', 'Solis Martínez', 24, '1998-04-13', '2023-03-02 00:50:40', 605, 5, b'1', '3212674209', '', ''),
(404, 'ivan', 'betancourt escobar', 64, '1958-07-17', '2023-03-02 00:57:47', 100, 2, b'1', '3166086738', '', ''),
(405, 'luz marina', 'mira ruiz', 66, '1956-10-26', '2023-03-02 00:57:47', 100, 3, b'1', '3145278454', '', ''),
(406, 'diana marcela', 'betancourt mira', 35, '1987-08-27', '2023-03-02 00:57:47', 100, 5, b'1', '3162366788', '', ''),
(407, 'samuel', 'betancourt saavedra', 6, '2016-07-27', '2023-03-02 00:57:47', 100, 4, b'1', '3125082103', '', ''),
(408, 'JEAN DAVID VICTORIA ARAGON', 'VICTORIA ARAGON', 30, '1992-10-09', '2023-03-02 01:07:25', 511, 4, b'1', '3043122439', '', ''),
(409, 'KEVIN ANTONY', 'VICTORIA ARAGON', 24, '1998-06-24', '2023-03-02 01:07:25', 511, 4, b'1', '3203277162', '', ''),
(410, 'DANIELA ', 'OSPINA ZEA', 25, '1997-03-17', '2023-03-02 01:07:25', 511, 6, b'1', '3223121036', '', 'HIJASTRA'),
(411, 'XIMENA ', 'ZEA PANESSO', 47, '1976-02-02', '2023-03-02 01:07:25', 511, 1, b'1', '3166236882', '', ''),
(412, 'BLANCA INES  ', 'GONZALEZ', 50, '1972-12-23', '2023-03-02 01:12:01', 574, 1, b'1', '3246044206', '', ''),
(413, 'Maira alejandra ', 'Saldaña gonalez', 27, '1995-10-31', '2023-03-02 01:12:01', 574, 4, b'1', '3157127446', '', ''),
(414, 'Ana maria ', 'SALDAÑA SAACEDRA', 35, '1987-03-05', '2023-03-02 01:12:01', 574, 4, b'1', '3164364403', '', ''),
(415, 'Julian andres ', 'Saldaña saavedra ', 37, '1985-05-31', '2023-03-02 01:12:01', 574, 4, b'1', '3137991491', '', ''),
(416, 'Carlos andres ', 'Saldaña balanta ', 41, '1981-12-29', '2023-03-02 01:17:51', 31, 4, b'1', '3173040444', '', ''),
(417, 'AURA JIMENA ', 'CAICEDO BALANATA ', 34, '1988-08-21', '2023-03-02 01:17:51', 31, 4, b'1', '3234295140', '', ''),
(418, 'MIGUEL ANGEL ', 'CAICEDO BALANTA', 29, '1993-03-22', '2023-03-02 01:17:51', 31, 4, b'1', '7867440756', '', ''),
(421, 'Anyi nicool', 'Estacio hernandes', 22, '2000-11-02', '2023-03-02 01:28:38', 203, 4, b'1', '3194056943', '', ''),
(422, 'MARILUZ  ', 'HOYOS GUTIERREZ', 44, '1978-03-30', '2023-03-02 01:35:34', 136, 1, b'1', '3175183707', '', ''),
(423, 'VIVIAN YULIET', 'FRANCO GOMEZ', 26, '1996-07-28', '2023-03-02 01:35:34', 136, 4, b'1', '3127421444', '', ''),
(424, 'LIBA MARCELA ', 'FRANCO GOMEZ', 24, '1998-05-17', '2023-03-02 01:35:34', 136, 4, b'1', '3127586383', '', ''),
(425, 'LAURA CAMILA ', 'FRANCO BARRERA', 10, '2012-05-07', '2023-03-02 01:35:34', 136, 4, b'1', '3166835427', '', ''),
(426, 'FLOR ALBA ', 'SOLARTE ', 63, '1959-11-29', '2023-03-02 01:39:35', 480, 1, b'1', '3183581379', '', ''),
(427, 'ERICKA ', 'Valencia ', 39, '1983-10-31', '2023-03-02 01:39:35', 480, 4, b'1', '3206736379', '', ''),
(428, 'KATERINE ', 'VALENCIA', 27, '1995-03-31', '2023-03-02 01:39:35', 480, 4, b'1', '3233969203', '', ''),
(429, 'Lida marlen ', 'Vidal carabali ', 46, '1976-12-28', '2023-03-02 01:45:03', 571, 1, b'1', '3160739471', '', ''),
(430, 'Diany tatiana ', 'Zuñiga Vidal ', 27, '1995-05-23', '2023-03-02 01:45:03', 571, 4, b'1', '3145190198', '', ''),
(431, 'Lucia valentina', 'Zuñiga Vidal ', 19, '2004-01-13', '2023-03-02 01:45:03', 571, 4, b'1', '3218012406', '', ''),
(432, 'juan carlos', 'valencia trujillo', 42, '1980-05-03', '2023-03-02 01:49:20', 206, 1, b'1', '3137261647', '', ''),
(433, 'juan david ', 'valencia hernandez', 22, '2000-05-26', '2023-03-02 01:49:20', 206, 4, b'1', '3027261647', '', ''),
(434, 'miguel anyelo ', 'valencia hernandez', 16, '2007-02-03', '2023-03-02 01:49:20', 206, 4, b'1', '3148176109', '', ''),
(435, 'Marisol', 'Micolta Dosman', 46, '1976-08-07', '2023-03-02 02:01:10', 233, 1, b'1', '3136469546', '', ''),
(436, 'Juan Jose', 'Miller Micolta ', 20, '2002-05-20', '2023-03-02 02:01:10', 233, 4, b'1', '3163008686', '', ''),
(437, 'Elvia', 'Gallego de Toro', 84, '1938-07-27', '2023-03-02 02:01:10', 233, 3, b'1', '6025164592', '', ''),
(438, 'Deicy yakelin', 'Londoño gallego', 29, '1993-11-26', '2023-03-02 02:05:37', 461, 1, b'1', '3157646254', '', ''),
(439, 'Erick', 'Navia', 9, '2013-12-11', '2023-03-02 02:05:37', 461, 6, b'1', '3157646254', '', 'hijastro'),
(440, 'WILLIAN ANDRES', 'AVENDAÑO COLORADO', 24, '1999-02-04', '2023-03-02 02:09:24', 196, 4, b'1', '3215298823', '', ''),
(441, 'CARLOS JOSE ', 'AVENDAÑO COLORADO', 20, '2002-07-08', '2023-03-02 02:09:24', 196, 4, b'1', '3215236849', '', ''),
(442, 'HEIDY ', 'AVENDAÑO COLORADO', 18, '2004-05-24', '2023-03-02 02:09:24', 196, 4, b'1', '3137257918', '', ''),
(443, 'Hugo Alejandro ', 'Pirateque Perdigón ', 19, '2003-08-05', '2023-03-02 02:12:31', 384, 4, b'1', '3183363374', '', ''),
(444, 'Luna', 'Pirateque Perdigón ', 19, '2003-08-05', '2023-03-02 02:12:31', 384, 4, b'1', '3177456382', '', ''),
(445, 'FAMILIAR', 'NUMERO 1', 6, '2023-03-03', '2023-03-03 23:18:23', 606, 2, b'0', '', '', ''),
(446, 'DASDAS', 'DASDASD', 0, '2023-03-03', '2023-03-03 23:19:08', 606, 2, b'0', '', '', ''),
(447, 'sdfsdfs', 'fsdfds', 0, '2023-02-27', '2023-03-03 23:39:52', 607, 1, b'0', '', '', ''),
(449, 'fasdfa', 'fasdfas', 0, '2022-12-06', '2023-03-06 00:06:35', 610, 1, b'1', '5343453', '53334345', ''),
(450, 'fds', 'fds', 0, '2022-12-06', '2023-03-06 00:47:09', 610, 1, b'1', '3434', '4222', ''),
(451, 'fsdfs', 'sfsdf', 67, '1956-03-06', '2023-03-06 15:10:37', 608, 6, b'0', '', '', 'Otro Parentesco'),
(452, 'Jazmin Eliana ', 'Gutiérrez viafara ', 37, '1986-01-11', '2023-03-07 21:34:35', 376, 1, b'1', '3135364574', '', ''),
(453, 'Kevin David ', 'Pastrana Gutiérrez ', 19, '2003-10-06', '2023-03-07 21:34:35', 376, 4, b'1', '3135364574', '', ''),
(454, 'Jean Carlos ', 'Pastrana Gutiérrez ', 17, '2006-03-03', '2023-03-07 21:34:35', 376, 4, b'1', '3135364574', '', ''),
(455, 'Guillermo Alexis ', 'Pastrana Gutiérrez ', 8, '2014-04-03', '2023-03-07 21:34:35', 376, 4, b'1', '3135364574', '', ''),
(456, 'Adaly', 'Moreno ', 45, '1977-08-27', '2023-03-07 21:40:24', 558, 1, b'1', '3104481225', '', ''),
(457, 'Brayan', 'Rodriguez moreno ', 21, '2001-03-23', '2023-03-07 21:40:24', 558, 4, b'1', '3195979653', '', ''),
(458, 'Jhonatan ', 'Rodriguez moreno ', 16, '2006-03-09', '2023-03-07 21:40:24', 558, 4, b'1', '3219304295', '', ''),
(459, 'Luis Eduardo ', 'Rodriguez Rodríguez ', 83, '1940-01-06', '2023-03-07 21:40:24', 558, 2, b'1', '3218372301', '', ''),
(460, 'Yen Viviana', 'Tobar', 46, '1976-04-29', '2023-03-07 22:39:54', 442, 1, b'1', '3203034795', '', ''),
(461, 'Yudi Eliana', 'Rodríguez Luna', 32, '1990-09-16', '2023-03-07 22:39:54', 442, 4, b'1', '3203034795', '', ''),
(462, 'Jose Yulmer ', 'Rodríguez Luna', 39, '1983-10-20', '2023-03-07 22:39:54', 442, 4, b'1', '3203034795', '', ''),
(463, 'Sergio Duvan', 'Rodríguez Luna', 33, '1989-06-06', '2023-03-07 22:39:54', 442, 4, b'1', '3203034795', '', ''),
(464, 'Yurley ', 'Tabares Salazar', 29, '1994-01-26', '2023-03-07 22:44:24', 282, 1, b'1', '3103677592', '', ''),
(465, 'Carlos Andrés ', 'Moscoso Collazos', 40, '1982-05-19', '2023-03-07 22:44:24', 282, 4, b'1', '3184682849', '', ''),
(466, 'Luis Felipe', 'Moscoso Collazos', 36, '1986-06-18', '2023-03-07 22:44:24', 282, 4, b'1', '3225895547', '', ''),
(467, 'Diana Marcela', 'Betancourt Mira ', 35, '1987-08-27', '2023-03-07 22:51:28', 46, 1, b'1', '3162366788', '', ''),
(468, 'Maria Juliana', 'Aragon Betancourt ', 21, '2001-12-22', '2023-03-07 22:51:28', 46, 4, b'1', '3165705210', '', ''),
(469, 'Simón ', 'Aragón Arboleda', 5, '2017-10-06', '2023-03-07 23:18:14', 45, 4, b'1', '3107404389', '', ''),
(470, 'Diana Carolina ', 'Arboleda Nieto ', 38, '1984-06-11', '2023-03-07 23:18:14', 45, 1, b'1', '3107404389', '', ''),
(471, 'Walter ', 'Aragón Mafla', 62, '1960-10-28', '2023-03-07 23:18:14', 45, 2, b'1', '3164016359', '', ''),
(472, 'MARIA FERNANDA ', 'MOSQUERA DIAZ', 42, '1980-10-13', '2023-03-07 23:24:32', 123, 1, b'1', '3153203233', '', ''),
(473, 'CRISTIAN DAVID ', 'CHAGUENDO MOSQUERA', 15, '2007-09-09', '2023-03-07 23:24:32', 123, 4, b'1', '3155370821', '', ''),
(474, 'JHOAN STIVEN ', 'CHAGUENDO MOSQUERA', 11, '2011-09-18', '2023-03-07 23:24:32', 123, 4, b'1', '3175064592', '', ''),
(475, 'KEVIN ANDRES', 'CHAGUENDO MOLINERO', 24, '1998-08-27', '2023-03-07 23:24:32', 123, 4, b'1', '3178629433', '', ''),
(476, 'Nancy  ', ' Rodriguez syala', 61, '1961-06-16', '2023-03-07 23:28:30', 471, 1, b'1', '3207643259', '', ''),
(477, 'Maria del mar ', 'Urbano rodriguez', 29, '1993-03-15', '2023-03-07 23:28:30', 471, 4, b'1', '3164928912', '', ''),
(478, 'Daniela', 'Urbano rodriguez', 27, '1995-12-09', '2023-03-07 23:28:30', 471, 4, b'1', '3183853717', '', ''),
(479, 'Andres jose', 'Urbano rodriguez', 24, '1998-08-17', '2023-03-07 23:28:30', 471, 4, b'1', '3207643259', '', ''),
(480, 'Carmenza ', 'Ocoro de Marulanda ', 65, '1957-12-18', '2023-03-07 23:32:08', 338, 1, b'1', '3006530838', '', ''),
(481, 'Eduardo', 'Hernández bedoya ', 0, NULL, '2023-03-07 23:36:18', 197, 4, b'1', '3218200978', '', ''),
(482, 'Lesly', 'Bedoya ', 0, NULL, '2023-03-07 23:36:18', 197, 1, b'1', '3218200978', '', ''),
(483, 'Mónica ', 'Arango Solarte ', 0, NULL, '2023-03-07 23:40:18', 368, 1, b'1', '3156539193', '', ''),
(484, 'María Camila ', 'ladino arango', 0, NULL, '2023-03-07 23:40:18', 368, 4, b'1', '3156539193', '', ''),
(485, 'Jean paolo', 'Ladino arango', 0, NULL, '2023-03-07 23:40:18', 368, 4, b'1', '3156539193', '', ''),
(486, 'Carmelita', 'Buitrago Guacheta', 43, '1980-01-07', '2023-03-07 23:45:00', 569, 1, b'1', '3185700075', '', ''),
(487, 'Julián Eduardo ', 'Zúñiga Buitrago ', 21, '2001-12-01', '2023-03-07 23:45:00', 569, 4, b'1', '3185700075', '', ''),
(488, 'Juan Pablo ', 'Zúñiga Buitrago ', 16, '2006-10-01', '2023-03-07 23:45:00', 569, 4, b'1', '3185700075', '', ''),
(489, 'Sara', 'Zúñiga Rodríguez ', 14, '2008-09-06', '2023-03-07 23:45:00', 569, 4, b'1', '3175307099', '', ''),
(490, 'GLADYS', 'GARCÍA RIVERA', 64, '1958-09-26', '2023-03-07 23:49:45', 151, 5, b'1', '3013353052', '', ''),
(491, 'ELIZABETH ', 'RIVERA GARCÍA', 68, '1954-07-20', '2023-03-07 23:49:45', 151, 5, b'1', '3013353052', '', ''),
(492, 'Said Arturo ', 'Parra muñoz', 0, '2022-07-10', '2023-03-07 23:55:53', 375, 4, b'1', '3152156965', '', ''),
(493, 'Sandra Patricia ', 'Parra duran ', 0, NULL, '2023-03-07 23:55:53', 375, 5, b'1', '3045896071', '', ''),
(494, 'MARIA DEL MAR ', 'CAMPO MAFLA', 10, '2012-09-29', '2023-03-07 23:59:46', 85, 4, b'1', '3168310491', '', ''),
(495, 'angelica jhoana ', 'fonseca arias ', 0, NULL, '2023-03-08 00:03:54', 359, 1, b'1', '3012323298', '', ''),
(496, 'sara isabel ', 'escobar tobar', 1, '2022-02-21', '2023-03-08 00:03:54', 359, 4, b'1', '3167199247', '', ''),
(497, 'BERTHA ELENA', 'ROSERO ARTEAGA', 67, '1955-04-23', '2023-03-08 00:09:14', 303, 3, b'1', '3022576384', '', ''),
(498, 'JUANITA JUDITH', 'MUÑOZ ARTEAGA', 45, '1977-07-23', '2023-03-08 00:09:14', 303, 5, b'1', '3177299173', '', ''),
(499, 'MIRYAM', 'VEGA ARCE', 70, '1952-12-24', '2023-03-08 00:15:28', 114, 3, b'1', '3173459277', '', ''),
(500, 'ANGIE MARCELA', 'BETANCOURT CRUZ', 21, '2001-12-30', '2023-03-08 00:15:28', 114, 4, b'1', '3173459277', '', ''),
(501, 'Noralba ', 'Velasco', 50, '1972-09-28', '2023-03-08 00:21:25', 611, 3, b'1', '3202811698', '', ''),
(502, 'Eduard ', 'Lucumí', 54, '1968-06-20', '2023-03-08 00:21:25', 611, 2, b'1', '3202811698', '', ''),
(503, 'Sandra Milena', 'Lucumí Velasco', 31, '1991-12-24', '2023-03-08 00:21:25', 611, 5, b'1', '3117531554', '', ''),
(504, 'Aldemar ', 'López Pisso', 66, '1956-04-05', '2023-03-08 00:29:57', 211, 1, b'1', '3216393992', '', ''),
(505, 'Jenny Fabiana ', 'López León ', 40, '1982-04-17', '2023-03-08 00:29:57', 211, 4, b'1', '3153369056', '', ''),
(506, 'Karen ', 'Casas Rosero', 38, '1984-12-13', '2023-03-08 00:36:02', 446, 6, b'1', '3215914487', '', 'COMPAÑERA'),
(507, 'Rosa Elena ', 'Pulgarin De Roman', 70, '1952-12-07', '2023-03-08 00:36:02', 446, 3, b'1', '3052969606', '', ''),
(508, 'Francisco ', 'Román Cabra', 71, '1951-07-24', '2023-03-08 00:36:02', 446, 2, b'1', '3052969606', '', ''),
(509, 'EMELDA ', 'GONZALEZ', 77, '1945-09-10', '2023-03-08 00:39:15', 185, 3, b'1', '3187936337', '', ''),
(510, 'Mariana', 'Garcia Usma', 10, '2012-10-24', '2023-03-08 00:42:51', 153, 4, b'1', '3115150060', '', ''),
(511, 'Maria del Pilar', 'Cañas Sandoval', 54, '1968-08-18', '2023-03-08 00:42:51', 153, 1, b'1', '3115150060', '', ''),
(528, 'Jaime ', 'Quinayas C', 51, '1971-06-13', '2023-03-09 00:18:37', 539, 1, b'1', '3164010141', '', ''),
(529, 'Lina Fernanda ', 'Quinayas Torres', 26, '1996-11-10', '2023-03-09 00:18:37', 539, 4, b'1', '3164010141', '', ''),
(530, 'Elian Yessid', 'Quinayas Torres', 23, '1999-07-29', '2023-03-09 00:18:37', 539, 4, b'1', '3205051200', '', ''),
(531, 'Evelyn Juliana', 'Quinayas Torres ', 21, '2001-07-25', '2023-03-09 00:18:37', 539, 4, b'1', '3173968912', '', ''),
(535, 'Marian', 'Torres Vivas', 20, '2002-06-20', '2023-03-09 00:21:48', 534, 4, b'0', '', '', ''),
(536, 'Laura Sofia', 'Guerrero Cardenas', 13, '2009-03-19', '2023-03-09 00:27:19', 113, 4, b'1', '3186750106', '', ''),
(537, 'Ana Carolina ', 'Romo Cardenas', 22, '2000-06-13', '2023-03-09 00:27:19', 113, 4, b'1', '3154625715', '', ''),
(538, 'Bairon Orlando ', 'Guerrero Caicedo', 52, '1971-01-10', '2023-03-09 00:27:19', 113, 1, b'1', '3174738037', '', ''),
(539, 'Veronica ', 'Cardenas Rendon', 51, '1971-05-01', '2023-03-09 00:27:19', 113, 5, b'1', '3206184705', '', ''),
(541, 'dsadad', 'otro famailiar', 28, '1995-03-12', '2023-03-12 16:22:30', 608, 6, b'0', '', '', 'Familia'),
(543, 'Robin Alejandro ', 'Choco Olaya ', 34, '1988-04-06', '2023-03-13 18:19:24', 612, 4, b'1', '34643963162', '', ''),
(544, 'Valentina ', 'Fory Olaya', 26, '1997-02-01', '2023-03-13 18:19:24', 612, 4, b'1', '3219951180', '', ''),
(545, 'MERCEDES', 'RODRIGUEZ MANZANO', 66, '1956-04-22', '2023-03-13 18:23:11', 425, 3, b'1', '3225117441', '', '');
INSERT INTO `nucleo_familiar` (`id_nucleofamiliar`, `nombres`, `apellidos`, `edad`, `fecha_nacimiento`, `fecha_upd`, `id_funcionario`, `id_parentesco`, `is_emergencia`, `contacto`, `contacto_2`, `parentesco`) VALUES
(546, 'CARLOS ARTURO', 'ROLDAN SAAVEDRA', 50, '1973-01-15', '2023-03-13 18:30:36', 272, 1, b'1', '3174544182', '', ''),
(547, 'ANGIE VIVIANA', 'VALOIS IBARGUE ', 27, '1995-10-04', '2023-03-13 18:30:36', 272, 4, b'1', '3163179620', '', ''),
(548, 'JULIANA ANDREA ', 'VALOIS IBARGUEN', 25, '1997-10-01', '2023-03-13 18:30:36', 272, 4, b'1', '3155212030', '', ''),
(549, 'JHON JAMINTON', 'VALOIS IBARGUEN', 23, '1999-05-27', '2023-03-13 18:30:36', 272, 4, b'1', '3155212030', '', ''),
(550, 'Leidi lorena ', 'Laguna diaz', 38, '1984-11-26', '2023-03-13 18:47:06', 190, 1, b'1', '3127568821', '', ''),
(551, 'Juliana', 'Collazos laguna', 15, '2008-03-13', '2023-03-13 18:47:06', 190, 4, b'1', '3216933458', '', ''),
(552, 'Sara Isabel ', 'Velasco Borre', 9, '2013-06-18', '2023-03-13 18:53:18', 55, 4, b'1', '3123573113', '', ''),
(553, 'María Lucía ', 'Velasco Borre', 1, '2021-06-08', '2023-03-13 18:53:18', 55, 4, b'1', '3123573113', '', ''),
(554, 'Miguel armando ', 'Velasco Gómez ', 50, '1972-08-24', '2023-03-13 18:53:18', 55, 1, b'1', '3165355309', '', ''),
(555, 'Isabella ', 'Martinez velez', 18, '2004-04-08', '2023-03-13 18:59:35', 327, 4, b'1', '3183703589', '', ''),
(556, 'Nicolas ', 'Martinez', 12, '2010-09-08', '2023-03-13 18:59:35', 327, 4, b'1', '3183703589', '', ''),
(557, 'Cristina ', 'Benitez', 0, NULL, '2023-03-13 18:59:35', 327, 1, b'1', '3183703589', '', ''),
(558, 'JESSICA VICTORIA', 'SEPULVEDA MAYOR', 31, '1991-08-23', '2023-03-13 19:08:48', 350, 4, b'1', '3166925346', '', ''),
(559, 'JUAN SEBASTIAN ', 'ROA  MAYOR', 23, '1999-03-24', '2023-03-13 19:08:48', 350, 4, b'1', '3176799805', '', ''),
(560, 'DAVID SANTIAGO ', 'ROA MAYOR', 18, '2004-08-24', '2023-03-13 19:08:48', 350, 4, b'1', '3163483862', '', ''),
(561, 'JUAN ESTEBAN', 'ROA', 58, '1964-06-17', '2023-03-13 19:08:48', 350, 1, b'1', '3166925346', '', ''),
(562, 'Cristóbal ', 'Martinez Castro ', 2, '2020-12-26', '2023-03-13 19:13:06', 333, 4, b'1', '3183896225', '', ''),
(563, 'Luz Marina ', 'Rengifo Quijano ', 66, '1956-12-20', '2023-03-13 19:25:11', 348, 1, b'1', '3152192964', '', ''),
(564, 'Johan Sebastián ', 'Tombe Rivera', 19, '2004-01-08', '2023-03-13 19:25:11', 348, 6, b'1', '3163689359', '', 'NIETO'),
(565, 'Nelly  ', 'Cifuentes morales', 40, '1982-06-24', '2023-03-13 19:45:09', 361, 1, b'1', '3105325001', '', ''),
(566, 'Gabriela', 'Escobar gonzales', 21, '2001-10-23', '2023-03-13 19:45:09', 361, 4, b'1', '3108918000', '', ''),
(567, 'JUAN SEBASTIAN ', 'LAGUNA RUBIANO', 17, '2006-01-26', '2023-03-13 19:53:50', 184, 4, b'1', '3128258789', '', ''),
(568, 'JUANITA', 'LAGUNA RUBIANO', 5, '2018-03-05', '2023-03-13 19:53:50', 184, 4, b'1', '3137244157', '', ''),
(569, 'FARY ANDREA', 'RUBIANO MUELAS', 37, '1985-07-06', '2023-03-13 19:53:50', 184, 1, b'1', '3137244157', '', ''),
(570, 'DORAYDA ', 'DIAZ CHARRIA', 60, '1962-12-09', '2023-03-13 19:53:50', 184, 3, b'1', '3145168094', '', ''),
(571, 'DIANA MARCELA', 'BETANCOURT MIRA', 35, '1987-08-27', '2023-03-13 19:58:56', 613, 1, b'1', '3162366788', '', ''),
(572, 'AMANDA ', 'VIVEROS ZAPATA', 54, '1968-03-19', '2023-03-13 20:22:58', 43, 1, b'1', '3188772371', '', ''),
(573, 'LISBETH', 'APONZA VIVEROS', 37, '1985-09-24', '2023-03-13 20:22:58', 43, 4, b'1', '3108956499', '', ''),
(574, 'DIDIMO ', 'APONZA VIVEROS', 31, '1991-11-21', '2023-03-13 20:22:58', 43, 4, b'1', '3215630106', '', ''),
(575, 'MARIA SELMIRA', 'COMETA', 74, '1948-05-27', '2023-03-13 20:26:32', 293, 3, b'1', '3177585463', '', ''),
(576, 'OSCAR', 'CUARTAS VALENCIA', 70, '1952-11-24', '2023-03-13 20:26:32', 293, 2, b'1', '3105345545', '', ''),
(577, 'DANIELA ', 'BARONA COLLAZOS', 27, '1995-09-01', '2023-03-13 20:30:10', 64, 4, b'1', '3206567804', '', ''),
(578, 'JACOBO', 'BARONA ZUÑIGA', 2, '2020-07-20', '2023-03-13 20:30:10', 64, 4, b'1', '316334021', '', ''),
(579, 'vanessa ', 'acevedo vargas', 36, '1987-01-24', '2023-03-13 20:34:58', 532, 1, b'1', '3160672412', '', ''),
(580, 'SARA', 'TORRES ACEVEDO', 14, '2008-12-24', '2023-03-13 20:34:58', 532, 4, b'1', '3166559733', '', ''),
(581, 'SAMUEL', 'TORRES ACEVEDO', 12, '2010-09-02', '2023-03-13 20:34:58', 532, 4, b'1', '3166559733', '', ''),
(582, 'DIEGO ANDRES', 'IBAGON HENAO', 37, '1986-01-04', '2023-03-13 20:44:07', 28, 4, b'1', '3172116038', '', ''),
(583, 'SANTOS ', 'IBAGON RODRIGUEZ', 68, '1954-04-16', '2023-03-13 20:44:07', 28, 1, b'1', '3177508494', '', ''),
(584, 'ANTONELLA', 'IBAGON TASCA', 2, '2021-01-25', '2023-03-13 20:44:07', 28, 6, b'1', '3174782020', '', 'NIETA'),
(585, 'BRITANY', 'IBAGON TASCA', 8, '2014-03-29', '2023-03-13 20:44:07', 28, 6, b'1', '3174782020', '', 'NIETA'),
(586, 'Leonor', 'Ramírez Serna', 61, '1962-03-08', '2023-03-13 22:09:35', 84, 1, b'1', '3113799979', '', ''),
(587, 'Carlos Andres', 'Bejarano Ramírez ', 32, '1990-12-17', '2023-03-13 22:09:35', 84, 4, b'1', '3207631267', '', ''),
(588, 'Andrés Felipe ', 'Bejarano Ramírez ', 26, '1996-05-15', '2023-03-13 22:09:35', 84, 4, b'1', '3137286118', '', ''),
(589, 'Humberto ', 'Herrera Montoya', 70, '1953-01-09', '2023-03-13 22:15:31', 221, 2, b'1', '3114725990', '', ''),
(590, 'Ydali', 'Medina Restrepo', 73, '1949-06-20', '2023-03-13 22:15:31', 221, 3, b'1', '3187992347', '', ''),
(591, 'Daniel Steven', 'Palante Herrera', 24, '1998-08-23', '2023-03-13 22:15:31', 221, 4, b'1', '3155610613', '', ''),
(592, 'Alessandro', 'Herrera Medina', 15, '2007-06-17', '2023-03-13 22:15:31', 221, 4, b'1', '3155610613', '', ''),
(593, 'Gloria Fernanda ', 'Espitia Salcedo', 55, '1967-08-21', '2023-03-13 22:21:20', 531, 1, b'1', '3186266673', '', ''),
(594, 'Wilfred', 'Wagner Espitia', 31, '1991-11-11', '2023-03-13 22:21:20', 531, 4, b'1', '3154352733', '', ''),
(595, 'María Fernanda', 'Wagner Espitia ', 29, '1993-09-01', '2023-03-13 22:21:20', 531, 4, b'1', '3183665238', '', ''),
(596, 'Gloria Fernanda ', 'Espitia Salcedo', 55, '1967-08-21', '2023-03-13 22:22:03', 531, 1, b'1', '3186266673', '', ''),
(597, 'Wilfred', 'Wagner Espitia', 31, '1991-11-11', '2023-03-13 22:22:03', 531, 4, b'1', '3154352733', '', ''),
(598, 'María Fernanda', 'Wagner Espitia ', 29, '1993-09-01', '2023-03-13 22:22:03', 531, 4, b'1', '3183665238', '', ''),
(599, 'Ydali', 'Medina Restrepo', 73, '1949-06-20', '2023-03-13 22:27:44', 227, 1, b'1', '3187992347', '', ''),
(600, 'Paula Andrea ', 'Herrera Medina', 46, '1976-03-31', '2023-03-13 22:27:44', 227, 4, b'1', '3155610613', '', ''),
(601, 'Alessandro', 'Herrera Medina', 15, '2007-06-17', '2023-03-13 22:27:44', 227, 6, b'1', '3155610613', '', 'NIETO'),
(602, 'Daniel Steven', 'Palante Herrera', 24, '1998-08-23', '2023-03-13 22:27:44', 227, 6, b'1', '3155610613', '', 'NIETO'),
(603, 'ARBEY ', 'CALAMBAS', 50, '1972-03-17', '2023-03-13 22:33:16', 321, 4, b'1', '3152491296', '', ''),
(604, 'LEONEL ', 'CALAMBAS', 49, '1974-03-03', '2023-03-13 22:33:16', 321, 4, b'1', '6022690443', '', ''),
(605, 'MARIAAMALIA', 'TAQUINAS UEJE', 69, '1953-05-06', '2023-03-13 22:33:16', 321, 1, b'1', '6022690443', '', ''),
(606, 'Leidy Yuriany ', 'Ramos Cortaza', 35, '1987-12-21', '2023-03-13 22:38:34', 614, 1, b'1', '3233906179', '', ''),
(607, 'Mateo ', 'Mancilla Ortiz', 20, '2002-04-04', '2023-03-13 22:38:34', 614, 4, b'1', '3168935394', '', ''),
(608, 'Sonia ', 'Collazos Hernandez ', 65, '1957-07-27', '2023-03-13 22:43:14', 285, 3, b'1', '3184682849', '', ''),
(609, 'Diana Paola ', 'Machado Collazos', 29, '1993-06-11', '2023-03-13 22:43:14', 285, 5, b'1', '3233285975', '', ''),
(610, 'Luis Felipe ', 'Moscoso Collazos ', 36, '1986-06-18', '2023-03-13 22:43:14', 285, 5, b'1', '3184682849', '', ''),
(611, 'LEYDI LORENA', 'ZUÑIGA ECHEVERRI', 37, '1985-06-18', '2023-03-13 22:48:13', 351, 4, b'1', '3122992214', '', ''),
(612, 'DANNA GISELL', 'ZUÑIGA ECHEVERRI', 18, '2004-09-27', '2023-03-13 22:48:13', 351, 6, b'1', '3147432661', '', 'NIETA'),
(613, 'Juan Sebastián ', 'Rodríguez Peláez ', 25, '1997-08-20', '2023-03-13 22:51:53', 435, 4, b'1', '3168002581', '', ''),
(614, 'Rodrigo ', 'Rodríguez Pélaez ', 21, '2001-09-03', '2023-03-13 22:51:53', 435, 4, b'1', '3168002581', '', ''),
(615, 'Leslie Valeria ', 'Ríos Fernandez', 19, '2003-10-13', '2023-03-13 22:55:56', 410, 4, b'1', '3165101008', '', ''),
(616, 'María teresa', 'Ríos Velasco ', 59, '1963-10-23', '2023-03-13 22:55:56', 410, 5, b'1', '3128524647', '', ''),
(617, 'Piedad', 'Gómez de Martínez ', 65, '1958-02-09', '2023-03-13 23:04:16', 615, 3, b'1', '3152679625', '', ''),
(618, 'Maricela ', 'Lasso Saldaña', 48, '1974-04-26', '2023-03-13 23:20:05', 616, 1, b'1', '3128232591', '', ''),
(619, 'Evelyn Daniela', 'Calero Vásquez ', 20, '2003-01-23', '2023-03-13 23:27:57', 484, 4, b'1', '3165680710', '', ''),
(620, 'Jonatán David', 'Calero Vásquez', 14, '2008-04-30', '2023-03-13 23:27:57', 484, 4, b'1', '3166225765', '', ''),
(621, 'Neil Armstrong', 'Calero Padilla', 53, '1969-10-30', '2023-03-13 23:27:57', 484, 1, b'1', '3166225765', '', ''),
(622, 'WALTER JUNIOR', 'CARABALI ARBOLEDA', 31, '1992-01-30', '2023-03-13 23:33:02', 50, 4, b'1', '3157942565', '', ''),
(623, 'LAURA DEL MAR', 'CARABALI ARBOLEDA', 29, '1994-02-19', '2023-03-13 23:33:02', 50, 4, b'1', '3174446591', '', ''),
(624, 'Yolanda ', 'Mina Cantillo', 59, '1963-09-03', '2023-03-13 23:38:34', 142, 3, b'1', '3183793592', '', ''),
(625, 'Melcy Esperanza', 'Lozano Tovar ', 43, '1979-10-04', '2023-03-13 23:49:23', 617, 5, b'1', '3184299878', '', ''),
(626, 'Luciano ', 'Taborda Valencia ', 5, '2017-09-27', '2023-03-13 23:58:50', 618, 4, b'1', '3105987596', '', ''),
(627, 'Gilmar Adrian ', 'Taborda Largo ', 30, '1992-07-15', '2023-03-13 23:58:50', 618, 1, b'1', '3187081603', '', ''),
(628, 'Nancy ', 'Taborda Largo', 0, NULL, '2023-03-13 23:58:50', 618, 4, b'1', '3176799805', '', ''),
(629, 'DAVID SANTIAGO', 'ROA MAYOR', 18, '2004-08-25', '2023-03-13 23:58:50', 618, 4, b'1', '3163483862', '', ''),
(630, 'ROLANDO ', 'BARBERAN ', 59, '1963-11-17', '2023-03-16 21:25:34', 444, 1, b'1', '3217229684', '', ''),
(631, 'LAURA SOFIA ', 'BARBERAN RODRIGUEZ ', 11, '2011-06-16', '2023-03-16 21:25:34', 444, 4, b'1', '3104932150', '', ''),
(632, 'ALBA LUCIA ', 'Parra Rojas ', 58, '1964-10-15', '2023-03-16 21:25:34', 444, 3, b'1', '3117103879', '', ''),
(633, 'Antonio ', 'Valencia Izquierdo ', 57, '1965-12-14', '2023-03-16 21:25:34', 444, 2, b'1', '3103738057', '', ''),
(634, 'Andres ', 'Lañas Romero', 45, '1977-10-22', '2023-03-16 21:30:39', 619, 5, b'1', '3103345815', '', ''),
(635, 'Maria Silvana', 'Lovoa Gomez', 49, '1973-11-29', '2023-03-16 21:36:03', 503, 1, b'1', '3137769242', '', ''),
(636, 'Laura', 'Escobar', 26, '1996-05-26', '2023-03-16 22:02:55', 358, 4, b'1', '3158851250', '', ''),
(637, 'GRACIELA ', 'PEREZ PEÑA', 58, '1964-11-06', '2023-03-16 22:12:35', 160, 1, b'1', '3114232011', '', ''),
(638, 'VANESA ', 'GIRALDO PEREZ', 31, '1991-05-20', '2023-03-16 22:12:35', 160, 4, b'1', '3177056471', '', ''),
(639, 'DIANA ', 'GIRALDO PEREZ', 26, '1996-09-10', '2023-03-16 22:12:35', 160, 4, b'1', '3194559353', '', ''),
(640, 'Yulieth Karolaing', 'Gonzalez Florez', 24, '1998-08-12', '2023-03-16 22:16:48', 620, 5, b'1', '3164184783', '', ''),
(641, 'Edwin Esteban ', 'Sanchez Quevedo', 16, '2006-08-19', '2023-03-16 22:52:31', 390, 4, b'1', '3154522742', '', ''),
(642, 'JUAN CAMILO', 'SILVA QUEVEDO', 27, '1996-02-27', '2023-03-16 22:52:31', 390, 4, b'1', '3127546910', '', ''),
(643, 'Manuela', 'Giraldo ', 0, NULL, '2023-03-17 01:25:59', 408, 4, b'1', '3157955988', '', ''),
(644, 'Isabella ', 'Valencia Lerma', 16, '2006-06-25', '2023-03-17 01:43:31', 212, 4, b'1', '3146434805', '', ''),
(645, 'Magnolia', 'Salazar Carmona', 61, '1961-04-06', '2023-03-17 01:43:31', 212, 3, b'1', '3234600277', '', ''),
(646, 'Alonso', 'Lerma Perez', 79, '1943-09-27', '2023-03-17 01:43:31', 212, 2, b'1', '3234600277', '', ''),
(647, 'LUZ MARIA ', 'CAZARAN CAICEDO', 59, '1963-10-22', '2023-03-17 01:59:06', 364, 1, b'1', '3147376109', '', ''),
(648, 'JOSE IVAN', 'ESCOBAR CAZARAN ', 41, '1981-12-10', '2023-03-17 01:59:06', 364, 4, b'1', '3135313779', '', ''),
(649, 'ANA LADY ', 'ESCOBAR CAZARAN ', 37, '1985-05-05', '2023-03-17 01:59:06', 364, 4, b'1', '3128949384', '', ''),
(650, 'LUIS FERNANDO ', 'ESCOBAR CAZARAN ', 37, '1986-02-05', '2023-03-17 01:59:06', 364, 4, b'1', '3107269545', '', ''),
(651, 'ARY FERNANDO', 'JOAQUI TIMANA', 38, '1984-05-28', '2023-03-18 02:31:05', 363, 4, b'1', '3216950291', '', ''),
(652, 'ANA CRISTINA', 'JOAQUI TIMANA', 35, '1987-07-24', '2023-03-18 02:31:05', 363, 4, b'1', '3122254157', '', ''),
(653, 'PORFIRIA ', 'IMBACHI DE JOAQUI', 91, '1931-10-31', '2023-03-18 02:31:05', 363, 3, b'1', '3146926437', '', ''),
(654, 'MARIA ELENA ', 'RIOS CABAL', 124, '1900-01-01', '2023-03-18 02:42:20', 621, 1, b'1', '3023768063', '', ''),
(655, 'YOLANDA ', 'VILLOTA DIAZ ', 124, '1900-01-01', '2023-03-18 02:42:20', 621, 3, b'1', '3122254157', '', ''),
(656, 'JOSE ', 'FERNANDO TRUJILLO', 56, '1966-05-22', '2023-03-18 02:49:18', 622, 2, b'1', '3113245976', '', ''),
(657, 'NELSY MARIA ', 'RODALLEGA ZAMORA', 54, '1968-06-08', '2023-03-18 02:49:18', 622, 3, b'1', '3164019824', '', ''),
(658, 'MARTINA', 'TRUJILLO CAMPO', 3, '2019-04-20', '2023-03-18 02:49:18', 622, 4, b'1', '3206494682', '', ''),
(659, 'Maria Del Carmen ', 'Rivera valencia', 82, '1940-09-16', '2023-03-18 02:54:32', 380, 3, b'1', '3004460741', '', ''),
(660, 'Cesar Augusto ', 'Peñuela Rivera ', 40, '1982-08-29', '2023-03-18 02:54:32', 380, 5, b'1', '3164019824', '', ''),
(661, ' Nora Milena', 'peñuela Rivera', 49, '1973-09-28', '2023-03-18 02:54:32', 380, 5, b'1', '3107399150', '', ''),
(662, 'ADIELA ', 'BASQUEZ LOBOA', 64, '1958-12-09', '2023-03-18 03:02:58', 544, 1, b'1', '3225969742', '', ''),
(663, 'ROSALBA ', 'ZAMORA VASQUEZ', 35, '1987-07-01', '2023-03-18 03:02:58', 544, 4, b'1', '3225969742', '', ''),
(664, 'LISBETH YISEL', 'GUERRON AMÉZQUITA', 22, '2001-01-21', '2023-03-18 03:06:42', 169, 4, b'1', '3136290933', '', ''),
(665, 'NIXA NATALIA ', 'ROJAS ACEVEDO', 33, '1989-10-26', '2023-03-18 03:11:40', 478, 1, b'1', '3028106883', '', ''),
(666, 'LENIN LEANDRO ', 'VALENCIA ROJAS', 6, '2016-03-20', '2023-03-18 03:11:40', 478, 4, b'1', '3146864634', '', ''),
(667, 'MELANY TATIANA ', 'VALENCIA VALLEJO', 16, '2007-02-01', '2023-03-18 03:11:40', 478, 4, b'1', '3146864634', '', ''),
(668, 'MARIA ISABEL', 'CASTANO VALENCIA', 77, '1945-11-25', '2023-03-18 03:11:40', 478, 3, b'1', '3146864634', '', ''),
(669, 'ISMAELINA', 'ORTEGA', 80, '1942-03-28', '2023-03-18 03:18:43', 624, 3, b'1', '3225364829', '', ''),
(670, 'gloria ines', 'pineda echeverry', 55, '1967-12-16', '2023-03-18 03:36:16', 625, 1, b'1', '3103878011', '', ''),
(671, 'juan felipe', 'guerrero pineda', 22, '2000-11-02', '2023-03-18 03:36:16', 625, 4, b'1', '3148891839', '', ''),
(672, 'juan camilo', 'guerrero pineda', 26, '1996-12-24', '2023-03-18 03:36:16', 625, 4, b'1', '3113791649', '', ''),
(673, 'Sara Idalia', 'Trujillo Bohojorge', 31, '1991-03-30', '2023-03-18 03:43:49', 387, 1, b'1', '3116028336', '', ''),
(674, 'Cesar David', 'Cantero Trujillo', 14, '2008-09-03', '2023-03-18 03:43:49', 387, 4, b'1', '3104531488', '', ''),
(675, 'JUDDY ANDREA', 'VELEZ GONZALEZ', 43, '1980-03-05', '2023-03-18 03:48:52', 208, 1, b'1', '3187870596', '', ''),
(676, 'ISABELLA GEORGINA', 'LEGARDA VELEZ', 22, '2000-11-10', '2023-03-18 03:48:52', 208, 4, b'1', '3113532122', '', ''),
(677, 'NICOLAS ', 'LEGARDA VELEZ', 19, '2003-09-01', '2023-03-18 03:48:52', 208, 4, b'1', '3113532122', '', ''),
(680, 'Alba Lucia ', ' Guerrero Matta', 60, '1962-09-04', '2023-03-22 23:52:01', 159, 1, b'1', '3165403550', '', ''),
(681, 'Jorge Andres ', 'Enriquez Guerrero', 34, '1988-06-30', '2023-03-22 23:52:01', 159, 4, b'1', '3163005927', '', ''),
(682, 'Juan Manuel', 'Enriquez Guerrero', 32, '1990-08-17', '2023-03-22 23:52:01', 159, 4, b'1', '3163005927', '', ''),
(683, 'Marleny', 'Fernandez de Enriquez ', 89, '1933-06-15', '2023-03-22 23:52:01', 159, 3, b'1', '3163005927', '', ''),
(684, 'Lady Yaneth', 'Carpio Velásquez', 39, '1983-07-22', '2023-03-22 23:58:09', 125, 1, b'1', '3184140909', '', ''),
(685, 'Sharick', 'Estupiñán Carpio', 14, '2008-07-08', '2023-03-22 23:58:09', 125, 4, b'1', '3023508956', '', ''),
(686, 'Ganrielly', 'Estupiñán Carpio', 9, '2013-09-18', '2023-03-22 23:58:09', 125, 4, b'1', '3162517970', '', ''),
(687, 'ROCIO ', 'JIMENES', 50, '1972-09-02', '2023-03-23 00:02:42', 120, 1, b'1', '3186882553', '', ''),
(688, 'MARIA ACENET  ', 'BISCUE ESCOBAR', 69, '1953-11-06', '2023-03-23 00:02:42', 120, 3, b'1', '3172401233', '', ''),
(689, 'Katherine Andrea', 'Ledesma Rendón', 39, '1983-05-05', '2023-03-23 00:08:14', 79, 1, b'1', '3005688224', '', ''),
(690, 'Juan Diego', 'Calonje Ledesma', 2, '2020-08-16', '2023-03-23 00:08:14', 79, 4, b'1', '3017716868', '', ''),
(691, 'Eduardo', 'Calonge Granja', 76, '1946-08-27', '2023-03-23 00:08:14', 79, 2, b'1', '3136146871', '', ''),
(692, 'Emilio José', 'Fernández Bravo ', 3, '2019-10-17', '2023-03-23 02:45:40', 131, 4, b'1', '3206872540', '', ''),
(693, 'Josefina ', 'Zarama', 0, NULL, '2023-03-23 02:45:40', 131, 3, b'1', '3128207769', '', ''),
(694, 'Borinken', 'restrepo marmolejo', 53, '1970-01-22', '2023-03-23 02:50:23', 310, 1, b'1', '3183122503', '', ''),
(695, 'juan david', 'cuesta restrepo', 24, '1998-12-22', '2023-03-23 02:50:23', 310, 4, b'1', '3156195182', '', ''),
(696, 'Flor Maritza ', 'Segura Angulo', 53, '1969-12-21', '2023-03-23 02:54:20', 481, 1, b'1', '3173001843', '', ''),
(697, 'Maria Camila ', 'Valencia Segura', 19, '2003-07-14', '2023-03-23 02:54:20', 481, 4, b'1', '3173001843', '', ''),
(698, 'Juan David', 'Valencia Segura', 24, '1999-01-26', '2023-03-23 02:54:20', 481, 4, b'1', '3173001843', '', ''),
(699, 'DORIS RUTH', 'MURILLO JIMENEZ', 55, '1967-08-18', '2023-03-23 03:00:05', 505, 1, b'1', '3163098629', '', ''),
(700, 'KELLY ALEXANDRA', 'SUAREZ MURILLO', 31, '1991-06-08', '2023-03-23 03:00:05', 505, 4, b'1', '3177058046', '', ''),
(701, 'VERONICA', 'SUAREZ MURILLO', 30, '1993-03-20', '2023-03-23 03:00:05', 505, 4, b'1', '3176168055', '', ''),
(702, 'JUAN SEBASTIAN', 'SUAREZ MURILLO', 27, '1995-08-30', '2023-03-23 03:00:05', 505, 4, b'1', '3163098629', '', ''),
(703, 'ESTHER EMILIA ', 'ESCOBAR VÁSQUEZ', 51, '1971-04-27', '2023-03-23 03:05:20', 464, 5, b'1', '3172831210', '', ''),
(704, 'MARGARITA', 'VÁSQUEZ', 86, '1937-01-08', '2023-03-23 03:05:20', 464, 3, b'1', '3242181567', '', ''),
(705, ' CARLOS FERNANDO ', ' ESCOBAR BENAVIDEZ', 26, '1996-06-10', '2023-03-23 03:05:20', 464, 4, b'1', '3242181567', '', ''),
(706, 'MARTÍN EMILIO', 'ESCOBAR VÁSQUEZ', 41, '1981-06-26', '2023-03-23 03:05:20', 464, 5, b'1', '3178061282', '', ''),
(707, 'Aura Elisa ', 'Salazar de Tunjo ', 88, '1935-01-12', '2023-03-23 03:08:18', 470, 3, b'1', '3173423129', '', ''),
(708, 'JULIANA', 'VEGA', 22, '2000-07-23', '2023-03-23 03:11:47', 492, 4, b'1', '3007742695', '', ''),
(709, 'ISABELA', 'VEGA', 18, '2005-01-25', '2023-03-23 03:11:47', 492, 4, b'1', '3156166190', '', ''),
(710, 'Rosa Elvira ', 'Rivera Ordoñez', 88, '1935-02-14', '2023-03-23 03:18:05', 513, 3, b'1', '3155175054', '', ''),
(711, 'María Del Carmen', 'Sánchez Giraldo', 50, '1972-05-17', '2023-03-23 03:18:05', 513, 1, b'1', '3156166190', '', ''),
(712, 'María Stella', 'Tabares Sánchez', 27, '1995-06-25', '2023-03-23 03:18:05', 513, 4, b'1', '3155174197', '', ''),
(713, 'Daniela', 'Tabares Sanchez', 22, '2001-01-02', '2023-03-23 03:18:05', 513, 4, b'1', '3164786727', '', ''),
(714, 'Fabiola', 'Orejuela Vargas', 60, '1962-10-08', '2023-03-23 03:21:39', 394, 1, b'1', '3185156199', '', ''),
(715, 'Martha Cecilia ', 'Mosquera Cuero ', 60, '1963-01-29', '2023-03-23 03:25:48', 130, 1, b'1', '3183787038', '', ''),
(716, 'Alexandra ', 'Fernández Mosquera ', 30, '1992-05-07', '2023-03-23 03:25:48', 130, 4, b'1', '3024479339', '', ''),
(717, 'Ana María ', 'Fernández Mosquera ', 32, '1990-04-03', '2023-03-23 03:25:48', 130, 4, b'1', '3168389188', '', ''),
(718, 'Helmer Honey ', 'Giraldo Jaramillo', 0, NULL, '2023-03-23 16:45:47', 86, 2, b'1', '5166441', '', ''),
(719, 'Oscar Marino', 'Giraldo Salcedo', 55, '1967-10-26', '2023-03-23 16:45:47', 86, 5, b'1', '3024479339', '', ''),
(720, 'Marta Cecilia', 'Giraldo Salcedo', 0, NULL, '2023-03-23 16:45:47', 86, 5, b'1', '3136727993', '', ''),
(721, 'Adriana Maria', 'Giraldo Salcedo', 0, NULL, '2023-03-23 16:45:47', 86, 5, b'1', '3165142448', '', ''),
(722, 'Juana ', 'Sierra  Saavedra ', 18, '2005-02-01', '2023-03-23 16:53:54', 459, 4, b'1', '3175136116', '', ''),
(723, 'Tania ', 'Sierra Laso', 27, '1995-08-06', '2023-03-23 16:53:54', 459, 4, b'1', '3160464979', '', ''),
(724, 'Elmer ', 'Sierra  Ortiz', 88, '1934-05-23', '2023-03-23 16:53:54', 459, 2, b'1', '5163176', '', ''),
(725, 'Orfilia ', 'Viera de Sierra ', 85, '1938-01-08', '2023-03-23 16:53:54', 459, 3, b'1', '5163176', '', ''),
(726, 'maria Denis', 'Olaya ', 55, '1967-05-11', '2023-03-23 17:04:08', 1, 1, b'1', '3113616141', '', ''),
(727, 'Carlos Andres', 'Arce Olaya', 25, '1997-08-26', '2023-03-23 17:04:08', 1, 4, b'1', '3173118154', '', ''),
(728, 'santiago ', 'Arce olaya', 19, '2003-12-24', '2023-03-23 17:04:08', 1, 4, b'1', '3158687509', '', ''),
(729, 'YESSICA ALEXANDRA ', 'PEÑA GAMBOA ', 29, '1993-11-13', '2023-03-23 17:08:27', 377, 4, b'1', '3145715374', '', ''),
(730, 'LUZ ESTRELLA ', 'GAMBOA GÓNGORA ', 55, '1967-04-15', '2023-03-23 17:08:27', 377, 6, b'1', '3173118154', '', 'COMPAÑERA'),
(731, 'María Antonia ', 'Barona carpio ', 68, '1954-09-02', '2023-03-23 17:14:11', 63, 3, b'1', '3307344854', '', ''),
(732, 'Arnoldo  ', 'Ruiz Barona', 65, '1958-09-16', '2023-03-23 17:14:11', 63, 6, b'1', '3307344854', '', ''),
(733, 'Jorge Armando', 'Barona Flor', 34, '1989-07-27', '2023-03-23 17:14:11', 63, 4, b'1', '3307344854', '', ''),
(734, 'Gladys Estella', 'Chamorro Leyton', 48, '1974-10-07', '2023-03-23 17:19:24', 407, 1, b'1', '3178295286', '', ''),
(735, 'Daniel Alejandro', 'Portilla Chamorro', 27, '1996-02-23', '2023-03-23 17:19:24', 407, 6, b'1', '3026181649', '', 'hijastro'),
(736, 'Juan Camilo', 'Rincon Chamorro', 24, '1998-04-18', '2023-03-23 17:19:24', 407, 4, b'1', '3044776699', '', ''),
(737, 'Fernanda Isabela', 'Rincon Chamorro', 22, '2001-01-19', '2023-03-23 17:19:24', 407, 4, b'1', '3136951676', '', ''),
(738, 'Juan Jose', 'Rodriguez Diaz', 19, '2004-02-04', '2023-03-23 17:25:38', 432, 4, b'1', '3126474464', '', ''),
(739, 'Jose Emmanuel', 'Rodriguez Osorno', 9, '2014-03-20', '2023-03-23 17:25:38', 432, 4, b'1', '3154597333', '', ''),
(740, 'Maria Antonia', 'Rodriguez Osorno', 6, '2016-08-18', '2023-03-23 17:25:38', 432, 4, b'1', '3154597333', '', ''),
(741, 'Antonio Jose ', 'Rodriguez ', 76, '1946-04-17', '2023-03-23 17:25:38', 432, 2, b'1', '3147975449', '', ''),
(742, 'AURA MARÍA', 'MINA MUÑOZ', 44, '1978-10-02', '2023-03-23 17:30:03', 112, 1, b'1', '3146857940', '', ''),
(743, 'OSKAR DANNIEL ', 'CARABALÍ MINA', 17, '2005-04-30', '2023-03-23 17:30:03', 112, 4, b'1', '3148720662', '', ''),
(744, 'YULIAM ANDRESS', 'CARABALÍ MINA', 9, '2013-05-29', '2023-03-23 17:30:03', 112, 4, b'1', '3148720662', '', ''),
(745, 'ines', 'carabali garcia', 55, '1967-10-01', '2023-03-23 18:04:47', 627, 1, b'1', '3137609422', '', ''),
(746, 'kevin andres', 'balanta mezu', 17, '2005-08-11', '2023-03-23 18:04:47', 627, 4, b'1', '3105644314', '', ''),
(747, 'juan sebastian', 'rodriguez pelaez', 25, '1997-08-20', '2023-03-23 18:10:23', 628, 4, b'1', '17864881376', '', ''),
(748, 'rodrigo', 'rodriguez pelaez', 21, '2001-09-03', '2023-03-23 18:10:23', 628, 4, b'1', '3168002581', '', ''),
(749, 'bety ', 'rodriguez manpotes', 0, NULL, '2023-03-23 18:10:23', 628, 5, b'1', '3156513774', '', ''),
(750, 'LUZ AYDEE', 'MINA BALANTA', 36, '1986-09-20', '2023-03-23 18:15:00', 109, 1, b'1', '3148873129', '', ''),
(751, 'ANDRES DAVID', 'CARABALI MINA', 9, '2014-03-01', '2023-03-23 18:15:00', 109, 4, b'1', '3217366064', '', ''),
(753, 'Mariana ', 'Rizo Parra', 5, '2017-11-18', '2023-03-23 18:20:44', 418, 4, b'1', '3186659072', '', ''),
(754, 'Dibisay', 'Parra Salgado', 35, '1987-06-10', '2023-03-23 18:20:44', 418, 1, b'1', '3186659072', '', ''),
(755, 'Maria Del Socorro', 'Morales Paz', 65, '1957-10-27', '2023-03-23 18:20:44', 418, 3, b'1', '3105035730', '', ''),
(756, 'Humberto', 'Rizo Coll', 72, '1950-09-17', '2023-03-23 18:20:44', 418, 2, b'1', '3168124346', '', ''),
(757, 'Analeybi', 'Mina lucumi', 46, '1977-01-14', '2023-03-23 18:26:27', 472, 1, b'1', '3128355989', '', ''),
(758, 'Diego armando', 'Zamora mina', 21, '2001-12-03', '2023-03-23 18:26:27', 472, 4, b'1', '3233370114', '', ''),
(759, 'María Alejandra ', 'Rodríguez ramirez', 17, '2005-09-27', '2023-03-23 18:32:12', 429, 4, b'1', '3175788622', '', ''),
(760, 'Juan Martín ', 'Rodríguez muñoz ', 9, '2013-08-26', '2023-03-23 18:32:12', 429, 4, b'1', '3207445389', '', ''),
(761, 'Martha lorena ', 'Muñoz ramirez', 40, '1982-09-28', '2023-03-23 18:32:12', 429, 1, b'1', '3175788623', '', ''),
(762, 'Luz Angelica ', 'Bejarano Lopez', 39, '1983-04-13', '2023-03-23 18:40:27', 251, 1, b'1', '3122530738', '', ''),
(763, 'Ana Maria ', 'Paz Bejarano', 18, '2004-07-13', '2023-03-23 18:40:27', 251, 4, b'1', '3207445389', '', ''),
(764, 'Martha Cecilia ', 'Lora Rivera', 59, '1963-08-17', '2023-03-23 18:40:27', 251, 3, b'1', '3147006289', '', ''),
(765, 'Luisa Fernanda', 'Rueda Angulo', 34, '1988-05-31', '2023-03-23 18:44:59', 546, 1, b'1', '3176739030', '', ''),
(766, 'Juan Esteban', 'Triviño Rueda', 13, '2010-02-11', '2023-03-23 18:44:59', 546, 4, b'1', '3176739030', '', ''),
(767, 'Isabel ', 'Navarrete Arango', 35, '1988-02-24', '2023-03-23 18:49:05', 66, 1, b'1', '3206113278', '', ''),
(768, 'ATLANTA ALEJANDRA', 'HERNANDEZ SANDOVAL', 11, '2011-07-10', '2023-03-23 19:06:49', 200, 4, b'1', '3172924206', '', ''),
(769, 'ALEJANDRA ', 'PERLAZA QUIÑONEZ', 28, '1995-03-14', '2023-03-23 19:06:49', 200, 1, b'1', '3206113278', '', ''),
(770, 'SCARLET ', 'TRUJILLO CAICEDO', 18, '2004-05-24', '2023-03-23 19:10:10', 554, 4, b'1', '3128671642', '', ''),
(771, 'Carlos Andrès', 'Chacòn Amaya', 42, '1980-09-12', '2023-03-23 19:14:08', 38, 1, b'1', '3012320065', '', ''),
(772, 'Janeth Cecilia', 'Alvarez Palmarini', 68, '1954-07-20', '2023-03-23 19:14:08', 38, 3, b'1', '3128476602', '', ''),
(773, 'Katherine Isabel', 'Bastidas Alvarez', 38, '1984-04-03', '2023-03-23 19:14:08', 38, 5, b'1', '3013584087', '', ''),
(774, 'Yanith Daniela ', 'Hurtado Mosquera', 16, '2006-12-18', '2023-03-23 19:18:36', 288, 4, b'1', '3104531488', '', ''),
(775, 'Carmen Ligia', 'Mosquera Sarria', 76, '1946-11-17', '2023-03-23 19:18:36', 288, 3, b'1', '3126505412', '', ''),
(776, 'BLANCA NELLY', 'MOSQUERA PIMENTEL', 65, '1957-08-06', '2023-03-23 19:25:58', 448, 3, b'1', '3014542301', '', ''),
(777, 'PAULA ANDREA', 'ROJAS MOSQUERA', 47, '1976-02-21', '2023-03-23 19:25:58', 448, 5, b'1', '3192294032', '', ''),
(778, 'Alexander', 'Vivas Orjuela', 35, '1988-02-20', '2023-03-23 19:32:15', 517, 6, b'1', '3166203781', '', 'compañero'),
(779, 'María Ofir', 'Herrera', 63, '1960-03-14', '2023-03-23 19:32:15', 517, 3, b'1', '3433120', '', ''),
(780, 'Antonia', 'Vivas Mendez', 7, '2015-04-12', '2023-03-23 19:32:15', 517, 4, b'1', '3166203781', '', ''),
(781, 'Alejandro', 'Vivas Méndez', 11, '2011-07-19', '2023-03-23 19:32:15', 517, 4, b'1', '3166203781', '', ''),
(782, 'Graciela ', 'Muñoz', 83, '1939-05-18', '2023-03-23 19:37:48', 62, 3, b'1', '3148363202', '', ''),
(783, 'Temis ', 'Diaz  Torres', 59, '1963-04-10', '2023-03-23 19:37:48', 62, 1, b'1', '3103727296', '', ''),
(784, 'Kimberly  Nahomy', 'Diaz  Cadena', 23, '1999-11-13', '2023-03-23 19:37:48', 62, 4, b'1', '3233991762', '', ''),
(785, 'Juan Carlos ', 'Edito Ramos', 47, '1975-11-21', '2023-03-23 19:42:32', 107, 1, b'1', '3154589550', '', ''),
(786, 'Jocelyn ', 'Tombe Betancourt', 14, '2008-04-29', '2023-03-23 19:42:32', 107, 6, b'1', '3154610466', '', 'SOBRINO/HIJO'),
(787, 'Salome', 'Velasco Betancourt', 5, '2017-12-18', '2023-03-23 19:42:32', 107, 6, b'1', '3154610466', '', 'SOBRINO/HIJO'),
(788, 'Maria Lucia', 'Ul Ortiz', 61, '1961-12-14', '2023-03-23 19:42:32', 107, 3, b'1', '3154610466', '', ''),
(789, 'Nicole ', 'Gallego Marín ', 14, '2008-07-03', '2023-03-23 19:48:07', 301, 4, b'1', '3008674441', '', ''),
(790, 'Alejandra ', 'Gallego Marín ', 26, '1996-04-26', '2023-03-23 19:48:07', 301, 4, b'1', '3155100386', '3025291284', ''),
(791, 'Ana Mariela ', 'Arias de Marín ', 69, '1953-04-10', '2023-03-23 19:48:07', 301, 3, b'1', '3006336519', '', ''),
(792, 'María Aleyda ', 'Gómez Quintero ', 64, '1958-06-25', '2023-03-23 19:57:47', 498, 3, b'1', '3165893435', '', ''),
(793, 'Jackeline ', 'Vélez Gómez ', 44, '1979-03-17', '2023-03-23 19:57:47', 498, 5, b'1', '3167443465', '', ''),
(794, 'Victor Rodrigo ', 'Cuero Angulo', 54, '1968-05-27', '2023-03-23 20:01:22', 356, 1, b'1', '3164467108', '', ''),
(795, 'Valentina', 'Cuero Benitez', 11, '2012-01-15', '2023-03-23 20:01:22', 356, 4, b'1', '3165342296', '', ''),
(796, 'Valeria', 'Cuero Benitez', 1, '2021-12-16', '2023-03-23 20:01:22', 356, 4, b'1', '3165342296', '', ''),
(797, 'YINA ALEXANDRA', 'FALLA HOLGUIN', 18, '2005-02-06', '2023-03-23 20:05:00', 241, 4, b'1', '3043829565', '', ''),
(798, 'JIREH DAHELA ', 'Mera Angola ', 21, '2001-08-28', '2023-03-23 20:09:02', 42, 4, b'1', '3022465604', '', ''),
(799, 'Blessing Naim ', 'Mera Angola ', 14, '2009-02-25', '2023-03-23 20:09:02', 42, 4, b'1', '3218890446', '', ''),
(800, 'Sanders Williams', 'Loboa Angola ', 6, '2016-10-12', '2023-03-23 20:09:02', 42, 4, b'1', '3218890446', '', ''),
(801, 'Martina ', 'González ', 73, '1949-07-20', '2023-03-23 20:09:02', 42, 3, b'1', '3102911699', '', ''),
(802, 'Juan Jose ', 'Toro Saldaña', 20, '2002-06-04', '2023-03-23 20:13:07', 570, 4, b'1', '3146135807', '', ''),
(803, 'Maria Yolanda', 'Gonzalez', 62, '1961-01-19', '2023-03-23 20:13:07', 570, 3, b'1', '3146135807', '', ''),
(804, 'Jose Ignacio', 'Saldaña', 70, '1952-11-01', '2023-03-23 20:13:07', 570, 2, b'1', '3154719091', '', ''),
(805, 'ALVARO ENRIQUE', 'RODRIGUEZ GUERRERO', 40, '1982-06-06', '2023-03-23 20:17:09', 309, 1, b'1', '3178404047', '', ''),
(806, 'MARTHA ELENA ', 'RAMIREZ BONILLA', 62, '1960-12-25', '2023-03-23 20:17:09', 309, 3, b'1', '3162462004', '', ''),
(807, 'JUAN MARTÍN ', 'RODRIGUEZ MUÑOZ', 9, '2013-08-26', '2023-03-23 20:17:09', 309, 4, b'1', '3175788622', '', ''),
(808, 'Kathleen Nicolle ', 'Caicedo Borja', 18, '2004-03-30', '2023-03-23 21:02:18', 54, 4, b'1', '3186987173', '', ''),
(809, 'Miguel Angel', 'Caicedo Borja', 27, '1995-05-24', '2023-03-23 21:02:18', 54, 4, b'1', '3126927875', '', ''),
(810, 'RAUL', 'RENGIFO ROJAS', 59, '1963-05-13', '2023-03-23 21:05:27', 239, 1, b'1', '3176466823', '', ''),
(811, 'CARLOS EDUAARDO', 'RENGIFO MOLINA', 26, '1997-01-14', '2023-03-23 21:05:27', 239, 4, b'1', '3175834172', '', ''),
(812, 'Yuli marieth', 'Navarro arboleda', 19, '2003-05-28', '2023-03-23 21:08:53', 162, 4, b'1', '3204635967', '', ''),
(813, 'Guillermo', 'Navarro morales', 54, '1968-07-20', '2023-03-23 21:08:53', 162, 1, b'1', '3128328164', '', ''),
(814, 'Hernando', 'Segura gonzalez', 65, '1957-08-12', '2023-03-23 21:14:52', 58, 1, b'1', '3114964718', '', ''),
(815, 'Liliana Marcela ', 'Loaiza buritica ', 37, '1985-12-30', '2023-03-23 21:14:52', 58, 4, b'1', '3118578431', '', ''),
(816, 'KELLY TATIANA ', 'CAPOTE', 40, '1982-05-01', '2023-03-23 21:20:45', 96, 4, b'1', '3215757710', '', ''),
(817, 'PAOLO ANDRES', 'CAPOTE', 38, '1984-04-01', '2023-03-23 21:20:45', 96, 4, b'1', '3178138851', '', ''),
(818, 'MARIA ELENA', 'CAPOTE', 79, '1943-04-11', '2023-03-23 21:20:45', 96, 3, b'1', '3115637168', '', ''),
(819, 'JASON ANDRES', 'PEÑA', 21, '2001-04-06', '2023-03-23 21:20:45', 96, 6, b'1', '3136609123', '', 'NIETO'),
(820, 'DIANA CAROLINA', 'LOPERA SAAVEDRA', 36, '1987-01-03', '2023-03-23 22:37:23', 561, 4, b'1', '3163176167', '', ''),
(823, 'DANIELA ', 'OSPINA CUADROS', 25, '1997-09-27', '2023-03-23 22:41:00', 287, 4, b'1', '3004029191', '', ''),
(824, 'ALEJANDRO ', 'OSPINA CUADROS', 22, '2001-02-23', '2023-03-23 22:41:00', 287, 4, b'1', '3136691807', '', ''),
(825, 'ISABELLA', 'HERNANDEZ HOLGUIN', 9, '2013-05-07', '2023-03-23 22:44:52', 238, 4, b'1', '3003469692', '', ''),
(826, 'ERIKA  JOHANNA', 'BUENO HOLGUIN', 34, '1988-11-22', '2023-03-23 22:44:52', 238, 4, b'1', '3135385496', '', ''),
(827, 'DAVID ', 'RAMIREZ OROZCO', 32, '1990-09-17', '2023-03-23 22:50:41', 204, 4, b'1', '3218421530', '', ''),
(828, 'SEBASTIAN', 'RAMIREZ OROZCO', 29, '1993-07-12', '2023-03-23 22:50:41', 204, 4, b'1', '3107346030', '', ''),
(829, 'DELSA MARÍA', 'BALCAZAR', 79, '1943-10-30', '2023-03-23 22:50:41', 204, 3, b'1', '3162249963', '', ''),
(830, 'CHRISTIAN FABIAN ', 'FRANCO GARCIA', 31, '1992-02-02', '2023-03-23 22:54:45', 149, 4, b'1', '3148852488', '', ''),
(831, 'JULIANA', 'FRANCO GARCIA', 26, '1997-03-04', '2023-03-23 22:54:45', 149, 4, b'1', '3188652423', '', ''),
(832, 'SANTIAGO', 'CARDENAS FRANCO', 7, '2016-01-16', '2023-03-23 22:54:45', 149, 6, b'1', '3148852488', '', 'NIETO'),
(833, 'Onessimo ', 'Villamil Aguirre ', 54, '1968-07-20', '2023-03-23 22:59:12', 629, 1, b'1', '3166224548', '', ''),
(834, 'Julián Andrés ', 'Villamil Olaya ', 15, '2007-07-27', '2023-03-23 22:59:12', 629, 4, b'1', '3227377762', '', ''),
(835, 'James ', 'González Sánchez', 56, '1966-11-21', '2023-03-23 23:03:51', 166, 1, b'1', '3103772692', '', ''),
(836, 'Astrid Carolina', 'González Gomez', 28, '1994-08-08', '2023-03-23 23:03:51', 166, 4, b'1', '3227377762', '', ''),
(837, 'Vanessa', 'Cordoba Balanta', 34, '1988-11-20', '2023-03-23 23:08:03', 29, 4, b'1', '3156710251', '', ''),
(838, 'Orfilia', 'rodriguez de Balanta', 81, '1942-03-23', '2023-03-23 23:08:03', 29, 3, b'1', '3186255338', '', ''),
(839, 'Jorge ivan', 'Trujillo Aguilar ', 25, '1998-01-21', '2023-03-23 23:16:54', 7, 4, b'1', '3225145851', '', ''),
(840, 'María Camila ', 'Trujillo Aguilar ', 23, '2000-01-09', '2023-03-23 23:16:54', 7, 4, b'1', '3128903767', '', ''),
(841, 'SANTIAGO', 'BARONA SANCHEZ', 19, '2003-06-18', '2023-03-23 23:28:22', 443, 4, b'1', '3004029281', '', ''),
(842, 'CAMILO', 'BARONA SANCHEZ', 19, '2003-06-18', '2023-03-23 23:28:22', 443, 4, b'1', '3152199134', '', ''),
(843, 'HENRY FERNANDO', 'POPO VALENCIA', 22, '2000-06-08', '2023-03-23 23:33:13', 479, 4, b'1', '3113639142', '', ''),
(844, 'DORALBA ', 'FAJARDO', 76, '1946-09-01', '2023-03-23 23:33:13', 479, 3, b'1', '3182186422', '', ''),
(845, 'PLUTARCO', 'VALENCIA FILIGRANAN', 70, '1952-06-28', '2023-03-23 23:33:13', 479, 2, b'1', '3122102422', '', ''),
(846, 'Francisco', 'Lasso Olmos', 54, '1968-05-21', '2023-03-23 23:37:41', 19, 1, b'1', '3158259357', '', ''),
(847, 'Luisa Maria', 'Lasso Atehortua', 17, '2005-04-10', '2023-03-23 23:37:41', 19, 4, b'1', '3166160750', '', ''),
(848, 'DANIELA', 'OSPINA ZEA', 24, '1999-03-17', '2023-03-23 23:42:00', 562, 4, b'1', '3223121036', '', ''),
(849, 'GERLIN KLEITON', 'VICTORIA RANGEL', 49, '1973-05-19', '2023-03-23 23:42:00', 562, 1, b'1', '3166160750', '', ''),
(850, 'abdul leon ', 'velasquez flores', 55, '1967-07-13', '2023-03-23 23:46:46', 173, 1, b'1', '3207738847', '', ''),
(851, 'yennifer', 'velasquez guevara', 27, '1996-03-05', '2023-03-23 23:46:46', 173, 4, b'1', '3028359572', '', ''),
(852, 'ALONSO', 'BALANTA SALINAS', 52, '1970-07-08', '2023-03-23 23:51:57', 30, 5, b'1', '3113181276', '', ''),
(853, 'CARLO ALBERTO ', 'BALANTA SALINAS', 35, '1987-05-01', '2023-03-23 23:51:57', 30, 5, b'1', '3003187674', '', ''),
(854, 'AURA MARIA', 'BALANTA SALINAS', 44, '1978-06-30', '2023-03-23 23:51:57', 30, 5, b'1', '3116498628', '', ''),
(855, 'NELLY ', 'BALANTA SALINAS', 39, '1983-05-14', '2023-03-23 23:51:57', 30, 5, b'1', '3234098654', '', ''),
(856, 'Joselin ', 'Arce arguello', 28, '1994-08-18', '2023-03-23 23:56:54', 525, 4, b'1', '3147169574', '', ''),
(857, 'Luisa fernanda', 'Navia arguello', 18, '2005-03-23', '2023-03-23 23:56:54', 525, 4, b'1', '3147169574', '', ''),
(858, 'Mary ', 'Carvajal', 83, '1939-04-29', '2023-03-24 00:00:46', 257, 3, b'1', '3106594600', '', ''),
(859, 'JULIETH LORENA', 'BARRETO LUGO', 37, '1985-06-20', '2023-03-24 00:00:46', 257, 4, b'1', '3017887140', '', ''),
(860, 'EDWIN ', 'BARRETO LUGO', 40, '1982-09-23', '2023-03-24 00:00:46', 257, 4, b'1', '3013236399', '', ''),
(862, 'Oscar ', 'Zabala Ballesteros', 73, '1949-09-12', '2023-03-24 01:13:16', 261, 1, b'1', '3157393093', '', ''),
(867, 'DIVIER', 'BALANTA', 60, '1962-10-16', '2023-03-24 01:23:43', 547, 1, b'1', '3104580940', '', ''),
(868, 'SEBASTIAN', 'BALANTA ZAMORA', 30, '1992-12-27', '2023-03-24 01:23:43', 547, 4, b'1', '3148648507', '', ''),
(869, 'JUAN CAMILO ', 'BALANTA ZAMORA', 29, '1993-12-28', '2023-03-24 01:23:43', 547, 4, b'1', '3152700285', '', ''),
(870, 'MARIA', 'VALENCIA DE ZAMORA', 86, '1937-03-17', '2023-03-24 01:23:43', 547, 3, b'1', '3155337334', '', ''),
(871, 'Santiago Alejandro', 'Barrera Vidal', 23, '1999-08-14', '2023-03-24 01:27:29', 512, 4, b'1', '3127974738', '', ''),
(872, 'Luz Marina ', 'ALEGRIA', 76, '1946-08-01', '2023-03-24 01:27:29', 512, 3, b'1', '3148648507', '', ''),
(878, 'María Luz Dary ', 'Rios Ospina ', 71, '1951-12-20', '2023-03-24 14:29:58', 156, 3, b'1', '3115112578', '', ''),
(879, 'Luz Angela ', 'Gil Leal ', 27, '1995-07-08', '2023-03-24 14:29:58', 156, 5, b'1', '3115112578', '', ''),
(880, 'Valery', 'Bedoya Gil', 7, '2015-07-31', '2023-03-24 14:29:58', 156, 6, b'1', '3115112578', '', 'sobrina'),
(881, 'ANGEL STHING ', 'OROZCO MONTES', 21, '2001-12-29', '2023-03-24 14:35:06', 243, 4, b'1', '3148868127', '', ''),
(882, 'ARQUÍMEDES', 'OROZCO GARCÍA', 50, '1973-01-11', '2023-03-24 14:35:06', 243, 6, b'1', '3226153822', '', ''),
(883, 'Viviana ', 'Hurtado Ibarguen ', 51, '1971-09-17', '2023-03-24 14:39:52', 236, 3, b'1', '3166954034', '', ''),
(884, 'Janner ', 'Lopez Herrera', 55, '1967-04-06', '2023-03-24 14:39:52', 236, 2, b'1', '3165323619', '', ''),
(885, 'Sebastian Amilkar', 'Murillo Hurtado', 28, '1994-07-18', '2023-03-24 14:39:52', 236, 5, b'1', '3165323619', '', ''),
(886, 'Silvana ', 'Golu Rodallega ', 9, '2013-05-28', '2023-03-24 14:53:14', 420, 4, b'1', '3105175855', '', ''),
(887, 'Eder Antonio ', 'Golu Espinosa ', 40, '1982-11-02', '2023-03-24 14:53:14', 420, 1, b'1', '3105175855', '', ''),
(888, 'Rosalba', 'Popo', 64, '1959-01-17', '2023-03-24 14:53:14', 420, 3, b'1', '3215509046', '', ''),
(889, 'Arnulfo ', 'Rodallega Zamora ', 69, '1953-11-06', '2023-03-24 14:53:14', 420, 2, b'1', '5530165', '', ''),
(890, 'KATHERIN ', 'SUAREZ SILVA ', 18, '2004-09-25', '2023-03-24 14:56:52', 460, 4, b'1', '3052814231', '', ''),
(891, 'JOSE IVAN ', 'HERNANDEZ VILLADA', 59, '1963-05-20', '2023-03-24 15:08:13', 210, 2, b'1', '3146317349', '', ''),
(892, 'CARMENZA ', 'LLANOS PEÑARANDA', 58, '1965-03-04', '2023-03-24 15:08:13', 210, 3, b'1', '3146317349', '', ''),
(893, 'VALENTINA ', 'HERNANDEZ LLANOS ', 24, '1998-12-21', '2023-03-24 15:08:13', 210, 5, b'1', '3184940750', '', ''),
(894, 'Maria Olga', 'Guerrero Cerón', 85, '1937-06-29', '2023-03-24 15:13:36', 202, 6, b'1', '3206050090', '', 'abuela'),
(895, 'Aura Maria', 'Guampe Carabali', 27, '1995-11-10', '2023-03-24 15:13:36', 202, 5, b'1', '3146915519', '', ''),
(896, 'Samuel', 'Guampe', 60, '1962-04-25', '2023-03-24 15:13:36', 202, 2, b'1', '3205309299', '', ''),
(897, 'Salome', 'Palomino Guampe', 3, '2020-01-15', '2023-03-24 15:13:36', 202, 6, b'1', '3113195382', '', 'sobrina'),
(898, 'DAVID ', 'TAMAYO RODRIGUEZ', 29, '1993-05-14', '2023-03-24 15:17:46', 487, 1, b'1', '3107906704', '', ''),
(899, 'NUBIA ', 'QUINAYAS SOLANO ', 62, '1960-10-15', '2023-03-24 15:17:46', 487, 2, b'1', '3206476635', '', ''),
(900, 'Juan Esteban', 'Ararat Peña', 11, '2011-06-05', '2023-03-24 15:42:54', 379, 4, b'1', '3165784281', '', ''),
(901, 'Angelly ', 'Castillo', 29, '1994-03-06', '2023-03-24 15:46:33', 567, 1, b'1', '3238023349', '', ''),
(902, 'MARIA NELLY ', 'HURTADO LOZANO', 53, '1969-03-25', '2023-03-24 15:50:09', 495, 3, b'1', '3184687203', '', ''),
(903, 'CARLOS LLERAS ', 'VELASCO CARREÑO', 66, '1957-02-02', '2023-03-24 15:50:09', 495, 2, b'1', '3184687203', '', ''),
(904, 'Abby Samantha', 'Sinisterra Bonilla', 5, '2018-03-09', '2023-03-24 15:54:50', 52, 4, b'1', '3146478876', '', ''),
(905, 'Alba Maria', 'herrera', 56, '1966-08-28', '2023-03-24 15:54:50', 52, 3, b'1', '3185085184', '', ''),
(906, 'Dairon', 'Sinisterra Cundumi', 35, '1987-09-05', '2023-03-24 15:54:50', 52, 1, b'1', '3146478876', '', ''),
(907, 'MONICA', 'SALDAÑA DAVILA', 50, '1972-09-23', '2023-03-24 15:59:07', 438, 3, b'1', '3173927693', '', ''),
(908, 'VALENTINA', 'RODRIGUEZ SALDAÑA', 18, '2004-07-17', '2023-03-24 15:59:07', 438, 5, b'1', '3137624319', '', ''),
(909, 'Camila', 'Contador Mosquera', 7, '2015-04-01', '2023-03-24 16:20:33', 630, 4, b'1', '3155368748', '', ''),
(910, 'ISAAC ', 'VELASQUEZ MARIN', 6, '2016-07-01', '2023-03-24 16:24:08', 304, 4, b'1', '3164915461', '', ''),
(911, 'Karolay Andrea ', 'Ul Fernandez', 10, '2012-05-10', '2023-03-24 16:36:04', 128, 4, b'1', '3168794235', '', ''),
(912, 'Angela Dahana', 'Ul Fernandez', 18, '2004-08-28', '2023-03-24 16:36:04', 128, 4, b'1', '3168794235', '', ''),
(913, 'Edward', 'Ul Ul', 36, '1986-05-06', '2023-03-24 16:36:04', 128, 1, b'1', '315698783', '', ''),
(914, 'ANGEL DAVID', 'MARTINEZ VERA ', 7, '2015-11-25', '2023-03-24 17:06:02', 501, 4, b'1', '3137535468', '', ''),
(915, 'NOHEMY ', 'MERCADO MATRINEZ', 52, '1970-12-13', '2023-03-24 17:06:02', 501, 3, b'1', '3168794235', '', ''),
(916, 'JAVIER ', 'SAAVEDRA TOVAR', 55, '1967-08-13', '2023-03-24 17:06:02', 501, 2, b'1', '3116148176', '', ''),
(917, 'LIZANA MAYEL', 'HERRERA ZULUAGA', 50, '1972-04-07', '2023-03-24 17:10:45', 365, 1, b'1', '3108370227', '', ''),
(918, 'DAVID', 'HERNÁNDEZ HERRERA', 17, '2005-09-03', '2023-03-24 17:10:45', 365, 4, b'1', '3103471975', '', ''),
(919, 'MIRYAM DEL CARMEN', 'CORTÉS SOLANO', 63, '1959-09-20', '2023-03-24 17:10:45', 365, 3, b'1', '3183385426', '', ''),
(920, 'PETRONIO', 'ORTIZ QUIJANO', 64, '1958-09-06', '2023-03-24 17:10:45', 365, 2, b'1', '3183385413', '', ''),
(921, 'Jacobo ', 'Gutiérrez Vallejo', 3, '2020-02-21', '2023-03-24 17:23:53', 635, 4, b'1', '3165360827', '', ''),
(922, 'Helen', 'Vallejo Vanegas', 33, '1989-05-02', '2023-03-24 17:23:53', 635, 1, b'1', '3165360827', '', ''),
(923, 'Elyery', 'Serna Gomez', 63, '1959-08-16', '2023-03-24 17:23:53', 635, 3, b'1', '3165360827', '', ''),
(924, 'Carmen ', 'Velasco Camacho', 78, '1944-08-26', '2023-03-24 17:48:56', 374, 3, b'1', '6024863316', '', ''),
(925, 'Luis Marino', 'Palta Sarria', 81, '1942-01-03', '2023-03-24 17:48:56', 374, 2, b'1', '3174935528', '', ''),
(926, 'Constanza', 'Palta Velasco', 48, '1974-04-20', '2023-03-24 17:48:56', 374, 5, b'1', '3216874480', '', ''),
(927, 'JHON JAIRO ', 'PERDOMO', 55, '1967-10-09', '2023-03-24 17:53:35', 636, 2, b'1', '3154775718', '', ''),
(928, 'GAEL', 'SOLIS PERDOMO', 5, '2018-02-18', '2023-03-24 17:53:35', 636, 4, b'1', '3206492903', '', ''),
(929, 'Monica Andrea', 'Merino Ruales', 39, '1984-03-12', '2023-03-24 17:57:04', 488, 5, b'1', '3122629888', '', ''),
(930, 'Yeidy Yuliet', 'Yepes Jiménez', 37, '1985-11-17', '2023-03-24 18:00:25', 170, 1, b'1', '3155386341', '', ''),
(931, 'Martín', 'González Yepes', 11, '2011-05-13', '2023-03-24 18:00:25', 170, 4, b'1', '3155386341', '', ''),
(932, 'Angelica', 'Tabares Botero', 0, NULL, '2023-03-24 18:04:04', 510, 5, b'1', '3016308557', '', ''),
(933, 'gloria ines', 'botero espinosa', 0, NULL, '2023-03-24 18:04:04', 510, 3, b'1', '3187096350', '', ''),
(934, 'Ricardo', 'Tabares Loaiza', 0, NULL, '2023-03-24 18:04:04', 510, 2, b'1', '3187096350', '', ''),
(935, 'Orlando Antonio', 'Rojas Vasquez', 64, '1958-06-17', '2023-03-24 18:06:52', 224, 2, b'1', '3143001445', '', ''),
(936, 'Maria Stepfanny', 'Rojas Ramirez', 29, '1993-11-04', '2023-03-24 18:06:52', 224, 5, b'1', '3143001446', '', ''),
(937, 'YULI ', 'CHARA', 53, '1969-10-18', '2023-03-24 18:11:14', 175, 3, b'1', '3136611823', '', ''),
(938, 'EDINSON', 'GONZALEZ', 0, NULL, '2023-03-24 18:11:14', 175, 2, b'1', '3164981415', '', ''),
(939, 'LAURA ', 'GONZALEZ', 0, NULL, '2023-03-24 18:11:14', 175, 5, b'1', '3164981415', '', ''),
(940, 'YANETH', 'VELEZ TORRES', 52, '1971-03-07', '2023-03-24 18:15:21', 312, 3, b'1', '3167504728', '', ''),
(941, 'Henry', 'Amú', 55, '1967-04-02', '2023-03-24 18:21:01', 41, 2, b'1', '3162504106', '', ''),
(942, 'Ana Cecilia', 'Abonía Gonzales', 58, '1964-07-25', '2023-03-24 18:21:01', 41, 3, b'1', '3162504106', '', ''),
(943, 'Juan José', 'Amú Abonía', 24, '1998-12-17', '2023-03-24 18:21:01', 41, 5, b'1', '3186108824', '', ''),
(944, 'Nahomy Isabella', 'Amú Abonía', 18, '2004-07-28', '2023-03-24 18:21:01', 41, 5, b'1', '3154908507', '', ''),
(945, 'Mirelly', 'Villamil Candela', 57, '1965-11-18', '2023-03-24 18:28:53', 119, 3, b'1', '3146776477', '', ''),
(946, 'Nohemy', 'Candelo', 81, '1942-01-02', '2023-03-24 18:28:53', 119, 6, b'1', '5920296', '', 'abuela'),
(947, 'Darneli', 'Villamil Candelo', 58, '1964-10-04', '2023-03-24 18:28:53', 119, 6, b'1', '5920296', '', 'TIA'),
(948, 'Hernan Dario', 'Caro Villamil', 26, '1997-01-01', '2023-03-24 18:28:53', 119, 5, b'1', '3146776477', '', ''),
(949, 'William Javier', 'Perdigón Gamboa', 33, '1989-10-14', '2023-03-24 18:33:29', 140, 1, b'1', '3105443392', '', ''),
(950, 'María Abigaíl', 'Díaz Urrea', 51, '1971-07-16', '2023-03-24 18:33:29', 140, 3, b'1', '3176381714', '', ''),
(951, 'Vicente', 'Perdigón Gallego', 5, '2017-09-15', '2023-03-24 18:33:29', 140, 4, b'1', '3176381714', '', ''),
(952, 'Agustín', 'Perdigón Gallego', 2, '2020-05-28', '2023-03-24 18:33:29', 140, 4, b'1', '3176381714', '', ''),
(953, 'Saul Andres', 'Diaz Velasco', 32, '1990-11-19', '2023-03-24 18:38:07', 449, 1, b'1', '3127531530', '', ''),
(954, 'Gael ', 'Diaz Sandoval', 4, '2018-06-04', '2023-03-24 18:38:07', 449, 4, b'1', '3183479288', '', ''),
(955, 'Jacqueline ', 'Gomez Zamorano', 53, '1969-03-25', '2023-03-24 18:38:07', 449, 3, b'1', '3114049048', '', ''),
(956, 'yeimi loren ', 'lucumi', 0, NULL, '2023-03-24 19:13:04', 205, 1, b'1', '3113488994', '', ''),
(957, 'Luzmila ', 'Guzman Salazar', 58, '1964-07-04', '2023-03-24 19:18:49', 8, 3, b'1', '3156440459', '', ''),
(958, 'clara yicela', 'orrego valles', 30, '1993-02-11', '2023-03-24 19:18:49', 8, 1, b'1', '3187338885', '', ''),
(959, 'fabian ', 'arenas guzman', 28, '1994-11-16', '2023-03-24 19:18:49', 8, 5, b'1', '3186315974', '', ''),
(960, 'JOSE ALONSO', 'VELEZ', 62, '1961-03-16', '2023-03-24 19:22:25', 497, 2, b'1', '314605441', '', ''),
(961, 'MARIA RUTD', 'GIRALDO', 57, '1965-12-22', '2023-03-24 19:22:25', 497, 3, b'1', '3136681979', '', ''),
(962, 'MONICA ANDREA', 'VELEZ FERNANDEZ', 35, '1987-09-18', '2023-03-24 19:22:25', 497, 5, b'1', '3136757785', '', ''),
(963, 'Lida', 'Carabalí Carabalí', 52, '1970-07-03', '2023-03-24 19:26:29', 104, 3, b'1', '3105210851', '', ''),
(964, 'Samuel ', 'Vásquez Obando ', 13, '2010-02-05', '2023-03-24 19:30:37', 328, 4, b'1', '3164925571', '', ''),
(965, 'Jeronimo ', 'Vega obando ', 8, '2014-10-09', '2023-03-24 19:30:37', 328, 4, b'1', '3164925571', '', ''),
(966, 'DAMIANA ', 'PALACIOS PALACIOS', 55, '1967-04-13', '2023-03-24 19:33:58', 373, 3, b'1', '3116236996', '', ''),
(967, 'YARLEIDY', 'PALACIOS PALACIOS', 31, '1992-01-26', '2023-03-24 19:33:58', 373, 5, b'1', '3012467691', '', ''),
(968, 'DANIEL ESTEBAN ', 'ORTEGA MENA', 29, '1993-08-27', '2023-03-24 19:43:33', 37, 1, b'1', '3178114409', '', ''),
(969, 'LUCIANO ', 'BARONA', 71, '1951-05-22', '2023-03-24 19:43:33', 37, 2, b'1', '3158505202', '', ''),
(970, 'FANNY', 'CASTILLO ALZATE', 67, '1955-06-11', '2023-03-24 19:43:33', 37, 3, b'1', '3158505202', '', ''),
(971, 'FABIAN LUCIANO', 'BARONA CASTILLO', 27, '1995-09-25', '2023-03-24 19:43:33', 37, 5, b'1', '3153272129', '', ''),
(972, 'ESPERANZA ', 'BOLAÑOS FLOR', 54, '1968-10-30', '2023-03-24 19:48:01', 637, 3, b'1', '3162951668', '', ''),
(973, 'JUAN GUILLERMO', 'SANCHEZ BOLAÑOS', 35, '1987-06-11', '2023-03-24 19:48:01', 637, 5, b'1', '3136839395', '', ''),
(974, 'SERGIO ', 'MELO TAMAYO', 31, '1991-05-20', '2023-03-24 19:52:02', 220, 1, b'1', '3186093648', '', ''),
(975, 'AILEEN', 'MELO JARAMILLO', 2, '2020-04-23', '2023-03-24 19:52:02', 220, 4, b'1', '3173628951', '', ''),
(976, 'SOFI', 'MELO JARAMILLO', 2, '2020-04-23', '2023-03-24 19:52:02', 220, 4, b'1', '3173628951', '', ''),
(977, 'Alejandra', 'Patiño', 29, '1994-01-18', '2023-03-24 19:54:59', 518, 1, b'1', '3137968537', '', ''),
(978, 'Sarah Sofia ', 'Portillo Montilla', 8, '2014-05-05', '2023-03-24 19:58:06', 245, 4, b'1', '3123306076', '', ''),
(979, 'Juan Pablo ', 'Portillo Montilla', 2, '2020-09-25', '2023-03-24 19:58:06', 245, 4, b'1', '3123306076', '', ''),
(980, 'Luz Yadira', 'Montilla', 52, '1970-08-13', '2023-03-24 19:58:06', 245, 3, b'1', '3122122213', '', ''),
(981, 'MIRYAM ', 'ARANGO BETANCOURTH', 59, '1963-05-14', '2023-03-24 20:54:14', 279, 3, b'1', '3134713988', '', ''),
(982, 'CARLOS OLMEDO ', 'CRUZ CANDELO', 61, '1961-11-11', '2023-03-24 20:54:14', 279, 2, b'1', '3105851174', '', ''),
(983, 'JHOLEIMER ', 'MENESES VARON', 25, '1997-09-03', '2023-03-24 20:54:14', 279, 6, b'1', '3165466148', '', ''),
(984, 'MIRYAM ', 'ARANGO BETANCOURTH', 59, '1963-05-14', '2023-03-24 20:54:40', 279, 3, b'1', '3134713988', '', ''),
(985, 'CARLOS OLMEDO ', 'CRUZ CANDELO', 61, '1961-11-11', '2023-03-24 20:54:40', 279, 2, b'1', '3105851174', '', ''),
(986, 'JHOLEIMER ', 'MENESES VARON', 25, '1997-09-03', '2023-03-24 20:54:40', 279, 6, b'1', '3165466148', '', ''),
(987, 'olga lucia ', 'jaramillo restrepo', 57, '1965-09-21', '2023-03-24 20:59:39', 638, 3, b'1', '3177478088', '', ''),
(988, 'carlos andres', 'franco jaramillo', 21, '2001-04-08', '2023-03-24 20:59:39', 638, 5, b'1', '3222730690', '', ''),
(989, 'carolina', 'carvajal jaramillo', 40, '1983-01-07', '2023-03-24 20:59:39', 638, 5, b'1', '3042134132', '', ''),
(990, 'Luz Elena', 'Buitrago Pinto', 57, '1966-02-06', '2023-03-24 21:03:00', 329, 3, b'1', '3163492972', '', ''),
(991, 'MARIA FERNANDA ', 'LEDESMA BOLAÑOS', 31, '1992-02-18', '2023-03-24 21:07:08', 291, 1, b'1', '3162827285', '', ''),
(992, 'ARIANNA ', 'IBARRA LEDESMA', 5, '2017-11-12', '2023-03-24 21:07:08', 291, 4, b'1', '3175539500', '', ''),
(993, 'JUAN JOSE', 'LOPEZ DIAZ', 8, '2014-03-26', '2023-03-24 21:11:34', 231, 4, b'1', '3162827285', '', ''),
(994, 'JUAN FELIPE', 'LOPEZ DIAZ', 5, '2018-03-22', '2023-03-24 21:11:34', 231, 4, b'1', '3162827285', '', ''),
(995, 'ANDREA DIAZ', 'DIAZ MARTINEZ', 39, '1983-07-03', '2023-03-24 21:11:34', 231, 1, b'1', '3113226801', '', ''),
(996, 'ELVÍA OLIVA ', 'TORRES FUERTES', 0, NULL, '2023-03-24 21:15:04', 111, 3, b'1', '3184728998', '', ''),
(997, 'SIMÓN BOLIVAR ', 'BETANCOURTH', 0, NULL, '2023-03-24 21:15:04', 111, 2, b'1', '3184728998', '', ''),
(998, 'EDWIN ANDRES', 'BETANCOURTH TORRES', 0, NULL, '2023-03-24 21:15:04', 111, 5, b'1', '3184728998', '', '');
INSERT INTO `nucleo_familiar` (`id_nucleofamiliar`, `nombres`, `apellidos`, `edad`, `fecha_nacimiento`, `fecha_upd`, `id_funcionario`, `id_parentesco`, `is_emergencia`, `contacto`, `contacto_2`, `parentesco`) VALUES
(999, 'EDGAR ', 'ARAMBULO ROJAS ', 65, '1957-11-19', '2023-03-24 21:18:23', 47, 2, b'1', '3013191031', '', ''),
(1000, 'RICARDO ', 'ARAMBULO POLO ', 37, '1985-05-02', '2023-03-24 21:18:23', 47, 5, b'1', '3013191031', '', ''),
(1001, 'MARIA NANCY', 'MARTINEZ ECHEVERRI', 52, '1971-03-13', '2023-03-24 21:21:25', 201, 3, b'1', '3187815696', '', ''),
(1002, 'Duvan sebastian', 'rivera vivas', 26, '1996-11-04', '2023-03-24 21:26:05', 218, 1, b'1', '3232928880', '', ''),
(1003, 'marleny', 'torres apraex', 55, '1968-03-19', '2023-03-24 21:26:05', 218, 3, b'1', '3127517872', '', ''),
(1004, 'gerardo antonio', 'hernandez orejuela', 56, '1966-04-15', '2023-03-24 21:26:05', 218, 2, b'1', '3127517872', '', ''),
(1005, 'andres felipe', 'hernandez torres', 22, '2000-06-12', '2023-03-24 21:26:05', 218, 5, b'1', '3227443791', '', ''),
(1006, 'LORENT NATALY ', 'SALAMANCA MAMIAN', 18, '2004-08-23', '2023-03-24 21:42:00', 298, 4, b'1', '3168669798', '', ''),
(1007, 'SUZANN STEFFY ', 'SALAMANCA MAMIAN', 6, '2016-06-09', '2023-03-24 21:42:00', 298, 4, b'1', '3217677302', '', ''),
(1008, 'RUBIEL ', 'SALAMANCA LOPEZ', 36, '1986-08-20', '2023-03-24 21:42:00', 298, 1, b'1', '3168669798', '', ''),
(1009, 'ARIADNA', ' GOMEZ NOGUERA', 15, '2008-03-23', '2023-03-24 21:49:02', 322, 4, b'1', '3215062211', '', ''),
(1010, 'ROCIO MICAELA ', 'NOGUERA GARCIA', 53, '1969-07-25', '2023-03-24 21:49:02', 322, 3, b'1', '3168669798', '', ''),
(1011, 'Cesar Tulio ', 'Cantero Figueroa', 39, '1983-10-24', '2023-03-24 21:52:49', 551, 1, b'1', '3104531488', '', ''),
(1012, 'Cesar David ', 'Cantero Trujillo', 14, '2008-09-03', '2023-03-24 21:52:49', 551, 4, b'1', '3112208617', '', ''),
(1013, 'Diana Carolina ', 'Naranjo Trujillo', 22, '2000-04-03', '2023-03-24 21:52:49', 551, 6, b'1', '3116267022', '', 'SOBRINA'),
(1014, 'LUANNA DE JANNA ', 'MARIN OROZCO', 1, '2021-07-28', '2023-03-24 21:55:54', 318, 4, b'1', '3104003061', '', ''),
(1015, 'DORA MARIXA', 'VILLA PAZMIÑO', 42, '1980-05-18', '2023-03-25 00:41:20', 468, 1, b'1', '3165621432', '', ''),
(1016, 'CARLOS DAVID ', 'QUIROZ VILLA', 13, '2009-06-24', '2023-03-25 00:41:20', 468, 4, b'1', '3156416032', '', ''),
(1017, 'MARÍA PAULA', 'QUIROZ ROSERO', 16, '2007-02-26', '2023-03-25 00:41:20', 468, 4, b'1', '3156416032', '', ''),
(1018, 'Lady Johanna', 'Marroquin Nasamues', 36, '1986-10-21', '2023-03-25 00:45:08', 330, 1, b'1', '3207206134', '', ''),
(1019, 'Juan Esteban', 'Jaramillo Marroquin', 2, '2020-09-10', '2023-03-25 00:45:08', 330, 4, b'1', '3207206134', '', ''),
(1020, 'Paola Andrea', 'Aguirre Quintero ', 47, '1975-04-28', '2023-03-25 00:49:55', 395, 1, b'1', '3103900932', '', ''),
(1021, 'Juan José ', 'Quilindo Aguirre ', 11, '2011-11-15', '2023-03-25 00:49:55', 395, 4, b'1', '3103900932', '', ''),
(1022, 'Julio Daniel ', 'Rosero Aguirre ', 20, '2003-01-02', '2023-03-25 00:49:55', 395, 6, b'1', '3103900932', '', 'hijastro'),
(1023, 'SANDRA JERALDINE', 'GOMEZ ZAMBRANO', 32, '1990-11-15', '2023-03-25 00:54:48', 454, 1, b'1', '3212378710', '', ''),
(1024, 'BENITO', 'LOPEZ CRUZ', 71, '1951-11-20', '2023-03-25 01:00:21', 228, 2, b'1', '3155923156', '', ''),
(1025, 'LADY ISABEL', 'CERON DE LOPEZ', 66, '1956-09-12', '2023-03-25 01:00:21', 228, 3, b'1', '3155923156', '', ''),
(1026, 'MARTHA PAULINA ', 'MATAMOROS BECERRA', 65, '1957-04-13', '2023-03-25 01:04:26', 476, 3, b'1', '3142933154', '', ''),
(1027, 'JAIME ANDRES', 'ROZO MATAMOROS', 31, '1991-12-01', '2023-03-25 01:04:26', 476, 5, b'1', '3142933154', '', ''),
(1028, 'lucy ', 'leon muñoz', 47, '1975-08-04', '2023-03-25 01:08:54', 134, 1, b'1', '3108228889', '', ''),
(1029, 'Juan Pablo', 'Forero Leon', 10, '2013-01-06', '2023-03-25 01:08:54', 134, 4, b'1', '3208781651', '', ''),
(1030, 'Ana Sofia ', 'Forero Leon', 15, '2007-06-25', '2023-03-25 01:08:54', 134, 4, b'1', '3108228889', '', ''),
(1031, 'Matias Emmanuel', 'Forero Leon', 13, '2010-03-08', '2023-03-25 01:08:54', 134, 4, b'1', '3108228889', '', ''),
(1032, 'nikol sofia ', 'venegas paez', 21, '2001-04-25', '2023-03-25 01:14:29', 500, 4, b'1', '3197319951', '', ''),
(1033, 'daniel esteban', 'venegas moya', 12, '2010-10-26', '2023-03-25 01:14:29', 500, 4, b'1', '3133715895', '', ''),
(1034, 'orlando ', 'venegas diaz', 62, '1960-08-20', '2023-03-25 01:14:29', 500, 2, b'1', '3212616517', '', ''),
(1035, 'Hilia ', 'Barona Escobar', 85, '1937-12-30', '2023-03-25 01:19:34', 180, 3, b'1', '3104722513', '', ''),
(1036, 'Carlos Fernando', 'Vega Barona', 47, '1976-03-16', '2023-03-25 01:19:34', 180, 5, b'1', '3104722513', '', ''),
(1037, 'MARIA DEL MAR', 'CAMPO MARTINEZ', 19, '2003-12-20', '2023-03-25 01:24:03', 543, 4, b'1', '3207230544', '', ''),
(1038, 'JULIAN ANDRES', 'CAMPO MARTINEZ', 24, '1998-05-09', '2023-03-25 01:24:03', 543, 4, b'1', '3104745298', '', ''),
(1039, 'GLORIA', 'MARTINEZ ZAMORANO', 55, '1968-01-08', '2023-03-25 01:24:03', 543, 1, b'1', '3145721688', '', ''),
(1040, 'LUCY ', 'GOMEZ LOPEZ', 45, '1978-03-12', '2023-03-25 01:42:30', 381, 1, b'1', '3127566740', '', ''),
(1041, 'LAURA CATALINA', 'PERAFAN GOMEZ', 19, '2004-01-28', '2023-03-25 01:42:30', 381, 4, b'1', '3117739534', '', ''),
(1042, 'DEIVA LOURDES', 'PERAFAN ZUÑIGA', 49, '1974-02-11', '2023-03-25 01:48:12', 426, 1, b'1', '3183035344', '', ''),
(1043, 'JEAN CARLOS', 'SAMBONI VELASCO', 13, '2010-02-02', '2023-03-25 01:48:12', 426, 4, b'1', '3126656975', '', ''),
(1044, 'JUAN JOSE', 'PERAFAN ZUÑIGA', 13, '2009-09-03', '2023-03-25 01:48:12', 426, 6, b'1', '3183035344', '', 'hijastro'),
(1045, 'NEIROBIS DEL CARMEN', 'LEDESMA RANGEL', 54, '1968-07-07', '2023-03-25 01:54:46', 305, 1, b'1', '3145165783', '', ''),
(1046, 'RONALDO ANDRES', 'INSIGNARES LEDESMA', 25, '1997-03-31', '2023-03-25 01:54:46', 305, 4, b'1', '3145165783', '', ''),
(1047, 'RICAHARD AMETH', 'INSIGNARES LEDESMA', 22, '2000-04-14', '2023-03-25 01:54:46', 305, 4, b'1', '3145165783', '', ''),
(1048, 'RAMON ALBERTO', 'INSIGNARES LEDESMA', 30, '1992-10-13', '2023-03-25 01:54:46', 305, 4, b'1', '3145165783', '', ''),
(1049, 'Alejandro ', 'Arango Lopez', 44, '1978-03-30', '2023-03-25 01:59:32', 370, 1, b'1', '3178079515', '', ''),
(1050, 'Emilia', 'Arango Otero ', 0, '2022-03-28', '2023-03-25 01:59:32', 370, 4, b'1', '3156699565', '', ''),
(1051, 'Jairo', 'Gómez Barco', 67, '1956-03-05', '2023-03-25 02:03:39', 572, 1, b'1', '3152852788', '', ''),
(1052, 'Ingrid Vannesa', 'Gómez Flórez', 27, '1996-01-23', '2023-03-25 02:03:39', 572, 4, b'1', '3152852788', '', ''),
(1053, 'Elizabeth', 'Ospina Martinez', 69, '1954-03-16', '2023-03-25 02:03:39', 572, 3, b'1', '3145240175', '', ''),
(1054, 'RAFAEL', 'LÓPEZ', 0, NULL, '2023-03-25 02:12:01', 240, 2, b'1', '3155570133', '', ''),
(1055, 'MAURA', 'HURTADO', 0, NULL, '2023-03-25 02:12:01', 240, 3, b'1', '30023', '', ''),
(1056, 'Hugo ', 'Lara Holguin', 45, '1977-07-04', '2023-03-25 02:15:40', 306, 1, b'1', '3122595845', '', ''),
(1057, 'Eliana Alejandra', 'Lara Muñoz', 35, '1987-11-07', '2023-03-25 02:15:40', 306, 4, b'1', '3122595845', '', ''),
(1058, 'Beatriz Elena', 'Sandoval Galeano', 66, '1956-05-30', '2023-03-25 02:20:20', 639, 3, b'1', '3187031529', '', ''),
(1059, 'Alvaro', 'Mafla Chaux', 67, '1955-07-28', '2023-03-25 02:20:20', 639, 2, b'1', '3043188541', '', ''),
(1061, 'Julian', 'Mafla Sandoval', 0, NULL, '2023-03-25 02:25:35', 639, 5, b'1', '3187031529', '', ''),
(1062, 'MICHELL DAYAN', 'MORALES ZEA', 17, '2005-08-16', '2023-03-25 02:29:53', 560, 4, b'1', '3242626566', '', ''),
(1063, 'JOSSELYN', 'PERDIGON CAINA', 19, '2003-12-30', '2023-03-25 02:34:15', 68, 4, b'1', '3174730108', '', ''),
(1064, 'ESTEFANIA', 'ZAMBRANO CAINA', 28, '1994-07-25', '2023-03-25 02:34:15', 68, 4, b'1', '3174730108', '', ''),
(1065, 'Janis Yvette', ' Arias Sánchez', 29, '1993-04-27', '2023-03-25 02:37:16', 439, 4, b'1', '3157701999', '', ''),
(1066, 'CAMPO', 'MUÑOZ MARTINEZ', 54, '1968-09-18', '2023-03-25 02:41:18', 499, 1, b'1', '3166715344', '', ''),
(1067, 'ANDRES FELIPE ', 'MUÑOZ VELEZ', 27, '1995-12-30', '2023-03-25 02:41:18', 499, 4, b'1', '3166715344', '', ''),
(1068, 'JUAN CAMILO', 'MUÑOZ VELEZ', 20, '2003-03-17', '2023-03-25 02:41:18', 499, 4, b'1', '3154151558', '', ''),
(1069, 'CLAUDIA MILENA', 'VELEZ TORRES', 53, '1969-07-25', '2023-03-25 02:41:18', 499, 5, b'1', '3115613253', '', ''),
(1070, 'ARNOLD HUMBERTO', 'CABRERA PERLAZA', 25, '1998-01-09', '2023-03-25 02:45:52', 388, 4, b'1', '3234852513', '', ''),
(1071, 'OSCAR HUMBERTO', 'CABRERA OSORIO', 55, '1967-10-04', '2023-03-25 02:45:52', 388, 1, b'1', '3176767712', '', ''),
(1072, 'GILBERT JEISON', 'PERLAZA MONTAÑO', 29, '1993-07-19', '2023-03-25 02:45:52', 388, 4, b'1', '3168830751', '', ''),
(1073, 'Manuela', 'Pastrana Vivas', 22, '2001-01-12', '2023-03-25 02:50:37', 640, 4, b'1', '3207250807', '', ''),
(1074, 'Josse Manuel', 'Lorza Vivas', 11, '2011-09-27', '2023-03-25 02:50:37', 640, 4, b'1', '3022747588', '', ''),
(1075, 'Luciana', 'Ramirez Vivas', 8, '2015-01-01', '2023-03-25 02:50:37', 640, 4, b'1', '3105697096', '', ''),
(1076, 'JHONATAN', 'CARRILLO RESTREPO', 31, '1991-12-01', '2023-03-25 02:55:21', 404, 4, b'1', '3215753134', '', ''),
(1077, 'JAIME ANDRES', 'JARAMILLO RESTREPO', 31, '1991-09-24', '2023-03-25 02:55:21', 404, 4, b'1', '3159273999', '', ''),
(1078, 'JAIME NARCISO', 'JARAMILLO AREVALO', 59, '1964-01-17', '2023-03-25 02:55:21', 404, 1, b'1', '3159273999', '', ''),
(1079, 'YULY ASCENETH', 'ROMERO DONADO', 65, '1957-06-20', '2023-03-25 02:59:24', 23, 3, b'1', '3143571651', '', ''),
(1080, 'JULIO CESAR', 'AVILA DITTA', 69, '1953-10-18', '2023-03-25 02:59:24', 23, 2, b'1', '3177532440', '', ''),
(1081, 'JULIO DE JESUS', 'AVILA ROMERO', 41, '1981-11-06', '2023-03-25 02:59:24', 23, 5, b'1', '3202719370', '', ''),
(1082, 'NILCE DIOMIR', 'AVILA ROMERO', 29, '1993-05-19', '2023-03-25 02:59:24', 23, 5, b'1', '3104503621', '', ''),
(1083, 'Sol Angela', 'Rodríguez', 81, '1941-03-26', '2023-03-25 03:02:34', 262, 3, b'1', '3132852063', '', ''),
(1084, 'Graciela', 'Morales Rodríguez ', 62, '1960-09-20', '2023-03-25 03:02:34', 262, 5, b'1', '3053043649', '', ''),
(1085, 'DAVID SANTIAGO ', 'CASAS SAMBONI', 13, '2009-11-01', '2023-03-25 03:06:38', 428, 4, b'1', '3226586924', '', ''),
(1086, 'MARIA ELODIA ', 'ORDOÑEZ', 65, '1958-01-01', '2023-03-25 03:06:38', 428, 3, b'1', '3132852063', '', ''),
(1087, 'OTONIEL ', 'SAMBONI MUÑOZ', 69, '1954-02-03', '2023-03-25 03:06:38', 428, 2, b'1', '3226586924', '', ''),
(1088, 'PAULO GERMAN', 'PORRAS VELASCO', 46, '1976-06-15', '2023-03-25 03:10:37', 103, 6, b'1', '3226027849', '', 'compañero'),
(1089, 'MARLENY ', 'BETANCOURT RIOS', 56, '1966-12-19', '2023-03-25 03:10:37', 103, 5, b'1', '3106515780', '', ''),
(1090, 'Francisco José ', ' Luna Ramírez', 56, '1967-01-29', '2023-03-25 03:15:09', 48, 1, b'1', '3206939435', '', ''),
(1091, 'Francisco Javier', 'Luna Arango', 32, '1990-07-13', '2023-03-25 03:15:09', 48, 4, b'1', '3057503105', '', ''),
(1092, 'José David', 'Luna Arango', 28, '1995-03-09', '2023-03-25 03:15:09', 48, 4, b'1', '3106919207', '', ''),
(1093, 'Adriana Margarita', 'Luna Arango', 26, '1996-08-26', '2023-03-25 03:15:09', 48, 4, b'1', '3206939434', '', ''),
(1094, 'Juan Pablo ', 'Rueda Angulo ', 26, '1997-01-07', '2023-03-25 03:20:40', 556, 4, b'1', '3165836335', '', ''),
(1095, 'Belisario Rueda', 'Rueda Escobar', 91, '1931-07-10', '2023-03-25 03:20:40', 556, 2, b'1', '3165836335', '', ''),
(1096, 'Maria Antonia ', 'Motato de Rivera', 69, '1953-05-31', '2023-03-25 03:24:48', 416, 3, b'1', '3053064827', '', ''),
(1097, 'Ana Lucia ', 'Rivera Motato', 39, '1983-04-23', '2023-03-25 03:24:48', 416, 5, b'1', '3128268633', '', ''),
(1098, 'Francisco Javier', 'Rivera Motato', 39, '1983-07-12', '2023-03-25 03:24:48', 416, 5, b'1', '3053064827', '', ''),
(1099, 'KAROL MICHEL', 'CASTILLO  BETANCUR', 26, '1996-07-15', '2023-03-25 03:27:54', 118, 4, b'1', '3227358529', '', ''),
(1100, 'LAURA ALEJANDRA ', 'CASTILLO BETANCUR', 14, '2008-11-15', '2023-03-25 03:27:54', 118, 4, b'1', '3227358529', '', ''),
(1101, 'MANUEL ALEXANDER ', 'RODRIGUEZ PARRA', 39, '1984-01-27', '2023-03-25 03:31:34', 302, 1, b'1', '3105947899', '', ''),
(1102, 'LEYNI TATIANA ', 'CUELLAR RODRIGUEZ', 38, '1985-02-25', '2023-03-25 03:31:34', 302, 5, b'1', '3112205504', '', ''),
(1103, 'Gian pierre  ', 'Gallego salazar', 19, '2003-03-30', '2023-03-25 03:37:25', 641, 4, b'1', '3187787654', '', ''),
(1104, 'Juan jose ', 'Gallego salazar', 15, '2007-03-29', '2023-03-25 03:37:25', 641, 4, b'1', '3124410546', '', ''),
(1105, 'Martha ', 'Velosa ', 48, '1974-11-11', '2023-03-25 03:37:25', 641, 6, b'1', '3163669036', '', 'PRIMA'),
(1106, 'Jackeline', 'Flores ', 36, '1986-09-17', '2023-03-25 03:37:25', 641, 6, b'1', '3186288298', '', 'MEJOR AMIGA'),
(1107, 'JAIRO OSWALDO', 'IBARRA CORTES', 44, '1978-06-09', '2023-03-25 03:41:42', 255, 1, b'1', '3054552524', '', ''),
(1108, 'CESAR ANDRES', 'LASPRILLA LUCUMI', 17, '2006-02-27', '2023-03-25 03:41:42', 255, 4, b'1', '3184070010', '', ''),
(1109, 'JACOBO ', 'IBARRA LUCUMI', 9, '2013-12-02', '2023-03-25 03:41:42', 255, 4, b'1', '3218864443', '', ''),
(1110, 'Antonella', 'Villada Cardozo ', 8, '2015-03-05', '2023-03-27 22:15:06', 117, 4, b'1', '573226132837', '', ''),
(1111, 'Rodolfo ', 'Cardozo barrero ', 58, '1964-04-23', '2023-03-27 22:15:06', 117, 2, b'1', '3147203428', '', ''),
(1112, 'Sthefany', 'Gonzaléz Churi ', 19, '2003-07-31', '2023-03-27 22:19:43', 265, 4, b'1', '3024608263', '', ''),
(1113, 'José Fernándo ', 'Usurriaga Churi ', 7, '2015-11-04', '2023-03-27 22:19:43', 265, 4, b'1', '3126474886', '', ''),
(1114, 'Ana Amparo ', 'Aguilar ', 67, '1956-02-08', '2023-03-27 22:19:43', 265, 3, b'1', '3218787500', '', ''),
(1115, 'ANDRÉS DAVID', 'ACOSTA CASTRO', 39, '1983-11-07', '2023-03-27 22:38:29', 496, 1, b'1', '3175566772', '', ''),
(1116, 'AURA DANIELA', 'ZAPATA VELASQUEZ', 25, '1997-10-23', '2023-03-27 22:38:29', 496, 4, b'1', '3173556824', '', ''),
(1117, 'MILTON CESAR', 'OROZCO ZUÑIGA', 49, '1973-11-14', '2023-03-27 22:46:29', 292, 1, b'1', '313749626', '', ''),
(1118, 'KATHERIN VALERIA ', 'OROZCO MOSQUERA', 25, '1997-07-18', '2023-03-27 22:46:29', 292, 4, b'1', '3138030908', '', ''),
(1119, 'MARIA CAMILA', 'OROZCO MOSQUERA', 24, '1999-02-11', '2023-03-27 22:46:29', 292, 4, b'1', '3103749626', '', ''),
(1120, 'Maria Ingrid ', 'Florez ', 75, '1947-11-10', '2023-03-27 23:00:23', 642, 3, b'1', '3207851721', '', ''),
(1121, 'Laura Lucía ', 'Almeira Grandez ', 29, '1993-07-16', '2023-03-27 23:00:23', 642, 4, b'1', '3016438454', '', ''),
(1122, 'Diego Esteban ', 'Delgado Caldón', 0, NULL, '2023-03-27 23:18:52', 434, 1, b'1', '3155657963', '', ''),
(1123, 'María Angelica ', 'Aguilar Sánchez', 0, NULL, '2023-03-27 23:18:52', 434, 4, b'1', '3116282664', '', ''),
(1124, 'Reinaldo', 'Sánchez Ordoñez', 0, NULL, '2023-03-27 23:18:52', 434, 2, b'1', '3122519635', '', ''),
(1125, 'María Marlene ', 'Riascos Martínez', 0, NULL, '2023-03-27 23:18:52', 434, 3, b'1', '3122519635', '', ''),
(1126, 'Martín Emilio ', 'Henao Mosquera ', 0, NULL, '2023-03-27 23:23:36', 331, 1, b'1', '3113138937', '', ''),
(1127, 'Adriana ', 'Franco Diaz', 0, NULL, '2023-03-27 23:23:36', 331, 4, b'1', '3103749626', '', ''),
(1128, 'Andrés ', 'Franco Diaz ', 0, NULL, '2023-03-27 23:23:36', 331, 4, b'1', '3188408133', '', ''),
(1129, 'LUZ HELENA', 'QUINTERO LOPEZ', 0, NULL, '2023-03-27 23:36:58', 397, 5, b'1', '3137048588', '', ''),
(1130, 'NOHORA ESTHER ', 'VILLEGAS', 0, NULL, '2023-03-28 00:45:58', 561, 3, b'1', '3136691807', '', ''),
(1131, 'MARTIN ALONSO', 'SAAVEDRA VILLEGAS', 0, NULL, '2023-03-28 00:45:58', 561, 5, b'1', '3152754576', '', ''),
(1132, 'PATRICIA', 'CARABALI MEZU', 9, '2014-11-12', '2023-03-28 19:47:45', 109, 5, b'1', '3126385501', '', ''),
(1133, 'FELIPE', 'GUZMAN TIMARAN', 33, '1989-07-22', '2023-04-10 16:53:54', 643, 1, b'1', '333322', '-13', ''),
(1134, 'JULIETH ', 'TREJOS', 0, NULL, '2023-04-10 20:48:23', 644, 1, b'1', '-2', '', ''),
(1135, 'ARIANNA', 'SALAMANCA CALERO', 10, '2013-03-21', '2023-04-10 22:25:21', 646, 4, b'0', '', '', ''),
(1136, 'ANA BOLENA', 'CALERO', 0, NULL, '2023-04-10 22:25:21', 646, 5, b'1', '', '', ''),
(1137, 'LILIANA XIMENA', 'ROJAS RAMIREZ', 64, '1958-08-10', '2023-04-27 15:54:42', 647, 5, b'1', '-2333333', '-5333', ''),
(1138, 'ALEXANDRA', 'VARGAS OSPINA', 31, '1992-09-12', '2023-11-17 14:50:58', 648, 1, b'1', '312', '7626438', ''),
(1139, 'JOSE ALEJANDRO', 'AGUDELO VALENCIA', 43, '1980-08-19', '2023-12-06 19:46:50', 72, 1, b'1', '3124802758', '-1', ''),
(1140, 'FERNANDO ', 'MEJIA', 0, NULL, '2023-12-18 21:34:45', 649, 2, b'1', '311', '6001891', ''),
(1141, 'MARYCRUZ', 'CARABALI', 0, NULL, '2023-12-18 21:57:23', 650, 3, b'1', '322', '2627730', ''),
(1142, 'JACOB', 'BARONA VARGAS', 5, '2018-08-17', '2024-01-05 14:39:46', 648, 4, b'0', '', '', ''),
(1143, 'FLORALBA', 'BOLAÑOS PAMO', 124, '1900-01-01', '2024-01-10 22:18:51', 651, 3, b'0', '', '', ''),
(1144, 'ORLANDO', 'RAMOS CLAROS', 124, '1900-01-01', '2024-01-10 22:18:51', 651, 2, b'0', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `idopcion` int(11) NOT NULL,
  `opcion` varchar(255) NOT NULL,
  `id_opcionpadre` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(833, 15, 8, 75, 0),
(832, 14, 8, 75, 0),
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
(831, 13, 8, 75, 0),
(830, 12, 8, 75, 0),
(829, 11, 7, 75, 0),
(828, 10, 7, 75, 0),
(827, 9, 6, 75, 0),
(826, 7, 5, 75, 0),
(825, 6, 4, 75, 0),
(824, 5, 3, 75, 0),
(823, 4, 3, 75, 1),
(822, 3, 2, 75, 0),
(821, 2, 2, 75, 0),
(820, 8, 1, 75, 0),
(819, 1, 1, 75, 0),
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
(961, 15, 8, 1, 1),
(960, 14, 8, 1, 1),
(959, 13, 8, 1, 1),
(958, 12, 8, 1, 1),
(957, 11, 7, 1, 1),
(956, 10, 7, 1, 1),
(955, 9, 6, 1, 1),
(954, 7, 5, 1, 1),
(953, 6, 4, 1, 1),
(952, 5, 3, 1, 1),
(951, 4, 3, 1, 1),
(950, 3, 2, 1, 1),
(949, 2, 2, 1, 1),
(948, 8, 1, 1, 1),
(947, 1, 1, 1, 1),
(856, 9, 6, 78, 1),
(855, 7, 5, 78, 1),
(854, 6, 4, 78, 1),
(853, 5, 3, 78, 1),
(852, 4, 3, 78, 1),
(876, 4, 3, 79, 0),
(875, 3, 2, 79, 0),
(874, 2, 2, 79, 0),
(873, 8, 1, 79, 1),
(872, 1, 1, 79, 1),
(809, 1, 1, 80, 0),
(810, 3, 2, 80, 0),
(811, 12, 8, 80, 1),
(812, 13, 8, 80, 1),
(813, 14, 8, 80, 1),
(814, 15, 8, 80, 1),
(815, 10, 7, 81, 1),
(816, 11, 7, 81, 1),
(817, 10, 7, 82, 1),
(818, 11, 7, 82, 1),
(851, 8, 1, 78, 1),
(850, 1, 1, 78, 1),
(857, 1, 1, 83, 0),
(858, 8, 1, 83, 0),
(859, 2, 2, 83, 0),
(860, 3, 2, 83, 0),
(861, 4, 3, 83, 0),
(862, 5, 3, 83, 0),
(863, 6, 4, 83, 0),
(864, 7, 5, 83, 0),
(865, 9, 6, 83, 0),
(866, 10, 7, 83, 0),
(867, 11, 7, 83, 0),
(868, 12, 8, 83, 0),
(869, 13, 8, 83, 0),
(870, 14, 8, 83, 0),
(871, 15, 8, 83, 0),
(877, 5, 3, 79, 0),
(878, 6, 4, 79, 1),
(879, 7, 5, 79, 1),
(880, 9, 6, 79, 1),
(881, 10, 7, 79, 0),
(882, 11, 7, 79, 0),
(883, 12, 8, 79, 0),
(884, 13, 8, 79, 0),
(885, 14, 8, 79, 0),
(886, 15, 8, 79, 0),
(887, 1, 1, 84, 1),
(888, 8, 1, 84, 1),
(889, 2, 2, 84, 1),
(890, 3, 2, 84, 1),
(891, 4, 3, 84, 1),
(892, 5, 3, 84, 1),
(893, 6, 4, 84, 1),
(894, 7, 5, 84, 1),
(895, 9, 6, 84, 1),
(896, 10, 7, 84, 1),
(897, 11, 7, 84, 1),
(898, 12, 8, 84, 1),
(899, 13, 8, 84, 1),
(900, 14, 8, 84, 1),
(901, 15, 8, 84, 1),
(902, 1, 1, 85, 1),
(903, 8, 1, 85, 1),
(904, 2, 2, 85, 1),
(905, 3, 2, 85, 1),
(906, 4, 3, 85, 1),
(907, 5, 3, 85, 1),
(908, 6, 4, 85, 1),
(909, 7, 5, 85, 1),
(910, 9, 6, 85, 1),
(911, 10, 7, 85, 1),
(912, 11, 7, 85, 1),
(913, 12, 8, 85, 1),
(914, 13, 8, 85, 1),
(915, 14, 8, 85, 1),
(916, 15, 8, 85, 1),
(932, 1, 1, 86, 1),
(933, 8, 1, 86, 1),
(934, 2, 2, 86, 1),
(935, 3, 2, 86, 1),
(936, 4, 3, 86, 1),
(937, 5, 3, 86, 1),
(938, 6, 4, 86, 1),
(939, 7, 5, 86, 1),
(940, 9, 6, 86, 1),
(941, 10, 7, 86, 1),
(942, 11, 7, 86, 1),
(943, 12, 8, 86, 1),
(944, 13, 8, 86, 1),
(945, 14, 8, 86, 1),
(946, 15, 8, 86, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcionpadre`
--

CREATE TABLE `opcionpadre` (
  `idopcionpadre` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `parentesco` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `tipo_proceso` varchar(45) NOT NULL,
  `fecha_crea` date NOT NULL,
  `otro` text DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retiro`
--

CREATE TABLE `retiro` (
  `id_retiro` int(11) NOT NULL,
  `acta_informe` enum('SI','NO','NO APLICA') DEFAULT NULL,
  `examen_medico` enum('SI','NO','NO APLICA') DEFAULT NULL,
  `comprovante_devolucion` enum('SI','NO','NO APLICA') DEFAULT NULL,
  `hoja_sigep` enum('SI','NO','NO APLICA') DEFAULT NULL,
  `declaracion_sigep` enum('SI','NO','NO APLICA') DEFAULT NULL,
  `carnet_servidor` enum('SI','NO','NO APLICA') DEFAULT NULL,
  `nombre_funcionario_receptor` varchar(85) DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `id_funcionario` int(11) NOT NULL,
  `paz_salvo` varchar(255) DEFAULT NULL,
  `id_causaretiro` int(11) DEFAULT NULL,
  `tipo_retiro` varchar(45) DEFAULT NULL,
  `otro` text DEFAULT NULL,
  `fecha_retiro` date DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `sede` varchar(60) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `fecha_crea` date NOT NULL,
  `fecha_upd` datetime DEFAULT current_timestamp(),
  `is_activo` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
(487, NULL, 72, 15, 5, 1, 1, 1, 0, '2022-07-29 11:03:50'),
(488, '2022-04-25', 2, 3, 1, 1, NULL, 1, 0, '2023-03-01 17:17:03'),
(489, '2023-03-07', 606, 2, 2, 1, 2, 1, 0, '2023-03-07 13:34:44'),
(490, NULL, 534, 11, 3, 1, NULL, 1, 0, '2023-03-08 19:36:38'),
(491, NULL, 406, 14, 5, 1, 2, 1, 0, '2023-03-09 15:53:12'),
(492, '2023-03-07', 606, 2, 2, 1, 2, 1, 0, '2023-03-16 22:01:25'),
(493, NULL, 406, 14, 6, 1, 1, 1, 0, '2023-04-12 22:28:24'),
(494, NULL, 406, 14, 6, 1, 1, 1, 0, '2023-04-12 22:28:54'),
(495, NULL, 406, 14, 6, 1, 1, 1, 0, '2024-03-19 21:57:38'),
(496, NULL, 643, 3, 5, 1, 1, 1, 0, '2024-03-19 22:10:50'),
(497, NULL, 406, 14, 6, 1, NULL, 1, 0, '2024-03-19 22:11:48'),
(498, NULL, 643, 3, 3, 1, 1, 1, 0, '2024-03-19 22:12:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_retiro`
--

CREATE TABLE `tipos_retiro` (
  `id_tiposretiro` int(11) NOT NULL,
  `tipo_retiro` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `is_retiro` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `abreviacion` varchar(45) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_documento` varchar(45) NOT NULL,
  `is_activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `rh` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  `tipo_vinculacion` varchar(65) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `is_activa` bit(1) NOT NULL DEFAULT b'1',
  `fecha_upd` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
(7, 'T.Oficial', NULL, b'1', '2022-04-03 22:16:52'),
(8, 'Trabajador social', NULL, b'1', '2023-03-05 23:23:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trazabilidad_actividades`
--

CREATE TABLE `trazabilidad_actividades` (
  `id_actividad` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `fecha_inicio_suspencion` date DEFAULT NULL,
  `fecha_final_suspencion` date DEFAULT NULL,
  `consecutivo` int(11) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `tiempo_gen` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `trazabilidad_actividades`
--

INSERT INTO `trazabilidad_actividades` (`id_actividad`, `estado`, `observacion`, `fecha_inicio_suspencion`, `fecha_final_suspencion`, `consecutivo`, `motivo`, `tiempo_gen`) VALUES
(12, 'SUSPENDIDO', NULL, NULL, NULL, 1, NULL, '2023-03-17 19:30:48'),
(12, 'REALIZADO', 'Prueba de observación y realizado', NULL, NULL, 2, NULL, '2023-03-17 20:16:04'),
(12, 'CANCELADO', 'cancelacion', NULL, NULL, 3, NULL, '2023-03-17 20:21:04'),
(12, 'SUSPENDIDO', 'Motivo suspención de prueba', '2023-03-17', '2023-03-29', 4, NULL, '2023-03-17 20:23:40'),
(12, 'REALIZADO', 'Prueba de observación y realizado', NULL, NULL, 5, NULL, '2023-03-19 16:55:09'),
(12, 'PENDIENTE', NULL, NULL, NULL, 6, NULL, '2023-03-19 17:08:26'),
(12, 'REALIZADO', 'Prueba de observación y realizado', NULL, NULL, 7, NULL, '2023-03-20 14:46:42'),
(13, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-04-10 21:57:19'),
(14, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 18:48:43'),
(14, 'REALIZADO', NULL, NULL, NULL, 2, NULL, '2023-11-28 18:49:26'),
(15, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 18:51:48'),
(16, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 18:56:56'),
(17, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 19:00:11'),
(17, 'REALIZADO', NULL, NULL, NULL, 2, NULL, '2023-11-28 19:03:16'),
(18, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 19:05:23'),
(19, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 19:07:06'),
(20, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 19:25:18'),
(21, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 19:28:55'),
(22, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 19:33:52'),
(23, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 20:01:33'),
(24, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 20:04:04'),
(25, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 20:05:37'),
(26, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 20:07:51'),
(27, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 20:09:29'),
(28, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 20:25:17'),
(28, 'REALIZADO', NULL, NULL, NULL, 2, NULL, '2023-11-28 20:43:39'),
(29, 'REALIZADO', NULL, NULL, NULL, 1, NULL, '2023-11-28 21:31:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trazabilidad_actividades_programadas`
--

CREATE TABLE `trazabilidad_actividades_programadas` (
  `id_actividadprogramada` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT 'PENDIENTE',
  `observacion` text DEFAULT NULL,
  `fecha_inicio_suspencion` date DEFAULT NULL,
  `fecha_final_suspencion` date DEFAULT NULL,
  `fecha_` date DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `tiempo_gen` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `trazabilidad_actividades_programadas`
--

INSERT INTO `trazabilidad_actividades_programadas` (`id_actividadprogramada`, `estado`, `observacion`, `fecha_inicio_suspencion`, `fecha_final_suspencion`, `fecha_`, `consecutivo`, `motivo`, `tiempo_gen`) VALUES
(38, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-15 10:33:44'),
(38, 'REALIZADO', 'REALIZACIÓN DE PRUEBA', NULL, NULL, '2023-01-15', 2, NULL, '2023-01-15 10:38:15'),
(38, 'SUSPENDIDO', 'SUSPENCIÓN DE PRUEBA', '2023-01-15', '2023-01-15', NULL, 3, NULL, '2023-01-15 10:38:43'),
(39, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-15 10:39:31'),
(39, 'REALIZADO', '', NULL, NULL, '2023-01-15', 2, NULL, '2023-01-15 10:40:03'),
(40, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-15 14:09:52'),
(27, 'PENDIENTE', 'Hola estoy en prueba', NULL, NULL, NULL, 1, NULL, '2023-01-15 18:42:25'),
(27, 'REALIZADO', 'Hola estoy en prueba', NULL, NULL, '2023-01-06', 2, NULL, '2023-01-15 18:42:34'),
(27, 'PENDIENTE', 'Hola estoy en prueba', NULL, NULL, NULL, 3, NULL, '2023-01-15 18:42:47'),
(27, 'REALIZADO', 'Hola estoy en prueba', NULL, NULL, '2023-01-06', 4, NULL, '2023-01-15 18:42:53'),
(41, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-16 01:29:42'),
(41, 'REALIZADO', '', NULL, NULL, NULL, 2, NULL, '2023-01-16 01:30:08'),
(41, 'SUSPENDIDO', '', '2023-01-27', '2023-01-27', NULL, 3, NULL, '2023-01-16 01:30:29'),
(41, 'CANCELADO', '', NULL, NULL, '2023-01-16', 4, NULL, '2023-01-16 01:30:51'),
(1, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-16 15:53:09'),
(1, 'REALIZADO', 'Trazabiliad', NULL, NULL, NULL, 2, NULL, '2023-01-16 16:33:38'),
(2, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-16 16:33:54'),
(1, 'PENDIENTE', 'Trazabiliad', NULL, NULL, NULL, 3, NULL, '2023-01-18 20:42:16'),
(3, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-19 10:32:07'),
(3, 'REALIZADO', '', NULL, NULL, '2023-01-18', 2, NULL, '2023-01-19 10:39:55'),
(1, 'CANCELADO', 'Trazabiliad', NULL, NULL, '2023-01-17', 4, NULL, '2023-01-20 18:23:47'),
(1, 'REALIZADO', 'Trazabiliad', NULL, NULL, '2023-01-17', 5, NULL, '2023-01-20 18:32:34'),
(1, 'SUSPENDIDO', 'Trazabiliad', '2023-01-20', '2023-01-20', NULL, 6, NULL, '2023-01-20 18:32:53'),
(1, 'REALIZADO', 'Trazabiliad', NULL, NULL, '2023-01-17', 7, NULL, '2023-01-20 18:33:04'),
(1, 'CANCELADO', 'Trazabiliad', NULL, NULL, '2023-01-17', 8, NULL, '2023-01-20 18:34:17'),
(1, 'REALIZADO', 'Trazabiliad', NULL, NULL, '2023-01-17', 9, NULL, '2023-01-20 18:34:23'),
(1, 'CANCELADO', 'Trazabiliad', NULL, NULL, '2023-01-17', 10, NULL, '2023-01-20 18:36:56'),
(1, 'CANCELADO', 'Trazabiliad', NULL, NULL, '2023-01-17', 11, NULL, '2023-01-20 18:37:02'),
(4, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-03-07 19:19:52'),
(4, 'SUSPENDIDO', 'Por mal clima', '2023-03-08', '2023-03-08', NULL, 2, NULL, '2023-03-07 19:23:18'),
(4, 'REALIZADO', 'SE CAMBIO.', NULL, NULL, NULL, 3, NULL, '2023-03-07 19:54:23'),
(5, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:02:38'),
(6, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:04:20'),
(7, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:08:40'),
(8, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:16:49'),
(9, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:18:16'),
(10, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:19:40'),
(11, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:25:03'),
(12, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:26:53'),
(13, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:28:02'),
(14, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:29:39'),
(15, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:32:09'),
(16, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:35:32'),
(17, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:40:11'),
(18, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 15:45:14'),
(19, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:12:55'),
(20, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:15:07'),
(21, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:25:13'),
(22, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:30:15'),
(23, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:32:43'),
(24, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:34:18'),
(25, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:35:22'),
(26, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:39:12'),
(27, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:43:09'),
(28, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:53:05'),
(29, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 16:55:44'),
(30, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 17:04:04'),
(31, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 17:05:09'),
(32, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 17:05:59'),
(33, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 17:06:46'),
(34, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 17:08:36'),
(35, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 17:10:32'),
(36, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 17:12:52'),
(37, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:09:39'),
(38, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:11:49'),
(39, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:13:31'),
(40, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:15:00'),
(41, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:18:11'),
(42, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:22:45'),
(43, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:25:15'),
(44, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:28:16'),
(45, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:30:55'),
(46, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:34:26'),
(47, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:36:07'),
(48, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:37:36'),
(49, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:38:46'),
(50, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:43:45'),
(51, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:45:25'),
(52, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:47:49'),
(53, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:49:21'),
(54, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:52:17'),
(55, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:55:28'),
(56, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:57:59'),
(57, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 19:59:27'),
(58, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 20:08:12'),
(59, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 21:50:38'),
(60, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 21:51:45'),
(61, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 21:52:44'),
(62, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 21:53:54'),
(63, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 21:56:06'),
(64, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 21:57:27'),
(65, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 21:59:24'),
(66, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:00:48'),
(67, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:03:23'),
(68, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:04:16'),
(69, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:07:22'),
(70, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:08:42'),
(71, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:10:16'),
(72, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:11:57'),
(73, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:13:12'),
(74, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:16:45'),
(75, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:21:55'),
(76, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:22:49'),
(77, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:23:30'),
(78, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:24:16'),
(79, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:25:05'),
(80, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:26:05'),
(81, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:27:10'),
(82, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:34:05'),
(83, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:34:59'),
(84, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:35:38'),
(85, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:36:28'),
(86, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:47:22'),
(87, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:52:41'),
(88, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:54:02'),
(89, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:55:07'),
(90, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:56:06'),
(91, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:57:15'),
(92, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 22:58:49'),
(93, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 23:00:00'),
(94, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 23:16:39'),
(95, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-10 23:19:44'),
(96, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:25:22'),
(97, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:26:39'),
(98, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:28:03'),
(99, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:29:22'),
(100, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:31:12'),
(101, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:35:07'),
(102, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:36:35'),
(103, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:38:37'),
(104, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:46:27'),
(105, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:47:33'),
(106, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:54:27'),
(107, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:57:38'),
(108, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 13:59:29'),
(109, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 14:03:22'),
(110, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 14:04:58'),
(111, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 14:06:22'),
(112, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 14:08:40'),
(113, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 14:10:22'),
(114, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 14:13:13'),
(115, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 14:14:15'),
(116, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 14:15:24'),
(117, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 14:16:43'),
(118, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-13 20:51:54'),
(6, 'REALIZADO', 'mediante acto administrativo Resolución 030 del 24 febrero del 2023, por medio del cual se adopta actualización realizada a la Política y los objetivos de Seguridad salud en el trabajo de la Alcaldía Municipal, los cuales enmarcan los principios, el compromiso gerencial y establece el marco de referencia para promover la mejora continua en las condiciones de salud y seguridad en los centros de trabajo de la Institución. la cual se divulgo a los correos de las dependencias, funcionarios, por correspondencia SISNET, carteleras y en las secciones de reinduccion e induccion.  ', NULL, NULL, NULL, 2, NULL, '2023-11-08 14:38:08'),
(6, 'REALIZADO', 'mediante acto administrativo Resolución 030 del 24 febrero del 2023, por medio del cual se adopta actualización realizada a la Política y los objetivos de Seguridad salud en el trabajo de la Alcaldía Municipal, los cuales enmarcan los principios, el compromiso gerencial y establece el marco de referencia para promover la mejora continua en las condiciones de salud y seguridad en los centros de trabajo de la Institución. la cual se divulgo a los correos de las dependencias, funcionarios, por correspondencia SISNET, carteleras y en las secciones de reinduccion e induccion.  ', NULL, NULL, NULL, 3, NULL, '2023-11-08 14:38:24'),
(7, 'SUSPENDIDO', 'Actividad que se programo con asesor de la ARL, de lo que se ha realizado visitas en campo, queda pendiente terminar visitas e informe para el mes de noviembre.', '2023-11-30', '2023-11-30', NULL, 2, NULL, '2023-11-08 14:49:40'),
(27, 'REALIZADO', 'Se realizo capacitación en seguridad vial a los integrantes del Comite Paritario de Seguridad y Salud en el Trabajo ya que requieren competencias al ser comite integrado con el Comite de Seguridad Vial. ', NULL, NULL, NULL, 5, NULL, '2023-11-08 15:40:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trazabilidad_capacitaciones`
--

CREATE TABLE `trazabilidad_capacitaciones` (
  `id_capacitacion` int(11) NOT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `observacion` varchar(400) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `fecha_inicio_suspencion` date DEFAULT NULL,
  `fecha_final_suspencion` date DEFAULT NULL,
  `fecha_` date DEFAULT NULL,
  `consecutivo` int(11) DEFAULT NULL,
  `motivo` int(11) DEFAULT NULL,
  `tiempo_gen` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `trazabilidad_capacitaciones`
--

INSERT INTO `trazabilidad_capacitaciones` (`id_capacitacion`, `estado`, `observacion`, `calificacion`, `fecha_inicio_suspencion`, `fecha_final_suspencion`, `fecha_`, `consecutivo`, `motivo`, `tiempo_gen`) VALUES
(18, 'REALIZADO', 'Observaciones de prueba', 7, NULL, NULL, NULL, 1, NULL, '2023-03-16 09:55:36'),
(18, 'REALIZADO', 'sADASDSA', 1, NULL, NULL, NULL, 2, NULL, NULL),
(18, 'PENDIENTE', NULL, 1, NULL, NULL, NULL, 3, NULL, NULL),
(18, 'REALIZADO', 'hgh', 1, NULL, NULL, NULL, 4, NULL, NULL),
(3, 'PENDIENTE', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-03-16 22:13:50'),
(3, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 2, NULL, '2023-03-16 22:22:49'),
(3, 'PENDIENTE', NULL, 1, NULL, NULL, NULL, 3, NULL, '2023-03-16 22:30:59'),
(3, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 4, NULL, '2023-03-16 22:42:49'),
(18, 'PENDIENTE', NULL, 1, NULL, NULL, NULL, 5, NULL, '2023-03-17 04:54:54'),
(18, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 6, NULL, '2023-03-17 06:07:16'),
(18, 'SUSPENDIDO', 'Prueba ', 1, '2023-03-17', '2023-04-08', NULL, 7, NULL, '2023-03-17 06:07:42'),
(18, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 8, NULL, '2023-03-17 22:02:03'),
(21, 'REALIZADO', NULL, 0, NULL, NULL, NULL, 1, NULL, '2023-04-10 21:45:27'),
(22, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 19:34:48'),
(23, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 19:42:27'),
(24, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 19:48:34'),
(25, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 19:55:06'),
(26, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:04:41'),
(27, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:08:34'),
(28, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:10:43'),
(29, 'REALIZADO', NULL, 0, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:13:03'),
(30, 'REALIZADO', NULL, 0, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:32:20'),
(31, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:32:55'),
(32, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:35:11'),
(33, 'REALIZADO', NULL, 0, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:40:10'),
(34, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:42:00'),
(35, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:43:56'),
(36, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:46:15'),
(37, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:49:08'),
(38, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:50:38'),
(39, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:52:14'),
(40, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:54:15'),
(41, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 20:56:31'),
(42, 'REALIZADO', NULL, 0, NULL, NULL, NULL, 1, NULL, '2023-11-27 21:01:07'),
(42, 'REALIZADO', NULL, 0, NULL, NULL, NULL, 2, NULL, '2023-11-27 21:01:56'),
(43, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 21:03:34'),
(44, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 21:05:17'),
(44, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 2, NULL, '2023-11-27 21:05:27'),
(45, 'REALIZADO', NULL, 1, NULL, NULL, NULL, 1, NULL, '2023-11-27 21:06:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trazabilidad_capacitaciones_programadas`
--

CREATE TABLE `trazabilidad_capacitaciones_programadas` (
  `id_capacitacionprogramada` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT 'PENDIENTE',
  `observacion` text DEFAULT NULL,
  `fecha_inicio_suspencion` date DEFAULT NULL,
  `fecha_final_suspencion` date DEFAULT NULL,
  `fecha_` date DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `tiempo_gen` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `trazabilidad_capacitaciones_programadas`
--

INSERT INTO `trazabilidad_capacitaciones_programadas` (`id_capacitacionprogramada`, `estado`, `observacion`, `fecha_inicio_suspencion`, `fecha_final_suspencion`, `fecha_`, `consecutivo`, `motivo`, `tiempo_gen`) VALUES
(23, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-15 17:16:46'),
(24, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-15 17:22:39'),
(21, 'PENDIENTE', '', NULL, NULL, NULL, 1, NULL, '2023-01-15 17:38:38'),
(21, 'REALIZADO', '', NULL, NULL, NULL, 2, NULL, '2023-01-15 17:39:01'),
(21, 'CANCELADO', '', NULL, NULL, '2023-01-16', 3, NULL, '2023-01-16 01:34:43'),
(21, 'SUSPENDIDO', 'supendido por motivo y', '2023-01-27', '2023-01-27', NULL, 4, NULL, '2023-01-16 01:38:30'),
(21, 'REALIZADO', 'realizado pero con observacion y', NULL, NULL, NULL, 5, NULL, '2023-01-16 01:39:19'),
(21, 'CANCELADO', 'cancelado por motivo y', NULL, NULL, NULL, 6, NULL, '2023-01-16 01:39:37'),
(1, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-16 16:34:30'),
(1, 'REALIZADO', 'prueba trazabilidad\n', NULL, NULL, '2023-01-16', 2, NULL, '2023-01-16 16:35:07'),
(1, 'SUSPENDIDO', '', '2023-01-27', '2023-01-27', NULL, 3, NULL, '2023-01-18 20:44:32'),
(2, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-19 10:53:17'),
(3, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-19 10:57:34'),
(3, 'PENDIENTE', '', NULL, NULL, NULL, 2, NULL, '2023-01-19 10:57:56'),
(3, 'REALIZADO', '', NULL, NULL, NULL, 3, NULL, '2023-01-19 10:58:12'),
(3, 'SUSPENDIDO', NULL, '2023-01-16', '2023-01-16', NULL, 4, NULL, '2023-01-19 11:00:24'),
(1, 'REALIZADO', 'prueba trazabilidad\n', NULL, NULL, NULL, 4, NULL, '2023-01-20 18:47:23'),
(1, 'CANCELADO', NULL, NULL, NULL, NULL, 5, NULL, '2023-01-20 18:51:21'),
(1, 'SUSPENDIDO', NULL, '2023-01-20', '2023-01-20', NULL, 6, NULL, '2023-01-20 18:52:03'),
(1, 'PENDIENTE', NULL, NULL, NULL, NULL, 7, NULL, '2023-01-20 18:52:23'),
(1, 'REALIZADO', 'prueba trazabilidad\n', NULL, NULL, NULL, 8, NULL, '2023-01-21 10:22:44'),
(1, 'PENDIENTE', NULL, NULL, NULL, NULL, 9, NULL, '2023-01-21 10:22:53'),
(2, 'REALIZADO', NULL, NULL, NULL, NULL, 2, NULL, '2023-01-21 10:35:38'),
(1, 'REALIZADO', 'prueba trazabilidad\n', NULL, NULL, NULL, 10, NULL, '2023-02-20 15:37:22'),
(4, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-03-07 19:27:29'),
(4, 'REALIZADO', NULL, NULL, NULL, NULL, 2, NULL, '2023-03-07 19:33:37'),
(5, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-03-10 15:45:34'),
(5, 'SUSPENDIDO', 'Por mal clima', '2023-03-13', '2023-03-13', NULL, 2, NULL, '2023-03-10 15:59:52'),
(5, 'REALIZADO', 'Se realizó satisfactoriamente ', NULL, NULL, NULL, 3, NULL, '2023-03-10 16:26:17'),
(5, 'SUSPENDIDO', 'Por mal clima', '2023-03-16', '2023-03-16', NULL, 4, NULL, '2023-03-16 23:51:48'),
(5, 'REALIZADO', 'Se realizó satisfactoriamente ', NULL, NULL, NULL, 5, NULL, '2023-03-17 00:44:39'),
(6, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:03:29'),
(6, 'SUSPENDIDO', 'Se re programa nueva fecha en 31 marzo en coordinacion con bienestar para todos los nuevos funcionarios', '2023-03-30', '2023-03-31', NULL, 2, NULL, '2023-04-11 15:11:19'),
(6, 'REALIZADO', 'Se realizo el día 31 marzo 2023 salón del Linci San Pedro. ', NULL, NULL, NULL, 3, NULL, '2023-04-11 15:21:12'),
(7, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:27:44'),
(8, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:30:41'),
(9, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:32:19'),
(10, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:33:03'),
(11, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:33:55'),
(12, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:34:39'),
(13, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:35:33'),
(14, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:36:18'),
(15, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:37:51'),
(16, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:38:36'),
(17, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:39:19'),
(18, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:48:36'),
(19, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:49:25'),
(20, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:54:47'),
(21, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:55:33'),
(22, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:56:30'),
(23, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:57:19'),
(24, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:58:10'),
(25, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:58:54'),
(26, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 15:59:55'),
(27, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:00:36'),
(28, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:01:29'),
(29, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:02:08'),
(30, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:03:47'),
(31, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:06:03'),
(32, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:07:12'),
(33, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:08:17'),
(34, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:09:20'),
(35, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:10:23'),
(36, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:11:31'),
(37, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:12:43'),
(38, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:13:52'),
(39, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:15:12'),
(40, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:17:45'),
(41, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:19:13'),
(42, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:20:30'),
(43, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:24:29'),
(44, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:26:03'),
(45, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:29:23'),
(46, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:30:36'),
(47, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:33:02'),
(48, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:42:31'),
(49, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:43:28'),
(50, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:54:33'),
(51, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:55:45'),
(52, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:57:07'),
(53, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:58:02'),
(54, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 16:59:10'),
(55, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 17:00:03'),
(56, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 17:02:44'),
(57, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 17:03:49'),
(58, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 17:04:40'),
(59, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 17:10:12'),
(60, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 17:11:06'),
(61, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 17:12:01'),
(46, 'REALIZADO', 'Se realizo capacitación brigadas según cronograma anual de manera satisfactoria. ', NULL, NULL, NULL, 2, NULL, '2023-10-13 16:43:34'),
(62, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2025-02-25 19:39:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trazabilidad_inspecciones`
--

CREATE TABLE `trazabilidad_inspecciones` (
  `id_inspeccion` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT 'PENDIENTE',
  `observacion` text DEFAULT NULL,
  `fecha_inicio_suspencion` date DEFAULT NULL,
  `fecha_final_suspencion` date DEFAULT NULL,
  `fecha_` date DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `tiempo_gen` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `trazabilidad_inspecciones`
--

INSERT INTO `trazabilidad_inspecciones` (`id_inspeccion`, `estado`, `observacion`, `fecha_inicio_suspencion`, `fecha_final_suspencion`, `fecha_`, `consecutivo`, `motivo`, `tiempo_gen`) VALUES
(12, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-15 18:22:35'),
(12, 'REALIZADO', '', NULL, NULL, '2023-01-15', 2, NULL, '2023-01-15 18:38:51'),
(12, 'REALIZADO', '', NULL, NULL, '2023-01-15', 3, NULL, '2023-01-15 18:41:34'),
(12, 'REALIZADO', '', NULL, NULL, '2023-01-15', 4, NULL, '2023-01-15 18:43:28'),
(7, 'PENDIENTE', 'gfdgfdg', NULL, NULL, NULL, 1, NULL, '2023-01-15 18:45:43'),
(12, 'SUSPENDIDO', '', '2023-01-15', '2023-01-15', NULL, 5, NULL, '2023-01-15 18:46:27'),
(12, 'REALIZADO', '', NULL, NULL, '2023-01-15', 6, NULL, '2023-01-15 18:47:47'),
(12, 'SUSPENDIDO', 'prueba', '2023-01-17', '2023-01-17', NULL, 7, NULL, '2023-01-15 18:52:30'),
(12, 'REALIZADO', 'REALIZADO', NULL, NULL, NULL, 8, NULL, '2023-01-15 19:09:38'),
(12, 'PENDIENTE', 'REALIZADO', NULL, NULL, NULL, 9, NULL, '2023-01-15 19:15:44'),
(12, 'SUSPENDIDO', 'REALIZADO', '2023-01-15', '2023-01-15', NULL, 10, NULL, '2023-01-15 19:16:04'),
(12, 'PENDIENTE', 'SUSPENDIDO', NULL, NULL, NULL, 11, NULL, '2023-01-15 19:17:32'),
(12, 'REALIZADO', 'REALIZADO', NULL, NULL, '2023-01-15', 12, NULL, '2023-01-15 19:20:53'),
(12, 'REALIZADO', 'REALIZADO', NULL, NULL, '2023-01-15', 13, NULL, '2023-01-15 19:25:47'),
(12, 'SUSPENDIDO', 'SUSPENDIO', '2023-01-15', '2023-01-15', NULL, 14, NULL, '2023-01-15 19:26:15'),
(12, 'CANCELADO', 'CANCELADO', NULL, NULL, '2023-01-15', 15, NULL, '2023-01-15 19:26:34'),
(12, 'PENDIENTE', '', NULL, NULL, NULL, 16, NULL, '2023-01-15 19:26:43'),
(12, 'REALIZADO', '', NULL, NULL, '2023-01-15', 17, NULL, '2023-01-15 19:28:51'),
(13, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-15 19:30:15'),
(13, 'REALIZADO', 'REALIZADO', NULL, NULL, '2023-01-15', 2, NULL, '2023-01-15 19:31:15'),
(13, 'PENDIENTE', '', NULL, NULL, NULL, 3, NULL, '2023-01-15 19:31:31'),
(14, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-16 01:40:08'),
(14, 'CANCELADO', 'cancelado', NULL, NULL, '2023-01-16', 2, NULL, '2023-01-16 01:40:40'),
(1, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-16 16:35:46'),
(1, 'REALIZADO', 'trazabiliadad de prueba', NULL, NULL, '2023-01-16', 2, NULL, '2023-01-16 16:36:07'),
(1, 'CANCELADO', '', NULL, NULL, '2023-01-16', 3, NULL, '2023-01-18 20:46:09'),
(2, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-20 19:15:38'),
(3, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-01-20 22:38:36'),
(3, 'REALIZADO', 'dasdasd', NULL, NULL, NULL, 2, NULL, '2023-01-20 22:49:03'),
(1, 'REALIZADO', 'trazabiliadad de prueba', NULL, NULL, '2023-01-16', 4, NULL, '2023-01-20 23:01:39'),
(1, 'SUSPENDIDO', 'dasdasdsad', '2023-01-05', '2023-01-05', NULL, 5, NULL, '2023-01-21 10:42:36'),
(1, 'PENDIENTE', '', NULL, NULL, NULL, 6, NULL, '2023-01-21 10:42:43'),
(2, 'REALIZADO', '', NULL, NULL, NULL, 2, NULL, '2023-01-22 16:00:31'),
(3, 'SUSPENDIDO', '', '2023-01-22', '2023-01-22', NULL, 3, NULL, '2023-01-22 16:02:23'),
(4, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-03-07 19:40:03'),
(4, 'REALIZADO', 'Esto es una prueba', NULL, NULL, NULL, 2, NULL, '2023-03-07 19:40:43'),
(5, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 20:38:03'),
(6, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 20:42:00'),
(7, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:08:51'),
(8, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:09:40'),
(9, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:10:33'),
(10, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:11:24'),
(11, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:13:09'),
(12, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:13:57'),
(13, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:14:40'),
(14, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:15:20'),
(15, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:16:23'),
(16, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:17:40'),
(17, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:24:42'),
(18, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:25:27'),
(19, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:26:19'),
(20, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:26:59'),
(21, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:29:45'),
(22, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:30:25'),
(23, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:32:10'),
(24, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:33:45'),
(25, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:34:41'),
(26, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:35:26'),
(27, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 21:36:07'),
(28, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:17:05'),
(29, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:18:05'),
(30, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:18:37'),
(31, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:19:43'),
(32, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:24:07'),
(33, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:25:27'),
(34, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:26:43'),
(35, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:28:09'),
(36, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:29:52'),
(37, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:30:52'),
(37, 'PENDIENTE', '', NULL, NULL, NULL, 2, NULL, '2023-04-11 22:31:24'),
(38, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:32:45'),
(39, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:33:54'),
(40, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:35:33'),
(41, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:37:30'),
(42, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-04-11 22:38:50'),
(42, 'REALIZADO', 'Se realizaron evaluaciones puesto de trabajo a postulantes de tele trabajo y APT a funcionaria para calificar origen enfermedad. ', NULL, NULL, NULL, 2, NULL, '2023-04-11 22:42:58'),
(7, 'REALIZADO', 'Se realizo inspección de EPP a los trabajadores oficiales de cuadrillas. ', NULL, NULL, NULL, 2, NULL, '2023-11-08 19:32:35'),
(43, 'PENDIENTE', NULL, NULL, NULL, NULL, 1, NULL, '2023-12-07 14:10:05'),
(43, 'REALIZADO', 'Se realizo Inspección a extintores de todas las sedes. ', NULL, NULL, NULL, 2, NULL, '2023-12-07 14:11:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trazabilidad_matrices`
--

CREATE TABLE `trazabilidad_matrices` (
  `id_matriz` int(11) NOT NULL,
  `tipo_accion` varchar(45) DEFAULT NULL,
  `responsable` varchar(255) DEFAULT NULL,
  `fechapropuesta_cierre` date DEFAULT NULL,
  `accion_tomada` varchar(255) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'PENDIENTE',
  `fecha_cierre` date DEFAULT NULL,
  `fecha_seguimiento` date DEFAULT NULL,
  `avance` int(10) DEFAULT NULL,
  `documento_soporte` text DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `tiempo_gen` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `trazabilidad_matrices`
--

INSERT INTO `trazabilidad_matrices` (`id_matriz`, `tipo_accion`, `responsable`, `fechapropuesta_cierre`, `accion_tomada`, `estado`, `fecha_cierre`, `fecha_seguimiento`, `avance`, `documento_soporte`, `consecutivo`, `tiempo_gen`) VALUES
(1, NULL, NULL, NULL, NULL, 'ABIERTO', NULL, NULL, 0, NULL, 1, '2023-01-18 15:26:42'),
(1, NULL, NULL, NULL, NULL, 'ABIERTO', NULL, NULL, 0, NULL, 2, '2023-01-18 15:28:03'),
(1, NULL, NULL, NULL, NULL, 'ABIERTO', NULL, NULL, 0, NULL, 3, '2023-01-18 15:29:00'),
(1, NULL, NULL, NULL, NULL, 'ABIERTO', NULL, NULL, 0, NULL, 4, '2023-01-18 15:29:42'),
(5, NULL, 'sdfsdfsdfdsf', NULL, NULL, 'ABIERTO', NULL, NULL, 0, '', 1, '2023-01-18 15:44:43'),
(6, 'A. Correctiva', 'dasdas', '2023-01-18', 'dsad', 'ABIERTO', NULL, '2023-01-18', 0, '', 1, '2023-01-18 15:47:34'),
(7, 'A. Correctiva', 'fsdfdsf', '2023-01-18', 'fsdfdsf', 'CERRADO', '2023-01-26', '2023-01-18', 0, '', 1, '2023-01-18 15:54:05'),
(7, 'A. De mejora', 'fdsfdsf', '2023-01-18', 'fsdfdsfdsfdsf', 'CERRADO', '2023-01-18', '2023-01-18', 0, '7', 2, '2023-01-18 15:55:54'),
(7, 'A. Correctiva', 'test', '2023-01-18', 'preuba', 'ABIERTO', NULL, '2023-01-18', 0, NULL, 3, '2023-01-18 15:58:43'),
(1, 'A. Correctiva', 'correción del si', '2023-01-18', 'funciona?', 'ABIERTO', NULL, '2023-01-18', 0, NULL, 5, '2023-01-18 16:57:42'),
(1, 'A. Correctiva', 'dsad', '2023-01-18', 'dasdasd', 'ABIERTO', NULL, '2023-01-18', 0, NULL, 6, '2023-01-18 17:03:36'),
(1, 'A. Correctiva', 'dasdsad', '2023-01-18', 'dasdsad', 'ABIERTO', NULL, '2023-01-18', 0, NULL, 7, '2023-01-18 17:06:54'),
(1, 'A. Correctiva', 'TEST 2', '2023-01-18', 'SI / NO -> CAMBIOS', 'ABIERTO', NULL, '2023-01-18', 34, NULL, 8, '2023-01-18 17:42:44'),
(1, 'A. Correctiva', 'nuevi', '2023-02-22', 'nuevo', 'ABIERTO', NULL, '2023-01-18', 34, NULL, 9, '2023-01-18 17:48:40'),
(1, 'A. Correctiva', 'Prueba', '2023-01-18', 'Nueva prueba', 'CERRADO', '2023-01-18', '2023-01-16', 99, NULL, 10, '2023-01-18 17:49:32'),
(1, 'A. Correctiva', 'dasdsa', '2023-01-20', 'dasdasd', 'ABIERTO', NULL, '2023-02-02', 1, NULL, 11, '2023-01-18 20:46:49'),
(7, 'A. Preventiva', 'hhhhhhhhh', '2023-01-31', '', 'EN PROCESO', NULL, '2023-01-20', 50, NULL, 4, '2023-01-19 08:45:31'),
(7, 'A. Correctiva', 'dsadsad', '2023-01-20', 'dsadsad', 'ABIERTO', NULL, '2023-01-20', 3, NULL, 5, '2023-01-20 18:08:25'),
(7, 'A. De mejora', 'fdsfsdf', '2023-01-20', 'fsfdsf', 'ABIERTO', NULL, '2023-01-20', 2, NULL, 6, '2023-01-20 18:09:12'),
(8, NULL, '', NULL, '', 'ABIERTO', NULL, NULL, 0, '', 1, '2023-01-21 10:59:25'),
(9, 'A. Correctiva', 'SSS', '2023-03-08', '', 'ABIERTO', NULL, NULL, 0, '', 1, '2023-03-07 19:44:22'),
(10, 'A. Correctiva', 'Secretaria de Infraestructura Física', '2023-02-17', '', 'ABIERTO', NULL, NULL, 0, '', 1, '2023-04-12 16:05:46'),
(10, 'A. Correctiva', 'Secretaria de infraestructura', '2023-02-15', 'Se envió informe de las condiciones y sus recomendaciones para el control a la dependencia infraestructura Física, en posterior visita al área, se evidencia que la escalera fue retirada  y sustituida por otra en buenas condiciones. ', 'CERRADO', '2023-02-13', '2023-02-13', 0, NULL, 2, '2023-04-12 16:16:26'),
(11, 'A. Correctiva', 'Trabajador usuario', '2023-02-15', '', 'ABIERTO', NULL, NULL, 0, '', 1, '2023-04-12 16:26:51'),
(11, 'A. Correctiva', 'Trabajador oficial expuesto', '2023-04-15', 'El trabajador cambia el elemento de protección, se envía informe a la dependencia con recomendaciones a tener en cuenta y adicional se realizo visita donde se evidencio que ya se efectuó el cambio. ', 'CERRADO', '2023-02-13', '2023-02-13', 0, NULL, 2, '2023-04-12 16:35:54'),
(12, 'A. Preventiva', 'Almacen Infraestructura y equipo SST', '2023-02-28', '', 'ABIERTO', NULL, NULL, 0, '', 1, '2023-04-12 19:10:29'),
(13, 'A. Preventiva', 'Almacen taller y equipo SST', '2023-03-01', '', 'ABIERTO', NULL, NULL, 0, '', 1, '2023-04-12 19:19:17'),
(14, 'A. Preventiva', 'Secretaria de infraestructura', '2023-04-30', '', 'ABIERTO', NULL, NULL, 0, '', 1, '2023-04-12 20:53:51'),
(12, 'A. Preventiva', 'Taller almacen y equpo sst', '2023-02-28', 'Se realizo informe y sensibilizacion a los trabajadores con recomendaciones, se gesto contrato compra EPP', 'CERRADO', '2023-02-15', '2023-04-13', 0, NULL, 2, '2023-04-13 21:24:04'),
(10, 'A. Correctiva', 'Secretaria de Infraestructura Fisica', '2023-01-30', 'Se realizo informe a la dependencia para retiro del elemento defectuoso y sensibilizarnos a los trabajadores para el uso adecuado de las escaleras, su almacenamiento  e inspección. ', 'EN PROCESO', NULL, '2023-01-20', 80, NULL, 3, '2023-11-08 22:24:16'),
(10, 'A. Correctiva', 'Secretaria de Infraestructura fisica', '2023-01-30', 'Se realizo informe a la dependencia para retiro del elemento defectuoso y sensibilizarnos a los trabajadores para el uso adecuado de las escaleras, su almacenamiento  e inspección. ', 'ABIERTO', NULL, '2023-01-20', 80, NULL, 4, '2023-11-08 22:28:11'),
(15, 'A. Correctiva', 'Area SST', '2023-12-30', '', 'ABIERTO', NULL, NULL, 0, '', 1, '2023-12-07 13:52:24'),
(15, 'A. Correctiva', 'Equipo SST', '2023-12-30', 'Se retiro el obstáculo y esta pendiente instalar señalizacion', 'EN PROCESO', NULL, '2023-12-07', 80, NULL, 2, '2023-12-07 14:06:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_crea` date NOT NULL DEFAULT current_timestamp(),
  `fecha_upd` datetime NOT NULL DEFAULT current_timestamp(),
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `password`, `fecha_crea`, `fecha_upd`, `nivel`) VALUES
(1, 'J@mundi', 'd7e72563a16d433879459151f7df3a37', '2022-04-15', '2022-04-15 19:48:53', 1),
(72, '1115066235', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 12:37:49', 2),
(73, '79760495', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 17:52:39', 2),
(74, '31445630', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 18:06:27', 1),
(75, '31532628', '7ed4d18999cb388fac0a12da8f8b2a28', '2022-06-28', '2022-06-28 18:32:37', 2),
(76, '1053832518', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 19:15:35', 2),
(77, '59395795 ', '61d401d87241eb2f65d7d46f6d64c2db', '2022-06-28', '2022-06-28 22:35:59', 2),
(78, '1144139774', '0d953247ddd13aee8ed3279519bcc59a', '2023-03-07', '2023-03-07 13:40:17', 2),
(79, '31448331', '61d401d87241eb2f65d7d46f6d64c2db', '2023-03-07', '2023-03-07 13:41:52', 1),
(80, '1067461067', '984406122b9b80b0bfd4b1a7673098fe', '2023-03-07', '2023-03-07 19:49:53', 2),
(81, '1677868', 'f876435adbbaef0d5c4eb69da5d4ef04', '2023-03-21', '2023-03-21 15:20:33', 2),
(82, '16778608', '726bbbcadc294e355778573665ca1394', '2023-03-21', '2023-03-21 15:21:32', 2),
(83, '38602799', '2d073037b6236460358c5029d6c6067e', '2023-04-15', '2023-04-15 22:17:02', 2),
(84, '1112468575', '61d401d87241eb2f65d7d46f6d64c2db', '2023-12-06', '2023-12-06 19:09:38', 1),
(85, '1192896632', '61d401d87241eb2f65d7d46f6d64c2db', '2024-02-02', '2024-02-02 14:33:54', 2),
(86, '72098106', 'd9d055eeec473236720b40b57fdf8652', '2024-06-11', '2024-06-11 20:18:19', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `victima_violencia`
--

CREATE TABLE `victima_violencia` (
  `id_victimaviolencia` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
  ADD PRIMARY KEY (`id_matriz`);

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
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `actividadesprogramadas_funcionario`
--
ALTER TABLE `actividadesprogramadas_funcionario`
  MODIFY `id_actividadprogramadasfuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `actividades_programadas`
--
ALTER TABLE `actividades_programadas`
  MODIFY `id_actividadprogramada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT de la tabla `actividad_funcionario`
--
ALTER TABLE `actividad_funcionario`
  MODIFY `id_actividad_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

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
  MODIFY `id_capacitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `capacitacionesprogramadas_funcionario`
--
ALTER TABLE `capacitacionesprogramadas_funcionario`
  MODIFY `id_capacitacionprogramadasfuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `capacitaciones_programadas`
--
ALTER TABLE `capacitaciones_programadas`
  MODIFY `id_capacitacionprogramada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `capacitacion_funcionario`
--
ALTER TABLE `capacitacion_funcionario`
  MODIFY `id_capacitacion_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

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
  MODIFY `id_evaluacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2578;

--
-- AUTO_INCREMENT de la tabla `experiencia_previa`
--
ALTER TABLE `experiencia_previa`
  MODIFY `id_experienciaprevia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=652;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id_grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `grupo_objetivo`
--
ALTER TABLE `grupo_objetivo`
  MODIFY `id_grupoobjetivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `incapacidad`
--
ALTER TABLE `incapacidad`
  MODIFY `id_incapacidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `inspeccion`
--
ALTER TABLE `inspeccion`
  MODIFY `id_inspeccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `logger`
--
ALTER TABLE `logger`
  MODIFY `id_logger` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `matriz`
--
ALTER TABLE `matriz`
  MODIFY `id_matriz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `movilidad`
--
ALTER TABLE `movilidad`
  MODIFY `id_movilidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
  MODIFY `id_nucleofamiliar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1145;

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `idopcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `opciones_asignadas`
--
ALTER TABLE `opciones_asignadas`
  MODIFY `id_opcionesasg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=962;

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
  MODIFY `id_seguridadsocial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=499;

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
  MODIFY `id_tipovinculacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

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
