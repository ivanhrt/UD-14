CREATE SCHEMA Empleados_t14_1;
USE Empleados_t14_1;

CREATE TABLE Departamentos(
codigo INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100),
presupuesto INT,
KEY (codigo)
);

CREATE TABLE Emlpleados(
dni VARCHAR(8) NOT NULL,
nombre VARCHAR(100),
apellido VARCHAR(255),
departamento INT,
KEY (dni),
FOREIGN KEY (departamento) REFERENCES Departamentos (codigo)
);