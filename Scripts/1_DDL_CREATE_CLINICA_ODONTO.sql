-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ClinicaOdontologica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ClinicaOdontologica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ClinicaOdontologica` DEFAULT CHARACTER SET utf8 ;
USE `ClinicaOdontologica` ;

-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`PlanoSaude`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`PlanoSaude` (
  `numeroApolice` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `abrangencia` VARCHAR(45) NOT NULL,
  `tipoContratacao` VARCHAR(30) NOT NULL,
  `preco` DECIMAL(8,2) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`numeroApolice`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Paciente` (
  `cpf` VARCHAR(14) NOT NULL,
  `rg` VARCHAR(10) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `estadoCivil` VARCHAR(45) NOT NULL,
  `profissao` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `PlanoSaude_numeroApolice` INT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `rg_UNIQUE` (`rg` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Paciente_PlanoSaude1_idx` (`PlanoSaude_numeroApolice` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_PlanoSaude1`
    FOREIGN KEY (`PlanoSaude_numeroApolice`)
    REFERENCES `ClinicaOdontologica`.`PlanoSaude` (`numeroApolice`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `email` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NOT NULL,
  `Paciente_cpf` VARCHAR(14) NOT NULL,
  `PlanoSaude_numeroApolice` INT NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idTelefone`),
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC) VISIBLE,
  INDEX `fk_Telefone_Paciente_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Telefone_PlanoSaude1_idx` (`PlanoSaude_numeroApolice` ASC) VISIBLE,
  INDEX `fk_Telefone_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Paciente`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `ClinicaOdontologica`.`Paciente` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Telefone_PlanoSaude1`
    FOREIGN KEY (`PlanoSaude_numeroApolice`)
    REFERENCES `ClinicaOdontologica`.`PlanoSaude` (`numeroApolice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Telefone_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `ClinicaOdontologica`.`Funcionario` (`idFuncionario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(9) NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `numero` INT UNSIGNED NOT NULL,
  `compl` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `Paciente_cpf` VARCHAR(14) NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Endereco_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `ClinicaOdontologica`.`Paciente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `ClinicaOdontologica`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Cargo` (
  `cbo` INT NOT NULL,
  `ocupacao` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(7,2) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`cbo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Trabalhar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Trabalhar` (
  `Cargo_cbo` INT NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NULL,
  PRIMARY KEY (`Cargo_cbo`, `Funcionario_idFuncionario`),
  INDEX `fk_Funcionario_has_Cargo_Cargo1_idx` (`Cargo_cbo` ASC) VISIBLE,
  INDEX `fk_Trabalhar_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_has_Cargo_Cargo1`
    FOREIGN KEY (`Cargo_cbo`)
    REFERENCES `ClinicaOdontologica`.`Cargo` (`cbo`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Trabalhar_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `ClinicaOdontologica`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Agendamento` (
  `idAgendamento` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `estadoDoPaciente` VARCHAR(45) NOT NULL,
  `Paciente_cpf` VARCHAR(14) NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idAgendamento`, `Funcionario_idFuncionario`),
  INDEX `fk_Agendamento_Paciente1_idx` (`Paciente_cpf` ASC) VISIBLE,
  INDEX `fk_Agendamento_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Agendamento_Paciente1`
    FOREIGN KEY (`Paciente_cpf`)
    REFERENCES `ClinicaOdontologica`.`Paciente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Agendamento_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `ClinicaOdontologica`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Dentista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Dentista` (
  `Funcionario_idFuncionario` INT NOT NULL,
  `cro` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Funcionario_idFuncionario`),
  INDEX `fk_Dentista_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Dentista_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `ClinicaOdontologica`.`Funcionario` (`idFuncionario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Procedimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Procedimento` (
  `idProcedimento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `custo` DECIMAL(8,2) UNSIGNED ZEROFILL NOT NULL,
  `preco` DECIMAL(8,2) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`idProcedimento`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`labExterno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`labExterno` (
  `idlabExterno` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `procedimento` VARCHAR(80) NOT NULL,
  `email` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`idlabExterno`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Consulta` (
  `Agendamento_idAgendamento` INT NOT NULL,
  `Agendamento_Funcionario_idFuncionario` INT NOT NULL,
  `Dentista_Funcionario_idFuncionario` INT NOT NULL,
  `Procedimento_idProcedimento` INT NULL,
  `labExterno_idlabExterno` INT NULL,
  `Funcionario_idFuncionario` INT NULL,
  PRIMARY KEY (`Agendamento_idAgendamento`, `Agendamento_Funcionario_idFuncionario`, `Dentista_Funcionario_idFuncionario`),
  INDEX `fk_Consulta_Procedimento1_idx` (`Procedimento_idProcedimento` ASC) VISIBLE,
  INDEX `fk_Consulta_Agendamento1_idx` (`Agendamento_idAgendamento` ASC, `Agendamento_Funcionario_idFuncionario` ASC) VISIBLE,
  INDEX `fk_Consulta_labExterno1_idx` (`labExterno_idlabExterno` ASC) VISIBLE,
  INDEX `fk_Consulta_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  INDEX `fk_Consulta_Dentista1_idx` (`Dentista_Funcionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Procedimento1`
    FOREIGN KEY (`Procedimento_idProcedimento`)
    REFERENCES `ClinicaOdontologica`.`Procedimento` (`idProcedimento`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Consulta_Agendamento1`
    FOREIGN KEY (`Agendamento_idAgendamento` , `Agendamento_Funcionario_idFuncionario`)
    REFERENCES `ClinicaOdontologica`.`Agendamento` (`idAgendamento` , `Funcionario_idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Consulta_labExterno1`
    FOREIGN KEY (`labExterno_idlabExterno`)
    REFERENCES `ClinicaOdontologica`.`labExterno` (`idlabExterno`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Consulta_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `ClinicaOdontologica`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Consulta_Dentista1`
    FOREIGN KEY (`Dentista_Funcionario_idFuncionario`)
    REFERENCES `ClinicaOdontologica`.`Dentista` (`Funcionario_idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClinicaOdontologica`.`Financa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClinicaOdontologica`.`Financa` (
  `Consulta_Agendamento_idAgendamento` INT NOT NULL,
  `Consulta_Agendamento_Funcionario_idFuncionario` INT NOT NULL,
  `Consulta_Dentista_Funcionario_idFuncionario` INT NOT NULL,
  `Procedimento_idProcedimento` INT NOT NULL,
  `PlanoSaude_numeroApolice` INT NOT NULL,
  `Cargo_cbo` INT NOT NULL,
  PRIMARY KEY (`Consulta_Agendamento_idAgendamento`, `Consulta_Agendamento_Funcionario_idFuncionario`, `Consulta_Dentista_Funcionario_idFuncionario`),
  INDEX `fk_Financa_Procedimento1_idx` (`Procedimento_idProcedimento` ASC) VISIBLE,
  INDEX `fk_Financa_PlanoSaude1_idx` (`PlanoSaude_numeroApolice` ASC) VISIBLE,
  INDEX `fk_Financa_Cargo1_idx` (`Cargo_cbo` ASC) VISIBLE,
  CONSTRAINT `fk_Financa_Consulta1`
    FOREIGN KEY (`Consulta_Agendamento_idAgendamento` , `Consulta_Agendamento_Funcionario_idFuncionario` , `Consulta_Dentista_Funcionario_idFuncionario`)
    REFERENCES `ClinicaOdontologica`.`Consulta` (`Agendamento_idAgendamento` , `Agendamento_Funcionario_idFuncionario` , `Dentista_Funcionario_idFuncionario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Financa_Procedimento1`
    FOREIGN KEY (`Procedimento_idProcedimento`)
    REFERENCES `ClinicaOdontologica`.`Procedimento` (`idProcedimento`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Financa_PlanoSaude1`
    FOREIGN KEY (`PlanoSaude_numeroApolice`)
    REFERENCES `ClinicaOdontologica`.`PlanoSaude` (`numeroApolice`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Financa_Cargo1`
    FOREIGN KEY (`Cargo_cbo`)
    REFERENCES `ClinicaOdontologica`.`Cargo` (`cbo`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
