drop database if exists restaurante;
create database restaurante;
use restaurante;

create table Empleado(
	id_empleado int not null auto_increment,
	nombre varchar(20),
	apellidos varchar(50),
	dni varchar(9) not null,
	nss int,
	tel_fijo int,
	movil int,
	key (id_empleado)
);

create table Cocinero(
	id_empleado int not null,
	fecha_inicial date,
	foreign key (id_empleado) references Empleado(id_empleado)
);

create table Pinche(
	id_empleado int not null,
    id_supervisor int not null,
	fecha_inicial date,
	foreign key (id_empleado) references Empleado(id_empleado),
    foreign key (id_supervisor) references Cocinero(id_empleado)
);

create table Plato(
	id_plato int not null auto_increment,
    nombre varchar(20),
    precio double,
    tipo varchar(20),
    key (id_plato)
);

create table CocineroPlato(
id_cocinero int not null,
id_plato int not null,
foreign key (id_cocinero) references Cocinero (id_empleado),
foreign key (id_plato) references Plato (id_plato)
);

create table Ingrediente(
	id_ingrediente int not null auto_increment,
	nombre varchar(20),
    precio double,
	key (id_ingrediente)
);

create table PlatoIngrediente(
	id_ingrediente int not null,
	id_plato int not null,
	foreign key (id_ingrediente) references Ingrediente (id_ingrediente),
	foreign key (id_plato) references Plato (id_plato)
);

create table Almacen(
	id_almacen int not null auto_increment,
	descripcion varchar(200),
	nombre varchar(20),
	key (id_almacen)
);

create table Estante(
	id_estante int not null auto_increment,
    medida double,
    id_almacen int not null,
    foreign key (id_almacen) references Almacen (id_almacen),
    key (id_estante)
);

create table IngredienteEstante(
	id_ingrediente int not null,
    id_estante int not null,
    foreign key (id_ingrediente) references Ingrediente (id_ingrediente),
    foreign key (id_estante) references Estante (id_estante)
);