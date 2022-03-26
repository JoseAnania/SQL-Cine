--Creación de Base de Datos

create database Complejo_Cinema_Paradiso

--Abre Base de Datos

use Complejo_Cinema_Paradiso

--Creación de Tablas

create table formas_pago
(
cod_forma_pago numeric (1,0) not null identity (1,1)
,nom_forma_pago varchar (50) not null
constraint PK_formas_pago primary key (cod_forma_pago)
)

create table tipo_salas
(
cod_tipo_sala numeric (3,0) not null identity (1,1)
,nom_tipo_sala varchar (30) not null
constraint PK_tipo_salas primary key (cod_tipo_sala)
)

create table estado_butacas
(
cod_estado_butaca numeric (1,0) not null 
,nom_estado_butaca varchar (10) not null
constraint PK_estado_butacas primary key (cod_estado_butaca)
)

create table tipo_documento
 (
 cod_tipo_documento numeric (2,0) not null identity (1,1)
 ,nom_tipo_documento varchar (30) not null
 constraint PK_tipo_documento primary key (cod_tipo_documento)
 )

 create table barrios
(
cod_barrio numeric (8,0) not null identity (1,1)
,nombre_barrio varchar (30) not null
constraint PK_barrios primary key (cod_barrio)
)

create table condiciones_fiscales
(
cod_cond_fiscal numeric (2,0) not null identity (1,1)
,nom_cond_fiscal varchar (30) not null
constraint PK_condiciones_fiscales primary key (cod_cond_fiscal)
)

create table sexos
(
cod_sexo numeric (1,0) not null
,nom_sexo varchar (10) not null
constraint PK_sexos primary key (cod_sexo)
)

create table generos
(
cod_genero numeric (3,0) not null identity (1,1)
,nom_genero varchar (30) not null
constraint PK_generos primary key (cod_genero)
)

create table clasificaciones
(
cod_clasificacion numeric (1,0) not null identity (1,1)
,nom_clasificacion varchar (30) not null
constraint PK_clasificaciones primary key (cod_clasificacion)
)

create table versiones
(
cod_version numeric (1,0) not null identity (1,1)
,nom_verison varchar (10) not null
constraint PK_versiones primary key (cod_version)
)

create table promociones
(
cod_promocion numeric (3,0) not null identity (1,1)
,nom_promocion varchar (30) not null
,fec_promocion smalldatetime not null
,hora_promocion time not null
constraint PK_promociones primary key (cod_promocion)
)

create table cines
(
cod_cine numeric (3,0) not null identity (1,1)
,nom_cine varchar (30) not null
,nro_calle numeric (5,0) null
,nom_calle varchar (50) null
,cod_barrio numeric (8,0)
constraint PK_cines primary key (cod_cine)
constraint FK_cines_barrios foreign key (cod_barrio) references barrios (cod_barrio)
)

create table directores
(
cod_director numeric (9,0) not null identity (1,1)
,ape_director varchar (30) not null
,nom_director varchar (30) not null
,nacionalidad varchar (50) not null
,cod_sexo numeric (1,0)
constraint PK_directores primary key (cod_director)
constraint FK_directores_sexos foreign key (cod_sexo) references sexos (cod_sexo)
)

create table actores
(
cod_actor numeric (9,0) not null identity (1,1)
,ape_actor varchar (30) not null
,nom_actor varchar (30) not null
,cod_sexo numeric (1,0)
constraint PK_actores primary key (cod_actor)
constraint FK_actores_sexos foreign key (cod_sexo) references sexos (cod_sexo)
)

create table salas
(
cod_sala numeric (3,0) not null identity (1,1)
,nom_sala varchar (30) not null
,cant_butacas numeric (3,0) not null
,cod_tipo_sala numeric (3,0)
,cod_cine numeric (3,0)
constraint PK_salas primary key (cod_sala)
constraint FK_salas_tipo_salas foreign key (cod_tipo_sala) references tipo_salas (cod_tipo_sala)
,constraint FK_salas_cine foreign key (cod_cine) references cines (cod_cine)
)

create table peliculas
(
cod_pelicula numeric (10,0) not null identity (1,1)
,nom_pelicula varchar (30) not null
,fec_estreno smalldatetime not null
,cod_genero numeric (3,0)
,cod_clasificacion numeric (1,0)
,cod_director numeric (9,0)
constraint PK_peliculas primary key (cod_pelicula)
constraint FK_peliculas_generos foreign key (cod_genero) references generos (cod_genero)
,constraint FK_peliculas_clasificaciones foreign key (cod_clasificacion) references clasificaciones (cod_clasificacion)
,constraint FK_peliculas_directores foreign key (cod_director) references directores (cod_director)
)

create table vendedores 
(
cod_vendedor numeric (5,0) not null identity (1,1) 
,ape_vendedor varchar (50) not null
,nom_vendedor varchar(50) not null
,fec_nac smalldatetime not null
,nro_tel bigint null
,[e-mail] varchar (50) null
,cod_tipo_documento numeric (2,0)
,nro_documento numeric (10,0) not null
,nro_calle numeric (5,0) null
,nom_calle varchar (50) null
,cod_barrio numeric (8,0) 
,cod_sexo numeric (1,0) 
constraint PK_vendedores primary key (cod_vendedor)
constraint FK_vendedores_tipo_documento foreign key (cod_tipo_documento) references tipo_documento (cod_tipo_documento)
,constraint FK_vendedores_barrios foreign key (cod_barrio) references barrios (cod_barrio)
,constraint FK_vendedores_sexos foreign key (cod_sexo) references sexos (cod_sexo)
)

create table clientes 
(
cod_cliente numeric (10,0) not null identity (1,1) 
,ape_cliente varchar (50) not null
,nom_cliente varchar(50) not null
,fec_nac smalldatetime not null
,nro_tel bigint null
,[e-mail] varchar (50) null
,cod_tipo_documento numeric (2,0)
,nro_documento numeric (10,0) not null
,nro_calle numeric (5,0) null
,nom_calle varchar (50) null
,cod_barrio numeric (8,0)
,cod_cond_fiscal numeric (2,0) 
,cod_sexo numeric (1,0) 
constraint PK_clientes primary key (cod_cliente)
constraint FK_clientes_tipo_documento foreign key (cod_tipo_documento) references tipo_documento (cod_tipo_documento)
,constraint FK_clientes_barrios foreign key (cod_barrio) references barrios (cod_barrio)
,constraint FK_clientes_sexos foreign key (cod_sexo) references sexos (cod_sexo)
,constraint FK_clientes_condiciones_fiscales foreign key (cod_cond_fiscal) references condiciones_fiscales (cod_cond_fiscal)
)

create table tickets
(
nro_ticket numeric (10,0) not null identity (1,1)
,fec_ticket smalldatetime not null
,hora_ticket time not null
,cod_cine numeric (3,0)
,cod_cliente numeric (10,0)
,cod_vendedor numeric (5,0) 
,cod_forma_pago numeric (1,0)
constraint PK_tickets primary key (nro_ticket)
,constraint FK_detalle_ticket_cines foreign key (cod_cine) references cines (cod_cine)
,constraint FK_tickets_clientes foreign key (cod_cliente) references clientes (cod_cliente)
,constraint FK_tickets_vendedores foreign key (cod_vendedor) references vendedores (cod_vendedor)
,constraint FK_tickets_formas_pago foreign key (cod_forma_pago) references formas_pago (cod_forma_pago)
)

create table butacas
(
nro_butaca numeric (10,0) not null identity (1,1)
,cod_sala numeric (3,0)
,cod_estado_butaca numeric (1,0) 
constraint PK_butacas primary key (nro_butaca)
,constraint U_butacas unique (nro_butaca)
,constraint FK_butacas_salas foreign key (cod_sala) references salas (cod_sala)
,constraint FK_butacas_estado_butacas foreign key (cod_estado_butaca) references estado_butacas (cod_estado_butaca)
)

create table actores_peliculas
(
cod_actor numeric (9,0)
,cod_pelicula numeric (10,0)
constraint PK_actores_peliculas primary key (cod_actor, cod_pelicula)
constraint FK_actores_peliculas_actores foreign key (cod_actor) references actores (cod_actor)
,constraint FK_actores_peliculas_peliculas foreign key (cod_pelicula) references peliculas (cod_pelicula)
)

create table funciones
(
cod_funcion numeric (3,0) not null identity (1,1)
,fec_funcion smalldatetime not null
,nom_funcion varchar (30) not null
,cod_cine numeric (3,0)
,cod_sala numeric (3,0) 
,cod_pelicula numeric (10,0)
,cod_version numeric (1,0)
,hora_funcion time not null
constraint PK_funciones primary key (fec_funcion, cod_cine)
,constraint U_funciones unique (cod_funcion)
,constraint FK_funciones_cines foreign key (cod_cine) references cines (cod_cine)
,constraint FK_funciones_salas foreign key (cod_sala) references salas (cod_sala)
,constraint FK_funciones_peliculas foreign key (cod_pelicula) references peliculas (cod_pelicula)
,constraint FK_funciones_versiones foreign key (cod_version) references versiones (cod_version)
)

create table detalle_ticket
(
nro_ticket numeric (10,0)
,cod_funcion numeric (3,0)
,nro_butaca numeric (10,0) 
,cod_promocion numeric (3,0)
,pre_unitario decimal(10, 2) not null
,cantidad smallint not null
,cod_sala numeric (3,0) 
constraint PK_detalle_ticket primary key (nro_ticket, cod_sala, cod_funcion, nro_butaca)
,constraint FK_detalle_ticket_tickets foreign key (nro_ticket) references tickets (nro_ticket)
,constraint FK_detalle_ticket_funciones foreign key (cod_funcion) references funciones (cod_funcion)
,constraint FK_detalle_ticket_butacas foreign key (nro_butaca) references butacas (nro_butaca)
,constraint FK_detalle_ticket_salas foreign key (cod_sala) references salas (cod_sala)
,constraint FK_detalle_ticket_promociones foreign key (cod_promocion) references promociones (cod_promocion)
)

create table reservas
(
cod_reserva numeric (5,0) not null identity (1,1)
,nro_butaca numeric (10,0) 
,cod_cine numeric (3,0)
,cod_cliente numeric (10,0)
,cod_vendedor numeric (5,0) 
,cod_funcion numeric (3,0)
,fec_reserva smalldatetime not null
,hora_reserva time not null
constraint PK_reservas primary key (cod_reserva, nro_butaca, fec_reserva)
constraint FK_reservas_butacas foreign key (nro_butaca) references butacas (nro_butaca)
,constraint FK_reservas_cines foreign key (cod_cine) references cines (cod_cine)
,constraint FK_reservas_clientes foreign key (cod_cliente) references clientes (cod_cliente)
,constraint FK_reservas_vendedores foreign key (cod_vendedor) references vendedores (cod_vendedor)
,constraint FK_reservas_funciones foreign key (cod_funcion) references funciones (cod_funcion)
)
