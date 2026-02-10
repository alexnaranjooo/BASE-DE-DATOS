drop database if exists Pokédex;
create database Pokédex;
USE Pokédex;

create table pokemon (
    id_pokemon        INT PRIMARY KEY AUTO_INCREMENT,
    nombre            VARCHAR(50) NOT NULL,
    tipo1             VARCHAR(20) NOT NULL,
    tipo2             VARCHAR(20),
    generacion        TINYINT NOT NULL
);
INSERT INTO pokemon (id_pokemon, nombre, tipo1, tipo2, generacion) VALUES
(1, 'Bulbasaur', 'Planta', 'Veneno', 1),
(2, 'Ivysaur', 'Planta', 'Veneno', 1),
(3, 'Venusaur', 'Planta', 'Veneno', 1),
(4, 'Charmander', 'Fuego', NULL, 1),
(5, 'Charmeleon', 'Fuego', NULL, 1),
(6, 'Charizard', 'Fuego', 'Volador', 1),
(7, 'Squirtle', 'Agua', NULL, 1),
(8, 'Wartortle', 'Agua', NULL, 1),
(9, 'Blastoise', 'Agua', NULL, 1),
(10, 'Caterpie', 'Bicho', NULL, 1),
(11, 'Metapod', 'Bicho', NULL, 1),
(12, 'Butterfree', 'Bicho', 'Volador', 1),
(25, 'Pikachu', 'Eléctrico', NULL, 1),
(26, 'Raichu', 'Eléctrico', NULL, 1),
(35, 'Clefairy', 'Hada', NULL, 1),
(36, 'Clefable', 'Hada', NULL, 1),
(39, 'Jigglypuff', 'Normal', 'Hada', 1),
(40, 'Wigglytuff', 'Normal', 'Hada', 1),
(54, 'Psyduck', 'Agua', NULL, 1),
(55, 'Golduck', 'Agua', NULL, 1),
(63, 'Abra', 'Psíquico', NULL, 1),
(64, 'Kadabra', 'Psíquico', NULL, 1),
(65, 'Alakazam', 'Psíquico', NULL, 1),
(74, 'Geodude', 'Roca', 'Tierra', 1),
(75, 'Graveler', 'Roca', 'Tierra', 1),
(76, 'Golem', 'Roca', 'Tierra', 1),
(92, 'Gastly', 'Fantasma', 'Veneno', 1),
(93, 'Haunter', 'Fantasma', 'Veneno', 1),
(94, 'Gengar', 'Fantasma', 'Veneno', 1),
(129, 'Magikarp', 'Agua', NULL, 1),
(130, 'Gyarados', 'Agua', 'Volador', 1),
(133, 'Eevee', 'Normal', NULL, 1),
(134, 'Vaporeon', 'Agua', NULL, 1),
(135, 'Jolteon', 'Eléctrico', NULL, 1),
(136, 'Flareon', 'Fuego', NULL, 1),
(143, 'Snorlax', 'Normal', NULL, 1),
(144, 'Articuno', 'Hielo', 'Volador', 1),
(145, 'Zapdos', 'Eléctrico', 'Volador', 1),
(146, 'Moltres', 'Fuego', 'Volador', 1),
(147, 'Dratini', 'Dragón', NULL, 1),
(148, 'Dragonair', 'Dragón', NULL, 1),
(149, 'Dragonite', 'Dragón', 'Volador', 1),
(150, 'Mewtwo', 'Psíquico', NULL, 1),
(151, 'Mew', 'Psíquico', NULL, 1);
 
create table estadisticas_base (
    id_stat   INT PRIMARY KEY,
    id_pokemon   INT NOT NULL,
    ps           INT NOT NULL,
    ataque       INT NOT NULL,
    defensa      INT NOT NULL,
    ataque_esp   INT NOT NULL,
    defensa_esp  INT NOT NULL,
    velocidad    INT NOT NULL,
    FOREIGN KEY (id_pokemon) REFERENCES pokemon(id_pokemon)
);
INSERT INTO estadisticas_base (id_stat, id_pokemon, ps, ataque, defensa, ataque_esp, defensa_esp, velocidad) VALUES
(1, 1, 45, 49, 49, 65, 65, 45),
(2, 2, 60, 62, 63, 80, 80, 60),
(3, 3, 80, 82, 83, 100, 100, 80),
(4, 4, 39, 52, 43, 60, 50, 65),
(5, 5, 58, 64, 58, 80, 65, 80),
(6, 6, 78, 84, 78, 109, 85, 100),
(7, 7, 44, 48, 65, 50, 64, 43),
(8, 8, 59, 63, 80, 65, 80, 58),
(9, 9, 79, 83, 100, 85, 105, 78),
(10, 10, 45, 30, 35, 20, 20, 45),
(11, 11, 50, 20, 55, 25, 25, 30),
(12, 12, 60, 45, 50, 90, 80, 70),
(25, 25, 35, 55, 40, 50, 50, 90),
(26, 26, 60, 90, 55, 90, 80, 110),
(35, 35, 70, 45, 48, 60, 65, 35),
(36, 36, 95, 70, 73, 95, 90, 60),
(39, 39, 115, 45, 20, 45, 25, 20),
(40, 40, 140, 70, 45, 85, 50, 45),
(54, 54, 50, 52, 48, 65, 50, 55),
(55, 55, 80, 82, 78, 95, 80, 85),
(63, 63, 25, 20, 15, 105, 55, 90),
(64, 64, 40, 35, 30, 120, 70, 105),
(65, 65, 55, 50, 45, 135, 95, 120),
(74, 74, 40, 80, 100, 30, 30, 20),
(75, 75, 55, 95, 115, 45, 45, 35),
(76, 76, 80, 120, 130, 55, 65, 45),
(92, 92, 30, 35, 30, 100, 35, 80),
(93, 93, 45, 50, 45, 115, 55, 95),
(94, 94, 60, 65, 60, 130, 75, 110),
(129, 129, 20, 10, 55, 15, 20, 80),
(130, 130, 95, 125, 79, 60, 100, 81),
(133, 133, 55, 55, 50, 45, 65, 55),
(134, 134, 130, 65, 60, 110, 95, 65),
(135, 135, 65, 65, 60, 110, 95, 130),
(136, 136, 65, 130, 60, 95, 110, 65),
(143, 143, 160, 110, 65, 65, 110, 30),
(144, 144, 90, 85, 100, 95, 125, 85),
(145, 145, 90, 90, 85, 125, 90, 100),
(146, 146, 90, 100, 90, 125, 85, 90),
(147, 147, 41, 64, 45, 50, 50, 50),
(148, 148, 61, 84, 65, 70, 70, 70),
(149, 149, 91, 134, 95, 100, 100, 80),
(150, 150, 106, 110, 90, 154, 90, 130),
(151, 151, 100, 100, 100, 100, 100, 100);

create table evoluciones (
    id_pokemon_origen   INT,
    id_pokemon_destino  INT,
    metodo              VARCHAR(50),
    nivel_requerido     INT,
    PRIMARY KEY (id_pokemon_origen, id_pokemon_destino),
    FOREIGN KEY (id_pokemon_origen) REFERENCES pokemon(id_pokemon),
    FOREIGN KEY (id_pokemon_destino) REFERENCES pokemon(id_pokemon)
);
INSERT INTO evoluciones (id_pokemon_origen, id_pokemon_destino, metodo, nivel_requerido) VALUES
(1, 2, 'nivel', 16),
(2, 3, 'nivel', 32),
(4, 5, 'nivel', 16),
(5, 6, 'nivel', 36),
(7, 8, 'nivel', 16),
(8, 9, 'nivel', 36),
(10, 11, 'nivel', 7),
(11, 12, 'nivel', 10),
(25, 26, 'piedra_trueno', NULL),
(35, 36, 'piedra_lunar', NULL),
(39, 40, 'piedra_lunar', NULL),
(54, 55, 'nivel', 33),
(63, 64, 'nivel', 16),
(64, 65, 'intercambio', NULL),
(74, 75, 'nivel', 25),
(75, 76, 'intercambio', NULL),
(92, 93, 'nivel', 25),
(93, 94, 'intercambio', NULL),
(129, 130, 'nivel', 20),
(133, 134, 'piedra_agua', NULL),
(133, 135, 'piedra_trueno', NULL),
(133, 136, 'piedra_fuego', NULL),
(147, 148, 'nivel', 30),
(148, 149, 'nivel', 55);

create table movimientos (
    id_movimiento   INT PRIMARY KEY AUTO_INCREMENT,
    nombre          VARCHAR(50) NOT NULL,
    tipo            VARCHAR(20),
    potencia        INT,
    precision_mov   INT
);

INSERT INTO movimientos (id_movimiento, nombre, tipo, potencia, precision_mov) VALUES
(1, 'Destructor', 'Normal', 40, 100),
(2, 'Placaje', 'Normal', 40, 100),
(3, 'Látigo Cepa', 'Planta', 45, 100),
(4, 'Hoja Afilada', 'Planta', 55, 95),
(5, 'Rayo Solar', 'Planta', 120, 100),
(6, 'Lanzallamas', 'Fuego', 90, 100),
(7, 'Ascuas', 'Fuego', 40, 100),
(8, 'Giro Fuego', 'Fuego', 35, 85),
(9, 'Pistola Agua', 'Agua', 40, 100),
(10, 'Burbuja', 'Agua', 40, 100),
(11, 'Hidrobomba', 'Agua', 110, 80),
(12, 'Surf', 'Agua', 90, 100),
(13, 'Impactrueno', 'Eléctrico', 40, 100),
(14, 'Rayo', 'Eléctrico', 90, 100),
(15, 'Trueno', 'Eléctrico', 110, 70),
(16, 'Picotazo', 'Volador', 35, 100),
(17, 'Ataque Ala', 'Volador', 60, 100),
(18, 'Psíquico', 'Psíquico', 90, 100),
(19, 'Confusión', 'Psíquico', 50, 100),
(20, 'Psicorrayo', 'Psíquico', 65, 100),
(21, 'Bola Sombra', 'Fantasma', 80, 100),
(22, 'Lametazo', 'Fantasma', 30, 100),
(23, 'Terremoto', 'Tierra', 100, 100),
(24, 'Excavar', 'Tierra', 80, 100),
(25, 'Lanzarrocas', 'Roca', 50, 90),
(26, 'Avalancha', 'Roca', 75, 90),
(27, 'Puño Hielo', 'Hielo', 75, 100),
(28, 'Ventisca', 'Hielo', 110, 70),
(29, 'Megapuño', 'Normal', 80, 85),
(30, 'Hiperrayo', 'Normal', 150, 90),
(31, 'Tóxico', 'Veneno', NULL, 90),
(32, 'Envenenamiento', 'Veneno', NULL, 100),
(33, 'Drenadoras', 'Planta', 20, 100),
(34, 'Hipnosis', 'Psíquico', NULL, 60),
(35, 'Desarrollo', 'Normal', NULL, NULL),
(36, 'Agilidad', 'Psíquico', NULL, NULL),
(37, 'Vuelo', 'Volador', 90, 95),
(38, 'Fuerza', 'Normal', 80, 100),
(39, 'Corte', 'Normal', 50, 95),
(40, 'Destello', 'Normal', NULL, 100);

create table pokemon_movimientos (
    id_pokemon      INT,
    id_movimiento   INT,
    metodo_aprendizaje VARCHAR(30),
    nivel_requerido INT,
    PRIMARY KEY (id_pokemon, id_movimiento),
    FOREIGN KEY (id_pokemon) REFERENCES pokemon(id_pokemon),
    FOREIGN KEY (id_movimiento) REFERENCES movimientos(id_movimiento)
);

INSERT INTO pokemon_movimientos (id_pokemon, id_movimiento, metodo_aprendizaje, nivel_requerido) VALUES
-- ===============================================
-- BULBASAUR
-- ===============================================
(1, 2, 'nivel', 1),
(1, 3, 'nivel', 7),
(1, 4, 'nivel', 13),
(1, 33, 'nivel', 20),
(1, 5, 'nivel', 45),
(1, 39, 'MT', NULL),
(1, 31, 'MT', NULL),

-- ===============================================
-- IVYSAUR
-- ===============================================
(2, 2, 'nivel', 1),
(2, 3, 'nivel', 1),
(2, 4, 'nivel', 13),
(2, 33, 'nivel', 22),
(2, 5, 'nivel', 48),
(2, 39, 'MT', NULL),
(2, 31, 'MT', NULL),
(2, 38, 'MT', NULL),

-- ===============================================
-- VENUSAUR
-- ===============================================
(3, 2, 'nivel', 1),
(3, 3, 'nivel', 1),
(3, 4, 'nivel', 1),
(3, 33, 'nivel', 1),
(3, 5, 'nivel', 53),
(3, 39, 'MT', NULL),
(3, 31, 'MT', NULL),
(3, 23, 'MT', NULL),
(3, 38, 'MT', NULL),
(3, 30, 'MT', NULL),

-- ===============================================
-- CHARMANDER
-- ===============================================
(4, 7, 'nivel', 1),
(4, 8, 'nivel', 7),
(4, 6, 'nivel', 34),
(4, 39, 'MT', NULL),
(4, 38, 'MT', NULL),
(4, 2, 'nivel', 1),

-- ===============================================
-- CHARMELEON
-- ===============================================
(5, 7, 'nivel', 1),
(5, 8, 'nivel', 1),
(5, 6, 'nivel', 39),
(5, 29, 'nivel', 28),
(5, 39, 'MT', NULL),
(5, 38, 'MT', NULL),
(5, 23, 'nivel', 34),
(5, 2, 'nivel', 1),

-- ===============================================
-- CHARIZARD
-- ===============================================
(6, 37, 'nivel', 36),
(6, 6, 'nivel', 1),
(6, 30, 'MT', NULL),
(6, 7, 'nivel', 1),
(6, 8, 'nivel', 1),
(6, 29, 'nivel', 1),
(6, 23, 'nivel', 1),
(6, 2, 'nivel', 1),
(6, 28, 'MT', NULL),
(6, 38, 'MT', NULL),
(6, 39, 'MT', NULL),
(6, 27, 'MT', NULL),

-- ===============================================
-- SQUIRTLE
-- ===============================================
(7, 2, 'nivel', 1),
(7, 10, 'nivel', 1),
(7, 9, 'nivel', 7),
(7, 12, 'nivel', 28),
(7, 39, 'MT', NULL),

-- ===============================================
-- WARTORTLE
-- ===============================================
(8, 2, 'nivel', 1),
(8, 10, 'nivel', 1),
(8, 9, 'nivel', 1),
(8, 12, 'nivel', 31),
(8, 11, 'nivel', 42),
(8, 39, 'MT', NULL),
(8, 38, 'MT', NULL),
(8, 23, 'MT', NULL),
(8, 27, 'MT', NULL),

-- ===============================================
-- BLASTOISE
-- ===============================================
(9, 2, 'nivel', 1),
(9, 10, 'nivel', 1),
(9, 9, 'nivel', 1),
(9, 12, 'nivel', 1),
(9, 11, 'nivel', 47),
(9, 39, 'MT', NULL),
(9, 38, 'MT', NULL),
(9, 23, 'MT', NULL),
(9, 27, 'MT', NULL),
(9, 28, 'MT', NULL),
(9, 30, 'MT', NULL),

-- ===============================================
-- CATERPIE
-- ===============================================
(10, 2, 'nivel', 1),

-- ===============================================
-- METAPOD
-- ===============================================
(11, 35, 'nivel', 7),

-- ===============================================
-- BUTTERFREE
-- ===============================================
(12, 10, 'nivel', 10),
(12, 19, 'nivel', 12),
(12, 34, 'nivel', 16),
(12, 18, 'nivel', 34),
(12, 33, 'nivel', 26),
(12, 16, 'nivel', 1),
(12, 17, 'nivel', 22),
(12, 20, 'MT', NULL),

-- ===============================================
-- PIKACHU
-- ===============================================
(25, 13, 'nivel', 1),
(25, 14, 'nivel', 21),
(25, 15, 'nivel', 41),
(25, 36, 'nivel', 26),
(25, 2, 'nivel', 1),
(25, 29, 'nivel', 33),

-- ===============================================
-- RAICHU
-- ===============================================
(26, 13, 'nivel', 1),
(26, 14, 'nivel', 1),
(26, 15, 'MT', NULL),
(26, 29, 'nivel', 1),
(26, 30, 'MT', NULL),
(26, 27, 'MT', NULL),
(26, 2, 'nivel', 1),

-- ===============================================
-- CLEFAIRY
-- ===============================================
(35, 2, 'nivel', 1),
(35, 1, 'nivel', 4),
(35, 29, 'nivel', 25),
(35, 19, 'nivel', 31),
(35, 18, 'MT', NULL),
(35, 30, 'MT', NULL),
(35, 6, 'MT', NULL),
(35, 14, 'MT', NULL),
(35, 27, 'MT', NULL),

-- ===============================================
-- CLEFABLE
-- ===============================================
(36, 2, 'nivel', 1),
(36, 1, 'nivel', 1),
(36, 29, 'nivel', 1),
(36, 18, 'MT', NULL),
(36, 30, 'MT', NULL),
(36, 6, 'MT', NULL),
(36, 14, 'MT', NULL),
(36, 27, 'MT', NULL),
(36, 28, 'MT', NULL),
(36, 23, 'MT', NULL),

-- ===============================================
-- JIGGLYPUFF
-- ===============================================
(39, 2, 'nivel', 1),
(39, 1, 'nivel', 4),
(39, 29, 'nivel', 18),
(39, 19, 'nivel', 24),
(39, 34, 'nivel', 29),
(39, 18, 'MT', NULL),
(39, 30, 'MT', NULL),
(39, 6, 'MT', NULL),
(39, 14, 'MT', NULL),
(39, 15, 'MT', NULL),

-- ===============================================
-- WIGGLYTUFF
-- ===============================================
(40, 2, 'nivel', 1),
(40, 1, 'nivel', 1),
(40, 29, 'nivel', 1),
(40, 18, 'MT', NULL),
(40, 30, 'MT', NULL),
(40, 6, 'MT', NULL),
(40, 14, 'MT', NULL),
(40, 15, 'MT', NULL),
(40, 28, 'MT', NULL),
(40, 23, 'MT', NULL),

-- ===============================================
-- PSYDUCK
-- ===============================================
(54, 9, 'nivel', 1),
(54, 19, 'nivel', 16),
(54, 18, 'nivel', 44),
(54, 12, 'MT', NULL),
(54, 2, 'nivel', 1),

-- ===============================================
-- GOLDUCK
-- ===============================================
(55, 9, 'nivel', 1),
(55, 19, 'nivel', 1),
(55, 18, 'nivel', 49),
(55, 12, 'MT', NULL),
(55, 11, 'nivel', 59),
(55, 27, 'MT', NULL),
(55, 23, 'MT', NULL),
(55, 29, 'nivel', 37),
(55, 2, 'nivel', 1),

-- ===============================================
-- ABRA
-- ===============================================
(63, 1, 'nivel', 1),

-- ===============================================
-- KADABRA
-- ===============================================
(64, 19, 'nivel', 16),
(64, 20, 'nivel', 20),
(64, 18, 'nivel', 42),
(64, 1, 'nivel', 1),
(64, 34, 'nivel', 25),
(64, 29, 'MT', NULL),
(64, 30, 'MT', NULL),

-- ===============================================
-- ALAKAZAM
-- ===============================================
(65, 18, 'nivel', 1),
(65, 20, 'nivel', 1),
(65, 1, 'nivel', 1),
(65, 19, 'nivel', 1),
(65, 34, 'nivel', 1),
(65, 29, 'MT', NULL),
(65, 30, 'MT', NULL),

-- ===============================================
-- GEODUDE
-- ===============================================
(74, 2, 'nivel', 1),
(74, 25, 'nivel', 11),
(74, 23, 'nivel', 40),
(74, 38, 'MT', NULL),

-- ===============================================
-- GRAVELER
-- ===============================================
(75, 2, 'nivel', 1),
(75, 25, 'nivel', 1),
(75, 23, 'nivel', 46),
(75, 29, 'nivel', 33),
(75, 38, 'MT', NULL),
(75, 24, 'nivel', 21),

-- ===============================================
-- GOLEM
-- ===============================================
(76, 2, 'nivel', 1),
(76, 25, 'nivel', 1),
(76, 23, 'nivel', 1),
(76, 29, 'nivel', 1),
(76, 38, 'MT', NULL),
(76, 24, 'nivel', 1),
(76, 30, 'MT', NULL),

-- ===============================================
-- GASTLY
-- ===============================================
(92, 22, 'nivel', 1),
(92, 34, 'nivel', 8),
(92, 21, 'nivel', 33),
(92, 19, 'nivel', 15),

-- ===============================================
-- HAUNTER
-- ===============================================
(93, 22, 'nivel', 1),
(93, 34, 'nivel', 1),
(93, 21, 'nivel', 38),
(93, 19, 'nivel', 29),
(93, 18, 'nivel', 45),
(93, 31, 'MT', NULL),

-- ===============================================
-- GENGAR
-- ===============================================
(94, 21, 'nivel', 1),
(94, 18, 'nivel', 39),
(94, 22, 'nivel', 1),
(94, 34, 'nivel', 1),
(94, 19, 'nivel', 1),
(94, 29, 'nivel', 33),
(94, 31, 'MT', NULL),
(94, 30, 'MT', NULL),

-- ===============================================
-- MAGIKARP
-- ===============================================
(129, 1, 'nivel', 1),

-- ===============================================
-- GYARADOS
-- ===============================================
(130, 11, 'nivel', 1),
(130, 23, 'MT', NULL),
(130, 30, 'nivel', 52),
(130, 2, 'nivel', 20),
(130, 14, 'nivel', 25),
(130, 12, 'MT', NULL),
(130, 6, 'MT', NULL),
(130, 37, 'MT', NULL),
(130, 15, 'MT', NULL),
(130, 28, 'MT', NULL),

-- ===============================================
-- EEVEE
-- ===============================================
(133, 2, 'nivel', 1),
(133, 29, 'nivel', 30),
(133, 1, 'nivel', 8),
(133, 38, 'MT', NULL),

-- ===============================================
-- VAPOREON
-- ===============================================
(134, 2, 'nivel', 1),
(134, 9, 'nivel', 1),
(134, 10, 'nivel', 16),
(134, 12, 'nivel', 25),
(134, 11, 'nivel', 42),
(134, 27, 'MT', NULL),
(134, 28, 'MT', NULL),
(134, 23, 'MT', NULL),

-- ===============================================
-- JOLTEON
-- ===============================================
(135, 2, 'nivel', 1),
(135, 13, 'nivel', 1),
(135, 14, 'nivel', 25),
(135, 15, 'nivel', 42),
(135, 16, 'nivel', 16),
(135, 29, 'nivel', 30),
(135, 36, 'nivel', 1),

-- ===============================================
-- FLAREON
-- ===============================================
(136, 2, 'nivel', 1),
(136, 7, 'nivel', 1),
(136, 6, 'nivel', 25),
(136, 8, 'nivel', 16),
(136, 29, 'nivel', 30),
(136, 38, 'MT', NULL),
(136, 30, 'MT', NULL),

-- ===============================================
-- SNORLAX
-- ===============================================
(143, 2, 'nivel', 1),
(143, 29, 'nivel', 1),
(143, 38, 'nivel', 1),
(143, 30, 'nivel', 48),
(143, 23, 'MT', NULL),
(143, 12, 'MT', NULL),
(143, 14, 'MT', NULL),
(143, 6, 'MT', NULL),
(143, 28, 'MT', NULL),

-- ===============================================
-- ARTICUNO
-- ===============================================
(144, 16, 'nivel', 1),
(144, 17, 'nivel', 51),
(144, 27, 'nivel', 1),
(144, 28, 'nivel', 61),
(144, 37, 'MT', NULL),
(144, 12, 'MT', NULL),
(144, 30, 'MT', NULL),
(144, 23, 'MT', NULL),

-- ===============================================
-- ZAPDOS
-- ===============================================
(145, 16, 'nivel', 1),
(145, 17, 'nivel', 51),
(145, 13, 'nivel', 1),
(145, 14, 'nivel', 25),
(145, 15, 'nivel', 61),
(145, 37, 'MT', NULL),
(145, 30, 'MT', NULL),
(145, 23, 'MT', NULL),

-- ===============================================
-- MOLTRES
-- ===============================================
(146, 16, 'nivel', 1),
(146, 17, 'nivel', 51),
(146, 7, 'nivel', 1),
(146, 6, 'nivel', 25),
(146, 30, 'nivel', 61),
(146, 37, 'MT', NULL),
(146, 23, 'MT', NULL),
(146, 28, 'MT', NULL),

-- ===============================================
-- DRATINI
-- ===============================================
(147, 2, 'nivel', 1),
(147, 15, 'nivel', 10),
(147, 36, 'nivel', 20),
(147, 30, 'nivel', 40),
(147, 12, 'MT', NULL),
(147, 6, 'MT', NULL),
(147, 14, 'MT', NULL),

-- ===============================================
-- DRAGONAIR
-- ===============================================
(148, 2, 'nivel', 1),
(148, 15, 'nivel', 1),
(148, 36, 'nivel', 1),
(148, 30, 'nivel', 45),
(148, 12, 'MT', NULL),
(148, 6, 'MT', NULL),
(148, 14, 'MT', NULL),
(148, 23, 'MT', NULL),

-- ===============================================
-- DRAGONITE
-- ===============================================
(149, 2, 'nivel', 1),
(149, 15, 'nivel', 1),
(149, 36, 'nivel', 1),
(149, 30, 'nivel', 1),
(149, 12, 'MT', NULL),
(149, 6, 'MT', NULL),
(149, 14, 'MT', NULL),
(149, 23, 'MT', NULL),
(149, 37, 'nivel', 55),
(149, 29, 'nivel', 60),
(149, 28, 'MT', NULL),
(149, 11, 'MT', NULL),

-- ===============================================
-- MEWTWO
-- ===============================================
(150, 19, 'nivel', 1),
(150, 18, 'nivel', 70),
(150, 30, 'nivel', 81),
(150, 20, 'nivel', 1),
(150, 29, 'nivel', 63),
(150, 23, 'MT', NULL),
(150, 28, 'MT', NULL),
(150, 14, 'MT', NULL),
(150, 6, 'MT', NULL),

-- ===============================================
-- MEW
-- ===============================================
(151, 2, 'nivel', 1),
(151, 18, 'nivel', 30),
(151, 23, 'MT', NULL),
(151, 12, 'MT', NULL),
(151, 6, 'MT', NULL),
(151, 14, 'MT', NULL),
(151, 30, 'MT', NULL),
(151, 37, 'MT', NULL);

create table habilidades (
    id_habilidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre       VARCHAR(50),
    descripcion  TEXT
);
INSERT INTO habilidades (id_habilidad, nombre, descripcion) VALUES
(1, 'Espesura', 'Potencia los movimientos de tipo Planta cuando los PS bajan.'),
(2, 'Mar Llamas', 'Potencia los movimientos de tipo Fuego cuando los PS bajan.'),
(3, 'Torrente', 'Potencia los movimientos de tipo Agua cuando los PS bajan.'),
(4, 'Polvo Escudo', 'Evita efectos secundarios de ataques enemigos.'),
(5, 'Fuga', 'Permite huir de combates contra Pokémon salvajes.'),
(6, 'Electricidad Estática', 'Puede paralizar al rival si hay contacto físico.'),
(7, 'Pararrayo', 'Atrae y anula los movimientos de tipo Eléctrico.'),
(8, 'Gran Encanto', 'Evita que rivales del sexo contrario ataquen.'),
(9, 'Toque Mágico', 'Convierte en hada al rival tras contacto.'),
(10, 'Nubosidad', 'Invoca lluvia al entrar en combate.'),
(11, 'Humedad', 'Evita que Pokémon usen movimientos explosivos.'),
(12, 'Sincronía', 'Contagia envenenamiento, parálisis o quemadura.'),
(13, 'Foco Interno', 'Evita que el Pokémon retroceda.'),
(14, 'Sequía', 'Invoca sol intenso al entrar en combate.'),
(15, 'Ímpetu Arena', 'Aumenta Velocidad en tormenta de arena.'),
(16, 'Elec. Rápida', 'Sube Velocidad si es alcanzado por un ataque eléctrico.'),
(17, 'Absorbe Agua', 'Recupera PS al recibir ataques de tipo Agua.'),
(18, 'Absorbe Elec', 'Recupera PS al recibir ataques de tipo Eléctrico.'),
(19, 'Absorbe Fuego', 'Recupera PS al recibir ataques de tipo Fuego.'),
(20, 'Cuerpo Maldito', 'Puede anular la habilidad del rival al contacto.'),
(21, 'Levitación', 'Evita los movimientos de tipo Tierra.'),
(22, 'Intimidación', 'Baja el Ataque del rival al entrar en combate.'),
(23, 'Gula', 'Come bayas antes de lo normal.'),
(24, 'Inmunidad', 'Evita el envenenamiento.'),
(25, 'Presión', 'Hace que el rival gaste más PP al usar movimientos.'),
(26, 'Potencia Bruta', 'Aumenta Ataque pero reduce precisión.'),
(27, 'Caparazón', 'Evita que el Pokémon sea crítico.'),
(28, 'Nado Rápido', 'Duplica la Velocidad bajo lluvia.'),
(29, 'Clorofila', 'Duplica la Velocidad bajo sol intenso.'),
(30, 'Nerviosismo', 'Impide que el rival coma bayas.');

create table pokemon_habilidades (
    id_pokemon   INT,
    id_habilidad INT,
    es_oculta    BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_pokemon, id_habilidad),
    FOREIGN KEY (id_pokemon) REFERENCES pokemon(id_pokemon),
    FOREIGN KEY (id_habilidad) REFERENCES habilidades(id_habilidad)
);
INSERT INTO pokemon_habilidades (id_pokemon, id_habilidad, es_oculta) VALUES
-- Bulbasaur, Ivysaur, Venusaur
(1, 1, FALSE),
(1, 29, TRUE),
(2, 1, FALSE),
(2, 29, TRUE),
(3, 1, FALSE),
(3, 29, TRUE),
-- Charmander, Charmeleon, Charizard
(4, 2, FALSE),
(4, 14, TRUE),
(5, 2, FALSE),
(5, 14, TRUE),
(6, 2, FALSE),
(6, 14, TRUE),
-- Squirtle, Wartortle, Blastoise
(7, 3, FALSE),
(7, 11, TRUE),
(8, 3, FALSE),
(8, 11, TRUE),
(9, 3, FALSE),
(9, 11, TRUE),
-- Caterpie, Metapod, Butterfree
(10, 4, FALSE),
(10, 5, TRUE),
(11, 4, FALSE),
(12, 9, FALSE),
-- Pikachu, Raichu
(25, 6, FALSE),
(25, 7, TRUE),
(26, 6, FALSE),
(26, 7, TRUE),
-- Clefairy, Clefable
(35, 8, FALSE),
(35, 9, TRUE),
(36, 8, FALSE),
(36, 30, TRUE),
-- Jigglypuff, Wigglytuff
(39, 8, FALSE),
(40, 8, FALSE),
-- Psyduck, Golduck
(54, 10, FALSE),
(54, 28, TRUE),
(55, 10, FALSE),
(55, 28, TRUE),
-- Abra, Kadabra, Alakazam
(63, 12, FALSE),
(63, 8, TRUE),
(64, 12, FALSE),
(64, 8, TRUE),
(65, 12, FALSE),
(65, 8, TRUE),
-- Geodude, Graveler, Golem
(74, 15, FALSE),
(74, 27, TRUE),
(75, 15, FALSE),
(75, 27, TRUE),
(76, 15, FALSE),
(76, 27, TRUE),
-- Gastly, Haunter, Gengar
(92, 21, FALSE),
(93, 21, FALSE),
(94, 20, FALSE),
-- Magikarp, Gyarados
(129, 28, FALSE),
(130, 22, FALSE),
(130, 26, TRUE),
-- Eevee
(133, 5, FALSE),
(133, 24, TRUE),
-- Eeveeluciones
(134, 17, FALSE),
(134, 11, TRUE),
(135, 18, FALSE),
(135, 16, TRUE),
(136, 19, FALSE),
(136, 23, TRUE),
-- Snorlax
(143, 24, FALSE),
(143, 23, TRUE),
-- Aves legendarias
(144, 25, FALSE),
(145, 25, FALSE),
(146, 25, FALSE),
-- Dratini, Dragonair, Dragonite
(147, 4, FALSE),
(147, 25, TRUE),
(148, 4, FALSE),
(148, 25, TRUE),
(149, 13, FALSE),
(149, 26, TRUE),
-- Mewtwo
(150, 25, FALSE),
(150, 30, TRUE),
-- Mew
(151, 12, FALSE);

