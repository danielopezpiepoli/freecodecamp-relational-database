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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_earth_mly numeric,
    constellation character varying(20),
    age_in_millions_of_years integer,
    description text,
    galaxy_type_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    key_stellar_population text,
    interstellar_gas_abundance text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    radius_in_km integer,
    orbital_period_in_days numeric,
    has_atmosphere boolean,
    is_spherical boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    planet_type character varying(20),
    mass_earth_masses numeric,
    has_life boolean,
    is_spherical boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    star_type character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth_ly numeric,
    temperature_kelvin integer,
    galaxy_id integer
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 0, 'Sagittarius', 13600, 'Our own galaxy, a barred spiral galaxy hosting our solar system.', 2);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy (M31)', 2, 2.53, 'Andromeda', 10000, 'Giant spiral galaxy located about 2.5 million light-years away.', 1);
INSERT INTO public.galaxy VALUES ('Pinwheel Galaxy (M101)', 3, 21, 'Ursa Major', 12800, 'Classic spiral galaxy situated in the Ursa Major constellation.', 1);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy (M104)', 4, 28, 'Virgo', 13250, 'Spiral galaxy noted for its bright nucleus and prominent dust lane resembling a Mexican hat.', 1);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy (M51)', 5, 23, 'Canes Venatici', 400, 'Famous spiral galaxy actively interacting with a neighboring galaxy.', 1);
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy (M64)', 6, 17, 'Coma Berenices', 13100, 'Spiral galaxy famous for its spectacular dark band of dust absorbing light behind the nucleus.', 1);
INSERT INTO public.galaxy VALUES ('Sunflower Galaxy (M63)', 7, 27, 'Canes Venatici', 13200, 'Spiral galaxy with a bright core that resembles the petals of a sunflower.', 1);
INSERT INTO public.galaxy VALUES ('M87', 8, 53.5, 'Virgo', 13200, 'Supergiant elliptical galaxy, famous for hosting the first black hole ever photographed.', 3);
INSERT INTO public.galaxy VALUES ('M60', 9, 54, 'Virgo', 13100, 'Bright giant elliptical galaxy located in the Virgo Cluster.', 3);
INSERT INTO public.galaxy VALUES ('IC 1101', 10, 1040, 'Virgo', 12300, 'One of the largest and most luminous known galaxies in the observable universe.', 3);
INSERT INTO public.galaxy VALUES ('Cigar Galaxy (M82)', 11, 12, 'Ursa Major', 13000, 'Starburst irregular galaxy with a long cigar-like shape in Ursa Major.', 5);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 12, 0.163, 'Dorado', 13010, 'Dwarf irregular satellite galaxy of the Milky Way.', 5);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 13, 0.2, 'Tucana', 6500, 'Nearby dwarf irregular satellite galaxy of the Milky Way.', 5);
INSERT INTO public.galaxy VALUES ('Cartwheel Galaxy', 14, 500, 'Sculptor', 13000, 'Lenticular galaxy with a wheel-like shape caused by a cosmic collision.', 4);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Flattened rotating disk with a central bulge and prominent curved arms. Rich in gas and dust.', 'Mix of young blue stars in arms and old stars in the core.', 'High (Active star formation).');
INSERT INTO public.galaxy_type VALUES (2, 'Barred Spiral', 'A variation of spiral galaxies featuring a central elongated bar of stars from which the spiral arms emerge.', 'Young stars along the bar and arms; older stars in the central bar structure.', 'High (Channeled toward the center).');
INSERT INTO public.galaxy_type VALUES (3, 'Elliptical', 'Smooth, featureless structures ranging from nearly spherical to highly elongated ellipsoids, lacking a distinct disk.', 'Dominated by old, cool, low-mass red stars ("cosmic graveyards").', 'Extremely Low (Almost no new stars).');
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'Disc-shaped galaxies with a large central bulge but completely lacking spiral arms, representing a transitional state.', 'Aging, older stellar populations with minimal recent evolutionary changes.', 'Very Low (Spent or stripped gas reservoirs).');
INSERT INTO public.galaxy_type VALUES (5, 'Irregular', 'Galaxies lacking any defined shape, symmetry, or central structure, often distorted by gravitational interactions.', 'Dominated by young, massive stellar clusters and intense localized starbursts.', 'Very High (Erratic star formation).');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('The Moon', 1, 1737, 27.32, false, true, 1);
INSERT INTO public.moon VALUES ('Phobos', 2, 11, 0.32, false, false, 2);
INSERT INTO public.moon VALUES ('Deimos', 3, 6, 1.26, false, false, 2);
INSERT INTO public.moon VALUES ('Io', 4, 1821, 1.77, false, true, 3);
INSERT INTO public.moon VALUES ('Europa', 5, 1560, 3.55, false, true, 3);
INSERT INTO public.moon VALUES ('Ganymede', 6, 2634, 7.15, false, true, 3);
INSERT INTO public.moon VALUES ('Callisto', 7, 2410, 16.69, false, true, 3);
INSERT INTO public.moon VALUES ('Titan', 8, 2574, 15.95, true, true, 4);
INSERT INTO public.moon VALUES ('Enceladus', 9, 252, 1.37, false, true, 4);
INSERT INTO public.moon VALUES ('Mimas', 10, 198, 0.94, false, true, 4);
INSERT INTO public.moon VALUES ('Iapetus', 11, 734, 79.32, false, true, 4);
INSERT INTO public.moon VALUES ('Rhea', 12, 763, 4.51, false, true, 4);
INSERT INTO public.moon VALUES ('Dione', 13, 561, 2.73, false, true, 4);
INSERT INTO public.moon VALUES ('Tethys', 14, 531, 1.88, false, true, 4);
INSERT INTO public.moon VALUES ('Titania', 15, 788, 8.71, false, true, 5);
INSERT INTO public.moon VALUES ('Oberon', 16, 761, 13.46, false, true, 5);
INSERT INTO public.moon VALUES ('Umbriel', 17, 584, 4.14, false, true, 5);
INSERT INTO public.moon VALUES ('Ariel', 18, 578, 2.52, false, true, 5);
INSERT INTO public.moon VALUES ('Triton', 19, 1353, -5.88, true, true, 6);
INSERT INTO public.moon VALUES ('Nereid', 20, 170, 360.13, false, false, 6);
INSERT INTO public.moon VALUES ('Aethel-Luna', 21, 1200, 14.2, false, true, 9);
INSERT INTO public.moon VALUES ('Scylla', 22, 450, 3.1, false, true, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 'Terrestrial', 1, true, true, 1);
INSERT INTO public.planet VALUES ('Mars', 2, 'Terrestrial', 0.11, false, true, 1);
INSERT INTO public.planet VALUES ('Jupiter', 3, 'Gas Giant', 317.8, false, true, 1);
INSERT INTO public.planet VALUES ('Saturn', 4, 'Gas Giant', 95.2, false, true, 1);
INSERT INTO public.planet VALUES ('Uranus', 5, 'Ice Giant', 14.5, false, true, 1);
INSERT INTO public.planet VALUES ('Neptune', 6, 'Ice Giant', 17.1, false, true, 1);
INSERT INTO public.planet VALUES ('Alpha Centauri Bb', 7, 'Lava World', 1.13, false, true, 3);
INSERT INTO public.planet VALUES ('Kepler-186f', 8, 'Terrestrial', 1.4, false, true, 5);
INSERT INTO public.planet VALUES ('Aethelgard', 9, 'Super-Earth', 4.5, true, true, 6);
INSERT INTO public.planet VALUES ('V oblivion', 10, 'Carbon Planet', 12, false, true, 4);
INSERT INTO public.planet VALUES ('Charybdis', 11, 'Ocean Wor
ld', 7.2, false, true, 8);
INSERT INTO public.planet VALUES ('Chronos', 12, 'Chthonian Planet', 50, false, true, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 'Yellow Dwarf', 4600, 0.000016, 5778, 1);
INSERT INTO public.star VALUES ('Sirius A', 2, 'Main Sequence (A-type)', 242, 8.6, 9940, 1);
INSERT INTO public.star VALUES ('Alpha Centauri A', 3, 'Yellow Dwarf', 5300, 4.37, 5790, 1);
INSERT INTO public.star VALUES ('Betelgeuse', 4, 'Red Supergiant', 8, 640, 3500, 1);
INSERT INTO public.star VALUES ('Kepler-186', 5, 'Red Dwarf', 4000, 582, 3788, 1);
INSERT INTO public.star VALUES ('Andromeda-X1', 6, 'Blue Supergiant', 15, 2530000, 25000, 2);
INSERT INTO public.star VALUES ('Sombrero-Prime', 8, 'Red Giant', 12000, 28000000, 4200, 4);
INSERT INTO public.star VALUES ('Pinwheel-X1', 9, 'Blue Supergiant', 15, 21000000, 30000, 3);
INSERT INTO public.star VALUES ('M87-Core', 10, 'Yellow Giant', 11500, 53500000, 5100, 8);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 14, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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

