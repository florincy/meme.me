--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-10-02 11:37:04 BRT

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
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 50315)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comment (
    cd_comment integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE comment OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 50318)
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
-- TOC entry 183 (class 1259 OID 50324)
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE follow (
    cd_follow integer NOT NULL,
    follower_cd_user_meme integer,
    followed_cd_user_meme integer
);


ALTER TABLE follow OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 50327)
-- Name: like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "like" (
    cd_like integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE "like" OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 50330)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE post (
    cd_post integer NOT NULL,
    user_cd_user_meme integer,
    ts_moments timestamp with time zone,
    ds_post character varying,
    ds_path character varying
);


ALTER TABLE post OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 50336)
-- Name: share; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE share (
    cd_share integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE share OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 50339)
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
-- TOC entry 188 (class 1259 OID 50341)
-- Name: user_adm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_adm (
    cd_user_adm integer NOT NULL,
    nm_first character varying,
    nm_last character varying,
    ds_nick character varying,
    ds_email character varying,
    ds_password character varying,
    dt_birth date,
    ds_country character varying
);


ALTER TABLE user_adm OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 50347)
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
    ds_photo character varying
);


ALTER TABLE user_meme OWNER TO postgres;

--
-- TOC entry 2194 (class 0 OID 50315)
-- Dependencies: 181
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2195 (class 0 OID 50318)
-- Dependencies: 182
-- Data for Name: complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2196 (class 0 OID 50324)
-- Dependencies: 183
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2197 (class 0 OID 50327)
-- Dependencies: 184
-- Data for Name: like; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2198 (class 0 OID 50330)
-- Dependencies: 185
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2199 (class 0 OID 50336)
-- Dependencies: 186
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 187
-- Name: sq_cd_user_meme; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_cd_user_meme', 51, true);


--
-- TOC entry 2201 (class 0 OID 50341)
-- Dependencies: 188
-- Data for Name: user_adm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2202 (class 0 OID 50347)
-- Dependencies: 189
-- Data for Name: user_meme; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2052 (class 2606 OID 50354)
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (cd_comment);


--
-- TOC entry 2054 (class 2606 OID 50356)
-- Name: complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_pkey PRIMARY KEY (cd_complaint);


--
-- TOC entry 2057 (class 2606 OID 50358)
-- Name: follow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (cd_follow);


--
-- TOC entry 2059 (class 2606 OID 50360)
-- Name: like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "like"
    ADD CONSTRAINT like_pkey PRIMARY KEY (cd_like);


--
-- TOC entry 2061 (class 2606 OID 50362)
-- Name: post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_pkey PRIMARY KEY (cd_post);


--
-- TOC entry 2063 (class 2606 OID 50364)
-- Name: share_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share
    ADD CONSTRAINT share_pkey PRIMARY KEY (cd_share);


--
-- TOC entry 2065 (class 2606 OID 50366)
-- Name: user_adm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_adm
    ADD CONSTRAINT user_adm_pkey PRIMARY KEY (cd_user_adm);


--
-- TOC entry 2067 (class 2606 OID 50368)
-- Name: user_meme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_meme
    ADD CONSTRAINT user_meme_pkey PRIMARY KEY (cd_user_meme);


--
-- TOC entry 2055 (class 1259 OID 50369)
-- Name: fki_followed_user_cd_user_meme_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_followed_user_cd_user_meme_fkey ON follow USING btree (followed_cd_user_meme);


--
-- TOC entry 2068 (class 2606 OID 50370)
-- Name: comment_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2069 (class 2606 OID 50375)
-- Name: comment_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2070 (class 2606 OID 50380)
-- Name: complaint_adm_cd_user_adm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_adm_cd_user_adm_fkey FOREIGN KEY (adm_cd_user_adm) REFERENCES user_adm(cd_user_adm);


--
-- TOC entry 2071 (class 2606 OID 50385)
-- Name: complaint_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2072 (class 2606 OID 50390)
-- Name: complaint_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY complaint
    ADD CONSTRAINT complaint_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2073 (class 2606 OID 50395)
-- Name: follow_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT follow_user_cd_user_meme_fkey FOREIGN KEY (follower_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2074 (class 2606 OID 50400)
-- Name: followed_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT followed_user_cd_user_meme_fkey FOREIGN KEY (followed_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2075 (class 2606 OID 50405)
-- Name: like_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "like"
    ADD CONSTRAINT like_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2076 (class 2606 OID 50410)
-- Name: like_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "like"
    ADD CONSTRAINT like_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2077 (class 2606 OID 50415)
-- Name: post_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2078 (class 2606 OID 50420)
-- Name: share_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share
    ADD CONSTRAINT share_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES post(cd_post);


--
-- TOC entry 2079 (class 2606 OID 50425)
-- Name: share_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share
    ADD CONSTRAINT share_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES user_meme(cd_user_meme);


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-10-02 11:37:05 BRT

--
-- PostgreSQL database dump complete
--

