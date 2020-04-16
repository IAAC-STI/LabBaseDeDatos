USE [master]
GO
/****** Object:  Database [IVAN_BD]    Script Date: 15/04/2020 12:28:50 a. m. ******/
CREATE DATABASE [IVAN_BD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IVAN_BD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\IVAN_BD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IVAN_BD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\IVAN_BD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IVAN_BD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IVAN_BD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IVAN_BD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IVAN_BD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IVAN_BD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IVAN_BD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IVAN_BD] SET ARITHABORT OFF 
GO
ALTER DATABASE [IVAN_BD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [IVAN_BD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IVAN_BD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IVAN_BD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IVAN_BD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IVAN_BD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IVAN_BD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IVAN_BD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IVAN_BD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IVAN_BD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IVAN_BD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IVAN_BD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IVAN_BD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IVAN_BD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IVAN_BD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IVAN_BD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IVAN_BD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IVAN_BD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IVAN_BD] SET  MULTI_USER 
GO
ALTER DATABASE [IVAN_BD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IVAN_BD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IVAN_BD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IVAN_BD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IVAN_BD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IVAN_BD] SET QUERY_STORE = OFF
GO
USE [IVAN_BD]
GO
/****** Object:  Table [dbo].[Asiento]    Script Date: 15/04/2020 12:28:51 a. m. ******/
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
/****** Object:  Table [dbo].[Camion]    Script Date: 15/04/2020 12:28:51 a. m. ******/
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
/****** Object:  Table [dbo].[Chofer]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chofer](
	[id_Chofer] [int] NOT NULL,
	[cNombre] [varchar](20) NOT NULL,
	[cEdad] [int] NOT NULL,
	[cTelefono] [bigint] NOT NULL,
	[cLicencia] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Chofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_Cliente] [int] NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](16) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Correo] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuento]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descuento](
	[id_Descuento] [int] NOT NULL,
	[descripcion] [varchar](10) NOT NULL,
	[porcentaje] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Descuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[id_Destino] [int] NOT NULL,
	[CiduadDestino] [varchar](25) NOT NULL,
	[EstadoDestino] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleDeVenta]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleDeVenta](
	[id_DetalleDeVenta] [int] NOT NULL,
	[id_Venta] [int] NOT NULL,
	[id_Pasajero] [int] NOT NULL,
	[id_Viaje] [int] NOT NULL,
	[id_ProdBoleto] [int] NOT NULL,
	[FormaDePago] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_DetalleDeVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Origen]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Origen](
	[id_Origen] [int] NOT NULL,
	[CiduadOrigen] [varchar](25) NOT NULL,
	[EstadoOrigen] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Origen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajero](
	[id_Pasajero] [int] NOT NULL,
	[pNombre] [varchar](30) NOT NULL,
	[pCorreo] [varchar](30) NOT NULL,
	[pTelefono] [bigint] NOT NULL,
	[pNacionalidad] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Pasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Precio]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precio](
	[id_Precio] [int] NOT NULL,
	[id_Ruta] [int] NOT NULL,
	[id_Descuento] [int] NOT NULL,
	[Precio_Total_Viaje] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Precio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoBoleto]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoBoleto](
	[id_ProdBoleto] [int] NOT NULL,
	[Cantidad_Boletos] [tinyint] NOT NULL,
	[id_Precio] [int] NOT NULL,
	[PrecioFinal] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ProdBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistoDeVenta]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistoDeVenta](
	[id_Venta] [int] NOT NULL,
	[Precio_Venta] [int] NOT NULL,
	[Fecha_Venta] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ruta](
	[id_Ruta] [int] NOT NULL,
	[id_Origen] [int] NOT NULL,
	[id_Destino] [int] NOT NULL,
	[Distancia_KM] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salida]    Script Date: 15/04/2020 12:28:51 a. m. ******/
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
/****** Object:  Table [dbo].[Viaje]    Script Date: 15/04/2020 12:28:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viaje](
	[id_Viaje] [int] NOT NULL,
	[id_Salida] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Viaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (11, N'B', 1)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (12, N'B', 2)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (13, N'B', 3)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (14, N'B', 4)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (15, N'B', 5)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (16, N'C', 1)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (17, N'C', 2)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (18, N'C', 3)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (19, N'C', 4)
INSERT [dbo].[Asiento] ([id_Asiento], [letra], [fila]) VALUES (20, N'C', 5)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (1, 10, 11)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (2, 9, 12)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (3, 8, 13)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (4, 7, 14)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (5, 6, 15)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (6, 5, 16)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (7, 4, 17)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (8, 3, 18)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (9, 1, 19)
INSERT [dbo].[Camion] ([id_Camion], [id_Chofer], [id_Asiento]) VALUES (10, 10, 20)
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (1, N'Chaps', 25, 8126431680, N'A2')
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (2, N'Jose Alfredo', 30, 8131912855, N'A')
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (3, N'Matias Almeida', 29, 812352346, N'A')
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (4, N'Ronaldinho', 40, 8119826222, N'A')
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (5, N'Juan Perez', 34, 8109873689, N'A')
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (6, N'Rodilla de Bronce', 26, 8134209740, N'A')
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (7, N'Crash Nebula', 20, 8123451680, N'A')
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (8, N'Silvester Stalone', 21, 8122346680, N'A')
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (9, N'Humberto Suazo', 22, 8192323689, N'A')
INSERT [dbo].[Chofer] ([id_Chofer], [cNombre], [cEdad], [cTelefono], [cLicencia]) VALUES (10, N'Zacarias Tercero', 45, 8132463221, N'A')
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (2, N'Spencer', N'ASDFGSADH', N'Spencer Shay', N'asdfghjkl@gmail.com')
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (6, N'Zlatan', N'SERYHTERG.', N'Zlatan Ibahimovic', N'Ibrahimovic@Zlatan.com')
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (7, N'JUANPI', N'YRTY34543T', N'Hercules Quintanilla', N'Elanodadado@gmail.com')
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (8, N'JAIME', N'54THYU654RTH', N'Juan Tevez', N'JuanSoto@gmail.com')
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (9, N'JOSEALFREDO', N'45WTQWWSDAS', N'Jose Alfredo', N'JOSEALFREDVINTAGE@gmail.com')
INSERT [dbo].[Cliente] ([id_Cliente], [Usuario], [Contraseña], [Nombre], [Correo]) VALUES (10, N'GUDIÑO', N'ERTHFTHHER', N'Lucas Guidiño', N'LUCASGUDIÑO123@gmail.com')
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (1, N'NIÑO', 0.2)
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (2, N'ADULTO', 0.3)
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (3, N'EFECTIVO', 0)
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (4, N'VACACIONES', 0.1)
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (5, N'COVID-19', 0.5)
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (6, N'GOLD', 0.45)
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (7, N'VIP', 0.6)
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (8, N'Invierno', 0.5)
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (9, N'PREMIUM', 0.08)
INSERT [dbo].[Descuento] ([id_Descuento], [descripcion], [porcentaje]) VALUES (10, N'IVA', 0.16)
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (1, N'Monterrey', N'Nuevo Leon')
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (2, N'Guanajuato', N'Guanajuato')
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (3, N'Aguascalientes', N'Aguascalientes')
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (4, N'Hermosillo', N'Sonora')
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (5, N'Saltillo', N'Coahuila')
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (6, N'Zacatecas', N'Zacatecas')
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (7, N'Tampico', N'Tamaulipas')
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (8, N'Mazatlan', N'Sonora')
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (9, N'Cancún', N'Quintana Roo')
INSERT [dbo].[Destino] ([id_Destino], [CiduadDestino], [EstadoDestino]) VALUES (10, N'Ecatepec', N'Estado de Mexico')
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (11, N'Monterrey', N'Nuevo Leon')
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (12, N'Guanajuato', N'Guanajuato')
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (13, N'Aguascalientes', N'Aguascalientes')
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (14, N'Hermosillo', N'Sonora')
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (15, N'Saltillo', N'Coahuila')
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (16, N'Zacatecas', N'Zacatecas')
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (17, N'Tampico', N'Tamaulipas')
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (18, N'Mazatlan', N'Sinaloa')
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (19, N'Cancún', N'Quintana Roo')
INSERT [dbo].[Origen] ([id_Origen], [CiduadOrigen], [EstadoOrigen]) VALUES (20, N'Ecatepec', N'Estado de Mexico')
INSERT [dbo].[Precio] ([id_Precio], [id_Ruta], [id_Descuento], [Precio_Total_Viaje]) VALUES (1, 10, 9, 500.9)
INSERT [dbo].[Precio] ([id_Precio], [id_Ruta], [id_Descuento], [Precio_Total_Viaje]) VALUES (2, 9, 6, 700)
INSERT [dbo].[Precio] ([id_Precio], [id_Ruta], [id_Descuento], [Precio_Total_Viaje]) VALUES (3, 9, 4, 245.8)
INSERT [dbo].[Precio] ([id_Precio], [id_Ruta], [id_Descuento], [Precio_Total_Viaje]) VALUES (4, 6, 2, 534.23)
INSERT [dbo].[Precio] ([id_Precio], [id_Ruta], [id_Descuento], [Precio_Total_Viaje]) VALUES (5, 5, 10, 234.64)
INSERT [dbo].[Precio] ([id_Precio], [id_Ruta], [id_Descuento], [Precio_Total_Viaje]) VALUES (6, 4, 7, 400)
INSERT [dbo].[Precio] ([id_Precio], [id_Ruta], [id_Descuento], [Precio_Total_Viaje]) VALUES (7, 4, 8, 536)
INSERT [dbo].[Precio] ([id_Precio], [id_Ruta], [id_Descuento], [Precio_Total_Viaje]) VALUES (8, 4, 5, 643.64)
INSERT [dbo].[Precio] ([id_Precio], [id_Ruta], [id_Descuento], [Precio_Total_Viaje]) VALUES (9, 3, 3, 200)
INSERT [dbo].[Precio] ([id_Precio], [id_Ruta], [id_Descuento], [Precio_Total_Viaje]) VALUES (10, 3, 1, 796.78)
INSERT [dbo].[ProductoBoleto] ([id_ProdBoleto], [Cantidad_Boletos], [id_Precio], [PrecioFinal]) VALUES (2, 1, 2, 700)
INSERT [dbo].[ProductoBoleto] ([id_ProdBoleto], [Cantidad_Boletos], [id_Precio], [PrecioFinal]) VALUES (3, 1, 3, 245.8)
INSERT [dbo].[ProductoBoleto] ([id_ProdBoleto], [Cantidad_Boletos], [id_Precio], [PrecioFinal]) VALUES (4, 1, 4, 534.23)
INSERT [dbo].[ProductoBoleto] ([id_ProdBoleto], [Cantidad_Boletos], [id_Precio], [PrecioFinal]) VALUES (5, 1, 5, 234.64)
INSERT [dbo].[ProductoBoleto] ([id_ProdBoleto], [Cantidad_Boletos], [id_Precio], [PrecioFinal]) VALUES (6, 1, 6, 123.32)
INSERT [dbo].[ProductoBoleto] ([id_ProdBoleto], [Cantidad_Boletos], [id_Precio], [PrecioFinal]) VALUES (7, 1, 7, 536)
INSERT [dbo].[ProductoBoleto] ([id_ProdBoleto], [Cantidad_Boletos], [id_Precio], [PrecioFinal]) VALUES (8, 1, 8, 643.64)
INSERT [dbo].[ProductoBoleto] ([id_ProdBoleto], [Cantidad_Boletos], [id_Precio], [PrecioFinal]) VALUES (9, 1, 9, 231.45)
INSERT [dbo].[ProductoBoleto] ([id_ProdBoleto], [Cantidad_Boletos], [id_Precio], [PrecioFinal]) VALUES (10, 1, 10, 796.78)
INSERT [dbo].[ProductoBoleto] ([id_ProdBoleto], [Cantidad_Boletos], [id_Precio], [PrecioFinal]) VALUES (11, 1, 1, 500.9)
INSERT [dbo].[Ruta] ([id_Ruta], [id_Origen], [id_Destino], [Distancia_KM]) VALUES (1, 11, 10, 5.4)
INSERT [dbo].[Ruta] ([id_Ruta], [id_Origen], [id_Destino], [Distancia_KM]) VALUES (2, 12, 9, 16.5)
INSERT [dbo].[Ruta] ([id_Ruta], [id_Origen], [id_Destino], [Distancia_KM]) VALUES (3, 13, 8, 7.9)
INSERT [dbo].[Ruta] ([id_Ruta], [id_Origen], [id_Destino], [Distancia_KM]) VALUES (4, 14, 7, 8.9)
INSERT [dbo].[Ruta] ([id_Ruta], [id_Origen], [id_Destino], [Distancia_KM]) VALUES (5, 15, 6, 30)
INSERT [dbo].[Ruta] ([id_Ruta], [id_Origen], [id_Destino], [Distancia_KM]) VALUES (6, 16, 5, 35.3)
INSERT [dbo].[Ruta] ([id_Ruta], [id_Origen], [id_Destino], [Distancia_KM]) VALUES (7, 17, 4, 15.6)
INSERT [dbo].[Ruta] ([id_Ruta], [id_Origen], [id_Destino], [Distancia_KM]) VALUES (8, 18, 3, 10.7)
INSERT [dbo].[Ruta] ([id_Ruta], [id_Origen], [id_Destino], [Distancia_KM]) VALUES (9, 19, 2, 4.8)
INSERT [dbo].[Ruta] ([id_Ruta], [id_Origen], [id_Destino], [Distancia_KM]) VALUES (10, 20, 1, 9.1)
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
ALTER TABLE [dbo].[DetalleDeVenta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Pasajero] FOREIGN KEY([id_Pasajero])
REFERENCES [dbo].[Pasajero] ([id_Pasajero])
GO
ALTER TABLE [dbo].[DetalleDeVenta] CHECK CONSTRAINT [FK_Detalle_Pasajero]
GO
ALTER TABLE [dbo].[DetalleDeVenta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_ProdBoleto] FOREIGN KEY([id_ProdBoleto])
REFERENCES [dbo].[ProductoBoleto] ([id_ProdBoleto])
GO
ALTER TABLE [dbo].[DetalleDeVenta] CHECK CONSTRAINT [FK_Detalle_ProdBoleto]
GO
ALTER TABLE [dbo].[DetalleDeVenta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Venta] FOREIGN KEY([id_Venta])
REFERENCES [dbo].[RegistoDeVenta] ([id_Venta])
GO
ALTER TABLE [dbo].[DetalleDeVenta] CHECK CONSTRAINT [FK_Detalle_Venta]
GO
ALTER TABLE [dbo].[DetalleDeVenta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Viaje] FOREIGN KEY([id_Viaje])
REFERENCES [dbo].[Viaje] ([id_Viaje])
GO
ALTER TABLE [dbo].[DetalleDeVenta] CHECK CONSTRAINT [FK_Detalle_Viaje]
GO
ALTER TABLE [dbo].[Precio]  WITH CHECK ADD  CONSTRAINT [FK_Precio_Descuento] FOREIGN KEY([id_Descuento])
REFERENCES [dbo].[Descuento] ([id_Descuento])
GO
ALTER TABLE [dbo].[Precio] CHECK CONSTRAINT [FK_Precio_Descuento]
GO
ALTER TABLE [dbo].[Precio]  WITH CHECK ADD  CONSTRAINT [FK_Precio_Ruta] FOREIGN KEY([id_Ruta])
REFERENCES [dbo].[Ruta] ([id_Ruta])
GO
ALTER TABLE [dbo].[Precio] CHECK CONSTRAINT [FK_Precio_Ruta]
GO
ALTER TABLE [dbo].[ProductoBoleto]  WITH CHECK ADD  CONSTRAINT [FK_ProductoBoleto_Precio] FOREIGN KEY([id_Precio])
REFERENCES [dbo].[Precio] ([id_Precio])
GO
ALTER TABLE [dbo].[ProductoBoleto] CHECK CONSTRAINT [FK_ProductoBoleto_Precio]
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Destino] FOREIGN KEY([id_Destino])
REFERENCES [dbo].[Destino] ([id_Destino])
GO
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Destino]
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Origen] FOREIGN KEY([id_Origen])
REFERENCES [dbo].[Origen] ([id_Origen])
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
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Salida] FOREIGN KEY([id_Salida])
REFERENCES [dbo].[Salida] ([id_Salida])
GO
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_Salida]
GO
USE [master]
GO
ALTER DATABASE [IVAN_BD] SET  READ_WRITE 
GO
