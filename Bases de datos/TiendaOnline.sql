USE DB_TiendaOnline;
GO

USE BD_TiendaOnline;
GO

/* ===========================================
   CONSULTAS BÁSICAS / REPORTES
   BD_TiendaOnline
   =========================================== */

------------------------------------------------
-- 1. Pedidos con nombre de cliente y total
------------------------------------------------
SELECT  p.IdPedido,
        c.nombreCliente,
        p.fechaCompra,
        p.metodoPago,
        p.estadoPedido,
        ISNULL(p.codigoCupon, 'SIN CUPON') AS codigoCupon,
        SUM(d.cantidad * d.precioProducto) AS totalPedido
FROM dbo.Pedido        AS p
JOIN dbo.Cliente       AS c ON p.IdCliente  = c.IdCliente
JOIN dbo.DetallePedido AS d ON p.IdPedido   = d.IdPedido
GROUP BY p.IdPedido, c.nombreCliente, p.fechaCompra,
         p.metodoPago, p.estadoPedido, p.codigoCupon;
GO

------------------------------------------------
-- 2. Pedidos que ya fueron entregados
------------------------------------------------
SELECT  p.IdPedido,
        c.nombreCliente,
        p.fechaCompra,
        p.metodoPago
FROM dbo.Pedido  AS p
JOIN dbo.Cliente AS c ON p.IdCliente = c.IdCliente
WHERE p.estadoPedido = 'entregado';
GO

------------------------------------------------
-- 3. Cantidad de pedidos por cliente
------------------------------------------------
SELECT  c.IdCliente,
        c.nombreCliente,
        COUNT(*) AS cantidadPedidos
FROM dbo.Pedido  AS p
JOIN dbo.Cliente AS c ON p.IdCliente = c.IdCliente
GROUP BY c.IdCliente, c.nombreCliente;
GO

------------------------------------------------
-- 4. Productos más vendidos (por cantidad)
------------------------------------------------
SELECT  pr.IdProducto,
        pr.nombreProducto,
        SUM(d.cantidad) AS totalVendida
FROM dbo.DetallePedido AS d
JOIN dbo.Producto      AS pr ON d.IdProducto = pr.IdProducto
GROUP BY pr.IdProducto, pr.nombreProducto
ORDER BY totalVendida DESC;
GO

------------------------------------------------
-- 5. Pedidos donde se aplicó un cupón
------------------------------------------------
SELECT  p.IdPedido,
        c.nombreCliente,
        p.fechaCompra,
        p.estadoPedido,
        p.codigoCupon
FROM dbo.Pedido  AS p
JOIN dbo.Cliente AS c ON p.IdCliente = c.IdCliente
WHERE p.codigoCupon IS NOT NULL;
GO

------------------------------------------------
-- 6. Total vendido por método de pago
------------------------------------------------
SELECT  p.metodoPago,
        SUM(d.cantidad * d.precioProducto) AS totalVendido
FROM dbo.Pedido        AS p
JOIN dbo.DetallePedido AS d ON p.IdPedido = d.IdPedido
GROUP BY p.metodoPago;
GO

------------------------------------------------
-- 7. Veces que se usó cada cupón
------------------------------------------------
SELECT  cu.codigoCupon,
        cu.descuentoCupon,
        COUNT(p.IdPedido) AS vecesUsado
FROM dbo.Cupon  AS cu
LEFT JOIN dbo.Pedido AS p ON cu.codigoCupon = p.codigoCupon
GROUP BY cu.codigoCupon, cu.descuentoCupon;
GO

------------------------------------------------
-- 8. Detalle completo de un pedido específico
--    (puedes cambiar el 1001 por otro IdPedido)
------------------------------------------------
SELECT  p.IdPedido,
        c.nombreCliente,
        p.fechaCompra,
        p.metodoPago,
        p.estadoPedido,
        pr.IdProducto,
        pr.nombreProducto,
        d.cantidad,
        d.precioProducto,
        d.cantidad * d.precioProducto AS subtotal
FROM dbo.Pedido        AS p
JOIN dbo.Cliente       AS c  ON p.IdCliente  = c.IdCliente
JOIN dbo.DetallePedido AS d  ON p.IdPedido   = d.IdPedido
JOIN dbo.Producto      AS pr ON d.IdProducto = pr.IdProducto
WHERE p.IdPedido = 1001;
GO
