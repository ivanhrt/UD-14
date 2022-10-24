CREATE DATABASE estacion;
USE estacion;

CREATE TABLE estacion(
identificador MEDIUMINT UNSIGNED NOT NULL,
latitud VARCHAR(14) NOT NULL,
longitud VARCHAR(15) NOT NULL,
altitud MEDIUMINT NOT NULL,
PRIMARY KEY(identificador)
);

CREATE TABLE muestra(
id_estacion MEDIUMINT UNSIGNED NOT NULL,
fecha DATE NOT NULL,
temp_min TINYINT,
temp_max TINYINT,
precipitaciones SMALLINT UNSIGNED,
humedad_min TINYINT UNSIGNED,
humedad_max TINYINT UNSIGNED,
velocidad_min SMALLINT UNSIGNED,
velocidad_max SMALLINT UNSIGNED,
KEY(id_estacion),
FOREIGN KEY(id_estacion)
REFERENCES estacion(identificador)
ON DELETE NO ACTION
ON UPDATE CASCADE
);