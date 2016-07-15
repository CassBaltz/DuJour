--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chefs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE chefs (
    id integer NOT NULL,
    bio_photo_file_name character varying(255),
    bio_photo_content_type character varying(255),
    bio_photo_file_size integer,
    bio_photo_updated_at timestamp without time zone,
    name character varying(255),
    bio text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.chefs OWNER TO postgres;

--
-- Name: chefs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE chefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chefs_id_seq OWNER TO postgres;

--
-- Name: chefs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE chefs_id_seq OWNED BY chefs.id;


--
-- Name: cooking_tools; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cooking_tools (
    id integer NOT NULL,
    name character varying(255),
    icon_file_name character varying(255),
    icon_content_type character varying(255),
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    meal_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.cooking_tools OWNER TO postgres;

--
-- Name: cooking_tools_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cooking_tools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cooking_tools_id_seq OWNER TO postgres;

--
-- Name: cooking_tools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cooking_tools_id_seq OWNED BY cooking_tools.id;


--
-- Name: header_photos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE header_photos (
    id integer NOT NULL,
    name character varying(255),
    picture_file_name character varying(255),
    picture_content_type character varying(255),
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    meal_id integer
);


ALTER TABLE public.header_photos OWNER TO postgres;

--
-- Name: header_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE header_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.header_photos_id_seq OWNER TO postgres;

--
-- Name: header_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE header_photos_id_seq OWNED BY header_photos.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ingredients (
    id integer NOT NULL,
    name character varying(255),
    measurement_quantity numeric,
    measurement_type character varying(255),
    order_option_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ingredients OWNER TO postgres;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO postgres;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ingredients_id_seq OWNED BY ingredients.id;


--
-- Name: instructions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE instructions (
    id integer NOT NULL,
    content text,
    order_option_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.instructions OWNER TO postgres;

--
-- Name: instructions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE instructions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructions_id_seq OWNER TO postgres;

--
-- Name: instructions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE instructions_id_seq OWNED BY instructions.id;


--
-- Name: meal_limits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meal_limits (
    id integer NOT NULL,
    meal_id integer,
    store_id integer,
    availability integer,
    current_orders integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status boolean DEFAULT false
);


ALTER TABLE public.meal_limits OWNER TO postgres;

--
-- Name: meal_limits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE meal_limits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meal_limits_id_seq OWNER TO postgres;

--
-- Name: meal_limits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE meal_limits_id_seq OWNED BY meal_limits.id;


--
-- Name: meal_photos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meal_photos (
    id integer NOT NULL,
    name character varying(255),
    meal_id integer,
    picture_file_name character varying(255),
    picture_content_type character varying(255),
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.meal_photos OWNER TO postgres;

--
-- Name: meal_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE meal_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meal_photos_id_seq OWNER TO postgres;

--
-- Name: meal_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE meal_photos_id_seq OWNED BY meal_photos.id;


--
-- Name: meals; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meals (
    id integer NOT NULL,
    name character varying(255),
    description text,
    date date,
    chef_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    end_time timestamp without time zone,
    prep_time character varying(255),
    cook_time character varying(255)
);


ALTER TABLE public.meals OWNER TO postgres;

--
-- Name: meals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE meals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meals_id_seq OWNER TO postgres;

--
-- Name: meals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE meals_id_seq OWNED BY meals.id;


--
-- Name: order_options; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_options (
    id integer NOT NULL,
    size character varying(255),
    feeds character varying(255),
    price numeric,
    meal_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255)
);


ALTER TABLE public.order_options OWNER TO postgres;

--
-- Name: order_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_options_id_seq OWNER TO postgres;

--
-- Name: order_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE order_options_id_seq OWNED BY order_options.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    user_id integer,
    meal_id integer,
    order_option_id integer,
    store_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "stripeToken" character varying(255),
    state character varying(255),
    ready_for_pickup boolean DEFAULT false
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: relationships; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE relationships (
    id integer NOT NULL,
    store_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.relationships OWNER TO postgres;

--
-- Name: relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationships_id_seq OWNER TO postgres;

--
-- Name: relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE relationships_id_seq OWNED BY relationships.id;


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE restaurants (
    id integer NOT NULL,
    name character varying(255),
    website character varying(255),
    description text,
    chef_id integer,
    city character varying(255),
    state character varying(255),
    restaurant_picture_file_name character varying(255),
    restaurant_picture_content_type character varying(255),
    restaurant_picture_file_size integer,
    restaurant_picture_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.restaurants OWNER TO postgres;

--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE restaurants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_id_seq OWNER TO postgres;

--
-- Name: restaurants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE restaurants_id_seq OWNED BY restaurants.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stores (
    id integer NOT NULL,
    email character varying(255),
    name character varying(255),
    password_digest character varying(255),
    remember_token character varying(255),
    street character varying(255),
    street_alt character varying(255),
    city character varying(255),
    state character varying(255),
    zip integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    zip integer,
    email character varying(255),
    password_digest character varying(255),
    remember_token character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin boolean DEFAULT false,
    password_recovery_token character varying(255),
    password_recovery_sent_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chefs ALTER COLUMN id SET DEFAULT nextval('chefs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cooking_tools ALTER COLUMN id SET DEFAULT nextval('cooking_tools_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY header_photos ALTER COLUMN id SET DEFAULT nextval('header_photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingredients ALTER COLUMN id SET DEFAULT nextval('ingredients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instructions ALTER COLUMN id SET DEFAULT nextval('instructions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meal_limits ALTER COLUMN id SET DEFAULT nextval('meal_limits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meal_photos ALTER COLUMN id SET DEFAULT nextval('meal_photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meals ALTER COLUMN id SET DEFAULT nextval('meals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_options ALTER COLUMN id SET DEFAULT nextval('order_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relationships ALTER COLUMN id SET DEFAULT nextval('relationships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY restaurants ALTER COLUMN id SET DEFAULT nextval('restaurants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: chefs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY chefs (id, bio_photo_file_name, bio_photo_content_type, bio_photo_file_size, bio_photo_updated_at, name, bio, created_at, updated_at) FROM stdin;
1	chef.jpg	image/jpeg	7923	2014-09-06 11:42:18.214982	John	[Bio info would go here]	2014-09-06 11:42:18.284988	2014-09-06 11:42:18.284988
2	chef.jpg	image/jpeg	7923	2014-09-06 11:43:00.971339	Jeff	[Bio info would go here]	2014-09-06 11:43:01.123373	2014-09-06 11:43:01.123373
3	chef.jpg	image/jpeg	7923	2014-09-06 11:43:40.375309	Jake	[Bio info would go here]	2014-09-06 11:43:40.438326	2014-09-06 11:43:40.438326
\.


--
-- Name: chefs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('chefs_id_seq', 3, true);


--
-- Data for Name: cooking_tools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cooking_tools (id, name, icon_file_name, icon_content_type, icon_file_size, icon_updated_at, meal_id, created_at, updated_at) FROM stdin;
1	pot	pot.jpg	image/jpeg	10031	2014-09-06 13:24:25.279757	1	2014-09-06 13:24:25.364741	2014-10-21 06:23:05.203441
\.


--
-- Name: cooking_tools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cooking_tools_id_seq', 1, true);


--
-- Data for Name: header_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY header_photos (id, name, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, created_at, updated_at, meal_id) FROM stdin;
1	steak	steak_header.jpg	image/jpeg	61514	2014-10-23 06:32:43.058745	2014-10-23 06:32:43.247836	2014-10-23 06:32:43.247836	3
2	Orange Chicken	baked_chicken2.jpg	image/jpeg	9401	2014-12-23 06:11:09.246307	2014-12-23 06:11:09.312323	2014-12-23 06:11:09.312323	2
3	Cheeseburger	cheeseburger.jpg	image/jpeg	6697	2015-01-22 06:10:13.183966	2015-01-22 06:10:13.246998	2015-01-22 06:10:13.246998	1
\.


--
-- Name: header_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('header_photos_id_seq', 3, true);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ingredients (id, name, measurement_quantity, measurement_type, order_option_id, created_at, updated_at) FROM stdin;
1	ground beef	0.6	lbs.	1	2014-09-06 13:26:09.215838	2014-09-06 13:26:09.215838
2	ground beef	1.2	lbs.	2	2014-09-06 13:26:27.607188	2014-09-06 13:26:27.607188
4	russet potato	1.0	ct.	3	2014-09-08 06:22:13.439111	2014-09-08 06:23:05.793716
3	steak	16.0	oz.	3	2014-09-08 06:20:44.569904	2014-09-08 06:23:05.798716
5	fresh bun	2.0	ct.	1	2014-09-08 06:23:43.501469	2014-09-08 06:23:52.380612
6	fresh bun	4.0	ct.	2	2014-09-08 06:24:30.117348	2014-09-08 06:24:32.436628
8	steak	32.0	oz.	4	2014-09-08 06:28:02.799156	2014-09-08 06:28:34.616183
7	russet potato	2.0	ct.	4	2014-09-08 06:27:17.681492	2014-09-08 06:28:34.621186
10	rice	16.0	oz.	5	2014-09-08 06:36:36.77601	2014-09-08 06:37:02.086181
9	chicken breast	1.0	lb.	5	2014-09-08 06:36:12.831969	2014-09-08 06:37:02.089182
12	rice	32.0	oz.	6	2014-09-08 06:38:23.766482	2014-09-08 06:38:52.85515
11	chicken breast	32.0	oz.	6	2014-09-08 06:38:04.473062	2014-09-08 06:38:52.860151
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ingredients_id_seq', 12, true);


--
-- Data for Name: instructions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY instructions (id, content, order_option_id, created_at, updated_at) FROM stdin;
1	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	1	2014-09-06 13:27:13.349929	2014-09-06 13:27:13.349929
2	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	1	2014-09-06 13:27:23.405222	2014-09-06 13:27:23.405222
3	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	2	2014-09-06 13:27:32.249345	2014-09-06 13:27:32.249345
4	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	2	2014-09-06 13:27:40.256349	2014-09-06 13:27:40.256349
6	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	3	2014-09-08 06:22:56.657581	2014-09-08 06:23:05.803717
5	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	3	2014-09-08 06:22:47.003338	2014-09-08 06:23:05.807716
8	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	4	2014-09-08 06:28:30.448643	2014-09-08 06:28:34.625184
7	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	4	2014-09-08 06:28:18.333117	2014-09-08 06:28:34.628186
10	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	5	2014-09-08 06:36:49.007531	2014-09-08 06:37:02.095182
9	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	5	2014-09-08 06:36:43.782873	2014-09-08 06:37:02.098182
12	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	6	2014-09-08 06:38:49.749759	2014-09-08 06:38:52.86315
11	Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.	6	2014-09-08 06:38:44.941153	2014-09-08 06:38:52.867151
\.


--
-- Name: instructions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('instructions_id_seq', 12, true);


--
-- Data for Name: meal_limits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meal_limits (id, meal_id, store_id, availability, current_orders, created_at, updated_at, status) FROM stdin;
39	2	1	50	0	2015-01-18 10:09:54.120985	2015-01-18 10:09:54.120985	f
41	1	1	110	0	2015-01-31 06:48:31.335799	2015-01-31 06:48:31.335799	f
42	3	1	50	0	2015-01-31 06:58:42.126553	2015-01-31 06:58:42.126553	f
45	3	3	80	0	2015-02-03 05:46:42.581787	2015-02-03 05:46:42.581787	f
\.


--
-- Name: meal_limits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('meal_limits_id_seq', 45, true);


--
-- Data for Name: meal_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meal_photos (id, name, meal_id, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, created_at, updated_at) FROM stdin;
2	hamburger 2	1	cheeseburger2.jpg	image/jpeg	8164	2014-09-06 13:24:08.972698	2014-09-06 13:24:09.084721	2014-09-06 13:29:08.813488
1	hamburger 1	1	cheeseburger.jpg	image/jpeg	6697	2014-09-06 13:23:30.64584	2014-09-06 13:23:30.781861	2014-09-06 13:29:08.820494
4	Orange Chicken 2	2	orange_chicken2.jpg	image/jpeg	13134	2014-09-08 06:04:07.210112	2014-09-08 06:04:07.283198	2014-09-08 06:07:36.259476
3	Orange Chicken 1	2	orange_chicken.jpg	image/jpeg	10334	2014-09-08 06:03:34.839063	2014-09-08 06:03:34.942043	2014-09-08 06:07:36.266478
6	Steak 2	3	steak2.jpg	image/jpeg	12454	2014-09-08 06:14:44.121448	2014-09-08 06:14:44.23646	2014-09-08 06:15:08.606555
5	Steak 1	3	steak1.jpg	image/jpeg	8881	2014-09-08 06:14:26.154172	2014-09-08 06:14:26.228183	2014-09-08 06:15:08.609555
\.


--
-- Name: meal_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('meal_photos_id_seq', 6, true);


--
-- Data for Name: meals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meals (id, name, description, date, chef_id, created_at, updated_at, end_time, prep_time, cook_time) FROM stdin;
1	Hamburger	[hamburger description goes here]	2015-02-19	3	2014-09-06 13:29:08.806486	2015-01-31 06:23:11.734689	2015-02-19 11:45:00	15 mins	15 mins
2	Orange Chicken	[Orange Chicken Description]	2015-01-31	2	2014-09-08 06:07:36.253475	2015-01-31 07:19:57.138347	2015-01-31 21:00:00	20 mins	20 mins
3	Steak	[Steak description goes here]	2015-02-05	1	2014-09-08 06:15:08.600555	2015-02-05 05:54:15.673562	2015-02-05 21:15:00	10 mins	20 mins
\.


--
-- Name: meals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('meals_id_seq', 3, true);


--
-- Data for Name: order_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_options (id, size, feeds, price, meal_id, created_at, updated_at, name) FROM stdin;
4	medium	4	20.0	3	2014-09-08 06:28:34.609182	2014-09-08 06:28:34.609182	Steak Medium
5	small	2	9.24	2	2014-09-08 06:37:02.08018	2014-09-08 06:37:02.08018	Orange Chicken Small
6	medium	4	17.2	2	2014-09-08 06:38:52.851149	2014-09-08 06:38:52.851149	Orange Chicken Medium
2	medium	4	18.09	1	2014-09-06 13:25:29.738859	2014-10-21 06:23:05.229448	Hamburger Medium
1	small	2	12.32	1	2014-09-06 13:24:57.455788	2014-10-21 06:23:05.235446	Hamburger Small
3	small	2	13.0	3	2014-09-08 06:23:05.78772	2014-10-29 06:37:04.201623	Steak Small
\.


--
-- Name: order_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_options_id_seq', 6, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders (id, user_id, meal_id, order_option_id, store_id, created_at, updated_at, "stripeToken", state, ready_for_pickup) FROM stdin;
1	2	3	4	3	2014-09-10 06:53:12.041342	2014-09-29 06:22:59.867833	tok_14b8ihGUL8wHfeXBnwa6iXDX	\N	t
2	2	3	3	3	2014-09-17 10:16:09.682055	2014-09-29 06:25:42.907921	tok_14djDrGUL8wHfeXBMg78SWel	\N	t
3	7	3	3	3	2014-10-08 06:29:54.567381	2014-10-09 06:20:25.57399	tok_14lHh6GUL8wHfeXB7kxLYu9Q	\N	t
4	7	3	4	3	2014-10-08 06:41:49.523618	2014-10-09 06:20:57.638247	tok_14lHsdGUL8wHfeXBjclFhfDZ	\N	t
5	7	3	4	3	2014-10-08 06:42:46.097641	2014-10-09 06:22:03.146914	tok_14lHtXGUL8wHfeXBy2bMcIw1	\N	t
6	7	3	4	3	2014-10-08 06:44:18.657384	2014-10-09 06:41:14.578698	tok_14lHv2GUL8wHfeXB4L0aEbQC	\N	t
7	7	3	3	3	2014-10-08 06:49:23.984598	2014-10-09 06:44:12.074499	tok_14lHzxGUL8wHfeXBj3OXDMc9	\N	t
8	7	3	3	3	2014-10-08 06:55:51.252096	2014-10-09 06:50:30.358986	tok_14lI6DGUL8wHfeXBE7f96irM	\N	t
9	2	3	3	3	2014-10-10 06:09:40.728166	2014-10-10 06:09:42.636627	tok_14m0KbGUL8wHfeXBdSU2M625	\N	f
10	2	3	4	3	2014-10-10 06:10:04.535984	2014-10-10 06:10:05.930135	tok_14m0KzGUL8wHfeXBsU3r2e53	\N	f
11	2	3	3	3	2014-10-10 06:10:27.926195	2014-10-10 06:10:29.392402	tok_14m0LMGUL8wHfeXBJig3FmRR	\N	f
12	2	3	4	3	2014-10-10 06:10:49.995326	2014-10-10 06:10:51.759562	tok_14m0LiGUL8wHfeXBT2Uq51HV	\N	f
13	2	3	3	3	2014-10-10 06:11:12.298297	2014-10-10 06:11:14.023509	tok_14m0M4GUL8wHfeXBEdOJbfy7	\N	f
14	2	3	4	3	2014-10-10 06:11:43.283611	2014-10-10 06:11:44.876959	tok_14m0MZGUL8wHfeXBn8AJsaHp	\N	f
15	2	3	3	3	2014-10-10 06:12:02.284549	2014-10-10 06:12:03.800792	tok_14m0MsGUL8wHfeXBG9qL9xBv	\N	f
16	2	3	3	3	2014-10-10 06:12:20.703222	2014-10-10 06:12:22.178399	tok_14m0NBGUL8wHfeXBgvfI7F9W	\N	f
17	8	2	5	1	2014-12-23 06:50:58.247286	2015-01-07 06:30:01.343917	tok_15CrBeGUL8wHfeXBP98yjCJN		t
18	10	2	5	1	2015-01-06 06:05:55.668537	2015-01-07 06:30:13.943646	tok_15Hv9kGUL8wHfeXByMlTX1UG		t
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orders_id_seq', 18, true);


--
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY relationships (id, store_id, user_id, created_at, updated_at) FROM stdin;
1	3	1	2014-09-09 06:28:38.464604	2014-09-09 06:28:38.464604
2	1	1	2014-09-09 06:29:23.931496	2014-09-09 06:29:23.931496
3	3	1	2014-09-10 05:41:27.403231	2014-09-10 05:41:27.403231
4	3	2	2014-09-10 06:10:05.177321	2014-09-10 06:10:05.177321
5	3	7	2014-10-08 06:21:34.631418	2014-10-08 06:21:34.631418
6	2	2	2014-12-18 06:04:29.034526	2014-12-18 06:04:29.034526
7	2	3	2014-12-20 17:15:50.924665	2014-12-20 17:15:50.924665
8	1	8	2014-12-23 06:14:34.278935	2014-12-23 06:14:34.278935
9	1	10	2015-01-05 06:17:21.052265	2015-01-05 06:17:21.052265
10	3	2	2015-01-19 06:40:26.474656	2015-01-19 06:40:26.474656
11	2	2	2015-01-19 06:42:09.835686	2015-01-19 06:42:09.835686
12	3	2	2015-01-19 06:43:23.684795	2015-01-19 06:43:23.684795
13	3	2	2015-01-19 06:45:30.338655	2015-01-19 06:45:30.338655
14	1	2	2015-01-19 18:04:07.409248	2015-01-19 18:04:07.409248
15	3	2	2015-01-19 18:09:48.89839	2015-01-19 18:09:48.89839
16	3	2	2015-01-19 18:12:55.537584	2015-01-19 18:12:55.537584
17	2	2	2015-01-19 18:22:40.891743	2015-01-19 18:22:40.891743
18	3	2	2015-01-19 18:29:31.313978	2015-01-19 18:29:31.313978
19	1	2	2015-01-19 18:29:37.699065	2015-01-19 18:29:37.699065
20	2	2	2015-01-20 06:02:31.282037	2015-01-20 06:02:31.282037
21	3	2	2015-01-20 06:34:20.83557	2015-01-20 06:34:20.83557
22	1	2	2015-01-21 05:40:57.37443	2015-01-21 05:40:57.37443
23	3	2	2015-01-24 09:31:15.808931	2015-01-24 09:31:15.808931
24	1	2	2015-01-24 12:52:11.434385	2015-01-24 12:52:11.434385
25	3	2	2015-01-24 12:53:24.236781	2015-01-24 12:53:24.236781
26	1	2	2015-01-26 05:49:06.658762	2015-01-26 05:49:06.658762
27	3	2	2015-01-26 05:58:31.981535	2015-01-26 05:58:31.981535
28	1	2	2015-01-26 06:00:33.827386	2015-01-26 06:00:33.827386
29	3	2	2015-01-26 06:20:18.385826	2015-01-26 06:20:18.385826
30	1	2	2015-01-26 06:27:53.666065	2015-01-26 06:27:53.666065
31	3	2	2015-01-26 06:28:07.159958	2015-01-26 06:28:07.159958
32	1	2	2015-01-26 06:34:48.5606	2015-01-26 06:34:48.5606
33	3	2	2015-01-27 06:28:49.656722	2015-01-27 06:28:49.656722
34	1	2	2015-01-27 06:42:08.015069	2015-01-27 06:42:08.015069
35	2	2	2015-01-28 05:39:22.369243	2015-01-28 05:39:22.369243
36	3	2	2015-01-28 05:52:23.370241	2015-01-28 05:52:23.370241
37	1	2	2015-01-28 05:52:33.718296	2015-01-28 05:52:33.718296
38	2	2	2015-01-28 06:39:48.389127	2015-01-28 06:39:48.389127
39	3	2	2015-01-29 05:48:14.144836	2015-01-29 05:48:14.144836
40	1	2	2015-01-29 05:48:38.792586	2015-01-29 05:48:38.792586
\.


--
-- Name: relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('relationships_id_seq', 40, true);


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY restaurants (id, name, website, description, chef_id, city, state, restaurant_picture_file_name, restaurant_picture_content_type, restaurant_picture_file_size, restaurant_picture_updated_at, created_at, updated_at) FROM stdin;
1	Jake's Hamburger Shack	www.jakeshamburgershack.com	[jhs description goes here]	3	Raleigh	NC	little_italy.jpg	image/jpeg	45371	2014-09-08 06:40:17.205788	2014-09-08 06:40:17.334791	2014-09-08 06:40:17.334791
2	Jeff's Steakhouse	www.jeffssteakhouse.com	[js description goes here]	2	Raleigh	NC	little_italy.jpg	image/jpeg	45371	2014-09-08 06:41:12.510761	2014-09-08 06:41:12.606794	2014-09-08 06:41:12.606794
3	John's Asian Bistro	www.johnsasianbistro.com	[jab description goes here]	1	Raleigh	NC	little_italy.jpg	image/jpeg	45371	2014-09-08 06:42:15.586716	2014-09-08 06:42:15.679729	2014-09-08 06:42:15.679729
\.


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('restaurants_id_seq', 3, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20140902100019
20140430133821
20140430234338
20140501002227
20140501010756
20140501132009
20140501144517
20140502004714
20140503214523
20140510150906
20140513130612
20140513131143
20140513131409
20140513131534
20140513131944
20140513132741
20140513132857
20140513133122
20140513133336
20140520141203
20140520145937
20140520150202
20140520153234
20140522003829
20140522145627
20140522150004
20140628142308
20140628142405
20140721104606
20140729105546
20140811104124
20140811104756
20140816184820
20140823200418
20140823200727
20140823221604
20140816190803
20140906173447
20140906173636
20140926102648
20141022102826
20141022104917
20141022105225
20141210105132
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessions (id, session_id, data, created_at, updated_at) FROM stdin;
7	885731705b2457cfd6fb399af49a6c5f	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFNM3FNbUViaUx6WVJtckZGWm9y\nbGxLai85TE5sNTV4b0lVZmZHYThWOGswPQY7AEY=\n	2014-10-17 06:23:41.89359	2014-10-23 06:43:16.430117
1	8393672280fe0f644dea1bfae4895bdc	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFvZ3lOaG03eXdvZDNxallJVmE1\nYWZnNFBYaWpyNFhnSE9uNnI4VmhlNU84PQY7AEY=\n	2014-09-06 10:14:04.471689	2014-09-08 06:42:32.733884
8	b71517603da11aa3c7155f503690c264	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF4dCtGVVY1Ry9mYWZBTFhQUkNL\nUERWY1hPVWZ3NDljQzNrU3VVb0ZIU3ZRPQY7AEY=\n	2014-10-25 10:17:08.056666	2014-10-29 06:37:11.78179
2	ed12b2926259e164eb6ef1c144d83803	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFVb1ppRnlYa0FtWDRra1pDZTM0\nV2dXV3dqcm00V3Zhc3BOZ0tIVzljb01JPQY7AEY=\n	2014-09-10 05:40:53.652644	2014-09-10 06:51:40.109174
3	6e0910dca99e79d32c1a28c0e11e27aa	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFBTHdmMkczeWl2d01oS2drOWxi\nK3FNbGNtZm9mTEgrbiswMlJvalFseW1ZPQY7AEY=\n	2014-09-11 05:43:46.282727	2014-09-11 05:43:46.282727
9	866d910b753c28289c8ad8649cd7ba26	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFwN0hhMUtLdHVtYmpTNXErTGRu\nMWdkRWFVWTBtdXpKVVZPMm1CdUhwQ0hrPQY7AEY=\n	2014-10-30 05:43:44.137187	2015-01-24 11:38:42.093805
10	9bf45f940548ca543fe40a560c7927e4	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFJOEhGTVlzcU9zZDZKQnZlRGZX\nS2NMSStFL3o0TFVtd1RvaytGU2xIcjJZPQY7AEY=\n	2015-01-26 05:48:51.365069	2015-01-26 05:48:51.365069
4	90efebaadb66e36a4a38f21e6faba2a2	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFkdlphVWd4WS94VHFHUkxOaFU3\naDdwMEZ4Mnp1RzhLa1BkdjdiT1Q4M0tZPQY7AEY=\n	2014-09-16 17:28:36.192875	2014-10-09 06:08:40.244742
5	8b0cebbda2bdd57e061b778c15b0bff5	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF5RmdLa05CbEdYb3ZSNlNNdjlT\nWVJYRG5iYXdCOE5zQmR5emxxQmQ5NVJRPQY7AEY=\n	2014-10-10 06:01:47.062711	2014-10-10 06:08:50.153706
6	98718f61ef26658ec3ea59e39e75f796	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFmbUNaTzAwVlV4SUFiRDhBaE4r\ndmZWMWszUVNOUnJZZGRZcHovdys0Yk9FPQY7AEY=\n	2014-10-16 06:48:15.796529	2014-10-16 06:48:15.796529
11	0d426e4e32fdfdada5cc9f26536524ce	BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFRTVZuanhxcS9LOU1seklONG1q\nRWpkL1FIdjFvd0x2bFZEZlpTRFF5OVpJPQY7AEY=\n	2015-01-26 05:48:51.719111	2015-02-05 05:54:22.543195
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessions_id_seq', 11, true);


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY stores (id, email, name, password_digest, remember_token, street, street_alt, city, state, zip, created_at, updated_at, latitude, longitude) FROM stdin;
2	leesharristeeter@gmail.com	Harris Teeter (Leesville)	$2a$10$hF928.K7FuArexCbchMNLuSKOb5Mm9uGieHGtBuvl4KWU.2MmMDtK	a13f53d5d5853f7045efb1bdf38b4fe8b22f46ac	13200 Strickland Rd.	\N	Raleigh	NC	27613	2014-09-06 11:27:18.264371	2014-09-06 11:27:18.264371	35.908295899999999	-78.725065700000002
1	cvharristeeter@gmail.com	Harris Teeter (Cameron Village)	$2a$10$zPnpGc3eUY88uh5Kpl8wMeQTwTJBgi2oSKkfmasKG8OtWLe1zVwbC	b6bdddc7f112b1ee5aa0ef67a3662ff3161241bb	500 Oberlin Rd.	\N	Raleigh	NC	27605	2014-09-06 11:20:10.801275	2015-01-31 06:58:57.007413	35.791356299999997	-78.661845599999992
3	emharristeeter@gmail.com	Harris Teeter (Edwards Mill)	$2a$10$Ax8JsEZhQE3dzgZQ2iDT8.BGyDvX7guh9cgQ.hOIV0hN6KT0tL7k.	a5b19c4c7f80974212c13fcd9a59775fcaaddeac	3201 Edwards Mill Rd.	\N	Raleigh	NC	27612	2014-09-06 11:38:22.501229	2015-02-11 06:53:46.913467	35.825905300000002	-78.7073374
\.


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('stores_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, zip, email, password_digest, remember_token, created_at, updated_at, admin, password_recovery_token, password_recovery_sent_at) FROM stdin;
1	cass	27607	cass.baltz.email@gmail.com	$2a$10$yrVAXuKBp6G5DBKPLhpfAudrDtBap1ktC/dgrkPuVGzM79G8O4E.a	3ff528f9be3689fae6e97eb0cbd1d1657af5c2c0	2014-09-06 10:52:29.097079	2014-09-10 05:55:07.872956	f	\N	\N
4	Cass Baltz	27617	casss.baltz@gmail.com	$2a$10$cp28fwxa38nrJsrfTjywluOBitphghyqisWExD6b8ma./G7ser1b.	86949e1c5263fce1165fa829ce7877045d9e9f04	2014-10-01 06:08:41.393544	2014-10-01 06:08:41.440549	f	\N	\N
5	asdf	27613	asdf@gmail.com	$2a$10$LEBJutXoVjxX.s4Ifr208.6nFDDBAQIdUBvFnVzOisD32cH1gaSO6	1341c9969e53c93c83dfe8fac7002cb1c6e41975	2014-10-01 06:15:49.262465	2014-10-01 06:32:53.880691	f	\N	\N
6	jim	27613	jim@gmail.com	$2a$10$4lRUGJmsnrfAKiwP1lX7BOg1Cqw/0JV7Bugr9ycb7.zQwNzkhNnhW	772e35f638220f93560d1e5d589cdaa81dff2f7c	2014-10-08 05:50:11.743142	2014-10-08 05:51:13.51963	f	\N	\N
7	mike	27613	mike@gmail.com	$2a$10$QBDpwTC34YkL0mzkWFbQe.FZjplX2veBYOU.QoC0Zje/.dUucUOhS	96257b5aaf5ae9734e1c392b54492f244211569c	2014-10-08 06:02:32.459923	2014-10-09 06:09:06.872984	f	\N	\N
8	richard baltz	27607	richard.baltz@gmail.com	$2a$10$yRcHf1rQhwPJDSHhqlf/geNx2wEvmJvxUfNhhq3CRcC7VinQ7SGfC	5fe249a5171afc5b4c8df89ad417a7ba238f492f	2014-12-23 06:08:46.680068	2014-12-29 05:56:49.854949	f	\N	\N
3	Cass	27613	cass@baltzpens.com	$2a$10$WDYG4781LJu/.PwHVAxlK.HjBCe5Hc8eNQi9Y5jBLhMqT9PiHecFO	6e3af19d2e01085bee18fd226ee02aa752d36713	2014-10-01 06:05:04.023566	2014-12-31 06:35:31.718276	f	\N	\N
9	Richard Cass	27612	richard.cass@gmail.com	$2a$10$kVK0XoELvCfxd.fIgz1tEeBm6cGJMQr2WTJcprhtkobKj5heovUZC	f408f03fb5fb71362e22823ec3f18b0dce657895	2015-01-05 05:59:14.076473	2015-01-05 06:13:56.635638	f	\N	\N
10	css baltz	27613	cssbaltz@gmail.com	$2a$10$flOjOTma.4TrwXZkn7IAeesJH.oUcHqdA7JT1rGi2jRTt4U4tLI66	46c4879e7fef7e6388841a70859caab2d37cf037	2015-01-05 06:14:24.618476	2015-01-06 06:09:51.146665	f	\N	\N
2	cass baltz	27607	cass.baltz@gmail.com	$2a$10$KDrVa76l66PYXYyiOpi0.uZeLnbK7bdjw1oX9KBpGweFMmout9DyW	fc6c1411b24faf1c406ec0db4b99db08f669f310	2014-09-10 06:07:50.342993	2015-01-31 06:21:00.588682	f	QX1GqoJy60_hT18K9qYd5g	2015-01-04 11:19:18.711773
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 10, true);


--
-- Name: chefs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY chefs
    ADD CONSTRAINT chefs_pkey PRIMARY KEY (id);


--
-- Name: cooking_tools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cooking_tools
    ADD CONSTRAINT cooking_tools_pkey PRIMARY KEY (id);


--
-- Name: header_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY header_photos
    ADD CONSTRAINT header_photos_pkey PRIMARY KEY (id);


--
-- Name: ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: instructions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY instructions
    ADD CONSTRAINT instructions_pkey PRIMARY KEY (id);


--
-- Name: meal_limits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meal_limits
    ADD CONSTRAINT meal_limits_pkey PRIMARY KEY (id);


--
-- Name: meal_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meal_photos
    ADD CONSTRAINT meal_photos_pkey PRIMARY KEY (id);


--
-- Name: meals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meals
    ADD CONSTRAINT meals_pkey PRIMARY KEY (id);


--
-- Name: order_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_options
    ADD CONSTRAINT order_options_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (id);


--
-- Name: restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_meal_limits_on_store_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_meal_limits_on_store_id ON meal_limits USING btree (store_id);


--
-- Name: index_meal_limits_on_store_id_and_meal_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_meal_limits_on_store_id_and_meal_id ON meal_limits USING btree (store_id, meal_id);


--
-- Name: index_relationships_on_store_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_relationships_on_store_id ON relationships USING btree (store_id);


--
-- Name: index_relationships_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_relationships_on_user_id ON relationships USING btree (user_id);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_sessions_on_session_id ON sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_sessions_on_updated_at ON sessions USING btree (updated_at);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- Name: index_users_on_zip; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_zip ON users USING btree (zip);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

