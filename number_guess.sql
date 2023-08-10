--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.data (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.data OWNER TO freecodecamp;

--
-- Name: data_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.data_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_user_id_seq OWNER TO freecodecamp;

--
-- Name: data_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.data_user_id_seq OWNED BY public.data.user_id;


--
-- Name: data user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.data ALTER COLUMN user_id SET DEFAULT nextval('public.data_user_id_seq'::regclass);


--
-- Data for Name: data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.data VALUES (16, 'кен', 1, 2);
INSERT INTO public.data VALUES (6, 'user_1691633955326', 2, 689);
INSERT INTO public.data VALUES (5, 'user_1691633955327', 5, 78);
INSERT INTO public.data VALUES (7, 'abc', 2, 3);
INSERT INTO public.data VALUES (19, 'user_1691634958121', 2, 915);
INSERT INTO public.data VALUES (18, 'user_1691634958122', 5, 98);
INSERT INTO public.data VALUES (9, 'user_1691634661585', 2, 83);
INSERT INTO public.data VALUES (17, 'sergey', 2, 10);
INSERT INTO public.data VALUES (8, 'user_1691634661586', 5, 219);
INSERT INTO public.data VALUES (11, 'user_1691634735677', 2, 280);
INSERT INTO public.data VALUES (21, 'user_1691635429282', 2, 791);
INSERT INTO public.data VALUES (10, 'user_1691634735678', 5, 125);
INSERT INTO public.data VALUES (20, 'user_1691635429283', 5, 96);
INSERT INTO public.data VALUES (13, 'user_1691634758559', 2, 650);
INSERT INTO public.data VALUES (12, 'user_1691634758560', 5, 5);
INSERT INTO public.data VALUES (15, 'user_1691634779696', 2, 421);
INSERT INTO public.data VALUES (14, 'user_1691634779697', 5, 270);


--
-- Name: data_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.data_user_id_seq', 21, true);


--
-- Name: data data_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT data_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

