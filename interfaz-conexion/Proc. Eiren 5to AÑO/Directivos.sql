-- Crear la base de datos y seleccionarla
CREATE DATABASE Directivos_db;
USE Directivos_db;

-- Crear tabla de directivos año
CREATE TABLE Directivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100),
    concurrencia VARCHAR (100)
);

-- Insertar datos en directivos año
INSERT INTO Directivos (nombre, apellido, gmail, rol) VALUES
('Dirección', 'General', 'riotercero.ds@escuelasproa.edu.ar', 'Dirección'),
('Jimena', 'Demichelis', 'jdemichelis@escuelasproa.edu.ar', 'Dirección'),
('Agustina', 'Galfre', 'agalfre@escuelasproa.edu.ar', 'Secretaría'),
('Coordinación', 'General', 'coordinacion.riotercero@escuelasproa.edu.ar', 'Coordinación'),
('Preceptoría', 'General', 'preceptoria.riotercero@escuelasproa.edu.ar', 'Preceptoría');

SELECT * FROM Directivos;