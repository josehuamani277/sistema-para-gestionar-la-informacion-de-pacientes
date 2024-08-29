USE [master]
GO
/****** Object:  Database [GestionHospital]    Script Date: 28/08/2024 02:27:31 ******/
CREATE DATABASE [GestionHospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GestionHospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GestionHospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GestionHospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GestionHospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GestionHospital] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GestionHospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GestionHospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GestionHospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GestionHospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GestionHospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GestionHospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [GestionHospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GestionHospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GestionHospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GestionHospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GestionHospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GestionHospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GestionHospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GestionHospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GestionHospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GestionHospital] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GestionHospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GestionHospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GestionHospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GestionHospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GestionHospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GestionHospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GestionHospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GestionHospital] SET RECOVERY FULL 
GO
ALTER DATABASE [GestionHospital] SET  MULTI_USER 
GO
ALTER DATABASE [GestionHospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GestionHospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GestionHospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GestionHospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GestionHospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GestionHospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GestionHospital', N'ON'
GO
ALTER DATABASE [GestionHospital] SET QUERY_STORE = ON
GO
ALTER DATABASE [GestionHospital] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GestionHospital]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 28/08/2024 02:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[Paciente_ID] [int] NOT NULL,
	[Medico_ID] [int] NOT NULL,
	[tipocita_ID] [int] NULL,
	[duracion_cita] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historial_medico]    Script Date: 28/08/2024 02:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historial_medico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_enfermedad] [varchar](255) NULL,
	[descripcion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 28/08/2024 02:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[especialidad] [varchar](255) NOT NULL,
	[contacto] [varchar](255) NULL,
	[numero_licencia_medica] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 28/08/2024 02:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](20) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[edad] [int] NOT NULL,
	[genero] [varchar](10) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[historial_medico_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_citas]    Script Date: 28/08/2024 02:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_citas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[motivo_cita] [varchar](100) NOT NULL,
	[observacion_del_medico] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tratamientos]    Script Date: 28/08/2024 02:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tratamientos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Paciente_ID] [int] NOT NULL,
	[Medico_ID] [int] NOT NULL,
	[descripcion] [varchar](max) NOT NULL,
	[duracion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Citas] ON 

INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (1, CAST(N'2024-09-01' AS Date), CAST(N'09:00:00' AS Time), 1, 1, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (2, CAST(N'2024-09-01' AS Date), CAST(N'10:00:00' AS Time), 2, 2, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (3, CAST(N'2024-09-02' AS Date), CAST(N'11:00:00' AS Time), 3, 3, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (4, CAST(N'2024-09-02' AS Date), CAST(N'12:00:00' AS Time), 4, 4, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (5, CAST(N'2024-09-03' AS Date), CAST(N'13:00:00' AS Time), 5, 5, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (6, CAST(N'2024-09-03' AS Date), CAST(N'14:00:00' AS Time), 6, 6, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (7, CAST(N'2024-09-04' AS Date), CAST(N'15:00:00' AS Time), 7, 7, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (8, CAST(N'2024-09-04' AS Date), CAST(N'16:00:00' AS Time), 8, 8, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (9, CAST(N'2024-09-05' AS Date), CAST(N'09:00:00' AS Time), 9, 9, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (10, CAST(N'2024-09-05' AS Date), CAST(N'10:00:00' AS Time), 10, 10, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (11, CAST(N'2024-09-06' AS Date), CAST(N'11:00:00' AS Time), 11, 11, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (12, CAST(N'2024-09-06' AS Date), CAST(N'12:00:00' AS Time), 12, 12, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (13, CAST(N'2024-09-07' AS Date), CAST(N'13:00:00' AS Time), 13, 13, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (14, CAST(N'2024-09-07' AS Date), CAST(N'14:00:00' AS Time), 14, 14, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (15, CAST(N'2024-09-08' AS Date), CAST(N'15:00:00' AS Time), 15, 15, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (16, CAST(N'2024-09-08' AS Date), CAST(N'16:00:00' AS Time), 16, 1, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (17, CAST(N'2024-09-09' AS Date), CAST(N'09:00:00' AS Time), 17, 2, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (18, CAST(N'2024-09-09' AS Date), CAST(N'10:00:00' AS Time), 18, 3, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (19, CAST(N'2024-09-10' AS Date), CAST(N'11:00:00' AS Time), 19, 4, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (20, CAST(N'2024-09-10' AS Date), CAST(N'12:00:00' AS Time), 20, 5, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (21, CAST(N'2024-09-11' AS Date), CAST(N'13:00:00' AS Time), 21, 6, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (22, CAST(N'2024-09-11' AS Date), CAST(N'14:00:00' AS Time), 22, 7, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (23, CAST(N'2024-09-12' AS Date), CAST(N'09:00:00' AS Time), 23, 8, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (24, CAST(N'2024-09-12' AS Date), CAST(N'10:00:00' AS Time), 24, 9, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (25, CAST(N'2024-09-13' AS Date), CAST(N'11:00:00' AS Time), 25, 10, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (26, CAST(N'2024-09-13' AS Date), CAST(N'12:00:00' AS Time), 26, 11, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (27, CAST(N'2024-09-14' AS Date), CAST(N'13:00:00' AS Time), 27, 12, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (28, CAST(N'2024-09-14' AS Date), CAST(N'14:00:00' AS Time), 28, 13, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (29, CAST(N'2024-09-15' AS Date), CAST(N'09:00:00' AS Time), 29, 14, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (30, CAST(N'2024-09-15' AS Date), CAST(N'10:00:00' AS Time), 30, 15, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (31, CAST(N'2024-09-16' AS Date), CAST(N'11:00:00' AS Time), 31, 1, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (32, CAST(N'2024-09-16' AS Date), CAST(N'12:00:00' AS Time), 32, 2, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (33, CAST(N'2024-09-17' AS Date), CAST(N'13:00:00' AS Time), 33, 3, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (34, CAST(N'2024-09-17' AS Date), CAST(N'14:00:00' AS Time), 34, 4, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (35, CAST(N'2024-09-18' AS Date), CAST(N'09:00:00' AS Time), 35, 5, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (36, CAST(N'2024-09-18' AS Date), CAST(N'10:00:00' AS Time), 36, 6, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (37, CAST(N'2024-09-19' AS Date), CAST(N'11:00:00' AS Time), 37, 7, 3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (38, CAST(N'2024-09-19' AS Date), CAST(N'12:00:00' AS Time), 38, 8, 2, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (39, CAST(N'2024-09-20' AS Date), CAST(N'13:00:00' AS Time), 39, 9, 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Citas] ([id], [fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita]) VALUES (40, CAST(N'2024-09-20' AS Date), CAST(N'14:00:00' AS Time), 40, 10, 3, CAST(N'01:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Citas] OFF
GO
SET IDENTITY_INSERT [dbo].[historial_medico] ON 

INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (1, N'Diabetes', N'Trastorno metabólico caracterizado por niveles elevados de azúcar en la sangre.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (2, N'Hipertensión', N'Condición en la cual la presión arterial está constantemente elevada.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (3, N'Asma', N'Enfermedad crónica que afecta las vías respiratorias y causa dificultad para respirar.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (4, N'Eczema', N'Enfermedad de la piel que causa inflamación, enrojecimiento y picazón.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (5, N'Artritis', N'Inflamación de las articulaciones que causa dolor y rigidez.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (6, N'Cáncer de mama', N'Formación de células cancerosas en el tejido mamario.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (7, N'Enfermedad cardíaca', N'Condición que afecta el corazón y los vasos sanguíneos.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (8, N'Epilepsia', N'Trastorno neurológico caracterizado por convulsiones recurrentes.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (9, N'Síndrome de Down', N'Trastorno genético causado por la presencia de una copia adicional del cromosoma 21.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (10, N'Hipotiroidismo', N'Trastorno en el cual la glándula tiroides no produce suficientes hormonas.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (11, N'Insuficiencia renal', N'Condición en la cual los riñones no funcionan adecuadamente.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (12, N'Gastritis', N'Inflamación de la mucosa gástrica.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (13, N'Fibromialgia', N'Síndrome que causa dolor musculoesquelético generalizado.')
INSERT [dbo].[historial_medico] ([id], [tipo_enfermedad], [descripcion]) VALUES (14, N'Migraña', N'Dolor de cabeza intenso y recurrente, a menudo acompañado de náuseas.')
SET IDENTITY_INSERT [dbo].[historial_medico] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicos] ON 

INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (1, N'Dr. Ana Pérez', N'Cardiología', N'555-1234', N'LIC12345')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (2, N'Dr. Juan López', N'Neurología', N'555-2345', N'LIC12346')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (3, N'Dr. Laura Gómez', N'Pediatría', N'555-3456', N'LIC12347')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (4, N'Dr. Ricardo Martínez', N'Ginecología', N'555-4567', N'LIC12348')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (5, N'Dr. María Sánchez', N'Dermatología', N'555-5678', N'LIC12349')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (6, N'Dr. Pedro Fernández', N'Oftalmología', N'555-6789', N'LIC12350')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (7, N'Dr. Isabel Ruiz', N'Psiquiatría', N'555-7890', N'LIC12351')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (8, N'Dr. Carlos Morales', N'Ortopedia', N'555-8901', N'LIC12352')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (9, N'Dr. Sofía López', N'Endocrinología', N'555-9012', N'LIC12353')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (10, N'Dr. Alejandro Torres', N'Oncología', N'555-0123', N'LIC12354')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (11, N'Dr. Claudia Romero', N'Reumatología', N'555-1235', N'LIC12355')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (12, N'Dr. Javier Jiménez', N'Gastroenterología', N'555-2346', N'LIC12356')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (13, N'Dr. Elena Vargas', N'Nefrología', N'555-3457', N'LIC12357')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (14, N'Dr. Fernando Castillo', N'Otorrinolaringología', N'555-4568', N'LIC12358')
INSERT [dbo].[Medicos] ([id], [nombre], [especialidad], [contacto], [numero_licencia_medica]) VALUES (15, N'Dr. Paula Herrera', N'Hematología', N'555-5679', N'LIC12359')
SET IDENTITY_INSERT [dbo].[Medicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (1, N'1000000001', N'Laura', N' Hernández García', 34, N'F', N'Calle del Sol 101', N'+100000001', CAST(N'1990-05-14' AS Date), 1)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (2, N'1000000002', N'Carlos', N'Ramírez López', 45, N'M', N'Av. de los Olivos 202', N'+100000002', CAST(N'1978-11-25' AS Date), 2)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (3, N'1000000003', N'Isabel', N'Gómez Martínez', 28, N'F', N'Calle del Viento 303', N'+100000003', CAST(N'1995-03-22' AS Date), 3)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (4, N'1000000004', N'Miguel', N'Morales Torres', 52, N'M', N'Plaza de la Luna 404', N'+100000004', CAST(N'1972-09-16' AS Date), 4)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (5, N'1000000005', N'Ana', N'Fernández Rodríguez', 37, N'F', N'Calle de la Paz 505', N'+100000005', CAST(N'1987-07-30' AS Date), 5)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (6, N'1000000006', N'José', N'Vásquez Gómez', 46, N'M', N'Av. Libertad 606', N'+100000006', CAST(N'1978-12-04' AS Date), 6)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (7, N'1000000007', N'Sofía', N'Jiménez Díaz', 29, N'F', N'Calle de los Jardines 707', N'+100000007', CAST(N'1994-08-12' AS Date), 7)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (8, N'1000000008', N'Alejandro', N'Castro Martínez', 41, N'M', N'Calle del Río 808', N'+100000008', CAST(N'1983-04-09' AS Date), 8)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (9, N'1000000009', N'Valeria', N'Pérez Morales', 33, N'F', N'Av. de la Aurora 909', N'+100000009', CAST(N'1991-06-27' AS Date), 9)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (10, N'1000000010', N'Andrés', N'Suárez Fernández', 50, N'M', N'Calle de la Esperanza 1010', N'+100000010', CAST(N'1974-10-16' AS Date), 10)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (11, N'1000000011', N'Carmen', N'Álvarez Ruiz', 48, N'F', N'Calle del Arco 1111', N'+100000011', CAST(N'1976-02-21' AS Date), 11)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (12, N'1000000012', N'Javier', N'González García', 40, N'M', N'Av. del Horizonte 1212', N'+100000012', CAST(N'1984-05-13' AS Date), 12)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (13, N'1000000013', N'María', N'Vargas Morales', 26, N'F', N'Calle del Océano 1313', N'+100000013', CAST(N'1997-11-04' AS Date), 13)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (14, N'1000000014', N'Luis', N'Cano Sánchez', 38, N'M', N'Calle del Valle 1414', N'+100000014', CAST(N'1986-03-19' AS Date), 14)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (15, N'1000000015', N'Patricia', N'Paniagua Ramírez', 31, N'F', N'Plaza de la Paz 1515', N'+100000015', CAST(N'1992-07-06' AS Date), 13)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (16, N'1000000016', N'Rafael', N'Bermúdez Castro', 54, N'M', N'Calle del Sol 1616', N'+100000016', CAST(N'1969-10-22' AS Date), 6)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (17, N'1000000017', N'Mónica', N'Mendoza Díaz', 27, N'F', N'Calle de los Cedros 1717', N'+100000017', CAST(N'1996-12-11' AS Date), 7)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (18, N'1000000018', N'Samuel', N'Hernández Torres', 43, N'M', N'Av. de los Andes 1818', N'+100000018', CAST(N'1980-01-03' AS Date), 8)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (19, N'1000000019', N'Elena', N'García Pérez', 39, N'F', N'Calle de la Esperanza 1919', N'+100000019', CAST(N'1984-04-14' AS Date), 9)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (20, N'1000000020', N'Eduardo', N'Morales López', 32, N'M', N'Calle del Desierto 2020', N'+100000020', CAST(N'1991-08-23' AS Date), 1)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (21, N'1000000021', N'Lorena', N'Núñez Rodríguez', 49, N'F', N'Av. del Mar 2121', N'+100000021', CAST(N'1975-12-29' AS Date), 2)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (22, N'1000000022', N'Héctor', N'Almeida González', 56, N'M', N'Calle de los Olivos 2222', N'+100000022', CAST(N'1968-06-15' AS Date), 2)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (23, N'1000000023', N'Claudia', N'Múñoz Martínez', 30, N'F', N'Calle del Olmo 2323', N'+100000023', CAST(N'1994-01-08' AS Date), 3)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (24, N'1000000024', N'Fernando', N'Bravo Jiménez', 41, N'M', N'Calle del Río 2424', N'+100000024', CAST(N'1983-11-09' AS Date), 4)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (25, N'1000000025', N'Verónica', N'Gómez Sánchez', 28, N'F', N'Calle de los Andes 2525', N'+100000025', CAST(N'1995-07-19' AS Date), 5)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (26, N'1000000026', N'Raúl', N'Ríos Fernández', 37, N'M', N'Calle del Viento 2626', N'+100000026', CAST(N'1987-09-11' AS Date), 6)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (27, N'1000000027', N'Nina', N'Castro Álvarez', 33, N'F', N'Av. de la Luna 2727', N'+100000027', CAST(N'1990-12-17' AS Date), 7)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (28, N'1000000028', N'Hugo', N'Ramírez Pérez', 40, N'M', N'Calle de la Esperanza 2828', N'+100000028', CAST(N'1984-05-30' AS Date), 8)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (29, N'1000000029', N'Carmen', N'Torres Gómez', 46, N'F', N'Calle de los Robles 2929', N'+100000029', CAST(N'1978-10-05' AS Date), 9)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (30, N'1000000030', N'Martín', N'González Ramírez', 29, N'M', N'Calle del Mar 3030', N'+100000030', CAST(N'1995-04-21' AS Date), 3)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (31, N'1000000031', N'Jessica', N'Vásquez Martínez', 25, N'F', N'Calle de la Aurora 3131', N'+100000031', CAST(N'1998-09-12' AS Date), 1)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (32, N'1000000032', N'Jorge', N'García Pérez', 34, N'M', N'Av. del Sol 3232', N'+100000032', CAST(N'1990-06-20' AS Date), 3)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (33, N'1000000033', N'Marina', N'Hernández Sánchez', 39, N'F', N'Calle del Río 3333', N'+100000033', CAST(N'1985-02-13' AS Date), 3)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (34, N'1000000034', N'Alberto', N'Díaz Ramírez', 50, N'M', N'Calle del Bosque 3434', N'+100000034', CAST(N'1974-11-29' AS Date), 14)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (35, N'1000000035', N'Lina', N'González Gómez', 31, N'F', N'Calle de los Cedros 3535', N'+100000035', CAST(N'1992-10-16' AS Date), 3)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (36, N'1000000036', N'David', N'Mendoza Fernández', 38, N'M', N'Calle del Sol 3636', N'+100000036', CAST(N'1986-04-02' AS Date), 11)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (37, N'1000000037', N'Liliana', N'Rivas Martínez', 45, N'F', N'Av. del Horizonte 3737', N'+100000037', CAST(N'1978-08-14' AS Date), 7)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (38, N'1000000038', N'Ricardo', N'Castro Jiménez', 29, N'M', N'Calle de la Luna 3838', N'+100000038', CAST(N'1995-12-09' AS Date), 10)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (39, N'1000000039', N'Gabriela', N'Suárez Pérez', 27, N'F', N'Calle del Viento 3939', N'+100000039', CAST(N'1996-07-15' AS Date), 9)
INSERT [dbo].[Pacientes] ([id], [numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID]) VALUES (40, N'1000000040', N'Esteban', N'Alonso Ruiz', 32, N'M', N'Plaza de la Paz 4040', N'+100000040', CAST(N'1992-05-10' AS Date), 14)
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_citas] ON 

INSERT [dbo].[tipo_citas] ([id], [motivo_cita], [observacion_del_medico]) VALUES (1, N'Consulta general', N'Revisión general del estado de salud del paciente')
INSERT [dbo].[tipo_citas] ([id], [motivo_cita], [observacion_del_medico]) VALUES (2, N'Seguimiento', N'Control de progreso en tratamientos anteriores')
INSERT [dbo].[tipo_citas] ([id], [motivo_cita], [observacion_del_medico]) VALUES (3, N'Urgencia', N'Atención inmediata para problemas críticos o emergencias')
SET IDENTITY_INSERT [dbo].[tipo_citas] OFF
GO
SET IDENTITY_INSERT [dbo].[Tratamientos] ON 

INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (1, 1, 1, N'Control de diabetes tipo 2 con medicación y dieta', 15)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (2, 2, 2, N'Revisión neurológica con evaluación de síntomas', 12)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (3, 3, 3, N'Consulta pediátrica para evaluación de crecimiento', 18)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (4, 4, 4, N'Examen ginecológico de rutina', 14)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (5, 5, 5, N'Tratamiento para eczema con cremas tópicas', 17)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (6, 6, 6, N'Evaluación y tratamiento para problemas de visión', 20)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (7, 7, 7, N'Evaluación psiquiátrica para ansiedad', 13)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (8, 8, 8, N'Tratamiento ortopédico para dolor de espalda', 16)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (9, 9, 9, N'Tratamiento endocrinológico para tiroides', 11)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (10, 10, 10, N'Evaluación oncológica para masa mamaria', 19)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (11, 11, 11, N'Tratamiento reumatológico para artritis', 14)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (12, 12, 12, N'Control gastroenterológico para gastritis', 18)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (13, 13, 13, N'Revisión nefrológica para insuficiencia renal', 20)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (14, 14, 14, N'Tratamiento dermatológico para dermatitis', 11)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (15, 15, 15, N'Consulta hematológica para anemia', 16)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (16, 16, 1, N'Control de diabetes tipo 2', 12)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (17, 17, 2, N'Revisión de hipertensión', 15)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (18, 18, 3, N'Tratamiento de asma', 17)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (19, 19, 4, N'Control de eczema', 13)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (20, 20, 5, N'Tratamiento de artritis', 19)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (21, 21, 6, N'Evaluación cardíaca', 14)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (22, 22, 7, N'Tratamiento de epilepsia', 16)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (23, 23, 8, N'Revisión de síndrome de Down', 20)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (24, 24, 9, N'Control de hipotiroidismo', 12)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (25, 25, 10, N'Tratamiento de insuficiencia renal', 18)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (26, 26, 11, N'Revisión de niveles de glucosa', 15)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (27, 27, 12, N'Evaluación de síntomas neurológicos', 13)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (28, 28, 13, N'Examen pediátrico completo', 20)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (29, 29, 14, N'Control ginecológico anual', 14)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (30, 30, 15, N'Tratamiento para eczema severo', 17)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (31, 31, 1, N'Control oftalmológico', 19)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (32, 32, 2, N'Terapia psicológica para ansiedad', 11)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (33, 33, 3, N'Tratamiento para lesión ortopédica', 15)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (34, 34, 4, N'Revisión endocrinológica', 18)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (35, 35, 5, N'Consulta de seguimiento oncológico', 20)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (36, 36, 6, N'Revisión y seguimiento de enfermedades renales', 16)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (37, 37, 7, N'Consulta de salud mental y ajuste de tratamiento', 13)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (38, 38, 8, N'Tratamiento para lesiones ortopédicas', 20)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (39, 39, 9, N'Chequeo de problemas respiratorios y tratamiento', 12)
INSERT [dbo].[Tratamientos] ([id], [Paciente_ID], [Medico_ID], [descripcion], [duracion]) VALUES (40, 40, 10, N'Evaluación oncológica y tratamiento', 17)
SET IDENTITY_INSERT [dbo].[Tratamientos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Paciente__7B886A63223B8484]    Script Date: 28/08/2024 02:27:32 ******/
ALTER TABLE [dbo].[Pacientes] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [fk_citas_medicos] FOREIGN KEY([Medico_ID])
REFERENCES [dbo].[Medicos] ([id])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [fk_citas_medicos]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [fk_citas_paciente] FOREIGN KEY([Paciente_ID])
REFERENCES [dbo].[Pacientes] ([id])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [fk_citas_paciente]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [fk_citas_tipocitas] FOREIGN KEY([tipocita_ID])
REFERENCES [dbo].[tipo_citas] ([id])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [fk_citas_tipocitas]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [fk_Pacientes_Historial_medico] FOREIGN KEY([historial_medico_ID])
REFERENCES [dbo].[historial_medico] ([id])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [fk_Pacientes_Historial_medico]
GO
ALTER TABLE [dbo].[Tratamientos]  WITH CHECK ADD  CONSTRAINT [fk_tratamiento_medicos] FOREIGN KEY([Medico_ID])
REFERENCES [dbo].[Medicos] ([id])
GO
ALTER TABLE [dbo].[Tratamientos] CHECK CONSTRAINT [fk_tratamiento_medicos]
GO
ALTER TABLE [dbo].[Tratamientos]  WITH CHECK ADD  CONSTRAINT [fk_tratamiento_pacientes] FOREIGN KEY([Paciente_ID])
REFERENCES [dbo].[Pacientes] ([id])
GO
ALTER TABLE [dbo].[Tratamientos] CHECK CONSTRAINT [fk_tratamiento_pacientes]
GO
USE [master]
GO
ALTER DATABASE [GestionHospital] SET  READ_WRITE 
GO
