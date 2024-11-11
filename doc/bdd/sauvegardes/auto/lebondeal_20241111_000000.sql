--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Homebrew)
-- Dumped by pg_dump version 14.13 (Homebrew)

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
-- Name: belong; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.belong (
    product_uuid uuid NOT NULL,
    order_number integer NOT NULL
);


ALTER TABLE public.belong OWNER TO gabriel;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.orders (
    order_number integer NOT NULL,
    user_uuid uuid NOT NULL,
    order_total_cost_ht numeric(10,2) NOT NULL,
    order_total_quantity integer NOT NULL,
    deliver_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT orders_order_total_cost_ht_check CHECK ((order_total_cost_ht >= (0)::numeric)),
    CONSTRAINT orders_order_total_quantity_check CHECK ((order_total_quantity >= 0))
);


ALTER TABLE public.orders OWNER TO gabriel;

--
-- Name: orders_order_number_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

CREATE SEQUENCE public.orders_order_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_number_seq OWNER TO gabriel;

--
-- Name: orders_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gabriel
--

ALTER SEQUENCE public.orders_order_number_seq OWNED BY public.orders.order_number;


--
-- Name: products; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.products (
    product_uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    product_name character varying(100) NOT NULL,
    product_description text NOT NULL,
    product_price numeric(10,2) NOT NULL,
    product_quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT products_product_price_check CHECK ((product_price > (0)::numeric)),
    CONSTRAINT products_product_quantity_check CHECK ((product_quantity >= 0))
);


ALTER TABLE public.products OWNER TO gabriel;

--
-- Name: users; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.users (
    user_uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    user_pseudo character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    user_password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO gabriel;

--
-- Name: orders order_number; Type: DEFAULT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_number SET DEFAULT nextval('public.orders_order_number_seq'::regclass);


--
-- Data for Name: belong; Type: TABLE DATA; Schema: public; Owner: gabriel
--

COPY public.belong (product_uuid, order_number) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: gabriel
--

COPY public.orders (order_number, user_uuid, order_total_cost_ht, order_total_quantity, deliver_at, created_at) FROM stdin;
1	a0018660-dade-4926-8118-613a85bf7b97	1200.99	1	2024-11-10 12:00:00	2024-11-08 09:30:00
2	cfde1d90-ae64-48e2-a8d5-58394c58db52	399.98	2	2024-11-15 14:00:00	2024-11-08 09:45:00
3	862064c4-3446-4c94-827f-244996916a45	899.99	1	2024-11-12 16:00:00	2024-11-08 10:00:00
4	b67e4121-6d45-4477-ac15-76d33c0a7d98	249.99	1	2024-11-20 18:00:00	2024-11-08 10:15:00
5	3dd0ea10-0e7d-4a6b-908b-cf87916d8f41	1259.98	2	2024-11-25 09:30:00	2024-11-08 10:30:00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: gabriel
--

COPY public.products (product_uuid, product_name, product_description, product_price, product_quantity, created_at, updated_at) FROM stdin;
4fb7939c-8391-48a0-950e-f4ab255be940	Laptop Pro X	High-performance laptop with 16GB RAM and 512GB SSD.	1200.99	10	2024-03-09 17:22:47	2024-04-22 15:10:08
fbd59d58-c7c4-4cd3-bec2-c799669b07df	Wireless Headphones Z3	Noise-cancelling wireless headphones with up to 30 hours of battery life.	199.99	50	2024-07-24 22:33:47	2024-10-29 16:48:22
4b5636be-0135-4347-a7b3-a8bb3d9476c6	Smartphone Y9 Max	Latest smartphone with a stunning display and fast processor.	899.99	25	2024-03-08 23:20:17	2024-10-22 06:42:49
acacbbbf-e527-4804-9e83-0e892353b615	Gaming Mouse GX5	Ergonomic gaming mouse with customizable buttons and RGB lighting.	59.99	100	2024-11-07 08:19:46	2024-10-28 18:40:02
a387e43c-26a8-4dc5-b9df-c2e84e99688c	Smartwatch S2 Pro	Water-resistant smartwatch with heart rate monitor and GPS tracking.	249.99	30	2024-07-28 12:00:00	2024-07-28 12:00:00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gabriel
--

COPY public.users (user_uuid, user_pseudo, username, user_password, created_at) FROM stdin;
a0018660-dade-4926-8118-613a85bf7b97	vspencer	bassgina	HzkeBgcnh%S9	2024-06-15 02:25:34
cfde1d90-ae64-48e2-a8d5-58394c58db52	richardbell	janet62	c)*TcccPNi5p	2024-08-26 00:26:24
862064c4-3446-4c94-827f-244996916a45	sweeneymark	matthewhenry	lRIxPz)*lZ&3	2024-01-14 16:54:17
b67e4121-6d45-4477-ac15-76d33c0a7d98	michelecooper	justin86	V1CGNMzs$^sx	2024-08-10 17:25:41
3dd0ea10-0e7d-4a6b-908b-cf87916d8f41	lisastone	danielgonzalez	!Y)psSsCO8Vw	2024-08-18 16:15:50
\.


--
-- Name: orders_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: gabriel
--

SELECT pg_catalog.setval('public.orders_order_number_seq', 1, false);


--
-- Name: belong belong_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.belong
    ADD CONSTRAINT belong_pkey PRIMARY KEY (product_uuid, order_number);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_number);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_uuid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_uuid);


--
-- Name: users users_user_pseudo_key; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_pseudo_key UNIQUE (user_pseudo);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: belong belong_order_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.belong
    ADD CONSTRAINT belong_order_number_fkey FOREIGN KEY (order_number) REFERENCES public.orders(order_number);


--
-- Name: belong belong_product_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.belong
    ADD CONSTRAINT belong_product_uuid_fkey FOREIGN KEY (product_uuid) REFERENCES public.products(product_uuid);


--
-- Name: orders orders_user_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_uuid_fkey FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid);


--
-- PostgreSQL database dump complete
--

