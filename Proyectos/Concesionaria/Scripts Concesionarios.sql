create database Concesionariosc2021
go
use  Concesionariosc2021
go
CREATE TABLE Concesionarios(
	NITC nchar(15) NOT NULL,
	Nombre varchar(50) NOT NULL,
	Direccion varchar(50) NOT NULL,
	Telefono varchar(15) not null,
	PagWeb varchar(30) not null,
	email varchar(30) not null,
	casilla char(5) not null,
 CONSTRAINT PK_Concesionario PRIMARY KEY (NITC)
);

CREATE TABLE ServicioOf(
	NITSO nchar(15) NOT NULL,
	Nombre varchar(50) NOT NULL,
	Direccion varchar(50) NOT NULL,
	Telefono varchar(15) not null,
	PagWeb varchar(30) not null,
	email varchar(30) not null,
	casilla char(5) not null,
	NITC nchar(15) NOT NULL,
 CONSTRAINT PK_ServicioOf PRIMARY KEY (NITSO), 
 CONSTRAINT FK_ServicioOf_Concesionarios FOREIGN KEY(NITC) REFERENCES Concesionarios (NITC)
);

CREATE TABLE Modelos(
	CodModelo char(10) NOT NULL,
	Marca char(20) NOT NULL,
	Modelo varchar(30) NOT NULL,
	Cilindrada nchar(10) NOT NULL,
	NumPuertas nchar(2) NOT NULL,
	NumRuedas nchar(2) NOT NULL,
	Traccion char(10) NOT NULL,
	Potencia nchar(10) NOT NULL,
    CapPasajeros nchar(2) not null,
	Precio money NOT NULL,
 CONSTRAINT PK_Modelos PRIMARY KEY(CodModelo),
);

CREATE TABLE Equipamiento(
	CodEquipo char(20) NOT NULL,
	Descripcion varchar(50) NOT NULL,
	Precio money NOT NULL,
 CONSTRAINT PK_Equipamiento PRIMARY KEY (CodEquipo)
) 

CREATE TABLE Vendedores(
	CI nchar(10) NOT NULL,
	Nombre varchar(50) NOT NULL,
	Direccion varchar(60) NOT NULL,
	Telefono nchar(10) NOT NULL,
	email varchar(30) not null,
	NITC nchar(15) NULL,
	NITSO nchar(15) NULL, 
 CONSTRAINT PK_Vendedores PRIMARY KEY (CI),
 CONSTRAINT FK_Vendedores_Concesionarios FOREIGN KEY(NITC) REFERENCES Concesionarios,
 CONSTRAINT FK_Vendedores_ServicioOf FOREIGN KEY(NITSO) REFERENCES ServicioOf 
)

CREATE TABLE Automoviles(
	NroChasis nchar(20) NOT NULL,
	Color char(20) NOT NULL,
	FechaFab date not null,
	CodModelo char(10) NOT NULL,
	NITC nchar(15) NOT NULL,
 CONSTRAINT PK_Automoviles PRIMARY KEY (NroChasis),
 CONSTRAINT FK_Automoviles_Concesionarios FOREIGN KEY(NITC) REFERENCES Concesionarios,
 CONSTRAINT FK_Automoviles_Modelos FOREIGN KEY(CodModelo) REFERENCES Modelos,
)

CREATE TABLE ModeloEquipo(
	CodModelo char(10) NOT NULL,
	CodEquipo char(20) NOT NULL,
	DeSerie char(1) NOT NULL,
 CONSTRAINT PK_ModeloEquipo PRIMARY KEY (CodModelo, CodEquipo),
 CONSTRAINT FK_ModeloEquipo_Equipamiento FOREIGN KEY(CodEquipo) REFERENCES Equipamiento (CodEquipo),
 CONSTRAINT FK_ModeloEquipo_Modelos FOREIGN KEY(CodModelo) REFERENCES Modelos (CodModelo)
)

CREATE TABLE Ventas(
	NroFactura nchar(10) NOT NULL,
	FechaVenta date NOT NULL,
	Lugar varchar(20) not null,
	Precio money NOT NULL,
	MetodoPago char(10) NOT NULL,
	NombreCliente varchar(50) NOT NULL,
	NitCliente nchar(10) NULL,
	FechaEntrega date NOT NULL,
	Placa char(10) NOT NULL,
	DeStock char(1) NOT NULL,
	CI nchar(10) NOT NULL,
	NroChasis nchar(20) NOT NULL,
 CONSTRAINT PK_Ventas PRIMARY KEY (NroFactura),
 CONSTRAINT FK_Ventas_Automoviles FOREIGN KEY(NroChasis) REFERENCES Automoviles,
 CONSTRAINT FK_Ventas_Vendedores FOREIGN KEY(CI) REFERENCES Vendedores
)

CREATE TABLE IncluyeEq(
	NroChasis nchar(20) NOT NULL,
	CodEquipo char(20) NOT NULL,
	NroSerie char(30) null,
 CONSTRAINT PK_IncluyeEq PRIMARY KEY (NroChasis, CodEquipo),
 CONSTRAINT FK_IncluyeEq_Automoviles FOREIGN KEY(NroChasis) REFERENCES Automoviles,
 CONSTRAINT FK_IncluyeEq_Equipamiento FOREIGN KEY(CodEquipo) REFERENCES Equipamiento
)


alter table ServicioOf  alter column casilla char(5)  null
alter table ServicioOf add default '0000' for casilla