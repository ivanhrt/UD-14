drop database if exists geografia;
create database geografia;

use geografia;

drop table if exists localidad;
create table localidad(
	id_localidad int not null auto_increment,
    nombre varchar(100),
    poblacion int,
    id_provincia int,
    primary key (id_localidad)
);

drop table if exists provincia;
create table provincia(
	id_provincia int not null auto_increment,
    nombre varchar(100),
    poblacion int,
    superficie double,
    id_capital int,
    id_comunidad int,
    primary key (id_provincia)
);

drop table if exists comunidad;
create table comunidad(
	id_comunidad int not null auto_increment,
    nombre varchar(100),
    poblacion int,
    superficie double,
    id_capital int,
    primary key (id_comunidad)
);

alter table localidad
add constraint FK_ProvinciaLocalidad
foreign key (id_provincia) references provincia(id_provincia)
on delete cascade on update cascade;

alter table provincia
add constraint FK_LocalidadProvincia
foreign key (id_capital) references localidad(id_localidad)
on delete cascade on update cascade,
add constraint FK_ComunidadProvincia
foreign key (id_comunidad) references  comunidad(id_comunidad)
on delete cascade on update cascade;

alter table comunidad
add constraint FK_LocalidadComunidad
foreign key (id_capital) references localidad(id_localidad)
on delete cascade on update cascade;
    