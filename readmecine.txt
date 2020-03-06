CINE

/*==============================================================*/
/* Entidad/Table/filas: ACTOR                                   */ --- corresponde
/*==============================================================*/
create table ACTOR
(
   ID_ACTORES           int not null, primary key (ID_ACTORES)
   PELICULA_GRABADAS    varchar(30), --- corresponde personajes que interpreto
   NOMBRE_AC            varchar(30),--- nombre real actor
   ACTUO_EN             varchar(20),--- corresponde pelicula en la que actuo
   NACION               varchar(30),--- corresponde origen
  
);

/*==============================================================*/
/* Table: CINE                                                  */
/*==============================================================*/
create table CINE
(
   ID_CINE              int not null,primary key (ID_CINE)
   NOMBRE_CINE          varchar(30),
   DIRECCION            varchar(30), --- corresponde ubicacion geografica del local
   
);

/*==============================================================*/
/* Table: COMENTARIO                                            */
/*==============================================================*/
create table COMENTARIO
(
   ID_COMENTARIO        int not null,  primary key (ID_COMENTARIO)
   ID_PELI              int, --- corresponde debido a la relacion que presenta la pelicula con el comentario se incorpora el id_pelicula
   USUARIO              varchar(30), --- corresponde nombre de persona que deja su comentario
   EDAD_USU             int,
   FECHA_COMENT         date, --- corresponde fecha de ingreso de comentario
   COMENTARIO           varchar(120), --- corresponde apreciacion por parte de usuario
   EVALUACION           int,--- corresponde clasifica en la pelicula en buena , regular o mala
  
);

/*==============================================================*/
/* Table: DIRECTOR                                              */
/*==============================================================*/
create table DIRECTOR
(
   ID_DIRECT            int not null,primary key (ID_DIRECT)
   ID_PELI              int, --- se incorpora el id_pelicula por la relacion que tiene la pelicula con la tabla director
   NOMBRE_DIREC         varchar(20),--- corresponde nombre real de director
   NACIONALIDAD         varchar(10), --- corresponde origen
   MOVIE_DIRIGIDAS      varchar(20),
   ACTUACION            varchar(20),--- si el director tambien participo como actor se declara en este campo
   

/*==============================================================*/
/* Table: FUNCION                                               */
/*==============================================================*/
create table FUNCION
(
   ID_FUNCION           int not null, primary key (ID_FUNCION
   ID_NUMEROSALA        int, --- corresponde relacion 	que contiene con la sala
   DIA                  date,
   HORA_INICIO          time,
  )
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
   TITLE_DISTRIBU       varchar(30),--- corresponde  distribucion
   TITLE_ORIGIN         varchar(30),--- corresponde titulo original
   GENERO               varchar(2),
   IDIO_ORIGI           varchar(30),
   TIPO_PUBLICO         varchar(5), especificar rango de edad
   PAIS_ORIGEN          varchar(30),
   ESTRENO_STGO         varchar(30),si se estrena en santiago
   SINOPSIS             varchar(150), descripcion breve de pelicula
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
   DSCTO                decimal, --- corresponde descuento a realizar por funcion 
   primary key (ID_PROMO)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA
(
   ID_NUMEROSALA        int not null, primary key (ID_NUMEROSALA)
   ID_CINE              int,
   BUTACA               int,--- corresponde numeracion de cada asiento
   NOMBRE_SALA          varchar(20), --- corresponde nombre que recibe cada sala 
   
);