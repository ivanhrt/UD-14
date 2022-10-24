CREATE SCHEMA Directores_t14_7;
USE Directores_t14_7;
CREATE TABLE Despachos(
numero INT NOT NULL AUTO_INCREMENT,
capacidad INT,
KEY(numero)
);
CREATE TABLE Directores(
dni VARCHAR(8),
nombre_apellidos VARCHAR(255),
dni_jefe VARCHAR(8),
despacho INT,
KEY(dni),
FOREIGN KEY (dni_jefe) REFERENCES Directores(dni),
FOREIGN KEY (despacho) REFERENCES Despachos(numero)
);