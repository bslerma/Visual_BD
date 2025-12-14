--
-- PostgreSQL database dump
--

\restrict U2eTpU8VDrG3u6THAtEORdYmejTDJ5ugpASlmKnPwf4jZc7Oid2znMTpniH7BdR

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2025-12-12 22:56:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5102 (class 1262 OID 57357)
-- Name: db_veterinaria; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_veterinaria WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-CO';


ALTER DATABASE db_veterinaria OWNER TO postgres;

\unrestrict U2eTpU8VDrG3u6THAtEORdYmejTDJ5ugpASlmKnPwf4jZc7Oid2znMTpniH7BdR
\connect db_veterinaria
\restrict U2eTpU8VDrG3u6THAtEORdYmejTDJ5ugpASlmKnPwf4jZc7Oid2znMTpniH7BdR

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 232 (class 1259 OID 57615)
-- Name: citas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citas (
    id bigint NOT NULL,
    fecha date NOT NULL,
    hora time(0) without time zone NOT NULL,
    motivo text NOT NULL,
    diagnostico text NOT NULL,
    mascota_id bigint NOT NULL,
    veterinario_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.citas OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 57614)
-- Name: citas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.citas_id_seq OWNER TO postgres;

--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 231
-- Name: citas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citas_id_seq OWNED BY public.citas.id;


--
-- TOC entry 220 (class 1259 OID 57536)
-- Name: duenos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.duenos (
    id bigint NOT NULL,
    cedula character varying(15) NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.duenos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 57535)
-- Name: duenos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.duenos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.duenos_id_seq OWNER TO postgres;

--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 219
-- Name: duenos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.duenos_id_seq OWNED BY public.duenos.id;


--
-- TOC entry 236 (class 1259 OID 57662)
-- Name: duenos_telefonos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.duenos_telefonos (
    id bigint NOT NULL,
    dueno_id bigint NOT NULL,
    telefono_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.duenos_telefonos OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 57661)
-- Name: duenos_telefonos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.duenos_telefonos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.duenos_telefonos_id_seq OWNER TO postgres;

--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 235
-- Name: duenos_telefonos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.duenos_telefonos_id_seq OWNED BY public.duenos_telefonos.id;


--
-- TOC entry 222 (class 1259 OID 57547)
-- Name: mascotas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mascotas (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    especie character varying(255) NOT NULL,
    raza character varying(50) NOT NULL,
    fecha_naciemiento date NOT NULL,
    dueno_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.mascotas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 57546)
-- Name: mascotas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mascotas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mascotas_id_seq OWNER TO postgres;

--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 221
-- Name: mascotas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mascotas_id_seq OWNED BY public.mascotas.id;


--
-- TOC entry 226 (class 1259 OID 57576)
-- Name: medicamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicamentos (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.medicamentos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 57575)
-- Name: medicamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicamentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medicamentos_id_seq OWNER TO postgres;

--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 225
-- Name: medicamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicamentos_id_seq OWNED BY public.medicamentos.id;


--
-- TOC entry 234 (class 1259 OID 57641)
-- Name: recetas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recetas (
    id bigint NOT NULL,
    cita_id bigint NOT NULL,
    medicamento_id bigint NOT NULL,
    dosis character varying(30) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.recetas OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 57640)
-- Name: recetas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recetas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recetas_id_seq OWNER TO postgres;

--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 233
-- Name: recetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recetas_id_seq OWNED BY public.recetas.id;


--
-- TOC entry 228 (class 1259 OID 57588)
-- Name: telefonos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telefonos (
    id bigint NOT NULL,
    telefono character varying(15) NOT NULL,
    tipo character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT telefonos_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['Personal'::character varying, 'Auxiliar'::character varying, 'Acudiente'::character varying, 'Familiar'::character varying])::text[])))
);


ALTER TABLE public.telefonos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 57587)
-- Name: telefonos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.telefonos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.telefonos_id_seq OWNER TO postgres;

--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 227
-- Name: telefonos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.telefonos_id_seq OWNED BY public.telefonos.id;


--
-- TOC entry 230 (class 1259 OID 57599)
-- Name: vacunas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacunas (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    fecha date NOT NULL,
    mascota_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vacunas OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 57598)
-- Name: vacunas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vacunas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vacunas_id_seq OWNER TO postgres;

--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 229
-- Name: vacunas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vacunas_id_seq OWNED BY public.vacunas.id;


--
-- TOC entry 224 (class 1259 OID 57565)
-- Name: veterinarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veterinarios (
    id bigint NOT NULL,
    cedula character varying(15) NOT NULL,
    nombre character varying(50) NOT NULL,
    especialidad character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.veterinarios OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 57564)
-- Name: veterinarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veterinarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.veterinarios_id_seq OWNER TO postgres;

--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 223
-- Name: veterinarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veterinarios_id_seq OWNED BY public.veterinarios.id;


--
-- TOC entry 4902 (class 2604 OID 57618)
-- Name: citas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas ALTER COLUMN id SET DEFAULT nextval('public.citas_id_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 57539)
-- Name: duenos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duenos ALTER COLUMN id SET DEFAULT nextval('public.duenos_id_seq'::regclass);


--
-- TOC entry 4904 (class 2604 OID 57665)
-- Name: duenos_telefonos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duenos_telefonos ALTER COLUMN id SET DEFAULT nextval('public.duenos_telefonos_id_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 57550)
-- Name: mascotas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascotas ALTER COLUMN id SET DEFAULT nextval('public.mascotas_id_seq'::regclass);


--
-- TOC entry 4899 (class 2604 OID 57579)
-- Name: medicamentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamentos ALTER COLUMN id SET DEFAULT nextval('public.medicamentos_id_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 57644)
-- Name: recetas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas ALTER COLUMN id SET DEFAULT nextval('public.recetas_id_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 57591)
-- Name: telefonos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefonos ALTER COLUMN id SET DEFAULT nextval('public.telefonos_id_seq'::regclass);


--
-- TOC entry 4901 (class 2604 OID 57602)
-- Name: vacunas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunas ALTER COLUMN id SET DEFAULT nextval('public.vacunas_id_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 57568)
-- Name: veterinarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veterinarios ALTER COLUMN id SET DEFAULT nextval('public.veterinarios_id_seq'::regclass);


--
-- TOC entry 5092 (class 0 OID 57615)
-- Dependencies: 232
-- Data for Name: citas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citas (id, fecha, hora, motivo, diagnostico, mascota_id, veterinario_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5080 (class 0 OID 57536)
-- Dependencies: 220
-- Data for Name: duenos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.duenos (id, cedula, nombre, direccion, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5096 (class 0 OID 57662)
-- Dependencies: 236
-- Data for Name: duenos_telefonos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.duenos_telefonos (id, dueno_id, telefono_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5082 (class 0 OID 57547)
-- Dependencies: 222
-- Data for Name: mascotas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mascotas (id, nombre, especie, raza, fecha_naciemiento, dueno_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5086 (class 0 OID 57576)
-- Dependencies: 226
-- Data for Name: medicamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicamentos (id, nombre, descripcion, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5094 (class 0 OID 57641)
-- Dependencies: 234
-- Data for Name: recetas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recetas (id, cita_id, medicamento_id, dosis, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5088 (class 0 OID 57588)
-- Dependencies: 228
-- Data for Name: telefonos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.telefonos (id, telefono, tipo, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5090 (class 0 OID 57599)
-- Dependencies: 230
-- Data for Name: vacunas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacunas (id, nombre, fecha, mascota_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5084 (class 0 OID 57565)
-- Dependencies: 224
-- Data for Name: veterinarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veterinarios (id, cedula, nombre, especialidad, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 231
-- Name: citas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citas_id_seq', 1, false);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 219
-- Name: duenos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.duenos_id_seq', 1, false);


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 235
-- Name: duenos_telefonos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.duenos_telefonos_id_seq', 1, false);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 221
-- Name: mascotas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mascotas_id_seq', 1, false);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 225
-- Name: medicamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicamentos_id_seq', 1, false);


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 233
-- Name: recetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recetas_id_seq', 1, false);


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 227
-- Name: telefonos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.telefonos_id_seq', 1, false);


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 229
-- Name: vacunas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vacunas_id_seq', 1, false);


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 223
-- Name: veterinarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veterinarios_id_seq', 1, false);


--
-- TOC entry 4919 (class 2606 OID 57629)
-- Name: citas citas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id);


--
-- TOC entry 4907 (class 2606 OID 57545)
-- Name: duenos duenos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duenos
    ADD CONSTRAINT duenos_pkey PRIMARY KEY (id);


--
-- TOC entry 4923 (class 2606 OID 57670)
-- Name: duenos_telefonos duenos_telefonos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duenos_telefonos
    ADD CONSTRAINT duenos_telefonos_pkey PRIMARY KEY (id);


--
-- TOC entry 4909 (class 2606 OID 57558)
-- Name: mascotas mascotas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascotas
    ADD CONSTRAINT mascotas_pkey PRIMARY KEY (id);


--
-- TOC entry 4913 (class 2606 OID 57586)
-- Name: medicamentos medicamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT medicamentos_pkey PRIMARY KEY (id);


--
-- TOC entry 4921 (class 2606 OID 57650)
-- Name: recetas recetas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas
    ADD CONSTRAINT recetas_pkey PRIMARY KEY (id);


--
-- TOC entry 4915 (class 2606 OID 57597)
-- Name: telefonos telefonos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefonos
    ADD CONSTRAINT telefonos_pkey PRIMARY KEY (id);


--
-- TOC entry 4917 (class 2606 OID 57608)
-- Name: vacunas vacunas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunas
    ADD CONSTRAINT vacunas_pkey PRIMARY KEY (id);


--
-- TOC entry 4911 (class 2606 OID 57574)
-- Name: veterinarios veterinarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veterinarios
    ADD CONSTRAINT veterinarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4926 (class 2606 OID 57630)
-- Name: citas citas_mascota_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_mascota_id_foreign FOREIGN KEY (mascota_id) REFERENCES public.mascotas(id) ON DELETE CASCADE;


--
-- TOC entry 4927 (class 2606 OID 57635)
-- Name: citas citas_veterinario_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_veterinario_id_foreign FOREIGN KEY (veterinario_id) REFERENCES public.veterinarios(id) ON DELETE CASCADE;


--
-- TOC entry 4930 (class 2606 OID 57671)
-- Name: duenos_telefonos duenos_telefonos_dueno_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duenos_telefonos
    ADD CONSTRAINT duenos_telefonos_dueno_id_foreign FOREIGN KEY (dueno_id) REFERENCES public.duenos(id) ON DELETE CASCADE;


--
-- TOC entry 4931 (class 2606 OID 57676)
-- Name: duenos_telefonos duenos_telefonos_telefono_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duenos_telefonos
    ADD CONSTRAINT duenos_telefonos_telefono_id_foreign FOREIGN KEY (telefono_id) REFERENCES public.telefonos(id) ON DELETE CASCADE;


--
-- TOC entry 4924 (class 2606 OID 57559)
-- Name: mascotas mascotas_dueno_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascotas
    ADD CONSTRAINT mascotas_dueno_id_foreign FOREIGN KEY (dueno_id) REFERENCES public.duenos(id) ON DELETE CASCADE;


--
-- TOC entry 4928 (class 2606 OID 57651)
-- Name: recetas recetas_cita_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas
    ADD CONSTRAINT recetas_cita_id_foreign FOREIGN KEY (cita_id) REFERENCES public.citas(id) ON DELETE CASCADE;


--
-- TOC entry 4929 (class 2606 OID 57656)
-- Name: recetas recetas_medicamento_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recetas
    ADD CONSTRAINT recetas_medicamento_id_foreign FOREIGN KEY (medicamento_id) REFERENCES public.medicamentos(id) ON DELETE CASCADE;


--
-- TOC entry 4925 (class 2606 OID 57609)
-- Name: vacunas vacunas_mascota_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunas
    ADD CONSTRAINT vacunas_mascota_id_foreign FOREIGN KEY (mascota_id) REFERENCES public.mascotas(id) ON DELETE CASCADE;


-- Completed on 2025-12-12 22:56:05

--
-- PostgreSQL database dump complete
--

\unrestrict U2eTpU8VDrG3u6THAtEORdYmejTDJ5ugpASlmKnPwf4jZc7Oid2znMTpniH7BdR

