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
-- Name: categories; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE categories OWNER TO "Guest";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO "Guest";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: categories_tasks; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE categories_tasks (
    id integer NOT NULL,
    category_id integer,
    task_id integer
);


ALTER TABLE categories_tasks OWNER TO "Guest";

--
-- Name: categories_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE categories_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_tasks_id_seq OWNER TO "Guest";

--
-- Name: categories_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE categories_tasks_id_seq OWNED BY categories_tasks.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    description character varying,
    complete boolean,
    due_by date
);


ALTER TABLE tasks OWNER TO "Guest";

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_id_seq OWNER TO "Guest";

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY categories_tasks ALTER COLUMN id SET DEFAULT nextval('categories_tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY categories (id, name) FROM stdin;
20	Weekly Chores
21	Monthly Chores
22	Shopping
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('categories_id_seq', 23, true);


--
-- Data for Name: categories_tasks; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY categories_tasks (id, category_id, task_id) FROM stdin;
30	20	40
31	20	36
34	21	39
35	20	35
38	21	41
\.


--
-- Name: categories_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('categories_tasks_id_seq', 38, true);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY tasks (id, description, complete, due_by) FROM stdin;
32	Make Dinner	f	2016-01-25
40	Dust the Furniture	f	2016-01-30
36	Take Out the Trash	f	2016-01-28
35	Water Plants	f	2016-01-30
33	Feed the Cat	f	2016-01-25
31	Wash Dishes	t	2016-01-25
41	Fix the Car	f	2016-01-29
34	Do Laundry	t	2016-01-25
39	Clean the Refrigerator	t	2016-01-31
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('tasks_id_seq', 41, true);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY categories_tasks
    ADD CONSTRAINT categories_tasks_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

