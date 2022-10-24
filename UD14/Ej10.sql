CREATE SCHEMA Grandes_Almacenes_t14_10;
USE Grandes_Almacenes_t14_10;

CREATE TABLE Cajeros(
codigo INT NOT NULL AUTO_INCREMENT,
nombre_apellidos VARCHAR(255),
KEY(codigo)
);
CREATE TABLE Productos(
codigo INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100),
precio INT,
KEY (codigo)
);

CREATE TABLE Maquinas_registradoras(
codigo INT NOT NULL AUTO_INCREMENT,
piso INT,
KEY (codigo)
);

CREATE TABLE Venta(
cajero INT NOT NULL,
maquina INT NOT NULL,
producto INT NOT NULL,
FOREIGN KEY (cajero) REFERENCES Cajeros(codigo),
FOREIGN KEY (maquina) REFERENCES Maquinas_registradoras(codigo),
FOREIGN KEY (producto) REFERENCES Productos(codigo)
);