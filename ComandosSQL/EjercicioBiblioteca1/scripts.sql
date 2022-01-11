CREATE DATABASE Biblioteca;
GO
USE Biblioteca;

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

CREATE TABLE Autor
(
	IdAutor VARCHAR(10) NOT NULL,
	Nombre VARCHAR(40) NOT NULL,
	Nacionalidad VARCHAR(40) DEFAULT 'Desconocida',

	CONSTRAINT PKAutor PRIMARY KEY(IdAutor),
);

CREATE TABLE Estudiante
(
	NroRegistro VARCHAR(10) NOT NULL,
	CI VARCHAR(20) NOT NULL,
	Nombre VARCHAR(40) NOT NULL,
	Direccion VARCHAR(40) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	Carrera VARCHAR(20) NOT NULL,
	Edad INT NOT NULL,

	CONSTRAINT PKEstudiante PRIMARY KEY( NroRegistro),
	CONSTRAINT CHKEdad CHECK (Edad >= 18)
);

CREATE TABLE Autoria
(
	IdAutor VARCHAR(10) NOT NULL,
	IdLibro VARCHAR(10) NOT NULL,

	CONSTRAINT PkAutoria PRIMARY KEY(IdAutor, IdLibro),
	CONSTRAINT FKAutor FOREIGN KEY(IdAutor) REFERENCES Autor,
	CONSTRAINT FKLibros FOREIGN KEY(IdLibro) REFERENCES Libro
);

CREATE TABLE Prestamo
(
	NroRegistro VARCHAR(10) not null,
	IdLibro VARCHAR(10) not null,
	FechaPrestamo DATE not null,
	FechaDebeDevolver DATE not null,
	FechaDevolucion DATE,

	CONSTRAINT PkPrestamo PRIMARY KEY(NroRegistro, IdLibro, FechaPrestamo),
	CONSTRAINT FKEstudiante FOREIGN KEY(NroRegistro) REFERENCES Estudiante,
	CONSTRAINT FKLibro FOREIGN KEY(IdLibro) REFERENCES Libro
);

INSERT INTO Autor
VALUES ('A1', 'Simon Fred', 'Espaniola');
INSERT INTO Autor
VALUES ('A2', 'Federico Vau', 'Italiana');
INSERT INTO Autor
VALUES ('A3', 'Leonardo Vincenti', 'Francesa');
INSERT INTO Autor
VALUES ('A4', 'Juan de las Casas', 'Espaniola');
INSERT INTO Autor
VALUES ('A5', 'Simon Bali', 'Argentina');
INSERT INTO Autor
VALUES ('A6', 'Stuart Russel', 'Inglesa');
INSERT INTO Autor
VALUES ('A7', 'Peter Norvig', 'Inglesa');

INSERT INTO Libro 
VALUES ('L1', 'Amanecer', 'Infragante', 'Alfaguara', 'Literatura' ,'1999', '300', '1 Edicion');
INSERT INTO Libro 
VALUES ('L2', 'Fracciones', 'Matematica Basica', 'Aguilar', 'Matematica', '1988', '400', '2 Edicion');
INSERT INTO Libro 
VALUES ('L3', 'Segmentos', 'Por la vida', 'Alba', 'Literatura', '1998', '150', '1 Edicion');
INSERT INTO Libro 
VALUES ('L4', 'Crepusculo', 'Amanecer','Little', 'Literatura', '2000', '200', '3 Edicion');
INSERT INTO Libro 
VALUES ('L5', 'Ecuaciones', 'Algebra', 'Basic', 'Matematica', '1999', '150', '1 Edicion');
INSERT INTO Libro 
VALUES ('L6', 'Artificial Intelligence', 'A modern Approach', 'Pearson', 'IA', '2010', '1115', '3 Edicion');

INSERT INTO Estudiante
VALUES ('2019116341', '6303655', 'Miguel Tapia', 'Barrio Las Misiones', '75007873', 'Industrial', '20');
INSERT INTO Estudiante
VALUES ('2019112523', '6087958', 'Victor Arellano', 'Barrio Equipetrol', '70879637', 'Industrial', '19');
INSERT INTO Estudiante
VALUES ('2019110518', '6589637', 'Sebastian Ferrufino', 'Barrio Hamacas', '77859637', 'Industrial', '20');
INSERT INTO Estudiante
VALUES ('2019110875', '58963852', 'Gean Valverde', 'Barrio Palmito', '78596398', 'Sistemas', '21');
INSERT INTO Estudiante
VALUES ('2019118796', '47895263', 'Enrique Nunez', 'Barrio Hamacas', '75896348', 'Medicina', '22');
INSERT INTO Estudiante
VALUES ('2019112027', '3888186', 'Jose Hurtado', 'Norte La Molina', '78528705', 'Sistemas', '46');

INSERT INTO Autoria
VALUES ('A1', 'L3');
INSERT INTO Autoria
VALUES ('A2', 'L2');
INSERT INTO Autoria
VALUES ('A3', 'L2');
INSERT INTO Autoria
VALUES ('A4', 'L5');
INSERT INTO Autoria
VALUES ('A5', 'L1');
INSERT INTO Autoria
VALUES ('A6', 'L6');
INSERT INTO Autoria
VALUES ('A7', 'L6');

INSERT INTO Prestamo
VALUES ('2019116341', 'L2','2001-08-03', '2001-08-07', '2001-08-06');
INSERT INTO Prestamo
VALUES ('2019112523', 'L3','2001-09-10', '2001-08-16', '2001-08-14');
INSERT INTO Prestamo
VALUES ('2019118796', 'L5','2001-08-03', '2001-08-07', '2001-08-06');
INSERT INTO Prestamo
VALUES ('2019116341', 'L1','2001-05-01', '2001-05-24', '2001-05-28');
INSERT INTO Prestamo
VALUES ('2019110875', 'L4','2001-10-06', '2001-10-19', '2001-10-18');
INSERT INTO Prestamo
VALUES ('2019112027', 'L6','2001-10-06', '2001-10-19','2001-10-18');
INSERT INTO Prestamo(NroRegistro, IdLibro, fechaPrestamo, FechaDebeDevolver)
VALUES ('2019118796', 'L4','2001-10-06', '2001-10-19');
INSERT INTO Prestamo(NroRegistro, IdLibro, fechaPrestamo, FechaDebeDevolver)
VALUES ('2019118796', 'L1','2001-10-06', '2001-10-19');
