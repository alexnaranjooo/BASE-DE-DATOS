delimiter $$

create trigger trg_clasificacion_after_insert
after insert on partido
for each row
begin
    declare v_id_temporada int;

    select id_temporada into v_id_temporada
    from jornada
    where id_jornada = new.id_jornada;

    -- EQUIPO LOCAL
    update clasificacion
    set
        goles_favor = goles_favor + new.goles_local,
        goles_contra = goles_contra + new.goles_visitante,
        victorias = victorias + (new.goles_local > new.goles_visitante),
        empates = empates + (new.goles_local = new.goles_visitante),
        derrotas = derrotas + (new.goles_local < new.goles_visitante),
        puntos = puntos +
            case
                when new.goles_local > new.goles_visitante then 2
                when new.goles_local = new.goles_visitante then 1
                else 0
            end
    where id_equipo = new.id_equipo_local
      and id_temporada = v_id_temporada;

    -- EQUIPO VISITANTE
    update clasificacion
    set
        goles_favor = goles_favor + new.goles_visitante,
        goles_contra = goles_contra + new.goles_local,
        victorias = victorias + (new.goles_visitante > new.goles_local),
        empates = empates + (new.goles_visitante = new.goles_local),
        derrotas = derrotas + (new.goles_visitante < new.goles_local),
        puntos = puntos +
            case
                when new.goles_visitante > new.goles_local then 2
                when new.goles_visitante = new.goles_local then 1
                else 0
            end
    where id_equipo = new.id_equipo_visitante
      and id_temporada = v_id_temporada;

    -- Diferencia de goles
    update clasificacion
    set diferencia_goles = goles_favor - goles_contra
    where id_temporada = v_id_temporada;

    -- Reordenar posiciones
    set @pos := 0;
    update clasificacion c
    join (
        select id_clasificacion
        from clasificacion
        where id_temporada = v_id_temporada
        order by puntos desc, diferencia_goles desc, goles_favor desc
    ) t on c.id_clasificacion = t.id_clasificacion
    set c.posicion = (@pos := @pos + 1);

end$$

delimiter ;
