1.- CASO DE BASE DE DATOS TRANSACCIONAL (OLTP)
Sistema de Gestión Operativa “Cine”
Administrar en tiempo real las operaciones diarias del cine, incluyendo la venta de boletos y productos de dulcería, garantizando la integridad de los datos, el control de inventario, y la concurrencia en la asignación de asientos.
________________________________________Tablas del Sistema (8 tablas – modelo realista)
•	Películas
(ID, título, género, duración, clasificación)

•	Salas
(ID, número, capacidad, tipo_pantalla)

•	Funciones
(ID, FK_Pelicula, FK_Sala, horario)
🔹 Vincula películas con salas físicas y horarios específicos.

•	Clientes
(ID, nombre, correo, puntos_frecuencia)

•	Ventas
(ID, FK_Cliente, fecha, total)
🔹 Encabeza la transacción de compra (boletos y/o productos).

•	Boletos
(ID, FK_Funcion, FK_Venta, asiento, precio)
🔹 Registra la venta de boletos por función, garantizando que un asiento no sea asignado más de una vez por función.

•	Productos_Dulcería
(ID, nombre, categoría, stock, precio)
🔹 Mantiene el inventario disponible de productos de dulcería.

•	Venta_Producto
(ID, FK_Venta, FK_Producto, cantidad, precio_unitario)
🔹 Registra el detalle de productos vendidos por cada venta, permitiendo el control de stock y el cálculo de ingresos por dulcería.


Relaciones Principales (OLTP)
•	Película 1 : N Funciones
•	Sala 1 : N Funciones
•	Cliente 1 : N Ventas
•	Venta 1 : N Boletos
•	Venta 1 : N Venta_Producto
•	Producto 1 : N Venta_Producto
Se asegura la integridad referencial y el control de concurrencia en la asignación de asientos mediante restricciones únicas en la tabla Boletos.
Justificación del Diseño OLTP
El modelo se encuentra normalizado, separando correctamente:
•	encabezado de transacción (Ventas),
•	detalle de boletos,
•	detalle de productos vendidos,
•	y control de inventario.
Esto permite un sistema escalable, auditable y alineado con un escenario real de operación.
________________________________________
2.- CASO DE BASE DE DATOS DIMENSIONAL (BI)
Data Warehouse de Inteligencia de Negocios “Cine”
Consolidar datos históricos provenientes del sistema OLTP para el análisis estratégico de rentabilidad, preferencias de audiencia, consumo de productos, y optimización de recursos.

Estructura del Modelo (Esquema Estrella – 6 tablas)
Tabla de Hechos: Fact_Ventas
Centraliza las métricas del negocio.
Claves:
•	ID_Tiempo
•	ID_Pelicula
•	ID_Sucursal
•	ID_Cliente
•	ID_Producto

Tablas de Dimensiones
•	Dim_Tiempo: Fecha, día de la semana, mes, trimestre, año, es_feriado
•	Dim_Pelicula: Título, género, idioma, estudio, clasificación
•	Dim_Sucursal: Nombre, ciudad, región, tipo_zona
•	Dim_Cliente: Rango_edad, género, nivel_lealtad
•	Dim_Producto: Categoría_snack, tamaño, proveedor
