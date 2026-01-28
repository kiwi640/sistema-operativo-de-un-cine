create database sistema_operativo_cine_bi;
use sistema_operativo_cine_bi;
use sistema_operativo_cine_bi

CREATE TABLE Dim_Tiempo (
    ID_Tiempo INT IDENTITY PRIMARY KEY,
    Fecha DATE,
    Dia INT,
    Mes INT,
    Anio INT,
    Trimestre INT
);

CREATE TABLE Dim_Pelicula (
    ID_Pelicula INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Genero VARCHAR(50),
    Clasificacion VARCHAR(10)
);

CREATE TABLE Dim_Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Puntos_Frecuencia INT
);

CREATE TABLE Dim_Producto (
    ID_Producto INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Categoria VARCHAR(50)
);

CREATE TABLE Fact_Ventas (
    ID_FactVenta INT IDENTITY PRIMARY KEY,
    ID_Tiempo INT,
    ID_Pelicula INT,
    ID_Cliente INT,
    ID_Producto INT,
    Cantidad_Tickets INT,
    Ingresos_Taquilla DECIMAL(10,2),
    Ingresos_Dulceria DECIMAL(10,2),
    FOREIGN KEY (ID_Tiempo) REFERENCES Dim_Tiempo(ID_Tiempo),
    FOREIGN KEY (ID_Pelicula) REFERENCES Dim_Pelicula(ID_Pelicula),
    FOREIGN KEY (ID_Cliente) REFERENCES Dim_Cliente(ID_Cliente),
    FOREIGN KEY (ID_Producto) REFERENCES Dim_Producto(ID_Producto)
);

