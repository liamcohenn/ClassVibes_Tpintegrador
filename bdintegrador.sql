﻿
USE [master]
GO
/****** Object:  Database [Tp_integrador]    Script Date: 4/12/2024 12:18:25 ******/
CREATE DATABASE [Tp_integrador]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tp_integrador', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Tp_integrador.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tp_integrador_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Tp_integrador_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [Tp_integrador] SET RECOVERY SIMPLE 
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
ALTER DATABASE [Tp_integrador] SET QUERY_STORE = OFF
GO
USE [Tp_integrador]
GO
/****** Object:  Table [dbo].[CURSOS]    Script Date: 4/12/2024 12:18:25 ******/
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
	[fotoCurso] [varchar](1000) NULL,
	[Descripcion] [varchar](500) NULL,
	[Nombre] [varchar](50) NULL,
	[videoCurso] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAGOS]    Script Date: 4/12/2024 12:18:25 ******/
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
/****** Object:  Table [dbo].[PREGUNTAS]    Script Date: 4/12/2024 12:18:25 ******/
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
/****** Object:  Table [dbo].[PROFESORES]    Script Date: 4/12/2024 12:18:25 ******/
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
/****** Object:  Table [dbo].[RESEÑAS]    Script Date: 4/12/2024 12:18:25 ******/
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
/****** Object:  Table [dbo].[RESPUESTAS]    Script Date: 4/12/2024 12:18:25 ******/
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
/****** Object:  Table [dbo].[USUARIO]    Script Date: 4/12/2024 12:18:25 ******/
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
/****** Object:  Table [dbo].[USUARIO_CURSOS]    Script Date: 4/12/2024 12:18:25 ******/
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
/****** Object:  Table [dbo].[VALORACIONES]    Script Date: 4/12/2024 12:18:25 ******/
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
INSERT [dbo].[CURSOS] ([idCurso], [precio], [metodoPago], [idProfesor], [materia], [anioSecundaria], [valoracion], [cantAlumnos], [cantCursos], [fotoCurso], [Descripcion], [Nombre], [videoCurso]) VALUES (1, CAST(1.30 AS Decimal(10, 2)), NULL, 1, N'Matematica', 5, CAST(5.00 AS Decimal(3, 2)), NULL, NULL, N'https://i.ytimg.com/vi/kqpBIYOLpTo/maxresdefault.jpg', N'Aprende a dominar los logaritmos y su aplicación en diferentes áreas matemáticas. En este curso, te explicaremos paso a paso cómo funcionan, cómo resolver ecuaciones logarítmicas y cómo utilizar las propiedades de los logaritmos para simplificar problemas complejos.', N'Curso de logaritmos', N'https://www.youtube.com/watch?v=kqpBIYOLpTo')
INSERT [dbo].[CURSOS] ([idCurso], [precio], [metodoPago], [idProfesor], [materia], [anioSecundaria], [valoracion], [cantAlumnos], [cantCursos], [fotoCurso], [Descripcion], [Nombre], [videoCurso]) VALUES (2, CAST(1.00 AS Decimal(10, 2)), NULL, 2, N'Matematica', 4, CAST(3.90 AS Decimal(3, 2)), NULL, NULL, N'https://i.ytimg.com/vi/tXpPxyrtByc/maxresdefault.jpg', N'¿Te confunden las fracciones? Este curso te ayudará a entender y dominar las operaciones con fracciones, desde las más básicas hasta la simplificación y amplificación de fracciones complejas. Explicaciones claras y ejercicios prácticos en vivo para que nunca más tengas problemas con las fracciones.', N'Curso de fracciones', N'https://www.youtube.com/watch?v=tXpPxyrtByc ')
INSERT [dbo].[CURSOS] ([idCurso], [precio], [metodoPago], [idProfesor], [materia], [anioSecundaria], [valoracion], [cantAlumnos], [cantCursos], [fotoCurso], [Descripcion], [Nombre], [videoCurso]) VALUES (3, CAST(1.20 AS Decimal(10, 2)), NULL, 3, N'Fisica', 5, CAST(4.10 AS Decimal(3, 2)), NULL, NULL, N'https://i.ytimg.com/vi/4DUTOokgNU0/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBgAwjVYrUJaPXHukY17nN6BeT96w', N'Todo lo que necesitas saber sobre el tiro oblicuo, explicado de manera sencilla y detallada. Aprenderás las leyes que rigen este tipo de movimiento, cómo calcular ángulos, distancias y tiempos, y resolver problemas complejos con facilidad.', N'Curso de tiro oblicuo', N'https://www.youtube.com/watch?v=4DUTOokgNU0')
GO
INSERT [dbo].[PROFESORES] ([idProfesor], [materia], [nombre], [valoracion], [busquedas], [cantCursos], [cantAlumnos], [experiencia], [fotoPerfil]) VALUES (1, N'Biología', N'Jhon de la Cruz', CAST(4.20 AS Decimal(3, 2)), NULL, 7, 23, NULL, N'https://www.famousbirthdays.com/faces/de-la-cruz-jh-image.jpg')
INSERT [dbo].[PROFESORES] ([idProfesor], [materia], [nombre], [valoracion], [busquedas], [cantCursos], [cantAlumnos], [experiencia], [fotoPerfil]) VALUES (2, N'Matemáticas', N'Leandro Kim', CAST(4.70 AS Decimal(3, 2)), NULL, 5, 14, NULL, N'https://i.ytimg.com/vi/n6Hwyq50YWc/hqdefault.jpg?sqp=-oaymwFACKgBEF5IWvKriqkDMwgBFQAAiEIYAdgBAeIBCggYEAIYBjgBQAHwAQH4Af4JgALQBYoCDAgAEAEYZSBPKEwwDw==&rs=AOn4CLBTSVtIESsYhN-Ha7aLZcrvF1GCXw')
INSERT [dbo].[PROFESORES] ([idProfesor], [materia], [nombre], [valoracion], [busquedas], [cantCursos], [cantAlumnos], [experiencia], [fotoPerfil]) VALUES (3, N'Física', N'Juan Gutierrez', CAST(2.20 AS Decimal(3, 2)), NULL, 2, 8, NULL, N'https://miprofeclases.org.pe/wp-content/uploads/2020/03/profe-fisica-2.jpg')
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([idAlumno], [fechaNacimiento], [nombre], [genero], [anioSecundaria], [userName], [contraseña], [email], [telefono], [edad], [fotoPerfil]) VALUES (0, NULL, N'Santiago', NULL, NULL, N'santimuhafraUwU', N'sanlorenzo', N'santi@gmail.com', N'11113333', 21, NULL)
INSERT [dbo].[USUARIO] ([idAlumno], [fechaNacimiento], [nombre], [genero], [anioSecundaria], [userName], [contraseña], [email], [telefono], [edad], [fotoPerfil]) VALUES (1, NULL, N'Liam Cohen', NULL, NULL, N'liamcohen08', N'river91218', N'liamcohen08@gmail.com', N'11112222', 16, NULL)
INSERT [dbo].[USUARIO] ([idAlumno], [fechaNacimiento], [nombre], [genero], [anioSecundaria], [userName], [contraseña], [email], [telefono], [edad], [fotoPerfil]) VALUES (2, NULL, N'riverplate', NULL, NULL, N'river2018', N'martinez3!!', N'river@gmail.com', N'11113333', 16, NULL)
INSERT [dbo].[USUARIO] ([idAlumno], [fechaNacimiento], [nombre], [genero], [anioSecundaria], [userName], [contraseña], [email], [telefono], [edad], [fotoPerfil]) VALUES (3, NULL, N'Agustin No', NULL, NULL, N'agusno', N'coreadelsur', N'agus@gmail.com', N'33334444', 16, NULL)
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
