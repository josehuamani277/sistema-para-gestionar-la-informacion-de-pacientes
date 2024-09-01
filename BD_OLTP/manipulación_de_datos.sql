USE GestionHospital;

SELECT*FROM tipo_citas;
SELECT*FROM citas;

---citas-tipo de citas
SELECT
	t.motivo_cita AS 'tipo de cita',
	c.Paciente_ID,
	c.Medico_ID
FROM  citas c
INNER JOIN tipo_citas t ON t.id=c.tipocita_ID
WHERE t.id =3;

---PACIENTES- HISTORIAL_MEDICO
SELECT * FROM Pacientes;
SELECT * FROM historial_medico;

SELECT * FROM 
	Pacientes p
INNER JOIN historial_medico h ON h.id=p.historial_medico_ID
WHERE p.genero = 'F';

--- PACIENTES-TRATAMIENTOS

SELECT * FROM Tratamientos;
SELECT * FROM Pacientes; 

SELECT * FROM
	Pacientes p
INNER JOIN Tratamientos t ON t.Paciente_ID=p.id;

/*
Ejercicio 1: Selección de Citas de un Paciente
Descripción: Escribe una consulta que devuelva todas las citas de un paciente específico, ordenadas por fecha y hora.
*/

/*
Ejercicio 2: Listado de Pacientes y su Médico de Cabecera
Descripción: Crea una consulta que devuelva una lista de todos los pacientes junto con el nombre de su médico de cabecera (si tienen uno asignado).
*/

/*
Ejercicio 3: Reporte de Tratamientos por Médico
Descripción: Escribe una consulta para obtener un reporte que muestre cuántos tratamientos ha realizado cada médico.
*/

/*
Ejercicio 4: Historial Médico Completo de un Paciente
Descripción: Genera un reporte que incluya toda la información relevante de un paciente, incluyendo sus citas y tratamientos pasados.
*/

/*
Ejercicio 5: Actualización de Información de Paciente
Descripción: Escribe un comando para actualizar la dirección y número de teléfono de un paciente específico.
*/