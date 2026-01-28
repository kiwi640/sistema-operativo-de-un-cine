

--poblar Dim_tiempo
INSERT INTO Dim_Tiempo (Fecha, Dia, Mes, Anio, Trimestre)
SELECT DISTINCT
    v.Fecha,
    DAY(v.Fecha)        AS Dia,
    MONTH(v.Fecha)      AS Mes,
    YEAR(v.Fecha)       AS Anio,
    DATEPART(QUARTER, v.Fecha) AS Trimestre
FROM Ventas v;

--poblar Dim_pelicula
INSERT INTO Dim_Pelicula (ID_Pelicula, Titulo, Genero, Clasificacion)
SELECT
    p.ID_Pelicula,
    p.Titulo,
    p.Genero,
    p.Clasificacion
FROM Peliculas p;

--poblar Dim_cliente
INSERT INTO Dim_Cliente (ID_Cliente, Nombre, Puntos_Frecuencia)
SELECT
    c.ID_Cliente,
    c.Nombre,
    c.Puntos_Frecuencia
FROM Clientes c;

--poblar Dim_producto
INSERT INTO Dim_Producto (ID_Producto, Nombre, Categoria)
SELECT
    p.ID_Producto,
    p.Nombre,
    p.Categoria
FROM Productos_Dulceria p;

--poblar fact_ventas
INSERT INTO Fact_Ventas (
    ID_Tiempo,
    ID_Pelicula,
    ID_Cliente,
    ID_Producto,
    Cantidad_Tickets,
    Ingresos_Taquilla,
    Ingresos_Dulceria
)
SELECT
    dt.ID_Tiempo,
    f.ID_Pelicula,
    v.ID_Cliente,
    vp.ID_Producto,
    COUNT(b.ID_Boleto) AS Cantidad_Tickets,
    SUM(b.Precio)      AS Ingresos_Taquilla,
    SUM(vp.Cantidad * vp.Precio_Unitario) AS Ingresos_Dulceria
FROM Ventas v
JOIN Boletos b ON v.ID_Venta = b.ID_Venta
JOIN Funciones f ON b.ID_Funcion = f.ID_Funcion
JOIN Dim_Tiempo dt ON v.Fecha = dt.Fecha
LEFT JOIN Venta_Producto vp ON v.ID_Venta = vp.ID_Venta
GROUP BY
    dt.ID_Tiempo,
    f.ID_Pelicula,
    v.ID_Cliente,
    vp.ID_Producto;

