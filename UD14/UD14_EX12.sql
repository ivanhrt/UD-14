CREATE DATABASE Ejercicio12;
use Ejercicio12;




create table profesores(
DNI int(8) primary key,
nombre nvarchar(24) UNIQUE ,
apellido1 nvarchar(24),
apellido2 nvarchar(24),
direccion nvarchar (100),
titulos nvarchar(24),
gana int(8) not null 
);


create table cursos(
codCurso int(8) auto_increment primary key,
nombreCurso nvarchar(64) UNIQUE,
maxAlumnos int(2),
fechaInicio date,
fechaFin date,
numHoras int(4) not null,
dni_profesor int(8),
key (dni_profesor),
FOREIGN KEY (dni_profesor) REFERENCES profesores (DNI) 
ON DELETE CASCADE ON UPDATE CASCADE
);


create table alumnos(
DNI int(8) primary key,
nombre nvarchar(24),
apellido1 nvarchar(24),
apellido2 nvarchar(24),
direccion nvarchar (100),
sexo char(1),
fechaNacimiento date,
codCurso int(8) not null,
key (codCurso),
FOREIGN KEY (codCurso) REFERENCES cursos (codCurso) 
ON DELETE CASCADE ON UPDATE CASCADE
);

