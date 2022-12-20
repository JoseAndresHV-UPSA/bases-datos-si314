/*
Para el problema "Concesionarios de vehículos" debemos desarrollar el modelo, los scripts de creación, poblar los datos y elaborar las siguientes consultas:
- Consulta que nos liste las ventas realizadas, incluyendo oficina de ventas,
   vendedor, vehículo, accesorios, precio
- Listado de modelos y sus accesorios de fábrica
- Listado de modelos y sus accesorios opcionales
- Listado de los vehículos en stock por oficina
- listado de ventas por vendedor
- listado de los servicios oficiales que trabajan con un concesionario
- Listado de monto de ventas totales
- Listado de monto de ventas por oficina
- Listado de monto de ventas por tipo de pago
- Listado de las placas entregas y el vehículo al que corresponde
*/

/* 
1- Consulta que nos liste las ventas realizadas, incluyendo oficina de ventas,
   vendedor, vehículo, accesorios, precio
*/
select  NroFactura, FechaVenta, ventas.Precio, NombreCliente as Cliente, placa,
		Concesionarios.Nombre as Concesionario, vendedores.Nombre as Vendedor, 
		Automoviles.NroChasis, marca, modelo, Descripcion, equipamiento.Precio as PrecioAccesorio
	from ventas inner join Vendedores on Ventas.CI = Vendedores.CI
			    inner join Concesionarios on Vendedores.NITC = Concesionarios.NITC
				inner join ServicioOf on Vendedores.NITSO = ServicioOf.NITSO
				inner join Automoviles on Ventas.NroChasis = Automoviles.NroChasis
				inner join Modelos on Automoviles.CodModelo = Modelos.CodModelo
				inner join IncluyeEq on Automoviles.NroChasis = IncluyeEq.NroChasis
				inner join Equipamiento on IncluyeEq.CodEquipo = Equipamiento.CodEquipo

				select * from ModeloEquipo where CodModelo = 'CX70'
				insert into IncluyeEq values ('998877', 'A11', 'EQ987456' );
				insert into IncluyeEq values ('998877', 'A4', 'EQ41257' );
				select * from Equipamiento
				select * from ventas
				select * from ServicioOf
				select * from Vendedores
				select * from Automoviles
				insert into ventas values 
				   ('257896', '2022-05-15', 'SCZ', 25000, 'Contado', 'Emir', '20204569', '2022-05-15', '5587PNP', 1, '666888','XYZ123')


select  NroFactura, FechaVenta, ventas.Precio, NombreCliente as Cliente, placa,
		Concesionarios.Nombre as Tienda, vendedores.Nombre as Vendedor, 
		Automoviles.NroChasis, marca, modelo
	from ventas inner join Vendedores on Ventas.CI = Vendedores.CI
			    inner join Concesionarios on Vendedores.NITC = Concesionarios.NITC
				inner join Automoviles on Ventas.NroChasis = Automoviles.NroChasis
				inner join Modelos on Automoviles.CodModelo = Modelos.CodModelo
union
select  NroFactura, FechaVenta, ventas.Precio, NombreCliente as Cliente, placa,
		ServicioOf.Nombre as Tienda, vendedores.Nombre as Vendedor, 
		Automoviles.NroChasis, marca, modelo 
	from ventas inner join Vendedores on Ventas.CI = Vendedores.CI
				inner join ServicioOf on Vendedores.NITSO = ServicioOf.NITSO
				inner join Automoviles on Ventas.NroChasis = Automoviles.NroChasis
				inner join Modelos on Automoviles.CodModelo = Modelos.CodModelo

 select  NroChasis, Descripcion, equipamiento.Precio as PrecioAccesorio
	from Equipamiento inner join IncluyeEq on Equipamiento.CodEquipo = IncluyeEq.CodEquipo
	where nrochasis in (select NroChasis from ventas)


	create view VistaVentas as (
			select  NroFactura, FechaVenta, ventas.Precio, NombreCliente as Cliente, placa,
					Concesionarios.Nombre as Tienda, vendedores.Nombre as Vendedor, 
					Automoviles.NroChasis, marca, modelo
				from ventas inner join Vendedores on Ventas.CI = Vendedores.CI
							inner join Concesionarios on Vendedores.NITC = Concesionarios.NITC
							inner join Automoviles on Ventas.NroChasis = Automoviles.NroChasis
							inner join Modelos on Automoviles.CodModelo = Modelos.CodModelo
			union
			select  NroFactura, FechaVenta, ventas.Precio, NombreCliente as Cliente, placa,
					ServicioOf.Nombre as Tienda, vendedores.Nombre as Vendedor, 
					Automoviles.NroChasis, marca, modelo 
				from ventas inner join Vendedores on Ventas.CI = Vendedores.CI
							inner join ServicioOf on Vendedores.NITSO = ServicioOf.NITSO
							inner join Automoviles on Ventas.NroChasis = Automoviles.NroChasis
							inner join Modelos on Automoviles.CodModelo = Modelos.CodModelo
	)

	select * from VistaVentas
	 
	select  NroChasis, Descripcion, equipamiento.Precio as PrecioAccesorio
	from Equipamiento inner join IncluyeEq on Equipamiento.CodEquipo = IncluyeEq.CodEquipo
	where nrochasis in (select NroChasis from VistaVentas)
/*
2- Listado de modelos y sus accesorios de fábrica
*/
select * from modelos;
select * from Equipamiento;
select * from ModeloEquipo;
insert into ModeloEquipo values ('CX70', 'A3', 150);
insert into ModeloEquipo values ('CX70', 'A4', 180);
insert into ModeloEquipo values ('FB2XLT', 'A6', 90);
insert into ModeloEquipo values ('432LS', 'A13', 200);
insert into ModeloEquipo values ('CX70', 'A11', 400);
insert into ModeloEquipo values ('FB2XLT', 'A1', 50);

select modelos.codmodelo, marca, modelo, Equipamiento.codequipo, descripcion 
	from Modelos, Equipamiento, ModeloEquipo
	where modelos.CodModelo = ModeloEquipo.CodModelo
	  and ModeloEquipo.CodEquipo = Equipamiento.CodEquipo
	  and ModeloEquipo.DeSerie = 'T'
	  /*modificar usando join*/

select modelos.codmodelo, marca, modelo, Equipamiento.codequipo, descripcion 
	from Modelos inner join ModeloEquipo on modelos.CodModelo = ModeloEquipo.CodModelo
				 inner join Equipamiento on ModeloEquipo.CodEquipo = Equipamiento.CodEquipo
	where ModeloEquipo.DeSerie = 'T'


/*
3- Listado de modelos y sus accesorios opcionales
*/
	select modelos.CodModelo, modelo, equipamiento.CodEquipo,  Descripcion, equipamiento.Precio
		from modelos INNER JOIN ModeloEquipo on Modelos.CodModelo = ModeloEquipo.CodModelo
					 inner join Equipamiento on ModeloEquipo.CodEquipo = Equipamiento.CodEquipo
		where DeSerie = 'F'
  
/*
3.1- Listado de modelos y sus accesorios de serie
*/
	select modelos.CodModelo, modelo, equipamiento.CodEquipo,  Descripcion, equipamiento.Precio
		from modelos INNER JOIN ModeloEquipo on Modelos.CodModelo = ModeloEquipo.CodModelo
					 inner join Equipamiento on ModeloEquipo.CodEquipo = Equipamiento.CodEquipo
		where DeSerie = 'T'
  
/*
3.2- Listado de modelos y sus accesorios opcionales o de serie
*/
(	select modelos.CodModelo, modelo, equipamiento.CodEquipo,  Descripcion, equipamiento.Precio, 'De serie' as Incluido
		from modelos INNER JOIN ModeloEquipo on Modelos.CodModelo = ModeloEquipo.CodModelo
					 inner join Equipamiento on ModeloEquipo.CodEquipo = Equipamiento.CodEquipo
		where DeSerie = 'T'
union  
	select modelos.CodModelo, modelo, equipamiento.CodEquipo,  Descripcion, equipamiento.Precio, 'Opcional' as Incluido
		from modelos INNER JOIN ModeloEquipo on Modelos.CodModelo = ModeloEquipo.CodModelo
					 inner join Equipamiento on ModeloEquipo.CodEquipo = Equipamiento.CodEquipo
		where DeSerie = 'F')


create view VistaAccesorios as (
		select modelos.CodModelo, modelo, equipamiento.CodEquipo,  Descripcion, equipamiento.Precio, 'De serie' as Incluido
				from modelos INNER JOIN ModeloEquipo on Modelos.CodModelo = ModeloEquipo.CodModelo
							 inner join Equipamiento on ModeloEquipo.CodEquipo = Equipamiento.CodEquipo
				where DeSerie = 'T'
		union  
			select modelos.CodModelo, modelo, equipamiento.CodEquipo,  Descripcion, equipamiento.Precio, 'Opcional' as Incluido
				from modelos INNER JOIN ModeloEquipo on Modelos.CodModelo = ModeloEquipo.CodModelo
							 inner join Equipamiento on ModeloEquipo.CodEquipo = Equipamiento.CodEquipo
				where DeSerie = 'F'
		)

		select * from VistaAccesorios order by codmodelo  

/*
4- Listado de los vehículos en stock por oficina
*/

/*
5- listado de ventas por vendedor
*/

/*
6- listado de los servicios oficiales que trabajan con un concesionario
*/

/*
7- Listado de monto de ventas totales
*/

/*
8- Listado de monto de ventas por oficina
*/

/*
9- Listado de monto de ventas por tipo de pago
*/

/*
10- Listado de las placas entregas y el vehículo al que corresponde
*/


