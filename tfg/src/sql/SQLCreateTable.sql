

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

-- -----------Activo-----------------------
CREATE TABLE Activo( idActivo BIGSERIAL NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	icono BYTEA,
	categoria VARCHAR(255) NOT NULL,
	idEtiqueta BIGINT NOT NULL,
	CONSTRAINT ActivoPK PRIMARY KEY (idActivo),
	CONSTRAINT ActivoidEtiquetaFK FOREIGN KEY (idEtiqueta)
		REFERENCES Etiqueta(idEtiqueta));

CREATE INDEX ActivoIndexByidActivo ON Activo(idActivo);

-- --------Localizacion--------------------
CREATE TABLE Localizacion( idLocalizacion BIGSERIAL NOT NULL,
	coord_x BIGINT NOT NULL,
	coord_y BIGINT NOT NULL,
	coord_z BIGINT NOT NULL,
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
	CONSTRAINT LectorPK PRIMARY KEY (idLector),
	
		
CREATE INDEX LectorIndexByidLector ON Lector(idLector);

-- -----------Etiqueta_Lector---------------
CREATE TABLE Etiqueta_Lector( idLector BIGINT NOT NULL,
	idEtiqueta BIGINT NOT NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT Etiqueta_LectorPK PRIMARY KEY (idLector,idEtiqueta,fecha),
	CONSTRAINT Etiqueta_LectoridLectorFK FOREIGN KEY (idLector)
		REFERENCES Lector(idLector),
	CONSTRAINT Etiqueta_LectoridEtiquetaFK FOREIGN KEY (idEtiqueta)
		REFERENCES Etiqueta(idEtiqueta));
		

-- ---------------Activo_Localizacion------------
CREATE TABLE Activo_Localizacion( idActivo BIGINT NOT NULL,
	idLocalizacion BIGINT NOT NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT Activo_LocalizacionPK PRIMARY KEY (idActivo,idLocalizacion,fecha),
	CONSTRAINT Activo_LocalizacionidActivoFK FOREIGN KEY (idActivo)
		REFERENCES Activo(idActivo),
	CONSTRAINT Activo_LocalizacionidLocalizacionFK FOREIGN KEY (idLocalizacion)
		REFERENCES Localizacion(idLocalizacion));



-- ----------------Lector_Localizacion---------------------
CREATE TABLE Lector_Localizacion(	idLector BIGINT NOT NULL,
	idLocalizacion BIGINT NOT NULL,
	fecha TIMESTAMP NOT NULL,
	CONSTRAINT Lector_LocalizacionPK PRIMARY KEY (idLector,idLocalizacion,fecha),
	CONSTRAINT Lector_LocalizacionLectorFK FOREIGN KEY (idLector)
		REFERENCES Lector(idLector),
	CONSTRAINT Lector_LocalizacionLocalizacionFK FOREIGN KEY (idLocalizacion)
		REFERENCES Localizacion(idLocalizacion));
		







	
	
	