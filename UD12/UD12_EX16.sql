CREATE DATABASE ejercicio16_ER;
use ejercicio16_ER;

create table usuarios(
idUsuarios int(8) auto_increment primary key,
usuario nvarchar(16),
nombre nvarchar(16),
fechaUnion date,
descripcion text(255),
cumpleaños date,
idUsuarios2 int(8),
key(idUsuarios2),
FOREIGN KEY (idUsuarios2) REFERENCES usuarios (idUsuarios) 
ON DELETE CASCADE ON UPDATE CASCADE
);


create table mensajes(
idMensajes int(8) auto_increment primary key,
mensaje text(255),
fechaEnviado date, 
leido boolean,
usuarioReceptor int(8),
key(usuarioReceptor),
FOREIGN KEY (usuarioReceptor) REFERENCES usuarios (idUsuarios) 
ON DELETE CASCADE ON UPDATE CASCADE,
usuarioComunicador int(8),
key(usuarioComunicador),
FOREIGN KEY (usuarioComunicador) REFERENCES usuarios (idUsuarios) 
ON DELETE CASCADE ON UPDATE CASCADE
);


create table tweet(
idTweet int(8) auto_increment primary key,
texto text(255),
imagenes blob,
idUsuarios int(8),
key(idUsuarios),
FOREIGN KEY (idUsuarios) REFERENCES usuarios (idUsuarios) 
ON DELETE CASCADE ON UPDATE CASCADE,
idTweetContenido int(8),
key(idTweetContenido),
FOREIGN KEY (idTweetContenido) REFERENCES tweet (idTweet) 
ON DELETE CASCADE ON UPDATE CASCADE
);



create table lista(
idLista int(8) auto_increment primary key,
nombre nvarchar(16),
tema nvarchar(25),
descripcion text(255),
idUsuarios int(8),
key(idUsuarios),
FOREIGN KEY (idUsuarios) REFERENCES usuarios (idUsuarios) 
ON DELETE CASCADE ON UPDATE CASCADE,
idTweet int(8),
key(idTweet),
FOREIGN KEY (idTweet) REFERENCES tweet (idTweet) 
ON DELETE CASCADE ON UPDATE CASCADE
);


create table tendencias(
idTendencias int(8) auto_increment primary key,
nombre nvarchar(16),
imagenes blob
);

create table hastags(
idHastag int(8) auto_increment primary key,
nombre nvarchar(16)
);


create table contienen(
idHastag int(8),
idTweet int(8),
idTendencias int(8),
numeroTweets int(16),
primary key(idHastag, idTweet, idTendencias),

key(idHastag),
FOREIGN KEY (idHastag) REFERENCES hastags (idHastag) 
ON DELETE CASCADE ON UPDATE CASCADE,

key(idTendencias),
FOREIGN KEY (idTendencias) REFERENCES tendencias (idTendencias) 
ON DELETE CASCADE ON UPDATE CASCADE,

key(idTweet),
FOREIGN KEY (idTweet) REFERENCES tweet (idTweet) 
ON DELETE CASCADE ON UPDATE CASCADE

);

