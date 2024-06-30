--Tabla de tipo de usuario
CREATE TABLE TipoUsuario (
ID_Tipo_Usuario NUMERIC primary key,
Nombre_Tipo_Usuario VARCHAR2(50) not null
);

CREATE SEQUENCE TipoUsuarioSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoTipoUsuario
BEFORE INSERT ON TipoUsuario
for EACH ROW
BEGIN
SELECT TipoUsuarioSEQ.NEXTVAL INTO : NEW.ID_Tipo_Usuario FROM DUAL ;
END;

--Tabla del estado del equipo
CREATE TABLE EstadoEquipo (
ID_Estado_Equipo NUMERIC primary key,
Estado_Equipo VARCHAR2(50) not null
);

CREATE SEQUENCE EstadoEquipoSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoEstadoEquipo
BEFORE INSERT ON EstadoEquipo
for EACH ROW
BEGIN
SELECT EstadoEquipoSEQ.NEXTVAL INTO : NEW.ID_Estado_Equipo FROM DUAL ;
END;

--Tabla del estado del jugador
CREATE TABLE EstadoJugador (
ID_Estado_Jugador NUMERIC primary key,
Estado_Jugador VARCHAR2(50) not null
);

CREATE SEQUENCE EstadoJugadorSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoEstadoJugador
BEFORE INSERT ON EstadoJugador
for EACH ROW
BEGIN
SELECT EstadoJugadorSEQ.NEXTVAL INTO : NEW.ID_Estado_Jugador FROM DUAL ;
END;

--Tabla del tipo de deporte
CREATE TABLE TipoDeporte (
ID_Tipo_Deporte NUMERIC primary key,
Nombre_Tipo_Deporte VARCHAR2(50) not null
);

CREATE SEQUENCE TipoDeporteSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoTipoDeporte
BEFORE INSERT ON TipoDeporte
for EACH ROW
BEGIN
SELECT TipoDeporteSEQ.NEXTVAL INTO : NEW.ID_Tipo_Deporte FROM DUAL ;
END;

--Tabla del tipo de partido
CREATE TABLE TipoPartido (
ID_Tipo_Partido NUMERIC primary key,
Tipo_Partido VARCHAR2(50) not null
);

CREATE SEQUENCE TipoPartidoSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoTipoPartido
BEFORE INSERT ON TipoPartido
for EACH ROW
BEGIN
SELECT TipoPartidoSEQ.NEXTVAL INTO : NEW.ID_Tipo_Partido FROM DUAL ;
END;

--TABLA USUARIOS
CREATE TABLE Usuarios (
ID_Usuario NUMERIC PRIMARY KEY,
User_name VARCHAR2(50) not null unique,
Contraseña_Usuario VARCHAR2(50) not null,
Nombre_Usuario VARCHAR2(50) not null,
Apellido_Usuario VARCHAR2(50) not null,
Correo_Usuario VARCHAR2(50) not null unique,
Teléfono_Usuario VARCHAR2(50) not null,
Género_Usuario VARCHAR2(50) not null,
FNacimiento_Usuario DATE NOT NULL,
Edad_Usuario VARCHAR2(50) not null,
Altura_Usuario VARCHAR2(50) not null,
Peso_Usuario VARCHAR2(50) not null,
ID_Tipo_Usuario NUMERIC,

constraint fk_Tipo_Usuario
foreign key (ID_Tipo_Usuario)
references TipoUsuario(ID_Tipo_Usuario)
);

CREATE SEQUENCE UsuarioSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoUsuario
BEFORE INSERT ON Usuario
for EACH ROW
BEGIN
SELECT UsuarioSEQ.NEXTVAL INTO : NEW.ID_Usuario FROM DUAL ;
END;

--Tabla del torneo
CREATE TABLE Torneo (
ID_Torneo NUMERIC primary key,
Nombre_Torneo VARCHAR2(50) not null,
Ubicación_Torneo VARCHAR2(50) not null,
Descripción_Torneo VARCHAR2(50) not null,
Estado_Toneo VARCHAR2(50) not null,
ID_Tipo_Deporte NUMERIC, 
ID_Usuario NUMERIC,

constraint fk_Tipo_Deporte
foreign key (ID_Tipo_Deporte)
references TipoDeporte(ID_Tipo_Deporte),

constraint fk_ID_Usuario
foreign key (ID_Usuario)
references Usuario(ID_Usuario)
);

CREATE SEQUENCE TorneoSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoTorneo
BEFORE INSERT ON Torneo
for EACH ROW
BEGIN
SELECT TorneoSEQ.NEXTVAL INTO : NEW.ID_Torneo FROM DUAL ;
END;

--Tabla del árbitro
CREATE TABLE Arbitro (
ID_Arbitro NUMERIC primary key,
Nombre_Arbitro VARCHAR2(50) not null,
Apellido_Arbitro VARCHAR2(50) not null,
Edad_Arbitro VARCHAR2(50) not null,
Teléfono_Arbitro VARCHAR2(50) not null,
ID_Torneo NUMERIC,

constraint fk_ID_Torneo
foreign key (ID_Torneo)
references Torneo(ID_Torneo)
);

CREATE SEQUENCE ArbitroSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoArbitro
BEFORE INSERT ON Arbitro
for EACH ROW
BEGIN
SELECT ArbitroSEQ.NEXTVAL INTO : NEW.ID_Arbitro FROM DUAL ;
END;

--Tabla de equipo
CREATE TABLE Equipo (
ID_Equipo NUMERIC primary key,
Nombre_Equipo VARCHAR2(50) not null,
Descripción_Equipo VARCHAR2(50) not null,
Lugar_Equipo VARCHAR2(50) not null,
ID_Torneo NUMERIC,
ID_Tipo_Deporte NUMERIC, 
ID_Usuario NUMERIC,
ID_Estado_Equipo NUMERIC,

constraint fk_ID_TorneoEquipo
foreign key (ID_Torneo)
references Torneo(ID_Torneo),

constraint fk_Tipo_DeporteEquipo
foreign key (ID_Tipo_Deporte)
references TipoDeporte(ID_Tipo_Deporte),

constraint fk_ID_UsuarioEquipo
foreign key (ID_Usuario)
references Usuario(ID_Usuario),

constraint fk_Estado_Equipo
foreign key (ID_Estado_Equipo)
references EstadoEquipo(ID_Estado_Equipo)
);

CREATE SEQUENCE EquipoSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoEquipo
BEFORE INSERT ON Equipo
for EACH ROW
BEGIN
SELECT EquipoSEQ.NEXTVAL INTO : NEW.ID_Equipo FROM DUAL ;
END;

--Tabla del torneo - equipo
CREATE TABLE TorneoEquipo (
ID_TorneoEquipo NUMERIC primary key,
ID_Torneo NUMERIC,
ID_Equipo NUMERIC, 

constraint fk_ID_TorneoTorneoEquipo
foreign key (ID_Torneo)
references Torneo(ID_Torneo),

constraint fk_ID_EquipoTorneoEquipo
foreign key (ID_Equipo)
references Equipo(ID_Equipo)
);

CREATE SEQUENCE TorneoEquipoSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoTorneoEquipo
BEFORE INSERT ON TorneoEquipo
for EACH ROW
BEGIN
SELECT TorneoEquipoSEQ.NEXTVAL INTO : NEW.ID_TorneoEquipo FROM DUAL ;
END;

--Tabla del jugador
CREATE TABLE Jugador (
ID_Jugador NUMERIC primary key,
Nombre_Jugador VARCHAR2(50) not null,
Apellido_Jugador VARCHAR2(50) not null, 
FNacimiento_Jugador DATE not null,
Edad_Jugador VARCHAR2(50) not null,
Teléfono_Jugador VARCHAR2(50) not null,
Número_Jugador NUMERIC not null,
Posición_Jugador VARCHAR2(50) not null,
ID_Equipo NUMERIC,
ID_Estado_Jugador NUMERIC,

constraint fk_ID_EquipoJugador
foreign key (ID_Equipo)
references Equipo(ID_Equipo),

constraint fk_Estado_Jugador
foreign key (ID_Estado_Jugador)
references EstadoJugador(ID_Estado_Jugador)
);

CREATE SEQUENCE JugadorSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoJugador
BEFORE INSERT ON Jugador
for EACH ROW
BEGIN
SELECT JugadorSEQ.NEXTVAL INTO : NEW.ID_Jugador FROM DUAL ;
END;



--Tabla del partido
CREATE TABLE Partido (
ID_Partido NUMERIC primary key,
Nombre_Equipo1 VARCHAR2(50) not null, 
Nombre_Equipo2 VARCHAR2(50) not null, 
Fecha_Partido DATE not null,
Lugar_Partido VARCHAR2(50) not null,
Hora_Partido VARCHAR2(50) not null,
Marcador_Equipo1 NUMERIC not null,
Marcador_Equipo2 NUMERIC not null,
ID_Tipo_Partido NUMERIC, 
ID_Arbitro NUMERIC, 

constraint fk_ID_Tipo_Partido
foreign key (ID_Tipo_Partido)
references TipoPartido(ID_Tipo_Partido),

constraint fk_ID_ArbitroPartido
foreign key (ID_Arbitro)
references Arbitro(ID_Arbitro)
);

CREATE SEQUENCE PartidoSEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TrigoPartido
BEFORE INSERT ON Partido
for EACH ROW
BEGIN
SELECT PartidoSEQ.NEXTVAL INTO : NEW.ID_Partido FROM DUAL ;
END;

