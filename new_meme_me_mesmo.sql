--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)

-- Started on 2019-09-18 02:20:58 -03

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
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16386)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    cd_comment integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16389)
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
-- TOC entry 198 (class 1259 OID 16395)
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.follow (
    cd_follow integer NOT NULL,
    follower_cd_user_meme integer,
    followed_cd_user_meme integer
);


ALTER TABLE public.follow OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16398)
-- Name: like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."like" (
    cd_like integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE public."like" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16401)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    cd_post integer NOT NULL,
    user_cd_user_meme integer,
    ts_moments timestamp with time zone,
    ds_post integer
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16404)
-- Name: share; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share (
    cd_share integer NOT NULL,
    post_cd_post integer,
    user_cd_user_meme integer
);


ALTER TABLE public.share OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16407)
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
-- TOC entry 203 (class 1259 OID 16409)
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
-- TOC entry 204 (class 1259 OID 16415)
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
    nm_birth character varying
);


ALTER TABLE public.user_meme OWNER TO postgres;

--
-- TOC entry 2969 (class 0 OID 16386)
-- Dependencies: 196
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (cd_comment, post_cd_post, user_cd_user_meme) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 16389)
-- Dependencies: 197
-- Data for Name: complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaint (cd_complaint, post_cd_post, user_cd_user_meme, adm_cd_user_adm, ds_description) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 16395)
-- Dependencies: 198
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.follow (cd_follow, follower_cd_user_meme, followed_cd_user_meme) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 16398)
-- Dependencies: 199
-- Data for Name: like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."like" (cd_like, post_cd_post, user_cd_user_meme) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 16401)
-- Dependencies: 200
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (cd_post, user_cd_user_meme, ts_moments, ds_post) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 16404)
-- Dependencies: 201
-- Data for Name: share; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.share (cd_share, post_cd_post, user_cd_user_meme) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 16409)
-- Dependencies: 203
-- Data for Name: user_adm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_adm (cd_user_adm, nm_first, nm_last, ds_nick, ds_email, ds_password, dt_birth, ds_country) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 16415)
-- Dependencies: 204
-- Data for Name: user_meme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_meme (cd_user_meme, nm_first, nm_last, ds_nick, ds_email, ds_country, ds_bios, ds_password, tp_private, nm_birth) FROM stdin;
300	eee	eee	eee	simoneflorency@gmail.comee	Brasil	eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee	eee	t	\N
350	q	q	q	q	Brasil	q	q	f	\N
400	w	w	w	w	Brasil	w	w	t	\N
450	a	a	a	a	Brasil	a	a	t	\N
500	e	e	e	e	Brasil	e	e	t	\N
501	eia	e	e	e	Brasil	e	e	f	\N
550	teste	teste	teste	teste	Brasil	teste	teste	t	\N
551	teste2	teste	teste	teste	Brasil	teste	teste	f	\N
600	tt	tt	tt	tt	Brasil	tt	tt	t	\N
650	d	d	d	d	Brasil	d	d	t	\N
651	da	d	d	d	Brasil	d	d	f	\N
700	da	d	d	d	Brasil	d	d	f	\N
701	di	d	d	d	Brasil	d	d	f	\N
750	g	g	g	g	Brasil	g	g	t	\N
751	ga	g	g	g	Brasil	g	g	f	\N
801	yy	y	y	yy	Brasil	y	yy	f	\N
800	yq	y	y	y	Brasil	y	y	f	\N
850	tt	tt	tt	tt	Brasil	tt	tt	t	\N
900	z	z	z	z	Brasil	z	z	t	\N
1050	j	j	jae	\N	Ãfrica do Sul	j	j	f	8888-08-08
1100	p	p	p	\N	Albania	p	p	f	8888-08-08
1150	h	h	h	h	AlbÃ¢nia	h	h	f	5555-05-05
\.


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 202
-- Name: sq_cd_user_meme; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sq_cd_user_meme', 23, true);


--
-- TOC entry 2820 (class 2606 OID 16422)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (cd_comment);


--
-- TOC entry 2822 (class 2606 OID 16424)
-- Name: complaint complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_pkey PRIMARY KEY (cd_complaint);


--
-- TOC entry 2825 (class 2606 OID 16426)
-- Name: follow follow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (cd_follow);


--
-- TOC entry 2827 (class 2606 OID 16428)
-- Name: like like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_pkey PRIMARY KEY (cd_like);


--
-- TOC entry 2829 (class 2606 OID 16430)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (cd_post);


--
-- TOC entry 2831 (class 2606 OID 16432)
-- Name: share share_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_pkey PRIMARY KEY (cd_share);


--
-- TOC entry 2833 (class 2606 OID 16434)
-- Name: user_adm user_adm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adm
    ADD CONSTRAINT user_adm_pkey PRIMARY KEY (cd_user_adm);


--
-- TOC entry 2835 (class 2606 OID 16436)
-- Name: user_meme user_meme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meme
    ADD CONSTRAINT user_meme_pkey PRIMARY KEY (cd_user_meme);


--
-- TOC entry 2823 (class 1259 OID 16437)
-- Name: fki_followed_user_cd_user_meme_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_followed_user_cd_user_meme_fkey ON public.follow USING btree (followed_cd_user_meme);


--
-- TOC entry 2836 (class 2606 OID 16438)
-- Name: comment comment_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2837 (class 2606 OID 16443)
-- Name: comment comment_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2838 (class 2606 OID 16448)
-- Name: complaint complaint_adm_cd_user_adm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_adm_cd_user_adm_fkey FOREIGN KEY (adm_cd_user_adm) REFERENCES public.user_adm(cd_user_adm);


--
-- TOC entry 2839 (class 2606 OID 16453)
-- Name: complaint complaint_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2840 (class 2606 OID 16458)
-- Name: complaint complaint_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaint
    ADD CONSTRAINT complaint_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2841 (class 2606 OID 16463)
-- Name: follow follow_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_user_cd_user_meme_fkey FOREIGN KEY (follower_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2842 (class 2606 OID 16468)
-- Name: follow followed_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT followed_user_cd_user_meme_fkey FOREIGN KEY (followed_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2843 (class 2606 OID 16473)
-- Name: like like_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2844 (class 2606 OID 16478)
-- Name: like like_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."like"
    ADD CONSTRAINT like_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2845 (class 2606 OID 16483)
-- Name: post post_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


--
-- TOC entry 2846 (class 2606 OID 16488)
-- Name: share share_post_cd_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_post_cd_post_fkey FOREIGN KEY (post_cd_post) REFERENCES public.post(cd_post);


--
-- TOC entry 2847 (class 2606 OID 16493)
-- Name: share share_user_cd_user_meme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share
    ADD CONSTRAINT share_user_cd_user_meme_fkey FOREIGN KEY (user_cd_user_meme) REFERENCES public.user_meme(cd_user_meme);


-- Completed on 2019-09-18 02:20:58 -03

--
-- PostgreSQL database dump complete
--

