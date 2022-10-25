drop database if exists organigrama;
create database organigrama;
use organigrama;

drop table if exists trabajador;
create table trabajador(
	cod_trabajador int not null,
    dni varchar(9) not null,
    nombre varchar(20),
    apellidos varchar(50),
    telefono int,
    dni_responsable varchar(9),
    key (dni_responsable),
    primary key(dni)
);

drop table if exists departamento;
create table departamento(
    codigo_departamento int not null auto_increment,
    nombre varchar(20),
    coordinador varchar(8),
    primary key (codigo_departamento)
);

drop table if exists contrato;
create table contrato(
	id_contrato int not null auto_increment,
    fecha_inicio date,
    fecha_final date,
    categoria varchar(100),
    DNI varchar(8) not null,
    primary key (id_contrato)
);

drop table if exists nomina;
create table nomina(
	id_nomina int not null auto_increment,
    DNI varchar(8) not null,
    id_contrato int not null,
    fecha date,
    salario double,
    primary key (id_nomina, DNI, id_contrato)
);

alter table contrato
add constraint FK_EmpleadoContrato
foreign key (dni) references trabajador(dni)
on delete cascade on update cascade;

alter table nomina
add constraint FK_EmpleadoNomina
foreign key (dni) references trabajador(dni)
on delete cascade on update cascade,
add constraint FK_ContratoNomina
foreign key (id_contrato) references contrato(id_contrato)
on delete cascade on update cascade;

alter table trabajador
add constraint FK_DNIResponsable
foreign key (dni_responsable) references trabajador(dni)
on delete cascade on update cascade;

alter table departamento
add constraint FK_EmpleadoDepartamento
foreign key (coordinador) references trabajador(dni)
on delete cascade on update cascade;