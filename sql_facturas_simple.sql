-- Ejemplo facturas.
-- 2 tablas, relación 1 cliente n facturas.
-- Fuentes relacionadas, más completas:
-- http://www.hermosaprogramacion.com/2014/07/sistema-facturacion-base-datos/
-- http://basededatos.umh.es/ejercicios/facturacion/ejercicio.htm

CREATE DATABASE IF NOT EXISTS facturacion;
USE facturacion;

DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
	idcliente VARCHAR(10) NOT NULL DEFAULT '',
	nombre VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (idcliente)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;
 
DROP TABLE IF EXISTS facturas;
 CREATE TABLE facturas (
	idfactura INT(11) NOT NULL,
	idcliente VARCHAR(10) NOT NULL,
	fechacobro TIMESTAMP NULL DEFAULT NULL,
	importe FLOAT NULL DEFAULT NULL,
	PRIMARY KEY (idfactura,idcliente),
	CONSTRAINT idcliente_fk FOREIGN KEY (idcliente) REFERENCES clientes (idcliente) ON UPDATE CASCADE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

INSERT INTO clientes (idcliente,nombre) VALUES 
 ('345F','Electrocity'),
 ('845Z','Bazaar del mar');
INSERT INTO clientes (idcliente,nombre) VALUES 
 ('603P','Phonehome'),
 ('142B','Blacksmith');

INSERT INTO facturas (idfactura,idcliente,importe) VALUES 
 (101,'345F',22.25),
 (102,'845Z',44.00),
 (103,'345F',7.50);
 
 INSERT INTO facturas (idfactura,idcliente,fechacobro,importe) VALUES 
 (104,'603P','20160306',8.90),
 (105,'603P','20160401',24.20);
 
 -- Consultas
 
 -- Lista clientes
 select * from clientes;
 
  -- Nombre y precio productos más baratos de 1.5
 select nombre,preciouni from tproductos where preciouni<=1.50;
 
  -- id y Nombre productos sin stock
select nombre,preciouni from tproductos where stock=0;
 
 -- Lista clientes cuyo nombre empieza por E.
  select * from clientes 
  where nombre LIKE 'E%';
  
 -- Lista facturas de un cliente a partir de un codigo.
 select c.idcliente,c.nombre,f.idfactura,f.fechacobro,f.importe 
 from clientes as c, facturas as f
 where c.idcliente=f.idcliente 
 and c.idcliente='345F';
 
 -- Lista de clientes que no han pagado facturas; es decir,
 -- que la fecha de cobro de sus facturas no se ha definido.
  select idFactura,idCliente,importe from facturas 
  where fechacobro IS NULL;
   
 -- Facturas ordenadas por precio de menor a mayor.
  select idFactura,idCliente,importe from facturas
  order by importe;
  
 -- Datos factura más cara.
 select idFactura,idCliente,max(importe) as 'Importe' from facturas;
 
 -- Facturas cobradas en el año 2015.
 select * from facturas
 where fechaCobro > '2014-12-31' 
 and fechaCobro < '2016-01-01';
 
 -- Actualizaciones
 
 -- Cambiar nombre cliente
 update clientes
 SET NOMBRE = 'Black Smith'
 WHERE NOMBRE = 'Blacksmith';
 
 -- Acualizar la fecha de cobro cuando el Cliente paga sus facturas el mismo dia.
 update facturas
 SET fechaCobro = curdate()
 WHERE idCliente = '845Z';
 
 -- Actualizar importe facturas a un cliente para descontarle un 20%
 -- en todas sus facturas.
  update facturas
 SET importe = importe * 0.8
 WHERE idCliente = '845Z';
 
-- Borrar un cliente del sistema.
delete from tclientes
WHERE idcliente = '845Z';

-- Borrar todos los clientes.
delete from tclientes;
