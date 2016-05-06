CREATE DATABASE IF NOT EXISTS facturacion;
USE facturacion;

DROP TABLE IF EXISTS personas;
CREATE TABLE personas (
	nombre VARCHAR(40) NOT NULL DEFAULT '',
	genero VARCHAR(1) NOT NULL DEFAULT '',
	PRIMARY KEY (nombre)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

DROP TABLE IF EXISTS follamistades;
CREATE TABLE follamistades (
	nombre1 VARCHAR(40) NOT NULL DEFAULT '',
	nombre2 VARCHAR(40) NOT NULL DEFAULT '',
	fechaInicio TIMESTAMP NOT NULL DEFAULT '2015-01-01',
	PRIMARY KEY (nombre1,nombre2)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

INSERT INTO PERSONAS VALUES
	('Laura','F'),('Jordi','M'),('Ana','F'),
	('Angel','M'),('Manolo','M'),('Judit','F'),
	('Javi','M'),('Toni','M'),('Marta','F'),
	('Enrique','M'),('David','M');
	
INSERT INTO PERSONAS VALUES
	('Tere','F'),('Martin','M'),('Sara','F'),
	('Juan','M'),('Fernando','M'),('Clara','F');
	
-- Número y porcentaje de Hombres y mujeres.
select count(genero),
count(genero) / (select count(*) from PERSONAS) 
from PERSONAS
group by genero;

INSERT INTO FOLLAMISTADES VALUES
	('Laura','David','2014-07-08'),('Enrique','Javi','2014-09-03'),
	('Toni','Ana','2015-06-14'),('Ana','Manolo','2015-02-18');
INSERT INTO FOLLAMISTADES VALUES	
	('Clara','Sara','2015-11-11'),('Fernando','Judit','2016-01-01');
 
 -- Lista de personas que viven una follamistad.
 select p.nombre from follamistades as f, personas as p
 where p.nombre=f.nombre1 or p.nombre=f.nombre2

 -- lista de personas que no tienen el placer de vivir
 -- ninguna follamistad.
 select p1.nombre from personas as p1
 where p1.nombre not in(
	 select p.nombre from follamistades as f, personas as p
	 where p.nombre=f.nombre1 or p.nombre=f.nombre2
 );
 
 select nombre from personas where genero='f'
 
 -- Lista de follamistad homosexuales
  select f.nombre1,f.nombre2 from follamistades as f
  where -- Lesbianas
  f.nombre1 in (select nombre from personas where genero='f') and 
  f.nombre2 in (select nombre from personas where genero='f')
  or -- Gays
  f.nombre1 in (select nombre from personas where genero='m') and 
  f.nombre2 in (select nombre from personas where genero='m'); 