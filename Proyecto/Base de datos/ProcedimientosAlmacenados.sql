-- Verificar existencia de un Libro por Id
CREATE   PROCEDURE ExisteLibro
@IdLibro VARCHAR(10)
AS 
BEGIN
	DECLARE @Existe BIT
	SET @Existe = 0

	IF EXISTS (SELECT IdLibro FROM Libro 
	WHERE IdLibro = @IdLibro)
		SET @Existe = 1

	RETURN @Existe
END
GO

-- Obtener Libros
CREATE   PROCEDURE ObtenerLibros
AS 
BEGIN
	SELECT * FROM Libro
END
GO

-- Obtener Libro por Id
CREATE   PROCEDURE ObtenerLibroPorId
@IdLibro VARCHAR(10)
AS 
BEGIN
	SELECT * FROM Libro
	WHERE IdLibro = @IdLibro
END
GO

-- Registrar un nuevo Libro
CREATE   PROCEDURE RegistrarLibro
@IdLibro VARCHAR(10),
@Titulo VARCHAR(40),
@SubTitulo VARCHAR(40),
@Editorial VARCHAR(40),
@Area VARCHAR(30),
@AñoPublicacion VARCHAR(4),
@TotalPaginas INT,
@Edicion VARCHAR(10)
AS 
BEGIN
	DECLARE @Existe BIT;
	EXEC @Existe = ExisteLibro @IdLibro

	IF @Existe = 0
		INSERT INTO Libro
		VALUES (@IdLibro, @Titulo, @SubTitulo, @Editorial, @Area, @AñoPublicacion, @TotalPaginas, @Edicion)
END
GO

-- Actualizar un Libro
CREATE   PROCEDURE ActualizarLibro
@IdLibro VARCHAR(10),
@Titulo VARCHAR(40),
@SubTitulo VARCHAR(40),
@Editorial VARCHAR(40),
@Area VARCHAR(30),
@AñoPublicacion VARCHAR(4),
@TotalPaginas INT,
@Edicion VARCHAR(10)
AS 
BEGIN
	DECLARE @Existe BIT;
	EXEC @Existe = ExisteLibro @IdLibro

	IF @Existe = 1
		UPDATE Libro
		SET Titulo = @Titulo, SubTitulo = @SubTitulo, Editorial = @Editorial, Area = @Area,
			AnioPublicacion = @AñoPublicacion, TotalPaginas = @TotalPaginas, Edicion = @Edicion
		WHERE IdLibro = @IdLibro
END
GO

-- Eliminar un Libro por Id
CREATE   PROCEDURE EliminarLibro
@IdLibro VARCHAR(10)
AS 
BEGIN
	DECLARE @Existe BIT;
	EXEC @Existe = ExisteLibro @IdLibro

	IF @Existe = 1
		DELETE FROM Libro WHERE IdLibro = @IdLibro
END
GO

-- Verificar la existencia de un Autor por Id
CREATE   PROCEDURE ExisteAutor
@IdAutor VARCHAR(10)
AS 
BEGIN
	DECLARE @Existe BIT
	SET @Existe = 0

	IF EXISTS (SELECT IdAutor FROM Autor 
	WHERE IdAutor = @IdAutor)
		SET @Existe = 1

	RETURN @Existe
END
GO

-- Obtener Autores
CREATE   PROCEDURE ObtenerAutores
AS 
BEGIN
	SELECT * FROM Autor
END
GO

-- Obtener Autor por Id
CREATE   PROCEDURE ObtenerAutorPorId
@IdAutor VARCHAR(10)
AS 
BEGIN
	SELECT * FROM Autor
	WHERE IdAutor = @IdAutor
END
GO

-- Registrar un nuevo Autor
CREATE   PROCEDURE RegistrarAutor
@IdAutor VARCHAR(10),
@Nombre VARCHAR(40),
@Nacionalidad VARCHAR(40)
AS 
BEGIN
	DECLARE @Existe BIT;
	EXEC @Existe = ExisteAutor @IdAutor

	IF @Existe = 0
		INSERT INTO Autor
		VALUES (@IdAutor, @Nombre, @Nacionalidad)
END
GO

-- Actualizar un Autor
CREATE   PROCEDURE ActualizarAutor
@IdAutor VARCHAR(10),
@Nombre VARCHAR(40),
@Nacionalidad VARCHAR(40)
AS 
BEGIN
	DECLARE @Existe BIT;
	EXEC @Existe = ExisteAutor @IdAutor

	IF @Existe = 1
		UPDATE Autor
		SET Nombre = @Nombre, Nacionalidad = @Nacionalidad
		WHERE IdAutor = @IdAutor
END
GO

-- Eliminar un Autor por Id
CREATE   PROCEDURE EliminarAutor
@IdAutor VARCHAR(10)
AS 
BEGIN
	DECLARE @Existe BIT;`
	EXEC @Existe = ExisteAutor @IdAutor

	IF @Existe = 1
		DELETE FROM Autor WHERE IdAutor = @IdAutor
END
GO

-- Verificar la existencia de una Autoria por Ids
CREATE   PROCEDURE ExisteAutoria
@IdAutor VARCHAR(10),
@IdLibro VARCHAR(10)
AS 
BEGIN
	DECLARE @Existe BIT
	SET @Existe = 0

	IF EXISTS (SELECT IdAutor FROM Autoria 
	WHERE IdAutor = @IdAutor AND IdLibro = @IdLibro)
		SET @Existe = 1

	RETURN @Existe
END

-- Obtener Autorias
CREATE   PROCEDURE ObtenerAutorias
AS 
BEGIN
	SELECT Autoria.IdAutor, Autoria.IdLibro FROM Autoria
	INNER JOIN Autor ON Autor.IdAutor = Autoria.IdAutor
	INNER JOIN Libro ON Libro.IdLibro = Autoria.IdLibro
END
GO

-- Obtener Autorias con nombres
CREATE   PROCEDURE ObtenerAutoriasNombres
AS 
BEGIN
	SELECT Autoria.IdAutor, Autor.Nombre, Autoria.IdLibro, Libro.Titulo FROM Autoria
	INNER JOIN Autor ON Autor.IdAutor = Autoria.IdAutor
	INNER JOIN Libro ON Libro.IdLibro = Autoria.IdLibro
END
GO

-- Registrar una nueva Autoria
CREATE   PROCEDURE RegistrarAutoria
@IdAutor VARCHAR(10),
@IdLibro VARCHAR(10)
AS 
BEGIN
	DECLARE @ExisteAutor BIT;
	EXEC @ExisteAutor = ExisteAutor @IdAutor

	DECLARE @ExisteLibro BIT;
	EXEC @ExisteLibro = ExisteLibro @IdLibro

	DECLARE @Existe BIT;
	EXEC @Existe = ExisteAutoria @IdAutor, @IdLibro
	IF @Existe = 0 AND @ExisteAutor = 1 AND @ExisteLibro = 1
		INSERT INTO Autoria
		VALUES (@IdAutor, @IdLibro)
END
GO

-- Eliminar una Autoria por Ids
CREATE   PROCEDURE EliminarAutoria
@IdAutor VARCHAR(10),
@IdLibro VARCHAR(10)
AS 
BEGIN
	DECLARE @Existe BIT;
	EXEC @Existe = ExisteAutoria @IdAutor, @IdLibro

	IF @Existe = 1
		DELETE Autoria
		WHERE IdAutor = @IdAutor AND IdLibro = @IdLibro
END
GO