CREATE DATABASE ejercicio12_ER;
use ejercicio12_ER;


create table empresa(
cif int(8) auto_increment primary key,
nombre nvarchar(24),
direccion nvarchar(100),
telefono int(9),
codigoInterno int(9)
);

create table proyecto(
idProyecto int(8) auto_increment primary key,
fechaInicio date,
fechaFinal date,
fechaPrevista date,
cif int(8),
KEY (cif),
FOREIGN KEY (cif) REFERENCES empresa (cif) 
ON DELETE cascade on update cascade
);


create table trabajador(
idTrabajador int(8) auto_increment primary key,
dni int(8),
nombre nvarchar(24),
apellido nvarchar(24)
);


create table programador(
codigoInterno int(8) auto_increment primary key,
idTrabajador int(8),
FOREIGN KEY (idTrabajador) REFERENCES trabajador (idTrabajador) 
ON DELETE cascade on update cascade
);

create table analista(
codigoInterno int(8) auto_increment primary key,
idTrabajador int(8),
FOREIGN KEY (idTrabajador) REFERENCES trabajador (idTrabajador) 
ON DELETE cascade on update cascade
);

create table administradorDiseño(
codigoInterno int(8) auto_increment primary key,
idTrabajador int(8),
FOREIGN KEY (idTrabajador) REFERENCES trabajador (idTrabajador) 
ON DELETE cascade on update cascade
);

create table jefe(
codigoInterno int(8) auto_increment primary key,
idTrabajador int(8),
FOREIGN KEY (idTrabajador) REFERENCES trabajador (idTrabajador) 
ON DELETE cascade on update cascade
);

create table hacen(
idTrabajador int(8),
idProyecto int(8),
horasTrabajadas int(4),
primary key(idTrabajador,idProyecto),
KEY (idTrabajador),
FOREIGN KEY (idTrabajador) REFERENCES trabajador (idTrabajador) 
ON DELETE cascade on update cascade,
KEY (idProyecto),
FOREIGN KEY (idProyecto) REFERENCES proyecto (idProyecto) 
ON DELETE cascade on update cascade

);
