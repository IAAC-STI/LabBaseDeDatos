USE [master]
GO
/****** Object:  Database [BaseDeDatos_1847391]    Script Date: 30/05/2020 11:40:10 p. m. ******/
CREATE DATABASE [BaseDeDatos_1847391]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaseDeDatos_1847391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BaseDeDatos_1847391.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BaseDeDatos_1847391_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BaseDeDatos_1847391_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BaseDeDatos_1847391] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaseDeDatos_1847391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaseDeDatos_1847391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET  MULTI_USER 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaseDeDatos_1847391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BaseDeDatos_1847391] SET QUERY_STORE = OFF
GO
USE [BaseDeDatos_1847391]
GO
/****** Object:  Table [dbo].[PrecioDeRuta]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrecioDeRuta](
	[iId_PrecioRuta] [int] NOT NULL,
	[id_Ruta] [int] NOT NULL,
	[PrecioRuta] [float] NOT NULL,
	[iIdPromocion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iId_PrecioRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoBoleto]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoBoleto](
	[id_ProductoBoleto] [int] NOT NULL,
	[id_Pasajero] [int] NOT NULL,
	[iId_PrecioRuta] [int] NOT NULL,
	[CantidadDeBoletos] [tinyint] NOT NULL,
	[Precio_BoletosFinal] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ProductoBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[REPORTE_BoletosConPrecioDeRutas_CostoFinal]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[REPORTE_BoletosConPrecioDeRutas_CostoFinal]
AS
Select pb.id_ProductoBoleto ID_Boleto,pdr.id_Ruta ID_Ruta,pdr.PrecioRuta PrecioDeLaRuta,pdr.iIdPromocion ID_Promocion_Aplicada,PB.CantidadDeBoletos BoletosComprados,pb.Precio_BoletosFinal CostoFinalDeBoletosComprados
from ProductoBoleto pb 
inner join PrecioDeRuta pdr on pb.id_ProductoBoleto=pdr.iId_PrecioRuta 
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajero](
	[id_Pasajero] [int] NOT NULL,
	[pNombre] [varchar](15) NOT NULL,
	[pApellido] [varchar](15) NOT NULL,
	[pCorreo] [varchar](30) NOT NULL,
	[pTelefono] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Pasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[REPORTE_SumaDeVentas_Boletos]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[REPORTE_SumaDeVentas_Boletos]
AS
SELECT Count(p.id_Pasajero) TotalDeClientes,SUM(CantidadDeBoletos) BoletosEnTotalVendidos,SUM(Precio_BoletosFinal) DineroTotalDeLasVentasDeBoleto 
FROM ProductoBoleto pb
inner join Pasajero p on p.id_Pasajero=pb.id_ProductoBoleto
GO
/****** Object:  Table [dbo].[MunicipiosEstados]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MunicipiosEstados](
	[id_MunicipioEstado] [int] NOT NULL,
	[Municipio] [varchar](20) NOT NULL,
	[Estado] [varchar](18) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_MunicipioEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ruta](
	[id_Ruta] [int] NOT NULL,
	[Origen] [int] NOT NULL,
	[Destino] [int] NOT NULL,
	[Distancia_KM] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[REPORTE_RutasYKilometrosRecorridos]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[REPORTE_RutasYKilometrosRecorridos]
AS
select Count(r.id_Ruta) NumeroDeRutasProgramadas,Count(me.id_MunicipioEstado) CantidadOrigenesTotales, Count(me.id_MunicipioEstado) CantidadDestinosTotales,SUM(r.Distancia_KM) KilometrosTotalesProgramadosPorRecorrer  
from Ruta r
inner join MunicipiosEstados me on me.id_MunicipioEstado=r.id_Ruta
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chofer](
	[id_Chofer] [int] NOT NULL,
	[chNombre] [varchar](20) NOT NULL,
	[chEdad] [int] NOT NULL,
	[chTelefono] [bigint] NOT NULL,
	[chLicencia] [varchar](5) NOT NULL,
	[EmpleadoActivo] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Chofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Camion]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camion](
	[id_Camion] [int] NOT NULL,
	[id_Chofer] [int] NOT NULL,
	[id_Asiento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Camion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Reporte_ChoferesContratadosYCamionesDeLaEmpresa]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Reporte_ChoferesContratadosYCamionesDeLaEmpresa] AS
select Count(ca.id_Camion) AS CantidadDeCamionesDeLaEmpresa, Count(ch.id_Chofer) NumeroChoferesContratadosEmpresa 
from Camion ca
inner join Chofer ch on ch.id_Chofer=ca.id_Camion
GO
/****** Object:  Table [dbo].[Salida]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salida](
	[id_Salida] [int] NOT NULL,
	[HoraSalida] [time](7) NOT NULL,
	[FechaSalida] [date] NOT NULL,
	[id_Camion] [int] NOT NULL,
	[id_Ruta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleDeVenta]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleDeVenta](
	[id_DetalleDeVenta] [int] NOT NULL,
	[id_Salida] [int] NOT NULL,
	[id_ProductoBoleto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_DetalleDeVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Reporte_Salidas_Camiones_BoletosVendidos]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Reporte_Salidas_Camiones_BoletosVendidos] AS
Select COUNT(sa.id_Salida) SalidasProgramadas,Count(sa.id_Camion) CantidadDeCamionesOperando,Count(id_ProductoBoleto) CantidadBoletosVendidos
from DetalleDeVenta dv
inner join Salida sa on sa.id_Salida= id_DetalleDeVenta
GO
/****** Object:  Table [dbo].[Asiento]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asiento](
	[id_Asiento] [int] NOT NULL,
	[letra] [char](1) NOT NULL,
	[fila] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Asiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaEncabezado]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaEncabezado](
	[id_Factura] [int] NOT NULL,
	[id_RegistroVenta] [int] NOT NULL,
	[id_ProductoBoleto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NuevaTablaUsuarios]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NuevaTablaUsuarios](
	[id_Usuario] [int] NOT NULL,
	[uUsuario] [varchar](20) NOT NULL,
	[uContraseña] [varchar](16) NOT NULL,
	[uNombre] [varchar](15) NOT NULL,
	[uApellido] [varchar](15) NOT NULL,
	[uCorreo] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocion]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocion](
	[iIdPromocion] [int] NOT NULL,
	[dFecInicioPromocion] [date] NOT NULL,
	[dFecFinPromocion] [date] NOT NULL,
	[fPorcentajeDescto] [float] NOT NULL,
	[cGenero] [char](1) NOT NULL,
	[tEdadMin] [tinyint] NOT NULL,
	[tEdadMax] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdPromocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroDeVenta]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroDeVenta](
	[id_RegistroVenta] [int] NOT NULL,
	[id_DetalleDeVenta] [int] NOT NULL,
	[CapturaVenta] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_RegistroVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/05/2020 11:40:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_Usuario] [int] NOT NULL,
	[uUsuario] [varchar](20) NOT NULL,
	[uContraseña] [varchar](16) NOT NULL,
	[uNombre] [varchar](15) NOT NULL,
	[uApellido] [varchar](15) NOT NULL,
	[uCorreo] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (1, N'X', 1)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (2, N'X', 2)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (3, N'X', 3)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (4, N'Y', 1)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (5, N'Y', 2)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (6, N'Y', 3)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (7, N'Y', 4)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (8, N'Z', 1)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (9, N'Z', 2)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (10, N'Z', 3)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (1, 1, 1)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (2, 2, 2)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (3, 3, 3)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (4, 4, 4)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (5, 5, 5)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (6, 6, 6)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (7, 7, 7)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (8, 8, 8)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (9, 9, 9)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (10, 10, 10)
INSERT [dbo].[Chofer] ([id_Chofer], [chNombre], [chEdad], [chTelefono], [chLicencia], [EmpleadoActivo]) VALUES (1, N'El Chaps', 25, 8126431680, N'A2', N'SI')
INSERT [dbo].[Chofer] ([id_Chofer], [chNombre], [chEdad], [chTelefono], [chLicencia], [EmpleadoActivo]) VALUES (2, N'Jose Dominguez', 30, 8131912855, N'A2', N'SI')
INSERT [dbo].[Chofer] ([id_Chofer], [chNombre], [chEdad], [chTelefono], [chLicencia], [EmpleadoActivo]) VALUES (3, N'Matias Almeida', 29, 812352346, N'A2', N'SI')
INSERT [dbo].[Chofer] ([id_Chofer], [chNombre], [chEdad], [chTelefono], [chLicencia], [EmpleadoActivo]) VALUES (4, N'Roberto De Leon', 30, 8119826222, N'A2', N'SI')
INSERT [dbo].[Chofer] ([id_Chofer], [chNombre], [chEdad], [chTelefono], [chLicencia], [EmpleadoActivo]) VALUES (5, N'Juan Perez', 34, 8109873689, N'A2', N'SI')
INSERT [dbo].[Chofer] ([id_Chofer], [chNombre], [chEdad], [chTelefono], [chLicencia], [EmpleadoActivo]) VALUES (6, N'Adan Perales', 26, 8134209740, N'A2', N'SI')
INSERT [dbo].[Chofer] ([id_Chofer], [chNombre], [chEdad], [chTelefono], [chLicencia], [EmpleadoActivo]) VALUES (7, N'Angel Ochoa', 20, 8123451680, N'A2', N'SI')
INSERT [dbo].[Chofer] ([id_Chofer], [chNombre], [chEdad], [chTelefono], [chLicencia], [EmpleadoActivo]) VALUES (8, N'Luis Enrique', 21, 8122346680, N'A2', N'SI')
INSERT [dbo].[Chofer] ([id_Chofer], [chNombre], [chEdad], [chTelefono], [chLicencia], [EmpleadoActivo]) VALUES (9, N'Alejandro Godina', 22, 8192323689, N'A2', N'SI')
INSERT [dbo].[Chofer] ([id_Chofer], [chNombre], [chEdad], [chTelefono], [chLicencia], [EmpleadoActivo]) VALUES (10, N'Mariana Salas', 23, 8132463221, N'A2', N'SI')
INSERT [dbo].[DetalleDeVenta] ([id_DetalleDeVenta], [id_Salida], [id_ProductoBoleto]) VALUES (1, 1, 1)
INSERT [dbo].[DetalleDeVenta] ([id_DetalleDeVenta], [id_Salida], [id_ProductoBoleto]) VALUES (2, 2, 2)
INSERT [dbo].[DetalleDeVenta] ([id_DetalleDeVenta], [id_Salida], [id_ProductoBoleto]) VALUES (3, 3, 3)
INSERT [dbo].[DetalleDeVenta] ([id_DetalleDeVenta], [id_Salida], [id_ProductoBoleto]) VALUES (4, 4, 4)
INSERT [dbo].[DetalleDeVenta] ([id_DetalleDeVenta], [id_Salida], [id_ProductoBoleto]) VALUES (5, 5, 5)
INSERT [dbo].[DetalleDeVenta] ([id_DetalleDeVenta], [id_Salida], [id_ProductoBoleto]) VALUES (6, 6, 6)
INSERT [dbo].[DetalleDeVenta] ([id_DetalleDeVenta], [id_Salida], [id_ProductoBoleto]) VALUES (7, 7, 7)
INSERT [dbo].[DetalleDeVenta] ([id_DetalleDeVenta], [id_Salida], [id_ProductoBoleto]) VALUES (8, 8, 8)
INSERT [dbo].[DetalleDeVenta] ([id_DetalleDeVenta], [id_Salida], [id_ProductoBoleto]) VALUES (9, 9, 9)
INSERT [dbo].[DetalleDeVenta] ([id_DetalleDeVenta], [id_Salida], [id_ProductoBoleto]) VALUES (10, 10, 10)
INSERT [dbo].[FacturaEncabezado] ([id_Factura], [id_RegistroVenta], [id_ProductoBoleto]) VALUES (1, 1, 1)
INSERT [dbo].[FacturaEncabezado] ([id_Factura], [id_RegistroVenta], [id_ProductoBoleto]) VALUES (2, 2, 2)
INSERT [dbo].[FacturaEncabezado] ([id_Factura], [id_RegistroVenta], [id_ProductoBoleto]) VALUES (3, 3, 3)
INSERT [dbo].[FacturaEncabezado] ([id_Factura], [id_RegistroVenta], [id_ProductoBoleto]) VALUES (4, 4, 4)
INSERT [dbo].[FacturaEncabezado] ([id_Factura], [id_RegistroVenta], [id_ProductoBoleto]) VALUES (5, 5, 5)
INSERT [dbo].[FacturaEncabezado] ([id_Factura], [id_RegistroVenta], [id_ProductoBoleto]) VALUES (6, 6, 6)
INSERT [dbo].[FacturaEncabezado] ([id_Factura], [id_RegistroVenta], [id_ProductoBoleto]) VALUES (7, 7, 7)
INSERT [dbo].[FacturaEncabezado] ([id_Factura], [id_RegistroVenta], [id_ProductoBoleto]) VALUES (8, 8, 8)
INSERT [dbo].[FacturaEncabezado] ([id_Factura], [id_RegistroVenta], [id_ProductoBoleto]) VALUES (9, 9, 9)
INSERT [dbo].[FacturaEncabezado] ([id_Factura], [id_RegistroVenta], [id_ProductoBoleto]) VALUES (10, 10, 10)
INSERT [dbo].[MunicipiosEstados] ([id_MunicipioEstado], [Municipio], [Estado]) VALUES (1, N'Monterrey', N'Nuevo Leon')
INSERT [dbo].[MunicipiosEstados] ([id_MunicipioEstado], [Municipio], [Estado]) VALUES (2, N'Torreon', N'Coahuila')
INSERT [dbo].[MunicipiosEstados] ([id_MunicipioEstado], [Municipio], [Estado]) VALUES (3, N'Aguascalientes', N'Aguascalientes')
INSERT [dbo].[MunicipiosEstados] ([id_MunicipioEstado], [Municipio], [Estado]) VALUES (4, N'Hermosillo', N'Sonora')
INSERT [dbo].[MunicipiosEstados] ([id_MunicipioEstado], [Municipio], [Estado]) VALUES (5, N'Saltillo', N'Coahuila')
INSERT [dbo].[MunicipiosEstados] ([id_MunicipioEstado], [Municipio], [Estado]) VALUES (6, N'Zacatecas', N'Zacatecas')
INSERT [dbo].[MunicipiosEstados] ([id_MunicipioEstado], [Municipio], [Estado]) VALUES (7, N'Tampico', N'Tamaulipas')
INSERT [dbo].[MunicipiosEstados] ([id_MunicipioEstado], [Municipio], [Estado]) VALUES (8, N'Mazatlan', N'Sinaloa')
INSERT [dbo].[MunicipiosEstados] ([id_MunicipioEstado], [Municipio], [Estado]) VALUES (9, N'Cancún', N'Quintana Roo')
INSERT [dbo].[MunicipiosEstados] ([id_MunicipioEstado], [Municipio], [Estado]) VALUES (10, N'Ecatepec', N'Estado de Mexico')
INSERT [dbo].[NuevaTablaUsuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (1, N'Ivan', N'ivam123.', N'Ivan', N'Arredondo', N'ivanarr@hotmail.com')
INSERT [dbo].[NuevaTablaUsuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (2, N'Antonio', N'antonio123.', N'Antonio', N'Presas', N'antoniopre@hotmail.com')
INSERT [dbo].[NuevaTablaUsuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (3, N'Luca', N'luca123.', N'Lucas', N'Gutierrez', N'lucagut@hotmail.com')
INSERT [dbo].[NuevaTablaUsuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (4, N'Francisco', N'francisco123.', N'Francisco', N'Bernal', N'franciscober@hotmail.com')
INSERT [dbo].[NuevaTablaUsuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (6, N'Abdiel', N'abdiel123.', N'Abdiel', N'Miranda', N'abdielmir@hotmail.com')
INSERT [dbo].[NuevaTablaUsuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (7, N'Tomas', N'tomas123.', N'Tomas', N'Romero', N'tomasrom@hotmail.com')
INSERT [dbo].[NuevaTablaUsuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (8, N'Jordan', N'jordan123.', N'Jordan', N'Herrera', N'jordanher@hotmail.com')
INSERT [dbo].[NuevaTablaUsuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (9, N'Brandon', N'brandon123.', N'Brandon', N'Oranday', N'brandongut@hotmail.com')
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (1, N'Ivan', N'Castillo', N'ivancas@hotmail.com', 8123124543)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (2, N'Jorge', N'Rodriguez', N'jorgerdz@hotmail.com', 8128674543)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (3, N'Maria', N'Rangel', N'mariaran@hotmail.com', 8123119843)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (4, N'Judith', N'Arredondo', N'juditharr@hotmail.com', 8126532353)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (5, N'Jose Angel', N'Vela', N'joseangelvel@hotmail.com', 8153088543)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (6, N'Juan Carlos', N'castillo', N'juancastillo@hotmail.com', 8128635973)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (7, N'Alejandro', N'Vargas', N'alexvar@hotmail.com', 8113214543)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (8, N'David', N'Martinez', N'davidmar@hotmail.com', 8123997724)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (9, N'Isai', N'Medina', N'Lalolalin10@hotmail.com', 8128538543)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (10, N'Samira', N'Martinez', N'samiramar@hotmail.com', 8119914543)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (11, N'Mateo', N'Gonzalez', N'mateogzz@hotmail.com', 8327345511)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (12, N'Guillermo', N'Sanchez', N'guilleshz@hotmail.com', 8327323571)
INSERT [dbo].[Pasajero] ([id_Pasajero], [pNombre], [pApellido], [pCorreo], [pTelefono]) VALUES (13, N'Antonio', N'Balderas', N'ToñoBal@hotmail.com', 8399993571)
INSERT [dbo].[PrecioDeRuta] ([iId_PrecioRuta], [id_Ruta], [PrecioRuta], [iIdPromocion]) VALUES (1, 1, 500, 10)
INSERT [dbo].[PrecioDeRuta] ([iId_PrecioRuta], [id_Ruta], [PrecioRuta], [iIdPromocion]) VALUES (2, 2, 700, 10)
INSERT [dbo].[PrecioDeRuta] ([iId_PrecioRuta], [id_Ruta], [PrecioRuta], [iIdPromocion]) VALUES (3, 3, 245.8, 10)
INSERT [dbo].[PrecioDeRuta] ([iId_PrecioRuta], [id_Ruta], [PrecioRuta], [iIdPromocion]) VALUES (4, 4, 534.23, 10)
INSERT [dbo].[PrecioDeRuta] ([iId_PrecioRuta], [id_Ruta], [PrecioRuta], [iIdPromocion]) VALUES (5, 5, 234.64, 10)
INSERT [dbo].[PrecioDeRuta] ([iId_PrecioRuta], [id_Ruta], [PrecioRuta], [iIdPromocion]) VALUES (6, 6, 323.32, 10)
INSERT [dbo].[PrecioDeRuta] ([iId_PrecioRuta], [id_Ruta], [PrecioRuta], [iIdPromocion]) VALUES (7, 7, 436, 10)
INSERT [dbo].[PrecioDeRuta] ([iId_PrecioRuta], [id_Ruta], [PrecioRuta], [iIdPromocion]) VALUES (8, 8, 515, 8)
INSERT [dbo].[PrecioDeRuta] ([iId_PrecioRuta], [id_Ruta], [PrecioRuta], [iIdPromocion]) VALUES (9, 9, 531.45, 10)
INSERT [dbo].[PrecioDeRuta] ([iId_PrecioRuta], [id_Ruta], [PrecioRuta], [iIdPromocion]) VALUES (10, 10, 596.78, 10)
INSERT [dbo].[ProductoBoleto] ([id_ProductoBoleto], [id_Pasajero], [iId_PrecioRuta], [CantidadDeBoletos], [Precio_BoletosFinal]) VALUES (1, 1, 1, 2, 1000)
INSERT [dbo].[ProductoBoleto] ([id_ProductoBoleto], [id_Pasajero], [iId_PrecioRuta], [CantidadDeBoletos], [Precio_BoletosFinal]) VALUES (2, 2, 2, 1, 700)
INSERT [dbo].[ProductoBoleto] ([id_ProductoBoleto], [id_Pasajero], [iId_PrecioRuta], [CantidadDeBoletos], [Precio_BoletosFinal]) VALUES (3, 3, 3, 2, 490)
INSERT [dbo].[ProductoBoleto] ([id_ProductoBoleto], [id_Pasajero], [iId_PrecioRuta], [CantidadDeBoletos], [Precio_BoletosFinal]) VALUES (4, 4, 4, 1, 534.23)
INSERT [dbo].[ProductoBoleto] ([id_ProductoBoleto], [id_Pasajero], [iId_PrecioRuta], [CantidadDeBoletos], [Precio_BoletosFinal]) VALUES (5, 5, 5, 2, 469.28)
INSERT [dbo].[ProductoBoleto] ([id_ProductoBoleto], [id_Pasajero], [iId_PrecioRuta], [CantidadDeBoletos], [Precio_BoletosFinal]) VALUES (6, 6, 6, 1, 323.32)
INSERT [dbo].[ProductoBoleto] ([id_ProductoBoleto], [id_Pasajero], [iId_PrecioRuta], [CantidadDeBoletos], [Precio_BoletosFinal]) VALUES (7, 7, 7, 1, 436)
INSERT [dbo].[ProductoBoleto] ([id_ProductoBoleto], [id_Pasajero], [iId_PrecioRuta], [CantidadDeBoletos], [Precio_BoletosFinal]) VALUES (8, 8, 8, 1, 412)
INSERT [dbo].[ProductoBoleto] ([id_ProductoBoleto], [id_Pasajero], [iId_PrecioRuta], [CantidadDeBoletos], [Precio_BoletosFinal]) VALUES (9, 9, 8, 1, 412)
INSERT [dbo].[ProductoBoleto] ([id_ProductoBoleto], [id_Pasajero], [iId_PrecioRuta], [CantidadDeBoletos], [Precio_BoletosFinal]) VALUES (10, 10, 10, 1, 596.78)
INSERT [dbo].[Promocion] ([iIdPromocion], [dFecInicioPromocion], [dFecFinPromocion], [fPorcentajeDescto], [cGenero], [tEdadMin], [tEdadMax]) VALUES (1, CAST(N'2020-05-10' AS Date), CAST(N'2020-05-10' AS Date), 0.2, N'F', 22, 40)
INSERT [dbo].[Promocion] ([iIdPromocion], [dFecInicioPromocion], [dFecFinPromocion], [fPorcentajeDescto], [cGenero], [tEdadMin], [tEdadMax]) VALUES (2, CAST(N'2020-11-15' AS Date), CAST(N'2020-11-16' AS Date), 0.15, N'-', 5, 80)
INSERT [dbo].[Promocion] ([iIdPromocion], [dFecInicioPromocion], [dFecFinPromocion], [fPorcentajeDescto], [cGenero], [tEdadMin], [tEdadMax]) VALUES (3, CAST(N'2020-03-16' AS Date), CAST(N'2020-03-21' AS Date), 0.1, N'-', 5, 80)
INSERT [dbo].[Promocion] ([iIdPromocion], [dFecInicioPromocion], [dFecFinPromocion], [fPorcentajeDescto], [cGenero], [tEdadMin], [tEdadMax]) VALUES (4, CAST(N'2020-05-01' AS Date), CAST(N'2020-05-01' AS Date), 0.2, N'-', 5, 80)
INSERT [dbo].[Promocion] ([iIdPromocion], [dFecInicioPromocion], [dFecFinPromocion], [fPorcentajeDescto], [cGenero], [tEdadMin], [tEdadMax]) VALUES (5, CAST(N'2020-11-16' AS Date), CAST(N'2020-11-16' AS Date), 0.16, N'-', 18, 80)
INSERT [dbo].[Promocion] ([iIdPromocion], [dFecInicioPromocion], [dFecFinPromocion], [fPorcentajeDescto], [cGenero], [tEdadMin], [tEdadMax]) VALUES (8, CAST(N'2020-05-15' AS Date), CAST(N'2020-05-15' AS Date), 0.2, N'-', 5, 80)
INSERT [dbo].[Promocion] ([iIdPromocion], [dFecInicioPromocion], [dFecFinPromocion], [fPorcentajeDescto], [cGenero], [tEdadMin], [tEdadMax]) VALUES (10, CAST(N'2020-01-01' AS Date), CAST(N'2020-12-31' AS Date), 0, N'-', 5, 80)
INSERT [dbo].[RegistroDeVenta] ([id_RegistroVenta], [id_DetalleDeVenta], [CapturaVenta]) VALUES (1, 1, CAST(N'2020-04-10T10:00:00.000' AS DateTime))
INSERT [dbo].[RegistroDeVenta] ([id_RegistroVenta], [id_DetalleDeVenta], [CapturaVenta]) VALUES (2, 2, CAST(N'2020-04-16T11:00:00.000' AS DateTime))
INSERT [dbo].[RegistroDeVenta] ([id_RegistroVenta], [id_DetalleDeVenta], [CapturaVenta]) VALUES (3, 3, CAST(N'2020-04-26T12:00:00.000' AS DateTime))
INSERT [dbo].[RegistroDeVenta] ([id_RegistroVenta], [id_DetalleDeVenta], [CapturaVenta]) VALUES (4, 4, CAST(N'2020-04-13T13:00:00.000' AS DateTime))
INSERT [dbo].[RegistroDeVenta] ([id_RegistroVenta], [id_DetalleDeVenta], [CapturaVenta]) VALUES (5, 5, CAST(N'2020-04-20T13:00:00.000' AS DateTime))
INSERT [dbo].[RegistroDeVenta] ([id_RegistroVenta], [id_DetalleDeVenta], [CapturaVenta]) VALUES (6, 6, CAST(N'2020-04-22T15:00:00.000' AS DateTime))
INSERT [dbo].[RegistroDeVenta] ([id_RegistroVenta], [id_DetalleDeVenta], [CapturaVenta]) VALUES (7, 7, CAST(N'2020-04-27T16:00:00.000' AS DateTime))
INSERT [dbo].[RegistroDeVenta] ([id_RegistroVenta], [id_DetalleDeVenta], [CapturaVenta]) VALUES (8, 8, CAST(N'2020-03-17T17:00:00.000' AS DateTime))
INSERT [dbo].[RegistroDeVenta] ([id_RegistroVenta], [id_DetalleDeVenta], [CapturaVenta]) VALUES (9, 9, CAST(N'2020-04-18T18:00:00.000' AS DateTime))
INSERT [dbo].[RegistroDeVenta] ([id_RegistroVenta], [id_DetalleDeVenta], [CapturaVenta]) VALUES (10, 10, CAST(N'2020-04-29T19:00:00.000' AS DateTime))
INSERT [dbo].[Ruta] ([id_Ruta], [Origen], [Destino], [Distancia_KM]) VALUES (1, 1, 2, 5.4)
INSERT [dbo].[Ruta] ([id_Ruta], [Origen], [Destino], [Distancia_KM]) VALUES (2, 2, 3, 16.5)
INSERT [dbo].[Ruta] ([id_Ruta], [Origen], [Destino], [Distancia_KM]) VALUES (3, 3, 4, 7.9)
INSERT [dbo].[Ruta] ([id_Ruta], [Origen], [Destino], [Distancia_KM]) VALUES (4, 4, 5, 8.9)
INSERT [dbo].[Ruta] ([id_Ruta], [Origen], [Destino], [Distancia_KM]) VALUES (5, 5, 6, 30)
INSERT [dbo].[Ruta] ([id_Ruta], [Origen], [Destino], [Distancia_KM]) VALUES (6, 6, 7, 35.3)
INSERT [dbo].[Ruta] ([id_Ruta], [Origen], [Destino], [Distancia_KM]) VALUES (7, 7, 8, 15.6)
INSERT [dbo].[Ruta] ([id_Ruta], [Origen], [Destino], [Distancia_KM]) VALUES (8, 8, 9, 10.7)
INSERT [dbo].[Ruta] ([id_Ruta], [Origen], [Destino], [Distancia_KM]) VALUES (9, 9, 10, 4.8)
INSERT [dbo].[Ruta] ([id_Ruta], [Origen], [Destino], [Distancia_KM]) VALUES (10, 10, 1, 9.1)
INSERT [dbo].[Salida] ([id_Salida], [HoraSalida], [FechaSalida], [id_Camion], [id_Ruta]) VALUES (1, CAST(N'10:00:00' AS Time), CAST(N'2020-05-10' AS Date), 1, 1)
INSERT [dbo].[Salida] ([id_Salida], [HoraSalida], [FechaSalida], [id_Camion], [id_Ruta]) VALUES (2, CAST(N'11:00:00' AS Time), CAST(N'2020-05-11' AS Date), 2, 2)
INSERT [dbo].[Salida] ([id_Salida], [HoraSalida], [FechaSalida], [id_Camion], [id_Ruta]) VALUES (3, CAST(N'12:00:00' AS Time), CAST(N'2020-05-12' AS Date), 3, 3)
INSERT [dbo].[Salida] ([id_Salida], [HoraSalida], [FechaSalida], [id_Camion], [id_Ruta]) VALUES (4, CAST(N'13:00:00' AS Time), CAST(N'2020-05-13' AS Date), 4, 4)
INSERT [dbo].[Salida] ([id_Salida], [HoraSalida], [FechaSalida], [id_Camion], [id_Ruta]) VALUES (5, CAST(N'14:00:00' AS Time), CAST(N'2020-08-14' AS Date), 5, 5)
INSERT [dbo].[Salida] ([id_Salida], [HoraSalida], [FechaSalida], [id_Camion], [id_Ruta]) VALUES (6, CAST(N'15:00:00' AS Time), CAST(N'2020-06-15' AS Date), 6, 6)
INSERT [dbo].[Salida] ([id_Salida], [HoraSalida], [FechaSalida], [id_Camion], [id_Ruta]) VALUES (7, CAST(N'16:00:00' AS Time), CAST(N'2020-07-16' AS Date), 7, 7)
INSERT [dbo].[Salida] ([id_Salida], [HoraSalida], [FechaSalida], [id_Camion], [id_Ruta]) VALUES (8, CAST(N'17:00:00' AS Time), CAST(N'2020-07-17' AS Date), 8, 8)
INSERT [dbo].[Salida] ([id_Salida], [HoraSalida], [FechaSalida], [id_Camion], [id_Ruta]) VALUES (9, CAST(N'18:00:00' AS Time), CAST(N'2020-07-18' AS Date), 9, 9)
INSERT [dbo].[Salida] ([id_Salida], [HoraSalida], [FechaSalida], [id_Camion], [id_Ruta]) VALUES (10, CAST(N'19:00:00' AS Time), CAST(N'2020-08-19' AS Date), 10, 10)
INSERT [dbo].[Usuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (1, N'Ivan', N'ivam123.', N'Ivan', N'Arredondo', N'ivanarr@hotmail.com')
INSERT [dbo].[Usuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (2, N'Antonio', N'antonio123.', N'Antonio', N'Presas', N'antoniopre@hotmail.com')
INSERT [dbo].[Usuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (3, N'Luca', N'luca123.', N'Lucas', N'Gutierrez', N'lucagut@hotmail.com')
INSERT [dbo].[Usuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (4, N'Francisco', N'francisco123.', N'Francisco', N'Bernal', N'franciscober@hotmail.com')
INSERT [dbo].[Usuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (6, N'Abdiel', N'abdiel123.', N'Abdiel', N'Miranda', N'abdielmir@hotmail.com')
INSERT [dbo].[Usuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (7, N'Tomas', N'tomas123.', N'Tomas', N'Romero', N'tomasrom@hotmail.com')
INSERT [dbo].[Usuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (8, N'Jordan', N'jordan123.', N'Jordan', N'Herrera', N'jordanher@hotmail.com')
INSERT [dbo].[Usuarios] ([id_Usuario], [uUsuario], [uContraseña], [uNombre], [uApellido], [uCorreo]) VALUES (9, N'Brandon', N'brandon123.', N'Brandon', N'Oranday', N'brandongut@hotmail.com')
ALTER TABLE [dbo].[Camion]  WITH CHECK ADD  CONSTRAINT [FK_Camion_Asiento] FOREIGN KEY([id_Asiento])
REFERENCES [dbo].[Asiento] ([id_Asiento])
GO
ALTER TABLE [dbo].[Camion] CHECK CONSTRAINT [FK_Camion_Asiento]
GO
ALTER TABLE [dbo].[Camion]  WITH CHECK ADD  CONSTRAINT [FK_Camion_Chofer] FOREIGN KEY([id_Chofer])
REFERENCES [dbo].[Chofer] ([id_Chofer])
GO
ALTER TABLE [dbo].[Camion] CHECK CONSTRAINT [FK_Camion_Chofer]
GO
ALTER TABLE [dbo].[DetalleDeVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_ProductoBoleto] FOREIGN KEY([id_ProductoBoleto])
REFERENCES [dbo].[ProductoBoleto] ([id_ProductoBoleto])
GO
ALTER TABLE [dbo].[DetalleDeVenta] CHECK CONSTRAINT [FK_DetalleVenta_ProductoBoleto]
GO
ALTER TABLE [dbo].[DetalleDeVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Salida] FOREIGN KEY([id_Salida])
REFERENCES [dbo].[Salida] ([id_Salida])
GO
ALTER TABLE [dbo].[DetalleDeVenta] CHECK CONSTRAINT [FK_DetalleVenta_Salida]
GO
ALTER TABLE [dbo].[FacturaEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_Factura_ProductoBoleto] FOREIGN KEY([id_ProductoBoleto])
REFERENCES [dbo].[ProductoBoleto] ([id_ProductoBoleto])
GO
ALTER TABLE [dbo].[FacturaEncabezado] CHECK CONSTRAINT [FK_Factura_ProductoBoleto]
GO
ALTER TABLE [dbo].[FacturaEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Registro] FOREIGN KEY([id_RegistroVenta])
REFERENCES [dbo].[RegistroDeVenta] ([id_RegistroVenta])
GO
ALTER TABLE [dbo].[FacturaEncabezado] CHECK CONSTRAINT [FK_Factura_Registro]
GO
ALTER TABLE [dbo].[PrecioDeRuta]  WITH CHECK ADD  CONSTRAINT [FK_PrecioRuta_Promocion] FOREIGN KEY([iIdPromocion])
REFERENCES [dbo].[Promocion] ([iIdPromocion])
GO
ALTER TABLE [dbo].[PrecioDeRuta] CHECK CONSTRAINT [FK_PrecioRuta_Promocion]
GO
ALTER TABLE [dbo].[PrecioDeRuta]  WITH CHECK ADD  CONSTRAINT [FK_PrecioRuta_Ruta] FOREIGN KEY([id_Ruta])
REFERENCES [dbo].[Ruta] ([id_Ruta])
GO
ALTER TABLE [dbo].[PrecioDeRuta] CHECK CONSTRAINT [FK_PrecioRuta_Ruta]
GO
ALTER TABLE [dbo].[ProductoBoleto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Pasajero] FOREIGN KEY([id_Pasajero])
REFERENCES [dbo].[Pasajero] ([id_Pasajero])
GO
ALTER TABLE [dbo].[ProductoBoleto] CHECK CONSTRAINT [FK_Producto_Pasajero]
GO
ALTER TABLE [dbo].[ProductoBoleto]  WITH CHECK ADD  CONSTRAINT [FK_ProductoBoleto_PrecioRuta] FOREIGN KEY([iId_PrecioRuta])
REFERENCES [dbo].[PrecioDeRuta] ([iId_PrecioRuta])
GO
ALTER TABLE [dbo].[ProductoBoleto] CHECK CONSTRAINT [FK_ProductoBoleto_PrecioRuta]
GO
ALTER TABLE [dbo].[RegistroDeVenta]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Detalle] FOREIGN KEY([id_DetalleDeVenta])
REFERENCES [dbo].[DetalleDeVenta] ([id_DetalleDeVenta])
GO
ALTER TABLE [dbo].[RegistroDeVenta] CHECK CONSTRAINT [FK_Registro_Detalle]
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Destino] FOREIGN KEY([Destino])
REFERENCES [dbo].[MunicipiosEstados] ([id_MunicipioEstado])
GO
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Destino]
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Origen] FOREIGN KEY([Origen])
REFERENCES [dbo].[MunicipiosEstados] ([id_MunicipioEstado])
GO
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Origen]
GO
ALTER TABLE [dbo].[Salida]  WITH CHECK ADD  CONSTRAINT [FK_Salida_Camion] FOREIGN KEY([id_Camion])
REFERENCES [dbo].[Camion] ([id_Camion])
GO
ALTER TABLE [dbo].[Salida] CHECK CONSTRAINT [FK_Salida_Camion]
GO
ALTER TABLE [dbo].[Salida]  WITH CHECK ADD  CONSTRAINT [FK_Salida_Ruta] FOREIGN KEY([id_Ruta])
REFERENCES [dbo].[Ruta] ([id_Ruta])
GO
ALTER TABLE [dbo].[Salida] CHECK CONSTRAINT [FK_Salida_Ruta]
GO
USE [master]
GO
ALTER DATABASE [BaseDeDatos_1847391] SET  READ_WRITE 
GO
