# Ejercicio Biblioteca - Parte 2 (Consultas)
1. Generar un listado de los libros existentes en la biblioteca, ordenados por titulo y año de publicación.</br>
``` SQL 
SELECT * FROM Libro
ORDER BY Titulo, AnioPublicacion;
```
2. Generar un listado de los autores registrados, y los libros de los que son autores, ordenados por área, autor y año de publicación.</br>
``` SQL 
SELECT Autor.Nombre, Libro.Titulo, Libro.Area, Libro.AnioPublicacion 
FROM Autoria
INNER JOIN Autor ON Autor.IdAutor = Autoria.IdAutor
INNER JOIN Libro ON Libro.IdLibro = Autoria.IdLibro
ORDER BY Libro.Area, Autor.Nombre, Libro.AnioPublicacion;
```
3. Listar los libros que actualmente se encuentran prestados, y los estudiantes que los tienen en préstamo.</br>
``` SQL
SELECT Libro.Titulo, Estudiante.Nombre
FROM Prestamo
INNER JOIN Libro ON Libro.IdLibro = Prestamo.IdLibro
INNER JOIN Estudiante ON Estudiante.NroRegistro = Prestamo.NroRegistro
WHERE FechaDevolucion is NULL;
```
4. Listar los préstamos que hayan incurrido en retrasos en la devolución de libros, y los estudiantes a los que corresponden, 
tanto en prestamos que ya se haya devuelto, como en prestamos aún pendientes de devolución.</br>

- Opción 1:</br>
``` SQL
SELECT Libro.Titulo, Estudiante.Nombre, FechaDebeDevolver, FechaDevolucion
FROM Prestamo
INNER JOIN Libro ON Libro.IdLibro = Prestamo.IdLibro
INNER JOIN Estudiante ON Estudiante.NroRegistro = Prestamo.NroRegistro
WHERE FechaDevolucion > FechaDebeDevolver OR 
	GETDATE() > FechaDebeDevolver AND FechaDevolucion is NULL;
```
- Opción 2:</br>
``` SQL
SELECT Libro.Titulo, Estudiante.Nombre, FechaDebeDevolver, FechaDevolucion
FROM Prestamo, Estudiante, Libro
WHERE Libro.IdLibro = Prestamo.IdLibro AND
	Estudiante.NroRegistro = Prestamo.NroRegistro AND
	(FechaDevolucion > FechaDebeDevolver OR 
		GETDATE() > FechaDebeDevolver AND FechaDevolucion is NULL);
```
5. Listar los libros y sus autores, que han sido prestados por estudiantes de Ingenieria de Sistemas, siempre que los libros tengan solo un autor, o que sean de autores de nacionalidad francesa.</br>
``` SQL
SELECT Libro.Titulo, Autor.Nombre, Autor.Nacionalidad, Estudiante.Nombre, Estudiante.Carrera
FROM Libro
INNER JOIN Autoria ON Autoria.IdLibro = Libro.IdLibro
INNER JOIN Autor ON Autor.IdAutor = Autoria.IdAutor
INNER JOIN Prestamo ON Prestamo.IdLibro = Libro.IdLibro
INNER JOIN Estudiante ON Estudiante.NroRegistro = Prestamo.NroRegistro
WHERE Autor.IdAutor IN (
	SELECT IdAutor FROM Autor
	WHERE Autor.Nacionalidad = 'Francesa') AND
		Estudiante.NroRegistro IN (
			SELECT Estudiante.NroRegistro FROM Estudiante
			WHERE Carrera = 'Sistemas')
UNION
SELECT Libro.Titulo, Autor.Nombre, Autor.Nacionalidad, Estudiante.Nombre, Estudiante.Carrera
FROM Libro
INNER JOIN Autoria ON Autoria.IdLibro = Libro.IdLibro
INNER JOIN Autor ON Autor.IdAutor = Autoria.IdAutor
INNER JOIN Prestamo ON Prestamo.IdLibro = Libro.IdLibro
INNER JOIN Estudiante ON Estudiante.NroRegistro = Prestamo.NroRegistro
WHERE Libro.IdLibro IN (
	SELECT Autoria.IdLibro FROM Autoria
	GROUP BY Autoria.IdLibro
	HAVING COUNT(Autoria.IdAutor) = 1);
```
6. Generar un listado de estudiantes ordenado por carrera y nombre.</br>
``` SQL
SELECT Nombre, Carrera FROM Estudiante
ORDER BY Carrera, Nombre;
```
Complemente con un listado de cantidad de estudiantes por carrera.</br>
``` SQL
SELECT Carrera, COUNT(*) AS CantidadEstudiantes 
FROM Estudiante
GROUP BY Carrera;
```
8. Generar un listado de la cantidad de libros regitrados por editorial.</br>
``` SQL
SELECT Editorial, COUNT(*) AS CantidadLibros 
FROM Libro
GROUP BY Editorial;
```
Generar un listado de la cantidad de libros regitrados por año de publicación.</br>
``` SQL
SELECT AnioPublicacion, COUNT(*) AS CantidadLibros
FROM Libro
GROUP BY AnioPublicacion;
```
