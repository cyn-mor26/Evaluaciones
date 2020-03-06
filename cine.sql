/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     06/03/2020 13:21:03                          */
/*==============================================================*/


drop table if exists ACTOR;

drop table if exists CINE;

drop table if exists COMENTARIO;

drop table if exists DIRECTOR;

drop table if exists FUNCION;

drop table if exists OFRECE;

drop table if exists PELICULA;

drop table if exists POSEE;

drop table if exists PROMOCION;

drop table if exists SALA;

/*==============================================================*/
/* Table: ACTOR                                                 */
/*==============================================================*/
create table ACTOR
(
   ID_ACTORES           int not null,
   PELICULA_GRABADAS    varchar(30),
   NOMBRE_AC            varchar(30),
   ACTUO_EN             varchar(20),
   NACION               varchar(30),
   primary key (ID_ACTORES)
);

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
create table CINE
(
   ID_CINE              int not null,
   NOMBRE_CINE          varchar(30),
   DIRECCION            varchar(30),
   primary key (ID_CINE)
);

/*==============================================================*/
/* Table: COMENTARIO                                            */
/*==============================================================*/
create table COMENTARIO
(
   ID_COMENTARIO        int not null,
   ID_PELI              int,
   USUARIO              varchar(30),
   EDAD_USU             int,
   FECHA_COMENT         date,
   COMENTARIO           varchar(120),
   EVALUACION           int,
   primary key (ID_COMENTARIO)
);

/*==============================================================*/
/* Table: DIRECTOR                                              */
/*==============================================================*/
create table DIRECTOR
(
   ID_DIRECT            int not null,
   ID_PELI              int,
   NOMBRE_DIREC         varchar(20),
   NACIONALIDAD         varchar(10),
   MOVIE_DIRIGIDAS      varchar(20),
   ACTUACION            varchar(20),
   primary key (ID_DIRECT)
);

/*==============================================================*/
/* Table: FUNCION                                               */
/*==============================================================*/
create table FUNCION
(
   ID_FUNCION           int not null,
   ID_NUMEROSALA        int,
   DIA                  date,
   HORA_INICIO          time,
   primary key (ID_FUNCION)
);

/*==============================================================*/
/* Table: OFRECE                                                */
/*==============================================================*/
create table OFRECE
(
   ID_PROMO             int not null,
   ID_FUNCION           int not null,
   primary key (ID_PROMO, ID_FUNCION)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA
(
   ID_PELI              int not null,
   ID_NUMEROSALA        int,
   TITLE_DISTRIBU       varchar(30),
   TITLE_ORIGIN         varchar(30),
   GENERO               varchar(2),
   IDIO_ORIGI           varchar(30),
   TIPO_PUBLICO         varchar(5),
   PAIS_ORIGEN          varchar(30),
   ESTRENO_STGO         varchar(30),
   SINOPSIS             varchar(150),
   primary key (ID_PELI)
);

/*==============================================================*/
/* Table: POSEE                                                 */
/*==============================================================*/
create table POSEE
(
   ID_ACTORES           int not null,
   ID_PELI              int not null,
   primary key (ID_ACTORES, ID_PELI)
);

/*==============================================================*/
/* Table: PROMOCION                                             */
/*==============================================================*/
create table PROMOCION
(
   ID_PROMO             int not null,
   DESCRIPCION          varchar(30),
   DSCTO                decimal,
   primary key (ID_PROMO)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA
(
   ID_NUMEROSALA        int not null,
   ID_CINE              int,
   BUTACA               int,
   NOMBRE_SALA          varchar(20),
   primary key (ID_NUMEROSALA)
);

alter table COMENTARIO add constraint FK_GENERA foreign key (ID_PELI)
      references PELICULA (ID_PELI) on delete restrict on update restrict;

alter table DIRECTOR add constraint FK_POSEE2 foreign key (ID_PELI)
      references PELICULA (ID_PELI) on delete restrict on update restrict;

alter table FUNCION add constraint FK_ORGANIZA foreign key (ID_NUMEROSALA)
      references SALA (ID_NUMEROSALA) on delete restrict on update restrict;

alter table OFRECE add constraint FK_OFRECE foreign key (ID_PROMO)
      references PROMOCION (ID_PROMO) on delete restrict on update restrict;

alter table OFRECE add constraint FK_OFRECE2 foreign key (ID_FUNCION)
      references FUNCION (ID_FUNCION) on delete restrict on update restrict;

alter table PELICULA add constraint FK_EMITE foreign key (ID_NUMEROSALA)
      references SALA (ID_NUMEROSALA) on delete restrict on update restrict;

alter table POSEE add constraint FK_POSEE foreign key (ID_ACTORES)
      references ACTOR (ID_ACTORES) on delete restrict on update restrict;

alter table POSEE add constraint FK_POSEE3 foreign key (ID_PELI)
      references PELICULA (ID_PELI) on delete restrict on update restrict;

alter table SALA add constraint FK_TIENE foreign key (ID_CINE)
      references CINE (ID_CINE) on delete restrict on update restrict;

