-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema RecomendacionSpotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema RecomendacionSpotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RecomendacionSpotify` DEFAULT CHARACTER SET utf8 ;
USE `RecomendacionSpotify` ;

-- -----------------------------------------------------
-- Table `RecomendacionSpotify`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RecomendacionSpotify`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RecomendacionSpotify`.`ListaReproduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RecomendacionSpotify`.`ListaReproduccion` (
  `idListaReproduccion` INT NOT NULL AUTO_INCREMENT,
  `nombreLista` VARCHAR(100) NOT NULL,
  `esRecomendacion` BIT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idListaReproduccion`),
  INDEX `fk_ListasReproduccion_Usuarios_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_ListasReproduccion_Usuarios`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `RecomendacionSpotify`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RecomendacionSpotify`.`Amigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RecomendacionSpotify`.`Amigo` (
  `idUsuario1` INT NOT NULL,
  `idUsuario2` INT NOT NULL,
  `fechaInicioAmistad` DATETIME NOT NULL,
  PRIMARY KEY (`idUsuario1`, `idUsuario2`),
  INDEX `fk_Amigo_Usuario2_idx` (`idUsuario2` ASC),
  CONSTRAINT `fk_Amigo_Usuario1`
    FOREIGN KEY (`idUsuario1`)
    REFERENCES `RecomendacionSpotify`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Amigo_Usuario2`
    FOREIGN KEY (`idUsuario2`)
    REFERENCES `RecomendacionSpotify`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RecomendacionSpotify`.`CancionesRecomendadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RecomendacionSpotify`.`CancionesRecomendadas` (
  `idCancionesRecomendadas` INT NOT NULL AUTO_INCREMENT,
  `nombreCancion` VARCHAR(150) NOT NULL,
  `fechaRecomendacion` DATETIME NOT NULL,
  `idListaReproduccion` INT NOT NULL,
  `idUsuarioRecomendador` INT NOT NULL,
  PRIMARY KEY (`idCancionesRecomendadas`),
  INDEX `fk_CancionesRecomendadas_ListaReproduccion1_idx` (`idListaReproduccion` ASC),
  INDEX `fk_CancionesRecomendadas_Usuario1_idx` (`idUsuarioRecomendador` ASC),
  CONSTRAINT `fk_CancionesRecomendadas_ListaReproduccion1`
    FOREIGN KEY (`idListaReproduccion`)
    REFERENCES `RecomendacionSpotify`.`ListaReproduccion` (`idListaReproduccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CancionesRecomendadas_Usuario1`
    FOREIGN KEY (`idUsuarioRecomendador`)
    REFERENCES `RecomendacionSpotify`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
