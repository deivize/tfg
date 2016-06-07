

-- -------------Estandar-----------------
CREATE TABLE Estandar( idEstandar BIGSERIAL NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	CONSTRAINT EstandarPK PRIMARY KEY (idEstandar));
	
CREATE INDEX EstandarIndexByidEstandar ON Estandar(idEstandar);


-- -------------Tecnologia-----------------
CREATE TABLE Tecnologia( idTecnologia BIGSERIAL NOT NULL,
	tipo VARCHAR(255) NOT NULL,
	subtipo VARCHAR(255),
	CONSTRAINT TecnologiaPK PRIMARY KEY (idTecnologia));

CREATE INDEX TecnologiaIndexByidTecnologia ON Tecnologia(idTecnologia);

-- -------------Parametro---------------------
CREATE TABLE Parametro( idParametro BIGSERIAL NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	valor VARCHAR(255) NOT NULL,
	CONSTRAINT ParametroPK PRIMARY KEY (idParametro));
	
CREATE INDEX ParametroIndexByidParametro ON Parametro(idParametro);

-- ------------Etiqueta----------------------
CREATE TABLE Etiqueta( idEtiqueta BIGSERIAL NOT NULL,
	contenido VARCHAR(255) NOT NULL,
	fabricante VARCHAR(255) NOT NULL,
	infoCifrada BOOLEAN NOT NULL,
	idEstandar BIGINT NOT NULL,
	idTecnologia BIGINT NOT NULL,
	idParametro BIGINT NOT NULL,
	CONSTRAINT EtiquetaPK PRIMARY KEY (idEtiqueta),
	CONSTRAINT EtiquetaidEstandarFK FOREIGN KEY (idEstandar)
		REFERENCES Estandar(idEstandar),
	CONSTRAINT EtiquetaidTecnologiaFK FOREIGN KEY (idTecnologia)
		REFERENCES Tecnologia(idTecnologia),
	CONSTRAINT EtiquetaidParametroFK FOREIGN KEY (idParametro)
		REFERENCES Parametro(idParametro));

CREATE INDEX EtiquetaIndexByidEtiqueta ON Etiqueta(idEtiqueta);

-- -----------------Mapa--------------------------------------------
CREATE TABLE Mapa (idMapa BIGSERIAL NOT NULL,
	nombre VARCHAR(255),
	activo BOOLEAN,
	CONSTRAINT MapaPK PRIMARY KEY (idMapa));

-- -----------Activo-----------------------
CREATE TABLE Activo( idActivo BIGSERIAL NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	icono BYTEA,
	categoria VARCHAR(255) NOT NULL,
	idEtiqueta BIGINT NOT NULL,
	fechaCaducidad TIMESTAMP,
	temperatura DOUBLE PRECISION,
	idMapa BIGINT,
	CONSTRAINT ActivoPK PRIMARY KEY (idActivo),
	CONSTRAINT ActivoidEtiquetaFK FOREIGN KEY (idEtiqueta)
		REFERENCES Etiqueta(idEtiqueta)
	CONSTRAINT ActivoidMapaFK FOREIGN KEY (idMapa)
		REFERENCES Mapa(idMapa));

CREATE INDEX ActivoIndexByidActivo ON Activo(idActivo);

-- --------Localizacion--------------------
CREATE TABLE Localizacion( idLocalizacion BIGSERIAL NOT NULL,
	coord_x DOUBLE PRECISION NOT NULL,
	coord_y DOUBLE PRECISION NOT NULL,
	coord_z DOUBLE PRECISION NOT NULL,
	edificio VARCHAR(255) NOT NULL,
	planta BIGINT NOT NULL,
	area VARCHAR(255),
	zona VARCHAR(255),
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT LocalizacionPK PRIMARY KEY (idLocalizacion));
	
CREATE INDEX LocalizacionIndexByidLocalizacion ON Localizacion(idLocalizacion);
	
-- ----------Lector------------------------
CREATE TABLE Lector( idLector BIGSERIAL NOT NULL,
	modelo VARCHAR(255) NOT NULL,
	tipo VARCHAR(255),
	idMapa BIGINT,
	CONSTRAINT LectorPK PRIMARY KEY (idLector),
	CONSTRAINT LectoridMapaFK FOREIGN KEY (idMapa)
		REFERENCES Mapa(idMapa));
	
		
CREATE INDEX LectorIndexByidLector ON Lector(idLector);

-- -----------Etiqueta_Lector---------------
CREATE TABLE EtiquetaLector( idLector BIGINT NOT NULL,
	idEtiqueta BIGINT NOT NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT EtiquetaLectorPK PRIMARY KEY (idLector,idEtiqueta,fecha),
	CONSTRAINT EtiquetaLectoridLectorFK FOREIGN KEY (idLector)
		REFERENCES Lector(idLector),
	CONSTRAINT EtiquetaLectoridEtiquetaFK FOREIGN KEY (idEtiqueta)
		REFERENCES Etiqueta(idEtiqueta));
		

-- ---------------Activo_Localizacion------------
CREATE TABLE ActivoLocalizacion( idActivo BIGINT NOT NULL,
	idLocalizacion BIGINT NOT NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT ActivoLocalizacionPK PRIMARY KEY (idActivo,idLocalizacion,fecha),
	CONSTRAINT ActivoLocalizacionidActivoFK FOREIGN KEY (idActivo)
		REFERENCES Activo(idActivo),
	CONSTRAINT ActivoLocalizacionidLocalizacionFK FOREIGN KEY (idLocalizacion)
		REFERENCES Localizacion(idLocalizacion));



-- ----------------Lector_Localizacion---------------------
CREATE TABLE LectorLocalizacion(	idLector BIGINT NOT NULL,
	idLocalizacion BIGINT NOT NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT LectorLocalizacionPK PRIMARY KEY (idLector,idLocalizacion,fecha),
	CONSTRAINT LectorLocalizacionLectorFK FOREIGN KEY (idLector)
		REFERENCES Lector(idLector),
	CONSTRAINT LectorLocalizacionLocalizacionFK FOREIGN KEY (idLocalizacion)
		REFERENCES Localizacion(idLocalizacion));
		
-- -----------------LocalizacionInteres--------------------------
CREATE TABLE LocalizacionInteres ( idLocInteres BIGSERIAL NOT NULL,
	tipo VARCHAR(255),
	width DOUBLE PRECISION,
	height DOUBLE PRECISION,
	texto VARCHAR(255),
	idLocalizacion BIGINT,
	idMapa BIGINT,
	CONSTRAINT LocalizacionInteresPK PRIMARY KEY (idLocInteres),
	CONSTRAINT LocalizacionInteresLocalizacionFK FOREIGN KEY (idLocalizacion)
		REFERENCES Localizacion(idLocalizacion),
	CONSTRAINT LocalizacionInteresidMapaFK FOREIGN KEY (idMapa)
		REFERENCES Mapa(idMapa));






	
	
	