--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-11-05 13:13:57 BRST

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
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 25092)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comment (
    cd_comment integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE comment OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 25095)
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
-- TOC entry 183 (class 1259 OID 25101)
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE follow (
    cd_follow integer NOT NULL,
    follower_cd_user_meme integer,
    followed_cd_user_meme integer
);


ALTER TABLE follow OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 25104)
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE likes (
    cd_like integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE likes OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 25107)
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
-- TOC entry 186 (class 1259 OID 25113)
-- Name: share; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE share (
    cd_share integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE share OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 25116)
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
-- TOC entry 192 (class 1259 OID 25211)
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
-- TOC entry 188 (class 1259 OID 25118)
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
-- TOC entry 189 (class 1259 OID 25120)
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
-- TOC entry 190 (class 1259 OID 25122)
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
-- TOC entry 191 (class 1259 OID 25128)
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
-- TOC entry 2200 (class 0 OID 25092)
-- Dependencies: 181
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment (cd_comment, post_cd_post, user_cd_user_meme) FROM stdin;
\.


--
-- TOC entry 2201 (class 0 OID 25095)
-- Dependencies: 182
-- Data for Name: complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY complaint (cd_complaint, post_cd_post, user_cd_user_meme, adm_cd_user_adm, ds_description) FROM stdin;
\.


--
-- TOC entry 2202 (class 0 OID 25101)
-- Dependencies: 183
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY follow (cd_follow, follower_cd_user_meme, followed_cd_user_meme) FROM stdin;
\.


--
-- TOC entry 2203 (class 0 OID 25104)
-- Dependencies: 184
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY likes (cd_like, post_cd_post, user_cd_user_meme) FROM stdin;
\.


--
-- TOC entry 2204 (class 0 OID 25107)
-- Dependencies: 185
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY post (cd_post, user_cd_user_meme, ts_moments, ds_post, bb_photo, nm_extension) FROM stdin;
\.


--
-- TOC entry 2205 (class 0 OID 25113)
-- Dependencies: 186
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY share (cd_share, post_cd_post, user_cd_user_meme) FROM stdin;
\.


--
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 187
-- Name: sq_cd_postagem; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_cd_postagem', 1, false);


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 192
-- Name: sq_cd_user_adm; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_cd_user_adm', 2, true);


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 188
-- Name: sq_cd_user_meme; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_cd_user_meme', 31, true);


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 189
-- Name: sq_user_meme_not; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_user_meme_not', 1, false);


--
-- TOC entry 2209 (class 0 OID 25122)
-- Dependencies: 190
-- Data for Name: user_adm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_adm (cd_user_adm, nm_first, nm_last, ds_nick, ds_email, ds_password, ds_country, nm_birth) FROM stdin;
50	a	a	a	a	a	Brasil	
\.


--
-- TOC entry 2210 (class 0 OID 25128)
-- Dependencies: 191
-- Data for Name: user_meme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_meme (cd_user_meme, nm_first, nm_last, ds_nick, ds_email, ds_country, ds_bios, ds_password, tp_private, nm_birth, bb_photo, nm_extension) FROM stdin;
\.


--
-- TOC entry 2058 (class 2606 OID 25135)
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (cd_comment);


--
-- TOC entry 2060 (class 2606 OID 25137)
-- Name: complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_pkey PRIMARY KEY (cd_complaint);


--
-- TOC entry 2063 (class 2606 OID 25139)
-- Name: follow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (cd_follow);


--
-- TOC entry 2065 (class 2606 OID 25141)
-- Name: like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT like_pkey PRIMARY KEY (cd_like);


--
-- TOC entry 2067 (class 2606 OID 25143)
-- Name: post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_pkey PRIMARY KEY (cd_post);


--
-- TOC entry 2069 (class 2606 OID 25145)
-- Name: share_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share
    ADD CONSTRAINT share_pkey PRIMARY KEY (cd_share);


--
-- TOC entry 2071 (class 2606 OID 25147)
-- Name: user_adm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_adm
    ADD CONSTRAINT user_adm_pkey PRIMARY KEY (cd_user_adm);


--
-- TOC entry 2073 (class 2606 OID 25149)
-- Name: user_meme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_meme
    ADD CONSTRAINT user_meme_pkey PRIMARY KEY (cd_user_meme);


--
-- TOC entry 2061 (class 1259 OID 25150)
-- Name: fki_followed_user_cd_user_meme_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_followed_user_cd_user_meme_fkey ON follow USING btree (followed_cd_user_meme);


--
-- TOC entry 2074 (class 2606 OID 25151)
-- Name: comment_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2075 (class 2606 OID 25156)
-- Name: comment_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2076 (class 2606 OID 25161)
-- Name: complaint_adm_cd_user_adm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_adm_cd_user_adm_fkey FOREIGN KEY (adm_cd_user_adm) REFERENCES user_adm(cd_user_adm);


--
-- TOC entry 2077 (class 2606 OID 25166)
-- Name: complaint_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2078 (class 2606 OID 25171)
-- Name: complaint_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2079 (class 2606 OID 25176)
-- Name: follow_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT follow_user_cd_user_meme_fkey FOREIGN KEY (follower_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2080 (class 2606 OID 25181)
-- Name: followed_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT followed_user_cd_user_meme_fkey FOREIGN KEY (followed_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2081 (class 2606 OID 25186)
-- Name: like_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT like_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2082 (class 2606 OID 25191)
-- Name: like_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT like_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2083 (class 2606 OID 25196)
-- Name: post_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2084 (class 2606 OID 25201)
-- Name: share_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share
    ADD CONSTRAINT share_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2085 (class 2606 OID 25206)
-- Name: share_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share
    ADD CONSTRAINT share_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-11-05 13:13:58 BRST

--
-- PostgreSQL database dump complete
--

