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
Ejercicio 1: Selecci�n de Citas de un Paciente
Descripci�n: Escribe una consulta que devuelva todas las citas de un paciente espec�fico, ordenadas por fecha y hora.
*/

/*
Ejercicio 2: Listado de Pacientes y su M�dico de Cabecera
Descripci�n: Crea una consulta que devuelva una lista de todos los pacientes junto con el nombre de su m�dico de cabecera (si tienen uno asignado).
*/

/*
Ejercicio 3: Reporte de Tratamientos por M�dico
Descripci�n: Escribe una consulta para obtener un reporte que muestre cu�ntos tratamientos ha realizado cada m�dico.
*/

/*
Ejercicio 4: Historial M�dico Completo de un Paciente
Descripci�n: Genera un reporte que incluya toda la informaci�n relevante de un paciente, incluyendo sus citas y tratamientos pasados.
*/

/*
Ejercicio 5: Actualizaci�n de Informaci�n de Paciente
Descripci�n: Escribe un comando para actualizar la direcci�n y n�mero de tel�fono de un paciente espec�fico.
*/