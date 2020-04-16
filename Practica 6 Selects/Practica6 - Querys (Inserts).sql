use BD
GO
SELECT * FROM ORIGEN WHERE EstadoOrigen='Jalisco'
SELECT * FROM ORIGEN WHERE id_Origen=2
SELECT * FROM Destino WHERE CiudadDestino='Merida'
SELECT * FROM Destino WHERE id_Destino BETWEEN 3 AND 7
SELECT * FROM Destino WHERE EstadoDestino='Coahuila'

SELECT TOP 3 * FROM Camion
SELECT TOP 5 * FROM Camion
SELECT TOP 6 * FROM Ruta
SELECT TOP 7 * FROM Descuento
SELECT TOP 4 * FROM Ruta

SELECT nacionalidad FROM Pasajero WHERE id_Pasajero BETWEEN 1 AND 10 GROUP BY nacionalidad
SELECT cEdad, COUNT(*) AS Chofer FROM Chofer GROUP BY cEdad
SELECT correo FROM Pasajero WHERE id_Pasajero BETWEEN 1 AND 10 GROUP BY correo
SELECT COUNT(id_Chofer) AS cNombre FROM Chofer GROUP BY cNombre
SELECT COUNT(id_Cliente) AS Usuario FROM Cliente GROUP BY Usuario

SELECT SUM(PrecioVenta) as sumaprecio FROM RegistroDeVenta
SELECT MAX(PrecioVenta) as maxprecio FROM RegistroDeVenta
SELECT MIN(PrecioVenta) as minprecio FROM RegistroDeVenta
SELECT AVG(PrecioVenta) as avgprecio FROM RegistroDeVenta
SELECT COUNT(*) as conteotodo FROM RegistroDeVenta

SELECT id_Venta, MAX(PrecioVenta) AS Total FROM RegistroDeVenta GROUP BY id_Venta HAVING MAX(PrecioVenta) >= 1
SELECT letra, COUNT(*) as asientoletra FROM Asiento GROUP BY letra HAVING letra <> 'A'
SELECT letra, COUNT(*) as asientoletra2 FROM Asiento GROUP BY letra HAVING letra <> 'B'
SELECT COUNT(letra) AS asientofila, fila FROM Asiento GROUP BY fila HAVING fila >2
SELECT descripcion, MIN(porcentaje) AS descripcionporcentaje FROM Descuento GROUP BY descripcion HAVING MIN(porcentaje) < 14
