-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 03, 2015 at 11:30 PM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Administracion`
--

CREATE TABLE `Administracion` (
  `id_administracion` varchar(50) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(1000) NOT NULL,
  `password` blob NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Administracion`
--

INSERT INTO `Administracion` (`id_administracion`, `nombres`, `apellido_paterno`, `apellido_materno`, `telefono`, `correo`, `direccion`, `password`, `rol`) VALUES
('admin', 'Administrador', 'Menchú', '', '00000000', 'hola@adios.com', 'Calle: a Colonia:  Ciudad:  Estado:  C.P: ', 0x0887931780a556b46ce32cc1471ecfc7, 2),
('sup', 'Supervisor', 'Dominguez', 'Buendía', '123456789', 'super@visor.com', 'calle del puente', 0x0887931780a556b46ce32cc1471ecfc7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Cuestionario`
--

CREATE TABLE `Cuestionario` (
`id_Cuestionario` int(11) NOT NULL,
  `numero_preguntas` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_administracion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Estado`
--

CREATE TABLE `Estado` (
`id_Estado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Municipio`
--

CREATE TABLE `Municipio` (
`id_Municipio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Opcion`
--

CREATE TABLE `Opcion` (
`id_Opcion` int(11) NOT NULL,
  `texto` varchar(1000) NOT NULL,
  `posicion` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Opcion`
--

INSERT INTO `Opcion` (`id_Opcion`, `texto`, `posicion`, `id_pregunta`) VALUES
(1, 'Manzana', 1, 1),
(2, 'Pera', 2, 1),
(3, 'Mango', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PreguntaA_Cuestionario`
--

CREATE TABLE `PreguntaA_Cuestionario` (
  `id_pregunta` int(11) NOT NULL,
  `id_cuestionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PreguntaM_Cuestionario`
--

CREATE TABLE `PreguntaM_Cuestionario` (
  `id_pregunta` int(11) NOT NULL,
  `id_cuestionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Pregunta_abierta`
--

CREATE TABLE `Pregunta_abierta` (
`id_Pregunta_abierta` int(11) NOT NULL,
  `texto` varchar(1000) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_administracion` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pregunta_abierta`
--

INSERT INTO `Pregunta_abierta` (`id_Pregunta_abierta`, `texto`, `fecha`, `id_administracion`) VALUES
(1, '¿Se agregó la pregunta?', '2015-04-30 14:15:24', 'sup'),
(4, '¿Todavía funciona?', '2015-05-02 22:18:17', 'sup'),
(6, '¿Se edita? : Sí! :)', '2015-05-02 22:18:53', 'sup');

-- --------------------------------------------------------

--
-- Table structure for table `Pregunta_multiple`
--

CREATE TABLE `Pregunta_multiple` (
`id_Pregunta_multiple` int(11) NOT NULL,
  `texto` varchar(1000) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_administracion` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pregunta_multiple`
--

INSERT INTO `Pregunta_multiple` (`id_Pregunta_multiple`, `texto`, `fecha`, `id_administracion`) VALUES
(1, 'cuál te gusta más', '2015-08-09 00:00:00', 'sup');

-- --------------------------------------------------------

--
-- Table structure for table `Respuesta`
--

CREATE TABLE `Respuesta` (
`id_Respuesta` int(11) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `c_postal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Respuesta_pregunta_abierta`
--

CREATE TABLE `Respuesta_pregunta_abierta` (
  `id_respuesta` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `texto` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Respuesta_pregunta_multiple`
--

CREATE TABLE `Respuesta_pregunta_multiple` (
  `id_respuesta` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `opcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Administracion`
--
ALTER TABLE `Administracion`
 ADD PRIMARY KEY (`id_administracion`);

--
-- Indexes for table `Cuestionario`
--
ALTER TABLE `Cuestionario`
 ADD PRIMARY KEY (`id_Cuestionario`), ADD KEY `fk_Cuestionario_Administracion_idx` (`id_administracion`);

--
-- Indexes for table `Estado`
--
ALTER TABLE `Estado`
 ADD PRIMARY KEY (`id_Estado`);

--
-- Indexes for table `Municipio`
--
ALTER TABLE `Municipio`
 ADD PRIMARY KEY (`id_Municipio`), ADD KEY `fkMunicipio_estado_idx` (`id_estado`);

--
-- Indexes for table `Opcion`
--
ALTER TABLE `Opcion`
 ADD PRIMARY KEY (`id_Opcion`), ADD KEY `fkOpcion_pregunta_idx` (`id_pregunta`);

--
-- Indexes for table `PreguntaA_Cuestionario`
--
ALTER TABLE `PreguntaA_Cuestionario`
 ADD PRIMARY KEY (`id_pregunta`,`id_cuestionario`), ADD KEY `fkCuestionario_PreguntaCuestionario_idx` (`id_cuestionario`);

--
-- Indexes for table `PreguntaM_Cuestionario`
--
ALTER TABLE `PreguntaM_Cuestionario`
 ADD PRIMARY KEY (`id_pregunta`,`id_cuestionario`), ADD KEY `fkCuestioknario_CuestionarioP_idx` (`id_cuestionario`);

--
-- Indexes for table `Pregunta_abierta`
--
ALTER TABLE `Pregunta_abierta`
 ADD PRIMARY KEY (`id_Pregunta_abierta`), ADD KEY `fkPregunta_Supervisor_idx` (`id_administracion`);

--
-- Indexes for table `Pregunta_multiple`
--
ALTER TABLE `Pregunta_multiple`
 ADD PRIMARY KEY (`id_Pregunta_multiple`), ADD KEY `fkPregunta_Supervisor_idx` (`id_administracion`);

--
-- Indexes for table `Respuesta`
--
ALTER TABLE `Respuesta`
 ADD PRIMARY KEY (`id_Respuesta`), ADD KEY `fkRespuesta_municipio_idx` (`id_municipio`);

--
-- Indexes for table `Respuesta_pregunta_abierta`
--
ALTER TABLE `Respuesta_pregunta_abierta`
 ADD PRIMARY KEY (`id_respuesta`,`id_pregunta`), ADD KEY `fkRP_pregunta_idx` (`id_pregunta`);

--
-- Indexes for table `Respuesta_pregunta_multiple`
--
ALTER TABLE `Respuesta_pregunta_multiple`
 ADD PRIMARY KEY (`id_respuesta`,`id_pregunta`), ADD KEY `fkRP_respuesta_idx` (`id_respuesta`), ADD KEY `fkRP_pregunta_idx` (`id_pregunta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cuestionario`
--
ALTER TABLE `Cuestionario`
MODIFY `id_Cuestionario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Estado`
--
ALTER TABLE `Estado`
MODIFY `id_Estado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Municipio`
--
ALTER TABLE `Municipio`
MODIFY `id_Municipio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Opcion`
--
ALTER TABLE `Opcion`
MODIFY `id_Opcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Pregunta_abierta`
--
ALTER TABLE `Pregunta_abierta`
MODIFY `id_Pregunta_abierta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Pregunta_multiple`
--
ALTER TABLE `Pregunta_multiple`
MODIFY `id_Pregunta_multiple` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Respuesta`
--
ALTER TABLE `Respuesta`
MODIFY `id_Respuesta` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Cuestionario`
--
ALTER TABLE `Cuestionario`
ADD CONSTRAINT `fk_Cuestionario_Administracion` FOREIGN KEY (`id_administracion`) REFERENCES `Administracion` (`id_administracion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Municipio`
--
ALTER TABLE `Municipio`
ADD CONSTRAINT `fkMunicipio_estado` FOREIGN KEY (`id_estado`) REFERENCES `Estado` (`id_Estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Opcion`
--
ALTER TABLE `Opcion`
ADD CONSTRAINT `fkOpcion_pregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `Pregunta_multiple` (`id_Pregunta_multiple`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `PreguntaA_Cuestionario`
--
ALTER TABLE `PreguntaA_Cuestionario`
ADD CONSTRAINT `fkPregunta_PreguntaCuestionario` FOREIGN KEY (`id_pregunta`) REFERENCES `Pregunta_abierta` (`id_Pregunta_abierta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fkCuestionario_PreguntaCuestionario` FOREIGN KEY (`id_cuestionario`) REFERENCES `Cuestionario` (`id_Cuestionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `PreguntaM_Cuestionario`
--
ALTER TABLE `PreguntaM_Cuestionario`
ADD CONSTRAINT `fkPregunta_CuestionarioP` FOREIGN KEY (`id_pregunta`) REFERENCES `Pregunta_multiple` (`id_Pregunta_multiple`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fkCuestioknario_CuestionarioP` FOREIGN KEY (`id_cuestionario`) REFERENCES `Cuestionario` (`id_Cuestionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Pregunta_abierta`
--
ALTER TABLE `Pregunta_abierta`
ADD CONSTRAINT `fkPreguntaA_Supervisor` FOREIGN KEY (`id_administracion`) REFERENCES `Administracion` (`id_administracion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Pregunta_multiple`
--
ALTER TABLE `Pregunta_multiple`
ADD CONSTRAINT `fkPregunta_Supervisor` FOREIGN KEY (`id_administracion`) REFERENCES `Administracion` (`id_administracion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Respuesta`
--
ALTER TABLE `Respuesta`
ADD CONSTRAINT `fkRespuesta_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `Municipio` (`id_Municipio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Respuesta_pregunta_abierta`
--
ALTER TABLE `Respuesta_pregunta_abierta`
ADD CONSTRAINT `fkRP_respuestaA` FOREIGN KEY (`id_respuesta`) REFERENCES `Respuesta` (`id_Respuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fkRP_preguntaA` FOREIGN KEY (`id_pregunta`) REFERENCES `Pregunta_abierta` (`id_Pregunta_abierta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Respuesta_pregunta_multiple`
--
ALTER TABLE `Respuesta_pregunta_multiple`
ADD CONSTRAINT `fkRP_respuestaM` FOREIGN KEY (`id_respuesta`) REFERENCES `Respuesta` (`id_Respuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fkRP_preguntaM` FOREIGN KEY (`id_pregunta`) REFERENCES `Pregunta_multiple` (`id_Pregunta_multiple`) ON DELETE NO ACTION ON UPDATE NO ACTION;
