CREATE DATABASE ejercicio9_ER;
use ejercicio9_ER;




create table ingredientes(
idIngredientes int(4) auto_increment primary key,
nombre nvarchar(24),
fechaCaducidad date
);

create table receta(
idReceta int(4) auto_increment primary key,
descripcion text,
dificultad char(1)
);

create table utencilios(
idUtencilios int(4) auto_increment primary key,
nombre nvarchar(24),
descripcion text(255),
cantidad int(3)
);


create table platos (
idPlato int(4) auto_increment primary key,
nombre nvarchar(24),
tiempo int,
idUtencilios int(4),
idReceta int(4),
idIngredientes int(4),
KEY (idUtencilios),
FOREIGN KEY (idUtencilios) REFERENCES utencilios (idUtencilios) 
ON DELETE cascade on update cascade,
KEY (idReceta),
FOREIGN KEY (idReceta) REFERENCES receta (idReceta) 
ON DELETE cascade on update cascade,
KEY (idIngredientes),
FOREIGN KEY (idIngredientes) REFERENCES ingredientes (idIngredientes) 
ON DELETE cascade on update cascade
);