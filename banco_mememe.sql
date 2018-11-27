--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)

-- Started on 2018-11-27 01:12:37 -02


SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13043)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16587)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    cd_comment integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16590)
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
-- TOC entry 199 (class 1259 OID 16596)
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.follow (
    cd_follow integer NOT NULL,
    user_cd_user_meme integer
);


ALTER TABLE public.follow OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16599)
-- Name: followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.followers (
    cd_followers integer NOT NULL,
    user_cd_user_meme integer
);


ALTER TABLE public.followers OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16602)
-- Name: like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."like" (
    cd_like integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE public."like" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16605)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    cd_post integer NOT NULL,
    user_cd_user_meme integer,
    dt_moments date,
    tm_moments time with time zone,
    ds_post integer
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16608)
-- Name: share; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share (
    cd_share integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE public.share OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16611)
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
-- TOC entry 196 (class 1259 OID 16579)
-- Name: user_meme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_meme (
    cd_user_meme integer NOT NULL,
    nm_first character varying,
    nm_last character varying,
    ds_nick character varying,
    ds_email character varying,
    dt_birth date,
    ds_country character varying,
    tp_private character(1)[],
    ds_bios text
);


ALTER TABLE public.user_meme OWNER TO postgres;

--
-- TOC entry 2973 (class 0 OID 16587)
-- Dependencies: 197
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2974 (class 0 OID 16590)
-- Dependencies: 198
-- Data for Name: complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2975 (class 0 OID 16596)
-- Dependencies: 199
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2976 (class 0 OID 16599)
-- Dependencies: 200
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2977 (class 0 OID 16602)
-- Dependencies: 201
-- Data for Name: like; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2978 (class 0 OID 16605)
-- Dependencies: 202
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2979 (class 0 OID 16608)
-- Dependencies: 203
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2980 (class 0 OID 16611)
-- Dependencies: 204
-- Data for Name: user_adm; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2972 (class 0 OID 16579)
-- Dependencies: 196
-- Data for Name: user_meme; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2824 (class 2606 OID 16618)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (cd_comment);


--
-- TOC entry 2826 (class 2606 OID 16620)
-- Name: complaint complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_pkey PRIMARY KEY (cd_complaint);


--
-- TOC entry 2828 (class 2606 OID 16622)
-- Name: follow follow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (cd_follow);


--
-- TOC entry 2830 (class 2606 OID 16624)
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (cd_followers);


--
-- TOC entry 2832 (class 2606 OID 16626)
-- Name: like like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_pkey PRIMARY KEY (cd_like);


--
-- TOC entry 2834 (class 2606 OID 16628)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (cd_post);


--
-- TOC entry 2836 (class 2606 OID 16630)
-- Name: share share_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_pkey PRIMARY KEY (cd_share);


--
-- TOC entry 2838 (class 2606 OID 16632)
-- Name: user_adm user_adm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adm
    ADD CONSTRAINT user_adm_pkey PRIMARY KEY (cd_user_adm);


--
-- TOC entry 2822 (class 2606 OID 16586)
-- Name: user_meme user_meme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meme
    ADD CONSTRAINT user_meme_pkey PRIMARY KEY (cd_user_meme);


--
-- TOC entry 2839 (class 2606 OID 16633)
-- Name: comment comment_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2840 (class 2606 OID 16638)
-- Name: comment comment_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2841 (class 2606 OID 16643)
-- Name: complaint complaint_adm_cd_user_adm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_adm_cd_user_adm_fkey FOREIGN KEY (adm_cd_user_adm) REFERENCES public.user_adm(cd_user_adm);


--
-- TOC entry 2842 (class 2606 OID 16648)
-- Name: complaint complaint_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2843 (class 2606 OID 16653)
-- Name: complaint complaint_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2844 (class 2606 OID 16658)
-- Name: follow follow_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2845 (class 2606 OID 16663)
-- Name: followers followers_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2846 (class 2606 OID 16668)
-- Name: like like_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2847 (class 2606 OID 16673)
-- Name: like like_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2848 (class 2606 OID 16678)
-- Name: post post_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2849 (class 2606 OID 16683)
-- Name: share share_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2850 (class 2606 OID 16688)
-- Name: share share_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


-- Completed on 2018-11-27 01:12:37 -02

--
-- PostgreSQL database dump complete
--

