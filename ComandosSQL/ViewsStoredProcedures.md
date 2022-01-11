# VIEWS, STORED PROCEDURES

### VIEWS
Para crear una vista que muestre la lista de libros con sus autores que sean ingleses:
``` SQL
CREATE VIEW ViewLibrosAutoresIngleses AS 
SELECT Libro.Titulo, Autor.Nombre, Autor.Nacionalidad
FROM Autoria
INNER JOIN Libro ON Libro.IdLibro = Autoria.IdLibro
INNER JOIN Autor ON Autor.IdAutor = Autoria.IdAutor
WHERE Autor.Nacionalidad = 'Inglesa';

GO
SELECT * FROM ViewLibrosAutoresIngleses;
```
Para modificar la vista:
``` SQL
ALTER VIEW ViewLibrosAutoresIngleses AS 
SELECT Libro.Titulo, Libro.Subtitulo, Autor.Nombre, Autor.Nacionalidad
FROM Autoria
INNER JOIN Libro ON Libro.IdLibro = Autoria.IdLibro
INNER JOIN Autor ON Autor.IdAutor = Autoria.IdAutor
WHERE Autor.Nacionalidad = 'Inglesa';
```
Para eliminar la vista:
``` SQL
DROP VIEW ViewLibrosAutoresIngleses;
```

### STORED PROCEDURES
Para crear un procedimiento almacenado que muestre un saludo según el nombre ingresado:
``` SQL
CREATE PROCEDURE HolaMundo
@Nombre VARCHAR(40)
AS
PRINT 'Hola, soy ' + @Nombre;

GO
EXEC HolaMundo 'Joso';
```
Para crear uno que tenga parámetros de salida, cantidad de registros en libro:
``` SQL
CREATE PROCEDURE CantidadLibros
@Count INT OUTPUT
AS 
SELECT @Count = COUNT(*) FROM Libro;

GO
DECLARE @Cant INT;
EXEC CantidadLibros
	@Count = @Cant OUTPUT;
  
SELECT @Cant AS CantLibros; 
```
Para modificar el anterior y que retorne la cantidad:
``` SQL
ALTER PROCEDURE CantidadLibros
AS
DECLARE @Count AS INT;
SELECT @Count = COUNT(*) FROM Libro;
RETURN @Count;

GO
DECLARE @Cant INT;
EXEC @Cant = CantidadLibros

SELECT @Cant AS CantLibros; 
```
