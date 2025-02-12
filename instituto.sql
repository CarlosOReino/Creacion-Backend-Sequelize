# DROP DATABASE instituto;

CREATE DATABASE instituto;

USE instituto;

CREATE TABLE profesores(
	id INT AUTO_INCREMENT,
    dni CHAR(9) UNIQUE NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    direccion VARCHAR(500) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO profesores VALUES(NULL, '11111111A', 'Paco Pérez', 'Alcalá 1', '910000000');
INSERT INTO profesores VALUES(NULL, '11111111B', 'Ana Pérez', 'Alcalá 2', '910000001');
INSERT INTO profesores VALUES(NULL, '11111111C', 'Rita Pérez', 'Alcalá 3', '910000002');
SELECT * FROM profesores;


CREATE TABLE modulos(
	id INT AUTO_INCREMENT,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fk_id_prof INT,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_id_prof) REFERENCES profesores(id)
);

INSERT INTO modulos VALUES(NULL, 'MOD1234', 'Front', 3);
INSERT INTO modulos VALUES(NULL, 'MOD1235', 'Back', 2);
INSERT INTO modulos VALUES(NULL, 'MOD1236', 'Despliegue', 1);
SELECT * FROM modulos;

DELETE FROM profesores WHERE id=6;
DELETE FROM profesores WHERE id=2;

UPDATE profesores SET id=6 WHERE id=3;

CREATE TABLE alumnos(
	id INT AUTO_INCREMENT,
    n_exp VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nac DATE NOT NULL,
    PRIMARY KEY(id)
);
INSERT INTO alumnos VALUES(NULL, 'ALUM1234', 'Manuel', 'Pérez', '2001-03-05');
INSERT INTO alumnos VALUES(NULL, 'ALUM1235', 'Rosa', 'Pérez', '2005-08-01');
INSERT INTO alumnos VALUES(NULL, 'ALUM1236', 'Margarita', 'Pérez', '2003-03-09');

CREATE TABLE cursos(
	id INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);
INSERT INTO cursos VALUES(NULL, '1º A');
INSERT INTO cursos VALUES(NULL, '2º A');
INSERT INTO cursos VALUES(NULL, '1º B');

CREATE TABLE alumnos_cursos(
	id INT AUTO_INCREMENT,
    fk_id_alumno INT NOT NULL, 
    fk_id_delegado INT, 
    fk_id_curso INT NOT NULL, 
    PRIMARY KEY(id),
    FOREIGN KEY(fk_id_alumno) REFERENCES alumnos(id)
    ON DELETE CASCADE,
    FOREIGN KEY(fk_id_delegado) REFERENCES alumnos(id)
    ON DELETE SET NULL,
    FOREIGN KEY(fk_id_curso) REFERENCES cursos(id)
    ON DELETE CASCADE
);
INSERT INTO alumnos_cursos VALUES(NULL, 1, 1, 2);
INSERT INTO alumnos_cursos VALUES(NULL, 1, NULL, 3);
INSERT INTO alumnos_cursos VALUES(NULL, 1, NULL, 1);
INSERT INTO alumnos_cursos VALUES(NULL, 2, NULL, 2);
INSERT INTO alumnos_cursos VALUES(NULL, 2, 2, 3);
INSERT INTO alumnos_cursos VALUES(NULL, 3, 3, 1);
SELECT * FROM alumnos_cursos;

DELETE FROM alumnos WHERE id=6;