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

