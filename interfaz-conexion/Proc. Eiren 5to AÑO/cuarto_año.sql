-- Crear la base de datos y seleccionarla
CREATE DATABASE Cuarto_db;
USE Cuarto_db;

-- Crear tabla de cuarto año
CREATE TABLE Cuarto_Año (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100)
);

-- Insertar datos en cuarto año
INSERT INTO Cuarto_año (nombre, apellido, gmail) VALUES
('Candela', 'Barrionuevo', 'cbarrionuevo@escuelasproa.edu.ar'),
('Martina Aylen', 'Barrionuevo', 'martinabarrionuevo@escuelasproa.edu.ar'),
('Sofía Mariel Luz', 'Brizuela', 'smlbrizuela@escuelasproa.edu.ar'),
('Alejo', 'Castaño Giovana', 'acastaniogiovana@escuelasproa.edu.ar'),
('Mía Bria', 'Castillo', 'mbcastillo@escuelasproa.edu.ar'),
('Luisana', 'Collino Gomez', 'lcollinogomez@escuelasproa.edu.ar'),
('Kiara Abigail', 'Giosso', 'kagiosso@escuelasproa.edu.ar'),
('Kyara Alejandra', 'Gontero', 'kagontero@escuelasproa.edu.ar'),
('Bautista', 'Grinovero', 'bgrinovero@escuelasproa.edu.ar'),
('Alejandro Luis', 'Guevara Kurozaki', 'alguevarakurozaki@escuelasproa.edu.ar'),
('Luis Felipe', 'Illarraga Gonzalez', 'lfillarragagonzalez@escuelasproa.edu.ar'),
('Franco', 'Leone Barrionuevo', 'fleonebarrionuevo@escuelasproa.edu.ar'),
('Joaquín', 'López', 'joaquinlopez@escuelasproa.edu.ar'),
('Pedro', 'Luján Della Vedova', 'plujandellavedova@escuelasproa.edu.ar'),
('Lola', 'Maratín', 'lmaratin@escuelasproa.edu.ar'),
('Malena Guillermina', 'Pino', 'mgpino@escuelasproa.edu.ar'),
('Joaquín', 'Raffos', 'jraffos@escuelasproa.edu.ar'),
('Thiago Joel', 'Reinoso', 'tjreinoso@escuelasproa.edu.ar'),
('Marcos Valentín', 'Romero', 'mvromero@escuelasproa.edu.ar'),
('Alejo', 'Serminatti', 'aserminatti@escuelasproa.edu.ar'),
('Matías', 'Torres', 'matiastorres@escuelasproa.edu.ar'),
('Sofía Magdalena', 'Vergara', 'smvergara@escuelasproa.edu.ar'),
('Lucila', 'Zalazar', 'lzalazar@escuelasproa.edu.ar');

-- Consultas para verificar que todo esté bien
SELECT * FROM Cuarto_año;