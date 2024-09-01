
---insercion de datos
USE GestionHospital;
GO

---insetar datos de tipos de citas
INSERT INTO [dbo].[tipo_citas] ([motivo_cita], [observacion_del_medico])
VALUES 
('Consulta general', 'Revisión general del estado de salud del paciente'),
('Seguimiento', 'Control de progreso en tratamientos anteriores'),
('Urgencia', 'Atención inmediata para problemas críticos o emergencias');

SELECT * FROM tipo_citas;
---DELETE tipo_citas;


---insertar de historial_medico
INSERT INTO [dbo].[historial_medico] ([tipo_enfermedad], [descripcion])
VALUES
('Diabetes', 'Trastorno metabólico caracterizado por niveles elevados de azúcar en la sangre.'),
('Hipertensión', 'Condición en la cual la presión arterial está constantemente elevada.'),
('Asma', 'Enfermedad crónica que afecta las vías respiratorias y causa dificultad para respirar.'),
('Eczema', 'Enfermedad de la piel que causa inflamación, enrojecimiento y picazón.'),
('Artritis', 'Inflamación de las articulaciones que causa dolor y rigidez.'),
('Cáncer de mama', 'Formación de células cancerosas en el tejido mamario.'),
('Enfermedad cardíaca', 'Condición que afecta el corazón y los vasos sanguíneos.'),
('Epilepsia', 'Trastorno neurológico caracterizado por convulsiones recurrentes.'),
('Síndrome de Down', 'Trastorno genético causado por la presencia de una copia adicional del cromosoma 21.'),
('Hipotiroidismo', 'Trastorno en el cual la glándula tiroides no produce suficientes hormonas.'),
('Insuficiencia renal', 'Condición en la cual los riñones no funcionan adecuadamente.'),
('Gastritis', 'Inflamación de la mucosa gástrica.'),
('Fibromialgia', 'Síndrome que causa dolor musculoesquelético generalizado.'),
('Migraña', 'Dolor de cabeza intenso y recurrente, a menudo acompañado de náuseas.');


SELECT * FROM historial_medico;
---DELETE historial_medico;


---INSERTAR DE MEDICOS
INSERT INTO [dbo].[Medicos] ([nombre], [especialidad], [contacto], [numero_licencia_medica])
VALUES
('Dr. Ana Pérez', 'Cardiología', '555-1234', 'LIC12345'),
('Dr. Juan López', 'Neurología', '555-2345', 'LIC12346'),
('Dr. Laura Gómez', 'Pediatría', '555-3456', 'LIC12347'),
('Dr. Ricardo Martínez', 'Ginecología', '555-4567', 'LIC12348'),
('Dr. María Sánchez', 'Dermatología', '555-5678', 'LIC12349'),
('Dr. Pedro Fernández', 'Oftalmología', '555-6789', 'LIC12350'),
('Dr. Isabel Ruiz', 'Psiquiatría', '555-7890', 'LIC12351'),
('Dr. Carlos Morales', 'Ortopedia', '555-8901', 'LIC12352'),
('Dr. Sofía López', 'Endocrinología', '555-9012', 'LIC12353'),
('Dr. Alejandro Torres', 'Oncología', '555-0123', 'LIC12354'),
('Dr. Claudia Romero', 'Reumatología', '555-1235', 'LIC12355'),
('Dr. Javier Jiménez', 'Gastroenterología', '555-2346', 'LIC12356'),
('Dr. Elena Vargas', 'Nefrología', '555-3457', 'LIC12357'),
('Dr. Fernando Castillo', 'Otorrinolaringología', '555-4568', 'LIC12358'),
('Dr. Paula Herrera', 'Hematología', '555-5679', 'LIC12359');

SELECT * FROM Medicos;
---DELETE Medicos;


---INSERTAR PACIENTES
INSERT INTO [dbo].[Pacientes] ([numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID])
VALUES
('1000000001', 'Laura', ' Hernández García', 34, 'F', 'Calle del Sol 101', '+100000001', '1990-05-14', 1),
('1000000002', 'Carlos', 'Ramírez López', 45, 'M', 'Av. de los Olivos 202', '+100000002', '1978-11-25', 2),
('1000000003', 'Isabel', 'Gómez Martínez', 28, 'F', 'Calle del Viento 303', '+100000003', '1995-03-22', 3),
('1000000004', 'Miguel', 'Morales Torres', 52, 'M', 'Plaza de la Luna 404', '+100000004', '1972-09-16', 4),
('1000000005', 'Ana', 'Fernández Rodríguez', 37, 'F', 'Calle de la Paz 505', '+100000005', '1987-07-30', 5),
('1000000006', 'José', 'Vásquez Gómez', 46, 'M', 'Av. Libertad 606', '+100000006', '1978-12-04', 6),
('1000000007', 'Sofía', 'Jiménez Díaz', 29, 'F', 'Calle de los Jardines 707', '+100000007', '1994-08-12', 7),
('1000000008', 'Alejandro', 'Castro Martínez', 41, 'M', 'Calle del Río 808', '+100000008', '1983-04-09', 8),
('1000000009', 'Valeria', 'Pérez Morales', 33, 'F', 'Av. de la Aurora 909', '+100000009', '1991-06-27', 9),
('1000000010', 'Andrés', 'Suárez Fernández', 50, 'M', 'Calle de la Esperanza 1010', '+100000010', '1974-10-16', 10),
('1000000011', 'Carmen', 'Álvarez Ruiz', 48, 'F', 'Calle del Arco 1111', '+100000011', '1976-02-21', 11),
('1000000012', 'Javier', 'González García', 40, 'M', 'Av. del Horizonte 1212', '+100000012', '1984-05-13', 12),
('1000000013', 'María', 'Vargas Morales', 26, 'F', 'Calle del Océano 1313', '+100000013', '1997-11-04', 13),
('1000000014', 'Luis', 'Cano Sánchez', 38, 'M', 'Calle del Valle 1414', '+100000014', '1986-03-19', 14),
('1000000015', 'Patricia', 'Paniagua Ramírez', 31, 'F', 'Plaza de la Paz 1515', '+100000015', '1992-07-06', 13),
('1000000016', 'Rafael', 'Bermúdez Castro', 54, 'M', 'Calle del Sol 1616', '+100000016', '1969-10-22', 6),
('1000000017', 'Mónica', 'Mendoza Díaz', 27, 'F', 'Calle de los Cedros 1717', '+100000017', '1996-12-11', 7),
('1000000018', 'Samuel', 'Hernández Torres', 43, 'M', 'Av. de los Andes 1818', '+100000018', '1980-01-03', 8),
('1000000019', 'Elena', 'García Pérez', 39, 'F', 'Calle de la Esperanza 1919', '+100000019', '1984-04-14', 9),
('1000000020', 'Eduardo', 'Morales López', 32, 'M', 'Calle del Desierto 2020', '+100000020', '1991-08-23', 1),
('1000000021', 'Lorena', 'Núñez Rodríguez', 49, 'F', 'Av. del Mar 2121', '+100000021', '1975-12-29', 2),
('1000000022', 'Héctor', 'Almeida González', 56, 'M', 'Calle de los Olivos 2222', '+100000022', '1968-06-15', 2),
('1000000023', 'Claudia', 'Múñoz Martínez', 30, 'F', 'Calle del Olmo 2323', '+100000023', '1994-01-08', 3),
('1000000024', 'Fernando', 'Bravo Jiménez', 41, 'M', 'Calle del Río 2424', '+100000024', '1983-11-09', 4),
('1000000025', 'Verónica', 'Gómez Sánchez', 28, 'F', 'Calle de los Andes 2525', '+100000025', '1995-07-19', 5),
('1000000026', 'Raúl', 'Ríos Fernández', 37, 'M', 'Calle del Viento 2626', '+100000026', '1987-09-11', 6),
('1000000027', 'Nina', 'Castro Álvarez', 33, 'F', 'Av. de la Luna 2727', '+100000027', '1990-12-17', 7),
('1000000028', 'Hugo', 'Ramírez Pérez', 40, 'M', 'Calle de la Esperanza 2828', '+100000028', '1984-05-30', 8),
('1000000029', 'Carmen', 'Torres Gómez', 46, 'F', 'Calle de los Robles 2929', '+100000029', '1978-10-05', 9),
('1000000030', 'Martín', 'González Ramírez', 29, 'M', 'Calle del Mar 3030', '+100000030', '1995-04-21', 3),
('1000000031', 'Jessica', 'Vásquez Martínez', 25, 'F', 'Calle de la Aurora 3131', '+100000031', '1998-09-12', 1),
('1000000032', 'Jorge', 'García Pérez', 34, 'M', 'Av. del Sol 3232', '+100000032', '1990-06-20', 3),
('1000000033', 'Marina', 'Hernández Sánchez', 39, 'F', 'Calle del Río 3333', '+100000033', '1985-02-13', 3),
('1000000034', 'Alberto', 'Díaz Ramírez', 50, 'M', 'Calle del Bosque 3434', '+100000034', '1974-11-29', 14),
('1000000035', 'Lina', 'González Gómez', 31, 'F', 'Calle de los Cedros 3535', '+100000035', '1992-10-16', 3),
('1000000036', 'David', 'Mendoza Fernández', 38, 'M', 'Calle del Sol 3636', '+100000036', '1986-04-02', 11),
('1000000037', 'Liliana', 'Rivas Martínez', 45, 'F', 'Av. del Horizonte 3737', '+100000037', '1978-08-14', 7),
('1000000038', 'Ricardo', 'Castro Jiménez', 29, 'M', 'Calle de la Luna 3838', '+100000038', '1995-12-09', 10),
('1000000039', 'Gabriela', 'Suárez Pérez', 27, 'F', 'Calle del Viento 3939', '+100000039', '1996-07-15', 9),
('1000000040', 'Esteban', 'Alonso Ruiz', 32, 'M', 'Plaza de la Paz 4040', '+100000040', '1992-05-10', 14);

SELECT * FROM Pacientes;
---DELETE Pacientes;


--- INSETAR CITAS
INSERT INTO [dbo].[Citas] ([fecha], [hora], [Paciente_ID], [Medico_ID], [tipocita_ID], [duracion_cita])
VALUES
('2024-09-01', '09:00:00', 1, 1, 1, '00:30:00'),
('2024-09-01', '10:00:00', 2, 2, 2, '00:45:00'),
('2024-09-02', '11:00:00', 3, 3, 1, '00:30:00'),
('2024-09-02', '12:00:00', 4, 4, 3, '01:00:00'),
('2024-09-03', '13:00:00', 5, 5, 2, '00:45:00'),
('2024-09-03', '14:00:00', 6, 6, 1, '00:30:00'),
('2024-09-04', '15:00:00', 7, 7, 3, '01:00:00'),
('2024-09-04', '16:00:00', 8, 8, 2, '00:45:00'),
('2024-09-05', '09:00:00', 9, 9, 1, '00:30:00'),
('2024-09-05', '10:00:00', 10, 10, 3, '01:00:00'),
('2024-09-06', '11:00:00', 11, 11, 2, '00:45:00'),
('2024-09-06', '12:00:00', 12, 12, 1, '00:30:00'),
('2024-09-07', '13:00:00', 13, 13, 3, '01:00:00'),
('2024-09-07', '14:00:00', 14, 14, 2, '00:45:00'),
('2024-09-08', '15:00:00', 15, 15, 1, '00:30:00'),
('2024-09-08', '16:00:00', 16, 1, 3, '01:00:00'),
('2024-09-09', '09:00:00', 17, 2, 2, '00:45:00'),
('2024-09-09', '10:00:00', 18, 3, 1, '00:30:00'),
('2024-09-10', '11:00:00', 19, 4, 3, '01:00:00'),
('2024-09-10', '12:00:00', 20, 5, 2, '00:45:00'),
('2024-09-11', '13:00:00', 21, 6, 1, '00:30:00'),
('2024-09-11', '14:00:00', 22, 7, 3, '01:00:00'),
('2024-09-12', '09:00:00', 23, 8, 2, '00:45:00'),
('2024-09-12', '10:00:00', 24, 9, 1, '00:30:00'),
('2024-09-13', '11:00:00', 25, 10, 3, '01:00:00'),
('2024-09-13', '12:00:00', 26, 11, 2, '00:45:00'),
('2024-09-14', '13:00:00', 27, 12, 1, '00:30:00'),
('2024-09-14', '14:00:00', 28, 13, 3, '01:00:00'),
('2024-09-15', '09:00:00', 29, 14, 2, '00:45:00'),
('2024-09-15', '10:00:00', 30, 15, 1, '00:30:00'),
('2024-09-16', '11:00:00', 31, 1, 3, '01:00:00'),
('2024-09-16', '12:00:00', 32, 2, 2, '00:45:00'),
('2024-09-17', '13:00:00', 33, 3, 1, '00:30:00'),
('2024-09-17', '14:00:00', 34, 4, 3, '01:00:00'),
('2024-09-18', '09:00:00', 35, 5, 2, '00:45:00'),
('2024-09-18', '10:00:00', 36, 6, 1, '00:30:00'),
('2024-09-19', '11:00:00', 37, 7, 3, '01:00:00'),
('2024-09-19', '12:00:00', 38, 8, 2, '00:45:00'),
('2024-09-20', '13:00:00', 39, 9, 1, '00:30:00'),
('2024-09-20', '14:00:00', 40, 10, 3, '01:00:00');

SELECT * FROM Citas;
---DELETE Citas;


---INSERTAR TRATAMIENTO
INSERT INTO [dbo].[Tratamientos] ([Paciente_ID], [Medico_ID], [descripcion], [duracion],[Costo])
VALUES
(1, 1, 'Control de diabetes tipo 2 con medicación y dieta', 15,1653.00),
(2, 2, 'Revisión neurológica con evaluación de síntomas', 12, 1520.00),
(3, 3, 'Consulta pediátrica para evaluación de crecimiento', 18, 786.00),
(4, 4, 'Examen ginecológico de rutina', 14, 1723.00),
(5, 5, 'Tratamiento para eczema con cremas tópicas', 17, 2071.00),
(6, 6, 'Evaluación y tratamiento para problemas de visión', 20, 597.00),
(7, 7, 'Evaluación psiquiátrica para ansiedad', 13, 1832.00),
(8, 8, 'Tratamiento ortopédico para dolor de espalda', 16, 2181.00),
(9, 9, 'Tratamiento endocrinológico para tiroides', 11, 1130.00),
(10, 10, 'Evaluación oncológica para masa mamaria', 19, 578.00),
(11, 11, 'Tratamiento reumatológico para artritis', 14,1830.00),
(12, 12, 'Control gastroenterológico para gastritis', 18, 2492.00),
(13, 13, 'Revisión nefrológica para insuficiencia renal', 20, 1897.00),
(14, 14, 'Tratamiento dermatológico para dermatitis', 11, 1333.00),
(15, 15, 'Consulta hematológica para anemia', 16, 1776.00),
(16, 1, 'Control de diabetes tipo 2', 12, 1053.00),
(17, 2, 'Revisión de hipertensión', 15, 1766.00),
(18, 3, 'Tratamiento de asma', 17, 1395.00),
(19, 4, 'Control de eczema', 13, 1639.00),
(20, 5, 'Tratamiento de artritis', 19, 1623.00),
(21, 6, 'Evaluación cardíaca', 14,1787.00),
(22, 7, 'Tratamiento de epilepsia', 16, 1349.00),
(23, 8, 'Revisión de síndrome de Down', 20, 1587.00),
(24, 9, 'Control de hipotiroidismo', 12, 1388.00),
(25, 10, 'Tratamiento de insuficiencia renal', 18, 2466.00),
(26, 11, 'Revisión de niveles de glucosa', 15, 1642.00),
(27, 12, 'Evaluación de síntomas neurológicos', 13, 1957.00),
(28, 13, 'Examen pediátrico completo', 20, 1669.00),
(29, 14, 'Control ginecológico anual', 14, 1153.00),
(30, 15, 'Tratamiento para eczema severo', 17, 1420.00),
(31, 1, 'Control oftalmológico', 19,1951.00),
(32, 2, 'Terapia psicológica para ansiedad', 11, 1017.00),
(33, 3, 'Tratamiento para lesión ortopédica', 15, 739.00),
(34, 4, 'Revisión endocrinológica', 18, 1069.00),
(35, 5, 'Consulta de seguimiento oncológico', 20, 2185.00),
(36, 6, 'Revisión y seguimiento de enfermedades renales', 16, 1969.00),
(37, 7, 'Consulta de salud mental y ajuste de tratamiento', 13, 1096.00),
(38, 8, 'Tratamiento para lesiones ortopédicas', 20, 1414.00),
(39, 9, 'Chequeo de problemas respiratorios y tratamiento', 12, 2114.00),
(40, 10, 'Evaluación oncológica y tratamiento', 17, 755.00);

SELECT * FROM Tratamientos;
---DELETE Tratamientos;
