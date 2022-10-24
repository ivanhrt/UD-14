CREATE DATABASE Ejercicio9;
use Ejercicio9;


CREATE table proyecto (
id int(4) auto_increment primary key, 
nombre nvarchar(100),
horas int
);

CREATE table cientificos (
DNI int(8) auto_increment primary key, 
nombreApels nvarchar(255)
);


CREATE table asignadoA (
DNI int(8) NOT NULL , 
proyecto int(4) NOT NULL ,
primary KEY(DNI, proyecto),
KEY(DNI),
KEY(proyecto),
FOREIGN KEY (DNI) REFERENCES proyecto (id) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (proyecto) REFERENCES cientificos (DNI) 
ON DELETE CASCADE ON UPDATE CASCADE
);

insert into proyecto(nombre, horas) values 
('proyecto manhattan', 500),
('proyecto deli', 233),
('proyecto sylas', 14);

insert into cientificos(nombreApels) values ("carlos"),
("veronica"),
("luis");

select * from proyecto;
select * from cientificos;


insert into asignadoA (DNI, proyecto) values (1,3),
(2,2),
(2,1);

select * from asignadoA;

delete from cientificos where DNI = 1;