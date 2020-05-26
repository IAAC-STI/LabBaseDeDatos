use BaseDeDatos_1847391

--INSERTS TABLA Asiento
INSERT INTO Asiento VALUES (1,'X',1)
INSERT INTO Asiento VALUES (2,'X',2)
INSERT INTO Asiento VALUES (3,'X',3)
INSERT INTO Asiento VALUES (4,'Y',1)
INSERT INTO Asiento VALUES (5,'Y',2)
INSERT INTO Asiento VALUES (6,'Y',3)
INSERT INTO Asiento VALUES (7,'Y',4)
INSERT INTO Asiento VALUES (8,'Z',1)
INSERT INTO Asiento VALUES (9,'Z',2)
INSERT INTO Asiento VALUES (10,'Z',3)

--INSERTS TABLA Chofer
INSERT INTO Chofer VALUES (1,'El Chaps',25,8126431680,'A2','SI') 
INSERT INTO Chofer VALUES (2,'Jose Dominguez',30,8131912855,'A2','SI') 
INSERT INTO Chofer VALUES (3,'Matias Almeida',29,812352346,'A2','SI') 
INSERT INTO Chofer VALUES (4,'Roberto De Leon',30,8119826222,'A2','SI') 
INSERT INTO Chofer VALUES (5,'Juan Perez',34,8109873689,'A2','SI') 
INSERT INTO Chofer VALUES (6,'Adan Perales',26,8134209740,'A2','SI') 
INSERT INTO Chofer VALUES (7,'Angel Ochoa',20,8123451680,'A2','SI') 
INSERT INTO Chofer VALUES (8,'Luis Enrique',21,8122346680,'A2','SI') 
--update aplicado
INSERT INTO Chofer VALUES (9,'Alejandro Godina',22,8192323689,'A2','NO') 
--update aplicado
INSERT INTO Chofer VALUES (10,'Mariana Salas',23,8132463221,'A2','NO') 

--inserts tabla Camion
INSERT INTO Camion VALUES (1,1,1)
INSERT INTO Camion VALUES (2,2,2)
INSERT INTO Camion VALUES (3,3,3)
INSERT INTO Camion VALUES (4,4,4)
INSERT INTO Camion VALUES (5,5,5)
INSERT INTO Camion VALUES (6,6,6)
INSERT INTO Camion VALUES (7,7,7)
INSERT INTO Camion VALUES (8,8,8)
INSERT INTO Camion VALUES (9,9,9)
INSERT INTO Camion VALUES (10,10,10)

--INSERTS TABLA Usuarios
INSERT INTO Usuarios VALUES (1,'Ivan','ivam123.','Ivan','Arredondo','ivanarr@hotmail.com')
INSERT INTO Usuarios VALUES (2,'Antonio','antonio123.','Antonio','Presas','antoniopre@hotmail.com')
INSERT INTO Usuarios VALUES (3,'Luca','luca123.','Luca','Gutierrez','lucagut@hotmail.com')
INSERT INTO Usuarios VALUES (4,'Francisco','francisco123.','Francisco','Bernal','franciscober@hotmail.com')
INSERT INTO Usuarios VALUES (5,'Osvaldo','osvaldo123.','Osvaldo','Sanchez','osvaldosan@hotmail.com')
INSERT INTO Usuarios VALUES (6,'Abdiel','abdiel123.','Abdiel','Miranda','abdielmir@hotmail.com')
INSERT INTO Usuarios VALUES (7,'Tomas','tomas123.','Tomas','Romero','tomasrom@hotmail.com')
INSERT INTO Usuarios VALUES (8,'Jordan','jordan123.','Jordan','Herrera','jordanher@hotmail.com')
INSERT INTO Usuarios VALUES (9,'Brandon','brandon123.','Brandon','Gutierrez','brandongut@hotmail.com')
INSERT INTO Usuarios VALUES (10,'Juanita','juanita123.','Juana','Castillo','juanacas@hotmail.com')

--Inserts Tabla MunicipiosEstados
INSERT INTO MunicipiosEstados VALUES (1,'Monterrey','Nuevo Leon')
INSERT INTO MunicipiosEstados VALUES (2,'Guanajuato','Guanajuato')
INSERT INTO MunicipiosEstados VALUES (3,'Aguascalientes','Aguascalientes')
INSERT INTO MunicipiosEstados VALUES (4,'Hermosillo','Sonora')
INSERT INTO MunicipiosEstados VALUES (5,'Saltillo','Coahuila')
INSERT INTO MunicipiosEstados VALUES (6,'Zacatecas','Zacatecas')
--UPDATE aplicado
INSERT INTO MunicipiosEstados VALUES (7,'Tampico','Chihuahua')
--Update aplicado
INSERT INTO MunicipiosEstados VALUES (8,'Mazatlan','Sonora')
INSERT INTO MunicipiosEstados VALUES (9,'Cancún','Quintana Roo')
INSERT INTO MunicipiosEstados VALUES (10,'Ecatepec','Estado de Mexico')

--Inserts Tabla Promocion
INSERT INTO Promocion VALUES (1,'2020-05-10','2020-05-10',.20,'F',22,40)
INSERT INTO Promocion VALUES (2,'2020-11-15','2020-11-16',.15,'-',5,80)
INSERT INTO Promocion VALUES (3,'2020-03-16','2020-03-21',.10,'-',5,80)
INSERT INTO Promocion VALUES (4,'2020-05-01','2020-05-01',.20,'-',5,80)
INSERT INTO Promocion VALUES (5,'2020-11-16','2020-11-16',.16,'-',18,80)
INSERT INTO Promocion VALUES (6,'2020-11-02','2020-11-02',.15,'-',5,80)
INSERT INTO Promocion VALUES (7,'2020-12-12','2020-12-12',.12,'F',18,80)
INSERT INTO Promocion VALUES (8,'2020-05-15','2020-05-15',.20,'-',5,80)
INSERT INTO Promocion VALUES (9,'2020-05-05','2020-05-05',.05,'-',5,80)
INSERT INTO Promocion VALUES (10,'2020-01-01','2020-12-31',0.0,'-',5,80)

--Inserts Tabla Pasajero
Insert INTO Pasajero Values(1,'Ivan','Castillo','ivancas@hotmail.com',8123124543)
Insert INTO Pasajero Values(2,'Jorge','Rodriguez','jorgerdz@hotmail.com',8128674543)
Insert INTO Pasajero Values(3,'Maria','Rangel','mariaran@hotmail.com',8123119843)
Insert INTO Pasajero Values(4,'Judith','Arredondo','juditharr@hotmail.com',8126532353)
Insert INTO Pasajero Values(5,'Jose Angel','Vela','joseangelvel@hotmail.com',8153088543)
Insert INTO Pasajero Values(6,'Juan Carlos','castillo','juancastillo@hotmail.com',8128635973)
Insert INTO Pasajero Values(7,'Alejandro','Vargas','alexvar@hotmail.com',8113214543)
Insert INTO Pasajero Values(8,'David','Martinez','davidmar@hotmail.com',8123997724)
Insert INTO Pasajero Values(9,'Isai','Medina','Lalolalin10@hotmail.com',8128538543)
Insert INTO Pasajero Values(10,'Samira','Martinez','samiramar@hotmail.com',8119914543)
--inserts tabla Salida
INSERT INTO Salida VALUES (1,'10:00:00.000','2020-05-10',1,1)
INSERT INTO Salida VALUES (2,'11:00:00.000','2020-05-11',2,2)
INSERT INTO Salida VALUES (3,'12:00:00.000','2020-05-12',3,3)
INSERT INTO Salida VALUES (4,'13:00:00.000','2020-05-13',4,4)
INSERT INTO Salida VALUES (5,'14:00:00.000','2020-08-14',5,5)
INSERT INTO Salida VALUES (6,'15:00:00.000','2020-06-15',6,6)
INSERT INTO Salida VALUES (7,'16:00:00.000','2020-07-16',7,7)
--update
INSERT INTO Salida VALUES (8,'17:00:00.000','2020-03-17',8,8)
INSERT INTO Salida VALUES (9,'18:00:00.000','2020-07-18',9,9)
INSERT INTO Salida VALUES (10,'19:00:00.000','2020-08-19',10,10)

--Inserts Tabla Ruta
INSERT INTO Ruta VALUES (1,1,2,5.4)
INSERT INTO Ruta VALUES (2,2,3,16.5)
INSERT INTO Ruta VALUES (3,3,4,7.9)
INSERT INTO Ruta VALUES (4,4,5,8.9)
INSERT INTO Ruta VALUES (5,5,6,30.0)
INSERT INTO Ruta VALUES (6,6,7,35.3)
INSERT INTO Ruta VALUES (7,7,8,15.6)
INSERT INTO Ruta VALUES (8,8,9,10.7)
INSERT INTO Ruta VALUES (9,9,10,4.8)
INSERT INTO Ruta VALUES (10,10,1,9.1)

--inserts tabla PrecioDeRuta
INSERT INTO PrecioDeRuta VALUES (1,1,500.00,10)
INSERT INTO PrecioDeRuta VALUES (2,2,700.00,10)
INSERT INTO PrecioDeRuta VALUES (3,3,245.80,10)
INSERT INTO PrecioDeRuta VALUES (4,4,534.23,10)
INSERT INTO PrecioDeRuta VALUES (5,5,234.64,10)
INSERT INTO PrecioDeRuta VALUES (6,6,323.32,10)
INSERT INTO PrecioDeRuta VALUES (7,7,436.00,10)
INSERT INTO PrecioDeRuta VALUES (8,8,515.00,8)
INSERT INTO PrecioDeRuta VALUES (9,9,531.45,10)
INSERT INTO PrecioDeRuta VALUES (10,10,596.78,10)

--inserts tabla ProductoBoleto
INSERT INTO ProductoBoleto VALUES (1,1,1,3,1500.00)
INSERT INTO ProductoBoleto VALUES (2,2,2,1,700.00)
INSERT INTO ProductoBoleto VALUES (3,3,3,2,490.00)
INSERT INTO ProductoBoleto VALUES (4,4,4,1,534.23)
INSERT INTO ProductoBoleto VALUES (5,5,5,2,469.28)
INSERT INTO ProductoBoleto VALUES (6,6,6,1,323.32)
INSERT INTO ProductoBoleto VALUES (7,7,7,1,436.00)
INSERT INTO ProductoBoleto VALUES (8,8,8,1,412.00)
INSERT INTO ProductoBoleto VALUES (9,9,8,1,412.00)
INSERT INTO ProductoBoleto VALUES (10,10,10,1,596.78)
--insert tabla DetalleDeVenta
INSERT INTO DetalleDeVenta VALUES(1,1,1)
INSERT INTO DetalleDeVenta VALUES(2,2,2)
INSERT INTO DetalleDeVenta VALUES(3,3,3)
INSERT INTO DetalleDeVenta VALUES(4,4,4)
INSERT INTO DetalleDeVenta VALUES(5,5,5)
INSERT INTO DetalleDeVenta VALUES(6,6,6)
INSERT INTO DetalleDeVenta VALUES(7,7,7)
INSERT INTO DetalleDeVenta VALUES(8,8,8)
INSERT INTO DetalleDeVenta VALUES(9,9,9)
INSERT INTO DetalleDeVenta VALUES(10,10,10)

-- inserts tabla Registro de Venta
INSERT INTO RegistroDeVenta VALUES(1,1,'2020-05-10 10:00:00')
INSERT INTO RegistroDeVenta VALUES(2,2,'2020-05-11 11:00:00')
INSERT INTO RegistroDeVenta VALUES(3,3,'2020-05-12 12:00:00')
INSERT INTO RegistroDeVenta VALUES(4,4,'2020-05-13 13:00:00')
INSERT INTO RegistroDeVenta VALUES(5,5,'2020-08-14 14:00:00')
INSERT INTO RegistroDeVenta VALUES(6,6,'2020-06-15 15:00:00')
INSERT INTO RegistroDeVenta VALUES(7,7,'2020-07-16 16:00:00')
INSERT INTO RegistroDeVenta VALUES(8,8,'2020-03-17 17:00:00')
INSERT INTO RegistroDeVenta VALUES(9,9,'2020-07-18 18:00:00')
INSERT INTO RegistroDeVenta VALUES(10,10,'2020-08-19 19:00:00')

--INSERTS TABLA FACTURAENCABEZADO
INSERT INTO FacturaEncabezado VALUES(1,1,1)
INSERT INTO FacturaEncabezado VALUES(2,2,2)
INSERT INTO FacturaEncabezado VALUES(3,3,3)
INSERT INTO FacturaEncabezado VALUES(4,4,4)
INSERT INTO FacturaEncabezado VALUES(5,5,5)
INSERT INTO FacturaEncabezado VALUES(6,6,6)
INSERT INTO FacturaEncabezado VALUES(7,7,7)
INSERT INTO FacturaEncabezado VALUES(8,8,8)
INSERT INTO FacturaEncabezado VALUES(9,9,9)
INSERT INTO FacturaEncabezado VALUES(10,10,10)

---------------------UPDATE---------------------------
update Chofer 
SET EmpleadoActivo='SI' 
where id_Chofer=9 AND chEdad=22

UPDATE Chofer 
SET EmpleadoActivo='SI' 
where chNombre like 'Mariana S%' AND chTelefono=8132463221

UPDATE MunicipiosEstados
SET Estado='Sinaloa' 
where id_MunicipioEstado=8 AND Municipio='Mazatlan'

UPDATE Salida 
SET FechaSalida='2020-07-17' 
where id_Camion=8 AND id_Ruta=8

UPDATE RegistroDeVenta
SET CapturaVenta='2020-07-17 17:00:00.000' 
where id_RegistroVenta=8 AND id_DetalleDeVenta=8

update MunicipiosEstados
SET Municipio='Torreon', Estado='Coahuila' 
where id_MunicipioEstado=2  

UPDATE Usuarios
SET uNombre='Lucas' 
where uApellido='Gutierrez'

UPDATE Usuarios 
SET uNombre='Brandon'
where id_Usuario=9

UPDATE	Usuarios 
SET uApellido='Oranday' 
where uNombre like 'B%'

UPDATE ProductoBoleto
SET CantidadDeBoletos=2,Precio_BoletosFinal=1000 
where id_ProductoBoleto=1

---------------------DELETE---------------------------
Delete from Promocion where iIdPromocion=9
Delete from Promocion where iIdPromocion=7
Delete from UsuarioS where uUsuario='Juanita'
Delete from Promocion where iIdPromocion=6
Delete from UsuarioS where id_Usuario=5
