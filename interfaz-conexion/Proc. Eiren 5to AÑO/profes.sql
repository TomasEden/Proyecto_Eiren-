-- Crear la base de datos y seleccionarla
CREATE DATABASE Profes_db;
USE Profes_db;

-- Crear tabla de profes año
CREATE TABLE Profes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100),
    concurrencia VARCHAR (100)
);

-- Insertar datos en sexto año
INSERT INTO Profes (nombre, apellido, gmail, materia) VALUES
('Nieves', 'Villalba V', 'vnvillalba@escuelasproa.edu.ar', 'Programación IV - Robótica - Club de ciencias'),
('Débora', 'Buratti', 'dburatti@escuelasproa.edu.ar', 'Lengua y Literatura'),
('Mariana', 'Gubaro', 'mgubaro@escuelasproa.edu.ar', 'Matemática'),
('Leonardo', 'Calvi', 'localvi@escuelasproa.edu.ar', 'Física - Biología'),
('Blas', 'Boznano', 'bbonzano@escuelasproa.edu.ar', 'Geografía'),
('Fernanda', 'Llanos', 'fllanos@escuelasproa.edu.ar', 'Inglés - TIA'),
('Juan Pablo', 'Freggiaro', 'juanpablofreggiaro@gmail.com', 'Educación Física'),
('Florencia', 'Felici', 'mffelici@escuelasproa.edu.ar', 'FVT - Historia - Ética - Cuidadania y política'),
('Edgar', 'Busto', 'edgarbustos@escuelasproa.edu.ar', 'Club de Deportes'),
('Yoavi', 'Costamagna', 'ycostamagna@escuelasproa.edu.ar', 'Club de Arte - Música'),
('Carmen', 'Devallis', 'cdevallisescuelasproa.edu.ar', 'Matemática - Sist. Operativos - Entornos digitales - Tecnología'),
('Evelín', 'Menazzi', 'ermenazzi@escuelasproa.edu.ar', 'Lengua'),
('Facundo', 'Martinez', 'fmartinez@escuelasproa.edu.ar', 'Inglés'),
('Marina', 'Badino', 'mbadino@escuelasproa.edu.ar', 'Teatro - Club de arte'),
('María Soledad', 'Muñoz', 'msmunoz@escuelasproa.edu.ar', 'Cuidadanía y participación - FVT - Filosofía'),
('Sofía', 'Phileas', 'sphieas@escuelasproas.edu.ar', 'Club de deporte - Educ. Física'),
('Pablo', 'Torres', 'pmtorres@escuelasproa.edu.ar', 'App moviles - Club de ciencias - Diseño de interfaces'),
('Melisa', 'Ferroni', 'mferroni@escuelasproa.edu.ar', 'Tecnología'),
('Viviana', 'Guillen', 'vaguillen@escuelasproa.edu.ar', 'Testing - Programacion IV');


-- Consultas para verificar que todo esté bien
SELECT * FROM Profes;