-- Crear la base de datos y seleccionarla
CREATE DATABASE Sexto_db;
USE Sexto_db;

-- Crear tabla de sexto año
CREATE TABLE Sexto_año (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100)
);

-- Insertar datos en sexto año
INSERT INTO Sexto_año (nombre, apellido, gmail) VALUES
('Nahuel Benjamín', 'Bima', 'nbbima@escuelasproa.edu.ar'),
('Mateo', 'Bruno Barberon', 'mbrunobarberon@escuelasproa.edu.ar'),
('Dylan Gabriel', 'Cabrera', 'dgcabrera@escuelasproa.edu.ar'),
('Laureano', 'Carranza', 'lcarranza@escuelasproa.edu.ar'),
('Huillén Antonela', 'Ceballo Centurión', 'hceballocenturion@escuelasproa.edu.ar'),
('Ignacio', 'Chammella', 'ichammella@escuelasproa.edu.ar'),
('Juan Pablo', 'Domínguez', 'jpdominguez@escuelasproa.edu.ar'),
('Camila', 'Flores Ortiz', 'cfloresortiz@escuelasproa.edu.ar'),
('Valentina Aylen', 'Godoy', 'vagodoy@escuelasproa.edu.ar'),
('Amulen Alejandra', 'Gutierrez', 'aagutierrez@escuelasproa.edu.ar'),
('Santino Felipe', 'Hergert', 'shergert@escuelasproa.edu.ar'),
('Morena', 'Ledesma', 'moledesma@escuelasproa.edu.ar'),
('Santiago Nicolás', 'Liendo', 'snliendo@escuelasproa.edu.ar'),
('Sofía Abril', 'Lugani', 'slugani@escuelasproa.edu.ar'),
('Marianela', 'Mattio', 'mmattio@escuelasproa.edu.ar'),
('Ricardo Francisco', 'Nuñez', 'rfnunez@escuelasproa.edu.ar'),
('Victorio', 'Paskevicius', 'vpaskevicius@escuelasproa.edu.ar'),
('Juan Ignacio', 'Pavón', 'jipavon@escuelasproa.edu.ar'),
('Ignacio Joaquín', 'Retivo', 'ijretivo@escuelasproa.edu.ar'),
('Leonel Adrián', 'Soto', 'lasoto@escuelasproa.edu.ar'),
('Giuliana María', 'Spaccesi', 'gmspaccesi@escuelasproa.edu.ar'),
('Araceli', 'Valfredo Álvarez', 'avalfredoalvarez@escuelasproa.edu.ar'),
('Ana Belén', 'Vergara', 'abvergara@escuelasproa.edu.ar');

-- Consultas para verificar que todo esté bien
SELECT * FROM Sexto_año;