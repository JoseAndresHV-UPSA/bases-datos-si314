# CONSTRAINTS

### PRIMARY KEY
Para establecer la llave primaria `IdAutor` en la tabla `Autor`:
``` SQL
CREATE TABLE Autor
(
	IdAutor VARCHAR(10) NOT NULL,
	Nombre VARCHAR(40) NOT NULL,
	Nacionalidad VARCHAR(40) NOT NULL,

	CONSTRAINT PKAutor PRIMARY KEY(IdAutor)
);
```
Para eliminar la restricción de llave primaria `PKAutor`:
``` SQL 
ALTER TABLE Autor
DROP CONSTRAINT PKAutor;
```
Para agregar una llave primaria a la tabla existente `Autor`:
``` SQL
ALTER TABLE Autor
ADD CONSTRAINT PKAutor PRIMARY KEY (IdAutor);
```

### FOREIGN KEY
Para establecer las llaves foráneas `IdAutor` e `IdLibro` en la tabla `Autoria`:
``` SQL
CREATE TABLE Autoria
(
	IdAutor VARCHAR(10) NOT NULL,
	IdLibro VARCHAR(10) NOT NULL,

	CONSTRAINT PkAutoria PRIMARY KEY(IdAutor,IdLibro),
	CONSTRAINT FKAutor FOREIGN KEY(IdAutor) REFERENCES Autor,
	CONSTRAINT FKLibros FOREIGN KEY(IdLibro) REFERENCES Libro,
);
```
Para eliminar la restricción de llave foránea `FKAutor`:
``` SQL
ALTER TABLE Autoria
DROP CONSTRAINT FKAutor;
```
Para agregar una llave foránea a la tabla existente `Autoria`:
``` SQL
ALTER TABLE Autoria
ADD CONSTRAINT FKAutor 
FOREIGN KEY(IdAutor) REFERENCES Autor;
```

### CHECK Y DEFAULT
Para crear una tabla `Estudiante` y establecer una restricción que verifique `Edad` >= 18:
``` SQL
CREATE TABLE Estudiante
(
	NroRegistro VARCHAR(10) NOT NULL,
	CI VARCHAR(20) NOT NULL,
	Nombre VARCHAR(40) NOT NULL,
	Direccion VARCHAR(40) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	Carrera VARCHAR(20),
	Edad INT NOT NULL,

	CONSTRAINT PKEstudiante PRIMARY KEY( NroRegistro),
	CONSTRAINT CHKEdad CHECK (Edad >= 18)
);
```
Para agregar una restricción donde el valor por defecto de `Carrera` sea 'Sistemas':
``` SQL
ALTER TABLE Estudiante
ADD CONSTRAINT DFCarrera
DEFAULT 'Sistemas' FOR Carrera;
```
