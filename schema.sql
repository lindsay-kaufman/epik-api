--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: planner_schema; Type: SCHEMA; Schema: -; Owner: lindsaykaufman
--

CREATE SCHEMA planner_schema;


ALTER SCHEMA planner_schema OWNER TO lindsaykaufman;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activity; Type: TABLE; Schema: public; Owner: lindsaykaufman
--

CREATE TABLE public.activity (
    id integer NOT NULL,
    description character varying(50),
    created_at timestamp without time zone DEFAULT now(),
    user_id integer
);


ALTER TABLE public.activity OWNER TO lindsaykaufman;

--
-- Name: activity_id_seq; Type: SEQUENCE; Schema: public; Owner: lindsaykaufman
--

CREATE SEQUENCE public.activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_id_seq OWNER TO lindsaykaufman;

--
-- Name: activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindsaykaufman
--

ALTER SEQUENCE public.activity_id_seq OWNED BY public.activity.id;


--
-- Name: goal_occurances; Type: TABLE; Schema: public; Owner: lindsaykaufman
--

CREATE TABLE public.goal_occurances (
    id integer NOT NULL,
    goal_id integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goal_occurances OWNER TO lindsaykaufman;

--
-- Name: goal_occurances_id_seq; Type: SEQUENCE; Schema: public; Owner: lindsaykaufman
--

CREATE SEQUENCE public.goal_occurances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goal_occurances_id_seq OWNER TO lindsaykaufman;

--
-- Name: goal_occurances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindsaykaufman
--

ALTER SEQUENCE public.goal_occurances_id_seq OWNED BY public.goal_occurances.id;


--
-- Name: goals; Type: TABLE; Schema: public; Owner: lindsaykaufman
--

CREATE TABLE public.goals (
    id integer NOT NULL,
    title character varying(30),
    description character varying(300),
    completed boolean,
    start_date timestamp without time zone,
    user_id integer,
    target_occurances integer,
    duration interval,
    created_at timestamp without time zone DEFAULT now(),
    occurances integer,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goals OWNER TO lindsaykaufman;

--
-- Name: goals_id_seq; Type: SEQUENCE; Schema: public; Owner: lindsaykaufman
--

CREATE SEQUENCE public.goals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goals_id_seq OWNER TO lindsaykaufman;

--
-- Name: goals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindsaykaufman
--

ALTER SEQUENCE public.goals_id_seq OWNED BY public.goals.id;


--
-- Name: meals; Type: TABLE; Schema: public; Owner: lindsaykaufman
--

CREATE TABLE public.meals (
    id integer NOT NULL,
    name character varying(30),
    notes character varying(500),
    user_id integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.meals OWNER TO lindsaykaufman;

--
-- Name: meals_id_seq; Type: SEQUENCE; Schema: public; Owner: lindsaykaufman
--

CREATE SEQUENCE public.meals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meals_id_seq OWNER TO lindsaykaufman;

--
-- Name: meals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindsaykaufman
--

ALTER SEQUENCE public.meals_id_seq OWNED BY public.meals.id;


--
-- Name: mood; Type: TABLE; Schema: public; Owner: lindsaykaufman
--

CREATE TABLE public.mood (
    id integer NOT NULL,
    notes character varying(500),
    user_id integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.mood OWNER TO lindsaykaufman;

--
-- Name: mood_id_seq; Type: SEQUENCE; Schema: public; Owner: lindsaykaufman
--

CREATE SEQUENCE public.mood_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mood_id_seq OWNER TO lindsaykaufman;

--
-- Name: mood_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindsaykaufman
--

ALTER SEQUENCE public.mood_id_seq OWNED BY public.mood.id;


--
-- Name: reflection; Type: TABLE; Schema: public; Owner: lindsaykaufman
--

CREATE TABLE public.reflection (
    id integer NOT NULL,
    notes character varying(500),
    user_id integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.reflection OWNER TO lindsaykaufman;

--
-- Name: reflection_id_seq; Type: SEQUENCE; Schema: public; Owner: lindsaykaufman
--

CREATE SEQUENCE public.reflection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reflection_id_seq OWNER TO lindsaykaufman;

--
-- Name: reflection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindsaykaufman
--

ALTER SEQUENCE public.reflection_id_seq OWNED BY public.reflection.id;


--
-- Name: sleep; Type: TABLE; Schema: public; Owner: lindsaykaufman
--

CREATE TABLE public.sleep (
    id integer NOT NULL,
    hours integer,
    quality character varying(30),
    dreams character varying(500),
    user_id integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sleep OWNER TO lindsaykaufman;

--
-- Name: sleep_id_seq; Type: SEQUENCE; Schema: public; Owner: lindsaykaufman
--

CREATE SEQUENCE public.sleep_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sleep_id_seq OWNER TO lindsaykaufman;

--
-- Name: sleep_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindsaykaufman
--

ALTER SEQUENCE public.sleep_id_seq OWNED BY public.sleep.id;


--
-- Name: to_do; Type: TABLE; Schema: public; Owner: lindsaykaufman
--

CREATE TABLE public.to_do (
    id integer NOT NULL,
    name character varying(100),
    completed boolean,
    created_date timestamp without time zone DEFAULT now(),
    user_id integer
);


ALTER TABLE public.to_do OWNER TO lindsaykaufman;

--
-- Name: to_do_id_seq; Type: SEQUENCE; Schema: public; Owner: lindsaykaufman
--

CREATE SEQUENCE public.to_do_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.to_do_id_seq OWNER TO lindsaykaufman;

--
-- Name: to_do_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindsaykaufman
--

ALTER SEQUENCE public.to_do_id_seq OWNED BY public.to_do.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: lindsaykaufman
--

CREATE TABLE public.users (
    id integer NOT NULL,
    firstname character varying(30),
    lastname character varying(30),
    email character varying(30),
    password character varying(30),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO lindsaykaufman;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: lindsaykaufman
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO lindsaykaufman;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lindsaykaufman
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: activity id; Type: DEFAULT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.activity ALTER COLUMN id SET DEFAULT nextval('public.activity_id_seq'::regclass);


--
-- Name: goal_occurances id; Type: DEFAULT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.goal_occurances ALTER COLUMN id SET DEFAULT nextval('public.goal_occurances_id_seq'::regclass);


--
-- Name: goals id; Type: DEFAULT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.goals ALTER COLUMN id SET DEFAULT nextval('public.goals_id_seq'::regclass);


--
-- Name: meals id; Type: DEFAULT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.meals ALTER COLUMN id SET DEFAULT nextval('public.meals_id_seq'::regclass);


--
-- Name: mood id; Type: DEFAULT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.mood ALTER COLUMN id SET DEFAULT nextval('public.mood_id_seq'::regclass);


--
-- Name: reflection id; Type: DEFAULT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.reflection ALTER COLUMN id SET DEFAULT nextval('public.reflection_id_seq'::regclass);


--
-- Name: sleep id; Type: DEFAULT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.sleep ALTER COLUMN id SET DEFAULT nextval('public.sleep_id_seq'::regclass);


--
-- Name: to_do id; Type: DEFAULT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.to_do ALTER COLUMN id SET DEFAULT nextval('public.to_do_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: lindsaykaufman
--

COPY public.activity (id, description, created_at, user_id) FROM stdin;
1	Pelaton Cody Ride	2021-11-03 14:58:47.74812	1
3	worked on razr website	2021-11-16 19:08:17.895905	1
\.


--
-- Data for Name: goal_occurances; Type: TABLE DATA; Schema: public; Owner: lindsaykaufman
--

COPY public.goal_occurances (id, goal_id, created_at) FROM stdin;
1	1	2021-11-01 17:05:40.774363
\.


--
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: lindsaykaufman
--

COPY public.goals (id, title, description, completed, start_date, user_id, target_occurances, duration, created_at, occurances, updated_at) FROM stdin;
1	yoga	do yoga	f	2021-10-29 17:10:25	1	\N	\N	2021-11-03 14:33:37.323895	\N	2021-11-16 18:23:59.21091
3	yoga	do yoga	f	2021-10-29 17:10:25	1	3	\N	2021-11-03 14:33:37.323895	\N	2021-11-16 18:23:59.21091
7	yoga	do yoga	f	2021-10-29 17:10:25	3	3	\N	2021-11-03 14:33:37.323895	\N	2021-11-16 18:23:59.21091
2	yoga	do yoga	f	2021-10-29 17:10:25	1	3	\N	2021-11-03 14:33:37.323895	\N	2021-11-16 18:23:59.21091
8	yoga	do yoga	f	2021-10-29 17:10:25	3	3	7 days	2021-11-03 14:33:37.323895	\N	2021-11-16 18:23:59.21091
9	\N	\N	\N	\N	\N	\N	7 days	2021-11-03 14:33:37.323895	\N	2021-11-16 18:23:59.21091
10	\N	\N	\N	\N	\N	\N	7 days	2021-11-03 14:33:37.323895	\N	2021-11-16 18:23:59.21091
11	\N	\N	\N	\N	\N	\N	1 year	2021-11-03 14:33:37.323895	\N	2021-11-16 18:23:59.21091
12	climb	go to climbing gym	f	2021-11-01 17:10:25	3	3	7 days	2021-11-03 14:33:37.323895	\N	2021-11-16 18:23:59.21091
5	practice arm balances	do more arm balances during yoga	f	2021-10-29 21:10:25	1	3	7 days	2021-11-03 14:33:37.323895	2	2021-11-16 23:23:59.21
13	morning pelaton ride	do a pelaton ride before work	f	\N	1	2	14 days	2021-11-16 18:33:11.427949	0	2021-11-16 18:33:11.427949
\.


--
-- Data for Name: meals; Type: TABLE DATA; Schema: public; Owner: lindsaykaufman
--

COPY public.meals (id, name, notes, user_id, created_at) FROM stdin;
2	pancakes	healthy pancakes	1	2021-11-03 16:14:51.999131
3	eggs	eggs with avocado	1	2021-11-16 19:25:00.42261
\.


--
-- Data for Name: mood; Type: TABLE DATA; Schema: public; Owner: lindsaykaufman
--

COPY public.mood (id, notes, user_id, created_at) FROM stdin;
1	in a good mood	1	2021-11-03 16:57:13.379354
2	tired	1	2021-11-16 19:24:46.581101
\.


--
-- Data for Name: reflection; Type: TABLE DATA; Schema: public; Owner: lindsaykaufman
--

COPY public.reflection (id, notes, user_id, created_at) FROM stdin;
\.


--
-- Data for Name: sleep; Type: TABLE DATA; Schema: public; Owner: lindsaykaufman
--

COPY public.sleep (id, hours, quality, dreams, user_id, created_at) FROM stdin;
1	8	Great	None	1	2021-11-06 10:43:29.364404
\.


--
-- Data for Name: to_do; Type: TABLE DATA; Schema: public; Owner: lindsaykaufman
--

COPY public.to_do (id, name, completed, created_date, user_id) FROM stdin;
1	finish ticket	t	2021-11-17 19:17:04.303408	1
2	fold laundry	t	2021-11-17 19:17:24.18352	1
3	pack for trip	f	2021-11-17 19:17:33.772376	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lindsaykaufman
--

COPY public.users (id, firstname, lastname, email, password, created_at) FROM stdin;
1	Lindsay	Kaufman	linds234@gmail.com	Lakestreet1018	2021-11-03 14:25:53.69823
3	Dana	Warshauer	dana.b.warshauer@gmail.com	roommies	2021-11-03 14:25:53.69823
14	Karen	Kaufman	test@gmail.com	mama	2021-11-03 14:25:53.69823
19	Ed	Hamel	ed@ed.com	hamel	2021-11-03 14:25:53.69823
25	Merrill	Robichaud	merrill@robichaud.com	mermer	2021-11-11 19:53:51.584816
26	Emma	Feldman	emma@feldman.com	roxyashe	2021-11-11 19:55:36.658217
27	Karen	Kaufman	mom@gmail.com	3139Lakeshore	2021-11-11 19:59:27.367349
29	Natalie	Antosh	natalie@natalie.com	drantosh	2021-11-16 17:59:36.341766
30	Harrison	Borges	hb@borges.com	harrybutt	2021-11-16 18:02:03.019703
\.


--
-- Name: activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindsaykaufman
--

SELECT pg_catalog.setval('public.activity_id_seq', 3, true);


--
-- Name: goal_occurances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindsaykaufman
--

SELECT pg_catalog.setval('public.goal_occurances_id_seq', 1, true);


--
-- Name: goals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindsaykaufman
--

SELECT pg_catalog.setval('public.goals_id_seq', 13, true);


--
-- Name: meals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindsaykaufman
--

SELECT pg_catalog.setval('public.meals_id_seq', 4, true);


--
-- Name: mood_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindsaykaufman
--

SELECT pg_catalog.setval('public.mood_id_seq', 3, true);


--
-- Name: reflection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindsaykaufman
--

SELECT pg_catalog.setval('public.reflection_id_seq', 1, false);


--
-- Name: sleep_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindsaykaufman
--

SELECT pg_catalog.setval('public.sleep_id_seq', 5, true);


--
-- Name: to_do_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindsaykaufman
--

SELECT pg_catalog.setval('public.to_do_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lindsaykaufman
--

SELECT pg_catalog.setval('public.users_id_seq', 30, true);


--
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: goal_occurances goal_occurances_pkey; Type: CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.goal_occurances
    ADD CONSTRAINT goal_occurances_pkey PRIMARY KEY (id);


--
-- Name: goals goals_pkey; Type: CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (id);


--
-- Name: meals meals_pkey; Type: CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.meals
    ADD CONSTRAINT meals_pkey PRIMARY KEY (id);


--
-- Name: mood mood_pkey; Type: CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.mood
    ADD CONSTRAINT mood_pkey PRIMARY KEY (id);


--
-- Name: reflection reflection_pkey; Type: CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT reflection_pkey PRIMARY KEY (id);


--
-- Name: sleep sleep_pkey; Type: CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.sleep
    ADD CONSTRAINT sleep_pkey PRIMARY KEY (id);


--
-- Name: to_do to_do_pkey; Type: CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.to_do
    ADD CONSTRAINT to_do_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: goals fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT fk_constraint FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: activity fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT fk_constraint FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: meals fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.meals
    ADD CONSTRAINT fk_constraint FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reflection fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT fk_constraint FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: sleep fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.sleep
    ADD CONSTRAINT fk_constraint FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: goal_occurances fk_goal; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.goal_occurances
    ADD CONSTRAINT fk_goal FOREIGN KEY (goal_id) REFERENCES public.goals(id);


--
-- Name: mood fk_users; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.mood
    ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: meals fk_users; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.meals
    ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reflection fk_users; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: sleep fk_users; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.sleep
    ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: to_do fk_users; Type: FK CONSTRAINT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.to_do
    ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

