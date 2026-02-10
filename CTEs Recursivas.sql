-- 1.Jerarquía simple de un empleado especifíco (trabajador id = 3)
with recursive jerarquia_empleado as (
	-- miembro ancla
    select 	codigo_empleado,
			nombre,
            apellido1,
            codigo_jefe,
            1 as nivel, 
            cast(codigo_empleado as char(100)) as ruta
	from empleado
    where codigo_empleado = 3
    
    union all 
	
    -- miembro recursivo
    select 	e.codigo_empleado,
			e.nombre,
            e.apellido1,
            e.codigo_jefe,
            j.nivel + 1, 
            concat (j.ruta, ' --> ', e.codigo_empleado)
	from empleado e
    join jerarquia_empleado j on e.codigo_jefe = j.codigo_empleado
)

select 	codigo_empleado,
		nombre,
		apellido1,
		codigo_jefe,
        nivel,
        ruta
from jerarquia_empleado
order by nivel, codigo_empleado;

-- 2. Encontrar la cadena de mando ascendente a partit de un empleado específico
with recursive jerarquia_empleado as (
	-- miembro ancla
    select 	codigo_empleado,
			nombre,
            apellido1,
            codigo_jefe,
            1 as nivel, 
            cast(codigo_empleado as char(100)) as ruta
	from empleado
    where codigo_empleado = 3
    
    union all 
	
    -- miembro recursivo
    select 	e.codigo_empleado,
			e.nombre,
            e.apellido1,
            e.codigo_jefe,
            j.nivel + 1, 
            concat (j.ruta, ' --> ', e.codigo_empleado)
	from empleado e
    join jerarquia_empleado j on e.codigo_empleado = j.codigo_jefe
    where j.codigo_jefe is not null
)

select 	codigo_empleado,
		nombre,
		apellido1,
		codigo_jefe,
        nivel,
        ruta
from jerarquia_empleado
order by nivel, codigo_empleado;

-- 3. Contar empleados por novel jeráriquico específico
with recursive jerarquia_niveles as (
	select	codigo_empleado, 
			nombre, 
			apellido1, 
			codigo_jefe, 
			1 as nivel
from empleado
where codigo_jefe is null

union all

select	e.codigo_empleado, 
		e.nombre, 
		e.apellido1, 
		e.codigo_jefe,
        j.nivel + 1
from empleado e
join jerarquia_niveles j on e.codigo_jefe = j.codigo_empleado
)

select 	nivel, 
		count(*) as 'Cantidad de empleados',
        group_concat(concat(nombre, ' ', apellido1) order by nombre separator ', ') as 'Empleados en el nivel'
from jerarquia_niveles
group by nivel order by nivel;

-- 4. Mapa jerárquico visual con Jerarquización