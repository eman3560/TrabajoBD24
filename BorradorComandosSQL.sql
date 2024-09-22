CREATE DATABASE pat24;
USE pat24;

CREATE TABLE base(
    base_cod MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    tramite_tipo	VARCHAR(255) DEFAULT NULL,
    tramite_fecha	VARCHAR(255) DEFAULT NULL,
    fecha_inscripcion_inicial	VARCHAR(255) DEFAULT NULL,
    registro_seccional_codigo	VARCHAR(255) DEFAULT NULL,
    registro_seccional_descripcion	VARCHAR(255) DEFAULT NULL,
    registro_seccional_provincia	VARCHAR(255) DEFAULT NULL,
    automotor_origen	VARCHAR(255) DEFAULT NULL,
    automotor_anio_modelo	VARCHAR(255) DEFAULT NULL,
    automotor_tipo_codigo	VARCHAR(255) DEFAULT NULL,
    automotor_tipo_descripcion	VARCHAR(255) DEFAULT NULL,
    automotor_marca_codigo	VARCHAR(255) DEFAULT NULL,
    automotor_marca_descripcion	VARCHAR(255) DEFAULT NULL,
    automotor_modelo_codigo	VARCHAR(255) DEFAULT NULL,
    automotor_modelo_descripcion	VARCHAR(255) DEFAULT NULL,
    automotor_uso_codigo	VARCHAR(255) DEFAULT NULL,
    automotor_uso_descripcion	VARCHAR(255) DEFAULT NULL,
    titular_tipo_persona	VARCHAR(255) DEFAULT NULL,
    titular_domicilio_localidad	VARCHAR(255) DEFAULT NULL,
    titular_domicilio_provincia	VARCHAR(255) DEFAULT NULL,
    titular_genero	VARCHAR(255) DEFAULT NULL,
    titular_anio_nacimiento	VARCHAR(255) DEFAULT NULL,
    titular_pais_nacimiento	VARCHAR(255) DEFAULT NULL,
    titular_porcentaje_titularidad	VARCHAR(255) DEFAULT NULL,
    titular_domicilio_provincia_id	VARCHAR(255) DEFAULT NULL,
    titular_pais_nacimiento_id	VARCHAR(255) DEFAULT NULL
)

LOAD DATA INFILE 'C:\\BasePatentes\\TrabajoBD24\\dnrpa.csv' 
INTO TABLE base
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(tramite_tipo, tramite_fecha, fecha_inscripcion_inicial, registro_seccional_codigo, registro_seccional_descripcion,
registro_seccional_provincia, automotor_origen, automotor_anio_modelo, automotor_tipo_codigo, automotor_tipo_descripcion,
automotor_marca_codigo, automotor_marca_descripcion, automotor_modelo_codigo, automotor_modelo_descripcion, automotor_uso_codigo,
automotor_uso_descripcion, titular_tipo_persona, titular_domicilio_localidad, titular_domicilio_provincia, titular_genero,
titular_anio_nacimiento, titular_pais_nacimiento, titular_porcentaje_titularidad, titular_domicilio_provincia_id,
titular_pais_nacimiento_id);

###
-- 1 -- normalizacion de datos
UPDATE base 
SET 
    tramite_tipo = NULL
WHERE
    tramite_tipo = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    tramite_fecha = NULL
WHERE
    tramite_fecha = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    fecha_inscripcion_inicial = NULL
WHERE
    fecha_inscripcion_inicial = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    registro_seccional_codigo = NULL
WHERE
    registro_seccional_codigo = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    registro_seccional_descripcion = NULL
WHERE
    registro_seccional_descripcion = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    registro_seccional_provincia = NULL
WHERE
    registro_seccional_provincia = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    automotor_origen = NULL
WHERE
    automotor_origen = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    automotor_anio_modelo = NULL
WHERE
    automotor_anio_modelo = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    automotor_tipo_codigo = NULL
WHERE
    automotor_tipo_codigo = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    automotor_tipo_descripcion = NULL
WHERE
    automotor_tipo_descripcion = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    automotor_marca_codigo = NULL
WHERE
    automotor_marca_codigo = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    automotor_marca_descripcion = NULL
WHERE
    automotor_marca_descripcion = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    automotor_modelo_codigo = NULL
WHERE
    automotor_modelo_codigo = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    automotor_modelo_descripcion = NULL
WHERE
    automotor_modelo_descripcion = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    automotor_uso_codigo = NULL
WHERE
    automotor_uso_codigo = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    automotor_uso_descripcion = NULL
WHERE
    automotor_uso_descripcion = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    titular_tipo_persona = NULL
WHERE
    titular_tipo_persona = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    titular_domicilio_localidad = NULL
WHERE
    titular_domicilio_localidad = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    titular_domicilio_provincia = NULL
WHERE
    titular_domicilio_provincia = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    titular_genero = NULL
WHERE
    titular_genero = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    titular_anio_nacimiento = NULL
WHERE
    titular_anio_nacimiento = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    titular_pais_nacimiento = NULL
WHERE
    titular_pais_nacimiento = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    titular_porcentaje_titularidad = NULL
WHERE
    titular_porcentaje_titularidad = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    titular_domicilio_provincia_id = NULL
WHERE
    titular_domicilio_provincia_id = ''
        AND base_cod IS NOT NULL;

###

UPDATE base 
SET 
    titular_pais_nacimiento_id = NULL
WHERE
    titular_pais_nacimiento_id = ''
        AND base_cod IS NOT NULL;
--2 crear tablas relacionadas y cargar datos -----------------------------------------

CREATE TABLE provincia(
prov_cod TINYINT PRIMARY KEY AUTO_INCREMENT,
prov_nom VARCHAR(50) NOT null);

INSERT INTO provincia(prov_nom) 
SELECT DISTINCT registro_seccional_provincia
FROM base;

CREATE TABLE automotor_tipo_descrip(
cod_tipo_desc TINYINT PRIMARY KEY AUTO_INCREMENT,
tipo_cod VARCHAR(2),
tipo_desc VARCHAR(50) NOT NULL);

INSERT INTO automotor_tipo_descrip(tipo_cod,tipo_desc)
SELECT distinct base.automotor_tipo_codigo,base.automotor_tipo_descripcion
FROM base;

CREATE TABLE automotor_marca_descrip(
cod_marca_desc smallint PRIMARY KEY AUTO_INCREMENT,
marca_cod varchar(4),
marca_desc VARCHAR(50) NOT NULL);

insert into automotor_marca_descrip(marca_cod, marca_desc)
SELECT DISTINCT base.automotor_marca_codigo,base.automotor_marca_descripcion
FROM base;

CREATE TABLE automotor_modelo_descrip(
cod_modelo_desc SMALLINT PRIMARY KEY AUTO_INCREMENT,
modelo_cod varchar(4),
modelo_desc VARCHAR(50) NOT NULL);

INSERT into automotor_modelo_descrip(modelo_cod,modelo_desc)
SELECT DISTINCT base.automotor_modelo_codigo,base.automotor_modelo_descripcion
FROM base;

CREATE TABLE genero(
cod_titular_gen TINYINT PRIMARY KEY AUTO_INCREMENT,
titular_gen VARCHAR(50) NOT NULL);

INSERT into genero(titular_gen)
SELECT DISTINCT base.titular_genero
FROM base;

--3 generar referencias en la tabla principal a las tablas relacionadas------------------------------------

---- remplazo a descripcion de los generos en la tabla base por la referencia a la tabla generos---
UPDATE base
JOIN genero
ON base.titular_genero=genero.titular_gen
SET base.titular_genero = genero.cod_titular_gen;
--- el campo titular_genero se importo como varchar(255) pero ahora que solo tiene un numero no necesita ser tan grande. Lo hago tinyint porque
-- ese tipo de dato es la clave primaria de la tabla y es necesario que sean iguales para hacer las reglas de integridad---
ALTER TABLE base MODIFY titular_genero tinyint;
--- agrego reglas de integridad referencial
ALTER TABLE base
ADD CONSTRAINT fk_genero
FOREIGN KEY (titular_genero)
REFERENCES genero(cod_titular_gen)
ON DELETE RESTRICT
ON UPDATE RESTRICT;


UPDATE base
JOIN automotor_tipo_descrip
ON base.automotor_tipo_codigo=automotor_tipo_descrip.tipo_cod 
AND base.automotor_tipo_descripcion=automotor_tipo_descrip.tipo_desc
SET base.automotor_tipo_codigo = automotor_tipo_descrip.cod_tipo_desc

ALTER TABLE base MODIFY base.automotor_tipo_codigo tinyint;

ALTER TABLE base DROP COLUMN base.automotor_tipo_descripcion;

ALTER TABLE base
ADD CONSTRAINT fk_tipo
FOREIGN KEY (automotor_tipo_codigo)
REFERENCES automotor_tipo_descrip(cod_tipo_desc)
ON DELETE RESTRICT
ON UPDATE RESTRICT;
