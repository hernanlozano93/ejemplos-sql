-- Ejemplo tfacturas.
-- http://www.hermosaprogramacion.com/2014/07/sistema-facturacion-base-datos/
-- http://basededatos.umh.es/ejercicios/facturacion/ejercicio.htm
-- Recordemos: 
-- 1 cliente N tfacturas.
-- 1 factura N lineas factura.
-- 1 producto puede estar en N lineas factura.

CREATE DATABASE IF NOT EXISTS facturacion;
USE facturacion;

DROP TABLE IF EXISTS tclientes;
CREATE TABLE tclientes (
	idcliente VARCHAR(10) NOT NULL DEFAULT '',
	nombre VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (idcliente)
) COLLATE='latin1_swedish_ci' ENGINE=InnoDB;
 
DROP TABLE IF EXISTS tfacturas;
 CREATE TABLE tfacturas (
	idfactura INT(11) NOT NULL,
	idcliente VARCHAR(10) NOT NULL,
	fechacobro TIMESTAMP NULL DEFAULT NULL,
	importe FLOAT NULL DEFAULT NULL,
	PRIMARY KEY (idfactura,idcliente),
	CONSTRAINT idcliente_fk FOREIGN KEY (idcliente) REFERENCES tclientes (idcliente) 
	ON UPDATE CASCADE
) COLLATE='latin1_swedish_ci' ENGINE=InnoDB;

DROP TABLE IF EXISTS tlineasfactura;
CREATE TABLE tlineasfactura (
	idlineafactura INT(11) NOT NULL,
	idfactura INT(11) NOT NULL,
	cantidad INT(5) NULL DEFAULT NULL,
	precio FLOAT NULL DEFAULT NULL,
	idproducto INT(11) NOT NULL,
	PRIMARY KEY (idfactura,idlineafactura),
	CONSTRAINT idfactura_fk FOREIGN KEY (idfactura) REFERENCES tfacturas (idfactura) 
	ON UPDATE CASCADE
	ON DELETE CASCADE
-- CONSTRAINT idproducto_fk FOREIGN KEY (idproducto) REFERENCES tproductos (idproducto)
) COLLATE='latin1_swedish_ci' ENGINE=InnoDB;

DROP TABLE IF EXISTS tproductos;
CREATE TABLE tproductos (
	idproducto INT(11) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	preciouni FLOAT NULL DEFAULT NULL,
	stock INT(5) NULL DEFAULT NULL,
	PRIMARY KEY (idproducto)
) COLLATE='latin1_swedish_ci' ENGINE=InnoDB;

INSERT INTO tclientes (idcliente,nombre) VALUES 
 ('345F','Casa Avellaner'),
 ('845Z','Racó del Tibet'),
 ('293L','Thai Best Food');
INSERT INTO tclientes (idcliente,nombre) VALUES 
 ('603P','Toriyama Land'),
 ('142B','Asador Urugayo'),
 ('348D','Meggy Liz');

INSERT INTO tfacturas (idfactura,idcliente,importe) VALUES 
 (101,'345F',10.5),
 (102,'845Z',28.00),
 (103,'345F',13.75);
 
 INSERT INTO tfacturas (idfactura,idcliente,fechacobro,importe) VALUES 
 (104,'603P','20160306',10.40),
 (105,'603P','20160401',24.20);
 
 INSERT INTO tlineasfactura (idlineafactura,idfactura,cantidad,precio,idproducto) VALUES 
 (1,101,3,10.5,1),
 (1,102,6,21.0,2),
 (2,102,1,7.0,3),
 (1,104,2,10.40,4),
 (1,103,2,7.0,1),
 (2,103,1,6.75,7);
 
 INSERT INTO tproductos (idproducto,nombre,preciouni,stock) VALUES
 (1,'Avellanes del tros',3.5,6),
 (2,'Te Dharamsala',1.75,13),
 (3,'Sherpa momos',7.0,51),
 (4,'Yokohama Green Algae',5.2,1),
 (5,'Licor de aguacate y guarana.',12.8,21),
 (6,'Pimientos picantes',2.25,4),
 (7,'Vi del Priorat',6.75,9),
 (8,'Cheers Cute Burguers',4.75,69),
 (9,'Tofu Hacendado',1.75,25),
 (10,'Cerveza beer',1.50,123);
 
 -- Consultas
 
 -- Lista tclientes
 select * from tclientes;
 
 -- Nombre y precio productos más baratos de 1.5
 select nombre,preciouni from tproductos where preciouni<=1.50;
 
  -- id y Nombre productos sin stock
 select nombre,preciouni from tproductos where stock=0;
  
 -- Lista tclientes cuyo nombre empieza por E.
  select * from tclientes 
  where nombre LIKE 'E%';
  
 -- Lista tfacturas de un cliente a partir de un codigo.
 select c.idcliente,c.nombre,f.idfactura,f.fechacobro,f.importe 
 from tclientes as c, tfacturas as f
 where c.idcliente=f.idcliente 
 and c.idcliente='345F';

-- Otra manera de realizar la consulta; mediante inner join.
 select c.idcliente,c.nombre,f.idfactura,f.fechacobro,f.importe 
 from tclientes as c inner join tfacturas as f on c.idcliente=f.idcliente 
 and c.idcliente='345F';  
 
 -- Lista de tclientes que no han pagado tfacturas; es decir,
 -- que la fecha de cobro de sus tfacturas no se ha definido.
  select idfactura,idcliente,importe from tfacturas 
  where fechacobro IS NULL;
   
 -- tfacturas ordenadas por precio de menor a mayor.
  select idfactura,idcliente,importe from tfacturas
  order by importe;
  
 -- Datos factura más cara.
 select idfactura,idcliente,max(importe) as 'Importe' from tfacturas;
 
  -- Suma importe facturas de un cliente.
 select idfactura,idcliente,sum(importe) as 'Importe' from tfacturas where idCliente='345F';
 
 -- tfacturas cobradas en el año 2015.
 select * from tfacturas
 where fechaCobro > '2014-12-31' 
 and fechaCobro < '2016-01-01';
 
 -- Consultar los productos de una factura. (inner join 2 tablas)
 select lf.idlineafactura,lf.cantidad,lf.precio,p.nombre
 from tlineasfactura as lf 
 inner join tproductos as p on lf.idproducto=p.idproducto
 where lf.idfactura=102; 
 
   -- Datos primera factura de un cliente por nombre (inner join 2 tablas)
 select tf.idfactura,tc.idcliente,min(tf.importe) as 'Importe' 
 from tfacturas tf, tclientes tc where tc.idcliente = tf.idcliente
 and tc.nombre='Casa Avellaner';
 
 -- Consultar los productos de las facturas de un cliente. (inner join 3 tablas)
 select f.idfactura,lf.idlineafactura,lf.cantidad,lf.precio,p.nombre,f.fechacobro
 from tfacturas as f 
 inner join tlineasfactura as lf on f.idfactura=lf.idfactura 
 inner join tproductos as p on lf.idproducto=p.idproducto
 where f.idcliente='345F';
 
 -- Actualizaciones
 
 -- Cambiar nombre cliente
 update tclientes
 SET NOMBRE = 'Black Smith'
 WHERE NOMBRE = 'Blacksmith';
 
 -- Acualizar la fecha de cobro cuando el Cliente paga sus tfacturas el mismo dia.
 update tfacturas
 SET fechaCobro = curdate()
 WHERE idCliente = '845Z';
 
 -- Actualizar importe tfacturas a un cliente para descontarle un 20%
 -- en todas sus tfacturas.
update tfacturas
SET importe = importe * 0.8
WHERE idCliente = '845Z';

-- Borrar producto por nombre. 
 delete from tproductos
 WHERE nombre = 'Cheers Cute Burguers';
 
 -- Borrar productos por idproducto. 
delete from tproductos
WHERE idproducto IN (1,4,5);

 -- Borrar un cliente del sistema.
 -- Como no hemos puesto ON DELETE CASCADE hay que borrar primero sus facturas.
delete from tfacturas
 WHERE idcliente = '845Z';
delete from tclientes
 WHERE idcliente = '845Z';
