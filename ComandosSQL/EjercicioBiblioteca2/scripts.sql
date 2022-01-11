-- Generar un listado de los libros existentes en la biblioteca, ordenados por titulo y año de publicación.
SELECT * FROM Libro
ORDER BY Titulo, AnioPublicacion;

-- Generar un listado de los autores registrados, y los libros de los que son autores, ordenados por área, autor y año de publicación.
SELECT Autor.Nombre, Libro.Titulo, Libro.Area, Libro.AnioPublicacion 
FROM Autoria
INNER JOIN Autor ON Autor.IdAutor = Autoria.IdAutor
INNER JOIN Libro ON Libro.IdLibro = Autoria.IdLibro
ORDER BY Libro.Area, Autor.Nombre, Libro.AnioPublicacion;

-- Listar los libros que actualmente se encuentran prestados, y los estudiantes que los tienen en préstamo.
SELECT Libro.Titulo, Estudiante.Nombre
FROM Prestamo
INNER JOIN Libro ON Libro.IdLibro = Prestamo.IdLibro
INNER JOIN Estudiante ON Estudiante.NroRegistro = Prestamo.NroRegistro
WHERE FechaDevolucion is NULL;

-- Listar los préstamos que hayan incurrido en retrasos en la devolución de libros, y los estudiantes a los que corresponden, tanto en prestamos que ya se haya devuelto, como en prestamos aún pendientes de devolución.
-- Opcion 1
SELECT Libro.Titulo, Estudiante.Nombre, FechaDebeDevolver, FechaDevolucion
FROM Prestamo
INNER JOIN Libro ON Libro.IdLibro = Prestamo.IdLibro
INNER JOIN Estudiante ON Estudiante.NroRegistro = Prestamo.NroRegistro
WHERE FechaDevolucion > FechaDebeDevolver OR 
	GETDATE() > FechaDebeDevolver AND FechaDevolucion is NULL;
-- Opcion 2
SELECT Libro.Titulo, Estudiante.Nombre, FechaDebeDevolver, FechaDevolucion
FROM Prestamo, Estudiante, Libro
WHERE Libro.IdLibro = Prestamo.IdLibro AND
	Estudiante.NroRegistro = Prestamo.NroRegistro AND
	(FechaDevolucion > FechaDebeDevolver OR 
		GETDATE() > FechaDebeDevolver AND FechaDevolucion is NULL);
    

-- Listar los libros y sus autores, que han sido prestados por estudiantes de Ingenieria de Sistemas, siempre que los libros tengan solo un autor, o que sean de autores de nacionalidad francesa.
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
  
-- Generar un listado de estudiantes ordenado por carrera y nombre.
SELECT Nombre, Carrera FROM Estudiante
ORDER BY Carrera, Nombre;
-- Complemente con un listado de cantidad de estudiantes por carrera.
SELECT Carrera, COUNT(*) AS CantidadEstudiantes 
FROM Estudiante
GROUP BY Carrera;

-- Generar un listado de la cantidad de libros regitrados por editorial.
SELECT Editorial, COUNT(*) AS CantidadLibros 
FROM Libro
GROUP BY Editorial;
-- Generar un listado de la cantidad de libros regitrados por año de publicación.
SELECT AnioPublicacion, COUNT(*) AS CantidadLibros
FROM Libro
GROUP BY AnioPublicacion;
