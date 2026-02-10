-- Create trigger Se actualize la información (update en el cuerpo del trigger) después de recibir un préstamo (after insert en prestamos) para actualizar los libros disponibles (update en el cuerpo) y los libros disponibles y los préstamos (=pero en la tabla prestamos) activos en socios.
DELIMITER $$
create trigger actualizar_despues_prestamos
after insert on prestamos
for each row 
begin
	/*2 acciones: 1) Actualizar la información en libros disminuyendo la cantidad disponible en 1 */
    /*            2) Actualizar la información en socios aumentando en 1 los préstamos activos */
    update libros
    set cantidad_disponible = cantidad_disponible -1,
    fecha_ultimo_prestamo = now()
    where libro_id = NEW.libro_id;
    
    update socios 
    set prestamos_activos = prestamos_activos +1
    where socio_id = NEW.socio_id;
end;
%%