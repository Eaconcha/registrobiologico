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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Geolocalizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Geolocalizacion` (
  `id` INT NOT NULL,
  `region` VARCHAR(45) NULL,
  `departamento` VARCHAR(45) NULL,
  `municipio` VARCHAR(45) NULL,
  `localidad` VARCHAR(45) NULL,
  `latitud` VARCHAR(45) NULL,
  `longitud` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Especie` (
  `id` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `nombre comun` VARCHAR(45) NULL,
  `familia` VARCHAR(45) NULL,
  `Geolocalizacion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Geolocalizacion_id`),
  INDEX `fk_Especie_Geolocalizacion1_idx` (`Geolocalizacion_id` ASC),
  CONSTRAINT `fk_Especie_Geolocalizacion1`
    FOREIGN KEY (`Geolocalizacion_id`)
    REFERENCES `mydb`.`Geolocalizacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo-descubrimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo-descubrimiento` (
  `id` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `lugar` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `fecha de captura` DATE NULL,
  `Especie_id` INT NOT NULL,
  `tipo-descubrimiento_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Especie_id`, `tipo-descubrimiento_id`),
  INDEX `fk_responsable_Especie1_idx` (`Especie_id` ASC),
  INDEX `fk_Autor_tipo-descubrimiento1_idx` (`tipo-descubrimiento_id` ASC),
  CONSTRAINT `fk_responsable_Especie1`
    FOREIGN KEY (`Especie_id`)
    REFERENCES `mydb`.`Especie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Autor_tipo-descubrimiento1`
    FOREIGN KEY (`tipo-descubrimiento_id`)
    REFERENCES `mydb`.`tipo-descubrimiento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proyecto` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `tipo de proyecto` VARCHAR(45) NULL,
  `responsable_id` INT NOT NULL,
  PRIMARY KEY (`id`, `responsable_id`),
  INDEX `fk_proyecto_responsable1_idx` (`responsable_id` ASC),
  CONSTRAINT `fk_proyecto_responsable1`
    FOREIGN KEY (`responsable_id`)
    REFERENCES `mydb`.`Autor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
