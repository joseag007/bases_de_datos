/********************
* Script: Ejercicio DDL de clase nº1.
* Creamos la base de datos físia del ejercicio
* Empresa de transporte; tema 2
********************/

-- Borra la base de datos empresa_transporte si existe
DROP DATABASE IF EXISTS empresa_transporte;

-- Crea la base de datos empresa_transporte
CREATE DATABASE empresa_transporte;

-- Selecciona la base de datos en la que se va trabajar 
USE empresa_transporte;

-- Crea la tabla camioneros
CREATE TABLE camioneros (
DNI CHAR(9) PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL,
Telefono VARCHAR(20) NOT NULL,
Direccion VARCHAR(50) NOT NULL,
Salario NUMERIC(8,2),
Poblacion VARCHAR(20)NOT NULL
);

-- Insertamos filas en camioneros
INSERT INTO camioneros (DNI, Nombre, Telefono, Direccion, Salario, Poblacion)
VALUES ('24567890Z', 'Antonio Sánchez', '951324567', 'Av. Parménides', '2200', 'Málaga'),
		('32454123A', 'Carlos Martínez', '655213456', 'San Miquel', '2500', 'Torremolinos');

-- Consultamos la tabla camiones
SELECT * FROM camioneros;

-- Crea la tabla provincias
CREATE TABLE provincias (
Codigo VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(50) UNIQUE KEY NOT NULL -- El nombre no se puede repetir 
);

-- Insertamos filas en provincias
INSERT INTO provincias (Codigo, Nombre)
VALUES ('MAL001', 'Málaga'),
		('BAR001', 'Barcelona');

-- Consultamos la tabla provincias
SELECT * FROM provincias;

-- Crea la tabla camiones
CREATE TABLE camiones (
Matricula VARCHAR(10) PRIMARY KEY,
Modelo VARCHAR(20) NOT NULL,
Tipo ENUM('camioneta', 'ligero', 'mediano', 'pesado'),
Potencia SMALLINT UNSIGNED );

-- Insertamos filas en camiones
INSERT INTO camiones (Matricula, Modelo, Tipo,Potencia)
VALUES ('1245BJN', 'Pegaso', 'Camioneta', '500'),
		('1355BJN', 'Volvo', 'Camioneta', '800');

-- Consultamos la tabla camiones
SELECT * FROM camiones;

-- Crea la tabla paquetes
CREATE TABLE paquetes (
Codigo VARCHAR(20) PRIMARY KEY,
Descripcion VARCHAR(100) NOT NULL,
Destinatario VARCHAR(100) NOT NULL,
Direccion VARCHAR(100) NOT NULL,
DNI_Camionero CHAR(9) NOT NULL,
Codigo_provincia VARCHAR(10) NOT NULL,
FOREIGN KEY (DNI_Camionero) REFERENCES Camioneros(DNI),
FOREIGN KEY (Codigo_provincia) REFERENCES Provincias(Codigo)
);

-- Insertamos filas en la tabla paquetes
INSERT INTO paquetes (Codigo, Descripcion, Destinatario, Direccion, DNI_Camionero, Codigo_Provincia)
VALUES ('A100', 'Fragil Urgente', 'María Dueñas Jiménez', 'San Miguel 7, Torremolinos', '24567890Z', 'MAL001'),
		('A101', 'Pesado Urgente', 'Antonio Dueñas Jiménez', 'San Miguel 7, Torremolinos', '32454123A', 'MAL001');

-- Consultamos la tabla paquetes
SELECT * FROM paquetes;

-- Crea la tabla conduce
CREATE TABLE conduce(
DNI_Camionero CHAR(9) NOT NULL,
Matricula VARCHAR(10) NOT NULL,
Fecha DATETIME NOT NULL,
PRIMARY KEY (DNI_Camionero, Matricula, Fecha),
FOREIGN KEY (DNI_Camionero) REFERENCES Camioneros(DNI),
FOREIGN KEY (Matricula) REFERENCES Camiones(Matricula)
);

-- Insertamos filas en la tabla conduce
INSERT INTO conduce (DNI_Camionero, Matricula, Fecha)
VALUES('24567890Z', '1245BJN', '2023-10-23-21-34-01'),
		('24567890Z', '1355BJN', '2025-6-29-09-45-34');
        
-- Consultamos la tabla conduce
SELECT * FROM conduce;

-- Eliminamos a un camionero llamado Antonio Sanchez
DELETE FROM camioneros WHERE DNI = '24567890Z';
