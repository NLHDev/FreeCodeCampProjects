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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    contains_habitable boolean,
    distance numeric,
    type character varying(15)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    habitable boolean,
    type text,
    planet_id integer,
    visited boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: nasa_missions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nasa_missions (
    nasa_missions_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer
);


ALTER TABLE public.nasa_missions OWNER TO freecodecamp;

--
-- Name: nasa_missions_nasa_missions_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nasa_missions_nasa_missions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nasa_missions_nasa_missions_id_seq OWNER TO freecodecamp;

--
-- Name: nasa_missions_nasa_missions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nasa_missions_nasa_missions_id_seq OWNED BY public.nasa_missions.nasa_missions_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    habitable boolean,
    distance numeric(10,2),
    type text,
    star_id integer,
    visited boolean,
    orbit_speed integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    size integer,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    distance numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nasa_missions nasa_missions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nasa_missions ALTER COLUMN nasa_missions_id SET DEFAULT nextval('public.nasa_missions_nasa_missions_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cigar', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', false, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1080, false, 'Rock', 1, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 19, false, 'Rock', 4, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 15, false, 'Rock', 4, false);
INSERT INTO public.moon VALUES (4, 'Io', NULL, false, 'Rock', 6, false);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, false, 'Rock', 6, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, false, 'Rock', 6, false);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, false, 'Rock', 6, false);
INSERT INTO public.moon VALUES (8, 'Mimas', NULL, false, 'Rock', 7, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, false, 'Rock', 7, false);
INSERT INTO public.moon VALUES (10, 'Tethys', NULL, false, 'Rock', 7, false);
INSERT INTO public.moon VALUES (11, 'Dione', NULL, false, 'Rock', 7, false);
INSERT INTO public.moon VALUES (12, 'Rhea', NULL, false, 'Rock', 7, false);
INSERT INTO public.moon VALUES (13, 'Titan', NULL, false, 'Rock', 7, false);
INSERT INTO public.moon VALUES (14, 'Hyperion', NULL, false, 'Rock', 7, false);
INSERT INTO public.moon VALUES (15, 'Lapetus', NULL, false, 'Rock', 7, false);
INSERT INTO public.moon VALUES (16, 'Miranda', NULL, false, 'Rock', 8, false);
INSERT INTO public.moon VALUES (17, 'Ariel', NULL, false, 'Rock', 8, false);
INSERT INTO public.moon VALUES (18, 'Umbriel', NULL, false, 'Rock', 8, false);
INSERT INTO public.moon VALUES (19, 'Titania', NULL, false, 'Rock', 8, false);
INSERT INTO public.moon VALUES (20, 'Oberon', NULL, false, 'Rock', 8, false);


--
-- Data for Name: nasa_missions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nasa_missions VALUES (1, 'Apollo 35', 2);
INSERT INTO public.nasa_missions VALUES (2, 'Apollo 11', 1);
INSERT INTO public.nasa_missions VALUES (3, 'Arablest 19', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 3959, true, 94.36, 'Water Based', 1, true, 30);
INSERT INTO public.planet VALUES (2, 'Mercury', 1516, false, 42.00, 'Rock', 1, false, 47);
INSERT INTO public.planet VALUES (4, 'Venus', 3760, false, 67.59, 'Rock', 1, false, 78);
INSERT INTO public.planet VALUES (5, 'Mars', 2106, false, 129.00, 'Rock', 1, false, 24);
INSERT INTO public.planet VALUES (6, 'Jupiter', 142984, false, 461.73, 'Gas', 1, false, 80);
INSERT INTO public.planet VALUES (7, 'Saturn', 120400, false, 917.00, 'Gas', 1, false, 70);
INSERT INTO public.planet VALUES (8, 'Uranus', 51118, false, 2867.00, 'Gas', 1, false, 17);
INSERT INTO public.planet VALUES (9, 'Neptune', 49528, false, 4515.00, 'Gas', 1, false, 5);
INSERT INTO public.planet VALUES (10, 'Pluto', 2376, false, 5906.40, 'Rock', 1, false, 5);
INSERT INTO public.planet VALUES (3, 'Mercurial', 1516, false, 42.00, 'Rock', 1, false, 47);
INSERT INTO public.planet VALUES (11, 'Nepts', 49528, false, 4515.00, 'Gas', 1, false, 5);
INSERT INTO public.planet VALUES (12, 'Pluts', 2376, false, 5906.40, 'Rock', 1, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 432690, 1, 'Sol', NULL);
INSERT INTO public.star VALUES (2, 5, 1, 'Alpha Centauri', NULL);
INSERT INTO public.star VALUES (3, 6, 1, 'Barnards Star', NULL);
INSERT INTO public.star VALUES (4, 8, 1, 'Wolf 359', NULL);
INSERT INTO public.star VALUES (5, 8, 1, 'Alpha Canis Majoris', NULL);
INSERT INTO public.star VALUES (6, 13, 1, 'Luyten 726-8', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nasa_missions_nasa_missions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nasa_missions_nasa_missions_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nasa_missions nasa_missions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nasa_missions
    ADD CONSTRAINT nasa_missions_name_key UNIQUE (name);


--
-- Name: nasa_missions nasa_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nasa_missions
    ADD CONSTRAINT nasa_missions_pkey PRIMARY KEY (nasa_missions_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: nasa_missions nasa_missions_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nasa_missions
    ADD CONSTRAINT nasa_missions_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


