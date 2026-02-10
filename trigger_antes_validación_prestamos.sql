DELIMITER $$
create trigger validar_antes_prestamo
after insert on prestamos
for each row 
begin
-- Preparación de las variables y datos que necesitamos para validar
	declare disponible int;
    declare prestamos_socio int;
    declare limite_socio int;
    
    select cantidad_disponible into disponible
    from libros
    where libro_id = NEW.libro_id;
    
    select prestamos_activos into prestamos_socio
    from socios 
    where socio_id = NEW.socio_id;

-- 1ª Validación
	if disponible <= 0 then 
		signal sqlstate '45000'
		set message_text = 'No hay libros pedazo de melón';
    END IF;
    
 -- Validación 2: libros prestados al socio disponible
	select max_prestamos into limite_socio
    from socios
    where socio_id = NEW.socio_id;
    
    if prestamos_socio >= limite_socio then
		signal sqlstate '45000'
		set message_text = 'No te quedan préstamos disponibles rata cómprate el libro';
	end if;
end;
$$