# CREATE, DROP, ALTER

### CREATE
Para crear una Base de Datos llamada `Biblioteca`:
``` SQL
CREATE DATABASE Biblioteca
```
Para seleccionar la Base de Datos en la que vamos a trabajar:
``` SQL
USE Biblioteca
```
Para crear un tabla llamada `Libro` con los sus respectivos atributos:
``` SQL
CREATE TABLE Libros
(
	IdLibro CHAR(10) NOT NULL,
	Titulo VARCHAR(40) NOT NULL,
	SubTitulo VARCHAR(40),
	Editorial VARCHAR(40) NOT NULL,
	Area VARCHAR(30) NOT NULL,
	AnioPublicacion CHAR(10) NOT NULL,
	TotalPaginas INT NOT NULL,
	Edicion VARCHAR(10) NOT NULL,
  
	CONSTRAINT PKLibro PRIMARY KEY(IdLibro)
)
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
