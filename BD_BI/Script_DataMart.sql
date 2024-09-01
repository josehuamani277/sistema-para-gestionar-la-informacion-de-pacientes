-- Creación de la base de datos
--drop database [GestionHospital_BI];
/*ALTER DATABASE GestionHospital_BI
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO*/

CREATE DATABASE [GestionHospital_BI];
GO

USE [GestionHospital_BI];
GO
-- Dimensión Tiempo
CREATE TABLE Dim_Tiempo (
    id INT PRIMARY KEY IDENTITY(1,1),
    Dia INT NOT NULL,
    Mes INT NOT NULL,
    Trimestre INT NOT NULL,
    Año INT NOT NULL,
	nombre_mes VARCHAR NOT NULL
);
GO

-- Dimensión Paciente
CREATE TABLE Dim_Paciente (
    id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(255) NOT NULL,
    Genero VARCHAR(10) NOT NULL,
    Edad INT NOT NULL,
	tipo_enfermedad VARCHAR(255)
);
GO

-- Dimensión Médico
CREATE TABLE Dim_Medico (
    id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(255) NOT NULL,
    Especialidad VARCHAR(255) NOT NULL,
    NumeroLicencia VARCHAR(50) NOT NULL
);
GO

-- Dimensión Cita
CREATE TABLE Dim_Cita (
    id INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL,
    Hora TIME(7) NOT NULL,
    MotivoCita VARCHAR(255) NOT NULL,
    DuracionCita TIME(7) NOT NULL,
	Nombre_paciente VARCHAR(255) NOT NULL,
	Nombre_medico VARCHAR(255) NOT NULL
);
GO

-- Dimensión Tratamiento
CREATE TABLE Dim_Tratamiento (
    id INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(MAX) NOT NULL,
    Duracion_tratamiento INT NOT NULL,
    Costo DECIMAL(18, 2) NOT NULL,
	Nombre_paciente VARCHAR(255) NOT NULL,
	Nombre_medico VARCHAR(255) NOT NULL
);
GO

-- Creación de la tabla de Hechos de Citas
CREATE TABLE Hechos_Citas (
    id INT PRIMARY KEY IDENTITY(1,1),
    dim_tiempo_ID INT NOT NULL,
    dim_paciente_ID INT NOT NULL,
    dim_medico_ID INT NOT NULL,
	dim_tratamiento_ID INT NOT NULL,
	dim_cita_ID INT NOT NULL,
    TipoCita VARCHAR(255) NOT NULL,
    NumeroCitas INT NOT NULL,
    CostosTratamiento DECIMAL(18, 2) NOT NULL,
	CostoTotal DECIMAL(18, 2) NOT NULL,
    CONSTRAINT FK_hechos_dim_tiempo FOREIGN KEY (dim_tiempo_ID) REFERENCES Dim_Tiempo(id),
    CONSTRAINT FK_hechos_paciente FOREIGN KEY (dim_paciente_ID) REFERENCES Dim_Paciente(id),
    CONSTRAINT FK_hechos_dim_medico FOREIGN KEY (dim_medico_ID) REFERENCES Dim_Medico(id),
	CONSTRAINT FK_hechos_dim_cita FOREIGN KEY (dim_cita_ID) REFERENCES Dim_Cita(id),
	CONSTRAINT FK_hechos_dim_tratamiento FOREIGN KEY (dim_tratamiento_ID) REFERENCES Dim_Tratamiento(id),
);
GO

drop table Hechos_Citas;