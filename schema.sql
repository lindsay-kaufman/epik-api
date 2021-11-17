--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
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
    description character varying(30),
    completed boolean,
    start_date timestamp without time zone,
    user_id integer,
    target_occurances integer,
    duration interval,
    created_at timestamp without time zone DEFAULT now()
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
-- Name: users id; Type: DEFAULT; Schema: public; Owner: lindsaykaufman
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


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
-- PostgreSQL database dump complete
--

