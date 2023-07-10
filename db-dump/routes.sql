--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: routes; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE routes WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_GB.UTF-8';


ALTER DATABASE routes OWNER TO postgres;

\connect routes

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: route; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.route (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    route_type character varying NOT NULL,
    traffic_level integer NOT NULL,
    cost integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.route OWNER TO postgres;

--
-- Name: route_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.route_types (
    id character varying(255) NOT NULL,
    route_type_name character varying(255) NOT NULL
);


ALTER TABLE public.route_types OWNER TO postgres;

--
-- Name: routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes (
    id character varying(255) NOT NULL,
    route_type character varying(255) NOT NULL,
    traffic_level double precision NOT NULL,
    cost double precision NOT NULL,
    route_info json DEFAULT '{}'::json NOT NULL
);


ALTER TABLE public.routes OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    created_at integer NOT NULL,
    cost_limit integer NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_to_route_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_to_route_type (
    user_id character varying(255) NOT NULL,
    route_type_id character varying(255) NOT NULL
);


ALTER TABLE public.user_to_route_type OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id character varying(255) NOT NULL,
    cost_limit double precision,
    name character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.route (id, route_type, traffic_level, cost, created_at) FROM stdin;
\.


--
-- Data for Name: route_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.route_types (id, route_type_name) FROM stdin;
05d6243d-006d-4d8e-a7a8-d9f79cd44bcf	Type 1
5e87fe1a-0a45-48b8-b6ce-d0da490cf342	Type 2
58ef441e-b3b3-4df9-9c6f-7f1d3e646540	Type 3
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes (id, route_type, traffic_level, cost, route_info) FROM stdin;
227105d3-a785-48ea-b116-3beacfc73391	05d6243d-006d-4d8e-a7a8-d9f79cd44bcf	1	40	{}
368467d5-a9c6-4517-aae9-486ef5a3a56c	5e87fe1a-0a45-48b8-b6ce-d0da490cf342	2	50	{}
a7f5bd79-d5de-41a2-be45-6a07622dcbb3	58ef441e-b3b3-4df9-9c6f-7f1d3e646540	3	60	{}
26873578-b78a-406f-b75a-e1356edc741c	05d6243d-006d-4d8e-a7a8-d9f79cd44bcf	4	40	{}
2983bd0f-8060-4a55-ae4a-767b776cc0e6	5e87fe1a-0a45-48b8-b6ce-d0da490cf342	5	50	{}
4aa5dd61-8e5f-484e-b36e-a921f3c1ef12	58ef441e-b3b3-4df9-9c6f-7f1d3e646540	6	60	{}
37382c36-9ed2-4679-878d-d63077384f9b	05d6243d-006d-4d8e-a7a8-d9f79cd44bcf	7	40	{}
c3a86d2b-269e-4306-af2b-54f75f4d6dc8	5e87fe1a-0a45-48b8-b6ce-d0da490cf342	8	50	{}
3e0382fd-75bf-4886-b4ad-76e391358c52	58ef441e-b3b3-4df9-9c6f-7f1d3e646540	9	60	{}
351de96f-2428-4a5f-af96-927b36564798	05d6243d-006d-4d8e-a7a8-d9f79cd44bcf	10	10	{}
29fe57db-1484-4794-89d3-4738ad5e0571	05d6243d-006d-4d8e-a7a8-d9f79cd44bcf	0	200	{}
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, name, created_at, cost_limit) FROM stdin;
\.


--
-- Data for Name: user_to_route_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_to_route_type (user_id, route_type_id) FROM stdin;
e1da3033-c060-4285-ab4d-9bfa435843bd	5e87fe1a-0a45-48b8-b6ce-d0da490cf342
de4a0697-dbdb-4f8d-9045-30c95cafb199	58ef441e-b3b3-4df9-9c6f-7f1d3e646540
ef6a3b8e-2974-463d-b3ff-c39484e777dc	5e87fe1a-0a45-48b8-b6ce-d0da490cf342
ef6a3b8e-2974-463d-b3ff-c39484e777dc	58ef441e-b3b3-4df9-9c6f-7f1d3e646540
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, cost_limit, name) FROM stdin;
e1da3033-c060-4285-ab4d-9bfa435843bd	170	User 5
f4832581-fc50-47c0-b4ea-f350ca71ef34	150	User 1
de4a0697-dbdb-4f8d-9045-30c95cafb199	130	User 4
c7c1b607-06c5-477d-90e1-9454f8f880e0	130	User 2
9b92522c-ed4b-4bc4-b79f-4fa22942783f	110	User 3
ef6a3b8e-2974-463d-b3ff-c39484e777dc	110	User 6
\.


--
-- Name: route PK_08affcd076e46415e5821acf52d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT "PK_08affcd076e46415e5821acf52d" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: route_types route_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_types
    ADD CONSTRAINT route_types_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: user_to_route_type user_to_route_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_to_route_type
    ADD CONSTRAINT user_to_route_type_pkey PRIMARY KEY (user_id, route_type_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

