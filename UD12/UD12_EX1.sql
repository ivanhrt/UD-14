CREATE DATABASE biblioteca;
USE biblioteca;

DROP TABLE IF EXISTS autor;
CREATE TABLE autor (
id_autor INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(50),
PRIMARY KEY (id_autor)
);

DROP TABLE IF EXISTS libro;
CREATE TABLE libro (
isbn VARCHAR(20) NOT NULL,
editorial VARCHAR(20),
titulo VARCHAR(30),
año_escritura INT,
PRIMARY KEY (isbn)
);

DROP TABLE IF EXISTS escribe;
CREATE TABLE escribe (
id_autor INT NOT NULL,
isbn VARCHAR(20) NOT NULL,
PRIMARY KEY (id_autor, isbn),
FOREIGN KEY (id_autor)
REFERENCES autor(id_autor)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (isbn)
REFERENCES libro(isbn)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS volumen;
CREATE TABLE volumen (
id_volumen INT AUTO_INCREMENT NOT NULL,
deteriorado BOOLEAN,
isbn VARCHAR(20) NOT NULL,
PRIMARY KEY (id_volumen),
FOREIGN KEY (isbn)
REFERENCES libro(isbn)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS persona;
CREATE TABLE persona (
dni VARCHAR(10) NOT NULL,
codigo_socio INT NOT NULL,
nombre VARCHAR(15) NOT NULL,
apellidos VARCHAR(20),
direccion VARCHAR(30),
telefono INT,
PRIMARY KEY (dni, codigo_socio)
);

DROP TABLE IF EXISTS prestamo;
CREATE TABLE prestamo (
id_prestamo INT AUTO_INCREMENT NOT NULL,
fecha_prestamo DATE,
fecha_devolucion DATE,
fecha_devolucion_real DATE,
dni VARCHAR(10) NOT NULL,
PRIMARY KEY (id_prestamo),
FOREIGN KEY (dni)
REFERENCES persona(dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);

