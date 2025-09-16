-- Crear la base de datos y seleccionarla
DROP DATABASE IF EXISTS escuela_db;
CREATE DATABASE CICLOBASICO_db;
USE ciclobasico_db;

-- Crear tabla de primer año
CREATE TABLE Primer_Año (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100)
);

-- Crear tabla de segundo año
CREATE TABLE Segundo_año (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100)
);

-- Crear tabla de tercer año
CREATE TABLE Tercer_año (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100)
);

-- Insertar datos en primer año
INSERT INTO Primer_año (nombre, apellido, gmail) VALUES
('Francina Geraldine', 'Almada', 'fgalmada@escuelasproa.edu.ar'),
('Aylén', 'Ansaldi', 'aansaldi@escuelasproa.edu.ar'),
('Santino', 'Cardoso', 'scardoso@escuelasproa.edu.ar'),
('Paulina', 'Carranza', 'paulinacarranza@escuelasproa.edu.ar'),
('Luciano Javier', 'Casali', 'ljcasai@escuelasproa.edu.ar'),
('Felipe', 'Ceballos Rivoiro', 'fceballosrivoiro@escuelasproa.edu.ar'),
('Benjamín Matías', 'Costamagna', 'bmcostamagna@escuelasproa.edu.ar'),
('Bruno Elías', 'Durán Gauna', 'bedurangauna@escuelasproa.edu.ar'),
('Jerónimo', 'Echarry', 'jecharry@escuelasproa.edu.ar'),
('Genaro', 'Fernández', 'gfernandez@escuelasproa.edu.ar'),
('Thiago Daniel', 'Giorgetti', 'tdgiorgetti@escuelasproa.edu.ar'),
('Antonia', 'Gómez', 'agomez@escuelasproa.edu.ar'),
('Elías Javier', 'Gómez', 'ejgomez@escuelasproa.edu.ar'),
('Tiziano', 'Gómez', 'tgomez@escuelasproa.edu.ar'),
('Amelie', 'Grinóvero', 'agrinovero@escuelasproa.edu.ar'),
('Bárbara', 'Kolesar', 'bkolesar@escuelasproa.edu.ar'),
('Juan Pablo', 'Marín Lescano', 'jpmarinlescano@escuelasproa.edu.ar'),
('Emmanuel', 'Martinelli', 'emartinelli@escuelasproa.edu.ar'),
('Benjamín Stéfano', 'Más', 'bsmas@escuelasproa.edu.ar'),
('Facundo', 'Monzón', 'fmonzon@escuelasproa.edu.ar'),
('Ciro Valentín', 'Moya', 'cvmoya@escuelasproa.edu.ar'),
('Francina', 'Ostermeyer Farías', 'fostermeyerfarias@escuelasproa.edu.ar'),
('Yaco Daniel', 'Palma', 'ydpalma@escuelasproa.edu.ar'),
('Lola Valentina', 'Prono', 'lvprono@escuelasproa.edu.ar'),
('Valentina Maria Sol', 'Ramos', 'vmsramos@escuelasproa.edu.ar'),
('Francina Alexia', 'Rampoldi', 'farampoldi@escuelasproa.edu.ar'),
('Serena Margarita', 'Ruano', 'smruano@escuelasproa.edu.ar'),
('Pilar Catalina', 'Soria', 'pcsoria@escuelasproa.edu.ar'),
('Ian Jair', 'Sosa', 'ijsosa@escuelasproa.edu.ar'),
('Benicio', 'Torres Galván', 'btorresgalvan@escuelasproa.edu.ar'),
('Jano Gastón', 'Torres', 'jgtorres@escuelasproa.edu.ar');

-- Insertar datos en segundo año
INSERT INTO Segundo_año (nombre, apellido, gmail) VALUES
('Alma', 'Ledesma', 'aledesma@escuelasproa.edu.ar'),
('Maitena', 'Colmenares', 'mscolmenares@escuelasproa.edu.ar'),
('Brian', 'Aguilar', 'baguilar@escuelasproa.edu.ar'),
('Tiziano', 'Bardos', 'tbardos@escuelasproa.edu.ar'),
('Benjamin', 'Barberon', 'bbrunobarberon@escuelasproa.edu.ar'),
('Camila', 'Calvi', 'ccalvi@escuelasproa.edu.ar'),
('Tomás', 'Canela', 'tbcanela@escuelasproa.edu.ar'),
('Emilia', 'Delavedova', 'edelavedova@escuelasproa.edu.ar'),
('Leonel', 'Godoy', 'lbgodoy@escuelasproa.edu.ar'),
('Santiago', 'Godoy', 'sgodoyherrador@escuelasproa.edu.ar'),
('Juan', 'Gomez', 'jegomez@escuelasproa.edu.ar'),
('Mia', 'Gomez', 'mvgomez@escuelasproa.edu.ar'),
('Ramiro', 'Gomez', 'regomez@escuelasproa.edu.ar'),
('Joaquin', 'Gonzalez', 'jgonzalez@escuelasproa.edu.ar'),
('Jonathan', 'Gonzalez', 'jjgonzalez@escuelasproa.edu.ar'),
('Lucas', 'Gonzalez', 'ltgonzalez@escuelasproa.edu.ar'),
('Ulises', 'Herrera', 'uherrerapescaturi@escuelasproa.edu.ar'),
('Axel', 'Iberra', 'aiberra@escuelasproa.edu.ar'),
('Roberto', 'Maldonado', 'rmmaldonado@escuelasproa.edu.ar'),
('Juan', 'Maldonado', 'jimaldonado@escuelasproa.edu.ar'),
('Emma', 'Palombarini', 'epalombarini@escuelasproa.edu.ar'),
('Matilde', 'Pino', 'mcpino@escuelasproa.edu.ar'),
('Facundo', 'Restivo', 'fnrestivo@escuelasproa.edu.ar'),
('Franco', 'Restivo', 'ferestivo@escuelasproa.edu.ar'),
('Esmeralda', 'Romero', 'eromero@escuelasproa.edu.ar'),
('Octavio', 'Sequeira', 'osequeira@escuelasproa.edu.ar'),
('Zoe', 'Soria', 'zmsoria@escuelasproa.edu.ar'),
('Gonzalo', 'Sparacino', 'gdsparacino@escuelasproa.edu.ar'),
('Franco', 'Vergara', 'fdvergara@escuelasproa.edu.ar'),
('Antonella', 'Vigna', 'afvigna@escuelasproa.edu.ar');

-- Insertar datos en tercer año
INSERT INTO Tercer_año (nombre, apellido, gmail) VALUES
('Morena', 'Aguilera', 'mjaguilera@escuelasproa.edu.ar'),
('Abril', 'Almada', 'abrilalmada@escuelasproa.edu.ar'),
('Kiara Camila', 'Barrionuevo', 'kcbarrionuevo@escuelasproa.edu.ar'),
('Sofía', 'Borghi', 'slborghi@escuelasproa.edu.ar'),
('Gaspar', 'Caballero', 'gcaballero@escuelasproa.edu.ar'),
('Abril', 'Cabral', 'amcabral@escuelasproa.edu.ar'),
('Juan Bautista', 'Carballo', 'jbcarballo@escuelasproa.edu.ar'),
('Franco', 'Centeno', 'flcenteno@escuelasproa.edu.ar'),
('Dalmiro', 'Ferreyra', 'dferreyra@escuelasproa.edu.ar'),
('Gerardo', 'Ferreyra', 'gfferreyra@escuelasproa.edu.ar'),
('Milena', 'Giménez', 'mgimenez@escuelasproa.edu.ar'),
('Kiara Abigail', 'Giosso', 'kagiosso@escuelasproa.edu.ar'),
('Ema Sofía', 'Gómez', 'esgomez@escuelasproa.edu.ar'),
('Axel', 'Gradac', 'aggradac@escuelasproa.edu.ar'),
('Paul', 'Jean Charles', 'pjeancharles@escuelasproa.edu.ar'),
('Pedro', 'Liendo', 'pdliendo@escuelasproa.edu.ar'),
('Facundo', 'Parrilla', 'faparrilla@escuelasproa.edu.ar'),
('Morena Jazmín', 'Rodríguez', 'mjrodriguez@escuelasproa.edu.ar'),
('Santino', 'Rodríguez Selva', 'srodriguezselva@escuelasproa.edu.ar'),
('Sasha', 'Scalabrini', 'smscalabrini@escuelasproa.edu.ar'),
('Brian', 'Sosa', 'besosa@escuelasproa.edu.ar'),
('Kevin', 'Torres', 'kftorres@escuelasproa.edu.ar'),
('Thiago', 'Torres', 'tmtorres@escuelasproa.edu.ar'),
('Milagros Margarita', 'Ortiz Morán', 'vmmortizmoran@escuelasproa.edu.ar'),
('Guadalupe Abigaíl', 'Fernández', 'gafernandez@escuelasproa.edu.ar');

-- Consultas para verificar que todo esté bien
SELECT * FROM Primer_año;
SELECT * FROM Segundo_año;
SELECT * FROM Tercer_año;