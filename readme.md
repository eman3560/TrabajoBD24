# (Poner titulo)

### **1.** Introducción

### **2.** Descripcion

### **3.** Diagrama de base de datos
![image](https://github.com/user-attachments/assets/89db22a3-a5ff-4a08-bce2-297e61937b60)

### **4.** Instalacion

### **5.** Sentencias

> Creación y uso de la base de datos.

```mysql
CREATE DATABASE pat24;
USE pat24;
```
> Creación de la tabla principal de la base de datos.
```mysql
CREATE TABLE base(
    base_cod MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    tramite_tipo	VARCHAR(255) ,
    tramite_fecha	VARCHAR(255) ,
    fecha_inscripcion_inicial	VARCHAR(255) ,
    registro_seccional_codigo	VARCHAR(255) ,
    registro_seccional_descripcion	VARCHAR(255) ,
    registro_seccional_provincia	VARCHAR(255) ,
    automotor_origen	VARCHAR(255) ,
    automotor_anio_modelo	VARCHAR(255) ,
    automotor_tipo_codigo	VARCHAR(255) ,
    automotor_tipo_descripcion	VARCHAR(255) ,
    automotor_marca_codigo	VARCHAR(255) ,
    automotor_marca_descripcion	VARCHAR(255) ,
    automotor_modelo_codigo	VARCHAR(255) ,
    automotor_modelo_descripcion	VARCHAR(255) ,
    automotor_uso_codigo	VARCHAR(255) ,
    automotor_uso_descripcion	VARCHAR(255) ,
    titular_tipo_persona	VARCHAR(255) ,
    titular_domicilio_localidad	VARCHAR(255) ,
    titular_domicilio_provincia	VARCHAR(255) ,
    titular_genero	VARCHAR(255) ,
    titular_anio_nacimiento	VARCHAR(255) ,
    titular_pais_nacimiento	VARCHAR(255) ,
    titular_porcentaje_titularidad	VARCHAR(255) ,
    titular_domicilio_provincia_id	VARCHAR(255) ,
    titular_pais_nacimiento_id	VARCHAR(255) 
);
```

> Carga del .csv al entorno.
```mysql
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
```

> Normalización de los datos.
- Columnas con cadenas de texto vacias pasandolas a NULL.
```mysql
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
```

> Creación de tablas importantes.
```mysql
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
```

> Generación de referencias en la tabla principal a las tablas relacionadas.
```mysql
# remplazo a descripcion de los generos en la tabla base por la referencia a la tabla generos
UPDATE base
JOIN genero
ON base.titular_genero=genero.titular_gen
SET base.titular_genero = genero.cod_titular_gen;
# el campo titular_genero se importo como varchar(255) pero ahora que solo tiene un numero no necesita ser tan grande. Lo hago tinyint porque
#ese tipo de dato es la clave primaria de la tabla y es necesario que sean iguales para hacer las reglas de integridad
ALTER TABLE base MODIFY titular_genero tinyint;
# agrego reglas de integridad referencial
ALTER TABLE base
ADD CONSTRAINT fk_genero
FOREIGN KEY (titular_genero)
REFERENCES genero(cod_titular_gen)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

###
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

###

UPDATE base
JOIN automotor_marca_descrip
ON base.automotor_marca_codigo=automotor_marca_descrip.marca_cod
AND base.automotor_marca_descripcion=automotor_marca_descrip.marca_desc
SET base.automotor_marca_codigo=automotor_marca_descrip.cod_marca_desc

ALTER TABLE base MODIFY base.automotor_marca_codigo smallint;

ALTER TABLE base DROP COLUMN base.automotor_marca_descripcion;

ALTER TABLE base
ADD CONSTRAINT fk_marca
FOREIGN KEY (automotor_marca_codigo)
REFERENCES automotor_marca_descrip(cod_marca_desc)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

###

UPDATE base
JOIN automotor_modelo_descrip
ON base.automotor_modelo_codigo=automotor_modelo_descrip.modelo_cod
AND base.automotor_modelo_descripcion=automotor_modelo_descrip.modelo_desc
SET base.automotor_modelo_codigo=automotor_modelo_descrip.cod_modelo_desc

ALTER TABLE base MODIFY base.automotor_modelo_codigo smallint;

ALTER TABLE base DROP COLUMN base.automotor_modelo_descripcion;

ALTER TABLE base
ADD CONSTRAINT fk_modelo
FOREIGN KEY (automotor_modelo_codigo)
REFERENCES automotor_modelo_descrip(cod_modelo_desc)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

### PROVINCIA DEL REGISTRO DONDE SE INSCRIBIO EL AUTO

UPDATE base
JOIN provincia
ON base.registro_seccional_provincia=provincia.prov_nom
SET base.registro_seccional_provincia=provincia.prov_cod

ALTER TABLE base MODIFY base.registro_seccional_provincia tinyint;

ALTER TABLE base
ADD CONSTRAINT fk_prov_secc
FOREIGN KEY (registro_seccional_provincia)
REFERENCES provincia(prov_cod)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

### PROVINCIA DEL COMPRADOR DEL AUTO
UPDATE base
JOIN provincia
ON base.registro_seccional_provincia=provincia.prov_nom
SET base.registro_seccional_provincia=provincia.prov_cod

ALTER TABLE base MODIFY base.registro_seccional_provincia tinyint;

ALTER TABLE base
ADD CONSTRAINT fk_prov_secc
FOREIGN KEY (registro_seccional_provincia)
REFERENCES provincia(prov_cod)
ON DELETE RESTRICT
ON UPDATE RESTRICT;
```

-- error: hay 3 provincias escritas en forma diferente CIUDADA AUTONOMA DE BUENOS AIRES, SANTIAGO DEL ESTERO Y TIERRA DEL FUEGO
--se corrige poniendo el mismo codigo de provincia que la seccion
```mysql
UPDATE base
JOIN provincia
ON base.titular_domicilio_provincia=provincia.prov_nom
SET base.titular_domicilio_provincia=provincia.prov_cod;

ALTER TABLE base MODIFY base.titular_domicilio_provincia tinyint;

UPDATE base 
SET base.titular_domicilio_provincia=base.registro_seccional_provincia
WHERE base.titular_domicilio_provincia=0;

ALTER TABLE base
ADD CONSTRAINT fk_prov_mod
FOREIGN KEY (titular_domicilio_provincia)
REFERENCES provincia(prov_cod)
ON DELETE RESTRICT
ON UPDATE RESTRICT;
-----------------------
--editando el resto de los campos para disminur tamaño BD. Inicial 14,1

ALTER TABLE base MODIFY base.tramite_tipo VARCHAR(60)
ALTER TABLE base MODIFY tramite_fecha date
ALTER TABLE base MODIFY base.fecha_inscripcion_inicial date
ALTER TABLE base MODIFY registro_seccional_codigo varchar(5)
ALTER TABLE base MODIFY registro_seccional_descripcion varchar(50)
ALTER TABLE base MODIFY automotor_origen varchar(12)
ALTER TABLE base MODIFY base.automotor_anio_modelo VARCHAR(5)
ALTER TABLE base MODIFY base.automotor_uso_codigo VARCHAR(1)
ALTER TABLE base MODIFY base.automotor_uso_descripcion varchar(7)  
ALTER TABLE base MODIFY base.titular_tipo_persona varchar(9)
ALTER TABLE base MODIFY base.titular_domicilio_localidad varchar(42)
ALTER TABLE base MODIFY base.titular_anio_nacimiento varchar(5)
ALTER TABLE base MODIFY base.titular_pais_nacimiento varchar(20)
ALTER TABLE base MODIFY base.titular_porcentaje_titularidad varchar(3)
ALTER TABLE base MODIFY base.titular_domicilio_provincia_id varchar(2)
ALTER TABLE base MODIFY base.titular_pais_nacimiento_id varchar(4)

``` VISTAS Y CONSULTAS
-- vista de las principales 10 localidades en las que se patentaron autos
CREATE VIEW InscripcionSF10 AS
SELECT base.titular_domicilio_localidad, COUNT(base.titular_domicilio_localidad) AS totales, provincia.prov_nom
FROM base, provincia
WHERE base.titular_domicilio_provincia=provincia.prov_cod AND provincia.prov_nom="SANTA FE"
GROUP BY base.titular_domicilio_localidad, provincia.prov_nom
ORDER BY totales DESC LIMIT 10

-- vista de cuantas inscripciones fueron realizadas a masculinos, femeninos y otros
CREATE VIEW generos AS 
SELECT genero.titular_gen, COUNT(*) AS Totales FROM genero, base
WHERE base.titular_genero=genero.cod_titular_gen
GROUP BY genero.titular_gen
ORDER BY Totales desc

--vista de las marcas que registraron mayor cantidad de patentamientos
CREATE VIEW TotalMarcas as
SELECT automotor_marca_descrip.marca_desc, COUNT(*) AS Totales FROM automotor_marca_descrip, base
WHERE base.automotor_marca_codigo=automotor_marca_descrip.cod_marca_desc
GROUP BY automotor_marca_descrip.marca_desc
ORDER BY Totales desc

--vista de marca y modelo más patentados durante julio
CREATE VIEW MarcaModelo as
SELECT automotor_modelo_descrip.modelo_desc, automotor_marca_descrip.marca_desc, COUNT(*) AS Totales
FROM base, automotor_modelo_descrip,automotor_marca_descrip
WHERE base.automotor_marca_codigo=automotor_marca_descrip.cod_marca_desc AND base.automotor_modelo_codigo=automotor_modelo_descrip.cod_modelo_desc
GROUP BY automotor_modelo_descrip.modelo_desc, automotor_marca_descrip.marca_desc
ORDER BY Totales desc

--vista modelos de vehiculos y edad promedio de adquisicion
CREATE VIEW ModelosEdad as
SELECT automotor_modelo_descrip.modelo_desc, automotor_marca_descrip.marca_desc, COUNT(*) as totales, YEAR(CURDATE())-round(avg(base.titular_anio_nacimiento)) AS Edad
FROM base, automotor_modelo_descrip,automotor_marca_descrip
WHERE base.automotor_marca_codigo=automotor_marca_descrip.cod_marca_desc 
AND base.automotor_modelo_codigo=automotor_modelo_descrip.cod_modelo_desc
AND base.titular_tipo_persona!="Jurídica"
GROUP BY automotor_modelo_descrip.modelo_desc, automotor_marca_descrip.marca_desc
ORDER BY totales desc

--distribucion de edades por inscripcion--
CREATE VIEW InscripcionEdad AS 
SELECT base.titular_anio_nacimiento, COUNT(*) as totales, YEAR(CURDATE())-round(avg(base.titular_anio_nacimiento)) AS Edad
FROM base
WHERE base.titular_tipo_persona!="Jurídica" AND base.automotor_uso_descripcion="Privado" AND base.titular_anio_nacimiento<"2011"
GROUP BY base.titular_anio_nacimiento asc
