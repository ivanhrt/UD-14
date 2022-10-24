create database Ejercicio6;
use Ejercicio6;

CREATE table peliculas (
codigo int auto_increment primary key, 
nombre nvarchar(100),
clasificacionEdad int (2)
);

insert into peliculas(nombre,clasificacionEdad) values
("Kill bill", 18),
("Cars", 7),
("La sirenita", 3),
("Interstellar", 12);


CREATE table salas (
codigo int auto_increment primary key, 
pelicula int,
nombreSala nvarchar(100),
KEY (pelicula),
FOREIGN KEY (pelicula) REFERENCES peliculas (codigo) 
ON DELETE SET NULL);

insert into salas(pelicula,nombreSala) values
(1, "Sala apollo"),
(1, "Sala nervio"),
(2, "Sala tres"),
(2, "Sala lucky"),
(3, "Sala majo");


update salas set pelicula = 2 where codigo = 1 ;


select * from peliculas;
select * from salas;

delete from peliculas where codigo=4;

update salas 
set pelicula = 2 
where codigo = 2;

drop database Ejercicio6;