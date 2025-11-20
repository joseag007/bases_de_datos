USE proveedores;

-- Crea una nueva tabla categoría

-- Crea una nueva tabla usuarios
CREATE TABLE usuarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    rol ENUM('Estudiante', 'Profesor') NOT NULL
);

INSERT INTO usuarios (nombre, rol) VALUES ( 'Juanjo', 'Estudiante')

ALTER TABLE usuarios MODIFY nombre VARCHAR(50) NOT NULL;
ALTER TABLE usuario ALTER rol SET DEFAULT 'Estudiante';

DESCRIBE usuarios;

SHOW CREATE TABLE usuarios;
