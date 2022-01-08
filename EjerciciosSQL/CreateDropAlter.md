# CREATE, DROP, ALTER

### CREATE
Para crear una Base de Datos `Biblioteca`:
``` SQL
CREATE DATABASE Biblioteca;
```
Para seleccionar la Base de Datos en la que vamos a trabajar:
``` SQL
USE Biblioteca;
```
Para crear una tabla `Libro` con sus respectivos atributos:
``` SQL
CREATE TABLE Libro
(
	IdLibro VARCHAR(10) NOT NULL,
	Titulo VARCHAR(40) NOT NULL,
	SubTitulo VARCHAR(40),
	Editorial VARCHAR(40) NOT NULL,
	Area VARCHAR(30) NOT NULL,
	AnioPublicacion CHAR(4) NOT NULL,
	TotalPaginas INT NOT NULL,
	Edicion VARCHAR(10) NOT NULL,
  
	CONSTRAINT PKLibro PRIMARY KEY(IdLibro)
);
```
#### Sobre los Tipos de datos 
| Tipo de dato | Descripción |
| --- | --- |
| `BIT`| Para booleanos 0, 1 o NULL |
| `INT`| Para números enteros |
| `REAL`| Para número con decimales |
| `DATE`| Para fechas |
| `DATETIME`| Para fechas y horas |
| `CHAR(N)`| Para texto con caracteres fijos |
| `VARCHAR(N)`| Para texto con caracteres dinámicos |
##### Más información: [Data Types](https://docs.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver15)

#### Sobre Restricciones (Constraints)
| Restricción | Descripción |
| --- | --- |
| `NOT NULL`| Para que no acepte valores vacios o NULL |
| `UNIQUE`| Para que solo acepte valores únicos |
| `PRIMARY KEY`| Para que sea el identificador único de cada fila |
| `FOREIGN KEY`| Para hacer referencia al identificador de otra tabla |
| `CHECK`| Para asegurar que un valor cumpla una condición |
| `DEFAULT`| Para establecer un valor predeterminado de un valor |
##### Más información: [SQL Constraints](https://www.w3schools.com/sql/sql_constraints.asp)

### DROP
Para eliminar la Base de Datos `Biblioteca`:
``` SQL
USE master;
DROP DATABASE Biblioteca;
```
Para eliminar la tabla `Libro`:
``` SQL
DROP TABLE Libro;
```

### ALTER
Para agregar una columna `Autor` en la tabla `Libro`:
``` SQL
ALTER TABLE Libro
ADD Autor VARCHAR(40) NOT NULL;
```
Para modificar la columna `Autor` de la tabla `Libro`:
``` SQL
ALTER TABLE Libro
ALTER COLUMN Autor TEXT;
```
Para eliminar la columna `Autor` de la tabla `Libro`:
``` SQL
ALTER TABLE Libro
DROP COLUMN Autor;
```
