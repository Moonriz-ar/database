-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema UniversoLector
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema UniversoLector
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `UniversoLector` DEFAULT CHARACTER SET utf8 ;
USE `UniversoLector` ;

-- -----------------------------------------------------
-- Table `UniversoLector`.`Socio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversoLector`.`Socio` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `DNI` INT NOT NULL,
  `Apellido` VARCHAR(100) NOT NULL,
  `Nombres` VARCHAR(100) NOT NULL,
  `Direccion` VARCHAR(200) NOT NULL,
  `Localidad` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE INDEX `Codigo_UNIQUE` (`Codigo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniversoLector`.`TelefonoxSocio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversoLector`.`TelefonoxSocio` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `NroTelefono` VARCHAR(100) NOT NULL,
  `Codigo_Socio` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE INDEX `Codigo_UNIQUE` (`Codigo` ASC) VISIBLE,
  INDEX `FK_TelefonoxSocio_Socio_idx` (`Codigo_Socio` ASC) VISIBLE,
  CONSTRAINT `FK_TelefonoxSocio_Socio`
    FOREIGN KEY (`Codigo_Socio`)
    REFERENCES `UniversoLector`.`Socio` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniversoLector`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversoLector`.`Autor` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Apellido` VARCHAR(100) NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE INDEX `Codigo_UNIQUE` (`Codigo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniversoLector`.`Editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversoLector`.`Editorial` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Razon_Social` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE INDEX `Codigo_UNIQUE` (`Codigo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniversoLector`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversoLector`.`Libro` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `ISBN` VARCHAR(13) NOT NULL,
  `Titulo` VARCHAR(200) NOT NULL,
  `Anio_Escritura` DATE NOT NULL,
  `Codigo_Autor` INT NOT NULL,
  `Anio_Edicion` DATE NOT NULL,
  `Codigo_Editorial` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE INDEX `Codigo_UNIQUE` (`Codigo` ASC) VISIBLE,
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) VISIBLE,
  INDEX `FK_Libro_Autor_idx` (`Codigo_Autor` ASC) VISIBLE,
  INDEX `FK_Libro_Editorial_idx` (`Codigo_Editorial` ASC) VISIBLE,
  CONSTRAINT `FK_Libro_Autor`
    FOREIGN KEY (`Codigo_Autor`)
    REFERENCES `UniversoLector`.`Autor` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Libro_Editorial`
    FOREIGN KEY (`Codigo_Editorial`)
    REFERENCES `UniversoLector`.`Editorial` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniversoLector`.`Prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversoLector`.`Prestamo` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Codigo_socio` INT NOT NULL,
  `Fecha` DATETIME NOT NULL,
  `Fecha_Devolucion` DATE NOT NULL,
  `Fecha_Tope` DATE NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE INDEX `Codigo_UNIQUE` (`Codigo` ASC) VISIBLE,
  INDEX `FK_Prestamo_Socio_idx` (`Codigo_socio` ASC) VISIBLE,
  CONSTRAINT `FK_Prestamo_Socio`
    FOREIGN KEY (`Codigo_socio`)
    REFERENCES `UniversoLector`.`Socio` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniversoLector`.`Volumen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversoLector`.`Volumen` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Codigo_Libro` INT NOT NULL,
  `Deteriorado` TINYINT NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE INDEX `Codigo_UNIQUE` (`Codigo` ASC) VISIBLE,
  INDEX `FK_Volumen_Libro_idx` (`Codigo_Libro` ASC) VISIBLE,
  CONSTRAINT `FK_Volumen_Libro`
    FOREIGN KEY (`Codigo_Libro`)
    REFERENCES `UniversoLector`.`Libro` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UniversoLector`.`PrestamoxVolumen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UniversoLector`.`PrestamoxVolumen` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Codigo_Prestamo` INT NOT NULL,
  `Codigo_Volumen` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE INDEX `Codigo_UNIQUE` (`Codigo` ASC) VISIBLE,
  INDEX `FK_PrestamoxVolumen_Prestamo_idx` (`Codigo_Prestamo` ASC) VISIBLE,
  INDEX `FK_PrestamoxVolumen_Volumen_idx` (`Codigo_Volumen` ASC) VISIBLE,
  CONSTRAINT `FK_PrestamoxVolumen_Prestamo`
    FOREIGN KEY (`Codigo_Prestamo`)
    REFERENCES `UniversoLector`.`Prestamo` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PrestamoxVolumen_Volumen`
    FOREIGN KEY (`Codigo_Volumen`)
    REFERENCES `UniversoLector`.`Volumen` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
