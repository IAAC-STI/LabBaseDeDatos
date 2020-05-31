USE [master]
GO
/****** Object:  Database [LBD]    Script Date: 30/05/2020 09:51:16 p. m. ******/
CREATE DATABASE [LBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [LBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LBD] SET  MULTI_USER 
GO
ALTER DATABASE [LBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LBD] SET QUERY_STORE = OFF
GO
USE [LBD]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 30/05/2020 09:51:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[id_Curso] [uniqueidentifier] NOT NULL,
	[NomCurso] [varchar](30) NOT NULL,
	[integrantes] [int] NOT NULL,
	[InfoCurso]  AS (([NomCurso]+'  ')+[integrantes]),
	[id_Tutoria] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FIFA]    Script Date: 30/05/2020 09:51:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FIFA](
	[id_Jugador] [uniqueidentifier] NOT NULL,
	[Nombre_Jugador] [varchar](25) NOT NULL,
	[Apellido_Jugador] [varchar](25) NOT NULL,
	[Posicion] [varchar](10) NOT NULL,
	[Club] [varchar](25) NOT NULL,
	[informacionConcatenada]  AS (((((([Nombre_Jugador]+' ')+[Apellido_Jugador])+' Club: ')+[Club])+' Posicion: ')+[Posicion]),
	[cantidades] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Jugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 30/05/2020 09:51:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[id_Profesor] [uniqueidentifier] NOT NULL,
	[NombreCom] [varchar](50) NOT NULL,
	[Direccion] [varchar](40) NOT NULL,
	[Ciudad] [varchar](15) NOT NULL,
	[CodPostal] [int] NOT NULL,
	[Matricula_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table1]    Script Date: 30/05/2020 09:51:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table1](
	[Matricula_id] [uniqueidentifier] NOT NULL,
	[NombreCompleto] [varchar](50) NOT NULL,
	[Carrera] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Matricula_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tutorias]    Script Date: 30/05/2020 09:51:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutorias](
	[id_Tutoria] [uniqueidentifier] NOT NULL,
	[Profesor] [varchar](30) NOT NULL,
	[DiaSemana] [varchar](9) NOT NULL,
	[HoraTutoria] [time](7) NOT NULL,
	[id_Profesor] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Tutoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Profesor]    Script Date: 30/05/2020 09:51:17 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Profesor] ON [dbo].[Profesores]
(
	[NombreCom] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indx_Matricula]    Script Date: 30/05/2020 09:51:17 p. m. ******/
CREATE NONCLUSTERED INDEX [indx_Matricula] ON [dbo].[Table1]
(
	[Matricula_id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Tutorias] FOREIGN KEY([id_Tutoria])
REFERENCES [dbo].[tutorias] ([id_Tutoria])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_Tutorias]
GO
ALTER TABLE [dbo].[Profesores]  WITH CHECK ADD  CONSTRAINT [FK_Profesores_Matricula] FOREIGN KEY([Matricula_id])
REFERENCES [dbo].[Table1] ([Matricula_id])
GO
ALTER TABLE [dbo].[Profesores] CHECK CONSTRAINT [FK_Profesores_Matricula]
GO
ALTER TABLE [dbo].[tutorias]  WITH CHECK ADD  CONSTRAINT [FK_tutorias_Profesor_id] FOREIGN KEY([id_Profesor])
REFERENCES [dbo].[Profesores] ([id_Profesor])
GO
ALTER TABLE [dbo].[tutorias] CHECK CONSTRAINT [FK_tutorias_Profesor_id]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD CHECK  (([integrantes]>(0) AND [integrantes]<(51)))
GO
ALTER TABLE [dbo].[FIFA]  WITH CHECK ADD CHECK  (([cantidades]>(1000)))
GO
ALTER TABLE [dbo].[Profesores]  WITH CHECK ADD CHECK  (([CodPostal]>(0) AND [CodPostal]<(60000)))
GO
USE [master]
GO
ALTER DATABASE [LBD] SET  READ_WRITE 
GO
