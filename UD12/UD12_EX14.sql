drop database if exists red_social;
create database red_social;
use red_social;

create table usuario(
	id_usuario int primary key auto_increment,
    contraseña varchar(20),
    nombre varchar(20),
    direccion varchar(50),
    telefono int,
    email varchar(40),
    escelebridad boolean
);

create table contacto(
	id_contacto int primary key auto_increment,
    comentario varchar(50),
    id_usuario int,
    foreign key (id_usuario) references usuario (id_usuario)
);

create table bloqueado(
	id_bloqueado int primary key auto_increment,
    comentario varchar(50),
    id_usuario int,
    foreign key (id_usuario) references usuario (id_usuario)
);

create table grupo(
	id_grupo int primary key auto_increment,
    nombre varchar(30),
    organizador int,
    foreign key (organizador) references usuario (id_usuario)
);

create table comentario(
	id_comentario int primary key auto_increment,
    nombre varchar(30),
    id_usuario int,
    foreign key (id_usuario) references usuario (id_usuario)
);