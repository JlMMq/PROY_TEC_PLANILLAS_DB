
USE master;

IF EXISTS ( SELECT name FROM sysdatabases WHERE name ='BROLdb')
	DROP DATABASE BROLdb;
GO

CREATE DATABASE BROLdb;
GO

USE BROLdb;

CREATE TABLE Tb_UserSystem(
	codUser integer IDENTITY(5001,1) PRIMARY KEY,
	nomUser varchar(20) not null,
	correoUser varchar(70) null,
	passUser varchar(25) not null,
	estdUser int not null,
	permisoUser integer NOT NULL DEFAULT 0,
	str_nombres varchar(50) null,
	str_apellidos varchar(50) null,

	fec_Reg  datetime NULL,
	usu_Reg varchar(20) null,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) null
);

INSERT INTO Tb_UserSystem(nomUser,passUser,estdUser,permisoUser) VALUES ('admin','admin','1',3),
('juan','juan','1',2),('luis','luis','1',1),('naty','naty','1',1);

CREATE TABLE Tb_Horario(
	codHorario integer IDENTITY(1,1)  PRIMARY KEY,
	desHorario varchar(50) not null,
	ingLUN TIME null,
	salLUN TIME null,
	ingMAR TIME null,
	salMAR TIME null,
	ingMIE TIME null,
	salMIE TIME null,
	ingJUE TIME null,
	salJUE TIME null,
	ingVIE TIME null,
	salVIE TIME null,
	ingSAB TIME null,
	salSAB TIME null,
	ingDOM TIME null,
	salDOM TIME null,
	refriger int not null,
	tolernc int not null,
	diaDesc int not null,

	fec_Reg  datetime NULL,
	usu_Reg varchar(20) null,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) null
);

INSERT INTO Tb_Horario VALUES
('ADMINISTRATIVO'	,'08:30','19:00','08:30','19:00','08:30','19:00','08:30','19:00','08:30','18:15','00:00','00:00','00:00','00:00',60,15,2,GETDATE(),'SYSTEM',null,null),
('HOR_ALMACEN'		,'06:30','16:15','06:30','16:15','06:30','16:15','06:30','16:15','06:30','16:15','06:30','09:30','00:00','00:00',60,00,1,GETDATE(),'SYSTEM',null,null),
('HOR_ASISTECNICO'	,'07:00','16:45','07:00','16:45','07:00','16:45','07:00','16:45','07:00','16:45','07:00','10:00','00:00','00:00',60,00,1,GETDATE(),'SYSTEM',null,null),
('HOR_TRANSPORTE'	,'07:00','17:25','07:00','17:25','07:00','17:25','07:00','17:25','07:00','17:25','00:00','00:00','00:00','00:00',60,00,2,GETDATE(),'SYSTEM',null,null),
('HOR_PART1'		,'13:00','22:00','00:00','00:00','13:00','22:00','13:00','22:00','13:00','22:00','12:00','20:00','10:00','18:00',60,00,1,GETDATE(),'SYSTEM',null,null),
('HOR_PART2'		,'00:00','00:00','13:00','22:00','04:00','13:00','04:00','13:00','04:00','13:00','05:00','12:00','00:00','00:00',60,00,2,GETDATE(),'SYSTEM',null,null),
('HOR_GENDIA1'		,'07:00','16:00','07:00','16:00','07:00','16:00','07:00','16:00','07:00','16:00','07:00','12:00','00:00','00:00',60,00,1,GETDATE(),'SYSTEM',null,null),
('HOR_GENDIA2'		,'07:00','16:00','07:00','16:00','07:00','16:00','07:00','16:00','07:00','16:00','00:00','00:00','07:00','12:00',60,00,1,GETDATE(),'SYSTEM',null,null),
('HOR_GENNOC1'		,'16:00','00:00','16:00','00:00','16:00','00:00','16:00','00:00','16:00','00:00','16:00','20:00','00:00','00:00',60,00,1,GETDATE(),'SYSTEM',null,null),
('HOR_GENNOC1'		,'16:00','00:00','16:00','00:00','16:00','00:00','16:00','00:00','16:00','00:00','00:00','00:00','16:00','20:00',60,00,1,GETDATE(),'SYSTEM',null,null);


CREATE TABLE Tb_Sede(
	codSede integer IDENTITY(1,1) PRIMARY KEY,
	nomSede varchar(30) not null,
	direccion varchar(50) not null
);

INSERT INTO Tb_Sede VALUES	
('PUENTE-PIEDRA','Av. Juan Lecaros 11868, Puente Piedra 15121'),
('ATE','Av. Prol. Javier Prado Este 8680, Ate 15494'),
('ANCASH','Jir�n Juan de la Cruz Romero 210, Huaraz 02001'),
('CERCADO','Av. Amezaga, Lima 15081'),
('SANMIGUEL','Av. la Marina 2000, San Miguel 15088');

CREATE TABLE Tb_Area (
    codArea INT IDENTITY (1,1) PRIMARY KEY,
    nomArea VARCHAR(100)
);

INSERT INTO Tb_Area VALUES
('ADMINISTRACION'),
('CONTABILIDAD'),
('ASISTENCIA TECNICA'),
('SISTEMAS'),
('CAPACITACION'),
('TRANSPORTE'),
('ALMACEN'),
('SERVICIO ATENCION AL CLIENTE'),
('CALL CENTER'),
('PRODUCCION'),
('MARKETING');

CREATE TABLE Tb_Cargo (
    codCargo INT IDENTITY (1,1) PRIMARY KEY,
    nomCargo VARCHAR(100)
);

INSERT INTO Tb_Cargo VALUES
('ASISTENTE ADM-FACTURACION'),
('ASISTENTE ADMINISTRATIVO'),
('AUXILIAR DE LIQUIDACIONES'),
('COORDNIDOR DE GENRENCIA GENERAL'),
('RECEPCIONISTA'),
('AUXILIAR ADMINISTRATIVO'),
('TECNICO DE MANTENIMIENTO'),
('ASISTENTE DE IMPORTACIONES'),
('ANALISTA DE ADMINISTRACION DE PROCESOS'),
('ASISTENTE DE COMPRAS'),
('GERENTE DE ADMINISTRACION Y FINANZAS'),
('ASISTENTE DE DESPACHO'),
('ASISTENTE DE RECEPCION'),
('JEFE DE ALMACEN'),
('ENCARGADO DE SECCION'),
('COORDINADOR DE OPERACIONES'),
('AUXILIAR DE ALMACEN'),
('ASISTENTE DE INVENTARIOS'),
('TECNICO DE MAQUINAS'),
('TECNICO OPERARIO'),
('COORDINADOR DE ASISTENCIA TECNICA'),
('TECNICO ELECTRONICO'),
('EJECUTIVO(A) DE ATENCION AL CLIENTE SENIOR'),
('JEFE DE SERVICIO AL CLIENTE'),
('COORDINADORA DE SERVICIO TECNICO'),
('EJECUTIVO(A) DE CALLCENTER'),
('EJECUTIVO(A) DE ATENCION AL CLIENTE'),
('ASESOR DE VENTAS SENIOR'),
('COORDINADOR OPERATIVO'),
('SUPERVISOR GENERAL DE CALLCENTER'),
('COORDINADOR ENTRAMIENTO, CALIDAD Y VERIFICACION'),
('ASISTENTE CALLCENTER'),
('COORDINADOR DE VENTAS'),
('COORDINADOR OPERATIVO SUCURSAL'),
('ASISTENTE PEDIDOS PROVINCIA'),
('ASISTENTE SUCURSAL'),
('ASESORA DE VENTAS ECOMMERCE'),
('COORDINADOR DE VENTAS'),
('ASISTENTE DE PEDIDOS LIMA'),
('ANALISTA DE CALIDAD'),
('ASESOR(A) DE VENTAS'),
('ASESOR(A) DE REDES SOCIALES'),
('AUDITOR INTERNO'),
('CONTADOR'),
('ASISTENTE DE COBRANZAS'),
('ASISTENTE DE PLANILLAS'),
('ANALISTA CONTABLE'),
('ASISTENTA SOCIAL'),
('AUXILIAR DE CONTABILIDAD'),
('ASISTENTE DE TESORERIA'),
('ASISTENTE DE RECUT Y SELEC'),
('ANALISTA CONTABLE SENIOR'),
('ASISTENTE DE CONTABILIDAD'),
('FORMADOR - CAPACITADOR'),
('GERENTE COMERCIAL Y MARKETING'),
('COORDINADORA COMERCIAL'),
('POST PRODUCTOR'),
('PRODUCTOR GUIONISTA'),
('DISE�ADOR(A) GRAFICO(A)'),
('ANALISTA DIGITAL'),
('EDITOR'),
('JEFE DE MARKETING Y PUBLICIDAD'),
('ASISTENTE DE MARKETING'),
('JEFE DE SISTEMAS'),
('ADMINISTRADOR DE REDES'),
('ANALISTA DE SISTEMAS'),
('SOPORTE TECNICO'),
('SUPERVISOR GENERAL DE VENTAS'),
('SUPERVISOR(A) JUNIOR'),
('ADMINISTRADOR SENIOR'),
('ADMINISTRADOR JUNIOR'),
('CHOFER REPARTIDOR'),
('ASISTENTE DE TRANSPORTE'),
('COORDINADOR DE TRANSPORTE'),
('AUXILIAR DE TRANSPORTE'),
('ASISTENTE DE TRANSPORTE'),
('COORDINADOR DE TRANSPORTE'),
('CHOFER'),
('ASISTENTE ADM- LIQUIDACIONES'),
('GERENTE DE OPERACIONES'),
('ASISTENTE DE SS.GG.'),
('ASISTENTE DE PUBLICIDAD'),
('ASISTENTE DE PRODUCCION'),
('PRAC - CONTABILIDAD'),
('PRAC - SISTEMAS'),
('PRAC - MARKETING'),
('AUXILIAR DE INVENTARIO');

CREATE TABLE Tb_Documento(
	codDoc varchar(2) PRIMARY KEY NOT NULL,
	descrCorta varchar(15) NOT NULL,
	descrLarga varchar(70) NOT NULL,
	longitud int NOT NULL
);

INSERT INTO Tb_Documento (codDoc,descrCorta,descrLarga,longitud)
VALUES
('01','L.E/DNI','LIBRETA ELECTORAL O DNI',08),
('04','CARNET EXT.','CARNET DE EXTRANJERIA',12),
('06','RUC','REG. UNICO DE CONTRIBUYENTES',11),
('07','PASAPORTE','PASAPORTE',12),
('11','P.NAC.','PART. DE NACIMIENTO-IDENTIDAD',15),
('00','OTROS','OTROS',15);


CREATE TABLE Tb_Empleado(
	codEmpleado integer IDENTITY (20240001,1) PRIMARY KEY,
	numroDoc nvarchar(15) NOT NULL,
	tipoDoc varchar(2) NOT NULL FOREIGN KEY REFERENCES Tb_Documento(codDoc),
	apellidos nvarchar (50) NOT NULL,
	nombres nvarchar(50) NOT NULL,
	fecNacimiento DATE NOT NULL, 
	genero nvarchar(1) NOT NULL,
	correo nvarchar(150) NULL,
	direccion nvarchar(100) NOT NULL,
	telefono integer NULL,
	fecIngreso DATE NOT NULL,
	codCargo integer NOT NULL FOREIGN KEY REFERENCES Tb_Cargo(codCargo),
	codArea integer NOT NULL FOREIGN KEY REFERENCES Tb_Area(codArea),
	codSede integer NOT NULL FOREIGN KEY REFERENCES Tb_Sede(codSede),
	codHorario integer NOT NULL FOREIGN KEY REFERENCES Tb_Horario(codHorario),
	foto image NULL,

	fec_Reg  datetime NULL,
	usu_Reg varchar(20) NULL,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) NULL,
	estado int null
);

INSERT INTO Tb_Empleado VALUES
('72188872','01','MALLQUI MEZA','JUAN LUIS','2000-04-15','M','jlmallqui@gmail.com','Av. Juan Lecaros 11868, Puente Piedra 15121',991272888,'2023-12-01',1,1,1,1,null,GETDATE(),'SYSTEM',null,null,1),
('72188772','01','QUIROGA SALAZAR','ABRAHAM HANS','2000-04-10','M','ahansq@gmail.com','Av. Juan Lecaros 11868, Puente Piedra 15121',991272887,'2023-12-01',1,1,1,1,null,GETDATE(),'SYSTEM',null,null,1);

CREATE TABLE Tb_Marcas(
	codMarc integer IDENTITY (2000,1) PRIMARY KEY,
	empleado integer NOT NULL FOREIGN KEY REFERENCES Tb_Empleado(codEmpleado),
	fecha DATETIME NOT NULL,
	hora TIME NOT NULL,
	tipo int null,

	fec_Reg  datetime NULL,
	usu_Reg varchar(20) NULL,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) NULL
);

CREATE TABLE Tb_Diario(
	codDiar  integer IDENTITY (3000,1) PRIMARY KEY,
	fecha DATE NOT NULL,
	empleado integer NOT NULL FOREIGN KEY REFERENCES Tb_Empleado(codEmpleado),
	horario integer NOT NULL,
	hIngreso  TIME NULL,
	hSalida TIME NULL,
	hora1 TIME NULL,
	hora2 TIME NULL,
	hora3 TIME NULL,
	hora4 TIME NULL,
	ingrTard TIME NULL,
	exeRefr TIME NULL,
	exeJornd TIME NULL,
	observ VARCHAR(25) NULL,

	fec_Reg  datetime NULL,
	usu_Reg varchar(20) NULL,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) NULL
);


CREATE TABLE Tb_Calendario2024(
	codCal integer IDENTITY (1,1) PRIMARY KEY,
	fecha DATE not null,	
);

DECLARE @startDate DATE = '2024-01-01';
DECLARE @endDate DATE = '2024-12-31';
DECLARE @currentDate DATE = @startDate;

WHILE @currentDate <= @endDate
BEGIN
    INSERT INTO Tb_Calendario2024 (fecha) VALUES (@currentDate);
    SET @currentDate = DATEADD(DAY, 1, @currentDate);
END;


CREATE TABLE Tb_Feriados(
	codFeriado integer IDENTITY (1,1) PRIMARY KEY,
	fecha DATE not null,
	descrip varchar(50) null,
);

INSERT INTO Tb_Feriados (fecha, descrip) VALUES
('2024-01-01', 'A�o Nuevo'),
('2024-04-05', 'Viernes Santo'),
('2024-05-01', 'D�a del Trabajo'),
('2024-07-28', 'Fiestas Patrias'),
('2024-07-29', 'Fiestas Patrias'),
('2024-08-30', 'D�a de Santa Rosa de Lima'),
('2024-10-08', 'Combate de Angamos'),
('2024-11-01', 'D�a de Todos los Santos'),
('2024-12-08', 'D�a de la Inmaculada Concepci�n'),
('2024-12-25', 'Navidad');

CREATE TABLE Tb_Solicitud(
	codSolicitud integer IDENTITY(1000,1) PRIMARY KEY,
	
	codSolicitante INTEGER NOT NULL,
	codSupervisor INTEGER NOT NULL,
	
	tipoSolic INTEGER NOT NULL,
	desc_asunto VARCHAR(50) NOT NULL,
	desc_content VARCHAR(255) NOT NULL,
	fechaIni DATE NOT NULL,
	fechaFin DATE NOT NULL,

	estado integer NOT NULL DEFAULT 0,

	fec_Reg  datetime NULL,
	usu_Reg varchar(20) NULL,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) NULL
);

-- 0 PENDIENTE
-- 1 ACEPTADO
-- 2 CADUCADO
-- 3 RECHAZADO


-- TABLAS AUDITORIAS

CREATE TABLE Tb_UserSystem_Audit(
	codAudit integer IDENTITY(1,1) PRIMARY KEY,
	codUser integer,
	nomUser varchar(20) not null,
	correoUser varchar(70) null,
	passUser varchar(25) not null,
	estdUser int not null,
	permisoUser integer NOT NULL DEFAULT 0,
	str_nombres varchar(50) null,
	str_apellidos varchar(50) null,

	fec_Reg  datetime NULL,
	usu_Reg varchar(20) null,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) null,

	accion VARCHAR(50)NULL, 
	fec_HorAccion DATETIME NULL
);



CREATE TABLE Tb_Horario_Audit(
	codAudit INTEGER IDENTITY(1,1) PRIMARY KEY,
	codHorario integer null,
	desHorario varchar(50) not null,
	ingLUN TIME null,
	salLUN TIME null,
	ingMAR TIME null,
	salMAR TIME null,
	ingMIE TIME null,
	salMIE TIME null,
	ingJUE TIME null,
	salJUE TIME null,
	ingVIE TIME null,
	salVIE TIME null,
	ingSAB TIME null,
	salSAB TIME null,
	ingDOM TIME null,
	salDOM TIME null,
	refriger int  null,
	tolernc int  null,
	diaDesc int  null,

	fec_Reg  datetime NULL,
	usu_Reg varchar(20) null,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) null,

	accion VARCHAR(50)NULL, 
	fec_HorAccion DATETIME NULL

);

CREATE TABLE Tb_Empleado_Audit(
	codAudit integer IDENTITY(1,1) PRIMARY KEY,
	codEmpleado integer NULL,
	numroDoc nvarchar(15) NOT NULL,
	tipoDoc varchar(2) NOT NULL,
	apellidos nvarchar (50) NOT NULL,
	nombres nvarchar(50) NOT NULL,
	fecNacimiento DATE NOT NULL, 
	genero nvarchar(1) NOT NULL,
	correo nvarchar(150) NULL,
	direccion nvarchar(100) NOT NULL,
	telefono integer NULL,
	fecIngreso DATE NOT NULL,
	codCargo integer NOT NULL,
	codArea integer NOT NULL,
	codSede integer NOT NULL,
	codHorario integer NOT NULL,
	foto image NULL,

	fec_Reg  datetime NULL,
	usu_Reg varchar(20) NULL,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) NULL,
	estado int null,

	accion VARCHAR(50)NULL, 
	fec_HorAccion DATETIME NULL
);

CREATE TABLE Tb_Marcas_Audit(
	codAudit integer IDENTITY(1,1) PRIMARY KEY,
	codMarc integer,
	empleado integer NOT NULL,
	fecha DATETIME NOT NULL,
	hora TIME NOT NULL,
	tipo int null, 

	fec_Reg  datetime NULL,
	usu_Reg varchar(20) NULL,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) NULL,

	accion VARCHAR(50) NULL, 
	fec_HorAccion DATETIME NULL	
);

CREATE TABLE Tb_Diario_Audit(
	codAudit integer IDENTITY (1,1) PRIMARY KEY,
	codDiar  integer not null,
	fecha DATE NOT NULL,
	empleado integer NOT NULL,
	horario integer NOT NULL,
	hIngreso  DATETIME NULL,
	hSalida DATETIME NULL,
	hora1 DATETIME NULL,
	hora2 DATETIME NULL,
	hora3 DATETIME NULL,
	hora4 DATETIME NULL,
	ingrTard TIME NULL,
	exeRefr TIME NULL,
	exeJornd TIME NULL,
	observ VARCHAR(25) NULL,
	
	fec_Reg  datetime NULL,
	usu_Reg varchar(20) NULL,
	fec_UltMod datetime NULL,
	usu_UltMod varchar(20) NULL,

	accion VARCHAR(50)NULL, 
	fec_HorAccion DATETIME NULL
);


-- VISTAS 
GO 
CREATE VIEW vw_VistaUserSystem
	AS
	SELECT 
		codUser,
		nomUser,
		passUser,
		estdUser
	FROM Tb_UserSystem
GO
CREATE VIEW vw_VistaHorario
	AS
	SELECT 
		codHorario,
		desHorario,
		ingLUN,
		salLUN,
		ingMAR,
		salMAR,
		ingMIE,
		salMIE,
		ingJUE,
		salJUE,
		ingVIE,
		salVIE,
		ingSAB,
		salSAB,
		ingDOM,
		salDOM,
		refriger,
		tolernc,
		diaDesc
	FROM Tb_Horario
GO
CREATE VIEW vw_VistaEmpleado
	AS
	SELECT 
		codEmpleado,
		numroDoc,
		tipoDoc,
		apellidos,
		nombres,
		fecNacimiento, 
		genero,
		correo,
		direccion,
		telefono,
		fecIngreso,
		codCargo,
		codArea,
		codSede,
		codHorario,
		foto,
		estado
	FROM Tb_Empleado
GO

CREATE VIEW vw_VistaMarcas
	AS
	SELECT 
		codMarc,
		empleado,
		fecha,
		hora,
		tipo
	FROM Tb_Marcas
GO
CREATE VIEW vw_VistaDiario
	AS
	SELECT
		codDiar,
		fecha,
		empleado,
		horario,
		hIngreso,
		hSalida,
		hora1,
		hora2,
		hora3,
		hora4,
		ingrTard,
		exeRefr,
		exeJornd,
		observ
	FROM Tb_Diario

-- PROCEDIMIENTOS ALMACENADOS	

-- SOLICITUDES
GO
CREATE PROCEDURE usp_InsertarSolicitud
	@codSolicitante INTEGER,
	@codSupervisor INTEGER,
	@tipo INTEGER,
	@asunto VARCHAR(50),
	@descrip VARCHAR(255),
	@fechaIni DATE,
	@fechaFin DATE,

	@usuario VARCHAR(20)
	AS
	BEGIN
	-- TIPO
	 -- 1 Vacaciones
	 -- 2 Permiso Personal
	 -- 3 Permiso Medico
	 -- 4 Otros
		DECLARE @cod_out INT;
		DECLARE @mensaje VARCHAR(255);
		
		IF EXISTS(SELECT 1 FROM Tb_UserSystem WHERE nomUser = CAST(@codSupervisor AS VARCHAR(20)) AND permisoUser = 3) 
		BEGIN
			INSERT INTO Tb_Solicitud (codSolicitante,codSupervisor,tipoSolic,desc_asunto,desc_content,fechaIni,fechaFin,estado,fec_Reg,usu_Reg) VALUES
				(@codSolicitante,@codSupervisor,@tipo,@asunto,@descrip,@fechaIni,@fechaFin,0,GETDATE(),@usuario);
			SET @cod_out = 1;
			SET @mensaje = 'Se ingreso correctamente la solicitud.';
		END
		ELSE 
		BEGIN 
			SET @cod_out = -1;
			SET @mensaje = 'El destinatario no tiene permiso para admitir solicitudes.';
		END
			
	SELECT  @cod_out AS CODIGO, @mensaje  AS MENSAJE;
END;

GO 
CREATE PROCEDURE usp_ProcesarSolicitud
	@codSolicitud INTEGER,
	@estado INTEGER,
	@usuario VARCHAR(20)
	AS 
	BEGIN
	-- ESTADO
	-- 0 PENDIENTE
	-- 1 ACEPTADO
	-- 2 CADUCADO
	-- 3 RECHAZADO
	DECLARE @cod_out INTEGER;
	DECLARE @mensaje VARCHAR(255);

	SET @cod_out = 0;
	SET @mensaje = 'No se proceso la solicitud.';

	IF (@estado = 1)
	BEGIN
		UPDATE Tb_Solicitud SET
		estado = @estado, 
		fec_UltMod = GETDATE(),
		usu_UltMod = @usuario
		WHERE codSolicitud = @codSolicitud;

		DECLARE @codSolicitante INTEGER;
		DECLARE @fecIni DATE;
		DECLARE @fecFin DATE;
		DECLARE @estado_select INTEGER;
		-- En teoria las fechas ya estan validadas y correspondientes, si el dia ya paso, ya deberia estar caducada la solicitud.
		SELECT @codSolicitante = codSolicitante, @fecIni = fechaIni , @fecFin = fechaFin, @estado_select = estado FROM Tb_Solicitud WHERE codSolicitud = @codSolicitud;
		
		IF(@estado_select = 0)
		BEGIN
			DECLARE @horario INTEGER;
			SELECT TOP 1 @horario = codHorario FROM Tb_Empleado WHERE codEmpleado = @codSolicitante;
			
			DECLARE @fecTemp DATE = @fecIni;
			DECLARE @numeroDiaSemana INT;
			DECLARE @hIngreso TIME;
			DECLARE @hSalida TIME;
			DECLARE @dif INT;

			WHILE @fecTemp <= @fecFin
			BEGIN
				SET @numeroDiaSemana = DATEPART(WEEKDAY, @fecTemp);	
				SELECT
					@hIngreso = 
					CASE @numeroDiaSemana 
						WHEN 1 THEN (SELECT ingLUN FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 2 THEN (SELECT ingMAR FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 3 THEN (SELECT ingMIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 4 THEN (SELECT ingJUE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 5 THEN (SELECT ingVIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 6 THEN (SELECT ingSAB FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 7 THEN (SELECT ingDOM FROM Tb_Horario WHERE codHorario = @horario)
					END;
				SELECT
					@hSalida= 
					CASE @numeroDiaSemana 
						WHEN 1 THEN (SELECT salLUN FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 2 THEN (SELECT salMAR FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 3 THEN (SELECT salMIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 4 THEN (SELECT salJUE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 5 THEN (SELECT salVIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 6 THEN (SELECT salSAB FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 7 THEN (SELECT salDOM FROM Tb_Horario WHERE codHorario = @horario)
					END;
				
				SET @dif = DATEDIFF(MINUTE,@hSalida,@hIngreso);
				IF (@dif != 0)
				BEGIN
					INSERT INTO Tb_Diario(fecha,empleado,horario,hIngreso,hSalida,hora1,hora2,hora3,hora4,ingrTard,observ,fec_Reg,usu_Reg) VALUES
					(@fecTemp,@codSolicitante,@horario, @hIngreso,@hSalida,@hIngreso,'00:00:00','00:00:00',@hSalida,'00:00:00','PERMISO',GETDATE(),@usuario)
				END
				-- Pronto cambiara a palabras claves
				SET @fecTemp = DATEADD(DAY,1,@fecTemp);
			END
			SET @cod_out = 1;
			SET @mensaje = 'Se proceso la solicitud.';
		END
		ELSE
		BEGIN
			SET @cod_out = -1;
			IF(@estado_select = 1)
			BEGIN
				SET @mensaje = 'La solicitud ya se encuentra aceptada.';
			END
			ELSE IF (@estado_select = 2)
			BEGIN
				SET @mensaje = 'La solicitud ya ha caducado.';
			END
			ELSE IF (@estado_select = 3)
			BEGIN
				SET @mensaje = 'La solicitud ha sido rechazada.';
			END
			ELSE
			BEGIN
				SET @mensaje = 'Estado no catalogado.';
			END
		END
	END
	IF (@estado = 3)
	BEGIN
	  UPDATE Tb_Solicitud SET
		estado = @estado, 
		fec_UltMod = GETDATE(),
		usu_UltMod = @usuario
		WHERE codSolicitud = @codSolicitud;
		
		SET @cod_out = 1;
		SET @mensaje = 'Se proceso la solicitud.';
	END

	SELECT  @cod_out AS CODIGO, @mensaje  AS MENSAJE;
END;

GO
CREATE PROCEDURE usp_ListarSolicitudesSuperv
	@codSupervisor INT
	AS
	BEGIN
	SELECT s.codSolicitud,s.codSupervisor,s.codSolicitante,e.apellidos + e.nombres AS nomape,e.foto,s.tipoSolic,s.desc_asunto,s.desc_content,s.fechaIni,s.fechaFin,s.estado FROM Tb_Solicitud s
 	INNER JOIN Tb_Empleado e ON codSolicitante = codEmpleado WHERE codSupervisor = @codSupervisor;
END;

-- EMPLEADOS
go
CREATE PROCEDURE usp_EliminarEmpleado
	@codEmpleado INTEGER  
	AS 
	BEGIN
	DELETE FROM Tb_Empleado
	WHERE codEmpleado = @codEmpleado;
END;

go
CREATE PROCEDURE usp_ConsultarEmpleado
	@codEmpleado INTEGER
	AS
	BEGIN
	SELECT * FROM vw_VistaEmpleado
	WHERE codEmpleado = @codEmpleado;
END;

go
CREATE PROCEDURE usp_ConsultarEmpleadoCodDoc
	@codEmpleado INTEGER,
	@numroDoc VARCHAR(15)
	AS
	BEGIN
	SELECT * FROM vw_VistaEmpleado
	WHERE codEmpleado = @codEmpleado OR numroDoc = @numroDoc;
END;
go
CREATE PROCEDURE usp_ListarEmpleadosView
	AS
	BEGIN
	SELECT e.codEmpleado, e.numroDoc,e.apellidos, e.nombres, e.correo, e.direccion, e.telefono, e.estado, d.descrLarga as nombreDocumento , c.nomCargo as nombreCargo,
	a.nomArea as nombreArea, h.desHorario as nombreHorario FROM  Tb_Empleado e
	INNER JOIN Tb_Documento d ON d.codDoc = e.tipoDoc
	INNER JOIN Tb_Area a ON a.codArea = e.codArea	
	INNER JOIN Tb_Cargo c on c.codCargo = e.codCargo
	INNER JOIN Tb_Horario h on h.codHorario = e.codHorario;
END;
go
CREATE PROCEDURE usp_ListarEmpleados
	AS
	BEGIN
	SELECT 
		codEmpleado,
		numroDoc,
		tipoDoc,
		apellidos,
		nombres,
		fecNacimiento, 
		genero,
		correo,
		direccion,
		telefono,
		fecIngreso,
		codCargo,
		codArea,
		codSede,
		codHorario,
		foto,
		estado
	FROM vw_VistaEmpleado
	ORDER BY codEmpleado
END;

go	
CREATE PROCEDURE usp_InsertarEmpleado
	@numroDoc nvarchar(15),
	@tipoDoc nvarchar(2),
	@apellidos nvarchar (50),
	@nombres nvarchar(50),
	@fecNacimiento DATE, 
	@genero nvarchar(1),
	@correo nvarchar(150),
	@direccion nvarchar(100),
	@telefono integer,
	@fecIngreso DATE,
	@codCargo integer,
	@codArea integer,
	@codSede integer,
	@codHorario integer,
	@foto image,

	@usu_Reg varchar(20),
	
	@estado integer
	AS
	BEGIN 
	INSERT INTO Tb_Empleado
	(
	numroDoc,
	tipoDoc,
	apellidos,
	nombres,
	fecNacimiento,
	genero,
	correo,
	direccion,
	telefono,
	fecIngreso,
	codCargo,
	codArea,
	codSede,
	codHorario,
	foto,
	fec_Reg,
	usu_Reg,
	estado
	) VALUES
	(@numroDoc,
	@tipoDoc,
	@apellidos,
	@nombres,
	@fecNacimiento,
	@genero,
	@correo,
	@direccion,
	@telefono,
	@fecIngreso,
	@codCargo,
	@codArea,
	@codSede,
	@codHorario,
	@foto,
	GETDATE(),
	@usu_Reg,
	@estado
	);
END;

go
CREATE PROCEDURE usp_ActualizarEmpleado
	@codEmpleado integer,
	@numroDoc nvarchar(15),
	@tipoDoc nvarchar(2),
	@apellidos nvarchar (50),
	@nombres nvarchar(50),
	@fecNacimiento DATE, 
	@genero nvarchar(1),
	@correo nvarchar(150),
	@direccion nvarchar(100),
	@telefono integer,
	@fecIngreso DATE,
	@codCargo integer,
	@codArea integer,
	@codSede integer,
	@codHorario integer,
	@foto image,

	@usu_UltMod varchar(20),
	@estado integer
	AS
	UPDATE Tb_Empleado SET 
		numroDoc = @numroDoc,
		tipoDoc = @tipoDoc,
		nombres = @nombres,
		apellidos = @apellidos,
		fecNacimiento = @fecNacimiento,
		genero = @genero,
		correo = @correo,
		direccion = @direccion,
		telefono = @telefono,
		fecIngreso = @fecIngreso,
		codCargo = @codCargo,
		codArea = @codArea,
		codSede = @codSede,
		codHorario = @codHorario,
		foto = @foto,
		fec_UltMod = GETDATE(),
		usu_UltMod = @usu_UltMod,
		estado = @estado
	WHERE codEmpleado = @codEmpleado;
-- VARIOS

GO
CREATE PROCEDURE usp_ListarHorarios
	AS
	BEGIN
	SELECT
		*	
	FROM vw_VistaHorario
	ORDER BY codHorario;
END;

GO
CREATE PROCEDURE usp_ListarSede
	AS
	BEGIN
	SELECT
		*	
	FROM Tb_Sede
	ORDER BY codSede;
END;
GO

CREATE PROCEDURE usp_ListarArea
	AS
	BEGIN
	SELECT
		*	
	FROM Tb_Area
	ORDER BY codArea;
END;

GO
CREATE PROCEDURE usp_ListarCargo
	AS
	BEGIN
	SELECT
		*	
	FROM Tb_Cargo
	ORDER BY codCargo;
END;

GO 
CREATE PROCEDURE usp_ListarDocumentos
	AS
	BEGIN
	SELECT
	*
	FROM Tb_Documento
	ORDER BY codDoc;
END;

GO
 CREATE PROCEDURE usp_ConsultarDocumento
	@codDoc varchar(2)
	AS 
	BEGIN
	SELECT * FROM Tb_Documento
	WHERE codDoc = @codDoc;
END;

-- UserSystem

GO 
CREATE PROCEDURE  usp_EliminarUserSystem
	@codUser INTEGER
	AS
	BEGIN 
	DELETE FROM Tb_UserSystem
	WHERE codUser = @codUser;
END;

GO 
CREATE PROCEDURE usp_ConsultarUserSystem
	@codUser INTEGER 
	AS 
	BEGIN 
	SELECT 
		codUser,
		nomUser,
		passUser,
		estdUser 
	FROM vw_VistaUserSystem
	WHERE codUser = @codUser;
END;

GO
CREATE PROCEDURE usp_ValidarUserSystem
	@nomUser VARCHAR(50),
	@passUser VARCHAR(25)
	AS
	BEGIN 
		DECLARE @estadoTrans BIT;
		DECLARE	@codUser int;
		DECLARE @permiso INT;
		
		DECLARE @strnombres VARCHAR(50);
		DECLARE @strapellidos VARCHAR(50);
		DECLARE @correoUser VARCHAR(70);

		IF (SELECT TOP 1 1 FROM Tb_UserSystem WHERE nomUser = @nomUser AND passUser = @passUser) IS NOT NULL
		BEGIN
			SET @estadoTrans = 1;
			SET @codUser = (SELECT TOP 1 codUser FROM Tb_UserSystem WHERE nomUser = @nomUser AND passUser = @passUser);
			SET @permiso = (SELECT TOP 1 permisoUser FROM Tb_UserSystem WHERE nomUser = @nomUser AND passUser = @passUser);
			
			SELECT TOP 1 
				@strnombres = str_nombres,
				@strapellidos = str_apellidos,
				@correoUser = correoUser
			FROM Tb_UserSystem
			WHERE nomUser = @nomUser AND passUser = @passUser;
		
		END
		ELSE
		BEGIN
			SET @estadoTrans = 0;
			SET @codUser = 0;
			SET @permiso = -1;
			SET @strnombres = '';
			SET	@strapellidos = '';
			SET	@correoUser = '';
		END


		SELECT @estadoTrans AS estadoTrans, @codUser AS codUser, @nomUser AS nomUser, @strnombres AS str_nombres,@strapellidos AS str_apellidos,@correoUser AS correoUser, @permiso AS permiso;
END;

GO
CREATE PROCEDURE usp_ActualizarCorreo
	@codUser int,
	@correo VARCHAR(70)
	AS
	BEGIN 
		DECLARE @usuario VARCHAR(20);
		
		UPDATE Tb_UserSystem SET
			correoUser = @correo
		WHERE codUser = @codUser;

		SET @usuario = (SELECT TOP 1 nomUser FROM Tb_UserSystem WHERE codUser = @codUser);
		IF (SELECT TOP 1 1 FROM Tb_Empleado WHERE codEmpleado = TRY_CAST(@usuario AS INT)) IS NOT NULL
		BEGIN
			UPDATE Tb_Empleado SET 
			correo = @correo
			WHERE codEmpleado = CAST(@usuario AS INT);
		END
END;

GO
CREATE PROCEDURE usp_CambiarPassword
	@codUser int,
	@passUser VARCHAR(25)
	AS
	BEGIN 
		UPDATE Tb_UserSystem SET
			passUser = @passUser
			WHERE codUser = @codUser
END;

GO
CREATE PROCEDURE usp_ConsultarUserSystemNom
	@nomUser VARCHAR(50)
	AS 
	BEGIN
	SELECT 
		codUser,
		nomUser,
		correoUser,
		permisoUser,
		str_nombres,
		str_apellidos,
		fec_Reg,
		estdUser 
	FROM Tb_UserSystem
	WHERE nomUser = @nomUser;
END;

GO
CREATE PROCEDURE usp_ListarUserSystem
	AS 
	BEGIN 
	SELECT 
		codUser,
		nomUser,
		correoUser,
		permisoUser,
		str_nombres,
		str_apellidos,
		fec_Reg,
		estdUser
	FROM Tb_UserSystem
	ORDER BY codUser;
END;

GO
CREATE PROCEDURE usp_ListarUserSystemView
	AS 
	BEGIN 
	SELECT 
		codUser,
		nomUser,
		estdUser
	FROM vw_VistaUserSystem
	ORDER BY codUser;
END;

GO
CREATE PROCEDURE usp_UpdPermisosUserSystem
	@codUser INT,
	@permiso INT,
	@estado INT
	AS
	BEGIN 
	UPDATE Tb_UserSystem SET
		permisoUser = @permiso, 
		estdUser = @estado
	WHERE 
		codUser = @codUser;
END;

GO
CREATE PROCEDURE usp_InsertarUserSystem
	@nomUser VARCHAR(50),
	@passUser VARCHAR(25),
	@estdUser int,

	@fec_Reg datetime,
	@usu_Reg varchar(20)
	AS
	BEGIN
	SET @fec_Reg = GETDATE();
	INSERT INTO Tb_UserSystem
	(nomUser,
	passUser,
	estdUser,
	fec_Reg,
	usu_Reg
	)VALUES
	(
	@nomUser,
	@passUser,
	@estdUser,
	@fec_Reg,
	@usu_Reg
	);
END;

GO
CREATE PROCEDURE usp_ActualizarUserSystem
	@codUser integer, 
	@nomUser VARCHAR(50),
	@passUser VARCHAR(25),
	@estdUser int,
	@usu_UltMod varchar(20)
	AS
	UPDATE Tb_UserSystem SET
		nomUser = @nomUser,
		passUser = @passUser,
		estdUser = @estdUser,
		fec_UltMod = GETDATE(),
		usu_UltMod = @usu_UltMod
	WHERE codUser = @codUser;

-- MARCAS 
GO	
CREATE PROCEDURE usp_EliminarMarca
	@codMarc integer
	AS
	BEGIN
	DELETE FROM Tb_Marcas
	WHERE codMarc = @codMarc;
	END;

GO 
CREATE PROCEDURE usp_ConsultarMarca
	@codMarc integer
	AS
	BEGIN
	SELECT * FROM vw_VistaMarcas
	WHERE codMarc = @codMarc;
END;

GO
CREATE PROCEDURE usp_ListarMarcas
	AS
	BEGIN 
	SELECT 
		*
	FROM vw_VistaMarcas
	ORDER BY codMarc;
	END;
/*
GO
CREATE PROCEDURE usp_RegInserDiarioMarca
	@fecha  DATE,
	@empleado int,
	@horario int,
	@hora TIME,
	@tipo int,
	@usu_Reg varchar(20)
	AS
	IF EXISTS(select 1 from Tb_Diario where empleado = @empleado and fecha = @fecha)
		BEGIN 
			IF @tipo = 2
				UPDATE Tb_Diario SET hora2 = @hora, usu_Reg = @usu_Reg WHERE empleado = @empleado and fecha=@fecha 
			ELSE IF @tipo = 3
				UPDATE Tb_Diario SET hora3 = @hora, usu_Reg = @usu_Reg WHERE empleado = @empleado and fecha=@fecha 
			ELSE IF @tipo = 4
				UPDATE Tb_Diario SET hora4 = @hora, usu_Reg = @usu_Reg WHERE empleado = @empleado and fecha=@fecha 
			ELSE 
				UPDATE Tb_Diario SET hora1 = @hora, usu_Reg = @usu_Reg WHERE empleado = @empleado and fecha=@fecha 
		END
	ELSE
		BEGIN
			INSERT INTO Tb_Diario(fecha,empleado,horario,hIngreso,hora1,fec_Reg,usu_Reg) VALUES
			(@fecha,@empleado,@horario,@hora,@hora,GETDATE(),@usu_Reg)
	END;
*/

GO
CREATE PROCEDURE usp_RegInserDiarioMarca
	@fecha  DATE,
	@empleado int,
	@horario int,
	@hora TIME,
	@tipo int,
	@usu_UltMod varchar(20)
	AS
	BEGIN

			DECLARE @numeroDiaSemana INT;
			SET @numeroDiaSemana = DATEPART(WEEKDAY, GETDATE());
			DECLARE @hIngreso TIME;
			DECLARE @hSalida TIME;
			DECLARE @ingrTard TIME;
			DECLARE @horaBase TIME = '00:00:00';
			DECLARE @hora1 TIME = CONVERT(VARCHAR(8), GETDATE(), 108);
			DECLARE @hora2 TIME;
			DECLARE @hora3 TIME;
			DECLARE @dif INT;
			DECLARE @observ varchar(25);
			DECLARE @tmpRefr INT;
			SELECT
					@hIngreso = 
					CASE @numeroDiaSemana 
						WHEN 1 THEN (SELECT ingLUN FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 2 THEN (SELECT ingMAR FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 3 THEN (SELECT ingMIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 4 THEN (SELECT ingJUE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 5 THEN (SELECT ingVIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 6 THEN (SELECT ingSAB FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 7 THEN (SELECT ingDOM FROM Tb_Horario WHERE codHorario = @horario)
					END;
			SELECT
					@hSalida= 
					CASE @numeroDiaSemana 
						WHEN 1 THEN (SELECT salLUN FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 2 THEN (SELECT salMAR FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 3 THEN (SELECT salMIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 4 THEN (SELECT salJUE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 5 THEN (SELECT salVIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 6 THEN (SELECT salSAB FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 7 THEN (SELECT salDOM FROM Tb_Horario WHERE codHorario = @horario)
					END;
			
			SET @tmpRefr = (SELECT refriger FROM Tb_Horario WHERE codHorario = @horario);

			SET @dif = DATEDIFF(MINUTE,@hora1,@hIngreso);
			IF(@dif >= 0)
				BEGIN
					SET @observ = 'PUNTUAL';
					SET @ingrTard = '00:00:00';
				END;
			ELSE
				BEGIN
					SET @observ = 'TARDE';
					SET @ingrTard = DATEADD(MINUTE, ABS(@dif),@horabase);
				END;
	IF EXISTS(select * from Tb_Diario where empleado = @empleado and fecha = @fecha)
		BEGIN 
			IF @tipo = 2
				UPDATE Tb_Diario SET hora2 =  @hora, usu_UltMod = @usu_UltMod WHERE empleado = @empleado and fecha=@fecha
			ELSE IF @tipo = 3
				BEGIN
				UPDATE Tb_Diario SET hora3 =  @hora, usu_UltMod = @usu_UltMod WHERE empleado = @empleado and fecha=@fecha
				SET @dif = DATEDIFF(MINUTE,(SELECT hora2 FROM Tb_Diario WHERE empleado = @empleado and fecha = @fecha),@hora);
					IF(@tmpRefr >= @dif)
						UPDATE Tb_Diario SET exeRefr = '00:00:00' WHERE empleado = @empleado and fecha = @fecha;
					ElSE
						UPDATE Tb_Diario SET exeRefr = DATEADD(MINUTE,ABS(@dif),@horabase) WHERE empleado = @empleado and fecha = @fecha;
				END;
			ELSE IF @tipo = 4
				BEGIN
				UPDATE Tb_Diario SET hora4 =  @hora, usu_UltMod = @usu_UltMod WHERE empleado = @empleado and fecha=@fecha
				SET @dif = DATEDIFF(MINUTE,@hSalida,@hora);
				IF (@dif <= 0)
					UPDATE Tb_Diario SET exeJornd = '00:00:00' WHERE empleado = @empleado and fecha = @fecha;
				ELSE
					UPDATE Tb_Diario SET exeJornd = DATEADD(MINUTE,ABS(@dif),@horabase) WHERE empleado = @empleado and fecha = @fecha;
				END;
			ELSE 
				UPDATE Tb_Diario SET hora1 =  @hora, usu_UltMod = @usu_UltMod WHERE empleado = @empleado and fecha=@fecha
		END;
	ELSE
		BEGIN
			INSERT INTO Tb_Diario(fecha,empleado,horario,hIngreso,hSalida,hora1,ingrTard,observ,fec_UltMod,usu_UltMod) VALUES
			(@fecha,@empleado,@horario, @hIngreso,@hSalida,@hora1,@ingrTard,@observ,GETDATE(),@usu_UltMod)
	END;
END;
GO
CREATE PROCEDURE usp_DiarioMetrSumTard
	@codigo integer,
	@fecIni datetime,
	@fecFin datetime
	AS
	BEGIN 
		SELECT  CONVERT(TIME, DATEADD(SECOND, SUM(DATEDIFF(SECOND, '00:00:00', ingrTard)), '00:00:00')) AS sumTar
		FROM Tb_Diario
		WHERE 
		empleado = @codigo
		AND fecha BETWEEN @fecIni AND @fecFin;
	END;

GO
CREATE PROCEDURE usp_InsertarMarca
	@empleado integer, 
	@horario integer,
	@usu_Reg varchar(20),
	@fecha datetime,
	@tipo integer

	AS
	BEGIN 
			INSERT INTO Tb_Marcas
			(empleado,
			fecha,
			hora,
			tipo,
			fec_Reg,
			usu_Reg
			)
			VALUES
			(@empleado,
			GETDATE(),
			CAST(GETDATE() AS TIME),
			@tipo,
			GETDATE(),
			@usu_Reg);

			DECLARE @numeroDiaSemana INT;
			SET @numeroDiaSemana = DATEPART(WEEKDAY, GETDATE());
			DECLARE @hIngreso TIME;
			DECLARE @hSalida TIME;
			DECLARE @ingrTard TIME;
			DECLARE @horaBase TIME = '00:00:00';
			DECLARE @hora1 TIME = CONVERT(VARCHAR(8), GETDATE(), 108);
			DECLARE @hora2 TIME;
			DECLARE @hora3 TIME;
			DECLARE @dif INT;
			DECLARE @observ varchar(25);
			DECLARE @tmpRefr INT;
			SELECT
					@hIngreso = 
					CASE @numeroDiaSemana 
						WHEN 1 THEN (SELECT ingLUN FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 2 THEN (SELECT ingMAR FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 3 THEN (SELECT ingMIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 4 THEN (SELECT ingJUE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 5 THEN (SELECT ingVIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 6 THEN (SELECT ingSAB FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 7 THEN (SELECT ingDOM FROM Tb_Horario WHERE codHorario = @horario)
					END;
			SELECT
					@hSalida= 
					CASE @numeroDiaSemana 
						WHEN 1 THEN (SELECT salLUN FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 2 THEN (SELECT salMAR FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 3 THEN (SELECT salMIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 4 THEN (SELECT salJUE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 5 THEN (SELECT salVIE FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 6 THEN (SELECT salSAB FROM Tb_Horario WHERE codHorario = @horario)
						WHEN 7 THEN (SELECT salDOM FROM Tb_Horario WHERE codHorario = @horario)
					END;
			
			SET @tmpRefr = (SELECT refriger FROM Tb_Horario WHERE codHorario = @horario);

			SET @dif = DATEDIFF(MINUTE,@hora1,@hIngreso);
			IF(@dif >= 0)
				BEGIN
					SET @observ = 'PUNTUAL';
					SET @ingrTard = '00:00:00';
				END;
			ELSE
				BEGIN
					SET @observ = 'TARDE';
					SET @ingrTard = DATEADD(MINUTE, ABS(@dif),@horabase);
				END;

	IF EXISTS(select * from Tb_Diario where empleado = @empleado and fecha = @fecha)
		BEGIN 
			IF @tipo = 2
				UPDATE Tb_Diario SET hora2 =  CONVERT(VARCHAR(8), GETDATE(), 108), usu_Reg = @usu_Reg WHERE empleado = @empleado and fecha=@fecha
			ELSE IF @tipo = 3
				BEGIN
				UPDATE Tb_Diario SET hora3 =  CONVERT(VARCHAR(8), GETDATE(), 108), usu_Reg = @usu_Reg WHERE empleado = @empleado and fecha=@fecha
				SET @dif = DATEDIFF(MINUTE,(SELECT hora2 FROM Tb_Diario WHERE empleado = @empleado and fecha = @fecha),CONVERT(VARCHAR(8), GETDATE(), 108));
					IF(@tmpRefr >= @dif)
						UPDATE Tb_Diario SET exeRefr = '00:00:00' WHERE empleado = @empleado and fecha = @fecha;
					ElSE
						UPDATE Tb_Diario SET exeRefr = DATEADD(MINUTE,ABS(@dif),@horabase) WHERE empleado = @empleado and fecha = @fecha;
				END;
			ELSE IF @tipo = 4
				BEGIN
				UPDATE Tb_Diario SET hora4 =  CONVERT(VARCHAR(8), GETDATE(), 108), usu_Reg = @usu_Reg WHERE empleado = @empleado and fecha=@fecha
				SET @dif = DATEDIFF(MINUTE,@hSalida,CONVERT(VARCHAR(8), GETDATE(), 108));
				IF (@dif <= 0)
					UPDATE Tb_Diario SET exeJornd = '00:00:00' WHERE empleado = @empleado and fecha = @fecha;
				ELSE
					UPDATE Tb_Diario SET exeJornd = DATEADD(MINUTE,ABS(@dif),@horabase) WHERE empleado = @empleado and fecha = @fecha;
				END;
			ELSE 
				UPDATE Tb_Diario SET hora1 =  CONVERT(VARCHAR(8), GETDATE(), 108), usu_Reg = @usu_Reg WHERE empleado = @empleado and fecha=@fecha
		END;
	ELSE
		BEGIN
			

			INSERT INTO Tb_Diario(fecha,empleado,horario,hIngreso,hSalida,hora1,ingrTard,observ,fec_Reg,usu_Reg) VALUES
			(@fecha,@empleado,@horario, @hIngreso,@hSalida,@hora1,@ingrTard,@observ,GETDATE(),@usu_Reg)
	END;
END;



GO
CREATE PROCEDURE usp_ActualizarMarca
	@codMarc integer,
	@empleado integer,
	@fecha datetime,
	@hora time,
	@tipo int,
	@usu_UltMod varchar(20)
	AS
	UPDATE Tb_Marcas SET
		empleado = @empleado,
		fecha = @fecha,
		hora = @hora,
		tipo = @tipo,
		fec_UltMod = GETDATE(),
		usu_UltMod = @usu_UltMod
	WHERE codMarc = @codMarc;

-- DIARIO

GO 
CREATE PROCEDURE usp_EliminarDiario
	@codDiar integer
	AS
	BEGIN 
	DELETE FROM Tb_Diario
	WHERE codDiar = @codDiar;
	END;
	
GO 
CREATE PROCEDURE usp_ConsultarDiario
	@codDiar integer
	AS
	BEGIN
	SELECT * FROM vw_VistaDiario
	WHERE codDiar = @codDiar;
	END;
GO 
CREATE PROCEDURE usp_ConsultarDiarioFecEmpl
	@fecha DATE,
	@empleado integer
	AS
	BEGIN
	SELECT * FROM vw_VistaDiario
	WHERE fecha= @fecha and empleado = @empleado;
	END;

GO
CREATE PROCEDURE usp_ListarDiario
	AS
	BEGIN
	SELECT 
		*
	FROM vw_VistaDiario
	ORDER BY fecha;
END;

GO
CREATE PROCEDURE usp_InsertarDiario
	@fecha date,
	@empleado integer,
	@horario integer,
	@hIngreso time,
	@hSalida time,
	@hora1 time,
	@hora2 time,
	@hora3 time,
	@hora4 time,
	@ingrTard TIME,
	@exeRefr TIME,
	@exeJornd TIME,
	@observ varchar(25),

	@usu_Reg varchar(20)
	AS
	BEGIN 
	INSERT INTO Tb_Diario
	(fecha,
	empleado,
	horario,
	hIngreso,
	hSalida,
	hora1,
	hora2,
	hora3,
	hora4,
	ingrTard,
	exeRefr,
	exeJornd,
	observ,
	fec_Reg,
	usu_Reg)
	VALUES
	(@fecha,
	@empleado,
	@horario,
	@hIngreso,
	@hSalida,
	@hora1,
	@hora2,
	@hora3,
	@hora4,
	@ingrTard,
	@exeRefr,
	@exeJornd,
	@observ,
	GETDATE(),
	@usu_Reg
	);
	END;

GO
CREATE PROCEDURE  usp_ActualizarDiario
	@codDiar integer,
	@fecha date,
	@empleado integer,
	@horario integer,
	@hIngreso time,
	@hSalida time,
	@hora1 time,
	@hora2 time,
	@hora3 time,
	@hora4 time,
	@ingrTard TIME,
	@exeRefr TIME,
	@exeJornd TIME,
	@observ varchar(25),

	@usu_UltMod varchar(20)
	AS
	UPDATE Tb_Diario SET	
		fecha = @fecha,
		empleado = @empleado,
		horario = @horario,
		hora1 = @hora1,
		hora2 = @hora2,
		hora3 = @hora3,
		hora4 = @hora4,
		ingrTard = @ingrTard,
		exeRefr = @exeRefr,
		exeJornd = @exeJornd,
		observ = @observ,

		fec_UltMod = GETDATE(),
		usu_UltMod = @usu_UltMod
	WHERE codDiar = @codDiar;

-- HORARIOS
GO
CREATE PROCEDURE usp_EliminarHorario	
	@codHorario integer
	AS
	BEGIN
	DELETE FROM  Tb_Horario
	WHERE codHorario = @codHorario;
END;

GO
CREATE PROCEDURE usp_ConsultarHorario
	@codHorario integer 
	AS
	BEGIN
	SELECT * FROM vw_VistaHorario
	WHERE codHorario = @codHorario;
	END;

GO 
CREATE PROCEDURE usp_InsertarHorario
	@desHorario varchar(50),
	@ingLUN TIME,
	@salLUN TIME,
	@ingMAR TIME,
	@salMAR TIME,
	@ingMIE TIME,
	@salMIE TIME,
	@ingJUE TIME,
	@salJUE TIME,
	@ingVIE TIME,
	@salVIE TIME,
	@ingSAB TIME,
	@salSAB TIME,
	@ingDOM TIME,
	@salDOM TIME,
	@refriger int,
	@tolernc int,
	@diaDesc int,

	@usu_Reg varchar(20)
	AS
	BEGIN
	INSERT INTO Tb_Horario
	(desHorario,
	ingLUN,
	salLUN,
	ingMAR,
	salMAR,
	ingMIE,
	salMIE,
	ingJUE,
	salJUE,
	ingVIE,
	salVIE,
	ingSAB,
	salSAB,
	ingDOM,
	salDOM,
	refriger,
	tolernc,
	diaDesc,

	fec_Reg,
	usu_Reg
	)VALUES	 
	(@desHorario,
	@ingLUN,
	@salLUN,
	@ingMAR,
	@salMAR,
	@ingMIE,
	@salMIE,
	@ingJUE,
	@salJUE,
	@ingVIE,
	@salVIE,
	@ingSAB,
	@salSAB,
	@ingDOM,
	@salDOM,
	@refriger,
	@tolernc,
	@diaDesc,
	GETDATE(),
	@usu_Reg 
	);
	END;
	
GO
CREATE PROCEDURE usp_ActualizarHorario
	@codHorario integer,
	@desHorario varchar(50),
	@ingLUN TIME,
	@salLUN TIME,
	@ingMAR TIME,
	@salMAR TIME,
	@ingMIE TIME,
	@salMIE TIME,
	@ingJUE TIME,
	@salJUE TIME,
	@ingVIE TIME,
	@salVIE TIME,
	@ingSAB TIME,
	@salSAB TIME,
	@ingDOM TIME,
	@salDOM TIME,
	@refriger int,
	@tolernc int,
	@diaDesc int,

	@usu_UltMod varchar(20)
	AS
	UPDATE Tb_Horario SET	 
		desHorario = @desHorario,
		ingLUN = @ingLUN,
		salLUN = @salLUN,
		ingMAR = @ingMAR,
		salMAR = @salMAR,
		ingMIE = @ingMIE,
		salMIE = @salMIE,
		ingJUE = @ingJUE,
		salJUE = @salJUE,
		ingVIE = @ingVIE,
		salVIE = @salVIE,
		ingSAB = @ingSAB,
		salSAB = @salSAB,
		ingDOM = @ingDOM,
		salDOM = @salDOM,
		refriger = @refriger,
		tolernc = @tolernc,
		diaDesc = @diaDesc,

		fec_UltMod = GETDATE(),
		usu_UltMod = @usu_UltMod
		WHERE codHorario = @codHorario;


-- EMPLEADOS
GO 
CREATE TRIGGER tr_EmpleadoInsertar
	ON Tb_Empleado
	AFTER INSERT
	AS
	BEGIN 
		INSERT INTO Tb_Empleado_Audit
		(codEmpleado,
		numroDoc,
		tipoDoc,
		apellidos,
		nombres,
		fecNacimiento,
		genero,
		correo,
		direccion,
		telefono,
		fecIngreso,
		codCargo,
		codArea,
		codSede,
		codHorario,
		foto,

		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		estado,
		accion,
		fec_HorAccion
		)
		SELECT 
		codEmpleado,
		numroDoc,
		tipoDoc,
		apellidos,
		nombres,
		fecNacimiento,
		genero,
		correo,
		direccion,
		telefono,
		fecIngreso,
		codCargo,
		codArea,
		codSede,
		codHorario,
		null,

		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		estado,
		'INSERT',
		GETDATE()
		FROM inserted;

		INSERT INTO Tb_UserSystem (nomUser,correoUser,passUser,estdUser,permisoUser,str_nombres,str_apellidos,fec_Reg,usu_Reg)
		SELECT CONVERT(VARCHAR(20), codEmpleado),correo,'2024BROL'+ CONVERT(VARCHAR(13),numroDoc),1,1,nombres,apellidos,GETDATE(),usu_Reg FROM inserted;
END;

GO 
CREATE TRIGGER tr_EmpleadoActualizar
	ON  Tb_Empleado
	AFTER UPDATE
	AS
	BEGIN
		INSERT INTO Tb_Empleado_Audit
		(codEmpleado,
		numroDoc,
		tipoDoc,
		apellidos,
		nombres,
		fecNacimiento,
		genero,
		correo,
		direccion,
		telefono,
		fecIngreso,
		codCargo,
		codArea,
		codSede,
		codHorario,
		foto,

		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		estado,
		accion,
		fec_HorAccion
		)
		SELECT 
		codEmpleado,
		numroDoc,
		tipoDoc,
		apellidos,
		nombres,
		fecNacimiento,
		genero,
		correo,
		direccion,
		telefono,
		fecIngreso,
		codCargo,
		codArea,
		codSede,
		codHorario,
		null,

		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		estado,
		'UPDATE',
		GETDATE()
		FROM deleted;
END;

GO
CREATE TRIGGER tr_EmpleadoEliminar
	ON Tb_Empleado
	AFTER DELETE
	AS
	BEGIN
		INSERT INTO Tb_Empleado_Audit
		(codEmpleado,
		numroDoc,
		tipoDoc,
		apellidos,
		nombres,
		fecNacimiento,
		genero,
		correo,
		direccion,
		telefono,
		fecIngreso,
		codCargo,
		codArea,
		codSede,
		codHorario,
		foto,

		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		estado,
		accion,
		fec_HorAccion
		)
		SELECT 
		codEmpleado,
		numroDoc,
		tipoDoc,
		apellidos,
		nombres,
		fecNacimiento,
		genero,
		correo,
		direccion,
		telefono,
		fecIngreso,
		codCargo,
		codArea,
		codSede,
		codHorario,
		null,

		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		estado,
		'DELETE',
		GETDATE()
		FROM deleted;
END;

-- UserSystem
GO
CREATE TRIGGER tr_UserSystemInsertar
	ON Tb_UserSystem
	AFTER INSERT
	AS 
	BEGIN
		INSERT INTO Tb_UserSystem_Audit
		(codUser,
		nomUser,
		correoUser,
		passUser,
		estdUser,
		permisoUser,
		str_nombres,
		str_apellidos,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,

		accion, 
		fec_HorAccion
		)
		SELECT
		codUser,
		nomUser,
		correoUser,
		passUser,
		estdUser,
		permisoUser,
		str_nombres,
		str_apellidos,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
	
		'INSERT', 
		GETDATE()
		FROM inserted;
END;

GO 
CREATE TRIGGER tr_UserSystemActualizar
	ON Tb_UserSystem
	AFTER UPDATE
	AS
	BEGIN
		INSERT INTO Tb_UserSystem_Audit
		(codUser,
		nomUser,
		correoUser,
		passUser,
		estdUser,
		permisoUser,
		str_nombres,
		str_apellidos,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
	
		accion, 
		fec_HorAccion
		)
		SELECT
		codUser,
		nomUser,
		correoUser,
		passUser,
		estdUser,
		permisoUser,
		str_nombres,
		str_apellidos,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
	
		'UPDATE', 
		GETDATE()
		FROM deleted;
END;

GO
CREATE TRIGGER tr_UserSystemEliminar
	ON Tb_UserSystem
	AFTER DELETE 
	AS
	BEGIN 
		INSERT INTO Tb_UserSystem_Audit
		(codUser,
		nomUser,
		correoUser,
		passUser,
		estdUser,
		permisoUser,
		str_nombres,
		str_apellidos,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
	
		accion, 
		fec_HorAccion
		)
		SELECT
		codUser,
		nomUser,
		correoUser,
		passUser,
		estdUser,
		permisoUser,
		str_nombres,
		str_apellidos,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
	
		'DELETE', 
		GETDATE()
		FROM deleted;
END;

-- Horario

GO 
CREATE TRIGGER tr_HorarioInsertar
	ON Tb_Horario
	AFTER INSERT 
	AS
	BEGIN 
		INSERT INTO Tb_Horario_Audit
		(codHorario,
		desHorario,
		ingLUN,
		salLUN,
		ingMAR,
		salMAR,
		ingMIE,
		salMIE,
		ingJUE,
		salJUE,
		ingVIE,
		salVIE,
		ingSAB,
		salSAB,
		ingDOM,
		salDOM,
		refriger,
		tolernc,
		diaDesc,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		accion, 
		fec_HorAccion)
		SELECT
		codHorario,
		desHorario,
		ingLUN,
		salLUN,
		ingMAR,
		salMAR,
		ingMIE,
		salMIE,
		ingJUE,
		salJUE,
		ingVIE,
		salVIE,
		ingSAB,
		salSAB,
		ingDOM,
		salDOM,
		refriger,
		tolernc,
		diaDesc,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		'INSERT', 
		GETDATE()
		FROM inserted;
END;

GO
CREATE TRIGGER tr_HorarioActualizar
	ON Tb_Horario
	AFTER UPDATE
	AS
	BEGIN
		INSERT INTO Tb_Horario_Audit
		(codHorario,
		desHorario,
		ingLUN,
		salLUN,
		ingMAR,
		salMAR,
		ingMIE,
		salMIE,
		ingJUE,
		salJUE,
		ingVIE,
		salVIE,
		ingSAB,
		salSAB,
		ingDOM,
		salDOM,
		refriger,
		tolernc,
		diaDesc,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		accion, 
		fec_HorAccion)
		SELECT
		codHorario,
		desHorario,
		ingLUN,
		salLUN,
		ingMAR,
		salMAR,
		ingMIE,
		salMIE,
		ingJUE,
		salJUE,
		ingVIE,
		salVIE,
		ingSAB,
		salSAB,
		ingDOM,
		salDOM,
		refriger,
		tolernc,
		diaDesc,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		'UPDATE', 
		GETDATE()
		FROM deleted;
END;

GO
CREATE TRIGGER tr_HorarioEliminar
	ON Tb_Horario
	AFTER DELETE
	AS
	BEGIN
		INSERT INTO Tb_Horario_Audit
		(codHorario,
		desHorario,
		ingLUN,
		salLUN,
		ingMAR,
		salMAR,
		ingMIE,
		salMIE,
		ingJUE,
		salJUE,
		ingVIE,
		salVIE,
		ingSAB,
		salSAB,
		ingDOM,
		salDOM,
		refriger,
		tolernc,
		diaDesc,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		accion, 
		fec_HorAccion)
		SELECT
		codHorario,
		desHorario,
		ingLUN,
		salLUN,
		ingMAR,
		salMAR,
		ingMIE,
		salMIE,
		ingJUE,
		salJUE,
		ingVIE,
		salVIE,
		ingSAB,
		salSAB,
		ingDOM,
		salDOM,
		refriger,
		tolernc,
		diaDesc,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		'DELETE', 
		GETDATE()
		FROM deleted;
END;

-- MARCAS

GO
CREATE TRIGGER tr_MarcasInsertar
	ON Tb_Marcas
	AFTER INSERT
	AS
	BEGIN 
		INSERT INTO Tb_Marcas_Audit
		(codMarc,
		empleado,
		fecha,
		hora,
		tipo,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		accion, 
		fec_HorAccion
		)
		SELECT
		codMarc,
		empleado,
		fecha,
		hora,
		tipo,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		'INSERT', 
		GETDATE()
		FROM inserted;
	END;

GO
CREATE TRIGGER tr_MarcasActualizar
	ON Tb_Marcas
	AFTER UPDATE
	AS
	BEGIN 
		INSERT INTO Tb_Marcas_Audit
		(codMarc,
		empleado,
		fecha,
		hora,
		tipo,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		accion, 
		fec_HorAccion
		)
		SELECT
		codMarc,
		empleado,
		fecha,
		hora,
		tipo,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		'UPDATE', 
		GETDATE()
		FROM deleted;
	END;

GO
CREATE TRIGGER tr_MarcasEliminar
	ON Tb_Marcas
	AFTER DELETE
	AS
	BEGIN 
		INSERT INTO Tb_Marcas_Audit
		(codMarc,
		empleado,
		fecha,
		hora,
		tipo,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		accion, 
		fec_HorAccion
		)
		SELECT
		codMarc,
		empleado,
		fecha,
		hora,
		tipo,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod,
		'DELETE', 
		GETDATE()
		FROM deleted;
	END;
-- DIARIO	

GO 
CREATE TRIGGER tr_DiarioInsertar
	ON Tb_Diario
	AFTER INSERT 
	AS
	BEGIN 
		INSERT INTO Tb_Diario_Audit
		(codDiar,
		fecha,
		empleado,
		horario,
		hIngreso,
		hSalida,
		hora1,
		hora2,
		hora3,
		hora4,
		ingrTard,
		exeRefr,
		exeJornd,
		observ,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod ,
		accion, 
		fec_HorAccion)
		SELECT 
		codDiar,
		fecha,
		empleado,
		horario,
		hIngreso,
		hSalida,
		hora1,
		hora2,
		hora3,
		hora4,
		ingrTard,
		exeRefr,
		exeJornd,
		observ,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod ,
		'INSERT', 
		GETDATE()
		FROM inserted;
END;

GO 
CREATE TRIGGER tr_DiarioActualizar
	ON Tb_Diario
	AFTER UPDATE 
	AS
	BEGIN 
		INSERT INTO Tb_Diario_Audit
		(codDiar,
		fecha,
		empleado,
		horario,
		hIngreso,
		hSalida,
		hora1,
		hora2,
		hora3,
		hora4,
		ingrTard,
		exeRefr,
		exeJornd,
		observ,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod ,
		accion, 
		fec_HorAccion)
		SELECT 
		codDiar,
		fecha,
		empleado,
		horario,
		hIngreso,
		hSalida,
		hora1,
		hora2,
		hora3,
		hora4,
		ingrTard,
		exeRefr,
		exeJornd,
		observ,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod ,
		'UPDATE', 
		GETDATE()
		FROM deleted;
END;

GO
CREATE TRIGGER tr_DiarioEliminar
	ON Tb_Diario
	AFTER DELETE 
	AS
	BEGIN 
		INSERT INTO Tb_Diario_Audit
		(codDiar,
		fecha,
		empleado,
		horario,
		hIngreso,
		hSalida,
		hora1,
		hora2,
		hora3,
		hora4,
		ingrTard,
		exeRefr,
		exeJornd,
		observ,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod ,
		accion, 
		fec_HorAccion)
		SELECT 
		codDiar,
		fecha,
		empleado,
		horario,
		hIngreso,
		hSalida,
		hora1,
		hora2,
		hora3,
		hora4,
		ingrTard,
		exeRefr,
		exeJornd,
		observ,
		fec_Reg,
		usu_Reg,
		fec_UltMod,
		usu_UltMod ,
		'DELETE', 
		GETDATE()
		FROM deleted;
END;