USE BaseDeDatos_1847391

CREATE VIEW REPORTE_BoletosConPrecioDeRutas_CostoFinal
AS
Select pb.id_ProductoBoleto ID_Boleto,pdr.id_Ruta ID_Ruta,pdr.PrecioRuta PrecioDeLaRuta,pdr.iIdPromocion ID_Promocion_Aplicada,PB.CantidadDeBoletos BoletosComprados,pb.Precio_BoletosFinal CostoFinalDeBoletosComprados
from ProductoBoleto pb 
inner join PrecioDeRuta pdr on pb.id_ProductoBoleto=pdr.iId_PrecioRuta 

CREATE VIEW REPORTE_SumaDeVentas_Boletos
AS
SELECT Count(p.id_Pasajero) TotalDeClientes,SUM(CantidadDeBoletos) BoletosEnTotalVendidos,SUM(Precio_BoletosFinal) DineroTotalDeLasVentasDeBoleto 
FROM ProductoBoleto pb
inner join Pasajero p on p.id_Pasajero=pb.id_ProductoBoleto

CREATE VIEW REPORTE_RutasYKilometrosRecorridos
AS
select Count(r.id_Ruta) NumeroDeRutasProgramadas,Count(me.id_MunicipioEstado) CantidadOrigenesTotales, Count(me.id_MunicipioEstado) CantidadDestinosTotales,SUM(r.Distancia_KM) KilometrosTotalesProgramadosPorRecorrer  
from Ruta r
inner join MunicipiosEstados me on me.id_MunicipioEstado=r.id_Ruta

CREATE VIEW Reporte_ChoferesContratadosYCamionesDeLaEmpresa AS
select Count(ca.id_Camion) AS CantidadDeCamionesDeLaEmpresa, Count(ch.id_Chofer) NumeroChoferesContratadosEmpresa 
from Camion ca
inner join Chofer ch on ch.id_Chofer=ca.id_Camion

create view Reporte_Salidas_Camiones_BoletosVendidos AS
Select COUNT(sa.id_Salida) SalidasProgramadas,Count(sa.id_Camion) CantidadDeCamionesOperando,Count(id_ProductoBoleto) CantidadBoletosVendidos
from DetalleDeVenta dv
inner join Salida sa on sa.id_Salida= id_DetalleDeVenta


