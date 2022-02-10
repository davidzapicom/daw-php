-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-01-2021 a las 05:48:38
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consulta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCita` int(11) NOT NULL,
  `citFecha` date NOT NULL,
  `citHora` time NOT NULL,
  `citPaciente` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `citMedico` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `citConsultorio` int(11) NOT NULL,
  `citEstado` enum('Asignado','Atendido') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Asignado',
  `CitObservaciones` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idCita`, `citFecha`, `citHora`, `citPaciente`, `citMedico`, `citConsultorio`, `citEstado`, `CitObservaciones`) VALUES
(1, '2021-01-10', '12:00:00', '41236987F', '71902685Q', 6, 'Asignado', 'Le duele un pie y una mano'),
(2, '2020-12-31', '12:02:00', '71978454T', '21324354F', 3, 'Atendido', 'Se le curo una herida'),
(3, '2021-01-12', '13:35:00', '71978454T', '21324354F', 3, 'Asignado', 'Revision'),
(4, '2021-01-12', '18:52:00', '41236987F', '71902685Q', 6, 'Asignado', 'Quiere hacer una comprobación de manos y nariz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `idConsultorio` int(11) NOT NULL,
  `conNombre` char(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `consultorios`
--

INSERT INTO `consultorios` (`idConsultorio`, `conNombre`) VALUES
(1, 'Centro de Salud Oviedo'),
(2, 'Centro de Salud Corvera'),
(3, 'Centro de Salud Aviles'),
(4, 'Centro de Salud Gijon'),
(5, 'Centro de Salud Luarca'),
(6, 'Hospital Universitario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `dniMed` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `medNombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medApellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medEspecialidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medTelefono` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `medCorreo` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`dniMed`, `medNombres`, `medApellidos`, `medEspecialidad`, `medTelefono`, `medCorreo`) VALUES
('21324354F', 'Perico', 'Palotes', 'Piernas', '741748574', 'pericopalotes@gmail.com'),
('71902685Q', 'Cristian', 'Infantes', 'Todas', '686097185', 'cristianim@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `dniPac` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `pacNombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pacApellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pacFechaNacimiento` date NOT NULL,
  `pacSexo` enum('Masculino','Femenino') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`dniPac`, `pacNombres`, `pacApellidos`, `pacFechaNacimiento`, `pacSexo`) VALUES
('41236987F', 'Andrew', 'Perez', '1990-12-14', 'Masculino'),
('71978454T', 'Rita', 'Cantaora', '1980-02-12', 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `dniUsu` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `usuLogin` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `usuPassword` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `usuEstado` enum('Activo','Inactivo') COLLATE utf8_spanish_ci NOT NULL,
  `usutipo` enum('Administrador','Asistente','Medico','Paciente') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`dniUsu`, `usuLogin`, `usuPassword`, `usuEstado`, `usutipo`) VALUES
('00000001A', 'Lider', '63f2dbe23707d96f3f1feae0c203013c4a2a831391cc8189fa0b2673bcdb6fa8a818ef754bac38a878ddb7baa3143423c5870c4a93b333fe9e1601c5a285b507', 'Activo', 'Administrador'),
('12345678A', 'Juan', 'c062e4fd3eed28511a1f2b52bf7b56b70a79bcbecef1f24fd86abfa7269d920e7bd7553c998d9e94fd8f5226b8e57881eca7c9b3403065894f26c5db2ab7fab6', 'Activo', 'Asistente'),
('21324354F', 'Perico', '778cb2714c34ccec1005d24ee6d9815ecb7f26966ea22b211f890c8589c5352966c4d45d5b63a4851b32f81c5f44d634b806ed908177bfb3f7dfbd8c0d7a78eb', 'Activo', 'Medico'),
('41236987F', 'andrew', '7e2b5e49b917b41e7f65e9e9946cc83486eb8da75bf64669020dbc6e653431335b2d2a9089ec4be8aa3f6d333e9f02d5746092c145a0d9cd71760484bcee7484', 'Activo', 'Paciente'),
('71902685Q', 'cristianim', 'fb85cfb4a08f7c51c16ae233484a2484ad67869adeb9d1e3937bfa27deaeb7f400360efcd64804a7e74e281abbc722d8d84315f07c60c2884a95a877c717644b', 'Activo', 'Medico'),
('71978454T', 'Rita', '93ba37351b6b0fd1e34e43740cf35c3bdf853d275e5753ed5b170a7bb275faedb676a4cee182a2b3366a1e112b24213c3a35951408b4c8782ea33552490bf42d', 'Activo', 'Paciente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `citPaciente` (`citPaciente`,`citMedico`,`citConsultorio`),
  ADD KEY `citMedico` (`citMedico`),
  ADD KEY `citConsultorio` (`citConsultorio`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`idConsultorio`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`dniMed`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`dniPac`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`dniUsu`,`usuLogin`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`citPaciente`) REFERENCES `pacientes` (`dniPac`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`citMedico`) REFERENCES `medicos` (`dniMed`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`citConsultorio`) REFERENCES `consultorios` (`idConsultorio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
