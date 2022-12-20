drop database TallerMecanico
go
use  TallerMecanico
go
CREATE TABLE Cliente(
	CI nchar(15) NOT NULL,
	Nombre varchar(50) NOT NULL,
	Apellidos varchar(50) NOT NULL,
	Direccion varchar(50) NOT NULL,
	Telefono varchar(15) NOT null,
 CONSTRAINT PK_Cliente PRIMARY KEY (CI)
);
go
CREATE TABLE Vehiculo(
	Matricula nchar(20) NOT NULL,
	Modelo varchar(30) NOT NULL,
	Color char(20) NOT NULL,
	CI nchar(15) NOT NULL,
 CONSTRAINT PK_Vehiculo PRIMARY KEY (Matricula),
 CONSTRAINT FK_Vehiculo_Cliente FOREIGN KEY(CI) REFERENCES Cliente,
);
go
CREATE TABLE Mecanico(
	CodMecanico char(10) NOT NULL,
	Nombre varchar(50) NOT NULL,
	Apellidos varchar(50) NOT NULL,
 CONSTRAINT PK_Mecanico PRIMARY KEY (CodMecanico)
);
go
CREATE TABLE Servicio(
	CodServicio char(10) NOT NULL,
	Matricula nchar(20) NOT NULL,
	FechaEntrada datetime NOT NULL,
	CodMecanico char(10) NOT NULL,
	FechaSalida datetime NULL,
 CONSTRAINT PK_Servicio PRIMARY KEY (CodServicio),
 CONSTRAINT FK_Servicio_Vehiculo FOREIGN KEY(Matricula) REFERENCES Vehiculo,
 CONSTRAINT FK_Servicio_Mecanico FOREIGN KEY(CodMecanico) REFERENCES Mecanico,
);
go
CREATE TABLE MecanicoServicio(
	CodMecanico char(10) NOT NULL,
	CodServicio char(10) NOT NULL,
 CONSTRAINT PK_MecanicoServicio PRIMARY KEY (CodMecanico, CodServicio),
 CONSTRAINT FK_MecanicoServicio_Mecanico FOREIGN KEY(CodMecanico) REFERENCES Mecanico,
 CONSTRAINT FK_MecanicoServicio_Servicio FOREIGN KEY(CodServicio) REFERENCES Servicio,
);
go
CREATE TABLE InsumoServicio(
	CodServicio char(10) NOT NULL,
	Insumo varchar(50) NOT NULL,
	Cantidad int NOT NULL,
	PrecioUnitario money NULL,
	ManoDeObra money NULL,
	CodMecanico char(10) NOT NULL,
 CONSTRAINT FK_InsumoServicio_Servicio FOREIGN KEY(CodServicio) REFERENCES Servicio,
 CONSTRAINT FK_InsumoServicio_Mecanico FOREIGN KEY(CodMecanico) REFERENCES Mecanico,
);
go
CREATE TABLE Factura(
	CodServicio char(10) NOT NULL,
	CI nchar(15) NOT NULL,
	Fecha date NOT NULL,
	Subtotal money NULL,
	IVA money NULL,
	Total money NULL,
 CONSTRAINT PK_Factura PRIMARY KEY (CodServicio),
 CONSTRAINT FK_Factura_Servicio FOREIGN KEY(CodServicio) REFERENCES Servicio,
 CONSTRAINT FK_Factura_Cliente FOREIGN KEY(CI) REFERENCES Cliente,
);
go
CREATE TABLE DetalleFactura(
	CodFactura char(10) NOT NULL,
	Cantidad int NOT NULL,
	Detalle varchar(50) NOT NULL,
	PrecioUnitario money NOT NULL,
	Total money NOT NULL,
 CONSTRAINT FK_DetalleFactura_Factura FOREIGN KEY(CodFactura) REFERENCES Factura,
);
go
INSERT Cliente VALUES ('12345678', 'Sergio', 'Asbun', 'Urbari #12', '78578037')
go
INSERT Vehiculo VALUES ('6123SDE', 'Nissan kicks', 'Blanco', '12345678')
go
INSERT Mecanico VALUES ('M1', 'Lucho', 'Arroba')
INSERT Mecanico VALUES ('M2', 'Fernando', 'Arellano')
INSERT Mecanico VALUES ('M3', 'Michael', 'Velez')
go
INSERT Servicio (CodServicio, Matricula, FechaEntrada, CodMecanico) 
	VALUES ('S1', '6123SDE', GETDATE(), 'M1')
go
INSERT MecanicoServicio VALUES ('M2', 'S1')
INSERT MecanicoServicio VALUES ('M3', 'S1')
go
INSERT InsumoServicio VALUES ('S1', 'Reparacion motor', 1, 0, 200, 'M1')
INSERT InsumoServicio VALUES ('S1', 'Aceite para motor', 1, 100, 20, 'M2')
INSERT InsumoServicio VALUES ('S1', 'Limpieza motor', 1, 0, 100, 'M3')
go
create procedure RegistrarCliente
	@CI nchar(15),
	@Nombre varchar(50),
	@Apellidos varchar(50),
	@Direccion varchar(50), 
	@Telefono varchar(15)
	as
		declare @error int
		set @error = 0
		begin transaction
		if not exists (select 1 from Cliente where CI = @CI)
			insert into Cliente values (@CI, @Nombre, @Apellidos, @Direccion, @Telefono)
		else 
			set @error = 1
		if @error = 0
		begin
			commit transaction
			print 'Cliente registrado'
		end
		else
		begin 
			rollback
			print 'Error al registrar'
		end
go
EXEC RegistrarCliente '9090090', 'Carlos', 'Arellano', 'Urbari #99', '78578036'
go
create procedure RegistrarVehiculo
	@Matricula nchar(20),
	@Modelo varchar(30),
	@Color char(20),
	@CI nchar(15)
	as
		declare @error int
		set @error = 0
		begin transaction
		if not exists (select 1 from Vehiculo where Matricula = @Matricula) and
			exists (select 1 from Cliente where CI = @CI)
			insert into Vehiculo values (@Matricula, @Modelo, @Color, @CI)
		else 
			set @error = 1
		if @error = 0
		begin
			commit transaction
			print 'Vehiculo registrado'
		end
		else
		begin 
			rollback
			print 'Error al registrar'
		end
go
EXEC RegistrarVehiculo '5190HDX', 'Nissan sentra', 'Negro', '1234567'
go
create procedure RegistrarServicio
	@CodServicio char(10),
	@Matricula nchar(20),
	@CodMecanico char(10)
	as
		declare @error int
		set @error = 0
		begin transaction
		if not exists (select 1 from Servicio where CodServicio = @CodServicio) and
			exists (select 1 from Vehiculo where Matricula = @Matricula) and
			exists (select 1 from Mecanico where CodMecanico = @CodMecanico)
			INSERT Servicio (CodServicio, Matricula, FechaEntrada, CodMecanico) 
				VALUES (@CodServicio, @Matricula, GETDATE(), @CodMecanico)
		else 
			set @error = 1
		if @error = 0
		begin
			commit transaction
			print 'Servicio registrado'
		end
		else
		begin 
			rollback
			print 'Error al registrar'
		end
go
EXEC RegistrarServicio 'S3', '6123SDE', 'M2'
go
create procedure RegistrarMecanicoAuxServicio
	@CodMecanico char(10),
	@CodServicio char(10)
	as
		declare @error int
		set @error = 0
		begin transaction
		if not exists (select 1 from MecanicoServicio where CodMecanico = @CodMecanico and CodServicio = @CodServicio) and 
			exists (select 1 from Mecanico where CodMecanico = @CodMecanico) and
			exists (select 1 from Servicio where CodServicio = @CodServicio)
			INSERT MecanicoServicio VALUES (@CodMecanico, @CodServicio)
		else 
			set @error = 1
		if @error = 0
		begin
			commit transaction
			print 'Mecanico auxiliar registrado'
		end
		else
		begin 
			rollback
			print 'Error al registrar'
		end
go
EXEC RegistrarMecanicoAuxServicio 'M1', 'S2'
go
create procedure RegistrarInsumoServicio
	@CodServicio char(10),
	@Insumo varchar(50),
	@Cantidad int,
	@PrecioUnitario money,
	@ManoDeObra money,
	@CodMecanico char(10)
	as
		declare @error int
		set @error = 0
		begin transaction
		if exists (select 1 from Mecanico where CodMecanico = @CodMecanico) and
			exists (select 1 from Servicio where CodServicio = @CodServicio)
			INSERT InsumoServicio VALUES (@CodServicio, @Insumo, @Cantidad, @PrecioUnitario, @ManoDeObra, @CodMecanico)
		else 
			set @error = 1
		if @error = 0
		begin
			commit transaction
			print 'Insumo registrado'
		end
		else
		begin 
			rollback
			print 'Error al registrar'
		end
go
EXEC RegistrarInsumoServicio 'S1', 'Agua verde', 1, 50, 0, 'M1'
go
create procedure GenerarFactura
	@CodServicio char(10)
	as
		declare @error int
		set @error = 0
		begin transaction
		if exists (select 1 from Servicio where CodServicio = @CodServicio)
			begin
			declare @CI nchar(15)
			set @CI = (select CI from Servicio inner join Vehiculo 
						on Vehiculo.Matricula = Servicio.Matricula 
						where CodServicio = @CodServicio) 
			declare @Subtotal money
			set @Subtotal = (select sum(Cantidad * PrecioUnitario + ManoDeObra) from InsumoServicio
							where CodServicio = @CodServicio)
			declare @IVA money
			set @IVA = @Subtotal * 0.13
			declare @Total money
			set @Total = @Subtotal + @IVA
			declare @Fecha date
			set @Fecha = GETDATE()

			INSERT Factura VALUES (@CodServicio, @CI, @Fecha, @Subtotal, @IVA, @Total)

			INSERT INTO DetalleFactura 
				SELECT @CodServicio CodFactura, Cantidad, Insumo Detalle, PrecioUnitario, (Cantidad * PrecioUnitario + ManoDeObra) Total
				FROM InsumoServicio WHERE @CodServicio = CodServicio

			UPDATE Servicio SET FechaSalida = @Fecha WHERE CodServicio = @CodServicio
			end
		else 
			set @error = 1
		if @error = 0
		begin
			commit transaction
			print 'Factura generada'
		end
		else
		begin 
			rollback
			print 'Error al generar'
		end
EXEC GenerarFactura 'S1'
delete DetalleFactura
delete Factura