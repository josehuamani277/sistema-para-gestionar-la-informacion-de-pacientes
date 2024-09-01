-- Creación de la base de datos
CREATE DATABASE [GestionHospital_BI];
GO

USE [GestionHospital_BI];
GO

-- Creación de las Dimensiones

-- Dimensión Tiempo
CREATE TABLE Dim_Tiempo (
    id INT PRIMARY KEY IDENTITY(1,1),
    Dia INT NOT NULL,
    Mes INT NOT NULL,
    Trimestre INT NOT NULL,
    Año INT NOT NULL
);
GO

-- Dimensión Paciente
CREATE TABLE Dim_Paciente (
    id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(255) NOT NULL,
    Genero VARCHAR(10) NOT NULL,
    Edad INT NOT NULL
);
GO

-- Dimensión Médico
CREATE TABLE Dim_Medico (
    id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(255) NOT NULL,
    Especialidad VARCHAR(255) NOT NULL,
    Contacto VARCHAR(255) NULL,
    NumeroLicencia VARCHAR(50) NOT NULL
);
GO

-- Dimensión Cita
CREATE TABLE Dim_Cita (
    id INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL,
    Hora TIME(7) NOT NULL,
    Paciente_ID INT NOT NULL,
    Medico_ID INT NOT NULL,
    MotivoCita VARCHAR(255) NOT NULL,
    DuracionCita TIME(7) NOT NULL,
    FOREIGN KEY (Paciente_ID) REFERENCES Dim_Paciente(Paciente_ID),
    FOREIGN KEY (Medico_ID) REFERENCES Dim_Medico(Medico_ID)
);
GO

-- Dimensión Tratamiento
CREATE TABLE Dim_Tratamiento (
    id INT PRIMARY KEY IDENTITY(1,1),
    Paciente_ID INT NOT NULL,
    Medico_ID INT NOT NULL,
    Descripcion VARCHAR(MAX) NOT NULL,
    Duracion INT NOT NULL,
    Costo DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (Paciente_ID) REFERENCES Dim_Paciente(Paciente_ID),
    FOREIGN KEY (Medico_ID) REFERENCES Dim_Medico(Medico_ID)
);
GO

-- Creación de la tabla de Hechos de Citas
CREATE TABLE Hechos_Citas (
    id INT PRIMARY KEY IDENTITY(1,1),
    dim_tiempo_ID INT NOT NULL,
    dim_paciente_ID INT NOT NULL,
    dim_medico_ID INT NOT NULL,
	dim_tratamiento_ID INT NOT NULL;
	dim_cita_ID INT NOT NULL;
    TipoCita VARCHAR(255) NOT NULL,
    NumeroCitas INT NOT NULL,
    TasaCitasPerdidas DECIMAL(5, 2) NOT NULL,
    CostosTratamiento DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (Fecha_ID) REFERENCES Dim_Tiempo(id),
    FOREIGN KEY (Paciente_ID) REFERENCES Dim_Paciente(id),
    FOREIGN KEY (Medico_ID) REFERENCES Dim_Medico(id)
);
GO