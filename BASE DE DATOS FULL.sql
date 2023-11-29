USE [master]
GO
CREATE DATABASE Test
GO


USE Test
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 28/11/2023 08:57:11 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numeroIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 28/11/2023 08:57:11 ******/
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
/****** Object:  Table [dbo].[Moneda]    Script Date: 28/11/2023 08:57:11 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 28/11/2023 08:57:11 ******/
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
/****** Object:  Table [dbo].[TipoIdentificacion]    Script Date: 28/11/2023 08:57:11 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPrestamo]    Script Date: 28/11/2023 08:57:11 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[spActualizarCliente]    Script Date: 28/11/2023 08:57:11 ******/
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
/****** Object:  StoredProcedure [dbo].[spActualizarPrestamo]    Script Date: 28/11/2023 08:57:11 ******/
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
		
		SELECT CAST(1 AS BIT) AS EXITO, *
		FROM Prestamo
		WHERE numeroPrestamo = @_numeroPrestamo

		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT CAST(0 AS BIT) AS exito,
			   'Error al intentar actualizar el prestamo' AS mensaje,
			    CONCAT(ERROR_MESSAGE(), ' - LINEA: ', ERROR_LINE()) AS error 
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spClientesPrestamosActivos]    Script Date: 28/11/2023 08:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 28/11/2023
-- Description:	Lista de clientes con sus prestamos asociados(activos) y plazo de financiamiento mayor a 36
-- exec [dbo].[spClientesPrestamosActivos] 
-- =============================================
CREATE PROCEDURE [dbo].[spClientesPrestamosActivos] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT '(' + C.numeroIdentificacion + ') -' + TI.nombre AS identificacion,
		   c.primerNombre + ' ' + c.segundoNombre + ' ' + c.primerApellido + ' ' + c.segundoApellido AS cliente,
		   D.descripcion AS direccion,
		   P.numeroPrestamo, TP.nombre, P.fechaInicio, P.fechaFin,
		   M.nombre, P.montoSolicitado, P.montoAprobado, P.plazoFinanciamiento
	FROM Cliente C
	JOIN TipoIdentificacion TI ON TI.idTipoIdentificacion = C.idTipoIdentificacion
	JOIN Direccion D ON D.idDireccion = C.idDireccion
	JOIN Prestamo P ON P.idCliente = C.idCliente
	JOIN TipoPrestamo TP ON TP.idTipoPrestamo = P.idTipoPrestamo
	JOIN Moneda M ON M.idMoneda = P.idMoneda
	WHERE P.estado = 1
	AND plazoFinanciamiento > 36
	ORDER BY P.fechaInicio 

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarCliente]    Script Date: 28/11/2023 08:57:11 ******/
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
	@_idDireccion INT,
	@_estado BIT
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
				@_primerApellido, @_segundoApellido, @_idDireccion, @_estado)
		
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
/****** Object:  StoredProcedure [dbo].[spInsertarDireccion]    Script Date: 28/11/2023 08:57:11 ******/
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

		IF(EXISTS(SELECT * FROM Direccion WHERE descripcion = @_descripcion))
		BEGIN
			SELECT CAST(0 AS BIT) AS exito, 'La Dirección ya existe' AS mensaje, ''
		END
		ELSE BEGIN
			INSERT INTO Direccion
			VALUES(@_descripcion)
		
			SELECT CAST(1 AS BIT) AS EXITO, *
			FROM Direccion
			WHERE idDireccion = SCOPE_IDENTITY()
		END
		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT CAST(0 AS BIT) AS exito,
			   'Error al intentar agregar la dirección' AS mensaje,
			    CONCAT(ERROR_MESSAGE(), ' - LINEA: ', ERROR_LINE()) AS error 
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarMoneda]    Script Date: 28/11/2023 08:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 27/11/2023
-- Description:	Insertar moneda
-- EXEC InsertarMoneda
-- =============================================
CREATE PROCEDURE [dbo].[spInsertarMoneda]
	@_nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY

		IF(EXISTS(SELECT * FROM Moneda WHERE nombre = @_nombre))
		BEGIN
			SELECT CAST(0 AS BIT) AS exito, 'La moneda ya existe' AS mensaje, ''
		END
		ELSE BEGIN
			INSERT INTO Moneda
			VALUES(@_nombre)
		
			SELECT CAST(1 AS BIT) AS EXITO, *
			FROM Moneda
			WHERE idMoneda = SCOPE_IDENTITY()
		END
		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT CAST(0 AS BIT) AS exito,
			   'Error al intentar agregar la moneda' AS mensaje,
			    CONCAT(ERROR_MESSAGE(), ' - LINEA: ', ERROR_LINE()) AS error 
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarPrestamo]    Script Date: 28/11/2023 08:57:11 ******/
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
	@_plazoFinanciamiento INT,
	@_estado BIT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY

		INSERT INTO Prestamo
		VALUES(@_idTipoPrestamo, @_idCliente, @_fechaInicio, @_fechaFin,
			@_montoSolicitado, @_idMoneda, @_montoAprobado, @_plazoFinanciamiento, @_estado)
		
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
/****** Object:  StoredProcedure [dbo].[spInsertarTipoIdentificacion]    Script Date: 28/11/2023 08:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 27/11/2023
-- Description:	Insertar tipo identificacion
-- EXEC InsertarTipoIdentificacion
-- =============================================
CREATE PROCEDURE [dbo].[spInsertarTipoIdentificacion]
	@_nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY

		IF(EXISTS(SELECT * FROM TipoIdentificacion WHERE nombre = @_nombre))
		BEGIN
			SELECT CAST(0 AS BIT) AS exito, 'El tipo de identificación ya existe' AS mensaje, ''
		END
		ELSE BEGIN
			INSERT INTO TipoIdentificacion
			VALUES(@_nombre, 1)
		
			SELECT CAST(1 AS BIT) AS EXITO, *
			FROM TipoIdentificacion
			WHERE idTipoIdentificacion = SCOPE_IDENTITY()
		END
		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT CAST(0 AS BIT) AS exito,
			   'Error al intentar agregar el tipo de identificación' AS mensaje,
			    CONCAT(ERROR_MESSAGE(), ' - LINEA: ', ERROR_LINE()) AS error 
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarTipoPrestamo]    Script Date: 28/11/2023 08:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 27/11/2023
-- Description:	Insertar tipo prestamo
-- EXEC InsertarTipoPrestamo
-- =============================================
CREATE PROCEDURE [dbo].[spInsertarTipoPrestamo]
	@_nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY

		IF(EXISTS(SELECT * FROM TipoPrestamo WHERE nombre = @_nombre))
		BEGIN
			SELECT CAST(0 AS BIT) AS exito, 'El tipo de prestamo ya existe' AS mensaje, ''
		END
		ELSE BEGIN
			INSERT INTO TipoPrestamo
			VALUES(@_nombre)
		
			SELECT CAST(1 AS BIT) AS EXITO, *
			FROM TipoPrestamo
			WHERE idTipoPrestamo = SCOPE_IDENTITY()
		END
		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		SELECT CAST(0 AS BIT) AS exito,
			   'Error al intentar agregar el tipo de prestamo' AS mensaje,
			    CONCAT(ERROR_MESSAGE(), ' - LINEA: ', ERROR_LINE()) AS error 
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerCatalogos]    Script Date: 28/11/2023 08:57:11 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerClientes]    Script Date: 28/11/2023 08:57:11 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPrestamos]    Script Date: 28/11/2023 08:57:11 ******/
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
	@_idCliente INT,
	@_idPrestamo INT
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
	AND P.numeroPrestamo = IIF(@_idPrestamo = 0, P.numeroPrestamo, @_idPrestamo)
END
GO
/****** Object:  StoredProcedure [dbo].[spPrestamosXestadoXMoneda]    Script Date: 28/11/2023 08:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ismael Gutierrez
-- Create date: 28/11/2023
-- Description:	Cantidad de prestamos por estado y moneda mayor a 10,000
-- EXEC spPrestamosXestadoXMoneda 1, 2
-- =============================================
CREATE PROCEDURE [dbo].[spPrestamosXestadoXMoneda] 
	@_estado BIT,
	@_idMoneda INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT '(' + C.numeroIdentificacion + ') -' + TI.nombre AS identificacion,
		   c.primerNombre + ' ' + c.segundoNombre + ' ' + c.primerApellido + ' ' + c.segundoApellido AS cliente,
		   D.descripcion AS direccion,
		   P.numeroPrestamo, TP.nombre, P.fechaInicio, P.fechaFin,
		   M.nombre, P.montoSolicitado, P.montoAprobado, P.plazoFinanciamiento
	FROM Cliente C
	JOIN TipoIdentificacion TI ON TI.idTipoIdentificacion = C.idTipoIdentificacion
	JOIN Direccion D ON D.idDireccion = C.idDireccion
	JOIN Prestamo P ON P.idCliente = C.idCliente
	JOIN TipoPrestamo TP ON TP.idTipoPrestamo = P.idTipoPrestamo
	JOIN Moneda M ON M.idMoneda = P.idMoneda
	WHERE p.estado = @_estado
	AND P.idMoneda = @_idMoneda
	AND P.montoAprobado > 10000
END
