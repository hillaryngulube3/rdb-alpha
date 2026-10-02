--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(20),
    type character varying(50),
    description text,
    stars_in_billion integer,
    all_planets_have__life boolean DEFAULT false NOT NULL
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
    name character varying(30),
    is_spherical boolean,
    planet_id integer NOT NULL,
    description text
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
    name character varying(20),
    type character varying(50),
    has_life boolean,
    distance_million_km numeric(5,2),
    star_id integer NOT NULL,
    moons integer,
    rings integer
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
-- Name: ring; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ring (
    ring_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50),
    composition character varying(50) NOT NULL,
    width_km numeric(10,2)
);


ALTER TABLE public.ring OWNER TO freecodecamp;

--
-- Name: ring_ring_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ring_ring_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ring_ring_id_seq OWNER TO freecodecamp;

--
-- Name: ring_ring_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ring_ring_id_seq OWNED BY public.ring.ring_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    is_spherical boolean,
    type character varying(50),
    galaxy_id integer NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: ring ring_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring ALTER COLUMN ring_id SET DEFAULT nextval('public.ring_ring_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral Galaxy', 'Our home galaxy; a vast disk of stars, gas, and dust with a central bar and spiral arms.', 400, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda(M31)', 'Barred Spiral Galaxy', 'The closest major galaxy to us; visible to the naked eye.', 1000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'unbarred spiral', 'The third-largest member of our Local Group of galaxies.', 40, false);
INSERT INTO public.galaxy VALUES (4, 'whirlpool', 'spiral', 'Interacting grand-design spiral galaxy', 100, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 'Peculiar galaxy with a bright central bulge', 800, false);
INSERT INTO public.galaxy VALUES (6, 'Magellanic Cloud', 'irregular', 'Dwarf galaxy orbiting the Milky Way', 30, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', true, 1, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 'phobos', false, 4, 'Small, irregular, dark moon.');
INSERT INTO public.moon VALUES (3, 'deimos', false, 4, 'Tiny, irregular outer moon.');
INSERT INTO public.moon VALUES (4, 'lo', true, 5, 'Most volcanically active body.');
INSERT INTO public.moon VALUES (5, 'europa', true, 5, 'Icy moon with subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'ganymede', true, 5, 'Largest moon in Solar System.');
INSERT INTO public.moon VALUES (7, 'callisto', true, 5, 'Most heavily cratered moon.');
INSERT INTO public.moon VALUES (8, 'mimas', true, 6, 'Looks like the "Death Star".');
INSERT INTO public.moon VALUES (9, 'enceladus', true, 6, 'Vents water vapor and ice.');
INSERT INTO public.moon VALUES (10, 'tethys', true, 6, 'Almost entirely water ice.');
INSERT INTO public.moon VALUES (11, 'dione', true, 6, 'Icy moon with bright fractures.');
INSERT INTO public.moon VALUES (12, 'rhea', true, 6, 'Heavily cratered ice moon.');
INSERT INTO public.moon VALUES (13, 'titan', true, 6, 'Thick atmosphere, hydrocarbon lakes.');
INSERT INTO public.moon VALUES (14, 'hyperion', false, 6, 'Sponge-like, chaotic rotation.');
INSERT INTO public.moon VALUES (15, 'iapetus', true, 6, 'Two-tone black and white.');
INSERT INTO public.moon VALUES (16, 'miranda', true, 7, 'Jumbled terrain of cliffs.');
INSERT INTO public.moon VALUES (17, 'titania', true, 7, 'Largest moon of Uranus.');
INSERT INTO public.moon VALUES (18, 'oberon', true, 7, 'Dark, heavily cratered moon.');
INSERT INTO public.moon VALUES (19, 'triton', true, 8, 'Retrograde orbit, likely captured.');
INSERT INTO public.moon VALUES (20, 'charon', true, 9, 'Largest moon of Pluto.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', false, 91.70, 1, 0, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, 41.40, 1, 0, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, 0.00, 1, 1, 0);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 73.30, 1, 2, 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', false, 628.70, 1, 95, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', false, 127.50, 1, 146, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', false, 272.40, 1, 28, 13);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', false, 434.70, 1, 16, 5);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', false, 590.60, 1, 5, 0);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Dwarf', false, 263.00, 1, 0, 0);
INSERT INTO public.planet VALUES (11, 'Eris', 'Dwarf', false, 101.50, 1, 1, 0);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 'Super earth', false, 140.00, 1, 0, 0);


--
-- Data for Name: ring; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ring VALUES (1, 6, 'A Ring', 'Water ice', 74500.00);
INSERT INTO public.ring VALUES (2, 6, 'B Ring', 'Water ice', 25500.00);
INSERT INTO public.ring VALUES (3, 6, 'C Ring', 'Water ice', 17500.00);
INSERT INTO public.ring VALUES (4, 5, 'Halo Ring', 'Dust', 12200.00);
INSERT INTO public.ring VALUES (5, 5, 'Main Ring', 'Dust', 6400.00);
INSERT INTO public.ring VALUES (6, 7, 'Epsilon Ring', 'Dust', 4000.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', false, 'G-type', 1);
INSERT INTO public.star VALUES (2, 'Proxima centauri', true, 'Red Dwarf', 1);
INSERT INTO public.star VALUES (3, 'Sirius A', true, 'A-type', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', true, 'Red supergiant', 1);
INSERT INTO public.star VALUES (5, 'Vega', true, 'A-type', 1);
INSERT INTO public.star VALUES (6, 'Rigel', true, 'Blue supergiant', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 25, true);


--
-- Name: ring_ring_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ring_ring_id_seq', 6, true);


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
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


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
-- Name: ring ring_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_name_unique UNIQUE (name);


--
-- Name: ring ring_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_pkey PRIMARY KEY (ring_id);


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
-- Name: ring ring_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

