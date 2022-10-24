CREATE DATABASE menu_diario;
USE menu_diario;

DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
id_menu INT AUTO_INCREMENT NOT NULL,
fecha DATE,
num_personas INT,
PRIMARY KEY (id_menu)
);

DROP TABLE IF EXISTS dia_semana;
CREATE TABLE dia_semana (
nombre_dia VARCHAR(10) NOT NULL,
temperatura DOUBLE,
PRIMARY KEY (nombre_dia)
);

DROP TABLE IF EXISTS plato;
CREATE TABLE plato (
id_plato INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(20),
descripción VARCHAR(50),
tipo VARCHAR(20),
cantidad INT,
PRIMARY KEY (id_plato)
);

DROP TABLE IF EXISTS servir;
CREATE TABLE servir (
id_plato INT NOT NULL,
nombre_dia VARCHAR(10) NOT NULL,
PRIMARY KEY (id_plato, nombre_dia),
FOREIGN KEY (id_plato)
REFERENCES plato(id_plato)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (nombre_dia)
REFERENCES dia_semana(nombre_dia)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS contener;
CREATE TABLE contener (
id_plato INT NOT NULL,
id_menu INT NOT NULL,
PRIMARY KEY (id_plato, id_menu),
FOREIGN KEY (id_plato)
REFERENCES plato(id_plato)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_menu)
REFERENCES menu(id_menu)
ON DELETE CASCADE
ON UPDATE CASCADE
);