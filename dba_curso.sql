


##CREATE USER 'admin02'@'localhost' IDENTIFIED BY 'admin02';
##GRANT ALL PRIVILEGES ON *.* TO 'admin02'@'localhost' WITH GRANT OPTION;

## Usuario "normal"
CREATE USER 'user02'@'localhost' IDENTIFIED BY 'user02';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES,
LOCK TABLES, EXECUTE ON *.* TO 'user02'@'localhost';

## Usuarios de solo lectura
CREATE USER 'read02'@'localhost' identified BY 'read02';
GRANT SELECT, EXECUTE ON *.* TO 'read02'@'localhost';

## Usuarios para hacer back-ups
CREATE USER 'back02'@'localhost' IDENTIFIED BY 'back02';
GRANT SELECT, RELOAD, LOCK TABLES, REPLICATION CLIENT ON 
*.* TO 'back02'@'localhost' ;

## Crea un admin genérico que puede ingresar desde cualquier lado, no solo desde el localhost
CREATE USER 'admingeneric02'@'%' IDENTIFIED BY 'admingeneric02';
GRANT ALL PRIVILEGES ON *.* TO 'admingeneric02'@'%' WITH GRANT OPTION;

## Crea el usuario 4 y limita sus acciones a la base de datos libros_prestamos
CREATE USER 'user04'@'%' IDENTIFIED BY 'user04';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES,
LOCK TABLES, EXECUTE ON libros_prestamos.* TO 'user04'@'%';

## Le otorgan privilegios al usuario user05 para insertar, actualizar, excluir y consultar la tabla de remitos, pero solamente le permite el privilegio de lectura a la tabla tabla_de_bibliotecas.
CREATE USER 'user05'@'%' IDENTIFIED BY 'user05';
GRANT SELECT, INSERT, UPDATE, DELETE ON libros_prestamos.remitos TO 'user05'@'%';
GRANT SELECT ON libros_prestamos.tabla_de_bibliotecas TO 'user05'@'%';

## Verifica los usuarios existentes
SELECT * FROM mysql.user;

## Muestra los accesos de un usuario
SHOW GRANTS FOR 'user02'@'localhost';

## El comando REVOKE ALL retira los privilegios de acceso del usuario especificado:
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user02'@'localhost';

