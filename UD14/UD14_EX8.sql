CREATE DATABASE piezas_proveedores;
USE piezas_proveedores;

CREATE TABLE pieza(
codigo_pieza INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(100),
PRIMARY KEY (codigo_pieza)
);

CREATE TABLE proveedor(
id_proveedor CHAR(4) NOT NULL,
nombre VARCHAR(100),
PRIMARY KEY (id_proveedor)
);

CREATE TABLE suministra(
codigo_pieza INT NOT NULL,
id_proveedor CHAR(4) NOT NULL,
precio INT,
PRIMARY KEY (codigo_pieza, id_proveedor),
FOREIGN KEY (codigo_pieza)
REFERENCES pieza(codigo_pieza)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_proveedor)
REFERENCES proveedor(id_proveedor)
ON DELETE CASCADE
ON UPDATE CASCADE
);