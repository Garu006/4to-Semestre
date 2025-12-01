USE BD_TiendaOnline;
GO

-- … aquí van todos los CREATE TABLE …
GO

/* ===========================================
   1) DATOS DE PRUEBA
   =========================================== */

-- CLIENTES
INSERT INTO dbo.Cliente (IdCliente, nombreCliente, correoCliente, telefonoCliente)
VALUES
(1, 'Johaneris Sayrín', 'johaneris@example.com', '8888-0001'),
(2, 'Emilio Meza',      'emilio@example.com',    '8888-0002'),
(3, 'Steven Mejía',     'steven@example.com',    '8888-0003'),
(4, 'Gabriel Rojas',    'gabriel@example.com',   '8888-0004'),
(5, 'Cliente Invitado', 'invitado@example.com',  NULL);

-- PRODUCTOS
INSERT INTO dbo.Producto (IdProducto, nombreProducto, categoria, marca, precioProducto)
VALUES
(101, 'Laptop Gamer 15"',     'Tecnología', 'Aorus',   1200.00),
(102, 'Mouse Inalámbrico',    'Tecnología', 'Logitech',  25.50),
(103, 'Teclado Mecánico',     'Tecnología', 'Redragon',  60.00),
(104, 'Audífonos Bluetooth',  'Tecnología', 'Sony',      80.00),
(105, 'Silla Ergonómica',     'Oficina',    'ErgoPro', 220.00);

-- CUPONES
INSERT INTO dbo.Cupon (codigoCupon, descuentoCupon, vigencia, maxUsos)
VALUES
('WELCOME10', 10.00, '2025-12-31', 100),
('BLACKFRI', 50.00, '2025-11-30',  50),
('SINCUPO',   0.00, '2026-01-01',   0);  -- cupón de prueba sin uso real

-- PEDIDOS
INSERT INTO dbo.Pedido (IdPedido, IdCliente, fechaCompra, metodoPago, estadoPedido, codigoCupon)
VALUES
(1001, 1, '2025-11-01', 'Tarjeta crédito', 'entregado', 'WELCOME10'),
(1002, 2, '2025-11-05', 'Transferencia',   'enviado',   NULL),
(1003, 3, '2025-11-10', 'Tarjeta débito',  'cancelado', 'BLACKFRI'),
(1004, 1, '2025-11-15', 'Tarjeta crédito', 'procesando', NULL),
(1005, 4, '2025-11-20', 'Efectivo',        'entregado', NULL);

-- DETALLE_PEDIDO
INSERT INTO dbo.DetallePedido (IdPedido, IdProducto, cantidad, precioProducto)
VALUES
-- Pedido 1001 (Johaneris)
(1001, 101, 1, 1200.00),
(1001, 102, 2,   25.50),

-- Pedido 1002 (Emilio)
(1002, 103, 1,   60.00),
(1002, 104, 1,   80.00),

-- Pedido 1003 (Steven, cancelado)
(1003, 105, 1,  220.00),

-- Pedido 1004 (Johaneris, segundo pedido)
(1004, 102, 1,   25.50),
(1004, 103, 1,   60.00),

-- Pedido 1005 (Gabriel)
(1005, 105, 1,  220.00),
(1005, 104, 2,   80.00);
GO

