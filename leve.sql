--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)

-- Started on 2019-10-12 15:51:40 -03

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
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 25328)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    cd_comment integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 25331)
-- Name: complaint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaint (
    cd_complaint integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer,
    adm_cd_user_adm integer,
    ds_description text
);


ALTER TABLE public.complaint OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 25337)
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.follow (
    cd_follow integer NOT NULL,
    follower_cd_user_meme integer,
    followed_cd_user_meme integer
);


ALTER TABLE public.follow OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 25340)
-- Name: like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."like" (
    cd_like integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE public."like" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 25343)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    cd_post integer NOT NULL,
    user_cd_user_meme integer,
    ts_moments timestamp with time zone,
    ds_post character varying,
    bb_photo bytea,
    nm_extension character varying
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 25349)
-- Name: share; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share (
    cd_share integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE public.share OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 25352)
-- Name: sq_cd_postagem; Type: SEQUENCE; Schema: public; Owner: flo
--

CREATE SEQUENCE public.sq_cd_postagem
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sq_cd_postagem OWNER TO flo;

--
-- TOC entry 203 (class 1259 OID 25354)
-- Name: sq_cd_user_meme; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sq_cd_user_meme
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sq_cd_user_meme OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25356)
-- Name: sq_user_meme_not; Type: SEQUENCE; Schema: public; Owner: flo
--

CREATE SEQUENCE public.sq_user_meme_not
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sq_user_meme_not OWNER TO flo;

--
-- TOC entry 205 (class 1259 OID 25358)
-- Name: user_adm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_adm (
    cd_user_adm integer NOT NULL,
    nm_first character varying,
    nm_last character varying,
    ds_nick character varying,
    ds_email character varying,
    ds_password character varying,
    dt_birth date,
    ds_country character varying
);


ALTER TABLE public.user_adm OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25364)
-- Name: user_meme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_meme (
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
    ds_photo character varying,
    nm_extension character varying
);


ALTER TABLE public.user_meme OWNER TO postgres;

--
-- TOC entry 2974 (class 0 OID 25328)
-- Dependencies: 196
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2975 (class 0 OID 25331)
-- Dependencies: 197
-- Data for Name: complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2976 (class 0 OID 25337)
-- Dependencies: 198
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2977 (class 0 OID 25340)
-- Dependencies: 199
-- Data for Name: like; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2978 (class 0 OID 25343)
-- Dependencies: 200
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2979 (class 0 OID 25349)
-- Dependencies: 201
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2983 (class 0 OID 25358)
-- Dependencies: 205
-- Data for Name: user_adm; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2984 (class 0 OID 25364)
-- Dependencies: 206
-- Data for Name: user_meme; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 202
-- Name: sq_cd_postagem; Type: SEQUENCE SET; Schema: public; Owner: flo
--

SELECT pg_catalog.setval('public.sq_cd_postagem', 1, false);


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 203
-- Name: sq_cd_user_meme; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sq_cd_user_meme', 26, true);


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 204
-- Name: sq_user_meme_not; Type: SEQUENCE SET; Schema: public; Owner: flo
--

SELECT pg_catalog.setval('public.sq_user_meme_not', 1, false);


--
-- TOC entry 2825 (class 2606 OID 25371)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (cd_comment);


--
-- TOC entry 2827 (class 2606 OID 25373)
-- Name: complaint complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_pkey PRIMARY KEY (cd_complaint);


--
-- TOC entry 2830 (class 2606 OID 25375)
-- Name: follow follow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (cd_follow);


--
-- TOC entry 2832 (class 2606 OID 25377)
-- Name: like like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_pkey PRIMARY KEY (cd_like);


--
-- TOC entry 2834 (class 2606 OID 25379)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (cd_post);


--
-- TOC entry 2836 (class 2606 OID 25381)
-- Name: share share_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_pkey PRIMARY KEY (cd_share);


--
-- TOC entry 2838 (class 2606 OID 25383)
-- Name: user_adm user_adm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adm
    ADD CONSTRAINT user_adm_pkey PRIMARY KEY (cd_user_adm);


--
-- TOC entry 2840 (class 2606 OID 25385)
-- Name: user_meme user_meme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meme
    ADD CONSTRAINT user_meme_pkey PRIMARY KEY (cd_user_meme);


--
-- TOC entry 2828 (class 1259 OID 25386)
-- Name: fki_followed_user_cd_user_meme_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_followed_user_cd_user_meme_fkey ON public.follow USING btree (followed_cd_user_meme);


--
-- TOC entry 2841 (class 2606 OID 25387)
-- Name: comment comment_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2842 (class 2606 OID 25392)
-- Name: comment comment_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2843 (class 2606 OID 25397)
-- Name: complaint complaint_adm_cd_user_adm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_adm_cd_user_adm_fkey FOREIGN KEY (adm_cd_user_adm) REFERENCES public.user_adm(cd_user_adm);


--
-- TOC entry 2844 (class 2606 OID 25402)
-- Name: complaint complaint_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2845 (class 2606 OID 25407)
-- Name: complaint complaint_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2846 (class 2606 OID 25412)
-- Name: follow follow_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_user_cd_user_meme_fkey FOREIGN KEY (follower_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2847 (class 2606 OID 25417)
-- Name: follow followed_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT followed_user_cd_user_meme_fkey FOREIGN KEY (followed_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2848 (class 2606 OID 25422)
-- Name: like like_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2849 (class 2606 OID 25427)
-- Name: like like_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2850 (class 2606 OID 25432)
-- Name: post post_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2851 (class 2606 OID 25437)
-- Name: share share_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2852 (class 2606 OID 25442)
-- Name: share share_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


-- Completed on 2019-10-12 15:51:40 -03

--
-- PostgreSQL database dump complete
--

