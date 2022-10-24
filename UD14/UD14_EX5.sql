CREATE DATABASE almacen;
USE almacen;

CREATE TABLE almacenes(
codigo_almacen INT AUTO_INCREMENT NOT NULL,
lugar VARCHAR(100),
capacidad INT,
PRIMARY KEY (codigo_almacen)
);

CREATE TABLE cajas(
num_referencia CHAR(5) NOT NULL,
contenido VARCHAR(100),
valor INT,
codigo_almacen INT NOT NULL,
PRIMARY KEY (num_referencia),
FOREIGN KEY (codigo_almacen)
REFERENCES almacenes(codigo_almacen)
ON DELETE CASCADE
ON UPDATE CASCADE
);