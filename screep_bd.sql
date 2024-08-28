
---use dsrp_gestor_hospitales;
---drop database GestionHospital;
CREATE DATABASE GestionHospital;
GO

-- Usar la base de datos
USE GestionHospital;
GO
-- CREAR SQUEMA
--CREATE SCHEMA CLIENTE;
-- DROP SQUEMA
--DROP SCHEMA CLIENTE;

CREATE TABLE historial_medico(
	id INT PRIMARY KEY IDENTITY(1,1),
	Descripcion VARCHAR(255)
)
GO

CREATE TABLE Pacientes (
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	numero_documento varchar(20) unique not null,
    nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	edad INT NOT NULL,
	genero VARCHAR(10) not null,
    direccion VARCHAR(100) NULL,
    telefono VARCHAR(20) NULL,
    fecha_nacimiento DATE NOT NULL,
    historial_medico_ID INT NULL,
	CONSTRAINT fk_Pacientes_Historial_medico FOREIGN KEY (historial_medico_ID) REFERENCES historial_medico(id)
);
GO

-- Tabla M�dicos
CREATE TABLE Medicos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255) NOT NULL,
    especialidad VARCHAR(255) NOT NULL,
    contacto VARCHAR(255) NULL,
    numero_licencia_medica VARCHAR(50) NOT NULL
);

--tabla de tipo de citas
CREATE TABLE tipo_citas(
id INT PRIMARY KEY IDENTITY(1,1),
motivo_cita varchar(100) NOT NULL,
observacion_del_medico VARCHAR(255) NOT NULL
);
GO
-- Tabla Citas

CREATE TABLE Citas (
    id INT PRIMARY KEY IDENTITY(1,1),
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    Paciente_ID INT NOT NULL,
    Medico_ID INT NOT NULL,
    tipocita_ID INT NULL,
	duracion_cita TIME NOT NULL,
    CONSTRAINT fk_citas_paciente FOREIGN KEY (Paciente_ID) REFERENCES Pacientes(id),
    CONSTRAINT fk_citas_medicos FOREIGN KEY (Medico_ID) REFERENCES Medicos(id),
	CONSTRAINT fk_citas_tipocitas FOREIGN KEY (tipocita_ID) REFERENCES tipo_citas(id)
);

-- Tabla Tratamientos
CREATE TABLE Tratamientos (
    id INT PRIMARY KEY IDENTITY(1,1),
    Paciente_ID INT NOT NULL,
    Medico_ID INT NOT NULL,
    descripcion VARCHAR(MAX) NOT NULL,
    duracion INT NOT NULL, -- asumiendo que la duracion es en dias
    CONSTRAINT fk_tratamiento_pacientes FOREIGN KEY (Paciente_ID) REFERENCES Pacientes(id),
    CONSTRAINT fk_tratamiento_medicos FOREIGN KEY (Medico_ID) REFERENCES Medicos(id)
);
GO
