create database Ejercicio3;
use Ejercicio3;

CREATE table fabricantes (
codigo int auto_increment primary key, 
nombre nvarchar(100)
);
CREATE table articulos (
codigo int auto_increment primary key, 
nombre nvarchar(100),
precio int,
fabricante int,
KEY (fabricante),
FOREIGN KEY (fabricante) REFERENCES fabricantes (codigo) 
ON DELETE CASCADE ON UPDATE CASCADE);

insert into fabricantes(nombre) values 
('mecanoma'),
('taler'),
('BM');

insert into articulos(nombre,precio,fabricante) values
("mancuerna",33,1),
("tornillos",566,1),
("coche",11,2),
("Diamante",98,3);

/*
drop table articulos;
drop tables fabricantes;articulos_ibfk_1
*/
delete from fabricantes where codigo = 2;

select * from fabricantes;
select * from articulos;