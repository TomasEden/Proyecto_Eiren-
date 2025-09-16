-- Crear la base de datos y seleccionarla
DROP DATABASE IF EXISTS escuela_db;
CREATE DATABASE CICLOORIENTADO_db;
USE cicloorientado_db;

-- Crear tabla de cuarto año
CREATE TABLE Cuarto_Año (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100)
);

-- Crear tabla de quinto año
CREATE TABLE Quinto_año (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    gmail VARCHAR(100)
);

-- Crear tabla de sexto año
CREATE TABLE Sexto_año (
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
SELECT * FROM Cuarto_año;
SELECT * FROM Quinto_año;
SELECT * FROM Sexto_año;