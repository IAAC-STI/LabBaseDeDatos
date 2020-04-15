use IVAN_BD

--5 selects Simples con clausula where
SELECT * FROM Chofer where cNombre LIKE 'J%'
SELECT Usuario,Correo FROM Cliente where id_Cliente>1 order by Usuario
SELECT * FROM Destino WHERE CiduadDestino LIKE 'Monterrey'
SELECT * FROM Ruta where id_Ruta<10 AND id_Ruta>0
SELECT * FROM Descuento where id_Descuento=3

--5 selects con clausula Group By
SELECT Cantidad_Boletos, COUNT(Cantidad_Boletos) AS CantidadTotalBoletos FROM ProductoBoleto GROUP BY Cantidad_Boletos
SELECT CiduadOrigen AS Grupo_CiudadesOrigen FROM Origen GROUP BY CiduadOrigen
SELECT CiduadDestino AS Grupo_CiudadesDestino FROM Destino GROUP BY CiduadDestino 
SELECT descripcion AS Grupo_De_Tipos_Descuentos FROM Descuento Group BY descripcion 
SELECT EstadoDestino, COUNT(*) AS Cant_Estados_De_Destino FROM Destino GROUP BY EstadoDestino

--5 Selects con funciones de Agregado
SELECT COUNT(id_Precio) AS Conteo_De_Viajes FROM Precio 
SELECT SUM(Precio_Total_Viaje) AS Suma_De_Precio_De_Todos_Los_Viajes FROM Precio
SELECT MAX(Precio_Total_Viaje) AS Precio_Mas_Caro_De_Un_Viaje FROM Precio
SELECT MIN(Precio_Total_Viaje) AS Precio_Mas_Barato_De_Un_Viaje FROM Precio
SELECT AVG(Precio_Total_Viaje) AS Promedio_De_Los_Precios_De_Todos_Los_Viajes From Precio

--5 selects con Clausula Having
SELECT cNombre, AVG(cEdad) AS Edad FROM Chofer GROUP BY cNombre Having AVG(cEdad) >=20 AND AVG(cEdad) <=35 
SELECT descripcion, AVG(porcentaje) AS Cantidad_De_Descuento FROM Descuento GROUP BY descripcion Having  AVG(porcentaje) >= .50
SELECT id_Ruta, AVG(Distancia_KM) AS Grupo_De_DistanciasKM_De_Las_Rutas FROM Ruta GROUP BY id_Ruta Having AVG(Distancia_KM) > 10
SELECT cLicencia, COUNT(cLicencia) AS Grupo_Choferes_Con_Licencia_TipoA FROM Chofer GROUP BY cLicencia Having cLicencia = 'A'
SELECT cLicencia, Count(cLicencia) AS Grupo_Choferes_Con_Licencia_TipoA2 FROM Chofer GROUP BY cLicencia Having cLicencia = 'A2'

--5 selects con clausula Top
SELECT TOP(5) * FROM ProductoBoleto
SELECT TOP(50)PERCENT Usuario,Contraseña,Correo FROM Cliente
SELECT TOP(6) * FROM Asiento ORDER BY id_Asiento DESC
SELECT TOP(9) * FROM Camion 
SELECT TOP(3) * FROM Precio
