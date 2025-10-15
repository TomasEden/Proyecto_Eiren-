-- Crear la base de datos y seleccionarla
CREATE DATABASE CICLOORIENTADO_db;
USE cicloorientado_db;

-- Crear tabla de quinto año
CREATE TABLE Quinto_año (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100)
);

-- Insertar datos en quinto año
INSERT INTO Quinto_año (nombre, apellido, gmail) VALUES
('Máximo Santiago', 'Bautista', 'msbautista@escuelasproa.edu.ar'),
('Bruno Gabriel', 'Cabral', 'bgcabral@escuelasproa.edu.ar'),
('Valentino', 'Centeno', 'vcenteno@escuelasproa.edu.ar'),
('Umma', 'Leyria', 'uchiapperoleyria@escuelasproa.edu.ar'),
('Gianna Jazmín', 'Colmenares', 'gjcolmenares@escuelasproa.edu.ar'),
('Kiara', 'Durán Gauna', 'kdurangauna@escuelasproa.edu.ar'),
('Tomás Agustín', 'Eden', 'taeden@escuelasproa.edu.ar'),
('Micael Martín', 'Giménez', 'mmgimenez@escuelasproa.edu.ar'),
('Malena Aylen', 'Gómez', 'maygomez@escuelasproa.edu.ar'),
('Tiago David', 'Gómez', 'tdgomez@escuelasproa.edu.ar'),
('Santiago Tomás', 'Machado', 'stmachado@escuelasproa.edu.ar'),
('Paulina', 'Maldonado', 'paulinamaldonado@escuelasproa.edu.ar'),
('Matías Nicolás', 'Malissia Iberra', 'mnmalissiaiberra@escuelasproa.edu.ar'),
('Lucas', 'Marín Lescano', 'lmarinlescano@escuelasproa.edu.ar'),
('Leandro', 'Nuñez', 'lenunez@escuelasproa.edu.ar'),
('Dylan', 'Oviedo', 'doviedo@escuelasproa.edu.ar'),
('Nehemías Ángel Uriel', 'Ponce', 'nauponce@escuelasproa.edu.ar'),
('Laura Isabella', 'Quintero Barco', 'liquinterobarco@escuelasproa.edu.ar'),
('Santiago Nahuel', 'Vigna', 'snvigna@escuelasproa.edu.ar');

-- Consultas para verificar que todo esté bien
SELECT * FROM Quinto_año;