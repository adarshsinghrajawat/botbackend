--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-08-14 13:45:23

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
-- TOC entry 218 (class 1259 OID 16390)
-- Name: assetentry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assetentry (
    botid integer NOT NULL,
    assettype character varying(45),
    jurisdiction character varying(45),
    assetvalue character varying(45),
    tokensupply character varying(45),
    document character varying(255)
);


ALTER TABLE public.assetentry OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: assetentry_botid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assetentry_botid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assetentry_botid_seq OWNER TO postgres;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 217
-- Name: assetentry_botid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assetentry_botid_seq OWNED BY public.assetentry.botid;


--
-- TOC entry 4742 (class 2604 OID 16393)
-- Name: assetentry botid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetentry ALTER COLUMN botid SET DEFAULT nextval('public.assetentry_botid_seq'::regclass);


--
-- TOC entry 4891 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: assetentry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assetentry (botid, assettype, jurisdiction, assetvalue, tokensupply, document) FROM stdin;
1	b	hj	54	4	12ce3335-e70b-46a8-a773-6c0400115dfd.pdf
2	jk	sd	65	56	b16fc2ba-5161-4856-9c83-b1dc89319103.pdf
\.


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 217
-- Name: assetentry_botid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assetentry_botid_seq', 2, true);


--
-- TOC entry 4744 (class 2606 OID 16395)
-- Name: assetentry assetentry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetentry
    ADD CONSTRAINT assetentry_pkey PRIMARY KEY (botid);


-- Completed on 2025-08-14 13:45:24

--
-- PostgreSQL database dump complete
--

