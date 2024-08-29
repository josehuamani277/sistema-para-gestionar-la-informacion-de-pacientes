
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
