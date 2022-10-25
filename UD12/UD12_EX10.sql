drop database if exists futbol;
create database futbol;
use futbol;

drop table if exists equipo;
create table equipo(
	id_equipo int not null auto_increment,
    nombre varchar(20),
    año_creacion int,
    primary key (id_equipo)
);

drop table if exists entrenador;
create table entrenador(
	id_entrenador int not null,
    dni varchar(9) not null,
    nombre varchar(20),
    apellidos varchar(50),
    id_equipo int,
    foreign key (id_equipo) references equipo(id_equipo),
    primary key(id_entrenador)
);

drop table if exists jugador;
create table jugador(
    id_jugador int not null auto_increment,
    nombre varchar(20),
    apellidos varchar(50),
    dni varchar(9) not null,
    n_licencia int,
    id_equipo int,
    foreign key (id_equipo) references equipo(id_equipo),
    primary key (id_jugador)
);

drop table if exists arbitro;
create table arbitro(
	id_arbitro int not null,
    dni varchar(9) not null,
    nombre varchar(20),
    apellidos varchar(50),
    primary key(id_arbitro)
);

drop table if exists estadio;
create table estadio(
	id_estadio int not null,
    nombre varchar(30),
    localizacion varchar(50),
    año_creacion int,
    primary key(id_estadio)
);

drop table if exists partido;
create table partido(
	id_partido int not null,
    jornada int,
    liga varchar(30),
    fecha date,
    id_arbitro int,
    foreign key (id_arbitro) references arbitro(id_arbitro),
	id_estadio int,
    foreign key (id_estadio) references estadio(id_estadio),
    primary key(id_partido)
);

drop table if exists partido_equipo;
create table partido_equipo(
	id_partido_equipo int not null,
    id_equipo int,
    foreign key (id_equipo) references equipo(id_equipo),
    id_partido int,
    foreign key (id_partido) references partido(id_partido),
    primary key(id_partido_equipo)
);