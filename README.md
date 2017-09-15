## ejemplos-sql

Ejemplos de creación, consultas y operaciones en bases de datos, listos para ser cargados en scripts SQL.

### sql_facturas_simple.sql

Simple modelo de facturación con 2 tablas; clientes y facturas. Un cliente puede tener n facturas. 

### sql_facturas_completo.sql

Modelo de facturación más completo. Con 4 tablas; clientes, facturas, linea de factura y productos.

En este caso, consideramos las siguientes relaciones: 
* 1 cliente N tfacturas 
* 1 factura N lineas factura
* 1 producto puede estar en N lineas factura.

Como recursos de referencia he usado:

http://www.hermosaprogramacion.com/2014/07/sistema-facturacion-base-datos/

http://basededatos.umh.es/ejercicios/facturacion/ejercicio.htm

https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all


### ejemplos_springjdbc.sql
Estos ejemplos sirven para inicializar la base de datos MySQL que vamos a manejar con ejemplos de [Java JDBC](https://github.com/mamorosdev/ejemplos-java) y [Spring JDBC](https://github.com/mamorosdev/proyectos-spring).

### quienesquien2.sql
Ejemplos de consultas de porcentajes.
