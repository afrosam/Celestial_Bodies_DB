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
    name character varying(60) NOT NULL,
    galaxy_type character varying(20),
    "distance_from_earth_(parsec)" numeric(30,3),
    "Magnitude (M)" numeric(4,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: junction_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction_table (
    star_id integer,
    planet_id integer,
    moon_id integer,
    name character varying(40) NOT NULL,
    junction_table_id integer NOT NULL
);


ALTER TABLE public.junction_table OWNER TO freecodecamp;

--
-- Name: junction_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.junction_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_table_id_seq OWNER TO freecodecamp;

--
-- Name: junction_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.junction_table_id_seq OWNED BY public.junction_table.junction_table_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    has_life boolean,
    planet_id integer NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    has_life boolean,
    avg_temp_in_c integer,
    description text,
    gravity numeric,
    num_of_moons integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60),
    galaxy_id integer NOT NULL,
    star_type character varying(30),
    color character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: junction_table junction_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table ALTER COLUMN junction_table_id SET DEFAULT nextval('public.junction_table_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 'SBbc', 0.008, -20.80);
INSERT INTO public.galaxy VALUES (2, 'The Andromeda Galaxy', 'SA(s)b', 0.790, -21.58);
INSERT INTO public.galaxy VALUES (3, 'The Triangulum Galaxy', 'SAc', 0.810, -18.87);
INSERT INTO public.galaxy VALUES (4, 'M32 (NGC 221)', 'E2', 0.760, -15.96);
INSERT INTO public.galaxy VALUES (5, 'IC 10 (UGC 192)', 'dlrr IV/BCD', 0.670, -15.57);
INSERT INTO public.galaxy VALUES (6, 'Barnards Galaxy (NGC 6822)', 'IB(s)m IV-V', 0.500, -15.22);


--
-- Data for Name: junction_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction_table VALUES (NULL, 9, NULL, 'Kerberos', 1);
INSERT INTO public.junction_table VALUES (NULL, 7, NULL, 'Ariel', 2);
INSERT INTO public.junction_table VALUES (NULL, 7, NULL, 'Cupid', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon (Luna)', NULL, 3, 'Earths Moon is the only place beyond Earth where humans have set foot, so far. The Moon makes our planet more livable by moderating how much it wobbles on its axis.');
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 4, 'Phobos, gouged and nearly shattered by a giant impact crater and beaten by thousands of meteorite impacts, is on a collision course with Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 4, 'Named after the Roman god of dread, Deimos is the smaller of Mars` two moons.');
INSERT INTO public.moon VALUES (4, 'Callisto', NULL, 5, 'Callisto is the most heavily cratered object in our solar system.');
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 5, 'Europa might be the best place to look for environments where life could exist.');
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 5, 'Ganymede is the largest satellite in our solar system. It is larger than Mercury and Pluto, and three-quarters the size of Mars.');
INSERT INTO public.moon VALUES (7, 'Io', NULL, 5, 'Io is the most volcanically active body in the solar system.');
INSERT INTO public.moon VALUES (8, 'Dia', NULL, 5, 'Dia has a prograde orbit and a radius of about 1.2 miles (2 km).');
INSERT INTO public.moon VALUES (9, 'Arche', NULL, 5, 'Arche is a member of the Carme group, a family of Jovian satellites which have similar orbits and appearance and are therefore thought to have a common origin.');
INSERT INTO public.moon VALUES (10, 'Pandora', NULL, 6, 'Pandora, a potato-shaped moon, is coated in a fine (dust-sized) icy material. Even the craters on Pandora are coated in debris.');
INSERT INTO public.moon VALUES (11, 'Atlas', NULL, 6, '');
INSERT INTO public.moon VALUES (12, 'Lapetus', NULL, 6, 'Giovanni Cassini discovered Iapetus on Oct. 25, 1671. However, to astronomers Iapetus appeared only as a dot whose brightness varied from brighter to fainter over the course of an orbit around Saturn.');
INSERT INTO public.moon VALUES (13, 'Titan', NULL, 6, 'Saturn`s largest moon, Titan has an earthlike cycle of liquids flowing across its surface.');
INSERT INTO public.moon VALUES (14, 'Ymir', NULL, 6, '');
INSERT INTO public.moon VALUES (15, 'Prometheus', NULL, 6, 'The Voyager 1 science team discovered Prometheus in October 1980.');
INSERT INTO public.moon VALUES (16, 'Hyperion', NULL, 6, '');
INSERT INTO public.moon VALUES (17, 'Rosalind', NULL, 7, 'Rosalind was discovered by the Voyager 2 science team on 13 January 1986.');
INSERT INTO public.moon VALUES (18, 'Umbriel', NULL, 7, 'Umbriel was discovered on Oct. 24, 1851 by English astronomer William Lassell.');
INSERT INTO public.moon VALUES (19, 'Triton', NULL, 8, 'Triton is the only known satellite in our solar system to have a surface made mainly of nitrogen ice.');
INSERT INTO public.moon VALUES (20, 'Charon', NULL, 9, 'At half the size of Pluto, Charon is the largest of Pluto`s moons and the largest known satellite relative to its parent body.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 167, 'Mercury—the smallest planet in our solar system and closest to the Sun—is only slightly larger than Earths Moon. Mercury is the fastest planet, zipping around the Sun every 88 Earth days.', 3.7, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 464, 'Venus spins slowly in the opposite direction from most planets. A thick atmosphere traps heat in a runaway greenhouse effect, making it the hottest planet in our solar system.', 8.87, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 15, 'Earth—our home planet—is the only place we know of so far that is inhabited by living things. It is also the only planet in our solar system with liquid water on the surface.', 9.807, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, -65, 'Mars is a dusty, cold, desert world with a very thin atmosphere. There is strong evidence Mars was—billions of years ago—wetter and warmer, with a thicker atmosphere.', 3.721, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, -110, 'Jupiter is more than twice as massive than the other planets of our solar system combined. The giant planets Great Red spot is a centuries-old storm bigger than Earth.', 24.79, 80, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, -140, 'Adorned with a dazzling, complex system of icy rings, Saturn is unique in our solar system. The other giant planets have rings, but none are as spectacular as Saturn is.', 10.44, 62, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, -195, 'Uranus—seventh planet from the Sun—rotates at a nearly 90-degree angle from the plane of its orbit. This unique tilt makes Uranus appear to spin on its side.', 8.87, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, -200, 'Neptune—the eighth and most distant major planet orbiting our Sun—is dark, cold and whipped by supersonic winds. It was the first planet located through mathematical calculations, rather than by telescope.', 11.15, 14, 1);
INSERT INTO public.planet VALUES (9, 'Pluto (>.>)', false, -225, 'Pluto is a complex world of ice mountains and frozen plains. Pluto is the largest member of the Kuiper Belt and the best known of a new class of worlds called dwarf planets.', 0.62, 5, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', false, -108, 'Ceres makes up almost a third of the asteroid belts total mass, but it is still far smaller than Earths Moon. Ceres is heavily cratered with large amounts of ice underground.', 0.27, 0, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', false, -240, 'Haumea rotates so fast the spin distorts its shape, giving this dwarf planet a distinct egg-like shape. Haumea has two moons, Hi`iaka and Namaka.', 0.401, 2, 1);
INSERT INTO public.planet VALUES (12, 'Eris', false, -217, 'Eris is the most massive and second-largest known dwarf planet in the Solar System. It is a trans-Neptunian object in the scattered disk and has a high-eccentricity orbit.', 0.82, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1, 'yellow dwarf star', 'white');
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, 'B8IVpMnHg', 'blue-white');
INSERT INTO public.star VALUES (3, 'Polaris', 1, 'Cepheid Variable (pulsing)', 'yellow');
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'binary star', 'blue-white');
INSERT INTO public.star VALUES (5, 'Beta Trianguli', 3, 'Spectroscopic Binary', 'blue-white');
INSERT INTO public.star VALUES (6, 'Mirach', 2, 'M0 111', 'Red Giant');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: junction_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junction_table_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junction_table junction_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_pkey PRIMARY KEY (junction_table_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (name);


--
-- Name: junction_table unique_junction_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT unique_junction_name UNIQUE (name);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


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

