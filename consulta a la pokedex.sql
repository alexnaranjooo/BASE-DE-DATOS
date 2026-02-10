WITH RECURSIVE cadena_evolutiva AS (
    SELECT 
        p.id_pokemon,
        p.nombre,
        p.tipo1,
        p.tipo2,
        0 AS nivel_evolutivo,
        eb.ps,
        eb.ataque,
        eb.defensa,
        eb.ataque_esp,
        eb.defensa_esp,
        eb.velocidad,
        0 AS ps_anterior,
        0 AS ataque_anterior,
        0 AS defensa_anterior,
        0 AS ataque_esp_anterior,
        0 AS defensa_esp_anterior,
        0 AS velocidad_anterior,
        'BASE' AS metodo_evolucion,
        0 AS nivel_requerido
    FROM pokemon p
    INNER JOIN estadisticas_base eb ON p.id_pokemon = eb.id_pokemon
    WHERE p.nombre = 'Charmander'
    
    UNION ALL
    
    SELECT 
        p.id_pokemon,
        p.nombre,
        p.tipo1,
        p.tipo2,
        ce.nivel_evolutivo + 1,
        eb.ps,
        eb.ataque,
        eb.defensa,
        eb.ataque_esp,
        eb.defensa_esp,
        eb.velocidad,
        ce.ps,
        ce.ataque,
        ce.defensa,
        ce.ataque_esp,
        ce.defensa_esp,
        ce.velocidad,
        e.metodo,
        e.nivel_requerido
    FROM cadena_evolutiva ce
    INNER JOIN evoluciones e ON ce.id_pokemon = e.id_pokemon_origen
    INNER JOIN pokemon p ON e.id_pokemon_destino = p.id_pokemon
    INNER JOIN estadisticas_base eb ON p.id_pokemon = eb.id_pokemon
)
SELECT 
    CONCAT(REPEAT('  ', nivel_evolutivo), nombre) AS cadena_evolutiva,
    nivel_evolutivo,
    CONCAT(tipo1, COALESCE(CONCAT('/', tipo2), '')) AS tipos,
    CASE 
        WHEN nivel_evolutivo = 0 THEN 'FORMA BASE'
        WHEN nivel_requerido IS NULL THEN metodo_evolucion
        ELSE CONCAT(metodo_evolucion, ' Nivel ', nivel_requerido)
    END AS metodo_evolucion,
    ps,
    ataque,
    defensa,
    ataque_esp,
    defensa_esp,
    velocidad,
    CASE WHEN nivel_evolutivo = 0 THEN '-' ELSE CONCAT('+', ps - ps_anterior) END AS variacion_ps,
    CASE WHEN nivel_evolutivo = 0 THEN '-' ELSE CONCAT('+', ataque - ataque_anterior) END AS variacion_ataque,
    CASE WHEN nivel_evolutivo = 0 THEN '-' ELSE CONCAT('+', defensa - defensa_anterior) END AS variacion_defensa,
    CASE WHEN nivel_evolutivo = 0 THEN '-' ELSE CONCAT('+', ataque_esp - ataque_esp_anterior) END AS variacion_ataque_esp,
    CASE WHEN nivel_evolutivo = 0 THEN '-' ELSE CONCAT('+', defensa_esp - defensa_esp_anterior) END AS variacion_defensa_esp,
    CASE WHEN nivel_evolutivo = 0 THEN '-' ELSE CONCAT('+', velocidad - velocidad_anterior) END AS variacion_velocidad,
    COALESCE(
        (SELECT GROUP_CONCAT(
            CONCAT(m.nombre, ' (', pm.metodo_aprendizaje, 
                   COALESCE(CONCAT(' Nv.', pm.nivel_requerido), ''), ')')
            ORDER BY pm.nivel_requerido, m.nombre SEPARATOR ' | ')
        FROM pokemon_movimientos pm
        INNER JOIN movimientos m ON pm.id_movimiento = m.id_movimiento
        WHERE pm.id_pokemon = cadena_evolutiva.id_pokemon),
        'Sin movimientos'
    ) AS movimientos
FROM cadena_evolutiva
ORDER BY nivel_evolutivo;
