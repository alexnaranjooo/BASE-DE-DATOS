CREATE database if not exists Cheat_Sheet;
USE Cheat_Sheet;

CREATE TABLE empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    puesto VARCHAR(50),
    jefe_id INT,
    departamento_id INT,
    FOREIGN KEY (jefe_id) REFERENCES empleados(id)
);
 
CREATE TABLE departamentos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    código VARCHAR(25)
);
 
CREATE TABLE categorias (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    padre_id INT,
    FOREIGN KEY (padre_id) REFERENCES categorias(id)
);
 
CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria_id INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);
 
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    pais VARCHAR(50)
);
 
CREATE TABLE ventas (
    id INT PRIMARY KEY,
    producto_id INT,
    empleado_id INT,
    cliente_id INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
 
CREATE TABLE proyectos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    proyecto_padre_id INT,
    FOREIGN KEY (proyecto_padre_id) REFERENCES proyectos(id)
);
 
CREATE TABLE tareas (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    proyecto_id INT,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)
);