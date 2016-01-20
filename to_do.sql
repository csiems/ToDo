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
-- Name: categories; Type: TABLE; Schema: public; Owner: Midori; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE categories OWNER TO "Midori";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: Midori
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO "Midori";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Midori
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: Midori; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    description character varying,
    due_by timestamp without time zone,
    category_id integer
);


ALTER TABLE tasks OWNER TO "Midori";

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: Midori
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_id_seq OWNER TO "Midori";

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Midori
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Midori
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Midori
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: Midori
--

COPY categories (id, name) FROM stdin;
1	Grocery List
2	Errands
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Midori
--

SELECT pg_catalog.setval('categories_id_seq', 2, true);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: Midori
--

COPY tasks (id, description, due_by, category_id) FROM stdin;
1	Indian Fare Lunch	2016-01-20 16:00:00	1
2	Carrots	2016-01-20 16:00:00	1
3	Eggs	2016-01-20 16:00:00	1
4	Tea	2016-01-20 16:00:00	1
5	Oranges	2016-01-20 16:00:00	1
6	Vitamins	2016-01-20 16:00:00	1
7	Return library books	2016-01-24 16:00:00	2
8	Get tool at Ace	2016-01-24 16:00:00	2
9	Buy cat food	2016-01-24 16:00:00	2
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Midori
--

SELECT pg_catalog.setval('tasks_id_seq', 9, true);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: Midori; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: Midori; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: Midori
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "Midori";
GRANT ALL ON SCHEMA public TO "Midori";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

