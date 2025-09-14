ALTER TABLE `jamundi`.`funcionarios` 
ADD COLUMN `id_cargos` INT NOT NULL AFTER `paz_salvo`,
ADD COLUMN `id_grado` INT NOT NULL AFTER `id_cargo`,
ADD COLUMN `posgrado` VARCHAR(45) NULL AFTER `id_grado`,
CHANGE COLUMN `cargo_funcionario` `cargo_funcionario` VARCHAR(80) NOT NULL ,
CHANGE COLUMN `profesion` `profesion` VARCHAR(60) NOT NULL ,
CHANGE COLUMN `direccion` `direccion` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `municipio_residencia` `municipio_residencia` VARCHAR(85) NOT NULL ,
CHANGE COLUMN `celular` `celular` VARCHAR(15) NOT NULL ,
CHANGE COLUMN `cantidad_hijos` `cantidad_hijos` INT(2) NOT NULL ,
CHANGE COLUMN `condicion_medica` `condicion_medica` TEXT NOT NULL ,
CHANGE COLUMN `is_activo` `is_activo` BIT(1) NOT NULL DEFAULT b'1' ,
CHANGE COLUMN `estado_vivienda` `estado_vivienda` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `numero_proceso_dis` `numero_proceso_dis` VARCHAR(45) NULL ,
DROP INDEX `fk_funcionarios_codigo1_idx` ,
ADD INDEX `fk_funcionarios_codigo1_idx` (`id_codigo` ASC) ;
;


ALTER TABLE `jamundi`.`funcionarios` 
ADD INDEX `fk_funcionarios_grado1_idx` (`id_grado` ASC) ,
ADD INDEX `fk_funcionarios_cargos1_idx` (`id_cargo` ASC);
;
ALTER TABLE `jamundi`.`funcionarios` 
ADD CONSTRAINT `fk_funcionarios_grado1`
  FOREIGN KEY (`id_grado`)
  REFERENCES `jamundi`.`grado` (`id_grado`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_funcionarios_cargos1`
  FOREIGN KEY (`id_cargos`)
  REFERENCES `jamundi`.`cargos` (`id_cargo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `jamundi`.`funcionarios` 
DROP COLUMN `id_estadofuncionario`;

ALTER TABLE `jamundi`.`funcionarios` 
ADD COLUMN `ano_ingreso` VARCHAR(45) NULL AFTER `posgrado`;

ALTER TABLE `jamundi`.`funcionarios` 
DROP FOREIGN KEY `fk_funcionarios_fondo_pension1`;
ALTER TABLE `jamundi`.`funcionarios` 
DROP INDEX `fk_funcionarios_fondo_pension1_idx` ;
;


ALTER TABLE `jamundi`.`nucleo_familiar` 
DROP COLUMN `is_confictoarmado`,
DROP COLUMN `is_condicionmedica`,
DROP COLUMN `is_discapacidad`,
ADD COLUMN `is_emergencia` BIT(1) NULL DEFAULT b'0' AFTER `id_parentesco`,
ADD COLUMN `contacto` VARCHAR(45) NULL AFTER `is_emergencia`;


ALTER TABLE `jamundi`.`funcionarios` 
DROP FOREIGN KEY `fk_funcionarios_formacion_academica1`;
ALTER TABLE `jamundi`.`funcionarios` 
DROP INDEX `fk_funcionarios_formacion_academica1_idx` ;
;


ALTER TABLE `jamundi`.`funcionarios` 
CHANGE COLUMN `cantidad_hijos` `cantidad_hijos` INT(2) NOT NULL DEFAULT 0 ;

ALTER TABLE `jamundi`.`funcionarios`  
DROP COLUMN `id_formacionacademica`,
DROP COLUMN `id_fondopension`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id_funcionario`, `id_tipodocumento`);
;

ALTER TABLE `jamundi`.`funcionarios` 
DROP FOREIGN KEY `fk_funcionarios_estado_civil1`;
ALTER TABLE `jamundi`.`funcionarios` 
DROP INDEX `fk_funcionarios_estado_civil1_idx` ;
;

ALTER TABLE `jamundi`.`funcionarios` 
DROP COLUMN `id_estadocivil`;


INSERT INTO `jamundi`.`victima_violencia` (`id_victimaviolencia`, `nombre`) VALUES (1, 'SI');
INSERT INTO `jamundi`.`victima_violencia` (`id_victimaviolencia`, `nombre`) VALUES (2, 'NO');
INSERT INTO `jamundi`.`victima_violencia` (`id_victimaviolencia`, `nombre`) VALUES (3, 'SI, PERO NO DECLARO POR MIEDO');
