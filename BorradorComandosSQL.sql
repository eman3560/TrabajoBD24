CREATE DATABASE pat24;
use pat24;

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

LOAD DATA INFILE 'Y:\\Trabajo Base de Datos\\TrabajoBD24\\dnrpa.csv' 
INTO TABLE Base
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(tramite_tipo, tramite_fecha, fecha_inscripcion_inicial, registro_seccional_codigo, registro_seccional_descripcion,
registro_seccional_provincia, automotor_origen, automotor_anio_modelo, automotor_tipo_codigo, automotor_tipo_descripcion,
automotor_marca_codigo, automotor_marca_descripcion, automotor_modelo_codigo, automotor_modelo_descripcion, automotor_uso_codigo,
automotor_uso_descripcion, titular_tipo_persona, titular_domicilio_localidad, titular_domicilio_provincia, titular_genero,
titular_anio_nacimiento, titular_pais_nacimiento, titular_porcentaje_titularidad, titular_domicilio_provincia_id,
titular_pais_nacimiento_id);


UPDATE base
SET automotor_modelo_codigo=NULL
WHERE automotor_modelo_codigo=""

UPDATE base
SET base.automotor_origen = NULL
WHERE base.automotor_origen = "" ;
