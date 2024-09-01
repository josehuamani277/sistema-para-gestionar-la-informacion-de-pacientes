
---insercion de datos
USE GestionHospital;
GO

---insetar datos de tipos de citas
INSERT INTO [dbo].[tipo_citas] ([motivo_cita], [observacion_del_medico])
VALUES 
('Consulta general', 'Revisi�n general del estado de salud del paciente'),
('Seguimiento', 'Control de progreso en tratamientos anteriores'),
('Urgencia', 'Atenci�n inmediata para problemas cr�ticos o emergencias');

SELECT * FROM tipo_citas;
---DELETE tipo_citas;


---insertar de historial_medico
INSERT INTO [dbo].[historial_medico] ([tipo_enfermedad], [descripcion])
VALUES
('Diabetes', 'Trastorno metab�lico caracterizado por niveles elevados de az�car en la sangre.'),
('Hipertensi�n', 'Condici�n en la cual la presi�n arterial est� constantemente elevada.'),
('Asma', 'Enfermedad cr�nica que afecta las v�as respiratorias y causa dificultad para respirar.'),
('Eczema', 'Enfermedad de la piel que causa inflamaci�n, enrojecimiento y picaz�n.'),
('Artritis', 'Inflamaci�n de las articulaciones que causa dolor y rigidez.'),
('C�ncer de mama', 'Formaci�n de c�lulas cancerosas en el tejido mamario.'),
('Enfermedad card�aca', 'Condici�n que afecta el coraz�n y los vasos sangu�neos.'),
('Epilepsia', 'Trastorno neurol�gico caracterizado por convulsiones recurrentes.'),
('S�ndrome de Down', 'Trastorno gen�tico causado por la presencia de una copia adicional del cromosoma 21.'),
('Hipotiroidismo', 'Trastorno en el cual la gl�ndula tiroides no produce suficientes hormonas.'),
('Insuficiencia renal', 'Condici�n en la cual los ri�ones no funcionan adecuadamente.'),
('Gastritis', 'Inflamaci�n de la mucosa g�strica.'),
('Fibromialgia', 'S�ndrome que causa dolor musculoesquel�tico generalizado.'),
('Migra�a', 'Dolor de cabeza intenso y recurrente, a menudo acompa�ado de n�useas.');


SELECT * FROM historial_medico;
---DELETE historial_medico;


---INSERTAR DE MEDICOS
INSERT INTO [dbo].[Medicos] ([nombre], [especialidad], [contacto], [numero_licencia_medica])
VALUES
('Dr. Ana P�rez', 'Cardiolog�a', '555-1234', 'LIC12345'),
('Dr. Juan L�pez', 'Neurolog�a', '555-2345', 'LIC12346'),
('Dr. Laura G�mez', 'Pediatr�a', '555-3456', 'LIC12347'),
('Dr. Ricardo Mart�nez', 'Ginecolog�a', '555-4567', 'LIC12348'),
('Dr. Mar�a S�nchez', 'Dermatolog�a', '555-5678', 'LIC12349'),
('Dr. Pedro Fern�ndez', 'Oftalmolog�a', '555-6789', 'LIC12350'),
('Dr. Isabel Ruiz', 'Psiquiatr�a', '555-7890', 'LIC12351'),
('Dr. Carlos Morales', 'Ortopedia', '555-8901', 'LIC12352'),
('Dr. Sof�a L�pez', 'Endocrinolog�a', '555-9012', 'LIC12353'),
('Dr. Alejandro Torres', 'Oncolog�a', '555-0123', 'LIC12354'),
('Dr. Claudia Romero', 'Reumatolog�a', '555-1235', 'LIC12355'),
('Dr. Javier Jim�nez', 'Gastroenterolog�a', '555-2346', 'LIC12356'),
('Dr. Elena Vargas', 'Nefrolog�a', '555-3457', 'LIC12357'),
('Dr. Fernando Castillo', 'Otorrinolaringolog�a', '555-4568', 'LIC12358'),
('Dr. Paula Herrera', 'Hematolog�a', '555-5679', 'LIC12359');

SELECT * FROM Medicos;
---DELETE Medicos;


---INSERTAR PACIENTES
INSERT INTO [dbo].[Pacientes] ([numero_documento], [nombre], [apellido], [edad], [genero], [direccion], [telefono], [fecha_nacimiento], [historial_medico_ID])
VALUES
('1000000001', 'Laura', ' Hern�ndez Garc�a', 34, 'F', 'Calle del Sol 101', '+100000001', '1990-05-14', 1),
('1000000002', 'Carlos', 'Ram�rez L�pez', 45, 'M', 'Av. de los Olivos 202', '+100000002', '1978-11-25', 2),
('1000000003', 'Isabel', 'G�mez Mart�nez', 28, 'F', 'Calle del Viento 303', '+100000003', '1995-03-22', 3),
('1000000004', 'Miguel', 'Morales Torres', 52, 'M', 'Plaza de la Luna 404', '+100000004', '1972-09-16', 4),
('1000000005', 'Ana', 'Fern�ndez Rodr�guez', 37, 'F', 'Calle de la Paz 505', '+100000005', '1987-07-30', 5),
('1000000006', 'Jos�', 'V�squez G�mez', 46, 'M', 'Av. Libertad 606', '+100000006', '1978-12-04', 6),
('1000000007', 'Sof�a', 'Jim�nez D�az', 29, 'F', 'Calle de los Jardines 707', '+100000007', '1994-08-12', 7),
('1000000008', 'Alejandro', 'Castro Mart�nez', 41, 'M', 'Calle del R�o 808', '+100000008', '1983-04-09', 8),
('1000000009', 'Valeria', 'P�rez Morales', 33, 'F', 'Av. de la Aurora 909', '+100000009', '1991-06-27', 9),
('1000000010', 'Andr�s', 'Su�rez Fern�ndez', 50, 'M', 'Calle de la Esperanza 1010', '+100000010', '1974-10-16', 10),
('1000000011', 'Carmen', '�lvarez Ruiz', 48, 'F', 'Calle del Arco 1111', '+100000011', '1976-02-21', 11),
('1000000012', 'Javier', 'Gonz�lez Garc�a', 40, 'M', 'Av. del Horizonte 1212', '+100000012', '1984-05-13', 12),
('1000000013', 'Mar�a', 'Vargas Morales', 26, 'F', 'Calle del Oc�ano 1313', '+100000013', '1997-11-04', 13),
('1000000014', 'Luis', 'Cano S�nchez', 38, 'M', 'Calle del Valle 1414', '+100000014', '1986-03-19', 14),
('1000000015', 'Patricia', 'Paniagua Ram�rez', 31, 'F', 'Plaza de la Paz 1515', '+100000015', '1992-07-06', 13),
('1000000016', 'Rafael', 'Berm�dez Castro', 54, 'M', 'Calle del Sol 1616', '+100000016', '1969-10-22', 6),
('1000000017', 'M�nica', 'Mendoza D�az', 27, 'F', 'Calle de los Cedros 1717', '+100000017', '1996-12-11', 7),
('1000000018', 'Samuel', 'Hern�ndez Torres', 43, 'M', 'Av. de los Andes 1818', '+100000018', '1980-01-03', 8),
('1000000019', 'Elena', 'Garc�a P�rez', 39, 'F', 'Calle de la Esperanza 1919', '+100000019', '1984-04-14', 9),
('1000000020', 'Eduardo', 'Morales L�pez', 32, 'M', 'Calle del Desierto 2020', '+100000020', '1991-08-23', 1),
('1000000021', 'Lorena', 'N��ez Rodr�guez', 49, 'F', 'Av. del Mar 2121', '+100000021', '1975-12-29', 2),
('1000000022', 'H�ctor', 'Almeida Gonz�lez', 56, 'M', 'Calle de los Olivos 2222', '+100000022', '1968-06-15', 2),
('1000000023', 'Claudia', 'M��oz Mart�nez', 30, 'F', 'Calle del Olmo 2323', '+100000023', '1994-01-08', 3),
('1000000024', 'Fernando', 'Bravo Jim�nez', 41, 'M', 'Calle del R�o 2424', '+100000024', '1983-11-09', 4),
('1000000025', 'Ver�nica', 'G�mez S�nchez', 28, 'F', 'Calle de los Andes 2525', '+100000025', '1995-07-19', 5),
('1000000026', 'Ra�l', 'R�os Fern�ndez', 37, 'M', 'Calle del Viento 2626', '+100000026', '1987-09-11', 6),
('1000000027', 'Nina', 'Castro �lvarez', 33, 'F', 'Av. de la Luna 2727', '+100000027', '1990-12-17', 7),
('1000000028', 'Hugo', 'Ram�rez P�rez', 40, 'M', 'Calle de la Esperanza 2828', '+100000028', '1984-05-30', 8),
('1000000029', 'Carmen', 'Torres G�mez', 46, 'F', 'Calle de los Robles 2929', '+100000029', '1978-10-05', 9),
('1000000030', 'Mart�n', 'Gonz�lez Ram�rez', 29, 'M', 'Calle del Mar 3030', '+100000030', '1995-04-21', 3),
('1000000031', 'Jessica', 'V�squez Mart�nez', 25, 'F', 'Calle de la Aurora 3131', '+100000031', '1998-09-12', 1),
('1000000032', 'Jorge', 'Garc�a P�rez', 34, 'M', 'Av. del Sol 3232', '+100000032', '1990-06-20', 3),
('1000000033', 'Marina', 'Hern�ndez S�nchez', 39, 'F', 'Calle del R�o 3333', '+100000033', '1985-02-13', 3),
('1000000034', 'Alberto', 'D�az Ram�rez', 50, 'M', 'Calle del Bosque 3434', '+100000034', '1974-11-29', 14),
('1000000035', 'Lina', 'Gonz�lez G�mez', 31, 'F', 'Calle de los Cedros 3535', '+100000035', '1992-10-16', 3),
('1000000036', 'David', 'Mendoza Fern�ndez', 38, 'M', 'Calle del Sol 3636', '+100000036', '1986-04-02', 11),
('1000000037', 'Liliana', 'Rivas Mart�nez', 45, 'F', 'Av. del Horizonte 3737', '+100000037', '1978-08-14', 7),
('1000000038', 'Ricardo', 'Castro Jim�nez', 29, 'M', 'Calle de la Luna 3838', '+100000038', '1995-12-09', 10),
('1000000039', 'Gabriela', 'Su�rez P�rez', 27, 'F', 'Calle del Viento 3939', '+100000039', '1996-07-15', 9),
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
(1, 1, 'Control de diabetes tipo 2 con medicaci�n y dieta', 15,1653.00),
(2, 2, 'Revisi�n neurol�gica con evaluaci�n de s�ntomas', 12, 1520.00),
(3, 3, 'Consulta pedi�trica para evaluaci�n de crecimiento', 18, 786.00),
(4, 4, 'Examen ginecol�gico de rutina', 14, 1723.00),
(5, 5, 'Tratamiento para eczema con cremas t�picas', 17, 2071.00),
(6, 6, 'Evaluaci�n y tratamiento para problemas de visi�n', 20, 597.00),
(7, 7, 'Evaluaci�n psiqui�trica para ansiedad', 13, 1832.00),
(8, 8, 'Tratamiento ortop�dico para dolor de espalda', 16, 2181.00),
(9, 9, 'Tratamiento endocrinol�gico para tiroides', 11, 1130.00),
(10, 10, 'Evaluaci�n oncol�gica para masa mamaria', 19, 578.00),
(11, 11, 'Tratamiento reumatol�gico para artritis', 14,1830.00),
(12, 12, 'Control gastroenterol�gico para gastritis', 18, 2492.00),
(13, 13, 'Revisi�n nefrol�gica para insuficiencia renal', 20, 1897.00),
(14, 14, 'Tratamiento dermatol�gico para dermatitis', 11, 1333.00),
(15, 15, 'Consulta hematol�gica para anemia', 16, 1776.00),
(16, 1, 'Control de diabetes tipo 2', 12, 1053.00),
(17, 2, 'Revisi�n de hipertensi�n', 15, 1766.00),
(18, 3, 'Tratamiento de asma', 17, 1395.00),
(19, 4, 'Control de eczema', 13, 1639.00),
(20, 5, 'Tratamiento de artritis', 19, 1623.00),
(21, 6, 'Evaluaci�n card�aca', 14,1787.00),
(22, 7, 'Tratamiento de epilepsia', 16, 1349.00),
(23, 8, 'Revisi�n de s�ndrome de Down', 20, 1587.00),
(24, 9, 'Control de hipotiroidismo', 12, 1388.00),
(25, 10, 'Tratamiento de insuficiencia renal', 18, 2466.00),
(26, 11, 'Revisi�n de niveles de glucosa', 15, 1642.00),
(27, 12, 'Evaluaci�n de s�ntomas neurol�gicos', 13, 1957.00),
(28, 13, 'Examen pedi�trico completo', 20, 1669.00),
(29, 14, 'Control ginecol�gico anual', 14, 1153.00),
(30, 15, 'Tratamiento para eczema severo', 17, 1420.00),
(31, 1, 'Control oftalmol�gico', 19,1951.00),
(32, 2, 'Terapia psicol�gica para ansiedad', 11, 1017.00),
(33, 3, 'Tratamiento para lesi�n ortop�dica', 15, 739.00),
(34, 4, 'Revisi�n endocrinol�gica', 18, 1069.00),
(35, 5, 'Consulta de seguimiento oncol�gico', 20, 2185.00),
(36, 6, 'Revisi�n y seguimiento de enfermedades renales', 16, 1969.00),
(37, 7, 'Consulta de salud mental y ajuste de tratamiento', 13, 1096.00),
(38, 8, 'Tratamiento para lesiones ortop�dicas', 20, 1414.00),
(39, 9, 'Chequeo de problemas respiratorios y tratamiento', 12, 2114.00),
(40, 10, 'Evaluaci�n oncol�gica y tratamiento', 17, 755.00);

SELECT * FROM Tratamientos;
---DELETE Tratamientos;
