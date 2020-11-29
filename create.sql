-- MySQL Script generated by MySQL Workbench
-- Sat Nov 28 23:18:01 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hospital
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Hospital` ;

-- -----------------------------------------------------
-- Schema Hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hospital` DEFAULT CHARACTER SET utf8 ;
USE `Hospital` ;

-- -----------------------------------------------------
-- Table `Hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Hospital` ;

CREATE TABLE IF NOT EXISTS `Hospital` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `contact_number` VARCHAR(45) NULL,
  `logo` BLOB NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Department` ;

CREATE TABLE IF NOT EXISTS `Department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `dept_head` VARCHAR(45) NULL,
  `Hospital_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Department_Hospital1_idx` (`Hospital_id` ASC) VISIBLE,
  CONSTRAINT `fk_Department_Hospital1`
    FOREIGN KEY (`Hospital_id`)
    REFERENCES `Hospital` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee` ;

CREATE TABLE IF NOT EXISTS `Employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `position` VARCHAR(45) NULL,
  `ssn` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `Department_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `PHONE_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `SSN_UNIQUE` (`ssn` ASC) VISIBLE,
  UNIQUE INDEX `idEMP_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Employee_Department1_idx` (`Department_id` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Department1`
    FOREIGN KEY (`Department_id`)
    REFERENCES `Department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Doctor` ;

CREATE TABLE IF NOT EXISTS `Doctor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  `ssn` INT NULL,
  `speciality` VARCHAR(45) NULL,
  `Employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Doctor_Employee1_idx` (`Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_Doctor_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Receptionist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Receptionist` ;

CREATE TABLE IF NOT EXISTS `Receptionist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `Employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Receptionist_Employee1_idx` (`Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_Receptionist_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patient` ;

CREATE TABLE IF NOT EXISTS `Patient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `address` VARCHAR(150) NULL,
  `phone` VARCHAR(45) NULL,
  `gender` VARCHAR(15) NULL,
  `ssn` INT NULL,
  `age` INT NULL,
  `creator` INT NOT NULL,
  `create_date` DATE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ssn_UNIQUE` (`ssn` ASC) VISIBLE,
  INDEX `fk_Patient_Receptionist1_idx` (`creator` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_Receptionist1`
    FOREIGN KEY (`creator`)
    REFERENCES `Receptionist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Nurse` ;

CREATE TABLE IF NOT EXISTS `Nurse` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `Employee_id` INT NOT NULL,
  `ssn` INT NULL,
  `position` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Nurse_Employee1_idx` (`Employee_id` ASC) VISIBLE,
  UNIQUE INDEX `ssn_UNIQUE` (`ssn` ASC) VISIBLE,
  CONSTRAINT `fk_Nurse_Employee1`
    FOREIGN KEY (`Employee_id`)
    REFERENCES `Employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Appointment` ;

CREATE TABLE IF NOT EXISTS `Appointment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `Patient_id` INT NOT NULL,
  `Doctor_idEMP` INT NOT NULL,
  `Nurse_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Appointment_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  INDEX `fk_Appointment_Doctor1_idx` (`Doctor_idEMP` ASC) VISIBLE,
  INDEX `fk_Appointment_Nurse1_idx` (`Nurse_id` ASC) VISIBLE,
  CONSTRAINT `fk_Appointment_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `Patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_Doctor1`
    FOREIGN KEY (`Doctor_idEMP`)
    REFERENCES `Doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_Nurse1`
    FOREIGN KEY (`Nurse_id`)
    REFERENCES `Nurse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medicine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medicine` ;

CREATE TABLE IF NOT EXISTS `Medicine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rooms` ;

CREATE TABLE IF NOT EXISTS `Rooms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `room_type` VARCHAR(45) NULL,
  `room_number` INT NULL,
  `vacancy` VARCHAR(15) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `room_number_UNIQUE` (`room_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Visit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Visit` ;

CREATE TABLE IF NOT EXISTS `Visit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `diagnosis` VARCHAR(45) NULL,
  `treatment` VARCHAR(45) NULL,
  `Patient_id` INT NOT NULL,
  `Appointment_id` INT NOT NULL,
  `Doctor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Visit_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  INDEX `fk_Visit_Appointment1_idx` (`Appointment_id` ASC) VISIBLE,
  INDEX `fk_Visit_Doctor1_idx` (`Doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Visit_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `Patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visit_Appointment1`
    FOREIGN KEY (`Appointment_id`)
    REFERENCES `Appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visit_Doctor1`
    FOREIGN KEY (`Doctor_id`)
    REFERENCES `Doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prescribes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prescribes` ;

CREATE TABLE IF NOT EXISTS `prescribes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` VARCHAR(45) NULL,
  `Visit_id` INT NOT NULL,
  `Doctor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_prescribes_Visit1_idx` (`Visit_id` ASC) VISIBLE,
  INDEX `fk_prescribes_Doctor1_idx` (`Doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_prescribes_Visit1`
    FOREIGN KEY (`Visit_id`)
    REFERENCES `Visit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prescribes_Doctor1`
    FOREIGN KEY (`Doctor_id`)
    REFERENCES `Doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prescrib_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prescrib_detail` ;

CREATE TABLE IF NOT EXISTS `prescrib_detail` (
  `idprescrib_detail` INT NOT NULL,
  `prescribes_id` INT NOT NULL,
  `dose` VARCHAR(45) NULL,
  `Medicine_id` INT NOT NULL,
  PRIMARY KEY (`idprescrib_detail`),
  INDEX `fk_prescrib_detail_prescribes1_idx` (`prescribes_id` ASC) VISIBLE,
  INDEX `fk_prescrib_detail_Medicine1_idx` (`Medicine_id` ASC) VISIBLE,
  CONSTRAINT `fk_prescrib_detail_prescribes1`
    FOREIGN KEY (`prescribes_id`)
    REFERENCES `prescribes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prescrib_detail_Medicine1`
    FOREIGN KEY (`Medicine_id`)
    REFERENCES `Medicine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stay`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Stay` ;

CREATE TABLE IF NOT EXISTS `Stay` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `Patient_id` INT NOT NULL,
  `Rooms_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Stay_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  INDEX `fk_Stay_Rooms1_idx` (`Rooms_id` ASC) VISIBLE,
  CONSTRAINT `fk_Stay_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `Patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stay_Rooms1`
    FOREIGN KEY (`Rooms_id`)
    REFERENCES `Rooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse_has_Stay`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Nurse_has_Stay` ;

CREATE TABLE IF NOT EXISTS `Nurse_has_Stay` (
  `Nurse_id` INT NOT NULL,
  `Stay_id` INT NOT NULL,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  PRIMARY KEY (`Nurse_id`),
  INDEX `fk_Nurse_has_Stay_Stay1_idx` (`Stay_id` ASC) VISIBLE,
  INDEX `fk_Nurse_has_Stay_Nurse1_idx` (`Nurse_id` ASC) VISIBLE,
  CONSTRAINT `fk_Nurse_has_Stay_Nurse1`
    FOREIGN KEY (`Nurse_id`)
    REFERENCES `Nurse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nurse_has_Stay_Stay1`
    FOREIGN KEY (`Stay_id`)
    REFERENCES `Stay` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Insurance` ;

CREATE TABLE IF NOT EXISTS `Insurance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `plan` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patient_has_Insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patient_has_Insurance` ;

CREATE TABLE IF NOT EXISTS `Patient_has_Insurance` (
  `Patient_id` INT NOT NULL,
  `Insurance_id` INT NOT NULL,
  PRIMARY KEY (`Patient_id`, `Insurance_id`),
  INDEX `fk_Patient_has_Insurance_Insurance1_idx` (`Insurance_id` ASC) VISIBLE,
  INDEX `fk_Patient_has_Insurance_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_has_Insurance_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `Patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_has_Insurance_Insurance1`
    FOREIGN KEY (`Insurance_id`)
    REFERENCES `Insurance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Record`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Record` ;

CREATE TABLE IF NOT EXISTS `Record` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Patient_id` INT NOT NULL,
  `Visit_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Record_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  INDEX `fk_Record_Visit1_idx` (`Visit_id` ASC) VISIBLE,
  CONSTRAINT `fk_Record_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `Patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Record_Visit1`
    FOREIGN KEY (`Visit_id`)
    REFERENCES `Visit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;