create database if not exists Asobal;
use Asobal;

create table temporada (
    id_temporada int primary key auto_increment,
    año year not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    estado_temporada enum('Acabada','En juego'),
    
	constraint chk_fechas_temporada
    check (fecha_fin > fecha_inicio)
);


create table jornada (
    id_jornada int primary key auto_increment,
    numero tinyint not null,
    id_temporada int not null,
    observaciones varchar(150),

    constraint fk_id_temporada
        foreign key (id_temporada)
        references temporada(id_temporada)
        on delete cascade
        on update cascade
);

create table equipo (
    id_equipo int primary key auto_increment,
    nombre_club varchar(100) not null,
    ciudad varchar(80),
    presupuesto decimal(12,2),
    año_fundacion year,
    presidente varchar(100),
    títulos tinyint
);

create table jugador (
    id_jugador int primary key auto_increment,
    nombre varchar(100) not null,
    dni varchar(12) unique,
    altura decimal(4,2),
    peso decimal(5,2),
    posicion enum('Portero','Extremo','Lateral','Central','Pivote'),
    dorsal tinyint not null,
    fecha_nacimiento date,
    id_equipo int,
    
    constraint fk_id_equipo
        foreign key (id_equipo)
        references equipo(id_equipo)
);

create table pabellon (
    id_pabellon int primary key auto_increment,
    nombre varchar(100) not null,
    aforo int unsigned,
    ciudad varchar(80),
    direccion varchar(150)
);

create table partido (
    id_partido int primary key auto_increment,
    fecha datetime not null,
    goles_local tinyint not null,
    goles_visitante tinyint not null,
    id_jornada int not null,
    id_pabellon int not null,
    id_equipo_local int not null,
    id_equipo_visitante int not null,

    constraint fk_id_jornada
        foreign key (id_jornada)
        references jornada(id_jornada)
        on delete cascade
        on update cascade,

    constraint fk_id_pabellon
        foreign key (id_pabellon)
        references pabellon(id_pabellon)
        on delete cascade
        on update cascade,
        
   constraint fk_id_equipo_local
        foreign key (id_equipo_local)
        references equipo(id_equipo)
        on delete cascade
        on update cascade,
        
	constraint fk_id_equipo_visitante
        foreign key (id_equipo_visitante)
        references equipo(id_equipo)
        on delete cascade
        on update cascade
);

create table estadisticas (
    id_estadistica int primary key auto_increment,
    goles tinyint unsigned default 0,
    paradas tinyint unsigned default 0,
    sanciones tinyint unsigned default 0,
    tarjetas_amarillas tinyint unsigned default 0,
    tarjetas_rojas tinyint unsigned default 0,
    tarjetas_azul tinyint unsigned default 0,
    dos_minutos tinyint unsigned default 0,
    id_jugador int not null,
    id_partido int not null,
    id_jornada int not null,
    id_equipo int not null, 
    id_temporada int not null, 

    constraint fk_jugador
        foreign key (id_jugador)
        references jugador(id_jugador)
        on delete cascade
        on update cascade,
        
	constraint fk_equipo
        foreign key (id_equipo)
        references equipo(id_equipo)
        on delete cascade
        on update cascade,

    constraint fk_partido
        foreign key (id_partido)
        references partido(id_partido)
        on delete cascade
        on update cascade,
        
	constraint fk_jornada
        foreign key (id_jornada)
        references jornada(id_jornada)
        on delete cascade
        on update cascade,
        
	constraint fk_temporada
        foreign key (id_temporada)
        references temporada(id_temporada)
        on delete cascade
        on update cascade

);

create table clasificacion (
    id_clasificacion int auto_increment primary key,
    id_temporada int not null,
    id_equipo int not null,
    puntos tinyint default 0,
    victorias int default 0,
    empates int default 0,
    derrotas int default 0,
    goles_favor int default 0,
    goles_contra int default 0,
    diferencia_goles int default 0,
    posicion int,
    id_temporada int,
    id_equipo int,

    constraint fk_temporada
        foreign key (id_temporada)
        references temporada(id_temporada)
        on delete cascade,

    constraint fk_equipo
        foreign key (id_equipo)
        references equipo(id_equipo)
        on delete cascade,
);
