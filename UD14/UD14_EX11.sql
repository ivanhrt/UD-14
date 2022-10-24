CREATE DATABASE investigadores;
USE investigadores;

CREATE TABLE facultad(
codigo_facultad INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(100),
PRIMARY KEY (codigo_facultad)
);

CREATE TABLE investigador(
dni VARCHAR(8) NOT NULL,
nombre VARCHAR(100),
codigo_facultad INT NOT NULL,
PRIMARY KEY (dni),
FOREIGN KEY (codigo_facultad)
REFERENCES facultad(codigo_facultad)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE equipo(
num_serie CHAR(4) NOT NULL,
nombre VARCHAR(100),
codigo_facultad INT NOT NULL,
PRIMARY KEY (num_serie),
FOREIGN KEY (codigo_facultad)
REFERENCES facultad(codigo_facultad)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE reserva(
num_serie CHAR(4) NOT NULL,
dni VARCHAR(8) NOT NULL,
comienzo DATETIME,
fin DATETIME,
PRIMARY KEY (num_serie, dni),
FOREIGN KEY (num_serie)
REFERENCES equipo(num_serie)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni)
REFERENCES investigador(dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);