-- trigger para insert
delimiter $$
create trigger trg_calcular_estadisticas_temporada_insert
after insert on estadisticas
for each row
begin
    -- variables para cálculos
    declare total_partidos int;
    declare total_goles int;
    declare total_paradas int;
    declare total_sanciones int;
    declare total_amarillas int;
    declare total_rojas int;
    declare total_azules int;
    declare total_dos_minutos int;
    declare promedio decimal(5,2);
    
    -- calcular totales acumulados del jugador en la temporada
    select 
        count(distinct id_partido),
        ifnull(sum(goles), 0),
        ifnull(sum(paradas), 0),
        ifnull(sum(sanciones), 0),
        ifnull(sum(tarjetas_amarillas), 0),
        ifnull(sum(tarjetas_rojas), 0),
        ifnull(sum(tarjetas_azul), 0),
        ifnull(sum(dos_minutos), 0)
    into 
        total_partidos,
        total_goles,
        total_paradas,
        total_sanciones,
        total_amarillas,
        total_rojas,
        total_azules,
        total_dos_minutos
    from estadisticas
    where id_jugador = new.id_jugador
    and id_temporada = new.id_temporada;
    
    -- calcular promedio de goles por partido
    if total_partidos > 0 then
        set promedio = total_goles / total_partidos;
    else
        set promedio = 0;
    end if;
    
    -- insertar o actualizar en estadisticas_temporada
    insert into estadisticas_temporada (
        id_jugador,
        id_temporada,
        partidos_jugados,
        total_goles,
        total_paradas,
        total_sanciones,
        total_amarillas,
        total_rojas,
        total_azules,
        total_dos_minutos,
        promedio_goles
    ) values (
        new.id_jugador,
        new.id_temporada,
        total_partidos,
        total_goles,
        total_paradas,
        total_sanciones,
        total_amarillas,
        total_rojas,
        total_azules,
        total_dos_minutos,
        promedio
    )
    on duplicate key update
        partidos_jugados = total_partidos,
        total_goles = total_goles,
        total_paradas = total_paradas,
        total_sanciones = total_sanciones,
        total_amarillas = total_amarillas,
        total_rojas = total_rojas,
        total_azules = total_azules,
        total_dos_minutos = total_dos_minutos,
        promedio_goles = promedio;
    
end$$

-- trigger para update
create trigger trg_calcular_estadisticas_temporada_update
after update on estadisticas
for each row
begin
    -- variables para cálculos
    declare total_partidos int;
    declare total_goles int;
    declare total_paradas int;
    declare total_sanciones int;
    declare total_amarillas int;
    declare total_rojas int;
    declare total_azules int;
    declare total_dos_minutos int;
    declare promedio decimal(5,2);
    
    -- calcular totales acumulados del jugador en la temporada
    select 
        count(distinct id_partido),
        ifnull(sum(goles), 0),
        ifnull(sum(paradas), 0),
        ifnull(sum(sanciones), 0),
        ifnull(sum(tarjetas_amarillas), 0),
        ifnull(sum(tarjetas_rojas), 0),
        ifnull(sum(tarjetas_azul), 0),
        ifnull(sum(dos_minutos), 0)
    into 
        total_partidos,
        total_goles,
        total_paradas,
        total_sanciones,
        total_amarillas,
        total_rojas,
        total_azules,
        total_dos_minutos
    from estadisticas
    where id_jugador = new.id_jugador
    and id_temporada = new.id_temporada;
    
    -- calcular promedio de goles por partido
    if total_partidos > 0 then
        set promedio = total_goles / total_partidos;
    else
        set promedio = 0;
    end if;
    
    -- actualizar estadisticas_temporada
    update estadisticas_temporada
    set 
        partidos_jugados = total_partidos,
        total_goles = total_goles,
        total_paradas = total_paradas,
        total_sanciones = total_sanciones,
        total_amarillas = total_amarillas,
        total_rojas = total_rojas,
        total_azules = total_azules,
        total_dos_minutos = total_dos_minutos,
        promedio_goles = promedio
    where id_jugador = new.id_jugador
    and id_temporada = new.id_temporada;
    
end$$

delimiter ;