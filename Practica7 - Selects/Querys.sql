
use BaseDeDatos_1847391
--5 selects Simples con clausula where
SELECT * FROM Chofer where chNombre LIKE 'J%'
SELECT uUsuario,uCorreo FROM Usuarios where id_Usuario>1 order by uUsuario
SELECT * FROM MunicipiosEstados WHERE Municipio LIKE '%M%'
SELECT * FROM Ruta where id_Ruta<8 AND id_Ruta>3
SELECT * FROM Promocion where cGenero='F'

--5 selects con clausula Group By
SELECT CantidadDeBoletos as RegistroCantidadBoletosComprados, Count(*) AS ConteoTotalBoletos FROM ProductoBoleto GROUP BY CantidadDeBoletos
SELECT Municipio AS GrupoMuncipios FROM MunicipiosEstados GROUP BY Municipio
SELECT Estado AS GrupoEstados FROM MunicipiosEstados GROUP BY Estado
SELECT fPorcentajeDescto CantidadDeDescuentos FROM Promocion Group BY fPorcentajeDescto
SELECT Estado, COUNT(*) AS ScursalesPorEstado FROM MunicipiosEstados GROUP BY Estado

--5 Selects con funciones de Agregado
SELECT COUNT(id_Ruta) AS Conteo_De_Rutas FROM Ruta 
SELECT SUM(PrecioRuta) AS Suma_De_Precio_De_Todos_Los_Viajes FROM PrecioDeRuta
SELECT MAX(PrecioRuta) AS Precio_Mas_Caro_De_Un_Viaje FROM PrecioDeRuta
SELECT MIN(PrecioRuta) AS Precio_Mas_Barato_De_Un_Viaje FROM PrecioDeRuta
SELECT AVG(PrecioRuta) AS Promedio_De_Costos_De_Todos_Los_Viajes From PrecioDeRuta

--5 selects con Clausula Having
SELECT chNombre NombreChoferes, AVG(chEdad) AS Edad FROM Chofer GROUP BY chNombre Having AVG(chEdad) >=20 AND AVG(chEdad) <=35 
SELECT dFecInicioPromocion FechaDePromocion, AVG(fPorcentajeDescto) AS Cantidad_Del_Descuento FROM Promocion GROUP BY dFecInicioPromocion Having  AVG(fPorcentajeDescto) >= .10
SELECT id_Ruta, AVG(Distancia_KM) AS Grupo_De_DistanciasKM_De_Las_Rutas FROM Ruta GROUP BY id_Ruta Having AVG(Distancia_KM) > 10
SELECT chLicencia, COUNT(chLicencia) AS Choferes_Con_Licencia_TipoA2 FROM Chofer GROUP BY chLicencia Having chLicencia = 'A2'
SELECT iId_PrecioRuta, Avg(PrecioRuta) as CostosElevadosA400Pesos FROM PrecioDeRuta GROUP BY iId_PrecioRuta Having avg(PrecioRuta) >400

--5 selects con clausula Top
SELECT TOP(5) * FROM ProductoBoleto
SELECT TOP(50)PERCENT uUsuario,uContraseña,uCorreo FROM Usuarios
SELECT TOP(6) * FROM Asiento ORDER BY id_Asiento DESC
SELECT TOP(9) * FROM Camion 
SELECT TOP(3) * FROM FacturaEncabezado