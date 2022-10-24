/*CREATE DATABASE ejercicio6_ER;
use ejercicio6_ER;

*/


create table socio(
codigoSocio int(8) auto_increment primary key,
nombre nvarchar(24),
apellido nvarchar(24),
dni int(8),
direccion nvarchar(100),
telefono int(9)
);

create table autor(
idAutor int(8) auto_increment primary key,
nombre nvarchar(24),
pais nvarchar(24)
);


create table articulo(
codigoArticulo int(8) auto_increment primary key,
nombre nvarchar(24),
resumen nvarchar(100),
estado boolean,
idAutor int(8) ,
KEY(idAutor),
FOREIGN KEY (idAutor) REFERENCES autor (idAutor) 
ON DELETE CASCADE ON UPDATE CASCADE
);

create table libro (
codigoArticulo int(8) auto_increment primary key,
key(codigoArticulo),
FOREIGN KEY (codigoArticulo) REFERENCES articulo (codigoArticulo),
numeroPaginas int(4)
);

create table cd (
codigoArticulo int(8) auto_increment primary key,
key(codigoArticulo),
FOREIGN KEY (codigoArticulo) REFERENCES articulo (codigoArticulo),
numeroCanciones int(2)
);

create table pelicula (
codigoArticulo int(8) auto_increment primary key,
key(codigoArticulo),
FOREIGN KEY (codigoArticulo) REFERENCES articulo (codigoArticulo),
duracion int(3)
);


create table prestamo (
idPrestamo int(8) auto_increment primary key,
fechaPrestamo date,
fechaDevolucion date,
fechaLimite date,
codigoSocio int(8),
KEY(codigoSocio),
FOREIGN KEY (codigoSocio) REFERENCES socio (codigoSocio) 
ON DELETE CASCADE ON UPDATE CASCADE,
codigoArticulo int(8),
KEY(codigoArticulo),
FOREIGN KEY (codigoArticulo) REFERENCES articulo (codigoArticulo) 
ON DELETE CASCADE ON UPDATE CASCADE
);

