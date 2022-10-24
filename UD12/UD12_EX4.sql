CREATE DATABASE guerras;
USE guerras;

DROP TABLE IF EXISTS pais;
CREATE TABLE pais (
nombre VARCHAR(20) NOT NULL,
pais_actualmente BOOLEAN,
PRIMARY KEY (nombre)
);

DROP TABLE IF EXISTS periodo_independencia;
CREATE TABLE periodo_independencia (
id_periodo INT AUTO_INCREMENT NOT NULL,
fecha_inicio DATE,
fecha_fin DATE,
nombre_pais VARCHAR(20),
PRIMARY KEY (id_periodo),
FOREIGN KEY (nombre_pais)
REFERENCES pais(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS bando;
CREATE TABLE bando (
nombre VARCHAR(20) NOT NULL,
ganador BOOLEAN,
PRIMARY KEY (nombre)
);

DROP TABLE IF EXISTS guerra;
CREATE TABLE guerra (
nombre VARCHAR(20) NOT NULL,
año_inicio INT,
año_fin INT,
PRIMARY KEY (nombre)
);

DROP TABLE IF EXISTS pertenece;
CREATE TABLE pertenece(
nombre_pais VARCHAR(20) NOT NULL,
nombre_bando VARCHAR(20) NOT NULL,
fecha_union DATE,
fecha_abandono DATE,
PRIMARY KEY (nombre_pais, nombre_bando),
FOREIGN KEY (nombre_pais)
REFERENCES pais(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (nombre_bando)
REFERENCES bando(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS participa;
CREATE TABLE participa(
nombre_guerra VARCHAR(20) NOT NULL,
nombre_bando VARCHAR(20) NOT NULL,
ganar BOOLEAN,
PRIMARY KEY (nombre_guerra, nombre_bando),
FOREIGN KEY (nombre_guerra)
REFERENCES guerra(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (nombre_bando)
REFERENCES bando(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE
);