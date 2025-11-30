/* ===========================================
   1. Crear / recrear la base de datos
   =========================================== */
USE master;
GO

IF DB_ID(N'BD_Calificaciones') IS NOT NULL
    DROP DATABASE BD_Calificaciones;
GO

CREATE DATABASE BD_Calificaciones
-- Si tu servidor da error con CONTAINMENT, comenta la siguiente línea:
CONTAINMENT = NONE
ON PRIMARY
(
    NAME = BD_Calificaciones_dat,
    FILENAME = 'C:\BasesdeDatos\BD_Calificaciones.mdf',
    SIZE = 20MB,
    MAXSIZE = 200MB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = BD_Calificaciones_log,
    FILENAME = 'C:\BasesdeDatos\BD_Calificaciones.log.ldf',
    SIZE = 20MB,
    MAXSIZE = 200MB,
    FILEGROWTH = 10MB
)
COLLATE Modern_Spanish_CI_AS;
GO

USE BD_Calificaciones;
GO

/* ===========================================
   2. Eliminar tablas si existen (orden por FKs)
   =========================================== */
IF OBJECT_ID(N'dbo.Grupo', N'U') IS NOT NULL      DROP TABLE dbo.Grupo;
IF OBJECT_ID(N'dbo.Asignatura', N'U') IS NOT NULL DROP TABLE dbo.Asignatura;
IF OBJECT_ID(N'dbo.Estudiante', N'U') IS NOT NULL DROP TABLE dbo.Estudiante;
GO

/* ===========================================
   3. Crear tablas
   =========================================== */

CREATE TABLE dbo.Estudiante
(
    cif       NCHAR(8)     NOT NULL,
    nombres   NVARCHAR(40) NOT NULL,
    apellidos NVARCHAR(30) NOT NULL,
    sexo      BIT          NOT NULL,
    ingreso   SMALLINT     NOT NULL,
    tipoBeca  NVARCHAR(15) NOT NULL,

    CONSTRAINT PK_Estudiante PRIMARY KEY (cif),
    CONSTRAINT CK_Estudiante_Sexo    CHECK (sexo IN (0,1)),
    CONSTRAINT CK_Estudiante_Ingreso CHECK (ingreso BETWEEN 2000 AND 2100)
);
GO

CREATE TABLE dbo.Asignatura
(
    codigo   NVARCHAR(10) NOT NULL,
    nombre   NVARCHAR(60) NOT NULL,
    creditos TINYINT      NOT NULL, 
    semestre TINYINT      NOT NULL,

    CONSTRAINT PK_Asignatura PRIMARY KEY (codigo),
    CONSTRAINT CK_Asignatura_Creditos CHECK (creditos BETWEEN 1 AND 10),
    CONSTRAINT CK_Asignatura_Semestre CHECK (semestre BETWEEN 1 AND 10)
);
GO

CREATE TABLE dbo.Grupo
(
    cif           NCHAR(8)     NOT NULL,
    codAsignatura NVARCHAR(10) NOT NULL,
    calificacion  TINYINT      NOT NULL DEFAULT 0,

    CONSTRAINT PK_Grupo PRIMARY KEY (cif, codAsignatura),
    CONSTRAINT FK_Grupo_Estudiante FOREIGN KEY (cif)
        REFERENCES dbo.Estudiante(cif),
    CONSTRAINT FK_Grupo_Asignatura FOREIGN KEY (codAsignatura)
        REFERENCES dbo.Asignatura(codigo),
    CONSTRAINT CK_Grupo_Calificacion CHECK (calificacion BETWEEN 0 AND 100)
);
GO

/* ===========================================
   4. Insertar 50 estudiantes
   =========================================== */

INSERT INTO dbo.Estudiante (cif, nombres, apellidos, sexo, ingreso, tipoBeca)
VALUES
('25467898', 'Dani Meza',          'Meza Ortiz',        1, 2024, 'Deportiva'),
('14568745', 'Johaneris Sayrin',   'Mejia Torres',      0, 2025, 'Academica'),

('20240001', 'Carlos',    'Ruiz Morales',      1, 2024, 'Sin beca'),
('20240002', 'María',     'Fernández Soto',    0, 2024, 'Academica'),
('20240003', 'José',      'Pérez Díaz',        1, 2024, 'Deportiva'),
('20240004', 'Ana',       'Rodríguez Vega',    0, 2024, 'Sin beca'),
('20240005', 'Miguel',    'López Rivas',       1, 2024, 'Sin beca'),
('20240006', 'Lucía',     'González Cruz',     0, 2024, 'Cultural'),
('20240007', 'Andrés',    'Castro León',       1, 2024, 'Deportiva'),
('20240008', 'Paola',     'Mendoza Ruiz',      0, 2024, 'Academica'),
('20240009', 'Javier',    'Martínez Solís',    1, 2024, 'Sin beca'),
('20240010', 'Elena',     'Ortega Mora',       0, 2024, 'Academica'),
('20240011', 'Sergio',    'Navarro Peña',      1, 2024, 'Sin beca'),
('20240012', 'Gabriela',  'Rojas Luna',        0, 2024, 'Cultural'),
('20240013', 'Ricardo',   'Aguilar Pino',      1, 2024, 'Deportiva'),
('20240014', 'Valeria',   'Campos Díaz',       0, 2024, 'Academica'),
('20240015', 'Diego',     'Salazar Ruiz',      1, 2024, 'Sin beca'),
('20240016', 'Carolina',  'Vargas Arias',      0, 2024, 'Cultural'),
('20240017', 'Fernando',  'Santos Lara',       1, 2024, 'Deportiva'),
('20240018', 'Nicole',    'Velásquez Roble',   0, 2024, 'Sin beca'),
('20240019', 'Rodrigo',   'Palacios Gil',      1, 2024, 'Sin beca'),
('20240020', 'Daniela',   'Fuentes Mora',      0, 2024, 'Academica'),
('20240021', 'Óscar',     'Ruiz Pérez',        1, 2024, 'Deportiva'),
('20240022', 'Alejandra', 'Acosta León',       0, 2024, 'Sin beca'),
('20240023', 'Marco',     'Chávez Ríos',       1, 2024, 'Sin beca'),
('20240024', 'Brenda',    'Solís Mejía',       0, 2024, 'Cultural'),

('20250001', 'Héctor',    'García Ruiz',       1, 2025, 'Sin beca'),
('20250002', 'Patricia',  'Rivas López',       0, 2025, 'Academica'),
('20250003', 'Mauricio',  'Luna Campos',       1, 2025, 'Deportiva'),
('20250004', 'Roxana',    'Mora Pérez',        0, 2025, 'Sin beca'),
('20250005', 'Kevin',     'Torres Díaz',       1, 2025, 'Deportiva'),
('20250006', 'Liliana',   'Gómez Arias',       0, 2025, 'Sin beca'),
('20250007', 'Pablo',     'Serrano Cruz',      1, 2025, 'Cultural'),
('20250008', 'Mónica',    'Leiva Solís',       0, 2025, 'Academica'),
('20250009', 'Álvaro',    'Campos Rivas',      1, 2025, 'Sin beca'),
('20250010', 'Karen',     'Suárez León',       0, 2025, 'Cultural'),
('20250011', 'Esteban',   'Pineda Mora',       1, 2025, 'Sin beca'),
('20250012', 'Irene',     'Vega López',        0, 2025, 'Academica'),
('20250013', 'Tomás',     'Zamora Cruz',       1, 2025, 'Deportiva'),
('20250014', 'Alejandro', 'Muñoz Díaz',        1, 2025, 'Sin beca'),
('20250015', 'Carmen',    'Reyes Soto',        0, 2025, 'Sin beca'),
('20250016', 'Bruno',     'Vargas León',       1, 2025, 'Deportiva'),
('20250017', 'Natalia',   'Figueroa Gil',      0, 2025, 'Cultural'),
('20250018', 'Joel',      'Romero Pineda',     1, 2025, 'Sin beca'),
('20250019', 'Marisol',   'Sáenz Rojas',       0, 2025, 'Academica'),
('20250020', 'Guillermo', 'Miranda Ríos',      1, 2025, 'Sin beca'),
('20250021', 'Luisa',     'Calderón Ruiz',     0, 2025, 'Cultural'),
('20250022', 'Felipe',    'Coronado Díaz',     1, 2025, 'Deportiva'),
('20250023', 'Julieta',   'Sandoval Cruz',     0, 2025, 'Sin beca'),
('20250024', 'Ignacio',   'Delgado León',      1, 2025, 'Sin beca');
GO

/* ===========================================
   5. Insertar 10 asignaturas
   =========================================== */

INSERT INTO dbo.Asignatura (codigo, nombre, creditos, semestre)
VALUES
('SIS-101', 'Fundamentos de Bases de Datos', 4, 1),
('SIS-102', 'Álgebra Lineal',                4, 1),
('SIS-103', 'Programación I',                4, 1),
('SIS-104', 'Programación II',               4, 2),
('SIS-105', 'Estadística I',                 3, 2),
('SIS-106', 'Estadística II',                3, 3),
('SIS-107', 'Redes de Computadoras',         4, 3),
('SIS-108', 'Sistemas Operativos',           4, 3),
('SIS-109', 'Ingeniería de Software',        4, 4),
('SIS-110', 'Análisis de Algoritmos',        4, 4);
GO

/* ===========================================
   6. Insertar las 500 calificaciones
      (50 estudiantes x 10 asignaturas)
   =========================================== */

INSERT INTO dbo.Grupo (cif, codAsignatura, calificacion)
SELECT e.cif,
       a.codigo,
       80 AS calificacion          -- puedes cambiar 80 por otra lógica si quieres variar las notas
FROM dbo.Estudiante e
CROSS JOIN dbo.Asignatura a;
GO
