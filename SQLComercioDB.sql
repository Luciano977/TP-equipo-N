-- 
-- TP Programacion III - Sistema de gestion comercial
-- Base de datos: ComercioDB
-- Motor: Microsoft SQL Server 2012 o superior
-- 
-- IMPORTANTE:
-- - Este script crea una base nueva llamada ComercioDB.
-- - No elimina ni modifica una base existente.
-- - No utiliza TRIGGERS.
-- - Las operaciones de compra y venta deben implementarse desde C#
-- usando transacciones SQL (BEGIN TRANSACTION / COMMIT / ROLLBACK).

IF DB_ID(N'ComercioDB') IS NOT NULL
BEGIN
    THROW 50001, 'La base ComercioDB ya existe. No se realizaron cambios.', 1;
END;
GO

CREATE DATABASE ComercioDB;
GO

USE ComercioDB;
GO

-- =========================================================
-- 1. SEGURIDAD Y USUARIOS
-- ========================================================= 

CREATE TABLE Roles
(
    IdRol INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,

    CONSTRAINT PK_Roles PRIMARY KEY (IdRol),
    CONSTRAINT UQ_Roles_Nombre UNIQUE (Nombre)
);
GO

CREATE TABLE Usuarios
(
    IdUsuario INT IDENTITY(1,1) NOT NULL,
    NombreUsuario NVARCHAR(50) NOT NULL,
    ClaveHash NVARCHAR(255) NOT NULL,
    NombreCompleto NVARCHAR(120) NOT NULL,
    IdRol INT NOT NULL,
    Activo BIT NOT NULL
        CONSTRAINT DF_Usuarios_Activo DEFAULT (1),

    CONSTRAINT PK_Usuarios PRIMARY KEY (IdUsuario),
    CONSTRAINT UQ_Usuarios_NombreUsuario UNIQUE (NombreUsuario),
    CONSTRAINT FK_Usuarios_Roles
        FOREIGN KEY (IdRol) REFERENCES Roles(IdRol)
);
GO

-- =========================================================
-- 2. CLIENTES Y PROVEEDORES
-- ========================================================= 

CREATE TABLE Clientes
(
    IdCliente INT IDENTITY(1,1) NOT NULL,
    DNI VARCHAR(20) NOT NULL,
    Nombre NVARCHAR(80) NOT NULL,
    Apellido NVARCHAR(80) NOT NULL,
    Telefono NVARCHAR(30) NULL,
    Email NVARCHAR(150) NULL,
    Domicilio NVARCHAR(200) NULL,
    Activo BIT NOT NULL
        CONSTRAINT DF_Clientes_Activo DEFAULT (1),

    CONSTRAINT PK_Clientes PRIMARY KEY (IdCliente),
    CONSTRAINT UQ_Clientes_DNI UNIQUE (DNI)
);
GO

CREATE TABLE Proveedores
(
    IdProveedor INT IDENTITY(1,1) NOT NULL,
    RazonSocial NVARCHAR(150) NOT NULL,
    CUIT VARCHAR(13) NOT NULL,
    Telefono NVARCHAR(30) NULL,
    Email NVARCHAR(150) NULL,
    Domicilio NVARCHAR(200) NULL,
    Localidad NVARCHAR(100) NULL,
    Provincia NVARCHAR(100) NULL,
    Activo BIT NOT NULL
        CONSTRAINT DF_Proveedores_Activo DEFAULT (1),

    CONSTRAINT PK_Proveedores PRIMARY KEY (IdProveedor),
    CONSTRAINT UQ_Proveedores_CUIT UNIQUE (CUIT)
);
GO

-- =========================================================
-- 3. CATALOGOS
-- ========================================================= 

CREATE TABLE Marcas
(
    IdMarca INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Activo BIT NOT NULL
        CONSTRAINT DF_Marcas_Activo DEFAULT (1),

    CONSTRAINT PK_Marcas PRIMARY KEY (IdMarca),
    CONSTRAINT UQ_Marcas_Nombre UNIQUE (Nombre)
);
GO

CREATE TABLE Categorias
(
    IdCategoria INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Activo BIT NOT NULL
        CONSTRAINT DF_Categorias_Activo DEFAULT (1),

    CONSTRAINT PK_Categorias PRIMARY KEY (IdCategoria),
    CONSTRAINT UQ_Categorias_Nombre UNIQUE (Nombre)
);
GO

CREATE TABLE Productos
(
    IdProducto INT IDENTITY(1,1) NOT NULL,
    Codigo NVARCHAR(50) NOT NULL,
    Nombre NVARCHAR(150) NOT NULL,
    Descripcion NVARCHAR(500) NULL,
    IdMarca INT NOT NULL,
    IdCategoria INT NOT NULL,
    StockActual INT NOT NULL
        CONSTRAINT DF_Productos_StockActual DEFAULT (0),
    StockMinimo INT NOT NULL
        CONSTRAINT DF_Productos_StockMinimo DEFAULT (0),
    UltimoCosto DECIMAL(18,2) NULL,
    PorcentajeGanancia DECIMAL(9,2) NOT NULL
        CONSTRAINT DF_Productos_PorcentajeGanancia DEFAULT (0),
    PrecioVenta AS
        (CONVERT(DECIMAL(18,2),
            ROUND(UltimoCosto * (1 + PorcentajeGanancia / 100.0), 2)
        )) PERSISTED,
    ImagenURL NVARCHAR(500) NULL,
    Activo BIT NOT NULL
        CONSTRAINT DF_Productos_Activo DEFAULT (1),

    CONSTRAINT PK_Productos PRIMARY KEY (IdProducto),
    CONSTRAINT UQ_Productos_Codigo UNIQUE (Codigo),
    CONSTRAINT CK_Productos_Stock CHECK (StockActual >= 0 AND StockMinimo >= 0),
    CONSTRAINT CK_Productos_UltimoCosto CHECK (UltimoCosto IS NULL OR UltimoCosto >= 0),
    CONSTRAINT CK_Productos_Ganancia CHECK (PorcentajeGanancia >= 0),
    CONSTRAINT FK_Productos_Marcas
        FOREIGN KEY (IdMarca) REFERENCES Marcas(IdMarca),
    CONSTRAINT FK_Productos_Categorias
        FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria)
);
GO

-- Relacion muchos a muchos: un proveedor ofrece varios productos
-- y un producto puede ser ofrecido por varios proveedores. 

CREATE TABLE ProveedoresProductos
(
    IdProveedor INT NOT NULL,
    IdProducto INT NOT NULL,

    CONSTRAINT PK_ProveedoresProductos
        PRIMARY KEY (IdProveedor, IdProducto),
    CONSTRAINT FK_ProveedoresProductos_Proveedores
        FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor),
    CONSTRAINT FK_ProveedoresProductos_Productos
        FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);
GO

-- =========================================================
-- 4. COMPRAS
-- ========================================================= 

CREATE TABLE Compras
(
    IdCompra INT IDENTITY(1,1) NOT NULL,
    IdProveedor INT NOT NULL,
    IdUsuario INT NOT NULL,
    Fecha DATETIME2(0) NOT NULL
        CONSTRAINT DF_Compras_Fecha DEFAULT (SYSDATETIME()),
    NumeroComprobante NVARCHAR(50) NULL,

    CONSTRAINT PK_Compras PRIMARY KEY (IdCompra),
    CONSTRAINT FK_Compras_Proveedores
        FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor),
    CONSTRAINT FK_Compras_Usuarios
        FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);
GO

CREATE TABLE DetalleCompras
(
    IdDetalleCompra INT IDENTITY(1,1) NOT NULL,
    IdCompra INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(18,2) NOT NULL,

    Subtotal AS
        (CONVERT(DECIMAL(18,2), Cantidad * PrecioUnitario)) PERSISTED,

    CONSTRAINT PK_DetalleCompras PRIMARY KEY (IdDetalleCompra),
    CONSTRAINT CK_DetalleCompras_Cantidad CHECK (Cantidad > 0),
    CONSTRAINT CK_DetalleCompras_Precio CHECK (PrecioUnitario >= 0),
    CONSTRAINT FK_DetalleCompras_Compras
        FOREIGN KEY (IdCompra) REFERENCES Compras(IdCompra),
    CONSTRAINT FK_DetalleCompras_Productos
        FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);
GO

-- =========================================================
-- 5. VENTAS
-- ========================================================= 

CREATE SEQUENCE SecuenciaNumeroFactura
    AS BIGINT
    START WITH 1
    INCREMENT BY 1;
GO

CREATE TABLE Ventas
(
    IdVenta INT IDENTITY(1,1) NOT NULL,
    NumeroFactura BIGINT NOT NULL
        CONSTRAINT DF_Ventas_NumeroFactura
        DEFAULT (NEXT VALUE FOR SecuenciaNumeroFactura),
    IdCliente INT NOT NULL,
    IdUsuario INT NOT NULL,
    Fecha DATETIME2(0) NOT NULL
        CONSTRAINT DF_Ventas_Fecha DEFAULT (SYSDATETIME()),

    CONSTRAINT PK_Ventas PRIMARY KEY (IdVenta),
    CONSTRAINT UQ_Ventas_NumeroFactura UNIQUE (NumeroFactura),
    CONSTRAINT CK_Ventas_NumeroFactura CHECK (NumeroFactura > 0),
    CONSTRAINT FK_Ventas_Clientes
        FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    CONSTRAINT FK_Ventas_Usuarios
        FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);
GO

CREATE TABLE DetalleVentas
(
    IdDetalleVenta INT IDENTITY(1,1) NOT NULL,
    IdVenta INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(18,2) NOT NULL,

    Subtotal AS
        (CONVERT(DECIMAL(18,2), Cantidad * PrecioUnitario)) PERSISTED,

    CONSTRAINT PK_DetalleVentas PRIMARY KEY (IdDetalleVenta),
    CONSTRAINT CK_DetalleVentas_Cantidad CHECK (Cantidad > 0),
    CONSTRAINT CK_DetalleVentas_Precio CHECK (PrecioUnitario >= 0),
    CONSTRAINT FK_DetalleVentas_Ventas
        FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta),
    CONSTRAINT FK_DetalleVentas_Productos
        FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);
GO

-- =========================================================
-- 6. INDICES PARA BUSQUEDAS Y CLAVES FORANEAS
-- ========================================================= 

CREATE INDEX IX_Productos_Nombre ON Productos(Nombre);
CREATE INDEX IX_Productos_IdMarca ON Productos(IdMarca);
CREATE INDEX IX_Productos_IdCategoria ON Productos(IdCategoria);

CREATE INDEX IX_Compras_IdProveedor ON Compras(IdProveedor);
CREATE INDEX IX_Compras_Fecha ON Compras(Fecha);
CREATE INDEX IX_DetalleCompras_IdCompra ON DetalleCompras(IdCompra);
CREATE INDEX IX_DetalleCompras_IdProducto ON DetalleCompras(IdProducto);

CREATE INDEX IX_Ventas_IdCliente ON Ventas(IdCliente);
CREATE INDEX IX_Ventas_Fecha ON Ventas(Fecha);
CREATE INDEX IX_DetalleVentas_IdVenta ON DetalleVentas(IdVenta);
CREATE INDEX IX_DetalleVentas_IdProducto ON DetalleVentas(IdProducto);
GO

-- =========================================================
-- 7. DATOS INICIALES
-- ========================================================= 

INSERT INTO Roles (Nombre)
VALUES (N'Administrador'), (N'Vendedor');
GO

-- 
-- NOTAS PARA EL DESARROLLO EN C# (NO SON TRIGGERS):
-- 
-- A) AL REGISTRAR UNA COMPRA:
-- 1. Iniciar una transaccion.
-- 2. Insertar la cabecera en Compras.
-- 3. Verificar que cada producto este asociado al proveedor
-- en ProveedoresProductos.
-- 4. Insertar los renglones en DetalleCompras.
-- 5. Por cada producto, sumar la cantidad a StockActual y
-- guardar el PrecioUnitario en UltimoCosto.
-- 6. Confirmar la transaccion. Ante cualquier error, hacer ROLLBACK.
-- 
-- B) AL REGISTRAR UNA VENTA:
-- 1. Iniciar una transaccion.
-- 2. Insertar la cabecera en Ventas (NumeroFactura se genera solo).
-- 3. Para cada producto, descontar stock con una sentencia
-- UPDATE ... WHERE StockActual >= @Cantidad AND Activo = 1.
-- 4. Si alguna actualizacion afecta cero filas, cancelar toda
-- la transaccion (stock insuficiente o producto inactivo).
-- 5. Insertar DetalleVentas guardando el PrecioUnitario vigente
-- para conservar el precio historico de esa venta.
-- 6. Confirmar la transaccion. Ante cualquier error, hacer ROLLBACK.
-- 
-- C) PRECIO DE VENTA:
-- Productos.PrecioVenta se calcula como UltimoCosto +
-- PorcentajeGanancia. Si UltimoCosto es NULL, el producto todavia
-- no tiene un costo de compra registrado y no debe venderse.
-- 
-- D) HISTORIAL:
-- No borrar fisicamente clientes, proveedores, productos ni usuarios
-- que tengan operaciones asociadas. Usar el campo Activo para
-- deshabilitarlos. No borrar compras ni ventas historicas.
-- 
-- E) SEGURIDAD:
-- ClaveHash debe guardar un hash seguro generado desde C#.
-- Nunca guardar contrasenas en texto plano.
GO

USE ComercioDB;
GO

SELECT name AS Tabla
FROM sys.tables
ORDER BY name;

USE ComercioDB;
GO

SELECT
    fk.name AS Relacion,
    OBJECT_NAME(fk.parent_object_id) AS TablaOrigen,
    OBJECT_NAME(fk.referenced_object_id) AS TablaDestino
FROM sys.foreign_keys fk
ORDER BY TablaOrigen;