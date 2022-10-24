CREATE DATABASE ejercicio2_ER;
use ejercicio2_ER;


create table profesores(
dniProfesor int(8) auto_increment primary key ,
nombre nvarchar(24),
apellidos nvarchar(24),
direccion nvarchar(100),
telefonos int(9)
);



create table empresa(
cif int(8) not null primary key,
nombre nvarchar(16),
telefono int(9),
direccion nvarchar(100));


create table alumnos(
dni int(8) not null primary key,
nombre nvarchar(16),
direccion nvarchar(100),
telefono int(9),
cifEmpresa int(8),
key (cifEmpresa),
FOREIGN KEY (cifEmpresa) REFERENCES empresa (cif) 
ON DELETE CASCADE ON UPDATE CASCADE
);

create table curso(
codigoCurso int(4) auto_increment primary key ,
programa nvarchar(100),
duracion nvarchar(100),
titulo nvarchar(100),
fechaInicio date,
fechaFinal date,
añoCurso int(1),
dniProfesor int (8),
key(dniProfesor),
FOREIGN KEY (dniProfesor) REFERENCES profesores (dniProfesor) 
ON DELETE set null
);


CREATE table cursa (
dniAlumno int(8) NOT NULL , 
codigoCurso int(4) NOT NULL ,
primary KEY(dniAlumno, codigoCurso),
KEY(dniAlumno),
KEY(codigoCurso),
FOREIGN KEY (dniAlumno) REFERENCES alumnos (dni) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (codigoCurso) REFERENCES curso (codigoCurso) 
ON DELETE CASCADE ON UPDATE CASCADE,
nota int(2)
); 



