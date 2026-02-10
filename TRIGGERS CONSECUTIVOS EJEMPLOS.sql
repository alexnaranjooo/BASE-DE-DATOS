create database if not exists biblioteca;
use biblioteca;

create table libros (
	libro_id int primary key auto_increment,
    titulo varchar (200) not null,
    autor varchar (100) not null,
    cantidad_total int default 3,
    cantidad_disponible int default 3,
    fecha_ultimo_prestamo datetime
) engine = InnoDB default charset = utf8mb4;


create table socios (
	socio_id int primary key auto_increment,
    nombre varchar (100) not null,
    email varchar (250) not null,
    prestamos_activos int default 0,
    max_prestamos int default 2
) engine = InnoDB default charset = utf8mb4;

create table prestamos (
	prestamos_id int primary key auto_increment,
    libro_id int not null,
    socio_id int not null,
    fecha_prestamo datetime default current_timestamp,
    fecha_devolucion date,
    
    foreign key (libro_id) references libros (libro_id),
    foreign key (socio_id) references socios (socio_id)
) engine = InnoDB default charset = utf8mb4;



