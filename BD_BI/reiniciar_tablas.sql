
DELETE FROM hechos_transacciones;
DBCC CHECKIDENT ('hechos_transacciones', RESEED, 0); 

DELETE FROM dim_tiempo;
DBCC CHECKIDENT ('dim_tiempo', RESEED, 0); 

DELETE FROM Dim_Cita;
DBCC CHECKIDENT ('Dim_Cita', RESEED, 0); 

DELETE FROM Dim_Medico;
DBCC CHECKIDENT ('Dim_Medico', RESEED, 0); 

DELETE FROM Dim_Paciente;
DBCC CHECKIDENT ('Dim_Paciente', RESEED, 0); 

DELETE FROM Dim_Tratamiento;
DBCC CHECKIDENT ('Dim_Tratamiento', RESEED, 0); 

DELETE FROM Hechos_Citas;
DBCC CHECKIDENT ('Hechos_Citas', RESEED, 0); 
