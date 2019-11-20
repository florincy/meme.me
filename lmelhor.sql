--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)

-- Started on 2019-10-18 22:25:32 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13043)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 25458)
-- Name: foto; Type: TABLE; Schema: public; Owner: flo
--

CREATE TABLE public.foto (
    id integer NOT NULL,
    foto bytea,
    extensao character varying,
    id_usuario integer
);


ALTER TABLE public.foto OWNER TO flo;

--
-- TOC entry 198 (class 1259 OID 25480)
-- Name: sq_foto; Type: SEQUENCE; Schema: public; Owner: flo
--

CREATE SEQUENCE public.sq_foto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sq_foto OWNER TO flo;

--
-- TOC entry 199 (class 1259 OID 25482)
-- Name: sq_usuario; Type: SEQUENCE; Schema: public; Owner: flo
--

CREATE SEQUENCE public.sq_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sq_usuario OWNER TO flo;

--
-- TOC entry 197 (class 1259 OID 25461)
-- Name: usuario; Type: TABLE; Schema: public; Owner: flo
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying,
    senha character varying
);


ALTER TABLE public.usuario OWNER TO flo;

--
-- TOC entry 2922 (class 0 OID 25458)
-- Dependencies: 196
-- Data for Name: foto; Type: TABLE DATA; Schema: public; Owner: flo
--

COPY public.foto (id, foto, extensao, id_usuario) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 25461)
-- Dependencies: 197
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: flo
--

COPY public.usuario (id, nome, senha) FROM stdin;
50	a	a
100	w	w
150	b	b
\.


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 198
-- Name: sq_foto; Type: SEQUENCE SET; Schema: public; Owner: flo
--

SELECT pg_catalog.setval('public.sq_foto', 3, true);


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 199
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: flo
--

SELECT pg_catalog.setval('public.sq_usuario', 3, true);


--
-- TOC entry 2799 (class 2606 OID 25471)
-- Name: usuario chave; Type: CONSTRAINT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT chave PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 25473)
-- Name: foto pk_foto; Type: CONSTRAINT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.foto
    ADD CONSTRAINT pk_foto PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 25474)
-- Name: foto fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.foto
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


-- Completed on 2019-10-18 22:25:32 -03

--
-- PostgreSQL database dump complete
--

