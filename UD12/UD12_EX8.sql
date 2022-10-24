CREATE DATABASE vuelos;
USE vuelos;

DROP TABLE IF EXISTS aeropuerto;
CREATE TABLE aeropuerto (
nombre VARCHAR(30) NOT NULL,
localidad VARCHAR(20),
pais VARCHAR(20),
PRIMARY KEY (nombre)
);

DROP TABLE IF EXISTS avion;
CREATE TABLE avion (
id_avion INT AUTO_INCREMENT NOT NULL,
numero_plazas INT,
PRIMARY KEY (id_avion)
);

DROP TABLE IF EXISTS vuelo;
CREATE TABLE vuelo (
id_vuelo INT AUTO_INCREMENT NOT NULL,
fecha DATE,
hora_salida DATETIME,
hora_llegada DATETIME,
aeropuerto_salida VARCHAR(30),
aeropuerto_llegada VARCHAR(30),
avion INT NOT NULL,
PRIMARY KEY (id_vuelo),
FOREIGN KEY (aeropuerto_salida)
REFERENCES aeropuerto(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (aeropuerto_llegada)
REFERENCES aeropuerto(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (avion)
REFERENCES avion(id_avion)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS asiento;
CREATE TABLE asiento (
fila INT NOT NULL,
columna CHAR NOT NULL,
planta INT,
avion INT NOT NULL, 
PRIMARY KEY (fila,columna),
FOREIGN KEY (avion)
REFERENCES avion(id_avion)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente (
id_cliente INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(20) NOT NULL,
apellidos VARCHAR(20),
direccion VARCHAR(20),
telefono INT,
cuenta_bancaria varchar(20),
PRIMARY KEY (id_cliente)
);

DROP TABLE IF EXISTS reserva;
CREATE TABLE reserva (
id_reserva INT AUTO_INCREMENT NOT NULL,
num_plazas INT NOT NULL,
fecha DATE,
id_cliente INT NOT NULL,
PRIMARY KEY (id_reserva),
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS tarjeta_embarque;
CREATE TABLE tarjeta_embarque (
id_embarque INT AUTO_INCREMENT NOT NULL,
id_reserva INT NOT NULL,
id_cliente INT NOT NULL,
PRIMARY KEY (id_embarque),
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente),
FOREIGN KEY (id_reserva)
REFERENCES reserva(id_reserva)
);