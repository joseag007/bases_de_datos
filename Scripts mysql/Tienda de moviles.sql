/********************
* Script: Ejercicio DDL de clase nº3.
* Creamos la base de datos físia del ejercicio
* Tienda de moviles; tema 2
********************/

-- Borra la base de datos Tienda_moviles si existe
DROP DATABASE IF EXISTS Tienda_moviles;

-- Crea la base de datos Tienda_moviles
CREATE DATABASE Tienda_moviles;

-- Selecciona la base de datos en la que se va trabajar 
USE Tienda_moviles;

-- Crea la tabla profesores
CREATE TABLE empleados (
DNI CHAR(9) PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Apellidos VARCHAR(30) NOT NULL,
Fecha_alta DATE NOT NULL,
Cuenta_ban VARCHAR(25)
);

-- Insertamos filas en profesores
INSERT INTO profesores (DNI, Nombre, Telefono, Direccion)
VALUES ('24567890Z', 'Antonio Sánchez', '951324567', 'Av. Parménides'),
		('32454123A', 'Carlos Martínez', '655213456', 'San Miquel');

-- Consultamos la tabla profesores
SELECT * FROM profesores;

-- Crea la tabla módulos
CREATE TABLE modulos (
Codigo VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(50) UNIQUE KEY NOT NULL, -- El nombre no se puede repetir 
Curso VARCHAR(20) ,
DNI_Profesor VARCHAR (9),
FOREIGN KEY (DNI_Profesor) REFERENCES Profesores(DNI)
);

-- Insertamos filas en modulos
INSERT INTO modulos (Codigo, Nombre, Curso, DNI_Profesor)
VALUES ('23456', 'Lenguaje de Marcas', '1º DAM', '24567890Z'),
		('123456', 'Base de datos', '1º DAW', '32454123A');

-- Consultamos la tabla modulos
SELECT * FROM modulos;

-- Crea la tabla alumnos
CREATE TABLE alumnos (
Nº_Exp VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Apellidos VARCHAR(30) NOT NULL,
Fecha_Nac DATE NOT NULL,
Nº_Exp_Delegado VARCHAR(10),
FOREIGN KEY (Nº_Exp_Delegado) REFERENCES alumnos(Nº_Exp), 
Grupo VARCHAR(20)
);

-- Insertamos filas en alumnos
INSERT INTO alumnos (Nº_Exp, Nombre, Apellidos,Fecha_Nac, Nº_Exp_Delegado, Grupo)
VALUES ('1234567', 'Antonio', 'Martínez', '2008-04-30', '1234567', '1º DAM'),
		('34567890', 'María', 'Sánchez', '2008-12-31', '1234567', '1º DAM');

-- Consultamos la tabla alumnos
SELECT * FROM alumnos;

-- Crea la tabla matriculaciones
CREATE TABLE matriculaciones (
Nº_Exp VARCHAR(20) NOT NULL,
Codigo_Modulo VARCHAR(100) NOT NULL,
PRIMARY KEY (Nº_Exp, Codigo_Modulo),
FOREIGN KEY (Nº_Exp) REFERENCES alumnos(Nº_Exp),
FOREIGN KEY (Codigo_Modulo) REFERENCES modulos(Codigo)
);

-- Insertamos filas en la tabla paquetes
INSERT INTO matriculaciones (Nº_Exp, Codigo_Modulo)
VALUES ('1234567', '23456'),
		('34567890', '23456');

-- Consultamos la tabla paquetes
SELECT * FROM matriculaciones;