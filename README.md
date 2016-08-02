## ejemplos-sql
Ejemplos de creación, consultas y operaciones en bases de datos, listos para ser cargados en scripts SQL.

### sql_facturas_simple.sql
Simple modelo de facturación con 2 tablas; clientes y facturas. Un cliente puede tener n facturas. 
Ejemplos de consultas y operaciones CRUD ideales para principiantes en SQL.

### sql_facturas_completo.sql

Modelo de facturación más completo con 4 tablas; clientes, facturas, linea de factura y productos.
En este caso, consideramos las siguientes relaciones: 1 cliente N tfacturas, 1 factura N lineas factura y 1 producto puede estar en N lineas factura.

Las consultas y operaciones que hay en este ejemplo son más profesionales. Introduczco ejemplos de join.

Como recursos de referencia he usado:
http://www.hermosaprogramacion.com/2014/07/sistema-facturacion-base-datos/
http://basededatos.umh.es/ejercicios/facturacion/ejercicio.htm

### sql_parejas.sql
Este es un ejemplo más original y divertido. Parejas es un ejemplo muy típico de relación reflexiva entre dos elementos de una misma tabla (dos elementos de la tabla persona). Contiene ejemplos interesantes de porcentajes y subconsulta.

### ejemplos_springjdbc.sql
Estos ejemplos sirven para inicializar la base de datos MySQL que vamos a manejar con ejemplos de [Java JDBC](https://github.com/mamorosdev/ejemplos-java) y [Spring JDBC](https://github.com/mamorosdev/proyectos-spring).

### proyecto_conciertos.sql
Es probable (pero no seguro), que próximamente amplie esta base de datos para desarrollar un proyecto personal.
Por ahora, sólo contiene una tabla de conciertos.

### quienesquien2.sql
Otro proyecto personal que probablemente desarrollaré algún dia; el juego de quien es quien. 
Por ahora sólo tiene una tabla de personas y consultas de porcentajes.
