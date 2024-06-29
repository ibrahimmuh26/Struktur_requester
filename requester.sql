--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12
-- Dumped by pg_dump version 14.12

-- Started on 2024-06-29 08:58:31 WIB

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16608)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    nama character varying(100),
    jabatan character varying(100),
    email character varying(100)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16607)
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_employee_id_seq OWNER TO postgres;

--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 214
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- TOC entry 211 (class 1259 OID 16417)
-- Name: pemohon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pemohon (
    pemohon_id integer NOT NULL,
    nama character varying(100),
    email character varying(100),
    alamat character varying(100)
);


ALTER TABLE public.pemohon OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16416)
-- Name: pemohon_pemohon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pemohon_pemohon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pemohon_pemohon_id_seq OWNER TO postgres;

--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 210
-- Name: pemohon_pemohon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pemohon_pemohon_id_seq OWNED BY public.pemohon.pemohon_id;


--
-- TOC entry 223 (class 1259 OID 16687)
-- Name: pengadaan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengadaan (
    pengadaan_id integer NOT NULL,
    permintaan_id integer,
    vendor_id integer,
    employee_id integer,
    product_id integer,
    jumlah integer,
    tanggal_pengadaan date,
    status character varying(50)
);


ALTER TABLE public.pengadaan OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16686)
-- Name: pengadaan_pengadaan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pengadaan_pengadaan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pengadaan_pengadaan_id_seq OWNER TO postgres;

--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 222
-- Name: pengadaan_pengadaan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pengadaan_pengadaan_id_seq OWNED BY public.pengadaan.pengadaan_id;


--
-- TOC entry 217 (class 1259 OID 16616)
-- Name: permintaan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permintaan (
    permintaan_id integer NOT NULL,
    pemohon_id integer,
    employe_id integer,
    deskripsi text,
    tanggal_permintaan date,
    status character varying(50)
);


ALTER TABLE public.permintaan OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16615)
-- Name: permintaan_permintaan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permintaan_permintaan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permintaan_permintaan_id_seq OWNER TO postgres;

--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 216
-- Name: permintaan_permintaan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permintaan_permintaan_id_seq OWNED BY public.permintaan.permintaan_id;


--
-- TOC entry 225 (class 1259 OID 16715)
-- Name: permintaan_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permintaan_product (
    permintaan_product_id integer NOT NULL,
    permintaan_id integer,
    product_id integer,
    jumlah integer
);


ALTER TABLE public.permintaan_product OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16714)
-- Name: permintaan_product_permintaan_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permintaan_product_permintaan_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permintaan_product_permintaan_product_id_seq OWNER TO postgres;

--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 224
-- Name: permintaan_product_permintaan_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permintaan_product_permintaan_product_id_seq OWNED BY public.permintaan_product.permintaan_product_id;


--
-- TOC entry 219 (class 1259 OID 16640)
-- Name: persetujuans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persetujuans (
    persetujuan_id integer NOT NULL,
    permintaan_id integer,
    employee_id integer,
    tanggal_approval date,
    status character varying(50)
);


ALTER TABLE public.persetujuans OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16639)
-- Name: persetujuans_persetujuans_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persetujuans_persetujuans_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persetujuans_persetujuans_seq OWNER TO postgres;

--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 218
-- Name: persetujuans_persetujuans_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persetujuans_persetujuans_seq OWNED BY public.persetujuans.persetujuan_id;


--
-- TOC entry 213 (class 1259 OID 16519)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    nama_produk character varying(255),
    qty integer,
    deskripsi_produk text
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16518)
-- Name: products_produk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_produk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_produk_id_seq OWNER TO postgres;

--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 212
-- Name: products_produk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_produk_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 221 (class 1259 OID 16657)
-- Name: vendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor (
    vendor_id integer NOT NULL,
    nama character varying(100),
    kontak character varying(100),
    alamat character varying(255)
);


ALTER TABLE public.vendor OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16656)
-- Name: vendor_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_vendor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_vendor_id_seq OWNER TO postgres;

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 220
-- Name: vendor_vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_vendor_id_seq OWNED BY public.vendor.vendor_id;


--
-- TOC entry 3468 (class 2604 OID 16611)
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- TOC entry 3466 (class 2604 OID 16420)
-- Name: pemohon pemohon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pemohon ALTER COLUMN pemohon_id SET DEFAULT nextval('public.pemohon_pemohon_id_seq'::regclass);


--
-- TOC entry 3472 (class 2604 OID 16690)
-- Name: pengadaan pengadaan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengadaan ALTER COLUMN pengadaan_id SET DEFAULT nextval('public.pengadaan_pengadaan_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 16619)
-- Name: permintaan permintaan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permintaan ALTER COLUMN permintaan_id SET DEFAULT nextval('public.permintaan_permintaan_id_seq'::regclass);


--
-- TOC entry 3473 (class 2604 OID 16718)
-- Name: permintaan_product permintaan_product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permintaan_product ALTER COLUMN permintaan_product_id SET DEFAULT nextval('public.permintaan_product_permintaan_product_id_seq'::regclass);


--
-- TOC entry 3470 (class 2604 OID 16643)
-- Name: persetujuans persetujuan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persetujuans ALTER COLUMN persetujuan_id SET DEFAULT nextval('public.persetujuans_persetujuans_seq'::regclass);


--
-- TOC entry 3467 (class 2604 OID 16522)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_produk_id_seq'::regclass);


--
-- TOC entry 3471 (class 2604 OID 16660)
-- Name: vendor vendor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor ALTER COLUMN vendor_id SET DEFAULT nextval('public.vendor_vendor_id_seq'::regclass);


--
-- TOC entry 3644 (class 0 OID 16608)
-- Dependencies: 215
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, nama, jabatan, email) FROM stdin;
\.


--
-- TOC entry 3640 (class 0 OID 16417)
-- Dependencies: 211
-- Data for Name: pemohon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pemohon (pemohon_id, nama, email, alamat) FROM stdin;
\.


--
-- TOC entry 3652 (class 0 OID 16687)
-- Dependencies: 223
-- Data for Name: pengadaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengadaan (pengadaan_id, permintaan_id, vendor_id, employee_id, product_id, jumlah, tanggal_pengadaan, status) FROM stdin;
\.


--
-- TOC entry 3646 (class 0 OID 16616)
-- Dependencies: 217
-- Data for Name: permintaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permintaan (permintaan_id, pemohon_id, employe_id, deskripsi, tanggal_permintaan, status) FROM stdin;
\.


--
-- TOC entry 3654 (class 0 OID 16715)
-- Dependencies: 225
-- Data for Name: permintaan_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permintaan_product (permintaan_product_id, permintaan_id, product_id, jumlah) FROM stdin;
\.


--
-- TOC entry 3648 (class 0 OID 16640)
-- Dependencies: 219
-- Data for Name: persetujuans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persetujuans (persetujuan_id, permintaan_id, employee_id, tanggal_approval, status) FROM stdin;
\.


--
-- TOC entry 3642 (class 0 OID 16519)
-- Dependencies: 213
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, nama_produk, qty, deskripsi_produk) FROM stdin;
\.


--
-- TOC entry 3650 (class 0 OID 16657)
-- Dependencies: 221
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor (vendor_id, nama, kontak, alamat) FROM stdin;
\.


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 214
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 1, false);


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 210
-- Name: pemohon_pemohon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pemohon_pemohon_id_seq', 1, false);


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 222
-- Name: pengadaan_pengadaan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengadaan_pengadaan_id_seq', 1, false);


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 216
-- Name: permintaan_permintaan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permintaan_permintaan_id_seq', 1, false);


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 224
-- Name: permintaan_product_permintaan_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permintaan_product_permintaan_product_id_seq', 1, false);


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 218
-- Name: persetujuans_persetujuans_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persetujuans_persetujuans_seq', 1, false);


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 212
-- Name: products_produk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_produk_id_seq', 1, false);


--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 220
-- Name: vendor_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_vendor_id_seq', 1, false);


--
-- TOC entry 3479 (class 2606 OID 16613)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 3475 (class 2606 OID 16422)
-- Name: pemohon pemohon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pemohon
    ADD CONSTRAINT pemohon_pkey PRIMARY KEY (pemohon_id);


--
-- TOC entry 3487 (class 2606 OID 16692)
-- Name: pengadaan pengadaan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengadaan
    ADD CONSTRAINT pengadaan_pkey PRIMARY KEY (pengadaan_id);


--
-- TOC entry 3481 (class 2606 OID 16623)
-- Name: permintaan permintaan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permintaan
    ADD CONSTRAINT permintaan_pkey PRIMARY KEY (permintaan_id);


--
-- TOC entry 3489 (class 2606 OID 16720)
-- Name: permintaan_product permintaan_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permintaan_product
    ADD CONSTRAINT permintaan_product_pkey PRIMARY KEY (permintaan_product_id);


--
-- TOC entry 3483 (class 2606 OID 16645)
-- Name: persetujuans persetujuans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persetujuans
    ADD CONSTRAINT persetujuans_pkey PRIMARY KEY (persetujuan_id);


--
-- TOC entry 3477 (class 2606 OID 16526)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3485 (class 2606 OID 16662)
-- Name: vendor vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (vendor_id);


--
-- TOC entry 3496 (class 2606 OID 16703)
-- Name: pengadaan pengadaan_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengadaan
    ADD CONSTRAINT pengadaan_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 3494 (class 2606 OID 16693)
-- Name: pengadaan pengadaan_permintaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengadaan
    ADD CONSTRAINT pengadaan_permintaan_id_fkey FOREIGN KEY (permintaan_id) REFERENCES public.permintaan(permintaan_id);


--
-- TOC entry 3497 (class 2606 OID 16708)
-- Name: pengadaan pengadaan_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengadaan
    ADD CONSTRAINT pengadaan_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 3495 (class 2606 OID 16698)
-- Name: pengadaan pengadaan_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengadaan
    ADD CONSTRAINT pengadaan_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendor(vendor_id);


--
-- TOC entry 3491 (class 2606 OID 16634)
-- Name: permintaan permintaan_employe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permintaan
    ADD CONSTRAINT permintaan_employe_id_fkey FOREIGN KEY (employe_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 3490 (class 2606 OID 16624)
-- Name: permintaan permintaan_pemohon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permintaan
    ADD CONSTRAINT permintaan_pemohon_id_fkey FOREIGN KEY (pemohon_id) REFERENCES public.pemohon(pemohon_id);


--
-- TOC entry 3498 (class 2606 OID 16721)
-- Name: permintaan_product permintaan_product_permintaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permintaan_product
    ADD CONSTRAINT permintaan_product_permintaan_id_fkey FOREIGN KEY (permintaan_id) REFERENCES public.permintaan(permintaan_id);


--
-- TOC entry 3499 (class 2606 OID 16726)
-- Name: permintaan_product permintaan_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permintaan_product
    ADD CONSTRAINT permintaan_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 3493 (class 2606 OID 16651)
-- Name: persetujuans persetujuans_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persetujuans
    ADD CONSTRAINT persetujuans_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 3492 (class 2606 OID 16646)
-- Name: persetujuans persetujuans_permintaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persetujuans
    ADD CONSTRAINT persetujuans_permintaan_id_fkey FOREIGN KEY (permintaan_id) REFERENCES public.permintaan(permintaan_id);


-- Completed on 2024-06-29 08:58:31 WIB

--
-- PostgreSQL database dump complete
--

