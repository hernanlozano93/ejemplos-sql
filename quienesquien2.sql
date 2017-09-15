CREATE TABLE PERSONAS
    (`nombre` varchar(20), `genero` varchar(1),
     `tipo_pelo` varchar(15), `gafas` varchar(1));

INSERT INTO PERSONAS VALUES
	('Roberto', 'H', 'BLA', 'N'),
	('Carla', 'M', 'MOR', 'S'),
	('Mercedes', 'M', 'RUB', 'N'),
        ('Enrique', 'H', 'CAS', 'N'),
	('Albert','H','SIN','N'),
	('Carla','M','MOR','S'),
	('Marta','M','MOR','N'),
	('Roger','H','RUB','S'),
	('Elisabet','M','CAS','S'),
	('Oriol','H','MOR','N'),
	('Lola','O','BLA','S'),
	('Sara','M','RUB','S'),
	('Jose','H','BLA','S'),
	('Adriana','M','RUB','N'),
	('Iris','M','MOR','S'),
	('Manel','H','CAS','N'),
	('Jessica','M','MOR','N'),
	('Alvaro','H','CAS','S'),
	('Juan','H','SIN','N'),
	('Judit','M','PEL','N'),
	('David','M','PEL','N'),
	('Elena','M','PEL','S'),
	('Nadia','M','RUB','N'),
	('Alex','O','MOR','S')
;

-- Consultas de criterios-.

SELECT * FROM PERSONAS WHERE TIPO_PELO='RUB';

SELECT * FROM PERSONAS WHERE TIPO_PELO='MOR' AND GAFAS='N';

SELECT * FROM PERSONAS WHERE GENERO='H' AND GAFAS='S';

-- Consultas 3 criterios
SELECT * FROM PERSONAS 
WHERE GENERO='M' AND 
	TIPO_PELO='RUB' AND 
	GAFAS='S';

-- Consulta generos no binarios
SELECT * FROM PERSONAS 
WHERE GENERO<>'M' AND GENERO<>'H';

-- Consultas de porcentajes.

select TIPO_PELO, count(TIPO_PELO) AS 'Numero',
count(TIPO_PELO) / (select count(*) from PERSONAS) * 100 AS 'Porcentaje'
from PERSONAS group by TIPO_PELO;

select GENERO, count(GENERO) AS 'Numero',
count(GENERO) / (select count(*) from PERSONAS) * 100 AS 'Porcentaje'
from PERSONAS group by GENERO;

select GAFAS, count(GAFAS) AS 'Numero',
count(GAFAS) / (select count(*) from PERSONAS) * 100 AS 'Porcentaje'
from PERSONAS group by GAFAS;

-- Tratamiento de fechas.
CREATE TABLE PERSONAS2
    (`nombre` varchar(20), `genero` varchar(1),
     `tipo_pelo` varchar(15), `gafas` varchar(1), nacimiento timestamp);
     
INSERT INTO PERSONAS2 VALUES
	('Alberto', 'H', 'BLA', 'N','1985-10-11'),
	('Carla', 'M', 'MOR', 'S','1981-03-11'),
	('Andrea','O','PEL','N','1992-12-01'),
	('Mercedes', 'M', 'RUB', 'N','1977-01-23'),
        ('Enrique', 'H', 'CAS', 'N','1989-06-29'),
	('Mickey','O','MOR','S','1986-04-13'),
;

-- Mostrar edad a partir fecha de nacimiento
SELECT nombre, nacimiento, CURDATE(),
    (YEAR(CURDATE())-YEAR(nacimiento)) - (RIGHT(CURDATE(),5)<RIGHT(nacimiento,5))
    AS nacimiento FROM PERSONAS2 ORDER BY nacimiento;

-- Mostrar nombre y fecha de nac. mayores de 30 años
SELECT nombre, DATE_FORMAT(nacimiento, "%d/%m/%Y") FROM PERSONAS2 
WHERE (YEAR(CURDATE())-YEAR(BirthDate))>=30 ORDER BY nacimiento;
