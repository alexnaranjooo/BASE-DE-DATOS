-- Consulta 1:
with ventas_2023 as (
    select 
        empleado_id, 
        sum(cantidad) as 'Total'
    from ventas
    where year(fecha) = 2023
    group by empleado_id
)
select 
    e.nombre, 
    v.total
from empleados e
join ventas_2023 v on e.id = v.empleado_id
where v.total > 50;

-- Consulta 2:
with promedio_cat as (
    select	categoria_id, 
			avg(precio) as 'Promedio'
    from productos
    group by categoria_id
)
select	p.nombre, 
		p.precio, 
		pc.promedio
from productos p
join promedio_cat pc on p.categoria_id = pc.categoria_id
where p.precio > (pc.promedio * 1.20);

-- Consultas 3:
with recursive subcategorias as (
    select	id, 
			nombre, 
			padre_id
    from categorias
    where id = 3
    
    union all
    
    select 	c.id, 
			c.nombre, 
			c.padre_id
    from categorias c
    join subcategorias s on c.padre_id = s.id
)
select * from subcategorias;

-- Consulta 4: 
with recursive arbol_proyectos as (

    select id, 
		nombre, 
		proyecto_padre_id
    from proyectos
    where id = 5
    
    union all
    
    select 	p.id, 
			p.nombre, 
            p.proyecto_padre_id
    from proyectos p
    join arbol_proyectos ap on p.proyecto_padre_id = ap.id
)

select 	ap.nombre as 'Nombre del Proyecto', 
		t.nombre as 'Nombre de la tarea'
from arbol_proyectos ap
left join tareas t on ap.id = t.proyecto_id;