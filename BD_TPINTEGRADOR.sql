USE [master]
GO
/****** Object:  Database [Tp_integrador]    Script Date: 22/11/2024 08:47:08 ******/
CREATE DATABASE [Tp_integrador]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tp_integrador', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Tp_integrador.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tp_integrador_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Tp_integrador_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Tp_integrador] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tp_integrador].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tp_integrador] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tp_integrador] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tp_integrador] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tp_integrador] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tp_integrador] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tp_integrador] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tp_integrador] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tp_integrador] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tp_integrador] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tp_integrador] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tp_integrador] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tp_integrador] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tp_integrador] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tp_integrador] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tp_integrador] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tp_integrador] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tp_integrador] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tp_integrador] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tp_integrador] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tp_integrador] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tp_integrador] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tp_integrador] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tp_integrador] SET RECOVERY FULL 
GO
ALTER DATABASE [Tp_integrador] SET  MULTI_USER 
GO
ALTER DATABASE [Tp_integrador] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tp_integrador] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tp_integrador] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tp_integrador] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tp_integrador] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tp_integrador', N'ON'
GO
ALTER DATABASE [Tp_integrador] SET QUERY_STORE = OFF
GO
USE [Tp_integrador]
GO
/****** Object:  User [alumno]    Script Date: 22/11/2024 08:47:08 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[COMUNIDAD]    Script Date: 22/11/2024 08:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMUNIDAD](
	[idComunidad] [int] NOT NULL,
	[materia] [varchar](50) NULL,
	[anioSecundaria] [int] NULL,
	[idAlumno] [int] NULL,
	[texto] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[idComunidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CURSOS]    Script Date: 22/11/2024 08:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURSOS](
	[idCurso] [int] NOT NULL,
	[precio] [decimal](10, 2) NULL,
	[metodoPago] [varchar](50) NULL,
	[idProfesor] [int] NULL,
	[materia] [varchar](50) NULL,
	[anioSecundaria] [int] NULL,
	[valoracion] [decimal](3, 2) NULL,
	[cantAlumnos] [int] NULL,
	[cantCursos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAGOS]    Script Date: 22/11/2024 08:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAGOS](
	[idPago] [int] NOT NULL,
	[idAlumno] [int] NULL,
	[idCurso] [int] NULL,
	[fechaPago] [date] NULL,
	[metodoPago] [varchar](50) NULL,
	[monto] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PREGUNTAS]    Script Date: 22/11/2024 08:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PREGUNTAS](
	[idPregunta] [int] NOT NULL,
	[idAlumno] [int] NULL,
	[materia] [varchar](50) NULL,
	[anioSecundaria] [int] NULL,
	[pregunta] [text] NULL,
	[fechaPregunta] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROFESORES]    Script Date: 22/11/2024 08:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFESORES](
	[idProfesor] [int] NOT NULL,
	[materia] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[valoracion] [decimal](3, 2) NULL,
	[busquedas] [int] NULL,
	[cantCursos] [int] NULL,
	[cantAlumnos] [int] NULL,
	[experiencia] [int] NULL,
	[fotoPerfil] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESEÑAS]    Script Date: 22/11/2024 08:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESEÑAS](
	[idResena] [int] NOT NULL,
	[idAlumno] [int] NULL,
	[texto] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[idResena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESPUESTAS]    Script Date: 22/11/2024 08:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESPUESTAS](
	[idRespuesta] [int] NOT NULL,
	[idPregunta] [int] NULL,
	[respuesta] [text] NULL,
	[fechaRespuesta] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 22/11/2024 08:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[idAlumno] [int] IDENTITY(1,1) NOT NULL,
	[fechaNacimiento] [date] NULL,
	[nombre] [varchar](50) NULL,
	[genero] [char](1) NULL,
	[anioSecundaria] [int] NULL,
	[userName] [varchar](50) NULL,
	[contraseña] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[telefono] [varchar](15) NULL,
	[edad] [int] NULL,
	[fotoPerfil] [varchar](1000) NULL,
 CONSTRAINT [PK__USUARIOS__43FBBAC72FB6EDDD] PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO_CURSOS]    Script Date: 22/11/2024 08:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO_CURSOS](
	[idAlumno] [int] NOT NULL,
	[idCurso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC,
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VALORACIONES]    Script Date: 22/11/2024 08:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VALORACIONES](
	[idValoracion] [int] NOT NULL,
	[idCurso] [int] NULL,
	[idAlumno] [int] NULL,
	[calificacion] [decimal](3, 2) NULL,
	[comentario] [text] NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idValoracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[PROFESORES] ([idProfesor], [materia], [nombre], [valoracion], [busquedas], [cantCursos], [cantAlumnos], [experiencia], [fotoPerfil]) VALUES (1, N'Biología', N'Jhon de la Cruz', CAST(4.20 AS Decimal(3, 2)), NULL, 7, 23, NULL, N'/images/jhon.jpg')
INSERT [dbo].[PROFESORES] ([idProfesor], [materia], [nombre], [valoracion], [busquedas], [cantCursos], [cantAlumnos], [experiencia], [fotoPerfil]) VALUES (2, N'Matemáticas', N'Leandro Kim', CAST(4.70 AS Decimal(3, 2)), NULL, 5, 14, NULL, N'/images/leandro.jpg')
INSERT [dbo].[PROFESORES] ([idProfesor], [materia], [nombre], [valoracion], [busquedas], [cantCursos], [cantAlumnos], [experiencia], [fotoPerfil]) VALUES (3, N'Física', N'Juan Gutierrez', CAST(2.20 AS Decimal(3, 2)), NULL, 2, 8, NULL, N'/images/juan.jpg')
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([idAlumno], [fechaNacimiento], [nombre], [genero], [anioSecundaria], [userName], [contraseña], [email], [telefono], [edad], [fotoPerfil]) VALUES (0, NULL, N'Santiago', NULL, NULL, N'santimuhafraUwU', N'sanlorenzo', N'santi@gmail.com', N'11113333', 21, NULL)
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[COMUNIDAD]  WITH CHECK ADD  CONSTRAINT [FK__COMUNIDAD__idAlu__47DBAE45] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[USUARIO] ([idAlumno])
GO
ALTER TABLE [dbo].[COMUNIDAD] CHECK CONSTRAINT [FK__COMUNIDAD__idAlu__47DBAE45]
GO
ALTER TABLE [dbo].[CURSOS]  WITH CHECK ADD FOREIGN KEY([idProfesor])
REFERENCES [dbo].[PROFESORES] ([idProfesor])
GO
ALTER TABLE [dbo].[PAGOS]  WITH CHECK ADD  CONSTRAINT [FK__PAGOS__idAlumno__49C3F6B7] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[USUARIO] ([idAlumno])
GO
ALTER TABLE [dbo].[PAGOS] CHECK CONSTRAINT [FK__PAGOS__idAlumno__49C3F6B7]
GO
ALTER TABLE [dbo].[PAGOS]  WITH CHECK ADD FOREIGN KEY([idCurso])
REFERENCES [dbo].[CURSOS] ([idCurso])
GO
ALTER TABLE [dbo].[PREGUNTAS]  WITH CHECK ADD  CONSTRAINT [FK__PREGUNTAS__idAlu__4BAC3F29] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[USUARIO] ([idAlumno])
GO
ALTER TABLE [dbo].[PREGUNTAS] CHECK CONSTRAINT [FK__PREGUNTAS__idAlu__4BAC3F29]
GO
ALTER TABLE [dbo].[RESEÑAS]  WITH CHECK ADD  CONSTRAINT [FK__RESEÑAS__idAlumn__4CA06362] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[USUARIO] ([idAlumno])
GO
ALTER TABLE [dbo].[RESEÑAS] CHECK CONSTRAINT [FK__RESEÑAS__idAlumn__4CA06362]
GO
ALTER TABLE [dbo].[RESPUESTAS]  WITH CHECK ADD FOREIGN KEY([idPregunta])
REFERENCES [dbo].[PREGUNTAS] ([idPregunta])
GO
ALTER TABLE [dbo].[USUARIO_CURSOS]  WITH CHECK ADD FOREIGN KEY([idCurso])
REFERENCES [dbo].[CURSOS] ([idCurso])
GO
ALTER TABLE [dbo].[USUARIO_CURSOS]  WITH CHECK ADD  CONSTRAINT [FK__USUARIOS___idAlu__4E88ABD4] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[USUARIO] ([idAlumno])
GO
ALTER TABLE [dbo].[USUARIO_CURSOS] CHECK CONSTRAINT [FK__USUARIOS___idAlu__4E88ABD4]
GO
ALTER TABLE [dbo].[VALORACIONES]  WITH CHECK ADD  CONSTRAINT [FK__VALORACIO__idAlu__5070F446] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[USUARIO] ([idAlumno])
GO
ALTER TABLE [dbo].[VALORACIONES] CHECK CONSTRAINT [FK__VALORACIO__idAlu__5070F446]
GO
ALTER TABLE [dbo].[VALORACIONES]  WITH CHECK ADD FOREIGN KEY([idCurso])
REFERENCES [dbo].[CURSOS] ([idCurso])
GO
USE [master]
GO
ALTER DATABASE [Tp_integrador] SET  READ_WRITE 
GO
