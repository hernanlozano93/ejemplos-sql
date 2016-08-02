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
	('Lola','M','BLA','S'),
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
;

-- Consultas de criterios-.

-- Tipo de pelo RUB.
SELECT * FROM PERSONAS WHERE TIPO_PELO='RUB';

SELECT * FROM PERSONAS WHERE TIPO_PELO='MOR' AND GAFAS='N';

SELECT * FROM PERSONAS WHERE GENERO='H' AND GAFAS='S';

-- Consultas 3 criterios
SELECT * FROM PERSONAS 
WHERE GENERO='M' AND 
	TIPO_PELO='RUB' AND 
	GAFAS='S';

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