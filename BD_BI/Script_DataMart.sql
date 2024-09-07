-- Creación de la base de datos
---drop database [GestionHospital_BI];
--use GestionHospital;
/*ALTER DATABASE GestionHospital_BI
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO*/

CREATE DATABASE [GestionHospital_BI];
GO

USE [GestionHospital_BI];
GO
-- Dimensión Tiempo
CREATE TABLE Dim_Tiempo (
    [id] INTEGER NOT NULL IDENTITY UNIQUE,
    Dia INT NOT NULL,
    Mes INT NOT NULL,
    Trimestre INT NOT NULL,
    Año INT NOT NULL,
	PRIMARY KEY([id])
);
GO
--DROP TABLE Dim_Tiempo

-- Dimensión Paciente
CREATE TABLE Dim_Paciente (
    [id] INTEGER NOT NULL IDENTITY UNIQUE,
    Nombre VARCHAR(255) NOT NULL,
    Genero VARCHAR(10) NOT NULL,
    Edad INT NOT NULL,
	tipo_enfermedad VARCHAR(255),
	PRIMARY KEY([id])
);
GO

-- Dimensión Médico
CREATE TABLE Dim_Medico (
    [id] INTEGER NOT NULL IDENTITY UNIQUE,
    Nombre VARCHAR(255) NOT NULL,
    Especialidad VARCHAR(255) NOT NULL,
    NumeroLicencia VARCHAR(50) NOT NULL,
	PRIMARY KEY([id])
);
GO

-- Dimensión Cita
CREATE TABLE Dim_Cita (
    [id] INTEGER NOT NULL IDENTITY UNIQUE,
    Fecha DATETIME NOT NULL,
    MotivoCita VARCHAR(255) NOT NULL,
    DuracionCita TIME(7) NOT NULL,
	Nombre_paciente VARCHAR(255) NOT NULL,
	Nombre_medico VARCHAR(255) NOT NULL,
	PRIMARY KEY([id])
);
GO
---drop table Dim_Cita;
-- Dimensión Tratamiento
CREATE TABLE Dim_Tratamiento (
    [id] INTEGER NOT NULL IDENTITY UNIQUE,
    Descripcion VARCHAR(MAX) NOT NULL,
    Duracion_tratamiento INT NOT NULL,
    Costo DECIMAL(18, 2) NOT NULL,
	Nombre_paciente VARCHAR(255) NOT NULL,
	Nombre_medico VARCHAR(255) NOT NULL,
	PRIMARY KEY([id])
);
GO
---drop table Dim_Tratamiento

-- Creación de la tabla de Hechos de Citas
CREATE TABLE Hechos_Citas (
    [id] INTEGER NOT NULL IDENTITY UNIQUE,
    dim_tiempo_ID INT NOT NULL,
    dim_paciente_ID INT NOT NULL,
    dim_medico_ID INT NOT NULL,
	dim_tratamiento_ID INT NOT NULL,
	dim_cita_ID INT NOT NULL,
    TipoCita VARCHAR(255) NOT NULL,
    NumeroCitas INT NOT NULL,
    CostosTratamiento DECIMAL(18, 2) NOT NULL,
	PRIMARY KEY([id]),
    CONSTRAINT FK_hechos_dim_tiempo FOREIGN KEY (dim_tiempo_ID) REFERENCES Dim_Tiempo(id),
    CONSTRAINT FK_hechos_paciente FOREIGN KEY (dim_paciente_ID) REFERENCES Dim_Paciente(id),
    CONSTRAINT FK_hechos_dim_medico FOREIGN KEY (dim_medico_ID) REFERENCES Dim_Medico(id),
	CONSTRAINT FK_hechos_dim_cita FOREIGN KEY (dim_cita_ID) REFERENCES Dim_Cita(id),
	CONSTRAINT FK_hechos_dim_tratamiento FOREIGN KEY (dim_tratamiento_ID) REFERENCES Dim_Tratamiento(id),
);
GO

---drop table Hechos_Citas;

ALTER TABLE Dim_Paciente
ADD paciente_id INT;

ALTER TABLE Dim_Medico
ADD medico_id INT NOT NULL;

ALTER TABLE Dim_Cita
ADD cita_id INT;

ALTER TABLE Dim_Tratamiento
ADD tratamiento_id INT;

ALTER TABLE dim_tiempo
ADD Fecha DATETIME NOT NULL;

ALTER TABLE dim_tiempo
ADD nombre_mes VARCHAR(50) NOT NULL;




SELECT*FROM Dim_Cita
SELECT*FROM Dim_Medico
SELECT*FROM Dim_Paciente
SELECT*FROM Dim_Tratamiento
SELECT*FROM Dim_Tiempo
SELECT*FROM Hechos_Citas;