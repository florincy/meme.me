--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-11-18 15:59:31 BRST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 58744)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comment (
    cd_comment integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer,
    ds_comment character varying
);


ALTER TABLE comment OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 58747)
-- Name: complaint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE complaint (
    cd_complaint integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer,
    adm_cd_user_adm integer,
    ds_description text
);


ALTER TABLE complaint OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 58753)
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE follow (
    cd_follow integer NOT NULL,
    follower_cd_user_meme integer,
    followed_cd_user_meme integer
);


ALTER TABLE follow OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 58756)
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE likes (
    cd_like integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE likes OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 58759)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE post (
    cd_post integer NOT NULL,
    user_cd_user_meme integer,
    ts_moments timestamp with time zone,
    ds_post character varying,
    bb_photo bytea,
    nm_extension character varying
);


ALTER TABLE post OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 58765)
-- Name: share; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE share (
    cd_share integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE share OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 58866)
-- Name: sq_cd_comment; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_cd_comment
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_cd_comment OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 58768)
-- Name: sq_cd_postagem; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_cd_postagem
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_cd_postagem OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 58770)
-- Name: sq_cd_user_adm; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_cd_user_adm
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_cd_user_adm OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 58772)
-- Name: sq_cd_user_meme; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_cd_user_meme
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_cd_user_meme OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 58774)
-- Name: sq_user_meme_not; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_user_meme_not
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_user_meme_not OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 58776)
-- Name: user_adm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_adm (
    cd_user_adm integer NOT NULL,
    nm_first character varying,
    nm_last character varying,
    ds_nick character varying,
    ds_email character varying,
    ds_password character varying,
    ds_country character varying,
    nm_birth character varying
);


ALTER TABLE user_adm OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 58782)
-- Name: user_meme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_meme (
    cd_user_meme integer NOT NULL,
    nm_first character varying,
    nm_last character varying,
    ds_nick character varying,
    ds_email character varying,
    ds_country character varying,
    ds_bios text,
    ds_password character varying,
    tp_private boolean,
    nm_birth character varying,
    bb_photo bytea,
    nm_extension character varying
);


ALTER TABLE user_meme OWNER TO postgres;

--
-- TOC entry 2203 (class 0 OID 58744)
-- Dependencies: 181
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2204 (class 0 OID 58747)
-- Dependencies: 182
-- Data for Name: complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2205 (class 0 OID 58753)
-- Dependencies: 183
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2206 (class 0 OID 58756)
-- Dependencies: 184
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2207 (class 0 OID 58759)
-- Dependencies: 185
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2208 (class 0 OID 58765)
-- Dependencies: 186
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 193
-- Name: sq_cd_comment; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_cd_comment', 4, true);


--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 187
-- Name: sq_cd_postagem; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_cd_postagem', 1, false);


--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 188
-- Name: sq_cd_user_adm; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_cd_user_adm', 2, true);


--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 189
-- Name: sq_cd_user_meme; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_cd_user_meme', 34, true);


--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 190
-- Name: sq_user_meme_not; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_user_meme_not', 1, false);


--
-- TOC entry 2213 (class 0 OID 58776)
-- Dependencies: 191
-- Data for Name: user_adm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2214 (class 0 OID 58782)
-- Dependencies: 192
-- Data for Name: user_meme; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2061 (class 2606 OID 58789)
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (cd_comment);


--
-- TOC entry 2063 (class 2606 OID 58791)
-- Name: complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_pkey PRIMARY KEY (cd_complaint);


--
-- TOC entry 2066 (class 2606 OID 58793)
-- Name: follow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (cd_follow);


--
-- TOC entry 2068 (class 2606 OID 58795)
-- Name: like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT like_pkey PRIMARY KEY (cd_like);


--
-- TOC entry 2070 (class 2606 OID 58797)
-- Name: post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_pkey PRIMARY KEY (cd_post);


--
-- TOC entry 2072 (class 2606 OID 58799)
-- Name: share_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share
    ADD CONSTRAINT share_pkey PRIMARY KEY (cd_share);


--
-- TOC entry 2074 (class 2606 OID 58801)
-- Name: user_adm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_adm
    ADD CONSTRAINT user_adm_pkey PRIMARY KEY (cd_user_adm);


--
-- TOC entry 2076 (class 2606 OID 58803)
-- Name: user_meme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_meme
    ADD CONSTRAINT user_meme_pkey PRIMARY KEY (cd_user_meme);


--
-- TOC entry 2064 (class 1259 OID 58804)
-- Name: fki_followed_user_cd_user_meme_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_followed_user_cd_user_meme_fkey ON follow USING btree (followed_cd_user_meme);


--
-- TOC entry 2077 (class 2606 OID 58805)
-- Name: comment_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2078 (class 2606 OID 58810)
-- Name: comment_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2079 (class 2606 OID 58815)
-- Name: complaint_adm_cd_user_adm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_adm_cd_user_adm_fkey FOREIGN KEY (adm_cd_user_adm) REFERENCES user_adm(cd_user_adm);


--
-- TOC entry 2080 (class 2606 OID 58820)
-- Name: complaint_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2081 (class 2606 OID 58825)
-- Name: complaint_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2082 (class 2606 OID 58830)
-- Name: follow_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT follow_user_cd_user_meme_fkey FOREIGN KEY (follower_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2083 (class 2606 OID 58835)
-- Name: followed_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT followed_user_cd_user_meme_fkey FOREIGN KEY (followed_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2084 (class 2606 OID 58840)
-- Name: like_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT like_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2085 (class 2606 OID 58845)
-- Name: like_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT like_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2086 (class 2606 OID 58850)
-- Name: post_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2087 (class 2606 OID 58855)
-- Name: share_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share
    ADD CONSTRAINT share_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2088 (class 2606 OID 58860)
-- Name: share_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share
    ADD CONSTRAINT share_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-11-18 15:59:32 BRST

--
-- PostgreSQL database dump complete
--

