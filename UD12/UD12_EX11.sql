CREATE DATABASE accidentes_geograficos;
USE accidentes_geograficos;

DROP TABLE IF EXISTS pais;
CREATE TABLE pais (
nombre VARCHAR(30) NOT NULL,
poblacion INT,
extension INT,
PRIMARY KEY (nombre)
);

DROP TABLE IF EXISTS accidente_geografico;
CREATE TABLE accidente_geografico (
id_accidente INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(30) not null,
posicion_horizontal int,
posicion_vertical int,
pais VARCHAR(30),
PRIMARY KEY (id_accidente),
FOREIGN KEY (pais)
REFERENCES pais(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS localidad;
CREATE TABLE localidad (
id_localidad INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(30) not null,
pais VARCHAR(30),
PRIMARY KEY (id_localidad),
FOREIGN KEY (pais)
REFERENCES pais(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS rio;
CREATE TABLE rio (
id_accidente INT NOT NULL,
longitud INT,
id_localidad INT NOT NULL,
PRIMARY KEY (id_accidente),
FOREIGN KEY (id_localidad)
REFERENCES localidad(id_localidad)
ON DELETE CASCADE
ON UPDATE CASCADE
);
DROP TABLE IF EXISTS montaña;
CREATE TABLE montaña (
id_accidente INT  NOT NULL,
altura INT,
PRIMARY KEY (id_accidente)
);

DROP TABLE IF EXISTS lago;
CREATE TABLE lago (
id_accidente INT NOT NULL,
extension INT,
PRIMARY KEY (id_accidente)
);