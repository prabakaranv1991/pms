--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: dim_car_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_car_detail (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    year integer NOT NULL,
    purchased_kms integer NOT NULL,
    insurance_date date NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    gps_id integer,
    total_kms numeric(15,2) NOT NULL,
    address text,
    ignition_status boolean NOT NULL,
    gps_last_updated timestamp with time zone
);


ALTER TABLE public.dim_car_detail OWNER TO postgres;

--
-- Name: dim_car_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_car_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_car_detail_id_seq OWNER TO postgres;

--
-- Name: dim_car_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_car_detail_id_seq OWNED BY public.dim_car_detail.id;


--
-- Name: dim_chit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_chit (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(25) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    settlement_date integer NOT NULL,
    total_value integer NOT NULL,
    total_months integer NOT NULL,
    interest_percentage numeric(15,2) NOT NULL,
    commission_percentage numeric(15,2) NOT NULL
);


ALTER TABLE public.dim_chit OWNER TO postgres;

--
-- Name: dim_chit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_chit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_chit_id_seq OWNER TO postgres;

--
-- Name: dim_chit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_chit_id_seq OWNED BY public.dim_chit.id;


--
-- Name: dim_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_customers (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    phone_number character varying(10),
    self boolean NOT NULL
);


ALTER TABLE public.dim_customers OWNER TO postgres;

--
-- Name: dim_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_customers_id_seq OWNER TO postgres;

--
-- Name: dim_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_customers_id_seq OWNED BY public.dim_customers.id;


--
-- Name: dim_expences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_expences (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    amount numeric(15,2) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    pay_type integer NOT NULL,
    type character varying(50) NOT NULL,
    status boolean NOT NULL,
    sort_order integer NOT NULL,
    savings boolean NOT NULL,
    chit_id integer,
    finance_id integer
);


ALTER TABLE public.dim_expences OWNER TO postgres;

--
-- Name: dim_expences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_expences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_expences_id_seq OWNER TO postgres;

--
-- Name: dim_expences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_expences_id_seq OWNED BY public.dim_expences.id;


--
-- Name: dim_finance_loan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_finance_loan (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    loan_amount numeric(15,2) NOT NULL,
    roi numeric(15,2) NOT NULL,
    status boolean NOT NULL,
    utilized_amount numeric(15,2) NOT NULL
);


ALTER TABLE public.dim_finance_loan OWNER TO postgres;

--
-- Name: dim_finance_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_finance_source (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.dim_finance_source OWNER TO postgres;

--
-- Name: dim_finance_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_finance_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_finance_source_id_seq OWNER TO postgres;

--
-- Name: dim_finance_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_finance_source_id_seq OWNED BY public.dim_finance_source.id;


--
-- Name: dim_flexi_loan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_flexi_loan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_flexi_loan_id_seq OWNER TO postgres;

--
-- Name: dim_flexi_loan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_flexi_loan_id_seq OWNED BY public.dim_finance_loan.id;


--
-- Name: dim_income; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_income (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    amount numeric(15,2) NOT NULL,
    status boolean NOT NULL,
    end_date date,
    start_date date NOT NULL,
    pay_type integer NOT NULL,
    type character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    source_id integer NOT NULL,
    finance_id integer
);


ALTER TABLE public.dim_income OWNER TO postgres;

--
-- Name: dim_income_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_income_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_income_id_seq OWNER TO postgres;

--
-- Name: dim_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_income_id_seq OWNED BY public.dim_income.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: fact_car_odometer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_car_odometer (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    date date NOT NULL,
    kms numeric(15,2) NOT NULL,
    car_id integer
);


ALTER TABLE public.fact_car_odometer OWNER TO postgres;

--
-- Name: fact_car_odometer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_car_odometer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_car_odometer_id_seq OWNER TO postgres;

--
-- Name: fact_car_odometer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_car_odometer_id_seq OWNED BY public.fact_car_odometer.id;


--
-- Name: fact_chit_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_chit_customers (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    chit_id integer,
    customer_id integer,
    prefered_month integer
);


ALTER TABLE public.fact_chit_customers OWNER TO postgres;

--
-- Name: fact_chit_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_chit_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_chit_customers_id_seq OWNER TO postgres;

--
-- Name: fact_chit_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_chit_customers_id_seq OWNED BY public.fact_chit_customers.id;


--
-- Name: fact_chit_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_chit_payment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    paid_date date NOT NULL,
    chit_id integer,
    customer_id integer,
    month date NOT NULL
);


ALTER TABLE public.fact_chit_payment OWNER TO postgres;

--
-- Name: fact_chit_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_chit_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_chit_payment_id_seq OWNER TO postgres;

--
-- Name: fact_chit_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_chit_payment_id_seq OWNED BY public.fact_chit_payment.id;


--
-- Name: fact_chit_settlement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_chit_settlement (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    month date NOT NULL,
    paid boolean NOT NULL,
    paid_date date,
    chit_id integer,
    customer_id integer,
    amount double precision NOT NULL,
    betting jsonb
);


ALTER TABLE public.fact_chit_settlement OWNER TO postgres;

--
-- Name: fact_chit_settlement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_chit_settlement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_chit_settlement_id_seq OWNER TO postgres;

--
-- Name: fact_chit_settlement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_chit_settlement_id_seq OWNED BY public.fact_chit_settlement.id;


--
-- Name: fact_credit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_credit (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    amount numeric(15,2) NOT NULL,
    name text,
    paid_amount numeric(15,2),
    paid_date date,
    source_id integer NOT NULL,
    expected_date date
);


ALTER TABLE public.fact_credit OWNER TO postgres;

--
-- Name: fact_credit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_credit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_credit_id_seq OWNER TO postgres;

--
-- Name: fact_credit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_credit_id_seq OWNED BY public.fact_credit.id;


--
-- Name: fact_finance_utilized; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_finance_utilized (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    amount numeric(15,2) NOT NULL,
    paid_amount numeric(15,2),
    paid_date date,
    status boolean NOT NULL,
    finance_id integer NOT NULL,
    source_id integer NOT NULL,
    payment_type character varying(50) NOT NULL
);


ALTER TABLE public.fact_finance_utilized OWNER TO postgres;

--
-- Name: fact_flexi_utilized_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_flexi_utilized_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_flexi_utilized_id_seq OWNER TO postgres;

--
-- Name: fact_flexi_utilized_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_flexi_utilized_id_seq OWNED BY public.fact_finance_utilized.id;


--
-- Name: fact_monthly_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_monthly_payment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    paid_date date,
    expense_id integer,
    amount numeric(15,2) NOT NULL,
    paid_amount numeric(15,2),
    income_id integer,
    month date NOT NULL,
    credit_id integer
);


ALTER TABLE public.fact_monthly_payment OWNER TO postgres;

--
-- Name: fact_monthly_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_monthly_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_monthly_payment_id_seq OWNER TO postgres;

--
-- Name: fact_monthly_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_monthly_payment_id_seq OWNED BY public.fact_monthly_payment.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: dim_car_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_car_detail ALTER COLUMN id SET DEFAULT nextval('public.dim_car_detail_id_seq'::regclass);


--
-- Name: dim_chit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_chit ALTER COLUMN id SET DEFAULT nextval('public.dim_chit_id_seq'::regclass);


--
-- Name: dim_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_customers ALTER COLUMN id SET DEFAULT nextval('public.dim_customers_id_seq'::regclass);


--
-- Name: dim_expences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_expences ALTER COLUMN id SET DEFAULT nextval('public.dim_expences_id_seq'::regclass);


--
-- Name: dim_finance_loan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_finance_loan ALTER COLUMN id SET DEFAULT nextval('public.dim_flexi_loan_id_seq'::regclass);


--
-- Name: dim_finance_source id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_finance_source ALTER COLUMN id SET DEFAULT nextval('public.dim_finance_source_id_seq'::regclass);


--
-- Name: dim_income id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_income ALTER COLUMN id SET DEFAULT nextval('public.dim_income_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: fact_car_odometer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_car_odometer ALTER COLUMN id SET DEFAULT nextval('public.fact_car_odometer_id_seq'::regclass);


--
-- Name: fact_chit_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_customers ALTER COLUMN id SET DEFAULT nextval('public.fact_chit_customers_id_seq'::regclass);


--
-- Name: fact_chit_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_payment ALTER COLUMN id SET DEFAULT nextval('public.fact_chit_payment_id_seq'::regclass);


--
-- Name: fact_chit_settlement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_settlement ALTER COLUMN id SET DEFAULT nextval('public.fact_chit_settlement_id_seq'::regclass);


--
-- Name: fact_credit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_credit ALTER COLUMN id SET DEFAULT nextval('public.fact_credit_id_seq'::regclass);


--
-- Name: fact_finance_utilized id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_finance_utilized ALTER COLUMN id SET DEFAULT nextval('public.fact_flexi_utilized_id_seq'::regclass);


--
-- Name: fact_monthly_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_monthly_payment ALTER COLUMN id SET DEFAULT nextval('public.fact_monthly_payment_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add car	7	add_car
26	Can change car	7	change_car
27	Can delete car	7	delete_car
28	Can view car	7	view_car
29	Can add car odometer	8	add_carodometer
30	Can change car odometer	8	change_carodometer
31	Can delete car odometer	8	delete_carodometer
32	Can view car odometer	8	view_carodometer
33	Can add customers	9	add_customers
34	Can change customers	9	change_customers
35	Can delete customers	9	delete_customers
36	Can view customers	9	view_customers
37	Can add chit customers	10	add_chitcustomers
38	Can change chit customers	10	change_chitcustomers
39	Can delete chit customers	10	delete_chitcustomers
40	Can view chit customers	10	view_chitcustomers
41	Can add chit	11	add_chit
42	Can change chit	11	change_chit
43	Can delete chit	11	delete_chit
44	Can view chit	11	view_chit
45	Can add chit payment	12	add_chitpayment
46	Can change chit payment	12	change_chitpayment
47	Can delete chit payment	12	delete_chitpayment
48	Can view chit payment	12	view_chitpayment
49	Can add income	13	add_income
50	Can change income	13	change_income
51	Can delete income	13	delete_income
52	Can view income	13	view_income
53	Can add monthly payment	14	add_monthlypayment
54	Can change monthly payment	14	change_monthlypayment
55	Can delete monthly payment	14	delete_monthlypayment
56	Can view monthly payment	14	view_monthlypayment
57	Can add expenses	15	add_expenses
58	Can change expenses	15	change_expenses
59	Can delete expenses	15	delete_expenses
60	Can view expenses	15	view_expenses
61	Can add chit settlement	16	add_chitsettlement
62	Can change chit settlement	16	change_chitsettlement
63	Can delete chit settlement	16	delete_chitsettlement
64	Can view chit settlement	16	view_chitsettlement
65	Can add income source	17	add_incomesource
66	Can change income source	17	change_incomesource
67	Can delete income source	17	delete_incomesource
68	Can view income source	17	view_incomesource
69	Can add finance source	18	add_financesource
70	Can change finance source	18	change_financesource
71	Can delete finance source	18	delete_financesource
72	Can view finance source	18	view_financesource
73	Can add credit	19	add_credit
74	Can change credit	19	change_credit
75	Can delete credit	19	delete_credit
76	Can view credit	19	view_credit
77	Can add flexi loan	20	add_flexiloan
78	Can change flexi loan	20	change_flexiloan
79	Can delete flexi loan	20	delete_flexiloan
80	Can view flexi loan	20	view_flexiloan
81	Can add flexi utilized	21	add_flexiutilized
82	Can change flexi utilized	21	change_flexiutilized
83	Can delete flexi utilized	21	delete_flexiutilized
84	Can view flexi utilized	21	view_flexiutilized
85	Can add finance loan	20	add_financeloan
86	Can change finance loan	20	change_financeloan
87	Can delete finance loan	20	delete_financeloan
88	Can view finance loan	20	view_financeloan
89	Can add finance utilized	21	add_financeutilized
90	Can change finance utilized	21	change_financeutilized
91	Can delete finance utilized	21	delete_financeutilized
92	Can view finance utilized	21	view_financeutilized
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$8fy0rq4XP9oa$C5CmPY58UEeMYmMc606UNHR2acPiU9qi6b4w1eKfT1w=	2021-11-08 11:32:05.259938+05:30	t	admin			admin@admin.com	t	t	2021-09-06 16:25:34.698125+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: dim_car_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_car_detail (id, name, year, purchased_kms, insurance_date, created, modified, gps_id, total_kms, address, ignition_status, gps_last_updated) FROM stdin;
1	Innova	2013	88000	2020-01-12	2021-09-06 19:01:56.1593+05:30	2021-11-13 17:33:10.818207+05:30	624789	107453.00	23/29, South Beach Avenue, MRC Nagar, RA Puram, Chennai, Tamil Nadu. 47 m from Indian Bank Management Academy for Growth & Excellence pin-600028 (India)	f	2021-11-13 23:03:10.818207+05:30
\.


--
-- Data for Name: dim_chit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_chit (id, created, modified, name, start_date, end_date, settlement_date, total_value, total_months, interest_percentage, commission_percentage) FROM stdin;
2	2021-09-29 13:00:38.622222+05:30	2021-09-29 13:00:38.622222+05:30	2L	2021-07-01	2023-02-01	5	200000	20	1.50	3.00
3	2021-10-05 19:13:56.096086+05:30	2021-10-13 12:23:24.626018+05:30	50K	2021-11-01	2022-08-01	5	50000	10	0.00	0.00
\.


--
-- Data for Name: dim_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_customers (id, created, modified, name, phone_number, self) FROM stdin;
4	2021-09-07 17:01:16.137067+05:30	2021-09-07 17:01:16.137067+05:30	Sethu	\N	f
5	2021-09-14 12:27:17.914204+05:30	2021-09-14 12:27:17.914204+05:30	Udhaya	\N	f
6	2021-09-29 13:03:24.620026+05:30	2021-09-29 13:03:24.620026+05:30	Vijayanand	\N	f
7	2021-09-29 13:03:39.422443+05:30	2021-09-29 13:03:39.422443+05:30	Saranya	\N	f
9	2021-09-29 13:04:04.004537+05:30	2021-09-29 13:04:04.004537+05:30	Arumugaswamy	\N	f
10	2021-09-29 13:04:13.671936+05:30	2021-09-29 13:04:13.671936+05:30	Sabari	\N	f
11	2021-09-29 13:04:23.541408+05:30	2021-09-29 13:04:23.541408+05:30	Ramprabhu	\N	f
12	2021-09-29 13:04:33.608927+05:30	2021-09-29 13:04:33.608927+05:30	Vinodhini	\N	f
13	2021-09-29 13:04:46.079662+05:30	2021-09-29 13:04:46.079662+05:30	Bhuvana	\N	f
14	2021-09-29 13:04:55.944427+05:30	2021-09-29 13:04:55.944427+05:30	Dhaya	\N	f
15	2021-09-29 13:05:05.35478+05:30	2021-09-29 13:05:05.35478+05:30	Sanjith	\N	f
16	2021-09-29 13:05:15.064075+05:30	2021-09-29 13:05:15.064075+05:30	Dhinesh	\N	f
17	2021-09-29 13:05:24.219769+05:30	2021-09-29 13:05:24.219769+05:30	Anand	\N	f
18	2021-09-29 13:05:35.450113+05:30	2021-09-29 13:05:35.450113+05:30	Siva	\N	f
19	2021-09-29 13:05:45.824673+05:30	2021-09-29 13:05:45.824673+05:30	Baskar	\N	f
20	2021-09-29 13:05:55.877222+05:30	2021-09-29 13:05:55.877222+05:30	Ramesh	\N	f
21	2021-09-29 13:06:04.823856+05:30	2021-09-29 13:06:04.823856+05:30	Sadham	\N	f
22	2021-09-29 13:06:14.395223+05:30	2021-09-29 13:06:14.395223+05:30	Panneer	\N	f
24	2021-10-05 19:22:58.472868+05:30	2021-10-05 19:22:58.472868+05:30	Moorthy	\N	f
25	2021-10-05 19:25:38.46641+05:30	2021-10-05 19:25:38.46641+05:30	Poornima	\N	f
26	2021-10-05 19:26:20.092205+05:30	2021-10-05 19:26:20.092205+05:30	Varadharajan	\N	f
27	2021-10-05 19:27:52.985161+05:30	2021-10-05 19:27:52.985161+05:30	Vaishali	\N	f
28	2021-10-11 06:34:18.227091+05:30	2021-10-11 06:34:18.227091+05:30	Thirumurugan	\N	f
8	2021-09-29 13:03:53.187072+05:30	2021-09-29 13:03:53.187072+05:30	Paramasivam	\N	f
29	2021-10-12 18:48:51.519767+05:30	2021-10-12 18:48:51.519767+05:30	Manimaran	0	f
30	2021-10-17 06:41:10.064627+05:30	2021-10-17 06:41:10.064627+05:30	Anand  Korea	0	f
3	2021-09-07 15:33:28.400716+05:30	2021-09-07 15:33:28.400716+05:30	Varjiniya	\N	t
2	2021-09-07 15:29:45.758289+05:30	2021-09-07 15:29:45.758289+05:30	Prabakaran V	\N	t
31	2021-11-12 12:24:17.462875+05:30	2021-11-12 12:24:17.462875+05:30	Varjiniya Prabakaran	9944193082	t
\.


--
-- Data for Name: dim_expences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_expences (id, created, modified, name, amount, start_date, end_date, pay_type, type, status, sort_order, savings, chit_id, finance_id) FROM stdin;
11	2021-10-16 10:59:22.4324+05:30	2021-10-16 10:59:22.4324+05:30	Outdoor Location	4500.00	2021-10-01	2021-10-31	1	others	t	999	f	\N	\N
13	2021-10-16 11:00:24.761221+05:30	2021-10-16 11:00:24.761221+05:30	Makeup	3000.00	2021-10-01	2021-10-31	2	others	t	999	f	\N	\N
1	2021-10-12 19:03:20.192992+05:30	2021-10-16 10:54:08.848344+05:30	Rent	15500.00	2021-10-12	\N	1	rental	t	1	f	\N	\N
12	2021-10-16 10:59:56.429445+05:30	2021-10-16 12:55:54.633847+05:30	Photographer	3000.00	2021-10-01	2021-10-31	2	others	t	999	f	\N	\N
7	2021-10-13 12:45:07.555663+05:30	2021-10-13 20:10:24.770771+05:30	GRT	11000.00	2021-09-01	2022-07-31	1	savings	t	10	t	\N	\N
4	2021-10-13 12:40:48.021482+05:30	2021-10-13 17:04:23.440509+05:30	House Expenses	6000.00	2021-10-13	\N	1	house_expense	t	7	f	\N	\N
5	2021-10-13 12:42:26.71184+05:30	2021-10-13 17:04:41.006774+05:30	Petrol	1000.00	2021-10-13	\N	1	house_expense	t	8	f	\N	\N
14	2021-10-16 12:28:20.205188+05:30	2021-10-21 08:53:23.0175+05:30	HDFC	0.00	2021-10-16	\N	2	credit_card	t	999	f	\N	\N
9	2021-10-13 19:20:33.822984+05:30	2021-10-21 08:53:52.931601+05:30	ICICI	0.00	2021-09-01	\N	2	credit_card	t	999	f	\N	\N
6	2021-10-13 12:44:49.612428+05:30	2021-10-13 19:52:40.566894+05:30	Airtel	1600.00	2021-10-13	\N	1	bill	t	9	f	\N	\N
2	2021-10-12 19:05:43.987387+05:30	2021-10-21 09:01:07.785957+05:30	Axis PL	8000.00	2021-10-12	2025-11-10	1	loan	t	3	f	\N	\N
3	2021-10-13 12:26:47.901627+05:30	2021-10-21 09:01:25.221892+05:30	I20 Car	13000.00	2021-10-13	2027-09-13	1	loan	t	2	f	\N	\N
17	2021-10-25 17:58:13.583669+05:30	2021-10-25 17:58:13.58467+05:30	ICICI Pay Later	0.00	2021-10-01	\N	2	credit_card	t	999	f	\N	\N
8	2021-10-13 19:18:33.794642+05:30	2021-10-26 19:04:58.597635+05:30	2L	0.00	2021-10-13	2023-02-28	2	chit	t	5	t	2	\N
15	2021-10-16 12:40:46.363312+05:30	2021-10-26 19:07:50.203539+05:30	50K	5000.00	2021-11-01	2022-09-30	1	chit	t	6	t	3	\N
10	2021-10-16 10:16:15.036201+05:30	2021-10-28 10:28:55.867174+05:30	Bajaj Flexi	16400.00	2021-10-16	\N	2	finance	t	4	f	\N	1
19	2021-10-29 14:00:49.031746+05:30	2021-10-29 14:01:42.868008+05:30	Chit Payment	0.00	2021-11-01	2021-11-30	2	others	t	999	f	\N	\N
20	2021-10-31 11:21:23.999841+05:30	2021-10-31 11:21:23.999841+05:30	Others	0.00	2021-10-01	\N	2	others	t	999	f	\N	\N
21	2021-10-31 11:36:44.903138+05:30	2021-10-31 11:36:44.903138+05:30	EB	0.00	2021-10-01	\N	2	bill	t	999	f	\N	\N
22	2021-11-12 13:54:31.959992+05:30	2021-11-12 13:54:31.959992+05:30	Vidhaikkum Karangal	0.00	2021-11-01	\N	2	others	t	999	f	\N	\N
23	2021-11-12 17:03:18.942972+05:30	2021-11-12 17:03:18.942972+05:30	Raam Prabhu	24450.00	2021-12-01	2021-12-31	1	repayment	t	999	f	\N	\N
18	2021-10-29 10:12:41.840784+05:30	2021-11-12 17:08:58.351491+05:30	Baby Account	0.00	2021-10-01	2021-11-30	2	others	t	999	f	\N	\N
\.


--
-- Data for Name: dim_finance_loan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_finance_loan (id, created, modified, name, loan_amount, roi, status, utilized_amount) FROM stdin;
1	2021-10-26 20:20:34+05:30	2021-11-13 13:14:35.780868+05:30	Bajaj Finance	1452999.00	14.25	t	1445000.00
\.


--
-- Data for Name: dim_finance_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_finance_source (id, created, modified, name) FROM stdin;
1	2021-10-20 08:47:19+05:30	2021-10-20 08:47:19+05:30	Others
3	2021-10-20 08:56:05.46385+05:30	2021-10-20 08:56:05.46385+05:30	Salary
4	2021-10-20 08:56:24.622142+05:30	2021-10-20 08:56:24.622142+05:30	Nisha Cars
5	2021-10-20 08:56:40.126446+05:30	2021-10-20 08:56:40.126446+05:30	Moorthy
6	2021-10-20 08:56:56.515768+05:30	2021-10-20 08:56:56.515768+05:30	Sethu
7	2021-10-20 08:57:21.792581+05:30	2021-10-20 08:57:21.792581+05:30	Prasanth
8	2021-10-20 08:57:41.765959+05:30	2021-10-20 08:57:41.765959+05:30	Udhaya
9	2021-10-20 08:57:53.018362+05:30	2021-10-20 08:57:53.018362+05:30	Ramesh
10	2021-10-20 08:59:13.315758+05:30	2021-10-20 08:59:13.315758+05:30	RDS
11	2021-10-20 09:02:19.825681+05:30	2021-10-20 09:02:19.826681+05:30	Bajaj
12	2021-10-23 08:51:04.757626+05:30	2021-10-23 08:51:04.757626+05:30	Dhaya
13	2021-10-23 08:51:19.773956+05:30	2021-10-23 08:51:19.773956+05:30	Sadham
14	2021-10-23 08:53:19.388462+05:30	2021-10-23 08:53:19.388462+05:30	Amma
15	2021-10-23 08:55:34.418397+05:30	2021-10-23 08:55:34.418397+05:30	Thirumurugan
16	2021-10-26 20:52:59+05:30	2021-10-26 20:52:59+05:30	Self
\.


--
-- Data for Name: dim_income; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_income (id, created, modified, name, amount, status, end_date, start_date, pay_type, type, sort_order, source_id, finance_id) FROM stdin;
8	2021-10-12 19:04:49.314651+05:30	2021-10-20 08:58:18.480033+05:30	Salary	105500.00	t	\N	2021-10-13	2	salary	1	3	\N
10	2021-10-13 20:17:27.415937+05:30	2021-10-20 09:00:13.643493+05:30	Innova	35000.00	t	\N	2021-10-13	2	car_rental	2	4	\N
11	2021-10-16 11:01:02.907629+05:30	2021-10-20 09:00:48.102029+05:30	Ramesh	2000.00	t	\N	2021-10-01	1	rent	4	9	\N
14	2021-10-16 11:02:54.284403+05:30	2021-10-20 09:01:02.289055+05:30	Moorthy	3700.00	t	2021-10-31	2021-10-01	1	emi	5	5	\N
13	2021-10-16 11:01:44.081813+05:30	2021-10-20 09:01:18.604034+05:30	Moorthy	1500.00	t	\N	2021-10-01	1	rent	5	5	\N
17	2021-10-16 14:04:08.514684+05:30	2021-10-20 09:01:39.220736+05:30	Sethu	3400.00	t	2022-04-30	2021-11-01	1	emi	6	6	\N
12	2021-10-16 11:01:23.959812+05:30	2021-10-20 09:01:51.638456+05:30	Sethu	1500.00	t	\N	2021-10-16	1	rent	6	6	\N
16	2021-10-16 11:15:56.277495+05:30	2021-10-20 09:02:56.492048+05:30	Bajaj	0.00	t	\N	2021-10-01	2	finance	7	11	\N
9	2021-10-12 19:05:08.914767+05:30	2021-10-20 20:54:46.593146+05:30	Finance Interest	4000.00	t	\N	2021-10-13	1	finance	3	10	\N
19	2021-10-16 20:58:49.176178+05:30	2021-10-27 18:31:26.984235+05:30	Prasanth	2000.00	t	\N	2021-09-01	2	emi	7	7	1
18	2021-10-16 20:57:44.585277+05:30	2021-10-27 18:45:29.335401+05:30	Udhaya	4200.00	t	\N	2021-09-01	2	emi	8	8	1
21	2021-11-12 16:58:34.60058+05:30	2021-11-12 17:27:04.567695+05:30	Ramesh Flexi	0.00	t	\N	2021-12-01	2	emi	4	9	1
20	2021-10-28 11:11:02.356526+05:30	2021-11-12 17:28:17.349101+05:30	Mama Mobile	1100.00	t	2022-05-31	2021-12-01	1	emi	4	9	\N
15	2021-10-16 11:03:41.002759+05:30	2021-11-12 17:29:19.586656+05:30	Ramesh Mobile	2050.00	t	2022-06-30	2021-10-16	1	emi	4	9	\N
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	car	car
8	car	carodometer
9	chit	customers
10	chit	chitcustomers
11	chit	chit
12	chit	chitpayment
13	finance	income
14	finance	monthlypayment
15	finance	expenses
16	chit	chitsettlement
17	finance	incomesource
18	finance	financesource
19	finance	credit
20	finance	financeloan
21	finance	financeutilized
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-09-06 16:23:28.155087+05:30
2	auth	0001_initial	2021-09-06 16:23:28.913201+05:30
3	admin	0001_initial	2021-09-06 16:23:30.296741+05:30
4	admin	0002_logentry_remove_auto_add	2021-09-06 16:23:30.497298+05:30
5	admin	0003_logentry_add_action_flag_choices	2021-09-06 16:23:30.584916+05:30
6	contenttypes	0002_remove_content_type_name	2021-09-06 16:23:30.662909+05:30
7	auth	0002_alter_permission_name_max_length	2021-09-06 16:23:30.6878+05:30
8	auth	0003_alter_user_email_max_length	2021-09-06 16:23:30.710204+05:30
9	auth	0004_alter_user_username_opts	2021-09-06 16:23:30.740789+05:30
10	auth	0005_alter_user_last_login_null	2021-09-06 16:23:30.769139+05:30
11	auth	0006_require_contenttypes_0002	2021-09-06 16:23:30.781314+05:30
12	auth	0007_alter_validators_add_error_messages	2021-09-06 16:23:30.801651+05:30
13	auth	0008_alter_user_username_max_length	2021-09-06 16:23:30.991329+05:30
14	auth	0009_alter_user_last_name_max_length	2021-09-06 16:23:31.022598+05:30
15	auth	0010_alter_group_name_max_length	2021-09-06 16:23:31.05385+05:30
16	auth	0011_update_proxy_permissions	2021-09-06 16:23:31.069476+05:30
17	sessions	0001_initial	2021-09-06 16:23:31.318722+05:30
18	car	0001_initial	2021-09-06 16:59:35.498425+05:30
19	car	0002_auto_20210906_1857	2021-09-06 18:58:30.000491+05:30
20	car	0003_auto_20210906_1940	2021-09-06 19:41:02.083887+05:30
21	car	0004_auto_20210906_2124	2021-09-06 21:28:37.249105+05:30
22	car	0005_auto_20210907_1001	2021-09-07 10:02:46.396349+05:30
23	chit	0001_initial	2021-09-07 13:03:04.618229+05:30
24	chit	0002_auto_20210907_1527	2021-09-07 15:28:08.636885+05:30
25	chit	0003_auto_20210907_1530	2021-09-07 15:31:22.997768+05:30
26	chit	0004_auto_20210907_1542	2021-09-07 15:44:35.098574+05:30
27	chit	0005_remove_chitcustomers_prefered_month	2021-09-07 17:31:58.357346+05:30
28	chit	0006_chitcustomers_prefered_month	2021-09-07 17:33:10.124139+05:30
29	chit	0007_auto_20210907_1741	2021-09-07 17:42:38.165715+05:30
30	chit	0008_chitpayment	2021-09-14 10:14:51.753265+05:30
31	car	0006_car_gps_last_updated	2021-09-23 05:44:45.893398+05:30
32	chit	0009_chitpayment_month	2021-09-23 09:27:13.213951+05:30
33	chit	0010_chit_interest_percentage	2021-09-29 15:55:22.948041+05:30
34	chit	0011_chit_commision_percentage	2021-09-29 16:01:27.789691+05:30
35	finance	0001_initial	2021-10-01 18:18:23.511016+05:30
36	finance	0002_expenses_monthlypayment	2021-10-01 18:22:07.36183+05:30
37	chit	0012_chitsettlement	2021-10-06 08:42:21.809317+05:30
38	finance	0003_auto_20211005_1933	2021-10-06 08:42:22.573343+05:30
39	chit	0013_auto_20211006_1029	2021-10-06 10:33:11.686297+05:30
40	finance	0004_auto_20211006_1029	2021-10-06 10:33:11.718913+05:30
41	chit	0014_auto_20211006_1118	2021-10-06 11:22:05.568825+05:30
42	finance	0005_auto_20211006_1125	2021-10-06 11:27:03.738954+05:30
43	chit	0015_auto_20211006_1205	2021-10-06 12:06:19.343859+05:30
44	chit	0016_chitsettlement_amount	2021-10-06 12:51:23.286007+05:30
45	chit	0017_chitsettlement_betting	2021-10-06 12:51:23.650685+05:30
46	chit	0018_auto_20211011_1031	2021-10-11 10:31:42.605748+05:30
47	finance	0006_auto_20211013_1252	2021-10-13 12:52:46.097681+05:30
48	finance	0007_auto_20211013_1643	2021-10-13 16:43:34.893599+05:30
49	finance	0008_expenses_type	2021-10-13 19:09:05.838991+05:30
50	finance	0009_auto_20211013_1919	2021-10-13 19:19:49.157113+05:30
51	finance	0010_auto_20211013_1922	2021-10-13 19:22:57.623733+05:30
52	finance	0011_expenses_type	2021-10-13 19:26:21.47476+05:30
53	finance	0012_auto_20211013_1929	2021-10-13 19:29:41.159287+05:30
54	finance	0013_auto_20211013_2004	2021-10-13 20:07:35.10941+05:30
55	finance	0014_auto_20211013_2013	2021-10-13 20:14:21.91641+05:30
56	finance	0015_auto_20211013_2015	2021-10-13 20:15:44.299073+05:30
57	finance	0016_expenses_status	2021-10-13 20:18:01.669962+05:30
58	finance	0017_monthlypayment_income	2021-10-13 20:57:12.890399+05:30
59	finance	0018_auto_20211013_2058	2021-10-13 20:59:12.876918+05:30
60	finance	0019_auto_20211013_2105	2021-10-13 21:06:15.473375+05:30
61	finance	0020_auto_20211014_0921	2021-10-14 09:22:16.923177+05:30
62	finance	0021_auto_20211016_1243	2021-10-16 12:43:56.055244+05:30
63	finance	0022_expenses_savings	2021-10-16 13:29:03.032722+05:30
64	finance	0023_auto_20211016_2203	2021-10-16 22:03:59.868289+05:30
65	finance	0024_auto_20211017_2004	2021-10-17 20:05:01.948334+05:30
66	finance	0025_auto_20211017_2008	2021-10-17 20:09:34.56213+05:30
67	finance	0026_incomesource	2021-10-20 08:47:02.237599+05:30
68	finance	0027_income_source	2021-10-20 08:48:16.753542+05:30
69	finance	0028_auto_20211020_2129	2021-10-20 21:30:42.291432+05:30
70	finance	0029_auto_20211021_0853	2021-10-21 08:54:13.8116+05:30
71	finance	0030_auto_20211021_0857	2021-10-21 08:58:25.723757+05:30
72	finance	0031_auto_20211022_1940	2021-10-23 08:31:07.113055+05:30
73	finance	0032_auto_20211023_0839	2021-10-23 08:42:03.809593+05:30
74	finance	0033_auto_20211023_0845	2021-10-23 08:46:07.772959+05:30
75	finance	0034_auto_20211023_0852	2021-10-23 08:53:26.063055+05:30
76	finance	0035_auto_20211023_0859	2021-10-23 11:15:53.888867+05:30
77	finance	0036_auto_20211023_1115	2021-10-23 11:15:54.097978+05:30
78	finance	0037_remove_credit_type	2021-10-23 11:42:29.274365+05:30
79	finance	0038_credit_expected_date	2021-10-23 11:59:22.528739+05:30
80	chit	0019_chitcustomers_self	2021-10-26 17:27:17.474338+05:30
81	finance	0039_auto_20211026_1726	2021-10-26 17:27:17.522079+05:30
82	chit	0020_auto_20211026_1728	2021-10-26 17:29:33.040346+05:30
83	finance	0040_expenses_chit	2021-10-26 19:02:49.099094+05:30
84	finance	0041_flexiloan_flexiutilized	2021-10-26 20:14:51.892356+05:30
85	finance	0042_flexiutilized_payment_type	2021-10-27 13:53:50.405867+05:30
86	finance	0043_flexiloan_utilized_amount	2021-10-27 15:28:06.038763+05:30
87	finance	0044_auto_20211027_1702	2021-10-27 17:03:07.064837+05:30
88	finance	0045_expenses_finance	2021-10-27 17:13:42.122035+05:30
89	finance	0046_auto_20211027_1720	2021-10-27 17:21:55.451895+05:30
90	finance	0047_income_finance	2021-10-27 17:26:59.119043+05:30
91	finance	0048_auto_20211027_2016	2021-10-27 20:17:16.305552+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
kvhppl9apsmuv29iowlrga7k6qgchq3s	OTg1YzQ5M2VlYzYzODE5ZWYxN2VkNTJhOGIwMTQ1YTM1MzRkNmY3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YTkwNDNlOWEwODgwYmNiOTFhMDE0MTFiMmIyYThmNTg3ZjI5MWIzIn0=	2021-10-05 16:35:07.534186+05:30
3486c2jpvf65ipcbivjkhv1j6xq7q009	OTg1YzQ5M2VlYzYzODE5ZWYxN2VkNTJhOGIwMTQ1YTM1MzRkNmY3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YTkwNDNlOWEwODgwYmNiOTFhMDE0MTFiMmIyYThmNTg3ZjI5MWIzIn0=	2021-10-12 19:17:47.857445+05:30
jwqlg4mzqu3fjdku06pfh02in9dqf7mt	OTg1YzQ5M2VlYzYzODE5ZWYxN2VkNTJhOGIwMTQ1YTM1MzRkNmY3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YTkwNDNlOWEwODgwYmNiOTFhMDE0MTFiMmIyYThmNTg3ZjI5MWIzIn0=	2021-11-07 10:10:33.265228+05:30
jklopyitosy0cplydnew3p4hlazfkw8h	OTg1YzQ5M2VlYzYzODE5ZWYxN2VkNTJhOGIwMTQ1YTM1MzRkNmY3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YTkwNDNlOWEwODgwYmNiOTFhMDE0MTFiMmIyYThmNTg3ZjI5MWIzIn0=	2021-11-22 11:32:05.534413+05:30
\.


--
-- Data for Name: fact_car_odometer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_car_odometer (id, created, modified, date, kms, car_id) FROM stdin;
89	2021-10-01 17:59:15.47054+05:30	2021-10-11 06:31:34.962929+05:30	2021-10-01	0.00	1
81	2021-09-21 16:33:07.297531+05:30	2021-09-28 19:14:52.612885+05:30	2021-09-20	10.00	1
3	2021-09-07 09:22:37.272976+05:30	2021-09-07 09:22:37.272976+05:30	2021-07-01	0.00	1
4	2021-09-07 09:22:37.366736+05:30	2021-09-07 09:22:37.366736+05:30	2021-07-02	0.00	1
5	2021-09-07 09:22:37.37375+05:30	2021-09-07 09:22:37.37375+05:30	2021-07-03	0.00	1
6	2021-09-07 09:22:37.37375+05:30	2021-09-07 09:22:37.37375+05:30	2021-07-04	12.00	1
7	2021-09-07 09:22:37.38942+05:30	2021-09-07 09:22:37.38942+05:30	2021-07-05	175.00	1
8	2021-09-07 09:22:37.405013+05:30	2021-09-07 09:22:37.405013+05:30	2021-07-06	0.00	1
9	2021-09-07 09:22:37.405013+05:30	2021-09-07 09:22:37.405013+05:30	2021-07-07	0.00	1
10	2021-09-07 09:22:37.42067+05:30	2021-09-07 09:22:37.42067+05:30	2021-07-08	15.00	1
11	2021-09-07 09:22:37.42067+05:30	2021-09-07 09:22:37.42067+05:30	2021-07-09	53.00	1
12	2021-09-07 09:22:37.436277+05:30	2021-09-07 09:22:37.436277+05:30	2021-07-10	0.00	1
13	2021-09-07 09:22:37.467517+05:30	2021-09-07 09:22:37.467517+05:30	2021-07-11	0.00	1
14	2021-09-07 09:22:37.474032+05:30	2021-09-07 09:22:37.474032+05:30	2021-07-12	0.00	1
15	2021-09-07 09:22:37.489675+05:30	2021-09-07 09:22:37.489675+05:30	2021-07-13	0.00	1
16	2021-09-07 09:22:37.489675+05:30	2021-09-07 09:22:37.489675+05:30	2021-07-14	0.00	1
17	2021-09-07 09:22:37.507026+05:30	2021-09-07 09:22:37.507026+05:30	2021-07-15	0.00	1
18	2021-09-07 09:22:37.507026+05:30	2021-09-07 09:22:37.507026+05:30	2021-07-16	62.00	1
19	2021-09-07 09:22:37.522653+05:30	2021-09-07 09:22:37.522653+05:30	2021-07-17	0.00	1
20	2021-09-07 09:22:37.538281+05:30	2021-09-07 09:22:37.538281+05:30	2021-07-18	67.00	1
21	2021-09-07 09:22:37.538281+05:30	2021-09-07 09:22:37.538281+05:30	2021-07-19	41.00	1
22	2021-09-07 09:22:37.553903+05:30	2021-09-07 09:22:37.553903+05:30	2021-07-20	94.00	1
23	2021-09-07 09:22:37.553903+05:30	2021-09-07 09:22:37.553903+05:30	2021-07-21	553.00	1
24	2021-09-07 09:22:37.574043+05:30	2021-09-07 09:22:37.574043+05:30	2021-07-22	227.00	1
25	2021-09-07 09:22:37.574043+05:30	2021-09-07 09:22:37.574043+05:30	2021-07-23	573.00	1
26	2021-09-07 09:22:37.601272+05:30	2021-09-07 09:22:37.601272+05:30	2021-07-24	193.00	1
27	2021-09-07 09:22:37.601272+05:30	2021-09-07 09:22:37.601272+05:30	2021-07-25	17.00	1
28	2021-09-07 09:22:37.616901+05:30	2021-09-07 09:22:37.616901+05:30	2021-07-26	43.00	1
29	2021-09-07 09:22:37.632526+05:30	2021-09-07 09:22:37.632526+05:30	2021-07-27	144.00	1
30	2021-09-07 09:22:37.632526+05:30	2021-09-07 09:22:37.632526+05:30	2021-07-28	97.00	1
31	2021-09-07 09:22:37.648151+05:30	2021-09-07 09:22:37.648151+05:30	2021-07-29	52.00	1
32	2021-09-07 09:22:37.663776+05:30	2021-09-07 09:22:37.663776+05:30	2021-07-30	475.00	1
33	2021-09-07 09:23:24.923452+05:30	2021-09-07 09:23:24.923452+05:30	2021-08-01	245.00	1
34	2021-09-07 09:23:24.940532+05:30	2021-09-07 09:23:24.940532+05:30	2021-08-02	8.00	1
35	2021-09-07 09:23:24.956161+05:30	2021-09-07 09:23:24.956161+05:30	2021-08-03	257.00	1
36	2021-09-07 09:23:24.971791+05:30	2021-09-07 09:23:24.971791+05:30	2021-08-04	430.00	1
37	2021-09-07 09:23:24.971791+05:30	2021-09-07 09:23:24.971791+05:30	2021-08-05	136.00	1
38	2021-09-07 09:23:24.987412+05:30	2021-09-07 09:23:24.987412+05:30	2021-08-06	331.00	1
39	2021-09-07 09:23:25.003034+05:30	2021-09-07 09:23:25.003034+05:30	2021-08-07	2.00	1
40	2021-09-07 09:23:25.018663+05:30	2021-09-07 09:23:25.018663+05:30	2021-08-08	305.00	1
41	2021-09-07 09:23:25.023705+05:30	2021-09-07 09:23:25.023705+05:30	2021-08-09	774.00	1
42	2021-09-07 09:23:25.041127+05:30	2021-09-07 09:23:25.041127+05:30	2021-08-10	332.00	1
43	2021-09-07 09:23:25.041127+05:30	2021-09-07 09:23:25.041127+05:30	2021-08-11	0.00	1
44	2021-09-07 09:23:25.056756+05:30	2021-09-07 09:23:25.056756+05:30	2021-08-12	0.00	1
45	2021-09-07 09:23:25.072378+05:30	2021-09-07 09:23:25.072378+05:30	2021-08-13	3.00	1
46	2021-09-07 09:23:25.088004+05:30	2021-09-07 09:23:25.088004+05:30	2021-08-14	666.00	1
47	2021-09-07 09:23:25.088004+05:30	2021-09-07 09:23:25.088004+05:30	2021-08-15	40.00	1
48	2021-09-07 09:23:25.106387+05:30	2021-09-07 09:23:25.106387+05:30	2021-08-16	399.00	1
49	2021-09-07 09:23:25.124036+05:30	2021-09-07 09:23:25.124036+05:30	2021-08-17	1.00	1
50	2021-09-07 09:23:25.124036+05:30	2021-09-07 09:23:25.124036+05:30	2021-08-18	63.00	1
51	2021-09-07 09:23:25.141053+05:30	2021-09-07 09:23:25.141053+05:30	2021-08-19	372.00	1
52	2021-09-07 09:23:25.141053+05:30	2021-09-07 09:23:25.141053+05:30	2021-08-20	241.00	1
53	2021-09-07 09:23:25.156684+05:30	2021-09-07 09:23:25.156684+05:30	2021-08-21	177.00	1
54	2021-09-07 09:23:25.172307+05:30	2021-09-07 09:23:25.172307+05:30	2021-08-22	28.00	1
55	2021-09-07 09:23:25.187931+05:30	2021-09-07 09:23:25.187931+05:30	2021-08-23	1.00	1
56	2021-09-07 09:23:25.203557+05:30	2021-09-07 09:23:25.203557+05:30	2021-08-24	17.00	1
57	2021-09-07 09:23:25.219182+05:30	2021-09-07 09:23:25.219182+05:30	2021-08-25	22.00	1
58	2021-09-07 09:23:25.2242+05:30	2021-09-07 09:23:25.2242+05:30	2021-08-26	0.00	1
59	2021-09-07 09:23:25.239842+05:30	2021-09-07 09:23:25.239842+05:30	2021-08-27	8.00	1
60	2021-09-07 09:23:25.255471+05:30	2021-09-07 09:23:25.255471+05:30	2021-08-28	722.00	1
61	2021-09-07 09:33:04.66884+05:30	2021-09-07 09:33:04.66884+05:30	2021-08-30	27.00	1
82	2021-09-22 14:15:40.753075+05:30	2021-09-28 19:14:52.628887+05:30	2021-09-21	9.00	1
83	2021-09-22 18:23:50.707259+05:30	2021-09-28 19:14:52.645886+05:30	2021-09-22	21.00	1
84	2021-09-23 05:36:38.864004+05:30	2021-09-28 19:14:52.659884+05:30	2021-09-23	20.00	1
86	2021-09-28 19:14:52.675889+05:30	2021-09-28 19:14:52.675889+05:30	2021-09-24	17.00	1
87	2021-09-28 19:14:52.693884+05:30	2021-09-28 19:14:52.693884+05:30	2021-09-25	23.00	1
88	2021-09-28 19:14:52.713886+05:30	2021-09-28 19:14:52.713886+05:30	2021-09-26	30.00	1
94	2021-10-05 12:34:03.994068+05:30	2021-10-11 06:31:35.013869+05:30	2021-10-02	0.00	1
85	2021-09-28 19:10:31.418498+05:30	2021-09-28 19:14:51.79028+05:30	2021-09-28	38.00	1
95	2021-10-05 12:34:04.011064+05:30	2021-10-11 06:31:35.024742+05:30	2021-10-03	0.00	1
92	2021-10-04 17:53:05.18952+05:30	2021-10-11 06:31:35.035856+05:30	2021-10-04	40.00	1
90	2021-10-01 17:59:16.106297+05:30	2021-10-01 17:59:16.107301+05:30	2021-09-29	47.00	1
91	2021-10-01 17:59:16.178423+05:30	2021-10-01 17:59:16.178423+05:30	2021-09-30	32.00	1
62	2021-09-07 09:33:57.660917+05:30	2021-10-04 17:53:05.69945+05:30	2021-09-01	81.00	1
63	2021-09-07 09:33:57.682154+05:30	2021-10-04 17:53:05.708999+05:30	2021-09-02	10.00	1
64	2021-09-07 09:33:57.682154+05:30	2021-10-04 17:53:05.719534+05:30	2021-09-03	24.00	1
102	2021-10-12 09:49:33.553339+05:30	2021-10-12 09:49:33.553339+05:30	2021-10-12	0.00	1
93	2021-10-05 12:34:03.146198+05:30	2021-10-11 06:31:35.046022+05:30	2021-10-05	20.00	1
65	2021-09-07 09:33:57.697783+05:30	2021-09-28 19:14:52.445886+05:30	2021-09-04	43.00	1
66	2021-09-07 09:33:57.713409+05:30	2021-09-28 19:14:52.455885+05:30	2021-09-05	21.00	1
67	2021-09-07 09:37:14.42425+05:30	2021-09-28 19:14:52.466887+05:30	2021-09-06	12.00	1
68	2021-09-11 19:35:49.530462+05:30	2021-09-28 19:14:52.476887+05:30	2021-09-07	31.00	1
69	2021-09-11 19:35:49.548551+05:30	2021-09-28 19:14:52.486887+05:30	2021-09-08	0.00	1
70	2021-09-11 19:35:49.56379+05:30	2021-09-28 19:14:52.497887+05:30	2021-09-09	0.00	1
71	2021-09-11 19:35:49.579331+05:30	2021-09-28 19:14:52.507886+05:30	2021-09-10	15.00	1
72	2021-09-14 07:22:43.075708+05:30	2021-09-28 19:14:52.517887+05:30	2021-09-11	0.00	1
103	2021-10-13 12:24:24.729948+05:30	2021-10-13 12:24:24.729948+05:30	2021-10-13	0.00	1
96	2021-10-06 17:12:39.922145+05:30	2021-10-11 06:31:35.594387+05:30	2021-10-06	19.00	1
73	2021-09-14 07:22:43.113971+05:30	2021-09-28 19:14:52.527885+05:30	2021-09-12	50.00	1
74	2021-09-14 07:22:43.3553+05:30	2021-09-28 19:14:52.537886+05:30	2021-09-13	9.00	1
75	2021-09-21 16:33:07.094167+05:30	2021-09-28 19:14:52.547885+05:30	2021-09-14	14.00	1
97	2021-10-07 17:05:10.892207+05:30	2021-10-11 06:31:35.612384+05:30	2021-10-07	49.00	1
99	2021-10-11 06:31:35.680518+05:30	2021-10-11 06:31:35.680518+05:30	2021-10-08	0.00	1
76	2021-09-21 16:33:07.23714+05:30	2021-09-28 19:14:52.557887+05:30	2021-09-15	74.00	1
77	2021-09-21 16:33:07.24904+05:30	2021-09-28 19:14:52.567885+05:30	2021-09-16	17.00	1
78	2021-09-21 16:33:07.261855+05:30	2021-09-28 19:14:52.577891+05:30	2021-09-17	23.00	1
79	2021-09-21 16:33:07.274469+05:30	2021-09-28 19:14:52.589888+05:30	2021-09-18	15.00	1
80	2021-09-21 16:33:07.285553+05:30	2021-09-28 19:14:52.600889+05:30	2021-09-19	0.00	1
100	2021-10-11 06:31:35.822454+05:30	2021-10-11 06:31:35.822454+05:30	2021-10-09	7.00	1
101	2021-10-11 06:31:35.836975+05:30	2021-10-11 06:31:35.836975+05:30	2021-10-10	35.00	1
98	2021-10-11 06:31:33.99023+05:30	2021-10-11 19:01:31.596679+05:30	2021-10-11	55.00	1
105	2021-10-15 08:24:09.800991+05:30	2021-10-16 08:09:37.657976+05:30	2021-10-14	7.00	1
106	2021-10-16 08:08:18.463394+05:30	2021-11-09 17:23:26.223329+05:30	2021-10-16	67.00	1
107	2021-10-17 20:58:04.246309+05:30	2021-11-09 17:23:26.232865+05:30	2021-10-17	0.00	1
119	2021-11-09 17:23:26.355889+05:30	2021-11-09 17:23:26.355889+05:30	2021-10-25	4.00	1
111	2021-10-23 10:29:38.995088+05:30	2021-11-09 17:23:26.309967+05:30	2021-10-22	32.00	1
109	2021-10-23 10:29:38.292856+05:30	2021-11-09 17:23:26.32375+05:30	2021-10-23	23.00	1
112	2021-10-24 07:45:49.126527+05:30	2021-11-09 17:23:26.344266+05:30	2021-10-24	0.00	1
114	2021-10-27 20:24:14.671449+05:30	2021-11-09 17:23:26.494218+05:30	2021-10-27	0.00	1
115	2021-10-28 11:02:55.255479+05:30	2021-11-09 17:23:26.507949+05:30	2021-10-28	42.00	1
104	2021-10-15 08:24:09.174987+05:30	2021-11-09 17:23:26.21316+05:30	2021-10-15	8.00	1
117	2021-11-09 17:23:26.243574+05:30	2021-11-09 17:23:26.243574+05:30	2021-10-18	80.00	1
108	2021-10-19 18:27:05.149668+05:30	2021-11-09 17:23:26.253684+05:30	2021-10-19	36.00	1
118	2021-11-09 17:23:26.265194+05:30	2021-11-09 17:23:26.265194+05:30	2021-10-20	0.00	1
110	2021-10-23 10:29:38.983126+05:30	2021-11-09 17:23:26.300636+05:30	2021-10-21	17.00	1
116	2021-11-09 17:23:25.419539+05:30	2021-11-12 13:55:56.135399+05:30	2021-11-09	0.00	1
113	2021-10-26 17:01:19.06699+05:30	2021-11-09 17:23:26.3691+05:30	2021-10-26	7.00	1
120	2021-11-09 17:23:26.52595+05:30	2021-11-09 17:23:26.526027+05:30	2021-10-29	14.00	1
121	2021-11-09 17:23:26.542915+05:30	2021-11-09 17:23:26.542915+05:30	2021-10-30	0.00	1
122	2021-11-09 17:23:26.7114+05:30	2021-11-09 17:23:26.7114+05:30	2021-10-31	41.00	1
123	2021-11-09 17:23:26.821859+05:30	2021-11-12 13:55:56.027784+05:30	2021-11-01	57.00	1
124	2021-11-09 17:23:26.862317+05:30	2021-11-12 13:55:56.043885+05:30	2021-11-02	0.00	1
125	2021-11-09 17:23:26.881935+05:30	2021-11-12 13:55:56.055732+05:30	2021-11-03	16.00	1
126	2021-11-09 17:23:26.893377+05:30	2021-11-12 13:55:56.067149+05:30	2021-11-04	0.00	1
127	2021-11-09 17:23:26.910777+05:30	2021-11-12 13:55:56.080482+05:30	2021-11-05	0.00	1
128	2021-11-09 17:23:26.936646+05:30	2021-11-12 13:55:56.093558+05:30	2021-11-06	0.00	1
129	2021-11-09 17:23:26.942981+05:30	2021-11-12 13:55:56.108697+05:30	2021-11-07	0.00	1
130	2021-11-09 17:23:26.967925+05:30	2021-11-12 13:55:56.121597+05:30	2021-11-08	0.00	1
132	2021-11-12 13:55:56.151405+05:30	2021-11-12 13:55:56.151405+05:30	2021-11-10	0.00	1
133	2021-11-12 13:55:56.169025+05:30	2021-11-12 13:55:56.169025+05:30	2021-11-11	0.00	1
131	2021-11-12 13:55:55.371346+05:30	2021-11-12 17:17:02.392637+05:30	2021-11-12	0.00	1
134	2021-11-13 17:33:11.018207+05:30	2021-11-13 17:33:11.018207+05:30	2021-11-13	0.00	1
\.


--
-- Data for Name: fact_chit_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_chit_customers (id, created, modified, chit_id, customer_id, prefered_month) FROM stdin;
20	2021-09-29 13:08:43.264367+05:30	2021-09-29 13:08:43.264367+05:30	2	18	4
12	2021-09-29 13:07:07.564998+05:30	2021-09-29 13:07:07.564998+05:30	2	28	\N
37	2021-10-17 06:41:51.601398+05:30	2021-10-17 06:41:51.601398+05:30	3	30	\N
25	2021-10-05 19:22:12.522696+05:30	2021-10-05 19:22:12.522696+05:30	3	3	1
36	2021-10-16 21:16:29.047432+05:30	2021-10-16 21:16:29.047432+05:30	3	19	\N
30	2021-10-05 19:25:51.986851+05:30	2021-10-05 19:25:51.986851+05:30	3	24	\N
26	2021-10-05 19:22:29.002842+05:30	2021-10-05 19:22:29.002842+05:30	3	8	\N
28	2021-10-05 19:22:54.053525+05:30	2021-10-05 19:22:54.053525+05:30	3	7	\N
27	2021-10-05 19:22:39.963538+05:30	2021-10-05 19:22:39.963538+05:30	3	4	\N
35	2021-10-05 19:28:43.929975+05:30	2021-10-05 19:28:43.929975+05:30	3	27	\N
34	2021-10-05 19:28:13.04655+05:30	2021-10-05 19:28:13.04655+05:30	3	26	\N
29	2021-10-05 19:23:19.459246+05:30	2021-10-05 19:23:19.459246+05:30	3	12	\N
5	2021-09-29 13:02:48.035852+05:30	2021-09-29 13:02:48.035852+05:30	2	3	1
8	2021-09-29 13:06:44.735245+05:30	2021-09-29 13:06:44.735245+05:30	2	8	2
15	2021-09-29 13:07:58.234754+05:30	2021-09-29 13:07:58.234754+05:30	2	13	3
19	2021-09-29 13:08:38.057919+05:30	2021-09-29 13:08:38.057919+05:30	2	17	\N
10	2021-09-29 13:06:58.091876+05:30	2021-09-29 13:06:58.091876+05:30	2	9	\N
21	2021-09-29 13:08:50.243596+05:30	2021-09-29 13:08:50.243596+05:30	2	19	\N
16	2021-09-29 13:08:16.626558+05:30	2021-09-29 13:08:16.626558+05:30	2	14	5
18	2021-09-29 13:08:33.094122+05:30	2021-09-29 13:08:33.094122+05:30	2	16	\N
24	2021-09-29 13:09:08.28144+05:30	2021-09-29 13:09:08.28144+05:30	2	22	\N
9	2021-09-29 13:06:52.638647+05:30	2021-09-29 13:06:52.638647+05:30	2	2	\N
22	2021-09-29 13:08:56.652116+05:30	2021-09-29 13:08:56.652116+05:30	2	20	\N
23	2021-09-29 13:09:03.019823+05:30	2021-09-29 13:09:03.019823+05:30	2	31	\N
11	2021-09-29 13:07:02.558245+05:30	2021-09-29 13:07:02.558245+05:30	2	10	\N
17	2021-09-29 13:08:25.851942+05:30	2021-09-29 13:08:25.851942+05:30	2	15	\N
7	2021-09-29 13:06:38.877556+05:30	2021-09-29 13:06:38.877556+05:30	2	7	\N
14	2021-09-29 13:07:17.804529+05:30	2021-09-29 13:07:17.804529+05:30	2	4	\N
6	2021-09-29 13:06:33.278676+05:30	2021-09-29 13:06:33.278676+05:30	2	6	\N
13	2021-09-29 13:07:12.455847+05:30	2021-09-29 13:07:12.455847+05:30	2	12	\N
\.


--
-- Data for Name: fact_chit_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_chit_payment (id, created, modified, paid_date, chit_id, customer_id, month) FROM stdin;
22	2021-09-29 13:15:12.051362+05:30	2021-09-29 13:15:12.051362+05:30	2021-09-29	2	17	2021-07-01
23	2021-09-29 13:15:12.731816+05:30	2021-09-29 13:15:12.731816+05:30	2021-09-29	2	9	2021-07-01
24	2021-09-29 13:15:13.868547+05:30	2021-09-29 13:15:13.868547+05:30	2021-09-29	2	19	2021-07-01
25	2021-09-29 13:15:14.569786+05:30	2021-09-29 13:15:14.569786+05:30	2021-09-29	2	13	2021-07-01
26	2021-09-29 13:15:15.669739+05:30	2021-09-29 13:15:15.669739+05:30	2021-09-29	2	14	2021-07-01
27	2021-09-29 13:15:16.395728+05:30	2021-09-29 13:15:16.395728+05:30	2021-09-29	2	16	2021-07-01
28	2021-09-29 13:15:17.606728+05:30	2021-09-29 13:15:17.606728+05:30	2021-09-29	2	22	2021-07-01
29	2021-09-29 13:15:18.350657+05:30	2021-09-29 13:15:18.350657+05:30	2021-09-29	2	8	2021-07-01
30	2021-09-29 13:15:20.427625+05:30	2021-09-29 13:15:20.427625+05:30	2021-09-29	2	2	2021-07-01
31	2021-09-29 13:15:21.089386+05:30	2021-09-29 13:15:21.089386+05:30	2021-09-29	2	20	2021-07-01
33	2021-09-29 13:15:22.536468+05:30	2021-09-29 13:15:22.536468+05:30	2021-09-29	2	10	2021-07-01
34	2021-09-29 13:15:23.24931+05:30	2021-09-29 13:15:23.24931+05:30	2021-09-29	2	15	2021-07-01
35	2021-09-29 13:15:24.006648+05:30	2021-09-29 13:15:24.006648+05:30	2021-09-29	2	7	2021-07-01
36	2021-09-29 13:15:34.170399+05:30	2021-09-29 13:15:34.170399+05:30	2021-09-29	2	18	2021-07-01
37	2021-09-29 13:15:34.437396+05:30	2021-09-29 13:15:34.438398+05:30	2021-09-29	2	4	2021-07-01
38	2021-09-29 13:15:34.5034+05:30	2021-09-29 13:15:34.5034+05:30	2021-09-29	2	3	2021-07-01
39	2021-09-29 13:15:34.997644+05:30	2021-09-29 13:15:34.998645+05:30	2021-09-29	2	6	2021-07-01
40	2021-09-29 13:15:36.410027+05:30	2021-09-29 13:15:36.410027+05:30	2021-09-29	2	12	2021-07-01
41	2021-09-29 13:15:59.404655+05:30	2021-09-29 13:15:59.404655+05:30	2021-09-29	2	17	2021-08-01
42	2021-09-29 13:16:00.084579+05:30	2021-09-29 13:16:00.084579+05:30	2021-09-29	2	9	2021-08-01
43	2021-09-29 13:16:01.108849+05:30	2021-09-29 13:16:01.108849+05:30	2021-09-29	2	19	2021-08-01
44	2021-09-29 13:16:02.120192+05:30	2021-09-29 13:16:02.120192+05:30	2021-09-29	2	13	2021-08-01
45	2021-09-29 13:16:02.941847+05:30	2021-09-29 13:16:02.941847+05:30	2021-09-29	2	14	2021-08-01
46	2021-09-29 13:16:03.66537+05:30	2021-09-29 13:16:03.66537+05:30	2021-09-29	2	16	2021-08-01
47	2021-09-29 13:16:04.333552+05:30	2021-09-29 13:16:04.333552+05:30	2021-09-29	2	22	2021-08-01
48	2021-09-29 13:16:05.416091+05:30	2021-09-29 13:16:05.416091+05:30	2021-09-29	2	8	2021-08-01
49	2021-09-29 13:16:06.11682+05:30	2021-09-29 13:16:06.117821+05:30	2021-09-29	2	2	2021-08-01
50	2021-09-29 13:16:08.06887+05:30	2021-09-29 13:16:08.06887+05:30	2021-09-29	2	20	2021-08-01
51	2021-09-29 13:16:10.228996+05:30	2021-09-29 13:16:10.228996+05:30	2021-09-29	2	10	2021-08-01
53	2021-09-29 13:16:13.218124+05:30	2021-09-29 13:16:13.218124+05:30	2021-09-29	2	15	2021-08-01
54	2021-09-29 13:16:14.250721+05:30	2021-09-29 13:16:14.250721+05:30	2021-09-29	2	7	2021-08-01
55	2021-09-29 13:16:15.164885+05:30	2021-09-29 13:16:15.164885+05:30	2021-09-29	2	4	2021-08-01
56	2021-09-29 13:16:16.208125+05:30	2021-09-29 13:16:16.208125+05:30	2021-09-29	2	18	2021-08-01
57	2021-09-29 13:16:17.132485+05:30	2021-09-29 13:16:17.133484+05:30	2021-09-29	2	3	2021-08-01
58	2021-09-29 13:16:18.275513+05:30	2021-09-29 13:16:18.275513+05:30	2021-09-29	2	6	2021-08-01
59	2021-09-29 13:16:19.532787+05:30	2021-09-29 13:16:19.532787+05:30	2021-09-29	2	12	2021-08-01
60	2021-09-29 13:16:31.513987+05:30	2021-09-29 13:16:31.513987+05:30	2021-09-29	2	17	2021-09-01
61	2021-09-29 13:16:32.739666+05:30	2021-09-29 13:16:32.739666+05:30	2021-09-29	2	9	2021-09-01
62	2021-09-29 13:16:33.441106+05:30	2021-09-29 13:16:33.441106+05:30	2021-09-29	2	19	2021-09-01
63	2021-09-29 13:16:34.316246+05:30	2021-09-29 13:16:34.316246+05:30	2021-09-29	2	13	2021-09-01
64	2021-09-29 13:16:35.015056+05:30	2021-09-29 13:16:35.015056+05:30	2021-09-29	2	14	2021-09-01
65	2021-09-29 13:16:35.987626+05:30	2021-09-29 13:16:35.987626+05:30	2021-09-29	2	16	2021-09-01
66	2021-09-29 13:16:36.867102+05:30	2021-09-29 13:16:36.867102+05:30	2021-09-29	2	22	2021-09-01
67	2021-09-29 13:16:37.782726+05:30	2021-09-29 13:16:37.782726+05:30	2021-09-29	2	8	2021-09-01
68	2021-09-29 13:16:38.745465+05:30	2021-09-29 13:16:38.745465+05:30	2021-09-29	2	2	2021-09-01
69	2021-09-29 13:16:39.48304+05:30	2021-09-29 13:16:39.48304+05:30	2021-09-29	2	20	2021-09-01
71	2021-09-29 13:16:41.181013+05:30	2021-09-29 13:16:41.181013+05:30	2021-09-29	2	10	2021-09-01
72	2021-09-29 13:16:43.087155+05:30	2021-09-29 13:16:43.087155+05:30	2021-09-29	2	15	2021-09-01
73	2021-09-29 13:16:44.416746+05:30	2021-09-29 13:16:44.416746+05:30	2021-09-29	2	7	2021-09-01
74	2021-09-29 13:16:45.16274+05:30	2021-09-29 13:16:45.16274+05:30	2021-09-29	2	4	2021-09-01
75	2021-09-29 13:16:45.955695+05:30	2021-09-29 13:16:45.955695+05:30	2021-09-29	2	18	2021-09-01
76	2021-09-29 13:16:47.143373+05:30	2021-09-29 13:16:47.143373+05:30	2021-09-29	2	3	2021-09-01
77	2021-09-29 13:16:48.806371+05:30	2021-09-29 13:16:48.806371+05:30	2021-09-29	2	6	2021-09-01
78	2021-09-29 13:16:49.630373+05:30	2021-09-29 13:16:49.630373+05:30	2021-09-29	2	12	2021-09-01
79	2021-10-01 07:59:54.041205+05:30	2021-10-01 07:59:54.041205+05:30	2021-10-01	2	12	2021-10-01
80	2021-10-01 09:38:45.880995+05:30	2021-10-01 09:38:45.880995+05:30	2021-10-01	2	22	2021-10-01
81	2021-10-01 09:39:15.851374+05:30	2021-10-01 09:39:15.851374+05:30	2021-10-01	2	20	2021-10-01
82	2021-10-01 17:51:55.371995+05:30	2021-10-01 17:51:55.371995+05:30	2021-10-01	2	16	2021-10-01
83	2021-10-03 07:39:35.554178+05:30	2021-10-03 07:39:35.554178+05:30	2021-10-03	2	15	2021-10-01
84	2021-10-03 07:39:51.896425+05:30	2021-10-03 07:39:51.896425+05:30	2021-10-03	2	10	2021-10-01
85	2021-10-04 18:00:34.739577+05:30	2021-10-04 18:00:34.739577+05:30	2021-10-04	2	17	2021-10-01
86	2021-10-04 18:03:31.747771+05:30	2021-10-04 18:03:31.747771+05:30	2021-10-04	2	9	2021-10-01
87	2021-10-04 18:03:34.584488+05:30	2021-10-04 18:03:34.584488+05:30	2021-10-04	2	2	2021-10-01
88	2021-10-04 18:03:34.79831+05:30	2021-10-04 18:03:34.79831+05:30	2021-10-04	2	4	2021-10-01
89	2021-10-04 18:03:35.974206+05:30	2021-10-04 18:03:35.974206+05:30	2021-10-04	2	3	2021-10-01
91	2021-10-05 09:19:06.566082+05:30	2021-10-05 09:19:06.566082+05:30	2021-10-05	2	19	2021-10-01
92	2021-10-05 17:09:55.147464+05:30	2021-10-05 17:09:55.147464+05:30	2021-10-05	2	18	2021-10-01
93	2021-10-05 17:17:20.290256+05:30	2021-10-05 17:17:20.290256+05:30	2021-10-05	2	7	2021-10-01
94	2021-10-05 17:32:53.174855+05:30	2021-10-05 17:32:53.174855+05:30	2021-10-05	2	8	2021-10-01
107	2021-10-29 13:57:21.996681+05:30	2021-10-29 13:57:21.996681+05:30	2021-10-29	2	14	2021-11-01
108	2021-10-31 13:49:58.896776+05:30	2021-10-31 13:49:58.896776+05:30	2021-10-31	2	3	2021-11-01
98	2021-10-11 19:03:02.260565+05:30	2021-10-11 19:03:02.260565+05:30	2021-10-11	2	13	2021-10-01
99	2021-10-16 20:50:41.563721+05:30	2021-10-16 20:50:41.563721+05:30	2021-10-16	2	6	2021-10-01
100	2021-10-29 12:22:27.443914+05:30	2021-10-29 12:22:27.443914+05:30	2021-10-29	2	12	2021-11-01
101	2021-10-29 12:22:48.215258+05:30	2021-10-29 12:22:48.215258+05:30	2021-10-29	2	14	2021-10-01
102	2021-10-29 13:53:54.244416+05:30	2021-10-29 13:53:54.244416+05:30	2021-10-29	2	28	2021-07-01
103	2021-10-29 13:53:57.929958+05:30	2021-10-29 13:53:57.929958+05:30	2021-10-29	2	28	2021-08-01
104	2021-10-29 13:54:01.646991+05:30	2021-10-29 13:54:01.646991+05:30	2021-10-29	2	28	2021-09-01
105	2021-10-29 13:55:02.060255+05:30	2021-10-29 13:55:02.060255+05:30	2021-10-29	2	28	2021-10-01
106	2021-10-29 13:55:10.004616+05:30	2021-10-29 13:55:10.004616+05:30	2021-10-29	2	28	2021-11-01
109	2021-10-31 13:50:01.73378+05:30	2021-10-31 13:50:01.73378+05:30	2021-10-31	2	2	2021-11-01
110	2021-11-01 11:07:32.623661+05:30	2021-11-01 11:07:32.624662+05:30	2021-11-01	2	16	2021-11-01
111	2021-11-01 11:10:17.528427+05:30	2021-11-01 11:10:17.528427+05:30	2021-11-01	2	20	2021-11-01
112	2021-11-01 11:20:13.824684+05:30	2021-11-01 11:20:13.824684+05:30	2021-11-01	3	3	2021-11-01
113	2021-11-01 11:20:15.221186+05:30	2021-11-01 11:20:15.221186+05:30	2021-11-01	3	4	2021-11-01
114	2021-11-01 11:37:25.582417+05:30	2021-11-01 11:37:25.582417+05:30	2021-11-01	2	10	2021-11-01
115	2021-11-01 11:37:29.988692+05:30	2021-11-01 11:37:29.988692+05:30	2021-11-01	2	18	2021-11-01
116	2021-11-01 11:41:11.947599+05:30	2021-11-01 11:41:11.953012+05:30	2021-11-01	2	22	2021-11-01
117	2021-11-01 11:52:15.486343+05:30	2021-11-01 11:52:15.486343+05:30	2021-11-01	2	15	2021-11-01
118	2021-11-08 22:47:35.036453+05:30	2021-11-08 22:47:35.036453+05:30	2021-11-08	2	17	2021-11-01
119	2021-11-08 22:47:37.2493+05:30	2021-11-08 22:47:37.2493+05:30	2021-11-08	2	9	2021-11-01
120	2021-11-08 22:47:37.96541+05:30	2021-11-08 22:47:37.96541+05:30	2021-11-08	2	19	2021-11-01
121	2021-11-08 22:47:39.859953+05:30	2021-11-08 22:47:39.859953+05:30	2021-11-08	2	8	2021-11-01
122	2021-11-08 22:47:43.058643+05:30	2021-11-08 22:47:43.058643+05:30	2021-11-08	2	7	2021-11-01
123	2021-11-08 22:47:43.499625+05:30	2021-11-08 22:47:43.499625+05:30	2021-11-08	2	4	2021-11-01
124	2021-11-08 22:47:44.297843+05:30	2021-11-08 22:47:44.297843+05:30	2021-11-08	2	6	2021-11-01
125	2021-11-08 22:49:56.46986+05:30	2021-11-08 22:49:56.46986+05:30	2021-11-08	3	30	2021-11-01
126	2021-11-08 22:50:02.448901+05:30	2021-11-08 22:50:02.448901+05:30	2021-11-08	3	19	2021-11-01
127	2021-11-08 22:50:05.320569+05:30	2021-11-08 22:50:05.320569+05:30	2021-11-08	3	24	2021-11-01
128	2021-11-08 22:50:05.695238+05:30	2021-11-08 22:50:05.695238+05:30	2021-11-08	3	8	2021-11-01
129	2021-11-08 22:50:06.558151+05:30	2021-11-08 22:50:06.558151+05:30	2021-11-08	3	7	2021-11-01
130	2021-11-08 22:50:09.545617+05:30	2021-11-08 22:50:09.545617+05:30	2021-11-08	3	12	2021-11-01
131	2021-11-10 14:07:55.962292+05:30	2021-11-10 14:07:55.962292+05:30	2021-11-10	3	26	2021-11-01
132	2021-11-10 14:07:58.499712+05:30	2021-11-10 14:07:58.499712+05:30	2021-11-10	3	27	2021-11-01
133	2021-11-12 12:25:53.168614+05:30	2021-11-12 12:25:53.168614+05:30	2021-11-12	2	31	2021-07-01
134	2021-11-12 12:25:56.330425+05:30	2021-11-12 12:25:56.330425+05:30	2021-11-12	2	31	2021-08-01
135	2021-11-12 12:25:59.572045+05:30	2021-11-12 12:25:59.572045+05:30	2021-11-12	2	31	2021-09-01
136	2021-11-12 12:26:05.461385+05:30	2021-11-12 12:26:05.461385+05:30	2021-11-12	2	31	2021-10-01
137	2021-11-12 12:26:12.73024+05:30	2021-11-12 12:26:12.73024+05:30	2021-11-12	2	31	2021-11-01
138	2021-11-12 21:46:42.873096+05:30	2021-11-12 21:46:42.873096+05:30	2021-11-12	2	13	2021-11-01
\.


--
-- Data for Name: fact_chit_settlement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_chit_settlement (id, created, modified, month, paid, paid_date, chit_id, customer_id, amount, betting) FROM stdin;
13	2021-10-06 11:13:50.515288+05:30	2021-10-06 11:13:50.515288+05:30	2021-08-01	t	2021-08-05	2	8	0	\N
14	2021-10-06 11:13:56.413142+05:30	2021-10-06 11:13:56.413142+05:30	2021-09-01	t	2021-09-05	2	13	0	\N
17	2021-10-06 12:25:43.749216+05:30	2021-10-06 12:25:43.749216+05:30	2021-07-01	t	2021-10-06	2	3	0	\N
9	2021-10-06 11:03:42.800245+05:30	2021-10-06 16:45:52.766417+05:30	2021-10-01	t	2021-10-06	2	18	146000	\N
16	2021-10-06 11:14:03.101424+05:30	2021-11-08 22:48:56.687254+05:30	2021-11-01	t	2021-11-08	2	14	146000	\N
\.


--
-- Data for Name: fact_credit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_credit (id, created, modified, amount, name, paid_amount, paid_date, source_id, expected_date) FROM stdin;
4	2021-10-23 08:57:49.314042+05:30	2021-11-13 13:14:15.695643+05:30	31900.00	Pending Chit Amount	31900.00	2021-10-29	15	2021-10-31
1	2021-10-23 08:54:53.355308+05:30	2021-11-13 13:14:15.774892+05:30	5000.00	Pending Chit Amount	5000.00	2021-10-29	12	2021-11-05
2	2021-10-23 08:56:04.977885+05:30	2021-10-23 12:03:25.549336+05:30	15000.00	Credit	0.00	\N	14	2021-10-25
\.


--
-- Data for Name: fact_finance_utilized; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_finance_utilized (id, created, modified, amount, paid_amount, paid_date, status, finance_id, source_id, payment_type) FROM stdin;
2	2021-10-26 20:55:49+05:30	2021-10-26 20:55:49+05:30	941000.00	\N	2021-04-01	t	1	16	repayment
4	2021-10-26 20:56:27+05:30	2021-10-26 20:56:28+05:30	512000.00	\N	2021-04-01	t	1	7	repayment
8	2021-10-27 13:34:24.223709+05:30	2021-10-27 13:34:24.224712+05:30	412000.00	100000.00	2021-04-05	t	1	7	repayment
9	2021-10-27 13:38:03.447879+05:30	2021-10-27 13:38:03.447879+05:30	933000.00	8000.00	2021-05-20	t	1	16	repayment
11	2021-10-27 13:42:16.377811+05:30	2021-10-27 13:42:16.377811+05:30	853000.00	80000.00	2021-05-31	t	1	16	repayment
12	2021-10-27 13:42:55.011554+05:30	2021-10-27 13:42:55.011554+05:30	318000.00	94000.00	2021-06-05	t	1	7	repayment
13	2021-10-27 13:43:19.58991+05:30	2021-10-27 13:43:19.58991+05:30	803000.00	50000.00	2021-07-02	t	1	16	repayment
14	2021-10-27 13:43:48.25788+05:30	2021-10-27 13:43:48.25788+05:30	258000.00	60000.00	2021-07-22	t	1	7	repayment
19	2021-10-27 13:56:18+05:30	2021-10-27 13:56:19+05:30	350000.00	\N	2021-07-15	t	1	8	withdraw
16	2021-10-27 13:55:55.190049+05:30	2021-10-27 13:55:55.190049+05:30	818000.00	15000.00	2021-07-22	t	1	16	withdraw
30	2021-10-27 15:18:53.390625+05:30	2021-10-27 15:18:53.390625+05:30	845000.00	27000.00	2021-07-28	t	1	16	withdraw
31	2021-10-27 15:19:28.739978+05:30	2021-10-27 15:19:28.739978+05:30	227200.00	30800.00	2021-08-04	t	1	7	repayment
32	2021-10-27 15:19:53.421857+05:30	2021-10-27 15:19:53.421857+05:30	860000.00	15000.00	2021-08-30	t	1	16	withdraw
33	2021-10-27 15:20:18.591698+05:30	2021-10-27 15:20:18.591698+05:30	166300.00	60900.00	2021-08-30	t	1	7	repayment
34	2021-11-08 22:48:31.731277+05:30	2021-11-08 22:48:31.731277+05:30	135000.00	31300.00	2021-11-08	t	1	7	repayment
35	2021-11-12 16:53:36+05:30	2021-11-12 16:53:38+05:30	100000.00	\N	2021-11-12	t	1	9	withdraw
\.


--
-- Data for Name: fact_monthly_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_monthly_payment (id, created, modified, paid_date, expense_id, amount, paid_amount, income_id, month, credit_id) FROM stdin;
4345	2021-10-31 11:08:03.496605+05:30	2021-10-31 11:08:03.496605+05:30	2021-10-16	\N	105500.00	105500.00	8	2021-10-01	\N
4346	2021-10-31 11:08:03.606301+05:30	2021-10-31 11:08:03.606301+05:30	2021-10-16	\N	30000.00	30000.00	10	2021-10-01	\N
4347	2021-10-31 11:08:03.610301+05:30	2021-10-31 11:08:03.610301+05:30	2021-10-31	\N	4000.00	4000.00	9	2021-10-01	\N
4348	2021-10-31 11:08:03.614326+05:30	2021-10-31 11:08:03.614326+05:30	2021-10-16	\N	2050.00	2050.00	15	2021-10-01	\N
4349	2021-10-31 11:08:03.618058+05:30	2021-10-31 11:08:03.618058+05:30	2021-10-16	\N	2000.00	2000.00	11	2021-10-01	\N
4350	2021-10-31 11:08:03.621475+05:30	2021-10-31 11:08:03.621475+05:30	2021-10-16	\N	1500.00	1500.00	13	2021-10-01	\N
4351	2021-10-31 11:08:03.626988+05:30	2021-10-31 11:08:03.626988+05:30	2021-10-16	\N	3700.00	3700.00	14	2021-10-01	\N
4352	2021-10-31 11:08:03.630386+05:30	2021-10-31 11:08:03.630386+05:30	2021-10-16	\N	1500.00	1500.00	12	2021-10-01	\N
4353	2021-10-31 11:08:03.633288+05:30	2021-10-31 11:08:03.633288+05:30	2021-10-16	\N	15000.00	15000.00	16	2021-10-01	\N
4354	2021-10-31 11:08:03.637482+05:30	2021-10-31 11:08:03.637482+05:30	2021-10-16	1	15500.00	15500.00	\N	2021-10-01	\N
4355	2021-10-31 11:08:03.652618+05:30	2021-10-31 11:08:03.652618+05:30	2021-10-16	3	13000.00	13000.00	\N	2021-10-01	\N
4356	2021-10-31 11:08:03.656961+05:30	2021-10-31 11:08:03.656961+05:30	2021-10-16	2	8000.00	8000.00	\N	2021-10-01	\N
4357	2021-10-31 11:08:03.66017+05:30	2021-10-31 11:08:03.66017+05:30	2021-10-16	10	10000.00	10000.00	\N	2021-10-01	\N
4358	2021-10-31 11:08:03.664466+05:30	2021-10-31 11:08:03.664466+05:30	2021-10-16	8	11350.00	11350.00	\N	2021-10-01	\N
4359	2021-10-31 11:08:03.667684+05:30	2021-10-31 11:08:03.667684+05:30	2021-10-16	4	6000.00	6000.00	\N	2021-10-01	\N
4360	2021-10-31 11:08:03.672974+05:30	2021-10-31 11:08:03.672974+05:30	2021-10-16	5	1000.00	1000.00	\N	2021-10-01	\N
4361	2021-10-31 11:08:03.676756+05:30	2021-10-31 11:08:03.676756+05:30	2021-10-16	6	1600.00	1600.00	\N	2021-10-01	\N
4362	2021-10-31 11:08:03.680331+05:30	2021-10-31 11:08:03.680331+05:30	2021-10-16	7	11000.00	11000.00	\N	2021-10-01	\N
4363	2021-10-31 11:08:03.684067+05:30	2021-10-31 11:08:03.684067+05:30	2021-10-16	11	4500.00	4500.00	\N	2021-10-01	\N
4364	2021-10-31 11:08:03.687393+05:30	2021-10-31 11:08:03.687393+05:30	2021-10-16	9	64900.00	64900.00	\N	2021-10-01	\N
4365	2021-10-31 11:08:03.691722+05:30	2021-10-31 11:08:03.691722+05:30	2021-10-16	13	3000.00	3000.00	\N	2021-10-01	\N
4366	2021-10-31 11:08:03.695355+05:30	2021-10-31 11:08:03.695355+05:30	2021-10-16	12	3000.00	3000.00	\N	2021-10-01	\N
5060	2021-11-09 12:37:05.226583+05:30	2021-11-09 12:37:05.226583+05:30	\N	6	1600.00	0.00	\N	2022-01-01	\N
5064	2021-11-09 12:37:05.300791+05:30	2021-11-09 12:37:05.300791+05:30	\N	\N	1603.12	\N	19	2022-01-01	\N
5042	2021-11-09 12:37:05.069772+05:30	2021-11-09 12:37:05.069772+05:30	\N	\N	105500.00	0.00	8	2022-01-01	\N
5043	2021-11-09 12:37:05.091841+05:30	2021-11-09 12:37:05.091841+05:30	\N	\N	35000.00	0.00	10	2022-01-01	\N
5044	2021-11-09 12:37:05.101393+05:30	2021-11-09 12:37:05.101393+05:30	\N	\N	4000.00	0.00	9	2022-01-01	\N
5045	2021-11-09 12:37:05.106831+05:30	2021-11-09 12:37:05.106831+05:30	\N	\N	2050.00	0.00	15	2022-01-01	\N
5046	2021-11-09 12:37:05.112977+05:30	2021-11-09 12:37:05.112977+05:30	\N	\N	2000.00	0.00	11	2022-01-01	\N
5047	2021-11-09 12:37:05.118845+05:30	2021-11-09 12:37:05.118845+05:30	\N	\N	1100.00	0.00	20	2022-01-01	\N
5048	2021-11-09 12:37:05.123772+05:30	2021-11-09 12:37:05.123772+05:30	\N	\N	1500.00	0.00	13	2022-01-01	\N
5049	2021-11-09 12:37:05.147516+05:30	2021-11-09 12:37:05.147516+05:30	\N	\N	3400.00	0.00	17	2022-01-01	\N
5050	2021-11-09 12:37:05.153315+05:30	2021-11-09 12:37:05.153315+05:30	\N	\N	1500.00	0.00	12	2022-01-01	\N
5051	2021-11-09 12:37:05.157428+05:30	2021-11-09 12:37:05.157428+05:30	\N	\N	4156.25	0.00	18	2022-01-01	\N
5052	2021-11-09 12:37:05.157428+05:30	2021-11-09 12:37:05.157428+05:30	\N	1	15500.00	0.00	\N	2022-01-01	\N
5053	2021-11-09 12:37:05.179606+05:30	2021-11-09 12:37:05.179606+05:30	\N	3	13000.00	0.00	\N	2022-01-01	\N
5054	2021-11-09 12:37:05.186181+05:30	2021-11-09 12:37:05.186181+05:30	\N	2	8000.00	0.00	\N	2022-01-01	\N
5055	2021-11-09 12:37:05.193204+05:30	2021-11-09 12:37:05.193204+05:30	\N	10	16400.00	0.00	\N	2022-01-01	\N
5056	2021-11-09 12:37:05.197513+05:30	2021-11-09 12:37:05.198523+05:30	\N	8	9800.00	0.00	\N	2022-01-01	\N
5057	2021-11-09 12:37:05.2028+05:30	2021-11-09 12:37:05.2028+05:30	\N	15	5000.00	0.00	\N	2022-01-01	\N
5058	2021-11-09 12:37:05.207978+05:30	2021-11-09 12:37:05.207978+05:30	\N	4	6000.00	0.00	\N	2022-01-01	\N
5059	2021-11-09 12:37:05.213512+05:30	2021-11-09 12:37:05.213512+05:30	\N	5	1000.00	0.00	\N	2022-01-01	\N
5061	2021-11-09 12:37:05.231863+05:30	2021-11-09 12:37:05.231863+05:30	\N	7	11000.00	0.00	\N	2022-01-01	\N
5062	2021-11-09 12:37:05.238883+05:30	2021-11-09 12:37:05.238883+05:30	\N	9	5600.00	0.00	\N	2022-01-01	\N
5063	2021-11-09 12:37:05.243676+05:30	2021-11-09 12:37:05.243676+05:30	\N	14	2050.00	0.00	\N	2022-01-01	\N
5094	2021-11-12 13:57:18.090661+05:30	2021-11-12 13:57:18.090725+05:30	2021-10-29	\N	105500.00	105500.00	8	2021-11-01	\N
5095	2021-11-12 13:57:18.10964+05:30	2021-11-12 13:57:18.10964+05:30	2021-10-23	\N	29000.00	29000.00	10	2021-11-01	\N
5096	2021-11-12 13:57:18.111593+05:30	2021-11-12 13:57:18.111593+05:30	\N	\N	4000.00	0.00	9	2021-11-01	\N
5097	2021-11-12 13:57:18.116086+05:30	2021-11-12 13:57:18.116086+05:30	2021-11-08	\N	2000.00	2000.00	11	2021-11-01	\N
5098	2021-11-12 13:57:18.119952+05:30	2021-11-12 13:57:18.119952+05:30	2021-11-08	\N	2050.00	2050.00	15	2021-11-01	\N
5099	2021-11-12 13:57:18.122732+05:30	2021-11-12 13:57:18.122732+05:30	2021-11-08	\N	1500.00	1500.00	13	2021-11-01	\N
5100	2021-11-12 13:57:18.12896+05:30	2021-11-12 13:57:18.12896+05:30	2021-11-01	\N	3400.00	3400.00	17	2021-11-01	\N
5101	2021-11-12 13:57:18.132502+05:30	2021-11-12 13:57:18.132502+05:30	2021-11-08	\N	1500.00	1500.00	12	2021-11-01	\N
5102	2021-11-12 13:57:18.137242+05:30	2021-11-12 13:57:18.137242+05:30	2021-10-31	\N	11974.81	11974.81	19	2021-11-01	\N
5103	2021-11-12 13:57:18.140915+05:30	2021-11-12 13:57:18.140915+05:30	2021-11-08	\N	4156.25	4156.25	18	2021-11-01	\N
5104	2021-11-12 13:57:18.146679+05:30	2021-11-12 13:57:18.146679+05:30	2021-10-29	\N	31900.00	31900.00	\N	2021-11-01	4
5105	2021-11-12 13:57:18.161143+05:30	2021-11-12 13:57:18.161143+05:30	2021-10-29	\N	5000.00	5000.00	\N	2021-11-01	1
5106	2021-11-12 13:57:18.163668+05:30	2021-11-12 13:57:18.163668+05:30	2021-10-31	1	15500.00	15500.00	\N	2021-11-01	\N
5107	2021-11-12 13:57:18.17687+05:30	2021-11-12 13:57:18.17687+05:30	2021-10-31	3	13000.00	13000.00	\N	2021-11-01	\N
5108	2021-11-12 13:57:18.179721+05:30	2021-11-12 13:57:18.179721+05:30	2021-11-08	2	8000.00	8000.00	\N	2021-11-01	\N
5109	2021-11-12 13:57:18.183002+05:30	2021-11-12 13:57:18.183002+05:30	2021-11-08	10	16343.56	16343.56	\N	2021-11-01	\N
5110	2021-11-12 13:57:18.187495+05:30	2021-11-12 13:57:18.187495+05:30	2021-10-31	8	9200.00	9200.00	\N	2021-11-01	\N
5111	2021-11-12 13:57:18.191403+05:30	2021-11-12 13:57:18.191403+05:30	2021-10-31	15	5000.00	5000.00	\N	2021-11-01	\N
5112	2021-11-12 13:57:18.195123+05:30	2021-11-12 13:57:18.195123+05:30	2021-10-31	4	6000.00	4000.00	\N	2021-11-01	\N
5113	2021-11-12 13:57:18.198727+05:30	2021-11-12 13:57:18.198727+05:30	2021-10-31	5	1000.00	1000.00	\N	2021-11-01	\N
5114	2021-11-12 13:57:18.204771+05:30	2021-11-12 13:57:18.204771+05:30	2021-10-31	6	1600.00	1600.00	\N	2021-11-01	\N
5115	2021-11-12 13:57:18.208775+05:30	2021-11-12 13:57:18.208775+05:30	2021-11-08	7	11000.00	11000.00	\N	2021-11-01	\N
5116	2021-11-12 13:57:18.212668+05:30	2021-11-12 13:57:18.212668+05:30	2021-10-31	9	30900.00	30900.00	\N	2021-11-01	\N
5117	2021-11-12 13:57:18.216669+05:30	2021-11-12 13:57:18.216669+05:30	2021-10-29	19	31900.00	31900.00	\N	2021-11-01	\N
5118	2021-11-12 13:57:18.220667+05:30	2021-11-12 13:57:18.220667+05:30	2021-11-12	22	2000.00	2000.00	\N	2021-11-01	\N
5119	2021-11-12 13:57:18.223668+05:30	2021-11-12 13:57:18.223668+05:30	2021-10-31	14	2500.00	2500.00	\N	2021-11-01	\N
5120	2021-11-12 13:57:18.226671+05:30	2021-11-12 13:57:18.226671+05:30	2021-10-31	18	34000.00	34000.00	\N	2021-11-01	\N
5121	2021-11-12 13:57:18.230759+05:30	2021-11-12 13:57:18.230759+05:30	2021-10-31	20	3420.00	3420.00	\N	2021-11-01	\N
5122	2021-11-12 13:57:18.233667+05:30	2021-11-12 13:57:18.233667+05:30	2021-10-31	21	380.00	380.00	\N	2021-11-01	\N
5173	2021-11-12 17:08:10.196038+05:30	2021-11-12 17:08:10.196038+05:30	\N	23	24450.00	\N	\N	2021-12-01	\N
5148	2021-11-12 17:08:10.043481+05:30	2021-11-12 17:08:10.043481+05:30	\N	\N	105500.00	0.00	8	2021-12-01	\N
5149	2021-11-12 17:08:10.065825+05:30	2021-11-12 17:08:10.065825+05:30	\N	\N	35000.00	0.00	10	2021-12-01	\N
5150	2021-11-12 17:08:10.069837+05:30	2021-11-12 17:08:10.070879+05:30	\N	\N	4000.00	0.00	9	2021-12-01	\N
5151	2021-11-12 17:08:10.074896+05:30	2021-11-12 17:08:10.074896+05:30	\N	\N	2050.00	0.00	15	2021-12-01	\N
5152	2021-11-12 17:08:10.078838+05:30	2021-11-12 17:08:10.078838+05:30	\N	\N	2000.00	0.00	11	2021-12-01	\N
5153	2021-11-12 17:08:10.083839+05:30	2021-11-12 17:08:10.083839+05:30	\N	\N	1100.00	0.00	20	2021-12-01	\N
5154	2021-11-12 17:08:10.088839+05:30	2021-11-12 17:08:10.088839+05:30	\N	\N	1500.00	0.00	13	2021-12-01	\N
5155	2021-11-12 17:08:10.093841+05:30	2021-11-12 17:08:10.093932+05:30	\N	\N	1500.00	0.00	12	2021-12-01	\N
5156	2021-11-12 17:08:10.096943+05:30	2021-11-12 17:08:10.096943+05:30	\N	\N	3400.00	0.00	17	2021-12-01	\N
5157	2021-11-12 17:08:10.101087+05:30	2021-11-12 17:08:10.101087+05:30	\N	\N	1603.12	0.00	19	2021-12-01	\N
5158	2021-11-12 17:08:10.106248+05:30	2021-11-12 17:08:10.106248+05:30	\N	\N	4156.25	0.00	18	2021-12-01	\N
5159	2021-11-12 17:08:10.111324+05:30	2021-11-12 17:08:10.111324+05:30	\N	\N	1187.50	0.00	21	2021-12-01	\N
5160	2021-11-12 17:08:10.116265+05:30	2021-11-12 17:08:10.116265+05:30	\N	1	15500.00	0.00	\N	2021-12-01	\N
5161	2021-11-12 17:08:10.133366+05:30	2021-11-12 17:08:10.133366+05:30	\N	3	13000.00	0.00	\N	2021-12-01	\N
5162	2021-11-12 17:08:10.13864+05:30	2021-11-12 17:08:10.13864+05:30	\N	2	8000.00	0.00	\N	2021-12-01	\N
5163	2021-11-12 17:08:10.14464+05:30	2021-11-12 17:08:10.14464+05:30	\N	10	16343.56	0.00	\N	2021-12-01	\N
5164	2021-11-12 17:08:10.1487+05:30	2021-11-12 17:08:10.1487+05:30	\N	8	9500.00	0.00	\N	2021-12-01	\N
5165	2021-11-12 17:08:10.151804+05:30	2021-11-12 17:08:10.151804+05:30	\N	15	5000.00	0.00	\N	2021-12-01	\N
5166	2021-11-12 17:08:10.158166+05:30	2021-11-12 17:08:10.158166+05:30	\N	4	6000.00	0.00	\N	2021-12-01	\N
5167	2021-11-12 17:08:10.163232+05:30	2021-11-12 17:08:10.163232+05:30	\N	5	1000.00	0.00	\N	2021-12-01	\N
5168	2021-11-12 17:08:10.167166+05:30	2021-11-12 17:08:10.167166+05:30	\N	6	1600.00	0.00	\N	2021-12-01	\N
5169	2021-11-12 17:08:10.173167+05:30	2021-11-12 17:08:10.173167+05:30	\N	7	11000.00	0.00	\N	2021-12-01	\N
5170	2021-11-12 17:08:10.177986+05:30	2021-11-12 17:08:10.177986+05:30	\N	14	2050.00	0.00	\N	2021-12-01	\N
5171	2021-11-12 17:08:10.181543+05:30	2021-11-12 17:08:10.181543+05:30	\N	17	3200.00	0.00	\N	2021-12-01	\N
5172	2021-11-12 17:08:10.184969+05:30	2021-11-12 17:08:10.184969+05:30	\N	9	5600.00	0.00	\N	2021-12-01	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 92, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: dim_car_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_car_detail_id_seq', 1, true);


--
-- Name: dim_chit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_chit_id_seq', 3, true);


--
-- Name: dim_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_customers_id_seq', 31, true);


--
-- Name: dim_expences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_expences_id_seq', 23, true);


--
-- Name: dim_finance_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_finance_source_id_seq', 46, true);


--
-- Name: dim_flexi_loan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_flexi_loan_id_seq', 2, true);


--
-- Name: dim_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_income_id_seq', 21, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 91, true);


--
-- Name: fact_car_odometer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_car_odometer_id_seq', 134, true);


--
-- Name: fact_chit_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_chit_customers_id_seq', 37, true);


--
-- Name: fact_chit_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_chit_payment_id_seq', 138, true);


--
-- Name: fact_chit_settlement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_chit_settlement_id_seq', 18, true);


--
-- Name: fact_credit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_credit_id_seq', 4, true);


--
-- Name: fact_flexi_utilized_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_flexi_utilized_id_seq', 51, true);


--
-- Name: fact_monthly_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_monthly_payment_id_seq', 5173, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: dim_car_detail dim_car_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_car_detail
    ADD CONSTRAINT dim_car_detail_pkey PRIMARY KEY (id);


--
-- Name: dim_chit dim_chit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_chit
    ADD CONSTRAINT dim_chit_pkey PRIMARY KEY (id);


--
-- Name: dim_customers dim_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_customers
    ADD CONSTRAINT dim_customers_pkey PRIMARY KEY (id);


--
-- Name: dim_expences dim_expences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_expences
    ADD CONSTRAINT dim_expences_pkey PRIMARY KEY (id);


--
-- Name: dim_finance_source dim_finance_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_finance_source
    ADD CONSTRAINT dim_finance_source_pkey PRIMARY KEY (id);


--
-- Name: dim_finance_loan dim_flexi_loan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_finance_loan
    ADD CONSTRAINT dim_flexi_loan_pkey PRIMARY KEY (id);


--
-- Name: dim_income dim_income_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_income
    ADD CONSTRAINT dim_income_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: fact_car_odometer fact_car_odometer_date_car_id_9b3b689f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_car_odometer
    ADD CONSTRAINT fact_car_odometer_date_car_id_9b3b689f_uniq UNIQUE (date, car_id);


--
-- Name: fact_car_odometer fact_car_odometer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_car_odometer
    ADD CONSTRAINT fact_car_odometer_pkey PRIMARY KEY (id);


--
-- Name: fact_chit_customers fact_chit_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_customers
    ADD CONSTRAINT fact_chit_customers_pkey PRIMARY KEY (id);


--
-- Name: fact_chit_payment fact_chit_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_payment
    ADD CONSTRAINT fact_chit_payment_pkey PRIMARY KEY (id);


--
-- Name: fact_chit_settlement fact_chit_settlement_chit_id_month_382ca694_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_settlement
    ADD CONSTRAINT fact_chit_settlement_chit_id_month_382ca694_uniq UNIQUE (chit_id, month);


--
-- Name: fact_chit_settlement fact_chit_settlement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_settlement
    ADD CONSTRAINT fact_chit_settlement_pkey PRIMARY KEY (id);


--
-- Name: fact_credit fact_credit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_credit
    ADD CONSTRAINT fact_credit_pkey PRIMARY KEY (id);


--
-- Name: fact_finance_utilized fact_flexi_utilized_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_finance_utilized
    ADD CONSTRAINT fact_flexi_utilized_pkey PRIMARY KEY (id);


--
-- Name: fact_monthly_payment fact_monthly_payment_month_income_id_expense_id_4c0dbf63_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_monthly_payment
    ADD CONSTRAINT fact_monthly_payment_month_income_id_expense_id_4c0dbf63_uniq UNIQUE (month, income_id, expense_id);


--
-- Name: fact_monthly_payment fact_monthly_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_monthly_payment
    ADD CONSTRAINT fact_monthly_payment_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: dim_expences_chit_id_425e512a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dim_expences_chit_id_425e512a ON public.dim_expences USING btree (chit_id);


--
-- Name: dim_expences_finance_id_d598c6cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dim_expences_finance_id_d598c6cc ON public.dim_expences USING btree (finance_id);


--
-- Name: dim_income_finance_id_6ca112b3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dim_income_finance_id_6ca112b3 ON public.dim_income USING btree (finance_id);


--
-- Name: dim_income_source_id_c4e58565; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dim_income_source_id_c4e58565 ON public.dim_income USING btree (source_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: fact_car_odometer_car_id_b57742a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_car_odometer_car_id_b57742a9 ON public.fact_car_odometer USING btree (car_id);


--
-- Name: fact_chit_customers_chit_id_01e45ccb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_chit_customers_chit_id_01e45ccb ON public.fact_chit_customers USING btree (chit_id);


--
-- Name: fact_chit_customers_customer_id_92f5a3d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_chit_customers_customer_id_92f5a3d6 ON public.fact_chit_customers USING btree (customer_id);


--
-- Name: fact_chit_payment_chit_id_5a582d82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_chit_payment_chit_id_5a582d82 ON public.fact_chit_payment USING btree (chit_id);


--
-- Name: fact_chit_payment_customer_id_09aec391; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_chit_payment_customer_id_09aec391 ON public.fact_chit_payment USING btree (customer_id);


--
-- Name: fact_chit_settlement_chit_id_53938882; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_chit_settlement_chit_id_53938882 ON public.fact_chit_settlement USING btree (chit_id);


--
-- Name: fact_chit_settlement_customer_id_dc9d3d46; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_chit_settlement_customer_id_dc9d3d46 ON public.fact_chit_settlement USING btree (customer_id);


--
-- Name: fact_credit_source_id_9e104bee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_credit_source_id_9e104bee ON public.fact_credit USING btree (source_id);


--
-- Name: fact_flexi_utilized_flexi_id_104286cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_flexi_utilized_flexi_id_104286cc ON public.fact_finance_utilized USING btree (finance_id);


--
-- Name: fact_flexi_utilized_source_id_7a6c87d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_flexi_utilized_source_id_7a6c87d7 ON public.fact_finance_utilized USING btree (source_id);


--
-- Name: fact_monthly_payment_credit_id_784b6a92; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_monthly_payment_credit_id_784b6a92 ON public.fact_monthly_payment USING btree (credit_id);


--
-- Name: fact_monthly_payment_expense_id_663897b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_monthly_payment_expense_id_663897b8 ON public.fact_monthly_payment USING btree (expense_id);


--
-- Name: fact_monthly_payment_income_id_ee55618b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fact_monthly_payment_income_id_ee55618b ON public.fact_monthly_payment USING btree (income_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dim_expences dim_expences_chit_id_425e512a_fk_dim_chit_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_expences
    ADD CONSTRAINT dim_expences_chit_id_425e512a_fk_dim_chit_id FOREIGN KEY (chit_id) REFERENCES public.dim_chit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dim_expences dim_expences_finance_id_d598c6cc_fk_dim_finance_loan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_expences
    ADD CONSTRAINT dim_expences_finance_id_d598c6cc_fk_dim_finance_loan_id FOREIGN KEY (finance_id) REFERENCES public.dim_finance_loan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dim_income dim_income_finance_id_6ca112b3_fk_dim_finance_loan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_income
    ADD CONSTRAINT dim_income_finance_id_6ca112b3_fk_dim_finance_loan_id FOREIGN KEY (finance_id) REFERENCES public.dim_finance_loan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dim_income dim_income_source_id_c4e58565_fk_dim_finance_source_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_income
    ADD CONSTRAINT dim_income_source_id_c4e58565_fk_dim_finance_source_id FOREIGN KEY (source_id) REFERENCES public.dim_finance_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_car_odometer fact_car_odometer_car_id_b57742a9_fk_dim_car_detail_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_car_odometer
    ADD CONSTRAINT fact_car_odometer_car_id_b57742a9_fk_dim_car_detail_id FOREIGN KEY (car_id) REFERENCES public.dim_car_detail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_customers fact_chit_customers_chit_id_01e45ccb_fk_dim_chit_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_customers
    ADD CONSTRAINT fact_chit_customers_chit_id_01e45ccb_fk_dim_chit_id FOREIGN KEY (chit_id) REFERENCES public.dim_chit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_customers fact_chit_customers_customer_id_92f5a3d6_fk_dim_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_customers
    ADD CONSTRAINT fact_chit_customers_customer_id_92f5a3d6_fk_dim_customers_id FOREIGN KEY (customer_id) REFERENCES public.dim_customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_payment fact_chit_payment_chit_id_5a582d82_fk_dim_chit_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_payment
    ADD CONSTRAINT fact_chit_payment_chit_id_5a582d82_fk_dim_chit_id FOREIGN KEY (chit_id) REFERENCES public.dim_chit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_payment fact_chit_payment_customer_id_09aec391_fk_dim_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_payment
    ADD CONSTRAINT fact_chit_payment_customer_id_09aec391_fk_dim_customers_id FOREIGN KEY (customer_id) REFERENCES public.dim_customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_settlement fact_chit_settlement_chit_id_53938882_fk_dim_chit_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_settlement
    ADD CONSTRAINT fact_chit_settlement_chit_id_53938882_fk_dim_chit_id FOREIGN KEY (chit_id) REFERENCES public.dim_chit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_settlement fact_chit_settlement_customer_id_dc9d3d46_fk_dim_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_chit_settlement
    ADD CONSTRAINT fact_chit_settlement_customer_id_dc9d3d46_fk_dim_customers_id FOREIGN KEY (customer_id) REFERENCES public.dim_customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_credit fact_credit_source_id_9e104bee_fk_dim_finance_source_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_credit
    ADD CONSTRAINT fact_credit_source_id_9e104bee_fk_dim_finance_source_id FOREIGN KEY (source_id) REFERENCES public.dim_finance_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_finance_utilized fact_flexi_utilized_finance_id_5b00f313_fk_dim_flexi_loan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_finance_utilized
    ADD CONSTRAINT fact_flexi_utilized_finance_id_5b00f313_fk_dim_flexi_loan_id FOREIGN KEY (finance_id) REFERENCES public.dim_finance_loan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_finance_utilized fact_flexi_utilized_source_id_7a6c87d7_fk_dim_finance_source_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_finance_utilized
    ADD CONSTRAINT fact_flexi_utilized_source_id_7a6c87d7_fk_dim_finance_source_id FOREIGN KEY (source_id) REFERENCES public.dim_finance_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_monthly_payment fact_monthly_payment_credit_id_784b6a92_fk_fact_credit_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_monthly_payment
    ADD CONSTRAINT fact_monthly_payment_credit_id_784b6a92_fk_fact_credit_id FOREIGN KEY (credit_id) REFERENCES public.fact_credit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_monthly_payment fact_monthly_payment_expense_id_663897b8_fk_dim_expences_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_monthly_payment
    ADD CONSTRAINT fact_monthly_payment_expense_id_663897b8_fk_dim_expences_id FOREIGN KEY (expense_id) REFERENCES public.dim_expences(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_monthly_payment fact_monthly_payment_income_id_ee55618b_fk_dim_income_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_monthly_payment
    ADD CONSTRAINT fact_monthly_payment_income_id_ee55618b_fk_dim_income_id FOREIGN KEY (income_id) REFERENCES public.dim_income(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

