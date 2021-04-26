
CREATE SEQUENCE public.equipo_equipo_id_seq_2;

CREATE TABLE public.equipo (
                equipo_id INTEGER NOT NULL DEFAULT nextval('public.equipo_equipo_id_seq_2'),
                equipo_nombre VARCHAR NOT NULL,
                CONSTRAINT equipo_id PRIMARY KEY (equipo_id)
);


ALTER SEQUENCE public.equipo_equipo_id_seq_2 OWNED BY public.equipo.equipo_id;

CREATE SEQUENCE public.tipomodalidad_tipomodalidad_id_seq;

CREATE TABLE public.tipomodalidad (
                tipomodalidad_id VARCHAR NOT NULL DEFAULT nextval('public.tipomodalidad_tipomodalidad_id_seq'),
                tipo_modalidad_resultado VARCHAR NOT NULL,
                tipo_modalidad_resultado_1 VARCHAR NOT NULL,
                CONSTRAINT tipomodalidad_id PRIMARY KEY (tipomodalidad_id)
);


ALTER SEQUENCE public.tipomodalidad_tipomodalidad_id_seq OWNED BY public.tipomodalidad.tipomodalidad_id;

CREATE SEQUENCE public.modalidad_modalidad_id_seq_1;

CREATE TABLE public.modalidad (
                modalidad_id INTEGER NOT NULL DEFAULT nextval('public.modalidad_modalidad_id_seq_1'),
                modalidad_des VARCHAR NOT NULL,
                tipomodalidad_id VARCHAR NOT NULL,
                CONSTRAINT modalidad_id PRIMARY KEY (modalidad_id)
);


ALTER SEQUENCE public.modalidad_modalidad_id_seq_1 OWNED BY public.modalidad.modalidad_id;

CREATE SEQUENCE public.usuario_usuario_id_seq_1;

CREATE TABLE public.usuario (
                usuario_id VARCHAR NOT NULL DEFAULT nextval('public.usuario_usuario_id_seq_1'),
                usuario_saldo INTEGER NOT NULL,
                usuario_nombre VARCHAR NOT NULL,
                usuario_contrasena VARCHAR NOT NULL,
                usuario_email VARCHAR NOT NULL,
                CONSTRAINT usuario_id PRIMARY KEY (usuario_id)
);


ALTER SEQUENCE public.usuario_usuario_id_seq_1 OWNED BY public.usuario.usuario_id;

CREATE TABLE public.partido (
                partido_id VARCHAR NOT NULL,
                partido_fecha DATE NOT NULL,
                equipo_id INTEGER NOT NULL,
                partido_fin VARCHAR NOT NULL,
                equipo_equipo_id INTEGER NOT NULL,
                CONSTRAINT partido_id PRIMARY KEY (partido_id)
);


CREATE SEQUENCE public.apuesta_apuesta_id_seq;

CREATE TABLE public.apuesta (
                apuesta_id INTEGER NOT NULL DEFAULT nextval('public.apuesta_apuesta_id_seq'),
                apuesta_fecha DATE NOT NULL,
                apuesta_apuesta INTEGER NOT NULL,
                apuesta_monto VARCHAR NOT NULL,
                apuesta_estado VARCHAR NOT NULL,
                partido_id VARCHAR NOT NULL,
                usuario_id VARCHAR NOT NULL,
                CONSTRAINT apuesta_id PRIMARY KEY (apuesta_id)
);


ALTER SEQUENCE public.apuesta_apuesta_id_seq OWNED BY public.apuesta.apuesta_id;

CREATE SEQUENCE public.resultado_resultado_id_seq;

CREATE TABLE public.resultado (
                resultado_id INTEGER NOT NULL DEFAULT nextval('public.resultado_resultado_id_seq'),
                modalidad_id INTEGER NOT NULL,
                resultado_resultado VARCHAR NOT NULL,
                partido_id VARCHAR NOT NULL,
                CONSTRAINT resultado_id PRIMARY KEY (resultado_id, modalidad_id)
);


ALTER SEQUENCE public.resultado_resultado_id_seq OWNED BY public.resultado.resultado_id;

CREATE SEQUENCE public.temporada_temporada_id_seq;

CREATE TABLE public.temporada (
                temporada_id INTEGER NOT NULL DEFAULT nextval('public.temporada_temporada_id_seq'),
                temporada_descripcion VARCHAR NOT NULL,
                CONSTRAINT temporada_id PRIMARY KEY (temporada_id)
);


ALTER SEQUENCE public.temporada_temporada_id_seq OWNED BY public.temporada.temporada_id;

CREATE SEQUENCE public.jornada_jornada_id_seq;

CREATE TABLE public.jornada (
                jornada_id INTEGER NOT NULL DEFAULT nextval('public.jornada_jornada_id_seq'),
                jornada_des VARCHAR NOT NULL,
                temporada_id INTEGER NOT NULL,
                partido_id VARCHAR NOT NULL,
                CONSTRAINT jornada_id PRIMARY KEY (jornada_id)
);


ALTER SEQUENCE public.jornada_jornada_id_seq OWNED BY public.jornada.jornada_id;

CREATE SEQUENCE public.competicion_competicion_id_seq;

CREATE TABLE public.competicion (
                competicion_id INTEGER NOT NULL DEFAULT nextval('public.competicion_competicion_id_seq'),
                comp_des VARCHAR NOT NULL,
                jornada_id INTEGER NOT NULL,
                CONSTRAINT competicion_id PRIMARY KEY (competicion_id)
);


ALTER SEQUENCE public.competicion_competicion_id_seq OWNED BY public.competicion.competicion_id;

CREATE SEQUENCE public.jugador_jugador_id_seq;

CREATE TABLE public.jugador (
                jugador_id INTEGER NOT NULL DEFAULT nextval('public.jugador_jugador_id_seq'),
                jugador_nombre VARCHAR NOT NULL,
                CONSTRAINT jugador_id PRIMARY KEY (jugador_id)
);


ALTER SEQUENCE public.jugador_jugador_id_seq OWNED BY public.jugador.jugador_id;

CREATE SEQUENCE public.juega_juega_id_seq;

CREATE TABLE public.juega (
                juega_id INTEGER NOT NULL DEFAULT nextval('public.juega_juega_id_seq'),
                partido_id VARCHAR NOT NULL,
                jugador_id INTEGER NOT NULL,
                CONSTRAINT juega_id PRIMARY KEY (juega_id)
);


ALTER SEQUENCE public.juega_juega_id_seq OWNED BY public.juega.juega_id;

CREATE TABLE public.gol (
                gol_id INTEGER NOT NULL,
                gol_timepo DATE,
                partido_id VARCHAR NOT NULL,
                jugador_id INTEGER NOT NULL,
                equipo_id INTEGER NOT NULL,
                CONSTRAINT gol_id PRIMARY KEY (gol_id)
);


CREATE SEQUENCE public.juegoeqtemp_juegoeqtemp_id_seq;

CREATE TABLE public.juegoeqtemp (
                juegoeqtemp_id INTEGER NOT NULL DEFAULT nextval('public.juegoeqtemp_juegoeqtemp_id_seq'),
                jugador_id INTEGER NOT NULL,
                equipo_id INTEGER NOT NULL,
                temporada_id INTEGER NOT NULL,
                CONSTRAINT juego_eq_temp_id PRIMARY KEY (juegoeqtemp_id)
);


ALTER SEQUENCE public.juegoeqtemp_juegoeqtemp_id_seq OWNED BY public.juegoeqtemp.juegoeqtemp_id;

ALTER TABLE public.juegoeqtemp ADD CONSTRAINT equipo_juego_eq_temp_fk
FOREIGN KEY (equipo_id)
REFERENCES public.equipo (equipo_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.partido ADD CONSTRAINT equipo_partido_fk
FOREIGN KEY (equipo_id)
REFERENCES public.equipo (equipo_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.partido ADD CONSTRAINT equipo_partido_fk1
FOREIGN KEY (equipo_equipo_id)
REFERENCES public.equipo (equipo_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.gol ADD CONSTRAINT equipo_gol_fk
FOREIGN KEY (equipo_id)
REFERENCES public.equipo (equipo_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.modalidad ADD CONSTRAINT tipomodalidad_modalidad_fk
FOREIGN KEY (tipomodalidad_id)
REFERENCES public.tipomodalidad (tipomodalidad_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.resultado ADD CONSTRAINT modalidad_resultado_fk
FOREIGN KEY (modalidad_id)
REFERENCES public.modalidad (modalidad_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.apuesta ADD CONSTRAINT usuario_apuesta_fk
FOREIGN KEY (usuario_id)
REFERENCES public.usuario (usuario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.jornada ADD CONSTRAINT partido_jornada_fk
FOREIGN KEY (partido_id)
REFERENCES public.partido (partido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.juega ADD CONSTRAINT partido_juega_fk
FOREIGN KEY (partido_id)
REFERENCES public.partido (partido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.gol ADD CONSTRAINT partido_gol_fk
FOREIGN KEY (partido_id)
REFERENCES public.partido (partido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.resultado ADD CONSTRAINT partido_resultado_fk
FOREIGN KEY (partido_id)
REFERENCES public.partido (partido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.apuesta ADD CONSTRAINT partido_apuesta_fk
FOREIGN KEY (partido_id)
REFERENCES public.partido (partido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.juegoeqtemp ADD CONSTRAINT temporada_juego_eq_temp_fk
FOREIGN KEY (temporada_id)
REFERENCES public.temporada (temporada_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.jornada ADD CONSTRAINT temporada_jornada_fk
FOREIGN KEY (temporada_id)
REFERENCES public.temporada (temporada_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.competicion ADD CONSTRAINT jornada_competicion_fk
FOREIGN KEY (jornada_id)
REFERENCES public.jornada (jornada_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.juegoeqtemp ADD CONSTRAINT jugador_juego_eq_temp_fk
FOREIGN KEY (jugador_id)
REFERENCES public.jugador (jugador_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.gol ADD CONSTRAINT jugador_gol_fk
FOREIGN KEY (jugador_id)
REFERENCES public.jugador (jugador_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.juega ADD CONSTRAINT jugador_juega_fk
FOREIGN KEY (jugador_id)
REFERENCES public.jugador (jugador_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;