-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Administracion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administracion` (
  `id_administracion` VARCHAR(50) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `apellido_paterno` VARCHAR(50) NOT NULL,
  `apellido_materno` VARCHAR(50) NULL,
  `telefono` VARCHAR(50) NOT NULL,
  `correo` VARCHAR(50) NULL,
  `direccion` VARCHAR(50) NOT NULL,
  `password` BLOB NOT NULL,
  `rol` INT NOT NULL,
  PRIMARY KEY (`id_administracion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cuestionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cuestionario` (
  `id_Cuestionario` INT NOT NULL AUTO_INCREMENT,
  `numero_preguntas` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `id_administracion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_Cuestionario`),
  INDEX `fk_Cuestionario_Administracion_idx` (`id_administracion` ASC),
  CONSTRAINT `fk_Cuestionario_Administracion`
    FOREIGN KEY (`id_administracion`)
    REFERENCES `mydb`.`Administracion` (`id_administracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pregunta_multiple`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pregunta_multiple` (
  `id_Pregunta_multiple` INT NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(1000) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `id_administracion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_Pregunta_multiple`),
  INDEX `fkPregunta_Supervisor_idx` (`id_administracion` ASC),
  CONSTRAINT `fkPregunta_Supervisor`
    FOREIGN KEY (`id_administracion`)
    REFERENCES `mydb`.`Administracion` (`id_administracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pregunta_abierta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pregunta_abierta` (
  `id_Pregunta_abierta` INT NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(1000) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `id_administracion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_Pregunta_abierta`),
  INDEX `fkPregunta_Supervisor_idx` (`id_administracion` ASC),
  CONSTRAINT `fkPreguntaA_Supervisor`
    FOREIGN KEY (`id_administracion`)
    REFERENCES `mydb`.`Administracion` (`id_administracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Opcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Opcion` (
  `id_Opcion` INT NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(1000) NOT NULL,
  `posicion` INT NOT NULL,
  `id_pregunta` INT NOT NULL,
  PRIMARY KEY (`id_Opcion`),
  INDEX `fkOpcion_pregunta_idx` (`id_pregunta` ASC),
  CONSTRAINT `fkOpcion_pregunta`
    FOREIGN KEY (`id_pregunta`)
    REFERENCES `mydb`.`Pregunta_multiple` (`id_Pregunta_multiple`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estado` (
  `id_Estado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_Estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Municipio` (
  `id_Municipio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_Municipio`),
  INDEX `fkMunicipio_estado_idx` (`id_estado` ASC),
  CONSTRAINT `fkMunicipio_estado`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_Estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Respuesta` (
  `id_Respuesta` INT NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(100) NULL,
  `fecha` DATETIME NOT NULL,
  `id_municipio` INT NOT NULL,
  `c_postal` INT NOT NULL,
  PRIMARY KEY (`id_Respuesta`),
  INDEX `fkRespuesta_municipio_idx` (`id_municipio` ASC),
  CONSTRAINT `fkRespuesta_municipio`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `mydb`.`Municipio` (`id_Municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Respuesta_pregunta_abierta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Respuesta_pregunta_abierta` (
  `id_respuesta` INT NOT NULL,
  `id_pregunta` INT NOT NULL,
  `texto` VARCHAR(2000) NOT NULL,
  PRIMARY KEY (`id_respuesta`, `id_pregunta`),
  INDEX `fkRP_pregunta_idx` (`id_pregunta` ASC),
  CONSTRAINT `fkRP_respuestaA`
    FOREIGN KEY (`id_respuesta`)
    REFERENCES `mydb`.`Respuesta` (`id_Respuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkRP_preguntaA`
    FOREIGN KEY (`id_pregunta`)
    REFERENCES `mydb`.`Pregunta_abierta` (`id_Pregunta_abierta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Respuesta_pregunta_multiple`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Respuesta_pregunta_multiple` (
  `id_respuesta` INT NOT NULL,
  `id_pregunta` INT NOT NULL,
  `opcion` INT NOT NULL,
  INDEX `fkRP_respuesta_idx` (`id_respuesta` ASC),
  INDEX `fkRP_pregunta_idx` (`id_pregunta` ASC),
  PRIMARY KEY (`id_respuesta`, `id_pregunta`),
  CONSTRAINT `fkRP_respuestaM`
    FOREIGN KEY (`id_respuesta`)
    REFERENCES `mydb`.`Respuesta` (`id_Respuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkRP_preguntaM`
    FOREIGN KEY (`id_pregunta`)
    REFERENCES `mydb`.`Pregunta_multiple` (`id_Pregunta_multiple`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PreguntaA_Cuestionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PreguntaA_Cuestionario` (
  `id_pregunta` INT NOT NULL,
  `id_cuestionario` INT NOT NULL,
  PRIMARY KEY (`id_pregunta`, `id_cuestionario`),
  INDEX `fkCuestionario_PreguntaCuestionario_idx` (`id_cuestionario` ASC),
  CONSTRAINT `fkPregunta_PreguntaCuestionario`
    FOREIGN KEY (`id_pregunta`)
    REFERENCES `mydb`.`Pregunta_abierta` (`id_Pregunta_abierta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkCuestionario_PreguntaCuestionario`
    FOREIGN KEY (`id_cuestionario`)
    REFERENCES `mydb`.`Cuestionario` (`id_Cuestionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PreguntaM_Cuestionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PreguntaM_Cuestionario` (
  `id_pregunta` INT NOT NULL,
  `id_cuestionario` INT NOT NULL,
  PRIMARY KEY (`id_pregunta`, `id_cuestionario`),
  INDEX `fkCuestioknario_CuestionarioP_idx` (`id_cuestionario` ASC),
  CONSTRAINT `fkPregunta_CuestionarioP`
    FOREIGN KEY (`id_pregunta`)
    REFERENCES `mydb`.`Pregunta_multiple` (`id_Pregunta_multiple`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkCuestioknario_CuestionarioP`
    FOREIGN KEY (`id_cuestionario`)
    REFERENCES `mydb`.`Cuestionario` (`id_Cuestionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
