CREATE DATABASE ejercicio5_ER;
use ejercicio5_ER;


create table almacen(
numeroAlmacen int(4)  auto_increment primary key,
nombre nvarchar(24),
descripcion nvarchar(100),
direccion nvarchar(100)
);

create table piezas (
id int(8) auto_increment primary key,
modelo nvarchar(24),
descripcion nvarchar(100),
precio int(3)
);

create table guarda (
numeroAlmacen int(8) NOT NULL , 
id int(4) NOT NULL ,
primary KEY(id, numeroAlmacen),
KEY(numeroAlmacen),
KEY(id),
FOREIGN KEY (numeroAlmacen) REFERENCES almacen (numeroAlmacen) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id) REFERENCES piezas (id) 
ON DELETE CASCADE ON UPDATE CASCADE,
cantidad int(3),
estanteria char(1)
);

create table compuesta (
id1 int(8) NOT NULL , 
id2 int(8) NOT NULL ,
primary KEY(id1, id2),
KEY(id1),
KEY(id2),
FOREIGN KEY (id1) REFERENCES piezas (id) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id2) REFERENCES piezas (id) 
ON DELETE CASCADE ON UPDATE CASCADE
);
