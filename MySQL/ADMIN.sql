-- Crear la base de datos y seleccionarla
DROP DATABASE IF EXISTS escuela_db;
CREATE DATABASE GESTION_ADMIN_db;
USE gestion_admin_db;

-- Crear tabla de profes año
CREATE TABLE Profes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100),
    concurrencia VARCHAR (100)
);

-- Crear tabla de directivos año
CREATE TABLE Directivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100),
    concurrencia VARCHAR (100)
);


-- Insertar datos en profes año
INSERT INTO Profes (nombre, apellido, gmail, concurrencia) VALUES
('Elias', 'Pérez', 'eliasperez@escuelasproa.edu.ar'),
('Elias', 'Pérez', 'eliasperez@escuelasproa.edu.ar'),
('Elias', 'Pérez', 'eliasperez@escuelasproa.edu.ar');

-- Insertar datos en directivos año
INSERT INTO Directivos (nombre, apellido, gmail, concurrencia) VALUES
('Elias', 'Pérez', 'eliasperez@escuelasproa.edu.ar'),
('Elias', 'Pérez', 'eliasperez@escuelasproa.edu.ar'),
('Elias', 'Pérez', 'eliasperez@escuelasproa.edu.ar');


-- Consultas para verificar que todo esté bien
SELECT * FROM Profes;
SELECT * FROM Directivos;