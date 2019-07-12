/*Ninisbeth Segovia 11/07/19*/
--create database IncidenciasDB
use IncidenciasDB

create table Usuarios(
id_usuario int identity(1,1) primary key,
correo varchar(50),
clave nvarchar(10) COLLATE Latin1_General_CS_AS,
check (clave COLLATE Latin1_General_CS_AS like '%[0-9]%' and clave COLLATE Latin1_General_CS_AS 
like '%[ABCDEFGHIJKLMNÑOPQRSTUVWXYZ]%' and clave COLLATE Latin1_General_cs_as 
like '%[abcdefghijklmnñopqrstuvwxyz]%'
and (clave COLLATE Latin1_General_CS_AS like '%[!-~]%' or 
clave COLLATE Latin1_General_CS_AS like '%[-]%' ) )
)

create table Estados(
id_estados int identity(1,1) primary key,
estado varchar(50)

)

create table TipoIncidencia(
id_tipoIncidencia int identity(1,1) primary key,
nombre_tipo varchar(50)  
)

create table SubtipoIncidencia(
id_subtipo int identity(1,1) primary key,
nombre_subtipo varchar(50)
)

create table Incidencia(
id_incidencia int identity(1,1) primary key,
referencia varchar(50),
titulo varchar(50),
descripcion varchar(50),
fecha_creacion datetime,
ultima_actualizacion datetime,
fecha_cerrada datetime,
creado_por int foreign key references Usuarios(id_usuario),
tipo_incidencia int foreign key references TipoIncidencia(id_tipoIncidencia),
subtipo_incidencia int foreign key references SubtipoIncidencia(id_subtipo),
estado int foreign key references Estados(id_estados)
)

create table Historial(
id_historial int identity(1,1) primary key,
comentario varchar(50),
fecha_actualizacion datetime,
id_incidencia1 int foreign key references Incidencia(id_incidencia),
estado_actualizacion int foreign key references Estados(id_estados) 
)