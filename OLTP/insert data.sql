CREATE TABLE Clientes (
    ID_Cliente INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100),
    Correo VARCHAR(100),
    Puntos_Frecuencia INT
);

CREATE TABLE Ventas (
    ID_Venta INT IDENTITY PRIMARY KEY,
    ID_Cliente INT,
    Fecha DATE,
    Total DECIMAL(10,2),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

INSERT INTO Clientes (Nombre, Correo, Puntos_Frecuencia)
VALUES ('Ana Torres', 'ana@gmail.com', 50);

INSERT INTO Ventas (ID_Cliente, Fecha, Total)
VALUES (1, '2026-01-20', 30.00);

SELECT * FROM Clientes;

SELECT * FROM Ventas;

UPDATE Clientes
SET Puntos_Frecuencia = 80
WHERE ID_Cliente = 1;

SELECT * FROM Clientes;

INSERT INTO Ventas (ID_Cliente, Fecha, Total)
VALUES (1, '2026-01-21', 45.00);

SELECT * FROM Ventas;

DELETE FROM Ventas
WHERE Total = 30.00;

SELECT * FROM Ventas;

SELECT c.Nombre, v.Fecha, v.Total
FROM Clientes c
JOIN Ventas v ON c.ID_Cliente = v.ID_Cliente;