-- Ejemplo simplificado de gestión de facturas.
-- 2 tablas, relación 1 cliente n facturas.

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
	fechacobro FLOAT NULL DEFAULT NULL,
	importe FLOAT NULL DEFAULT NULL,
	PRIMARY KEY (idfactura,idcliente),
	CONSTRAINT pedidos_ibfk_1 FOREIGN KEY (idcliente) REFERENCES clientes (idcliente) ON UPDATE CASCADE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

INSERT INTO clientes (idcliente,nombre) VALUES 
 ('345F','Electrocity'),
 ('845Z','Bazaar del mar');

INSERT INTO facturas (idfactura,idcliente,importe) VALUES 
 (101,'345F',22.25),
 (102,'845Z',44.00),
 (103,'345F',7.50);
 
 -- Consultas
 -- Lista clientes
 select * from clientes;
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
 
 -- Próximamente
 -- Facturas cobradas en 2015.
 
 -- Actualizaciones
 -- Cambiar nombre cliente
 -- Cliente paga factura
 -- Descontar importe facturas a un cliente el 20%.
 