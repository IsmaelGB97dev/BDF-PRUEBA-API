USE [master]
GO
/****** Object:  Database [Test]    Script Date: 28/11/2023 02:09:35 ******/
CREATE DATABASE [Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test] SET RECOVERY FULL 
GO
ALTER DATABASE [Test] SET  MULTI_USER 
GO
ALTER DATABASE [Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Test', N'ON'
GO
ALTER DATABASE [Test] SET QUERY_STORE = OFF
GO
USE [Test]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[numeroIdentificacion] [varchar](50) NOT NULL,
	[idTipoIdentificacion] [int] NOT NULL,
	[primerNombre] [varchar](50) NOT NULL,
	[segundoNombre] [varchar](50) NULL,
	[primerApellido] [varchar](50) NOT NULL,
	[segundoApellido] [varchar](50) NULL,
	[idDireccion] [int] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [pk_cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[idDireccion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](400) NOT NULL,
 CONSTRAINT [pk_direccion] PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moneda]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moneda](
	[idMoneda] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [pk_moneda] PRIMARY KEY CLUSTERED 
(
	[idMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[numeroPrestamo] [int] IDENTITY(1,1) NOT NULL,
	[idTipoPrestamo] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
	[montoSolicitado] [decimal](18, 2) NOT NULL,
	[idMoneda] [int] NOT NULL,
	[montoAprobado] [decimal](18, 2) NOT NULL,
	[plazoFinanciamiento] [int] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [pk_prestamo] PRIMARY KEY CLUSTERED 
(
	[numeroPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoIdentificacion]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoIdentificacion](
	[idTipoIdentificacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [pk_tipoIdentificacion] PRIMARY KEY CLUSTERED 
(
	[idTipoIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPrestamo]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPrestamo](
	[idTipoPrestamo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [pk_tipoPrestamo] PRIMARY KEY CLUSTERED 
(
	[idTipoPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([idCliente], [numeroIdentificacion], [idTipoIdentificacion], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDireccion], [estado]) VALUES (1, N'001-220597-0005B', 1, N'Ismael', N'Enrique', N'Gutierrez', N'Berrios', 1, 1)
INSERT [dbo].[Cliente] ([idCliente], [numeroIdentificacion], [idTipoIdentificacion], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDireccion], [estado]) VALUES (6, N'001-240566-0005B', 1, N'Maria', N'Lourdes', N'Maria', N'Osorio', 10, 1)
INSERT [dbo].[Cliente] ([idCliente], [numeroIdentificacion], [idTipoIdentificacion], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDireccion], [estado]) VALUES (7, N'001-240566-0005A', 1, N'Maria', N'Lourdes', N'Maria', N'Osorio', 10, 1)
INSERT [dbo].[Cliente] ([idCliente], [numeroIdentificacion], [idTipoIdentificacion], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDireccion], [estado]) VALUES (8, N'001-240166-0005A', 1, N'Jose', N'Lourdes', N'Jose', N'Osorio', 10, 1)
INSERT [dbo].[Cliente] ([idCliente], [numeroIdentificacion], [idTipoIdentificacion], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDireccion], [estado]) VALUES (9, N'001-240198-0001A', 1, N'Jose', N'Mario', N'Jose', N'Osorio', 10, 1)
INSERT [dbo].[Cliente] ([idCliente], [numeroIdentificacion], [idTipoIdentificacion], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDireccion], [estado]) VALUES (10, N'001-220597-0015O', 1, N'Osman', N'', N'Gomez', N'', 16, 0)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (1, N'Boaco')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (2, N'Carazo')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (3, N'Chinandega')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (4, N'Chontales')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (5, N'Estelí')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (6, N'Granada')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (7, N'Jinotega')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (8, N'León')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (9, N'Madriz')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (10, N'Managua')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (11, N'Masaya')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (12, N'Matagalpa')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (13, N'Nueva Segovia')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (14, N'Río San Juan')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (15, N'Rivas')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (16, N'Costa Caribe Norte')
INSERT [dbo].[Direccion] ([idDireccion], [descripcion]) VALUES (17, N'Costa Caribe Sur')
SET IDENTITY_INSERT [dbo].[Direccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Moneda] ON 

INSERT [dbo].[Moneda] ([idMoneda], [nombre]) VALUES (1, N'Cordoba')
INSERT [dbo].[Moneda] ([idMoneda], [nombre]) VALUES (2, N'Dolar')
INSERT [dbo].[Moneda] ([idMoneda], [nombre]) VALUES (3, N'Euro')
SET IDENTITY_INSERT [dbo].[Moneda] OFF
GO
SET IDENTITY_INSERT [dbo].[Prestamo] ON 

INSERT [dbo].[Prestamo] ([numeroPrestamo], [idTipoPrestamo], [idCliente], [fechaInicio], [fechaFin], [montoSolicitado], [idMoneda], [montoAprobado], [plazoFinanciamiento], [estado]) VALUES (1, 1, 1, CAST(N'2023-10-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(50000.00 AS Decimal(18, 2)), 2, CAST(50000.00 AS Decimal(18, 2)), 6, 1)
INSERT [dbo].[Prestamo] ([numeroPrestamo], [idTipoPrestamo], [idCliente], [fechaInicio], [fechaFin], [montoSolicitado], [idMoneda], [montoAprobado], [plazoFinanciamiento], [estado]) VALUES (2, 1, 1, CAST(N'2023-11-28T00:00:00.000' AS DateTime), CAST(N'2024-02-01T00:00:00.000' AS DateTime), CAST(18000.00 AS Decimal(18, 2)), 2, CAST(15000.00 AS Decimal(18, 2)), 12, 1)
SET IDENTITY_INSERT [dbo].[Prestamo] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoIdentificacion] ON 

INSERT [dbo].[TipoIdentificacion] ([idTipoIdentificacion], [nombre], [activo]) VALUES (1, N'Cédula de Identidad', 1)
INSERT [dbo].[TipoIdentificacion] ([idTipoIdentificacion], [nombre], [activo]) VALUES (2, N'Pasaporte', 1)
INSERT [dbo].[TipoIdentificacion] ([idTipoIdentificacion], [nombre], [activo]) VALUES (3, N'Licencia de Conducir', 1)
INSERT [dbo].[TipoIdentificacion] ([idTipoIdentificacion], [nombre], [activo]) VALUES (4, N'Tarjeta de Seguro Social', 1)
SET IDENTITY_INSERT [dbo].[TipoIdentificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoPrestamo] ON 

INSERT [dbo].[TipoPrestamo] ([idTipoPrestamo], [nombre]) VALUES (3, N'Comercial')
INSERT [dbo].[TipoPrestamo] ([idTipoPrestamo], [nombre]) VALUES (2, N'Hipotecario')
INSERT [dbo].[TipoPrestamo] ([idTipoPrestamo], [nombre]) VALUES (1, N'Personal')
SET IDENTITY_INSERT [dbo].[TipoPrestamo] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Cliente__0FF4C91D05C9A31D]    Script Date: 28/11/2023 02:09:36 ******/
ALTER TABLE [dbo].[Cliente] ADD UNIQUE NONCLUSTERED 
(
	[numeroIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Moneda__72AFBCC665A980C8]    Script Date: 28/11/2023 02:09:36 ******/
ALTER TABLE [dbo].[Moneda] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TipoIden__72AFBCC621F60E8E]    Script Date: 28/11/2023 02:09:36 ******/
ALTER TABLE [dbo].[TipoIdentificacion] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TipoPres__72AFBCC65A5F6081]    Script Date: 28/11/2023 02:09:36 ******/
ALTER TABLE [dbo].[TipoPrestamo] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT ('') FOR [segundoNombre]
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT ('') FOR [segundoApellido]
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Prestamo] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[TipoIdentificacion] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [fk_cliente_direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [fk_cliente_direccion]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [fk_cliente_tipoIdentificacion] FOREIGN KEY([idTipoIdentificacion])
REFERENCES [dbo].[TipoIdentificacion] ([idTipoIdentificacion])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [fk_cliente_tipoIdentificacion]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_prestamo_cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_prestamo_cliente]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_prestamo_moneda] FOREIGN KEY([idMoneda])
REFERENCES [dbo].[Moneda] ([idMoneda])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_prestamo_moneda]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_prestamo_tipoPrestamo] FOREIGN KEY([idTipoPrestamo])
REFERENCES [dbo].[TipoPrestamo] ([idTipoPrestamo])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_prestamo_tipoPrestamo]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarCliente]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 27/11/2023
-- Description:	Actualizar Cliente
-- EXEC spActualizarCliente
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarCliente]
	@_idCliente INT,
	@_numeroIdentificacion VARCHAR(50),
	@_idTipoIdentificacion INT,
	@_primerNombre VARCHAR(50),
	@_segundoNombre VARCHAR(50),
	@_primerApellido VARCHAR(50),
	@_segundoApellido VARCHAR(50),
	@_idDireccion INT,
	@_estado BIT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY
		IF(NOT EXISTS(SELECT * FROM Cliente 
				  WHERE idCliente = @_idCliente))
		BEGIN
			SELECT CAST(0 AS BIT) AS exito, 'Cliente indicado no existe' AS mensaje, ''
		END
		ELSE BEGIN
			IF(EXISTS(SELECT * FROM Cliente 
					  WHERE numeroIdentificacion = @_numeroIdentificacion
					  AND idTipoIdentificacion = @_idTipoIdentificacion
					  AND idCliente <> @_idCliente))
			BEGIN
				SELECT CAST(0 AS BIT) AS exito, 'La identificacion ya existe' AS mensaje, ''
			END
			ELSE BEGIN
				UPDATE Cliente 
				SET numeroIdentificacion = @_numeroIdentificacion, 
					idTipoIdentificacion = @_idTipoIdentificacion, 
					primerNombre = @_primerNombre, 
					segundoNombre = @_segundoNombre, 
					primerApellido = @_primerApellido, 
					segundoApellido =  @_segundoApellido, 
					idDireccion = @_idDireccion,
					estado = @_estado
				WHERE idCliente = @_idCliente
		
				SELECT  CAST(1 AS BIT) AS EXITO, *
				FROM Cliente
				WHERE idCliente = @_idCliente
			END
		END
		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT CAST(0 AS BIT) AS exito,
			   'Error al intentar actualizar el cliente' AS mensaje,
			    CONCAT(ERROR_MESSAGE(), ' - LINEA: ', ERROR_LINE()) AS error 
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPrestamo]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 27/11/2023
-- Description:	Actualizar Prestamo
-- EXEC spActualizarPrestamo
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarPrestamo]
	@_numeroPrestamo INT,
	@_idTipoPrestamo INT,
	@_idCliente INT,
	@_fechaInicio DATETIME,
	@_fechaFin DATETIME,
	@_montoSolicitado DECIMAL(18,2),
	@_idMoneda INT,
	@_montoAprobado DECIMAL(18,2),
	@_plazoFinanciamiento INT,
	@_estado BIT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY

		UPDATE Prestamo
		SET idTipoPrestamo = @_idTipoPrestamo, 
			idCliente = @_idCliente, 
			fechaInicio = @_fechaInicio, 
			fechaFin = @_fechaFin,
			montoSolicitado = @_montoSolicitado, 
			idMoneda = @_idMoneda, 
			montoAprobado =  @_montoAprobado, 
			plazoFinanciamiento = @_plazoFinanciamiento, 
			estado = @_estado
		WHERE numeroPrestamo = @_numeroPrestamo
		
		SELECT 1 AS EXITO, *
		FROM Prestamo
		WHERE numeroPrestamo = @_numeroPrestamo

		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT 0 AS exito,
			   'Error al intentar actualizar el prestamo' AS mensaje,
			    CONCAT(ERROR_MESSAGE(), ' - LINEA: ', ERROR_LINE()) AS error 
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarCliente]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 27/11/2023
-- Description:	Insertar Nuevo Cliente
-- EXEC spInsertarCliente
-- =============================================
CREATE PROCEDURE [dbo].[spInsertarCliente]
	@_numeroIdentificacion VARCHAR(50),
	@_idTipoIdentificacion INT,
	@_primerNombre VARCHAR(50),
	@_segundoNombre VARCHAR(50),
	@_primerApellido VARCHAR(50),
	@_segundoApellido VARCHAR(50),
	@_idDireccion INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY

		IF(EXISTS(SELECT * FROM Cliente 
				  WHERE numeroIdentificacion = @_numeroIdentificacion
				  AND idTipoIdentificacion = @_idTipoIdentificacion))
		BEGIN
			SELECT CAST(0 AS BIT) AS exito, 'La identificacion ya existe' AS mensaje, ''
		END
		ELSE BEGIN
			INSERT INTO Cliente
			VALUES(@_numeroIdentificacion, @_idTipoIdentificacion, @_primerNombre, @_segundoNombre, 
				@_primerApellido, @_segundoApellido, @_idDireccion, 1)
		
			SELECT CAST(1 AS BIT) AS EXITO, *
			FROM Cliente
			WHERE idCliente = SCOPE_IDENTITY()
		END
		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT CAST(0 AS BIT) AS exito,
			   'Error al intentar agregar cliente' AS mensaje,
			    CONCAT(ERROR_MESSAGE(), ' - LINEA: ', ERROR_LINE()) AS error 
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarDireccion]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 26/11/2023
-- Description:	Insertar Nueva Direccion
-- EXEC InsertarDireccion
-- =============================================
CREATE PROCEDURE [dbo].[spInsertarDireccion]
	@_descripcion VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY

		INSERT INTO Direccion
		VALUES(@_descripcion)
		
		SELECT 1 AS EXITO, *
		FROM Direccion
		WHERE idDireccion = SCOPE_IDENTITY()

		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT 0 AS exito,
			   'Error al intentar agregar la dirección' AS mensaje,
			    CONCAT(ERROR_MESSAGE(), ' - LINEA: ', ERROR_LINE()) AS error 
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarPrestamo]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 27/11/2023
-- Description:	Insertar Nuevo Prestamo
-- EXEC spInsertarPrestamo
-- =============================================
CREATE PROCEDURE [dbo].[spInsertarPrestamo]
	@_idTipoPrestamo INT,
	@_idCliente INT,
	@_fechaInicio DATETIME,
	@_fechaFin DATETIME,
	@_montoSolicitado DECIMAL(18,2),
	@_idMoneda INT,
	@_montoAprobado DECIMAL(18,2),
	@_plazoFinanciamiento INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY

		INSERT INTO Prestamo
		VALUES(@_idTipoPrestamo, @_idCliente, @_fechaInicio, @_fechaFin,
			@_montoSolicitado, @_idMoneda, @_montoAprobado, @_plazoFinanciamiento, 1)
		
		SELECT CAST(1 AS BIT) AS EXITO, *
		FROM Prestamo
		WHERE numeroPrestamo = SCOPE_IDENTITY()

		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT CAST(0 AS BIT) AS exito,
			   'Error al intentar agregar el prestamo' AS mensaje,
			    CONCAT(ERROR_MESSAGE(), ' - LINEA: ', ERROR_LINE()) AS error 
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerCatalogos]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 27/11/2023
-- Description:	Obtener catalogos
-- EXEC spObtenerCatalogos 1
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerCatalogos]
AS
BEGIN
	SET NOCOUNT ON;

		SELECT *
		FROM TipoIdentificacion
	
		SELECT *
		FROM TipoPrestamo
		
		SELECT *
		FROM Moneda
	
		SELECT *
		FROM Direccion
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerClientes]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 27/11/2023
-- Description:	Obtener clientes
-- EXEC spObtenerClientes 1
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerClientes]
	@_idCliente INT = 0
AS
BEGIN
	SET NOCOUNT ON;

	SELECT C.idCliente, C.numeroIdentificacion,
		   T.idTipoIdentificacion, T.nombre, CAST(T.activo AS BIT),
		   C.primerNombre, C.segundoNombre, C.primerApellido, C.segundoApellido,
		   D.idDireccion, D.descripcion,
		   C.estado
	FROM Cliente C
	JOIN TipoIdentificacion T ON T.idTipoIdentificacion = C.idTipoIdentificacion
	JOIN Direccion D ON D.idDireccion = C.idDireccion
	WHERE C.idCliente = IIF(@_idCliente = 0, C.idCliente, @_idCliente)
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPrestamos]    Script Date: 28/11/2023 02:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 27/11/2023
-- Description:	Obtener prestamos
-- EXEC spObtenerPrestamos 1
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerPrestamos]
	@_idCliente INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT p.numeroPrestamo, 
		   T.idTipoPrestamo, T.nombre,
		   C.idCliente, C.numeroIdentificacion, C.primerNombre, 
		   C.segundoNombre, C.primerApellido, C.segundoApellido,
		   P.fechaInicio, P.fechaFin, P.montoSolicitado,
		   M.idMoneda, M.nombre, P.montoAprobado, P.plazoFinanciamiento, P.estado
	FROM Prestamo p 
	JOIN TipoPrestamo T ON T.idTipoPrestamo = P.idTipoPrestamo
	JOIN Cliente C ON C.idCliente = P.idCliente
	JOIN Moneda M ON M.idMoneda = P.idMoneda
	WHERE P.idCliente = IIF(@_idCliente = 0, P.idCliente, @_idCliente)
END
GO
USE [master]
GO
ALTER DATABASE [Test] SET  READ_WRITE 
GO
