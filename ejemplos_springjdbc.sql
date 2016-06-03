USE examples;

DROP TABLE IF EXISTS `trabajadores`;
-- Ejemplo Spring JDBC.
CREATE TABLE `trabajadores` (
`id` varchar(20) NOT NULL,
`nombre` varchar(20) NOT NULL,
`departamento` varchar(20) NOT NULL DEFAULT 'No Asignado',
`numero_trabajador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`numero_trabajador`) USING BTREE,
UNIQUE KEY `Index_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `idcategoria` int(11) NOT NULL,
  `precio` float DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcategoria` (`idcategoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE accounts (
id_account varchar(20) NOT NULL,
id_client varchar(20) NOT NULL,
money double(10) NOT NULL,
PRIMARY KEY (`id_account`)
);

insert into accounts (id_account,id_client,money) values 
	('A1','BANK',15680340.00),('A101','ONG',24520.50),
	('A201','Laura Soler',2367.20),('A257','Enrique Martinez',520.00),
	('A510','Ayuntamiento1',-14520.50);
-- CREATE TABLE `atms` (
-- `id_atm` varchar(20) NOT NULL,
-- `money` int(10) NOT NULL,
-- PRIMARY KEY (`id_atm`)SELECTSELECT
-- );

-- START TRANSACTION;
-- SELECT @a:=money FROM accounts where id_account="A201444" and money > 300.00;
-- UPDATE accounts SET money=money-300.0 WHERE id_account="A201444";
-- COMMIT

-- Laura transfiere 300 euros a ONG.
-- Para que se pueda hacer la transacción de forma segura, A.C.I.D.; hay que 
-- encapuslar estas 4 operaciones. Aún no sé como hacerlo sin usar un 
-- procedimiento almacenado; así que lo he hecho en JDBC.

-- P1 Comprobar si existe nuestra cuenta y hay saldo en nuestra cuenta.
select money from accounts where id_account="A201" and money > 300.00;
-- P2 Comprobar los datos de la cuenta del receptor (que existe y puede recibir dinero, etc...).
select * from accounts where id_account="A101";
-- P3 Retirar el dinero de nuestra cuenta
update accounts set money=money-300.0 where id_account="A201";
-- P4 Ingresar el dinero en la cuenta del receptor.
update accounts set money=money+300.0 where id_account="A101";
