use GestionHospital;

---poblar dim-medico
SELECT 
	SUBSTRING(nombre,5,20) AS 'nombre',
	especialidad,
	numero_licencia_medica,
	id AS 'medico_id'
FROM Medicos;

---poblar dim_citas
SELECT*FROM Citas;
SELECT*FROM tipo_citas;
SELECT*FROM Medicos;
SELECT*FROM Pacientes;

SELECT 
	c.fecha AS 'fecha',
	t.motivo_cita AS 'MotivoCita',
	c.duracion_cita AS 'DuracionCita',
	concat (p.nombre,' ',p.apellido) AS 'Nombre_paciente',
	SUBSTRING(m.nombre,5,20) AS 'Nombre_medico',
	c.id AS 'cita_id'
	
FROM Citas c
INNER JOIN tipo_citas t ON t.id=c.tipocita_ID
INNER JOIN Medicos m ON m.id=c.Medico_ID
INNER JOIN Pacientes p ON p.id=c.Paciente_ID;


---poblar dim_paciente
SELECT*FROM Pacientes;
SELECT*FROM historial_medico;

CREATE VIEW VW_KV_DIMENSION_PACIENTES AS
SELECT
	concat (p.nombre,' ',p.apellido) AS 'Nombre',
	p.genero,
	p.edad,
	h.tipo_enfermedad,
	p.id AS 'paciente_id'

FROM Pacientes p
INNER JOIN historial_medico h ON h.id=p.historial_medico_ID;

---drop view VW_KV_DIMENSION_PACIENTES;

SELECT*FROM VW_KV_DIMENSION_PACIENTES; 
---poblar dim_tratamiento

SELECT*FROM Tratamientos;


SELECT
	t.descripcion,
	t.duracion AS 'Duracion_tratamiento',
	t.Costo,
	concat (p.nombre,' ',p.apellido) AS 'Nombre_paciente',
	m.nombre AS 'Nombre_medico',
	t.id AS 'tratamiento_id'
FROM Tratamientos t
INNER JOIN Pacientes p ON p.id=t.Paciente_ID
INNER JOIN Medicos m ON m.id=t.Medico_ID;

---poblar dim-tiempo
SELECT 
	CAST(DAY(fecha)AS VARCHAR) AS 'dia',
	CAST(MONTH(fecha) AS VARCHAR) AS 'mes',
	CAST(DATEPART(QUARTER,fecha) AS VARCHAR) AS 'trimestre',
	CAST(YEAR(fecha)AS VARCHAR) AS 'anio',
	CAST(DATENAME(MONTH,fecha) AS VARCHAR) AS 'nombre_mes',
	fecha AS 'fecha_citas'
FROM Citas; 

---poblar hecho_citas
SELECT*FROM Tratamientos;
SELECT*FROM Citas;

---DROP VIEW VW_KV_DIMENSION_hechos_citas;
SELECT	
	c.fecha AS 'dim_tiempo_ID',
	c.Paciente_ID AS 'dim_paciente_ID',
	c.Medico_ID AS 'dim_medico_ID',
	t.id AS 'dim_tratamiento_ID',
	c.id AS 'dim_cita_ID',
	c.tipocita_ID as 'TipoCita',
	COUNT(t.id) AS 'NumeroCitas',
	t.Costo AS 'CostosTratamiento'
FROM Citas c
INNER JOIN Tratamientos t ON t.Paciente_ID=c.Paciente_ID
INNER JOIN tipo_citas tc ON tc.id=c.tipocita_ID
WHERE c.tipocita_ID='1'
GROUP BY
	c.fecha,
	c.Paciente_ID,
	c.Medico_ID,
	c.tipocita_ID,
	t.id,
	c.id,
	t.Costo
UNION
SELECT	
	c.fecha AS 'dim_tiempo_ID',
	c.Paciente_ID AS 'dim_paciente_ID',
	c.Medico_ID AS 'dim_medico_ID',
	t.id AS 'dim_tratamiento_ID',
	c.id AS 'dim_cita_ID',
	c.tipocita_ID as 'TipoCita',
	COUNT(t.id) AS 'NumeroCitas',
	t.Costo AS 'CostosTratamiento'
FROM Citas c
INNER JOIN Tratamientos t ON t.Paciente_ID=c.Paciente_ID
INNER JOIN tipo_citas tc ON tc.id=c.tipocita_ID
WHERE c.tipocita_ID='2'
GROUP BY
	c.fecha,
	c.Paciente_ID,
	c.Medico_ID,
	c.tipocita_ID,
	t.id,
	c.id,
	t.Costo
UNION
SELECT	
	c.fecha AS 'dim_tiempo_ID',
	c.Paciente_ID AS 'dim_paciente_ID',
	c.Medico_ID AS 'dim_medico_ID',
	t.id AS 'dim_tratamiento_ID',
	c.id AS 'dim_cita_ID',
	c.tipocita_ID as 'TipoCita',
	COUNT(t.id) AS 'NumeroCitas',
	t.Costo AS 'CostosTratamiento'
FROM Citas c
INNER JOIN Tratamientos t ON t.Paciente_ID=c.Paciente_ID
INNER JOIN tipo_citas tc ON tc.id=c.tipocita_ID
WHERE c.tipocita_ID='3'
GROUP BY
	c.fecha,
	c.Paciente_ID,
	c.Medico_ID,
	c.tipocita_ID,
	t.id,
	c.id,
	t.Costo;
	

