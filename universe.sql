# moonshine
a project universe.sql


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter numeric(5,2) NOT NULL,
    composition text NOT NULL,
    orbit_period integer,
    is_hazardous boolean NOT NULL,
    orbital_inclination integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    is_visible boolean DEFAULT true NOT NULL,
    number_of_stars integer DEFAULT 0 NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    size integer NOT NULL,
    distance_from_planet numeric(10,2),
    is_geologically_active boolean NOT NULL,
    craters_count integer NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    diameter numeric(10,2) NOT NULL,
    orbit_period integer,
    has_rings boolean NOT NULL,
    gravity integer NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    mass numeric(30,5),
    is_main_sequence boolean NOT NULL,
    temperature integer NOT NULL,
    age_in_millions_of_years integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (17, 'Ceres', 940.00, 'Ice and rock', 1680, false, 10);
INSERT INTO public.asteroid VALUES (18, 'Vesta', 525.00, 'Rocky', 1320, false, 12);
INSERT INTO public.asteroid VALUES (19, 'Pallas', 512.00, 'Rocky', 1680, false, 15);
INSERT INTO public.asteroid VALUES (20, 'Hygiea', 434.00, 'Carbonaceous', 2250, false, 8);
INSERT INTO public.asteroid VALUES (21, 'Euphrosyne', 285.00, 'Rocky', 1850, false, 9);
INSERT INTO public.asteroid VALUES (22, 'Juno', 233.00, 'Silicate', 1200, true, 13);
INSERT INTO public.asteroid VALUES (23, 'Amun', 152.00, 'Carbonaceous', 1100, true, 11);
INSERT INTO public.asteroid VALUES (24, 'Bamberga', 154.00, 'Silicate', 1260, true, 14);
INSERT INTO public.asteroid VALUES (25, 'Davida', 303.00, 'Rocky', 3000, false, 7);
INSERT INTO public.asteroid VALUES (26, 'Interamnia', 350.00, 'Carbonaceous', 2300, false, 10);
INSERT INTO public.asteroid VALUES (27, 'Egeria', 146.00, 'Ice and rock', 2000, false, 13);
INSERT INTO public.asteroid VALUES (28, 'Sylvia', 252.00, 'Rocky', 1200, true, 16);
INSERT INTO public.asteroid VALUES (29, 'Clytemnestra', 112.00, 'Silicate', 2400, false, 14);
INSERT INTO public.asteroid VALUES (30, 'Eurydice', 100.00, 'Ice and rock', 3200, true, 12);
INSERT INTO public.asteroid VALUES (31, 'Thule', 198.00, 'Rocky', 1500, false, 8);
INSERT INTO public.asteroid VALUES (32, 'Lutetia', 100.00, 'Metallic', 1500, true, 13);
INSERT INTO public.asteroid VALUES (33, 'Adalia', 115.00, 'Silicate', 1900, true, 9);
INSERT INTO public.asteroid VALUES (34, 'Ganymede', 500.00, 'Ice and rock', 3000, false, 14);
INSERT INTO public.asteroid VALUES (35, 'Callisto', 400.00, 'Silicate', 2700, false, 10);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.00, true, 13600, true, 100000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000.00, false, 10000, true, 1000000000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', 3000000.00, false, 10000, true, 200000000);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Elliptical', 29000.00, false, 8000, true, 500000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21000.00, false, 11000, true, 300000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23000.00, true, 12500, true, 400000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (41, 'Moon', 15, true, 3474, 384400.00, true, 300000);
INSERT INTO public.moon VALUES (42, 'Io', 17, true, 3643, 421700.00, true, 400000);
INSERT INTO public.moon VALUES (43, 'Europa', 17, true, 3122, 670900.00, true, 200000);
INSERT INTO public.moon VALUES (44, 'Ganymede', 17, true, 5262, 1070400.00, false, 100000);
INSERT INTO public.moon VALUES (45, 'Callisto', 17, true, 4821, 1883000.00, false, 150000);
INSERT INTO public.moon VALUES (46, 'Titan', 18, true, 5150, 1222000.00, true, 50000);
INSERT INTO public.moon VALUES (47, 'Rhea', 18, true, 1528, 527000.00, false, 30000);
INSERT INTO public.moon VALUES (48, 'Enceladus', 18, true, 504, 237900.00, true, 10000);
INSERT INTO public.moon VALUES (49, 'Mimas', 18, true, 396, 185000.00, false, 5000);
INSERT INTO public.moon VALUES (50, 'Ariel', 19, true, 1158, 1903000.00, false, 6000);
INSERT INTO public.moon VALUES (51, 'Umbriel', 19, true, 1170, 2663000.00, false, 10000);
INSERT INTO public.moon VALUES (52, 'Titania', 19, true, 1578, 4356000.00, true, 3000);
INSERT INTO public.moon VALUES (53, 'Oberon', 19, true, 1523, 5826000.00, true, 4000);
INSERT INTO public.moon VALUES (54, 'Triton', 20, true, 2706, 3547600.00, true, 20000);
INSERT INTO public.moon VALUES (55, 'Nereid', 20, true, 340, 5250000.00, false, 1000);
INSERT INTO public.moon VALUES (56, 'Proteus', 20, true, 420, 1176000.00, false, 2000);
INSERT INTO public.moon VALUES (57, 'Charon', 21, true, 1212, 192000.00, true, 10000);
INSERT INTO public.moon VALUES (58, 'Hydra', 21, true, 45, 629000.00, false, 500);
INSERT INTO public.moon VALUES (59, 'Kerberos', 21, true, 30, 1175000.00, false, 200);
INSERT INTO public.moon VALUES (60, 'Styx', 21, true, 20, 1725000.00, false, 300);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 1, false, 4879.00, 88, false, 3);
INSERT INTO public.planet VALUES (14, 'Venus', 1, false, 12104.00, 225, false, 8);
INSERT INTO public.planet VALUES (15, 'Earth', 1, true, 12742.00, 365, false, 9);
INSERT INTO public.planet VALUES (16, 'Mars', 1, false, 6779.00, 687, true, 3);
INSERT INTO public.planet VALUES (17, 'Jupiter', 1, false, 139820.00, 4333, true, 24);
INSERT INTO public.planet VALUES (18, 'Saturn', 1, false, 116460.00, 10759, true, 10);
INSERT INTO public.planet VALUES (19, 'Uranus', 1, false, 50724.00, 30687, true, 8);
INSERT INTO public.planet VALUES (20, 'Neptune', 1, false, 49244.00, 60190, true, 11);
INSERT INTO public.planet VALUES (21, 'Pluto', 1, false, 2370.00, 90560, true, 0);
INSERT INTO public.planet VALUES (22, 'Kepler-452b', 2, true, 14000.00, 400, false, 6);
INSERT INTO public.planet VALUES (23, 'HD 209458 b', 3, false, 12700.00, 3, false, 15);
INSERT INTO public.planet VALUES (24, 'Proxima Centauri b', 4, true, 11300.00, 11, true, 9);
INSERT INTO public.planet VALUES (25, 'Gliese 581 g', 5, true, 11350.00, 37, false, 7);
INSERT INTO public.planet VALUES (26, 'Alpha Centauri Bb', 6, false, 11500.00, 9, false, 5);
INSERT INTO public.planet VALUES (27, 'TRAPPIST-1e', 7, true, 12100.00, 12, true, 8);
INSERT INTO public.planet VALUES (28, 'LHS 1140 b', 8, true, 12700.00, 24, true, 10);
INSERT INTO public.planet VALUES (29, 'HD 189733 b', 9, false, 12000.00, 2, false, 14);
INSERT INTO public.planet VALUES (30, 'Kepler-22b', 1, true, 14500.00, 290, false, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 1989000000000000000000000.00000, true, 5778, 4600);
INSERT INTO public.star VALUES (2, 'Sirius', 1, true, 402000000000000000000000.00000, true, 9940, 200);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, true, 2100000000000000000000000.00000, false, 3500, 800);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 1, true, 210000000000000000000000.00000, true, 5850, 6000);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, true, 25000000000000000000000.00000, true, 3042, 4700);
INSERT INTO public.star VALUES (6, 'Rigel', 1, true, 280000000000000000000000.00000, false, 12000, 800);
INSERT INTO public.star VALUES (7, 'Vega', 1, true, 210000000000000000000000.00000, true, 9600, 455);
INSERT INTO public.star VALUES (8, 'Polaris', 1, true, 540000000000000000000000.00000, false, 6000, 700);
INSERT INTO public.star VALUES (9, 'Aldebaran', 1, true, 25000000000000000000000.00000, false, 4300, 6500);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 35, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 30, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

