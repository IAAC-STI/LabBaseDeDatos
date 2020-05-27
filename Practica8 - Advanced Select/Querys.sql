use BaseDeDatos_1847391

--Left Join
select ru.id_Ruta NumeroDeRuta,me.Municipio+' '+me.Estado As Origen,md.Municipio+' '+md.Estado As Destino, ru.Distancia_KM
from Ruta ru
left join MunicipiosEstados me on ru.Origen = me.id_MunicipioEstado
left join MunicipiosEstados md on ru.Destino = md.id_MunicipioEstado

select sa.id_Salida NumeroDeSalida,sa.HoraSalida,sa.FechaSalida,ca.id_Camion as NumeroCamion,ch.chNombre as NombreChofer
from Salida sa
left join Camion ca on sa.id_Salida=ca.id_Camion
left join Chofer ch on ca.id_Camion=ch.id_Chofer

--Select Right Join
select ca.id_Camion as Camion,ch.chNombre as NombreChofer,ch.chEdad as Edad,ch.chTelefono as Contacto,ch.EmpleadoActivo
From Camion ca right join Chofer ch
on ca.id_Chofer=ch.id_Chofer

select pb.id_ProductoBoleto as NumeroDeBoleto, p.pNombre +' '+ p.pApellido as NombrePasajero,p.pTelefono as ContactoPasajero, pb.CantidadDeBoletos as BoletosComprados ,pb.Precio_BoletosFinal as MontoTotal
from ProductoBoleto pb 
right join Pasajero p on pb.id_ProductoBoleto=p.id_Pasajero

--Inner Join
select fe.id_Factura NumeroFactura,rv.id_DetalleDeVenta NumeroDeVenta, rv.CapturaVenta FechaVenta,p.pNombre+' '+ p.pApellido as NombrePasajero,pb.CantidadDeBoletos as BoletosComprados
from FacturaEncabezado fe
inner join RegistroDeVenta rv on fe.id_Factura=rv.id_RegistroVenta
inner join ProductoBoleto pb on fe.id_ProductoBoleto=pb.id_ProductoBoleto
inner join Pasajero p on pb.id_ProductoBoleto=P.id_Pasajero

select camino.id_Ruta NumeroRuta,camino.Distancia_KM DistanciaKM,billetesRuta.PrecioRuta 
from PrecioDeRuta billetesRuta
inner join Ruta camino on billetesRuta.iId_PrecioRuta=camino.id_Ruta

--subconsulta
select Origen,Destino,
(select Avg(Distancia_KM) from Ruta) as PromedioDistancia
from Ruta

--with
with TablaUsuarios
(id_Usuario,uUsuario,uNombre,uApellido,uCorreo) 
as
(select id_Usuario,uUsuario,uNombre,uApellido,uCorreo from Usuarios) 
select uUsuario,uCorreo from TablaUsuarios

--select into
select * INTO NuevaTablaUsuarios From Usuarios
select * from NuevaTablaUsuarios