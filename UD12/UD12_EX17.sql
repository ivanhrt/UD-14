CREATE DATABASE horario_escolar;
USE horario_escolar;

DROP TABLE IF EXISTS ciclo;
CREATE TABLE ciclo (
id_ciclo INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(20),
tipo VARCHAR(20),
PRIMARY KEY (id_ciclo)
);

DROP TABLE IF EXISTS asignatura;
CREATE TABLE asignatura (
codigo_europeo INT AUTO_INCREMENT NOT NULL,
codigo_interno INT NOT NULL,
nombre VARCHAR(20),
PRIMARY KEY (codigo_europeo)
);

DROP TABLE IF EXISTS contiene;
CREATE TABLE contiene (
codigo_europeo INT  NOT NULL,
id_ciclo INT NOT NULL,
curso INT,
PRIMARY KEY (codigo_europeo, id_ciclo),
FOREIGN KEY (codigo_europeo)
REFERENCES asignatura(codigo_europeo)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_ciclo)
REFERENCES ciclo(id_ciclo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS horario;
CREATE TABLE horario (
id_horario INT AUTO_INCREMENT NOT NULL,
dia DATE,
hora DATETIME,
PRIMARY KEY (id_horario)
);

DROP TABLE IF EXISTS aula;
CREATE TABLE aula (
codigo_aula INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(20),
numero INT,
medida INT,
PRIMARY KEY (codigo_aula)
);

DROP TABLE IF EXISTS hacer_clase;
CREATE TABLE hacer_clase (
codigo_europeo INT  NOT NULL,
id_horario INT NOT NULL,
codigo_aula INT NOT NULL,
PRIMARY KEY (codigo_europeo, id_horario, codigo_aula),
FOREIGN KEY (codigo_europeo)
REFERENCES asignatura(codigo_europeo)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (id_horario)
REFERENCES horario(id_horario)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (codigo_aula)
REFERENCES aula(codigo_aula)
ON DELETE CASCADE
ON UPDATE CASCADE
);

DROP TABLE IF EXISTS profesor;
CREATE TABLE profesor (
dni VARCHAR(10) NOT NULL,
nombre VARCHAR(20),
apellido VARCHAR(20),
telefono INT,
direccion VARCHAR(20),
email VARCHAR(20),
nss VARCHAR(20),
codigo_interno INT,
años_antiguedad INT,
PRIMARY KEY (dni)
);

DROP TABLE IF EXISTS imparte;
CREATE TABLE imparte (
codigo_europeo INT NOT NULL,
dni VARCHAR(10) NOT NULL,
fecha_inicio DATE,
fecha_fin DATE,
PRIMARY KEY (codigo_europeo, dni),
FOREIGN KEY (codigo_europeo)
REFERENCES asignatura(codigo_europeo)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (dni)
REFERENCES profesor(dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);