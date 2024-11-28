-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Areas` (
  `idAreas` INT NOT NULL,
  `nombreArea` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAreas`))
ENGINE = InnoDB;
INSERT INTO `mydb`.`areas` (`idAreas`, `nombreArea`) VALUES ('1', 'psiquiatria');
INSERT INTO `mydb`.`areas` (`idAreas`, `nombreArea`) VALUES ('2', 'neurologia');
INSERT INTO `mydb`.`areas` (`idAreas`, `nombreArea`) VALUES ('3', 'psicologia');
INSERT INTO `mydb`.`areas` (`idAreas`, `nombreArea`) VALUES ('4', 'terapia ocupacional');



-- -----------------------------------------------------
-- Table `mydb`.`Sedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sedes` (
  `idSedes` INT NOT NULL,
  `nombreSede` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSedes`))
ENGINE = InnoDB;
INSERT INTO `mydb`.`sedes` (`idSedes`, `nombreSede`) VALUES ('1', 'San Martin');
INSERT INTO `mydb`.`sedes` (`idSedes`, `nombreSede`) VALUES ('2', 'Lima');
INSERT INTO `mydb`.`sedes` (`idSedes`, `nombreSede`) VALUES ('3', 'Arequipa');
INSERT INTO `mydb`.`sedes` (`idSedes`, `nombreSede`) VALUES ('4', 'Trujillo');
INSERT INTO `mydb`.`sedes` (`idSedes`, `nombreSede`) VALUES ('5', 'Ayacucho');


-- -----------------------------------------------------
-- Table `mydb`.`Profesionales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesionales` (
  `idProfesionales` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NULL,
  `descripcionProfesional` VARCHAR(90) NOT NULL,
  `idArea` INT NOT NULL,
  `idSede` INT NOT NULL,
  PRIMARY KEY (`idProfesionales`),
  INDEX `fk_Profesionales_Areas_idx` (`idArea` ASC) VISIBLE,
  INDEX `fk_Profesionales_Sedes1_idx` (`idSede` ASC) VISIBLE,
  CONSTRAINT `fk_Profesionales_Areas`
    FOREIGN KEY (`idArea`)
    REFERENCES `mydb`.`Areas` (`idAreas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesionales_Sedes1`
    FOREIGN KEY (`idSede`)
    REFERENCES `mydb`.`Sedes` (`idSedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('10', 'Leonardo Campos', 'buen doctor', '1', '1');
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('11', 'Ronald Boyer', 'doctor habil', '1', '2');
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('12', 'Karla Pezo', 'buena doctora', '1', '3');
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('13', 'Mayra Gonzales', 'doctor', '2', '1');
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('14', 'Franco Lazo', 'buen doctor', '2', '2');
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('15', 'Victor Guerra', 'good doctor', '3', '1');
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('16', 'Paolo Valiente', 'doctor bueno', '3', '2');
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('17', 'Alonso Llanos', 'buen psicologo', '3', '3');
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('18', 'Diego Torres', 'buen terapeuta', '4', '1');
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('19', 'Piero Mendoza', 'genial', '4', '3');
INSERT INTO `mydb`.`profesionales` (`idProfesionales`, `nombre`, `descripcionProfesional`, `idArea`, `idSede`) VALUES ('20', 'Hellen Aranda', 'great', '4', '4');



-- -----------------------------------------------------
-- Table `mydb`.`Fechas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fechas` (
  `idFechas` INT NOT NULL,
  `fechaDisponibilidad` DATE NOT NULL,
  `idProfesional` INT NOT NULL,
  PRIMARY KEY (`idFechas`, `idProfesional`),
  INDEX `fk_Fechas_Profesionales1_idx` (`idProfesional` ASC) VISIBLE,
  CONSTRAINT `fk_Fechas_Profesionales1`
    FOREIGN KEY (`idProfesional`)
    REFERENCES `mydb`.`Profesionales` (`idProfesionales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pacientes` (
  `idPacientes` INT NOT NULL AUTO_INCREMENT,
  `nombrePaciente` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `Edad` INT NULL,
  `Pacientescol` VARCHAR(45) NULL,
  PRIMARY KEY (`idPacientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Riesgos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Riesgos` (
  `idRiesgos` INT NOT NULL,
  `Bajo` INT NOT NULL,
  `Moderado` INT NOT NULL,
  `Alto` INT NOT NULL,
  `Muy Alto` INT NOT NULL,
  PRIMARY KEY (`idRiesgos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Citas` (
  `idCitas` INT NOT NULL AUTO_INCREMENT,
  `motivoConsulta` VARCHAR(45) NOT NULL,
  `idPaciente` INT NOT NULL,
  `idArea` INT NOT NULL,
  `idProfesional` INT NOT NULL,
  `idSede` INT NOT NULL,
  `idFechaConsulta` INT NOT NULL,
  `idRiesgo` INT NOT NULL,
  `precio` DECIMAL NULL,
  `Citascol` VARCHAR(45) NULL,
  PRIMARY KEY (`idCitas`),
  INDEX `fk_Citas_Fechas1_idx` (`idFechaConsulta` ASC, `idProfesional` ASC) VISIBLE,
  INDEX `fk_Citas_Areas1_idx` (`idArea` ASC) VISIBLE,
  INDEX `fk_Citas_Sedes1_idx` (`idSede` ASC) VISIBLE,
  INDEX `fk_Citas_Pacientes1_idx` (`idPaciente` ASC) VISIBLE,
  INDEX `fk_Citas_Riesgos1_idx` (`idRiesgo` ASC) VISIBLE,
  CONSTRAINT `fk_Citas_Fechas1`
    FOREIGN KEY (`idFechaConsulta` , `idProfesional`)
    REFERENCES `mydb`.`Fechas` (`idFechas` , `idProfesional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Areas1`
    FOREIGN KEY (`idArea`)
    REFERENCES `mydb`.`Areas` (`idAreas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Sedes1`
    FOREIGN KEY (`idSede`)
    REFERENCES `mydb`.`Sedes` (`idSedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Pacientes1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `mydb`.`Pacientes` (`idPacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Riesgos1`
    FOREIGN KEY (`idRiesgo`)
    REFERENCES `mydb`.`Riesgos` (`idRiesgos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Foro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Foro` (
  `idForo` INT NOT NULL,
  `comentario` VARCHAR(45) NOT NULL,
  `nombrePersona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idForo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Recursos` (
  `idRecursos` INT NOT NULL,
  PRIMARY KEY (`idRecursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Frases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Frases` (
  `idFrases` INT NOT NULL,
  `frase` VARCHAR(45) NULL,
  `idRecurso` INT NOT NULL,
  PRIMARY KEY (`idFrases`, `idRecurso`),
  INDEX `fk_Frases_Recursos1_idx` (`idRecurso` ASC) VISIBLE,
  CONSTRAINT `fk_Frases_Recursos1`
    FOREIGN KEY (`idRecurso`)
    REFERENCES `mydb`.`Recursos` (`idRecursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Canciones` (
  `idCanciones` INT NOT NULL,
  `nombreCancion` VARCHAR(45) NOT NULL,
  `tipoCancion` INT NOT NULL,
  `idRecurso` INT NOT NULL,
  PRIMARY KEY (`idCanciones`, `idRecurso`),
  INDEX `fk_Canciones_Recursos1_idx` (`idRecurso` ASC) VISIBLE,
  CONSTRAINT `fk_Canciones_Recursos1`
    FOREIGN KEY (`idRecurso`)
    REFERENCES `mydb`.`Recursos` (`idRecursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
