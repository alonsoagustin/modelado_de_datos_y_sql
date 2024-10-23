CREATE SCHEMA IF NOT EXISTS "videoclub_iaalonso";

SET SCHEMA 'videoclub_iaalonso';


CREATE TABLE IF NOT EXISTS socio(
    id SERIAL PRIMARY KEY,
    dni_pasaporte VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS telefono(
    id_socio INTEGER PRIMARY KEY,
    telefono VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS domicilio(
    id_socio INTEGER PRIMARY KEY,
    codigo_postal VARCHAR(20) NOT NULL,
    calle VARCHAR(50) NOT NULL,
    numero VARCHAR(50)NOT NULL,
    piso VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS pelicula(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    sinopsis TEXT NULL
);

CREATE TABLE IF NOT EXISTS copia(
    id SERIAL PRIMARY KEY,
    id_pelicula INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS alquiler(
id SERIAL PRIMARY KEY,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NULL,
id_socio INTEGER NOT NULL,
id_copia INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS pelicula_director(
id SERIAL PRIMARY KEY,
id_pelicula INTEGER NOT NULL,
id_director INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS director(
id SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
nacionalidad VARCHAR(50) NULL,
fecha_nacimiento DATE NULL
);

CREATE TABLE IF NOT EXISTS pelicula_genero(
id SERIAL PRIMARY KEY,
id_pelicula INTEGER NOT NULL,
id_genero INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS genero(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

ALTER TABLE copia
ADD CONSTRAINT fk_copia_pelicula
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id);

ALTER TABLE domicilio
ADD CONSTRAINT fk_domicilio_socio
FOREIGN KEY (id_socio) REFERENCES socio(id);

ALTER TABLE telefono
ADD CONSTRAINT fk_telefono_socio
FOREIGN KEY (id_socio) REFERENCES socio(id);

ALTER TABLE alquiler
ADD CONSTRAINT fk_alquiler_socio
FOREIGN KEY (id_socio) REFERENCES socio(id);

ALTER TABLE alquiler
ADD CONSTRAINT fk_alquiler_copia
FOREIGN KEY (id_copia) REFERENCES copia(id);

ALTER TABLE pelicula_director
ADD CONSTRAINT fk_pd_pelicula
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id);

ALTER TABLE pelicula_director
ADD CONSTRAINT fk_pd_director
FOREIGN KEY (id_director) REFERENCES director(id);

ALTER TABLE pelicula_genero
ADD CONSTRAINT fk_pg_pelicula
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id);

ALTER TABLE pelicula_genero
ADD CONSTRAINT fk_pg_genero
FOREIGN KEY (id_genero) REFERENCES genero(id);

CREATE TABLE tmp_videoclub (
	id_copia INTEGER NULL,
	fecha_alquiler_texto DATE NULL,
	dni VARCHAR(50) NULL,
	nombre VARCHAR(50) NULL,
	apellido_1 VARCHAR(50) NULL,
	apellido_2 VARCHAR(50) NULL,
	email VARCHAR(50) NULL,
	telefono VARCHAR(50) NULL,
	codigo_postal VARCHAR(15) NULL,
	fecha_nacimiento VARCHAR(50) NULL,
	numero VARCHAR(5) NULL,
	piso VARCHAR(5) NULL,
	letra VARCHAR(5) NULL,
	calle VARCHAR(50) NULL,
	ext VARCHAR(50) NULL,
	titulo VARCHAR(500) NULL,
	genero VARCHAR(50) NULL,
	sinopsis TEXT NULL,
	director VARCHAR(100) NULL,
	fecha_alquiler DATE NULL,
	fecha_devolucion DATE NULL
);

