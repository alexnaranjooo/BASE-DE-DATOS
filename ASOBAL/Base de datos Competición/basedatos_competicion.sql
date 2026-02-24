create database if not exists Asobal;
use Asobal;

create table temporada (
    id_temporada int primary key auto_increment,
    año year not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    estado_temporada enum('Acabada','En juego'),
    
    constraint chk_fechas_temporada
        check (fecha_fin > fecha_inicio),
    
    constraint chk_año_valido
        check (año >= 1900 and año <= 2100),
    
    constraint chk_duracion_temporada
        check (datediff(fecha_fin, fecha_inicio) >= 30)
);

create table jornada (
    id_jornada int primary key auto_increment,
    numero tinyint not null,
    id_temporada int not null,
    observaciones varchar(150),
    
    constraint chk_numero_jornada_positivo
        check (numero > 0 and numero <= 50),

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
    títulos tinyint,
    
    constraint chk_presupuesto_positivo
        check (presupuesto is null or presupuesto >= 0),
    
    constraint chk_titulos_no_negativo
        check (títulos is null or títulos >= 0)
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
    nacionalidad varchar(100) 
    
    constraint chk_altura_valida
        check (altura is null or (altura >= 1.50 and altura <= 2.30)),
    
    constraint chk_peso_valido
        check (peso is null or (peso >= 50 and peso <= 150)),
    
    constraint chk_dorsal_valido
        check (dorsal > 0 and dorsal <= 99),
    
    constraint fk_id_equipo
        foreign key (id_equipo)
        references equipo(id_equipo)
);

create table pabellon (
    id_pabellon int primary key auto_increment,
    nombre varchar(100) not null,
    aforo int unsigned,
    ciudad varchar(80),
    direccion varchar(150),
    
    constraint chk_aforo_valido
        check (aforo is null or (aforo >= 100 and aforo <= 50000))
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
    
    constraint chk_goles_local_valido
        check (goles_local >= 0 and goles_local <= 100),
    
    constraint chk_goles_visitante_valido
        check (goles_visitante >= 0 and goles_visitante <= 100),
    
    constraint chk_equipos_diferentes
        check (id_equipo_local != id_equipo_visitante),

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
    
    constraint chk_goles_partido_valido
        check (goles >= 0 and goles <= 30),
    
    constraint chk_paradas_validas
        check (paradas >= 0 and paradas <= 50),
    
    constraint chk_sanciones_validas
        check (sanciones >= 0 and sanciones <= 10),
    
    constraint chk_tarjetas_amarillas_validas
        check (tarjetas_amarillas >= 0 and tarjetas_amarillas <= 3),
    
    constraint chk_tarjetas_rojas_validas
        check (tarjetas_rojas >= 0 and tarjetas_rojas <= 1),
    
    constraint chk_tarjetas_azul_validas
        check (tarjetas_azul >= 0 and tarjetas_azul <= 1),
    
    constraint chk_dos_minutos_validos
        check (dos_minutos >= 0 and dos_minutos <= 5),

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

create table sanciones (
    id_sancion int primary key auto_increment,
    id_jugador int not null,
    id_temporada int not null,
    tipo_tarjeta enum('Amarilla','Roja','Azul') not null,
    motivo varchar(200),
    partidos_suspension int not null,
    jornada_inicio int not null,
    jornada_fin int,
    estado enum('Activa','Cumplida','Pendiente') default 'Activa',
    fecha_registro datetime default current_timestamp,
    
    constraint fk_sancion_jugador
        foreign key (id_jugador)
        references jugador(id_jugador)
        on delete cascade
        on update cascade,
        
    constraint fk_sancion_temporada
        foreign key (id_temporada)
        references temporada(id_temporada)
        on delete cascade
        on update cascade,
        
    constraint fk_sancion_jornada_inicio
        foreign key (jornada_inicio)
        references jornada(id_jornada)
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
    
    constraint chk_puntos_no_negativo
        check (puntos >= 0),
    
    constraint chk_victorias_no_negativo
        check (victorias >= 0),
    
    constraint chk_empates_no_negativo
        check (empates >= 0),
    
    constraint chk_derrotas_no_negativo
        check (derrotas >= 0),
    
    constraint chk_goles_favor_no_negativo
        check (goles_favor >= 0),
    
    constraint chk_goles_contra_no_negativo
        check (goles_contra >= 0),
    
    constraint chk_posicion_valida
        check (posicion is null or posicion > 0),

    constraint fk_temporada2
        foreign key (id_temporada)
        references temporada(id_temporada)
        on delete cascade,

    constraint fk_equipo2
        foreign key (id_equipo)
        references equipo(id_equipo)
        on delete cascade
);

create table estadisticas_temporada (
    id_estadistica_temporada int primary key auto_increment,
    id_jugador int not null,
    id_temporada int not null,
    partidos_jugados int default 0,
    goles_totales int default 0,
    paradas_totales int default 0,
    sanciones_totales int default 0,
    tarjetas_amarillas_totales int default 0,
    tarjetas_rojas_totales int default 0,
    tarjetas_azul_totales int default 0,
    dos_minutos_totales int default 0,
    promedio_goles decimal(5,2) default 0,
    porcentaje_paradas decimal(5,2) default 0,
    
    constraint chk_partidos_jugados_no_negativo
        check (partidos_jugados >= 0),
    
    constraint chk_goles_totales_no_negativo
        check (goles_totales >= 0),
    
    constraint chk_paradas_totales_no_negativo
        check (paradas_totales >= 0),
    
    constraint chk_promedio_goles_valido
        check (promedio_goles >= 0),
    
    constraint chk_porcentaje_paradas_valido
        check (porcentaje_paradas >= 0 and porcentaje_paradas <= 100),
    
    constraint fk_jugador_temporada
        foreign key (id_jugador)
        references jugador(id_jugador)
        on delete cascade
        on update cascade,
        
    constraint fk_temporada_estadisticas
        foreign key (id_temporada)
        references temporada(id_temporada)
        on delete cascade
        on update cascade
);

