USE master;
GO

IF DB_ID(N'BD_TiendaOnline') IS NOT NULL
BEGIN
    ALTER DATABASE BD_TiendaOnline SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE BD_TiendaOnline;
END
GO

CREATE DATABASE BD_TiendaOnline
ON PRIMARY
(
    NAME = BD_TiendaOnline_dat,
    FILENAME = 'C:\TiendaOnline\BD_TiendaOnline.mdf',
    SIZE = 20MB,
    MAXSIZE = 200MB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = BD_TiendaOnline_log,
    FILENAME = 'C:\TiendaOnline\BD_TiendaOnline_log.ldf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10MB
);
GO

USE BD_TiendaOnline;
GO

/* ===========================================
   2. Borrar tablas si ya existen (orden por FKs)
   =========================================== */
IF OBJECT_ID(N'dbo.DetallePedido', N'U') IS NOT NULL DROP TABLE dbo.DetallePedido;
IF OBJECT_ID(N'dbo.Pedido',        N'U') IS NOT NULL DROP TABLE dbo.Pedido;
IF OBJECT_ID(N'dbo.Cupon',         N'U') IS NOT NULL DROP TABLE dbo.Cupon;
IF OBJECT_ID(N'dbo.Producto',      N'U') IS NOT NULL DROP TABLE dbo.Producto;
IF OBJECT_ID(N'dbo.Cliente',       N'U') IS NOT NULL DROP TABLE dbo.Cliente;
GO

/* ===========================================
   3. Crear tablas normalizadas
   =========================================== */

-- CLIENTE
CREATE TABLE dbo.Cliente (
    IdCliente       INT            NOT NULL PRIMARY KEY,
    nombreCliente   NVARCHAR(100)  NOT NULL,
    correoCliente   NVARCHAR(100)  NOT NULL,
    telefonoCliente NVARCHAR(20)   NULL
);
GO

-- PRODUCTO
CREATE TABLE dbo.Producto (
    IdProducto      INT            NOT NULL PRIMARY KEY,
    nombreProducto  NVARCHAR(100)  NOT NULL,
    categoria       NVARCHAR(50)   NOT NULL,
    marca           NVARCHAR(50)   NULL,
    precioProducto  DECIMAL(10,2)  NOT NULL
);
GO

-- CUPON
CREATE TABLE dbo.Cupon (
    codigoCupon     NVARCHAR(20)   NOT NULL PRIMARY KEY,
    descuentoCupon  DECIMAL(10,2)  NOT NULL,
    vigencia        DATE           NOT NULL,
    maxUsos         INT            NOT NULL
);
GO

-- PEDIDO
CREATE TABLE dbo.Pedido (
    IdPedido     INT            NOT NULL PRIMARY KEY,
    IdCliente    INT            NOT NULL,
    fechaCompra  DATE           NOT NULL,
    metodoPago   NVARCHAR(30)   NOT NULL,
    estadoPedido NVARCHAR(20)   NOT NULL,
    codigoCupon  NVARCHAR(20)   NULL,
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (IdCliente)
        REFERENCES dbo.Cliente(IdCliente),
    CONSTRAINT FK_Pedido_Cupon FOREIGN KEY (codigoCupon)
        REFERENCES dbo.Cupon(codigoCupon)
);
GO

-- DETALLE_PEDIDO
CREATE TABLE dbo.DetallePedido (
    IdPedido       INT            NOT NULL,
    IdProducto     INT            NOT NULL,
    cantidad       INT            NOT NULL,
    precioProducto DECIMAL(10,2)  NOT NULL,
    CONSTRAINT PK_DetallePedido PRIMARY KEY (IdPedido, IdProducto),
    CONSTRAINT FK_DetallePedido_Pedido FOREIGN KEY (IdPedido)
        REFERENCES dbo.Pedido(IdPedido),
    CONSTRAINT FK_DetallePedido_Producto FOREIGN KEY (IdProducto)
        REFERENCES dbo.Producto(IdProducto)
);
GO

/* (Opcional) Verificar dónde se guardaron los archivos físicos */
SELECT name, physical_name
FROM sys.database_files;
GO
