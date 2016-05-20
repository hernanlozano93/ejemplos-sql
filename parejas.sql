DROP TABLE IF EXISTS personas;
CREATE TABLE personas (
	nombre VARCHAR(40) NOT NULL DEFAULT '',
	genero VARCHAR(1) NOT NULL DEFAULT '',
	fechaNacimiento TIMESTAMP NOT NULL,
	PRIMARY KEY (nombre)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

DROP TABLE IF EXISTS parejas;
CREATE TABLE parejas (
	nombre1 VARCHAR(40) NOT NULL DEFAULT '',
	nombre2 VARCHAR(40) NOT NULL DEFAULT '',
	fechaInicio TIMESTAMP NOT NULL,
	PRIMARY KEY (nombre1,nombre2)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

INSERT INTO PERSONAS VALUES
	('Laura','F','1989-06-11'),('Jordi','M','1985-10-11'),
	('Ana','F','1991-05-01'),('Angel','M','1986-12-20'),
	('Manolo','M','1978-08-16'),('Judit','F','1981-09-02'),
	('Javi','M','1987-04-21'),('Toni','M','1980-11-20'),
	('Marta','F','1983-12-16'),('Enrique','M','1976-09-23'),
	('David','M','1982-10-12'),('Sandra','F','1993-08-25');
	
INSERT INTO PERSONAS VALUES
	('Tere','F','1979-07-21'),('Martin','M','1986-12-12'),
	('Sara','F','1990-06-15'),('Juan','M','1988-05-20'),
	('Fernando','M','1977-02-27'),('Clara','F','1987-06-21'),
	('Lola','F','1979-07-21'),('Alberto','M','1992-10-21'),
	('Victor','M','1984-05-30'),('Raquel','F','1985-11-30');
	
-- Número y porcentaje de Hombres y mujeres.
select count(genero),
count(genero) / (select count(*) from PERSONAS) 
from PERSONAS
group by genero;

INSERT INTO PAREJAS VALUES
	('Laura','David','2014-07-08'),('Enrique','Javi','2014-09-03'),
	('Toni','Ana','2015-06-14'),('Ana','Manolo','2015-02-18');
INSERT INTO PAREJAS VALUES	
	('Clara','Sara','2015-11-11'),('Fernando','Judit','2016-01-01');
 
 -- Lista de personas que viven una pareja.
 select p.nombre from parejas as f, personas as p
 where p.nombre=f.nombre1 or p.nombre=f.nombre2

 -- lista de personas que no estan viviendo
 -- ninguna relación de pareja.
 select p1.nombre from personas as p1
 where p1.nombre not in(
	 select p.nombre from parejas as f, personas as p
	 where p.nombre=f.nombre1 or p.nombre=f.nombre2
 );
 
 -- Lista de parejas homosexuales
  select f.nombre1,f.nombre2 from parejas as f
  where -- Lesbianas
  f.nombre1 in (select nombre from personas where genero='f') and 
  f.nombre2 in (select nombre from personas where genero='f')
  or -- Gays
  f.nombre1 in (select nombre from personas where genero='m') and 
  f.nombre2 in (select nombre from personas where genero='m'); 
  
  -- Acualización necesaria para una persona que se cambia de genero.
  update personas
  SET nombre='Victoria', genero='F'
  where nombre='Victor';
  
