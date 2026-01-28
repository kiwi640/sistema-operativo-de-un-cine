create database sistema_operativo_cine;
go 
use sistema_operativo_cine;

CREATE TABLE Peliculas (
    ID_Pelicula INT IDENTITY PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Genero VARCHAR(50),
    Duracion INT,
    Clasificacion VARCHAR(10)
);

CREATE TABLE Salas (
    ID_Sala INT IDENTITY PRIMARY KEY,
    Numero INT NOT NULL,
    Capacidad INT NOT NULL,
    Tipo_Pantalla VARCHAR(50)
);

CREATE TABLE Funciones (
    ID_Funcion INT IDENTITY PRIMARY KEY,
    ID_Pelicula INT NOT NULL,
    ID_Sala INT NOT NULL,
    Horario DATETIME NOT NULL,
    CONSTRAINT FK_Funciones_Peliculas
        FOREIGN KEY (ID_Pelicula) REFERENCES Peliculas(ID_Pelicula),
    CONSTRAINT FK_Funciones_Salas
        FOREIGN KEY (ID_Sala) REFERENCES Salas(ID_Sala)
);

CREATE TABLE Clientes (
    ID_Cliente INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100),
    Correo VARCHAR(100),
    Puntos_Frecuencia INT
);

CREATE TABLE Ventas (
    ID_Venta INT IDENTITY PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Fecha DATETIME NOT NULL,
    Total DECIMAL(10,2),
    CONSTRAINT FK_Ventas_Clientes
        FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE Boletos (
    ID_Boleto INT IDENTITY PRIMARY KEY,
    ID_Funcion INT NOT NULL,
    ID_Venta INT NOT NULL,
    Asiento VARCHAR(5) NOT NULL,
    Precio DECIMAL(8,2),
    CONSTRAINT FK_Boletos_Funciones
        FOREIGN KEY (ID_Funcion) REFERENCES Funciones(ID_Funcion),
    CONSTRAINT FK_Boletos_Ventas
        FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta)
);

CREATE TABLE Productos_Dulceria (
    ID_Producto INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100),
    Categoria VARCHAR(50),
    Stock INT,
    Precio DECIMAL(8,2)
);

CREATE TABLE Venta_Producto (
    ID_VentaProducto INT IDENTITY PRIMARY KEY,
    ID_Venta INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT,
    Precio_Unitario DECIMAL(8,2),
    CONSTRAINT FK_VentaProducto_Ventas
        FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    CONSTRAINT FK_VentaProducto_Productos
        FOREIGN KEY (ID_Producto) REFERENCES Productos_Dulceria(ID_Producto)
);

