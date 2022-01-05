--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO pms;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO pms;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO pms;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO pms;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO pms;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO pms;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.auth_user OWNER TO pms;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO pms;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO pms;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO pms;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO pms;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO pms;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: dim_car_detail; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.dim_car_detail OWNER TO pms;

--
-- Name: dim_car_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.dim_car_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_car_detail_id_seq OWNER TO pms;

--
-- Name: dim_car_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.dim_car_detail_id_seq OWNED BY public.dim_car_detail.id;


--
-- Name: dim_card; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.dim_card (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    bank character varying(100) NOT NULL
);


ALTER TABLE public.dim_card OWNER TO pms;

--
-- Name: dim_chit; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.dim_chit OWNER TO pms;

--
-- Name: dim_chit_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.dim_chit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_chit_id_seq OWNER TO pms;

--
-- Name: dim_chit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.dim_chit_id_seq OWNED BY public.dim_chit.id;


--
-- Name: dim_customers; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.dim_customers (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    phone_number character varying(10),
    self boolean NOT NULL
);


ALTER TABLE public.dim_customers OWNER TO pms;

--
-- Name: dim_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.dim_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_customers_id_seq OWNER TO pms;

--
-- Name: dim_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.dim_customers_id_seq OWNED BY public.dim_customers.id;


--
-- Name: dim_expences; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.dim_expences OWNER TO pms;

--
-- Name: dim_expences_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.dim_expences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_expences_id_seq OWNER TO pms;

--
-- Name: dim_expences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.dim_expences_id_seq OWNED BY public.dim_expences.id;


--
-- Name: dim_finance_loan; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.dim_finance_loan OWNER TO pms;

--
-- Name: dim_finance_source; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.dim_finance_source (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.dim_finance_source OWNER TO pms;

--
-- Name: dim_finance_source_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.dim_finance_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_finance_source_id_seq OWNER TO pms;

--
-- Name: dim_finance_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.dim_finance_source_id_seq OWNED BY public.dim_finance_source.id;


--
-- Name: dim_flexi_loan_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.dim_flexi_loan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_flexi_loan_id_seq OWNER TO pms;

--
-- Name: dim_flexi_loan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.dim_flexi_loan_id_seq OWNED BY public.dim_finance_loan.id;


--
-- Name: dim_income; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.dim_income OWNER TO pms;

--
-- Name: dim_income_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.dim_income_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_income_id_seq OWNER TO pms;

--
-- Name: dim_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.dim_income_id_seq OWNED BY public.dim_income.id;


--
-- Name: dim_password; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.dim_password (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(250) NOT NULL,
    url character varying(200),
    username character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.dim_password OWNER TO pms;

--
-- Name: dim_password_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.dim_password_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_password_id_seq OWNER TO pms;

--
-- Name: dim_password_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.dim_password_id_seq OWNED BY public.dim_password.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.django_admin_log OWNER TO pms;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO pms;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO pms;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO pms;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO pms;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO pms;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO pms;

--
-- Name: fact_car_odometer; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.fact_car_odometer (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    date date NOT NULL,
    kms numeric(15,2) NOT NULL,
    car_id integer
);


ALTER TABLE public.fact_car_odometer OWNER TO pms;

--
-- Name: fact_car_odometer_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.fact_car_odometer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_car_odometer_id_seq OWNER TO pms;

--
-- Name: fact_car_odometer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.fact_car_odometer_id_seq OWNED BY public.fact_car_odometer.id;


--
-- Name: fact_chit_customers; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.fact_chit_customers (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    chit_id integer,
    customer_id integer,
    prefered_month integer
);


ALTER TABLE public.fact_chit_customers OWNER TO pms;

--
-- Name: fact_chit_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.fact_chit_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_chit_customers_id_seq OWNER TO pms;

--
-- Name: fact_chit_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.fact_chit_customers_id_seq OWNED BY public.fact_chit_customers.id;


--
-- Name: fact_chit_payment; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.fact_chit_payment OWNER TO pms;

--
-- Name: fact_chit_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.fact_chit_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_chit_payment_id_seq OWNER TO pms;

--
-- Name: fact_chit_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.fact_chit_payment_id_seq OWNED BY public.fact_chit_payment.id;


--
-- Name: fact_chit_settlement; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.fact_chit_settlement OWNER TO pms;

--
-- Name: fact_chit_settlement_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.fact_chit_settlement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_chit_settlement_id_seq OWNER TO pms;

--
-- Name: fact_chit_settlement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.fact_chit_settlement_id_seq OWNED BY public.fact_chit_settlement.id;


--
-- Name: fact_credit; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.fact_credit OWNER TO pms;

--
-- Name: fact_credit_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.fact_credit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_credit_id_seq OWNER TO pms;

--
-- Name: fact_credit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.fact_credit_id_seq OWNED BY public.fact_credit.id;


--
-- Name: fact_emi; Type: TABLE; Schema: public; Owner: pms
--

CREATE TABLE public.fact_emi (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    emi_amount numeric(15,2) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    card_id bigint NOT NULL,
    source_id bigint
);


ALTER TABLE public.fact_emi OWNER TO pms;

--
-- Name: fact_emi_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.fact_emi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_emi_id_seq OWNER TO pms;

--
-- Name: fact_emi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.fact_emi_id_seq OWNED BY public.fact_emi.id;


--
-- Name: fact_finance_utilized; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.fact_finance_utilized OWNER TO pms;

--
-- Name: fact_flexi_utilized_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.fact_flexi_utilized_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_flexi_utilized_id_seq OWNER TO pms;

--
-- Name: fact_flexi_utilized_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.fact_flexi_utilized_id_seq OWNED BY public.fact_finance_utilized.id;


--
-- Name: fact_monthly_payment; Type: TABLE; Schema: public; Owner: pms
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


ALTER TABLE public.fact_monthly_payment OWNER TO pms;

--
-- Name: fact_monthly_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.fact_monthly_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_monthly_payment_id_seq OWNER TO pms;

--
-- Name: fact_monthly_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.fact_monthly_payment_id_seq OWNED BY public.fact_monthly_payment.id;


--
-- Name: other_card_id_seq; Type: SEQUENCE; Schema: public; Owner: pms
--

CREATE SEQUENCE public.other_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_card_id_seq OWNER TO pms;

--
-- Name: other_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pms
--

ALTER SEQUENCE public.other_card_id_seq OWNED BY public.dim_card.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: dim_car_detail id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_car_detail ALTER COLUMN id SET DEFAULT nextval('public.dim_car_detail_id_seq'::regclass);


--
-- Name: dim_card id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_card ALTER COLUMN id SET DEFAULT nextval('public.other_card_id_seq'::regclass);


--
-- Name: dim_chit id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_chit ALTER COLUMN id SET DEFAULT nextval('public.dim_chit_id_seq'::regclass);


--
-- Name: dim_customers id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_customers ALTER COLUMN id SET DEFAULT nextval('public.dim_customers_id_seq'::regclass);


--
-- Name: dim_expences id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_expences ALTER COLUMN id SET DEFAULT nextval('public.dim_expences_id_seq'::regclass);


--
-- Name: dim_finance_loan id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_finance_loan ALTER COLUMN id SET DEFAULT nextval('public.dim_flexi_loan_id_seq'::regclass);


--
-- Name: dim_finance_source id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_finance_source ALTER COLUMN id SET DEFAULT nextval('public.dim_finance_source_id_seq'::regclass);


--
-- Name: dim_income id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_income ALTER COLUMN id SET DEFAULT nextval('public.dim_income_id_seq'::regclass);


--
-- Name: dim_password id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_password ALTER COLUMN id SET DEFAULT nextval('public.dim_password_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: fact_car_odometer id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_car_odometer ALTER COLUMN id SET DEFAULT nextval('public.fact_car_odometer_id_seq'::regclass);


--
-- Name: fact_chit_customers id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_customers ALTER COLUMN id SET DEFAULT nextval('public.fact_chit_customers_id_seq'::regclass);


--
-- Name: fact_chit_payment id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_payment ALTER COLUMN id SET DEFAULT nextval('public.fact_chit_payment_id_seq'::regclass);


--
-- Name: fact_chit_settlement id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_settlement ALTER COLUMN id SET DEFAULT nextval('public.fact_chit_settlement_id_seq'::regclass);


--
-- Name: fact_credit id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_credit ALTER COLUMN id SET DEFAULT nextval('public.fact_credit_id_seq'::regclass);


--
-- Name: fact_emi id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_emi ALTER COLUMN id SET DEFAULT nextval('public.fact_emi_id_seq'::regclass);


--
-- Name: fact_finance_utilized id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_finance_utilized ALTER COLUMN id SET DEFAULT nextval('public.fact_flexi_utilized_id_seq'::regclass);


--
-- Name: fact_monthly_payment id; Type: DEFAULT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_monthly_payment ALTER COLUMN id SET DEFAULT nextval('public.fact_monthly_payment_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: pms
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
93	Can add password	22	add_password
94	Can change password	22	change_password
95	Can delete password	22	delete_password
96	Can view password	22	view_password
97	Can add card	23	add_card
98	Can change card	23	change_card
99	Can delete card	23	delete_card
100	Can view card	23	view_card
101	Can add emi	24	add_emi
102	Can change emi	24	change_emi
103	Can delete emi	24	delete_emi
104	Can view emi	24	view_emi
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$RZHuttKM5lk5nj7ZlfeLd5$XfYoQNx0K94SIL4u13VDCMgLx4u7MTnc8h+oKqsgQ/I=	2022-01-03 10:29:21.666648+00	t	admin			admin@admin.com	t	t	2021-09-06 10:55:34.698125+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: dim_car_detail; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.dim_car_detail (id, name, year, purchased_kms, insurance_date, created, modified, gps_id, total_kms, address, ignition_status, gps_last_updated) FROM stdin;
1	Innova	2013	88000	2020-01-12	2021-09-06 13:31:56.1593+00	2022-01-05 11:09:36.046905+00	624789	107453.00	23/29, South Beach Avenue, MRC Nagar, RA Puram, Chennai, Tamil Nadu. 47 m from Indian Bank Management Academy for Growth & Excellence pin-600028 (India)	f	2022-01-05 11:09:36.046612+00
\.


--
-- Data for Name: dim_card; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.dim_card (id, created, modified, name, type, bank) FROM stdin;
2	2021-12-23 02:26:35.083757+00	2021-12-23 02:26:35.083859+00	KVB	debit	kvb
1	2021-12-23 02:25:36.930737+00	2021-12-23 02:26:56.749732+00	ICICI - DB	debit	icici
3	2021-12-23 02:26:45.701454+00	2021-12-23 02:27:04.256981+00	ICICI - CR	credit	icici
\.


--
-- Data for Name: dim_chit; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.dim_chit (id, created, modified, name, start_date, end_date, settlement_date, total_value, total_months, interest_percentage, commission_percentage) FROM stdin;
2	2021-09-29 07:30:38.622222+00	2021-09-29 07:30:38.622222+00	2L	2021-07-01	2023-02-01	5	200000	20	1.50	3.00
3	2021-10-05 13:43:56.096086+00	2021-10-13 06:53:24.626018+00	50K	2021-11-01	2022-08-01	5	50000	10	0.00	0.00
\.


--
-- Data for Name: dim_customers; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.dim_customers (id, created, modified, name, phone_number, self) FROM stdin;
4	2021-09-07 11:31:16.137067+00	2021-09-07 11:31:16.137067+00	Sethu	\N	f
5	2021-09-14 06:57:17.914204+00	2021-09-14 06:57:17.914204+00	Udhaya	\N	f
6	2021-09-29 07:33:24.620026+00	2021-09-29 07:33:24.620026+00	Vijayanand	\N	f
7	2021-09-29 07:33:39.422443+00	2021-09-29 07:33:39.422443+00	Saranya	\N	f
9	2021-09-29 07:34:04.004537+00	2021-09-29 07:34:04.004537+00	Arumugaswamy	\N	f
10	2021-09-29 07:34:13.671936+00	2021-09-29 07:34:13.671936+00	Sabari	\N	f
11	2021-09-29 07:34:23.541408+00	2021-09-29 07:34:23.541408+00	Ramprabhu	\N	f
12	2021-09-29 07:34:33.608927+00	2021-09-29 07:34:33.608927+00	Vinodhini	\N	f
13	2021-09-29 07:34:46.079662+00	2021-09-29 07:34:46.079662+00	Bhuvana	\N	f
14	2021-09-29 07:34:55.944427+00	2021-09-29 07:34:55.944427+00	Dhaya	\N	f
15	2021-09-29 07:35:05.35478+00	2021-09-29 07:35:05.35478+00	Sanjith	\N	f
16	2021-09-29 07:35:15.064075+00	2021-09-29 07:35:15.064075+00	Dhinesh	\N	f
17	2021-09-29 07:35:24.219769+00	2021-09-29 07:35:24.219769+00	Anand	\N	f
18	2021-09-29 07:35:35.450113+00	2021-09-29 07:35:35.450113+00	Siva	\N	f
19	2021-09-29 07:35:45.824673+00	2021-09-29 07:35:45.824673+00	Baskar	\N	f
20	2021-09-29 07:35:55.877222+00	2021-09-29 07:35:55.877222+00	Ramesh	\N	f
21	2021-09-29 07:36:04.823856+00	2021-09-29 07:36:04.823856+00	Sadham	\N	f
22	2021-09-29 07:36:14.395223+00	2021-09-29 07:36:14.395223+00	Panneer	\N	f
24	2021-10-05 13:52:58.472868+00	2021-10-05 13:52:58.472868+00	Moorthy	\N	f
25	2021-10-05 13:55:38.46641+00	2021-10-05 13:55:38.46641+00	Poornima	\N	f
26	2021-10-05 13:56:20.092205+00	2021-10-05 13:56:20.092205+00	Varadharajan	\N	f
27	2021-10-05 13:57:52.985161+00	2021-10-05 13:57:52.985161+00	Vaishali	\N	f
28	2021-10-11 01:04:18.227091+00	2021-10-11 01:04:18.227091+00	Thirumurugan	\N	f
8	2021-09-29 07:33:53.187072+00	2021-09-29 07:33:53.187072+00	Paramasivam	\N	f
29	2021-10-12 13:18:51.519767+00	2021-10-12 13:18:51.519767+00	Manimaran	0	f
30	2021-10-17 01:11:10.064627+00	2021-10-17 01:11:10.064627+00	Anand  Korea	0	f
3	2021-09-07 10:03:28.400716+00	2021-09-07 10:03:28.400716+00	Varjiniya	\N	t
2	2021-09-07 09:59:45.758289+00	2021-09-07 09:59:45.758289+00	Prabakaran V	\N	t
31	2021-11-12 06:54:17.462875+00	2021-11-12 06:54:17.462875+00	Varjiniya Prabakaran	9944193082	t
\.


--
-- Data for Name: dim_expences; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.dim_expences (id, created, modified, name, amount, start_date, end_date, pay_type, type, status, sort_order, savings, chit_id, finance_id) FROM stdin;
11	2021-10-16 05:29:22.4324+00	2021-10-16 05:29:22.4324+00	Outdoor Location	4500.00	2021-10-01	2021-10-31	1	others	t	999	f	\N	\N
13	2021-10-16 05:30:24.761221+00	2021-10-16 05:30:24.761221+00	Makeup	3000.00	2021-10-01	2021-10-31	2	others	t	999	f	\N	\N
1	2021-10-12 13:33:20.192992+00	2021-10-16 05:24:08.848344+00	Rent	15500.00	2021-10-12	\N	1	rental	t	1	f	\N	\N
7	2021-10-13 07:15:07.555663+00	2021-10-13 14:40:24.770771+00	GRT	11000.00	2021-09-01	2022-07-31	1	savings	t	10	t	\N	\N
5	2021-10-13 07:12:26.71184+00	2021-10-13 11:34:41.006774+00	Petrol	1000.00	2021-10-13	\N	1	house_expense	t	8	f	\N	\N
2	2021-10-12 13:35:43.987387+00	2021-10-21 03:31:07.785957+00	Axis PL	8000.00	2021-10-12	2025-11-10	1	loan	t	3	f	\N	\N
3	2021-10-13 06:56:47.901627+00	2021-10-21 03:31:25.221892+00	I20 Car	13000.00	2021-10-13	2027-09-13	1	loan	t	2	f	\N	\N
8	2021-10-13 13:48:33.794642+00	2021-10-26 13:34:58.597635+00	2L	0.00	2021-10-13	2023-02-28	2	chit	t	5	t	2	\N
15	2021-10-16 07:10:46.363312+00	2021-10-26 13:37:50.203539+00	50K	5000.00	2021-11-01	2022-09-30	1	chit	t	6	t	3	\N
10	2021-10-16 04:46:15.036201+00	2021-10-28 04:58:55.867174+00	Bajaj Flexi	16400.00	2021-10-16	\N	2	finance	t	4	f	\N	1
19	2021-10-29 08:30:49.031746+00	2021-10-29 08:31:42.868008+00	Chit Payment	0.00	2021-11-01	2021-11-30	2	others	t	999	f	\N	\N
20	2021-10-31 05:51:23.999841+00	2021-10-31 05:51:23.999841+00	Others	0.00	2021-10-01	\N	2	others	t	999	f	\N	\N
21	2021-10-31 06:06:44.903138+00	2021-10-31 06:06:44.903138+00	EB	0.00	2021-10-01	\N	2	bill	t	999	f	\N	\N
23	2021-11-12 11:33:18.942972+00	2021-11-12 11:33:18.942972+00	Raam Prabhu	24450.00	2021-12-01	2021-12-31	1	repayment	t	999	f	\N	\N
18	2021-10-29 04:42:41.840784+00	2021-11-12 11:38:58.351491+00	Baby Account	0.00	2021-10-01	2021-11-30	2	others	t	999	f	\N	\N
22	2021-11-12 08:24:31.959992+00	2021-11-24 13:04:47.139789+00	Vidhaikkum Karangal	0.00	2021-11-01	2021-11-20	2	others	t	999	f	\N	\N
12	2021-10-16 05:29:56.429445+00	2021-11-26 03:37:36.351647+00	Photographer	3000.00	2021-10-01	2021-12-31	2	others	t	999	f	\N	\N
9	2021-10-13 13:50:33.822984+00	2021-11-26 03:39:58.099018+00	ICICI	0.00	2021-09-01	\N	2	credit_card	t	11	f	\N	\N
17	2021-10-25 12:28:13.583669+00	2021-11-26 03:40:04.367693+00	ICICI Pay Later	0.00	2021-10-01	\N	2	credit_card	t	11	f	\N	\N
14	2021-10-16 06:58:20.205188+00	2021-11-26 03:40:11.086664+00	HDFC	0.00	2021-10-16	\N	2	credit_card	t	11	f	\N	\N
26	2021-12-03 02:28:28.969714+00	2021-12-03 02:28:28.969743+00	ICICI CA	2050.00	2021-12-01	\N	1	finance	t	4	f	\N	\N
27	2021-12-06 02:37:05.839578+00	2021-12-06 02:37:05.839622+00	Pranav	0.00	2021-12-01	\N	2	others	t	999	f	\N	\N
4	2021-10-13 07:10:48.021482+00	2021-12-26 14:53:46.728001+00	House Expenses	8000.00	2021-10-13	\N	1	house_expense	t	7	f	\N	\N
6	2021-10-13 07:14:49.612428+00	2021-12-26 14:55:41.322288+00	Airtel	2100.00	2021-10-13	\N	1	bill	t	9	f	\N	\N
24	2021-11-26 03:32:14.824128+00	2022-01-03 13:17:57.058085+00	5L Chit	20000.00	2022-01-01	2024-01-31	1	chit	t	5	t	\N	\N
\.


--
-- Data for Name: dim_finance_loan; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.dim_finance_loan (id, created, modified, name, loan_amount, roi, status, utilized_amount) FROM stdin;
1	2021-10-26 14:50:34+00	2022-01-05 03:19:13.56227+00	Bajaj Finance	1452999.00	14.25	t	1134000.00
\.


--
-- Data for Name: dim_finance_source; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.dim_finance_source (id, created, modified, name) FROM stdin;
1	2021-10-20 03:17:19+00	2021-10-20 03:17:19+00	Others
3	2021-10-20 03:26:05.46385+00	2021-10-20 03:26:05.46385+00	Salary
4	2021-10-20 03:26:24.622142+00	2021-10-20 03:26:24.622142+00	Nisha Cars
5	2021-10-20 03:26:40.126446+00	2021-10-20 03:26:40.126446+00	Moorthy
6	2021-10-20 03:26:56.515768+00	2021-10-20 03:26:56.515768+00	Sethu
7	2021-10-20 03:27:21.792581+00	2021-10-20 03:27:21.792581+00	Prasanth
8	2021-10-20 03:27:41.765959+00	2021-10-20 03:27:41.765959+00	Udhaya
9	2021-10-20 03:27:53.018362+00	2021-10-20 03:27:53.018362+00	Ramesh
10	2021-10-20 03:29:13.315758+00	2021-10-20 03:29:13.315758+00	RDS
11	2021-10-20 03:32:19.825681+00	2021-10-20 03:32:19.826681+00	Bajaj
12	2021-10-23 03:21:04.757626+00	2021-10-23 03:21:04.757626+00	Dhaya
13	2021-10-23 03:21:19.773956+00	2021-10-23 03:21:19.773956+00	Sadham
14	2021-10-23 03:23:19.388462+00	2021-10-23 03:23:19.388462+00	Amma
15	2021-10-23 03:25:34.418397+00	2021-10-23 03:25:34.418397+00	Thirumurugan
16	2021-10-26 15:22:59+00	2021-10-26 15:22:59+00	Self
48	2022-01-05 00:01:28.163791+00	2022-01-05 00:01:28.163824+00	Athai
\.


--
-- Data for Name: dim_income; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.dim_income (id, created, modified, name, amount, status, end_date, start_date, pay_type, type, sort_order, source_id, finance_id) FROM stdin;
10	2021-10-13 14:47:27.415937+00	2021-10-20 03:30:13.643493+00	Innova	35000.00	t	\N	2021-10-13	2	car_rental	2	4	\N
11	2021-10-16 05:31:02.907629+00	2021-10-20 03:30:48.102029+00	Ramesh	2000.00	t	\N	2021-10-01	1	rent	4	9	\N
14	2021-10-16 05:32:54.284403+00	2021-10-20 03:31:02.289055+00	Moorthy	3700.00	t	2021-10-31	2021-10-01	1	emi	5	5	\N
13	2021-10-16 05:31:44.081813+00	2021-10-20 03:31:18.604034+00	Moorthy	1500.00	t	\N	2021-10-01	1	rent	5	5	\N
17	2021-10-16 08:34:08.514684+00	2021-10-20 03:31:39.220736+00	Sethu	3400.00	t	2022-04-30	2021-11-01	1	emi	6	6	\N
16	2021-10-16 05:45:56.277495+00	2021-10-20 03:32:56.492048+00	Bajaj	0.00	t	\N	2021-10-01	2	finance	7	11	\N
19	2021-10-16 15:28:49.176178+00	2021-10-27 13:01:26.984235+00	Prasanth	2000.00	t	\N	2021-09-01	2	emi	7	7	1
18	2021-10-16 15:27:44.585277+00	2021-10-27 13:15:29.335401+00	Udhaya	4200.00	t	\N	2021-09-01	2	emi	8	8	1
21	2021-11-12 11:28:34.60058+00	2021-11-12 11:57:04.567695+00	Ramesh Flexi	0.00	t	\N	2021-12-01	2	emi	4	9	1
15	2021-10-16 05:33:41.002759+00	2021-11-12 11:59:19.586656+00	Ramesh Mobile	2050.00	t	2022-06-30	2021-10-16	1	emi	4	9	\N
8	2021-10-12 13:34:49.314651+00	2021-11-24 08:40:56.001047+00	HCL Salary	105500.00	t	\N	2021-10-13	2	salary	1	3	\N
23	2021-12-11 08:24:36.706332+00	2021-12-11 08:24:36.706361+00	Dhaya	0.00	t	\N	2021-12-01	2	finance	999	12	1
9	2021-10-12 13:35:08.914767+00	2021-12-14 02:49:40.347468+00	Finance Interest	4000.00	t	2021-12-31	2021-10-13	1	finance	3	10	\N
12	2021-10-16 05:31:23.959812+00	2021-12-14 02:57:30.617012+00	Sethu	1500.00	t	\N	2021-10-16	1	rent	7	7	\N
22	2021-11-24 08:41:31.138774+00	2022-01-03 15:26:50.984992+00	Freelance	105000.00	t	\N	2022-01-01	2	salary	1	3	\N
24	2022-01-05 00:03:38.802975+00	2022-01-05 00:03:56.024471+00	Athai Emi	0.00	t	\N	2022-01-05	2	finance	999	48	1
\.


--
-- Data for Name: dim_password; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.dim_password (id, created, modified, name, url, username, password, description) FROM stdin;
1	2021-11-18 14:57:16.444978+00	2021-11-18 14:57:16.444978+00	HCL	http://myhcl.com	prabakaran.veera	Praniya*_!43	Office ID
2	2021-11-18 14:57:52.337099+00	2021-11-18 14:57:52.337099+00	Primark	\N	pveerapathiran	Praniya*_191994	Client Account
3	2021-11-18 14:58:16.386327+00	2021-11-18 14:58:16.386327+00	Gmail Personal	\N	spksprabu	Praniya_143	
4	2021-11-18 15:00:38.647051+00	2021-11-18 15:00:38.647051+00	Gmail Spiffy	\N	spiffysofts	Praniya_143	
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: pms
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
22	other	password
23	other	card
24	finance	emi
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-09-06 10:53:28.155087+00
2	auth	0001_initial	2021-09-06 10:53:28.913201+00
3	admin	0001_initial	2021-09-06 10:53:30.296741+00
4	admin	0002_logentry_remove_auto_add	2021-09-06 10:53:30.497298+00
5	admin	0003_logentry_add_action_flag_choices	2021-09-06 10:53:30.584916+00
6	contenttypes	0002_remove_content_type_name	2021-09-06 10:53:30.662909+00
7	auth	0002_alter_permission_name_max_length	2021-09-06 10:53:30.6878+00
8	auth	0003_alter_user_email_max_length	2021-09-06 10:53:30.710204+00
9	auth	0004_alter_user_username_opts	2021-09-06 10:53:30.740789+00
10	auth	0005_alter_user_last_login_null	2021-09-06 10:53:30.769139+00
11	auth	0006_require_contenttypes_0002	2021-09-06 10:53:30.781314+00
12	auth	0007_alter_validators_add_error_messages	2021-09-06 10:53:30.801651+00
13	auth	0008_alter_user_username_max_length	2021-09-06 10:53:30.991329+00
14	auth	0009_alter_user_last_name_max_length	2021-09-06 10:53:31.022598+00
15	auth	0010_alter_group_name_max_length	2021-09-06 10:53:31.05385+00
16	auth	0011_update_proxy_permissions	2021-09-06 10:53:31.069476+00
17	sessions	0001_initial	2021-09-06 10:53:31.318722+00
18	car	0001_initial	2021-09-06 11:29:35.498425+00
19	car	0002_auto_20210906_1857	2021-09-06 13:28:30.000491+00
20	car	0003_auto_20210906_1940	2021-09-06 14:11:02.083887+00
21	car	0004_auto_20210906_2124	2021-09-06 15:58:37.249105+00
22	car	0005_auto_20210907_1001	2021-09-07 04:32:46.396349+00
23	chit	0001_initial	2021-09-07 07:33:04.618229+00
24	chit	0002_auto_20210907_1527	2021-09-07 09:58:08.636885+00
25	chit	0003_auto_20210907_1530	2021-09-07 10:01:22.997768+00
26	chit	0004_auto_20210907_1542	2021-09-07 10:14:35.098574+00
27	chit	0005_remove_chitcustomers_prefered_month	2021-09-07 12:01:58.357346+00
28	chit	0006_chitcustomers_prefered_month	2021-09-07 12:03:10.124139+00
29	chit	0007_auto_20210907_1741	2021-09-07 12:12:38.165715+00
30	chit	0008_chitpayment	2021-09-14 04:44:51.753265+00
31	car	0006_car_gps_last_updated	2021-09-23 00:14:45.893398+00
32	chit	0009_chitpayment_month	2021-09-23 03:57:13.213951+00
33	chit	0010_chit_interest_percentage	2021-09-29 10:25:22.948041+00
34	chit	0011_chit_commision_percentage	2021-09-29 10:31:27.789691+00
35	finance	0001_initial	2021-10-01 12:48:23.511016+00
36	finance	0002_expenses_monthlypayment	2021-10-01 12:52:07.36183+00
37	chit	0012_chitsettlement	2021-10-06 03:12:21.809317+00
38	finance	0003_auto_20211005_1933	2021-10-06 03:12:22.573343+00
39	chit	0013_auto_20211006_1029	2021-10-06 05:03:11.686297+00
40	finance	0004_auto_20211006_1029	2021-10-06 05:03:11.718913+00
41	chit	0014_auto_20211006_1118	2021-10-06 05:52:05.568825+00
42	finance	0005_auto_20211006_1125	2021-10-06 05:57:03.738954+00
43	chit	0015_auto_20211006_1205	2021-10-06 06:36:19.343859+00
44	chit	0016_chitsettlement_amount	2021-10-06 07:21:23.286007+00
45	chit	0017_chitsettlement_betting	2021-10-06 07:21:23.650685+00
46	chit	0018_auto_20211011_1031	2021-10-11 05:01:42.605748+00
47	finance	0006_auto_20211013_1252	2021-10-13 07:22:46.097681+00
48	finance	0007_auto_20211013_1643	2021-10-13 11:13:34.893599+00
49	finance	0008_expenses_type	2021-10-13 13:39:05.838991+00
50	finance	0009_auto_20211013_1919	2021-10-13 13:49:49.157113+00
51	finance	0010_auto_20211013_1922	2021-10-13 13:52:57.623733+00
52	finance	0011_expenses_type	2021-10-13 13:56:21.47476+00
53	finance	0012_auto_20211013_1929	2021-10-13 13:59:41.159287+00
54	finance	0013_auto_20211013_2004	2021-10-13 14:37:35.10941+00
55	finance	0014_auto_20211013_2013	2021-10-13 14:44:21.91641+00
56	finance	0015_auto_20211013_2015	2021-10-13 14:45:44.299073+00
57	finance	0016_expenses_status	2021-10-13 14:48:01.669962+00
58	finance	0017_monthlypayment_income	2021-10-13 15:27:12.890399+00
59	finance	0018_auto_20211013_2058	2021-10-13 15:29:12.876918+00
60	finance	0019_auto_20211013_2105	2021-10-13 15:36:15.473375+00
61	finance	0020_auto_20211014_0921	2021-10-14 03:52:16.923177+00
62	finance	0021_auto_20211016_1243	2021-10-16 07:13:56.055244+00
63	finance	0022_expenses_savings	2021-10-16 07:59:03.032722+00
64	finance	0023_auto_20211016_2203	2021-10-16 16:33:59.868289+00
65	finance	0024_auto_20211017_2004	2021-10-17 14:35:01.948334+00
66	finance	0025_auto_20211017_2008	2021-10-17 14:39:34.56213+00
67	finance	0026_incomesource	2021-10-20 03:17:02.237599+00
68	finance	0027_income_source	2021-10-20 03:18:16.753542+00
69	finance	0028_auto_20211020_2129	2021-10-20 16:00:42.291432+00
70	finance	0029_auto_20211021_0853	2021-10-21 03:24:13.8116+00
71	finance	0030_auto_20211021_0857	2021-10-21 03:28:25.723757+00
72	finance	0031_auto_20211022_1940	2021-10-23 03:01:07.113055+00
73	finance	0032_auto_20211023_0839	2021-10-23 03:12:03.809593+00
74	finance	0033_auto_20211023_0845	2021-10-23 03:16:07.772959+00
75	finance	0034_auto_20211023_0852	2021-10-23 03:23:26.063055+00
76	finance	0035_auto_20211023_0859	2021-10-23 05:45:53.888867+00
77	finance	0036_auto_20211023_1115	2021-10-23 05:45:54.097978+00
78	finance	0037_remove_credit_type	2021-10-23 06:12:29.274365+00
79	finance	0038_credit_expected_date	2021-10-23 06:29:22.528739+00
80	chit	0019_chitcustomers_self	2021-10-26 11:57:17.474338+00
81	finance	0039_auto_20211026_1726	2021-10-26 11:57:17.522079+00
82	chit	0020_auto_20211026_1728	2021-10-26 11:59:33.040346+00
83	finance	0040_expenses_chit	2021-10-26 13:32:49.099094+00
84	finance	0041_flexiloan_flexiutilized	2021-10-26 14:44:51.892356+00
85	finance	0042_flexiutilized_payment_type	2021-10-27 08:23:50.405867+00
86	finance	0043_flexiloan_utilized_amount	2021-10-27 09:58:06.038763+00
87	finance	0044_auto_20211027_1702	2021-10-27 11:33:07.064837+00
88	finance	0045_expenses_finance	2021-10-27 11:43:42.122035+00
89	finance	0046_auto_20211027_1720	2021-10-27 11:51:55.451895+00
90	finance	0047_income_finance	2021-10-27 11:56:59.119043+00
91	finance	0048_auto_20211027_2016	2021-10-27 14:47:16.305552+00
92	auth	0012_alter_user_first_name_max_length	2021-11-15 03:34:29.16944+00
93	car	0007_auto_20211115_0903	2021-11-15 03:34:29.544479+00
94	chit	0021_auto_20211115_0903	2021-11-15 03:34:29.544479+00
95	finance	0049_auto_20211115_0903	2021-11-15 03:34:29.560042+00
96	other	0001_initial	2021-11-18 14:47:19.705832+00
97	other	0002_card	2021-12-23 02:07:13.768888+00
98	other	0003_alter_card_table	2021-12-23 02:15:35.076259+00
99	finance	0050_emi	2021-12-23 02:15:35.248496+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
kvhppl9apsmuv29iowlrga7k6qgchq3s	OTg1YzQ5M2VlYzYzODE5ZWYxN2VkNTJhOGIwMTQ1YTM1MzRkNmY3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YTkwNDNlOWEwODgwYmNiOTFhMDE0MTFiMmIyYThmNTg3ZjI5MWIzIn0=	2021-10-05 11:05:07.534186+00
3486c2jpvf65ipcbivjkhv1j6xq7q009	OTg1YzQ5M2VlYzYzODE5ZWYxN2VkNTJhOGIwMTQ1YTM1MzRkNmY3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YTkwNDNlOWEwODgwYmNiOTFhMDE0MTFiMmIyYThmNTg3ZjI5MWIzIn0=	2021-10-12 13:47:47.857445+00
jwqlg4mzqu3fjdku06pfh02in9dqf7mt	OTg1YzQ5M2VlYzYzODE5ZWYxN2VkNTJhOGIwMTQ1YTM1MzRkNmY3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YTkwNDNlOWEwODgwYmNiOTFhMDE0MTFiMmIyYThmNTg3ZjI5MWIzIn0=	2021-11-07 04:40:33.265228+00
jklopyitosy0cplydnew3p4hlazfkw8h	OTg1YzQ5M2VlYzYzODE5ZWYxN2VkNTJhOGIwMTQ1YTM1MzRkNmY3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YTkwNDNlOWEwODgwYmNiOTFhMDE0MTFiMmIyYThmNTg3ZjI5MWIzIn0=	2021-11-22 06:02:05.534413+00
5n5ydj0mty21es1moz4dax3n4dz383gg	.eJxVjEEOgjAQRe_StWlaYDodl-49AxmmU4saSCisjHdXEha6_e-9_zI9b2vpt6pLPyZzNt6cfreB5aHTDtKdp9tsZZ7WZRzsrtiDVnudkz4vh_t3ULiWb92yD6wBMDbkKEALCTUE6TJ1QBnJoWAkcCCR3BBZUEVCBkbfKHvz_gC6kTc8:1mmSmL:aJv5el0nU94_Tf0jbbGtObOlpbIgQByRU9FhrPnltGc	2021-11-29 03:35:33.296784+00
b317ywzgjsvwx3njhey9mdgfzecsezh2	.eJxVjEEOgjAQRe_StWlaYDodl-49AxmmU4saSCisjHdXEha6_e-9_zI9b2vpt6pLPyZzNt6cfreB5aHTDtKdp9tsZZ7WZRzsrtiDVnudkz4vh_t3ULiWb92yD6wBMDbkKEALCTUE6TJ1QBnJoWAkcCCR3BBZUEVCBkbfKHvz_gC6kTc8:1ms5A2:MbU5f3htrCkxaSgTCCK-LLfzvahXhA8XC0hS5zG5WAg	2021-12-14 15:35:14.795679+00
7wd5qi05giexfdz8cek3pnjqr5zqr8ow	.eJxVjDsOwjAQBe_iGln-rZ1Q0nMGa-3d4ACypTipEHeHSCmgfTPzXiLitpa4dV7iTOIstDj9bgnzg-sO6I711mRudV3mJHdFHrTLayN-Xg7376BgL986WJ1VgsExBgR0Y3DgAfzknLEACNoqGjRmsn6CQKM3pBA5K2MgMYj3B708NzQ:1msoeA:gpkAf68nyvN8eQZQ0wim20ajizI_iHqqHcgJuHrkMR0	2021-12-16 16:09:22.404586+00
77snvwusvdjz17w4xtjp62s0d9ekzx4a	.eJxVjDsOwjAQBe_iGln-rZ1Q0nMGa-3d4ACypTipEHeHSCmgfTPzXiLitpa4dV7iTOIstDj9bgnzg-sO6I711mRudV3mJHdFHrTLayN-Xg7376BgL986WJ1VgsExBgR0Y3DgAfzknLEACNoqGjRmsn6CQKM3pBA5K2MgMYj3B708NzQ:1mz7L2:gpaFqlvASLomQJxiJsefRryiFKlLsKuzo7_GcMoN-Tg	2022-01-03 01:19:40.642652+00
8fs45ofigqre9147g940ffrsmr5hhnof	.eJxVjDsOwjAQBe_iGln-rZ1Q0nMGa-3d4ACypTipEHeHSCmgfTPzXiLitpa4dV7iTOIstDj9bgnzg-sO6I711mRudV3mJHdFHrTLayN-Xg7376BgL986WJ1VgsExBgR0Y3DgAfzknLEACNoqGjRmsn6CQKM3pBA5K2MgMYj3B708NzQ:1n4Kaf:PaLFWYsKRlSZI3jEmca3TR3wl4MC3Zi92tsDtxSNXfQ	2022-01-17 10:29:21.675711+00
\.


--
-- Data for Name: fact_car_odometer; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.fact_car_odometer (id, created, modified, date, kms, car_id) FROM stdin;
89	2021-10-01 12:29:15.47054+00	2021-10-11 01:01:34.962929+00	2021-10-01	0.00	1
81	2021-09-21 11:03:07.297531+00	2021-09-28 13:44:52.612885+00	2021-09-20	10.00	1
3	2021-09-07 03:52:37.272976+00	2021-09-07 03:52:37.272976+00	2021-07-01	0.00	1
4	2021-09-07 03:52:37.366736+00	2021-09-07 03:52:37.366736+00	2021-07-02	0.00	1
5	2021-09-07 03:52:37.37375+00	2021-09-07 03:52:37.37375+00	2021-07-03	0.00	1
6	2021-09-07 03:52:37.37375+00	2021-09-07 03:52:37.37375+00	2021-07-04	12.00	1
7	2021-09-07 03:52:37.38942+00	2021-09-07 03:52:37.38942+00	2021-07-05	175.00	1
8	2021-09-07 03:52:37.405013+00	2021-09-07 03:52:37.405013+00	2021-07-06	0.00	1
9	2021-09-07 03:52:37.405013+00	2021-09-07 03:52:37.405013+00	2021-07-07	0.00	1
10	2021-09-07 03:52:37.42067+00	2021-09-07 03:52:37.42067+00	2021-07-08	15.00	1
11	2021-09-07 03:52:37.42067+00	2021-09-07 03:52:37.42067+00	2021-07-09	53.00	1
12	2021-09-07 03:52:37.436277+00	2021-09-07 03:52:37.436277+00	2021-07-10	0.00	1
13	2021-09-07 03:52:37.467517+00	2021-09-07 03:52:37.467517+00	2021-07-11	0.00	1
14	2021-09-07 03:52:37.474032+00	2021-09-07 03:52:37.474032+00	2021-07-12	0.00	1
15	2021-09-07 03:52:37.489675+00	2021-09-07 03:52:37.489675+00	2021-07-13	0.00	1
16	2021-09-07 03:52:37.489675+00	2021-09-07 03:52:37.489675+00	2021-07-14	0.00	1
17	2021-09-07 03:52:37.507026+00	2021-09-07 03:52:37.507026+00	2021-07-15	0.00	1
18	2021-09-07 03:52:37.507026+00	2021-09-07 03:52:37.507026+00	2021-07-16	62.00	1
19	2021-09-07 03:52:37.522653+00	2021-09-07 03:52:37.522653+00	2021-07-17	0.00	1
20	2021-09-07 03:52:37.538281+00	2021-09-07 03:52:37.538281+00	2021-07-18	67.00	1
21	2021-09-07 03:52:37.538281+00	2021-09-07 03:52:37.538281+00	2021-07-19	41.00	1
22	2021-09-07 03:52:37.553903+00	2021-09-07 03:52:37.553903+00	2021-07-20	94.00	1
23	2021-09-07 03:52:37.553903+00	2021-09-07 03:52:37.553903+00	2021-07-21	553.00	1
24	2021-09-07 03:52:37.574043+00	2021-09-07 03:52:37.574043+00	2021-07-22	227.00	1
25	2021-09-07 03:52:37.574043+00	2021-09-07 03:52:37.574043+00	2021-07-23	573.00	1
26	2021-09-07 03:52:37.601272+00	2021-09-07 03:52:37.601272+00	2021-07-24	193.00	1
27	2021-09-07 03:52:37.601272+00	2021-09-07 03:52:37.601272+00	2021-07-25	17.00	1
28	2021-09-07 03:52:37.616901+00	2021-09-07 03:52:37.616901+00	2021-07-26	43.00	1
29	2021-09-07 03:52:37.632526+00	2021-09-07 03:52:37.632526+00	2021-07-27	144.00	1
30	2021-09-07 03:52:37.632526+00	2021-09-07 03:52:37.632526+00	2021-07-28	97.00	1
31	2021-09-07 03:52:37.648151+00	2021-09-07 03:52:37.648151+00	2021-07-29	52.00	1
32	2021-09-07 03:52:37.663776+00	2021-09-07 03:52:37.663776+00	2021-07-30	475.00	1
33	2021-09-07 03:53:24.923452+00	2021-09-07 03:53:24.923452+00	2021-08-01	245.00	1
34	2021-09-07 03:53:24.940532+00	2021-09-07 03:53:24.940532+00	2021-08-02	8.00	1
35	2021-09-07 03:53:24.956161+00	2021-09-07 03:53:24.956161+00	2021-08-03	257.00	1
36	2021-09-07 03:53:24.971791+00	2021-09-07 03:53:24.971791+00	2021-08-04	430.00	1
37	2021-09-07 03:53:24.971791+00	2021-09-07 03:53:24.971791+00	2021-08-05	136.00	1
38	2021-09-07 03:53:24.987412+00	2021-09-07 03:53:24.987412+00	2021-08-06	331.00	1
39	2021-09-07 03:53:25.003034+00	2021-09-07 03:53:25.003034+00	2021-08-07	2.00	1
40	2021-09-07 03:53:25.018663+00	2021-09-07 03:53:25.018663+00	2021-08-08	305.00	1
41	2021-09-07 03:53:25.023705+00	2021-09-07 03:53:25.023705+00	2021-08-09	774.00	1
42	2021-09-07 03:53:25.041127+00	2021-09-07 03:53:25.041127+00	2021-08-10	332.00	1
43	2021-09-07 03:53:25.041127+00	2021-09-07 03:53:25.041127+00	2021-08-11	0.00	1
44	2021-09-07 03:53:25.056756+00	2021-09-07 03:53:25.056756+00	2021-08-12	0.00	1
45	2021-09-07 03:53:25.072378+00	2021-09-07 03:53:25.072378+00	2021-08-13	3.00	1
46	2021-09-07 03:53:25.088004+00	2021-09-07 03:53:25.088004+00	2021-08-14	666.00	1
47	2021-09-07 03:53:25.088004+00	2021-09-07 03:53:25.088004+00	2021-08-15	40.00	1
48	2021-09-07 03:53:25.106387+00	2021-09-07 03:53:25.106387+00	2021-08-16	399.00	1
49	2021-09-07 03:53:25.124036+00	2021-09-07 03:53:25.124036+00	2021-08-17	1.00	1
50	2021-09-07 03:53:25.124036+00	2021-09-07 03:53:25.124036+00	2021-08-18	63.00	1
51	2021-09-07 03:53:25.141053+00	2021-09-07 03:53:25.141053+00	2021-08-19	372.00	1
52	2021-09-07 03:53:25.141053+00	2021-09-07 03:53:25.141053+00	2021-08-20	241.00	1
53	2021-09-07 03:53:25.156684+00	2021-09-07 03:53:25.156684+00	2021-08-21	177.00	1
54	2021-09-07 03:53:25.172307+00	2021-09-07 03:53:25.172307+00	2021-08-22	28.00	1
55	2021-09-07 03:53:25.187931+00	2021-09-07 03:53:25.187931+00	2021-08-23	1.00	1
56	2021-09-07 03:53:25.203557+00	2021-09-07 03:53:25.203557+00	2021-08-24	17.00	1
57	2021-09-07 03:53:25.219182+00	2021-09-07 03:53:25.219182+00	2021-08-25	22.00	1
58	2021-09-07 03:53:25.2242+00	2021-09-07 03:53:25.2242+00	2021-08-26	0.00	1
59	2021-09-07 03:53:25.239842+00	2021-09-07 03:53:25.239842+00	2021-08-27	8.00	1
60	2021-09-07 03:53:25.255471+00	2021-09-07 03:53:25.255471+00	2021-08-28	722.00	1
61	2021-09-07 04:03:04.66884+00	2021-09-07 04:03:04.66884+00	2021-08-30	27.00	1
82	2021-09-22 08:45:40.753075+00	2021-09-28 13:44:52.628887+00	2021-09-21	9.00	1
83	2021-09-22 12:53:50.707259+00	2021-09-28 13:44:52.645886+00	2021-09-22	21.00	1
84	2021-09-23 00:06:38.864004+00	2021-09-28 13:44:52.659884+00	2021-09-23	20.00	1
86	2021-09-28 13:44:52.675889+00	2021-09-28 13:44:52.675889+00	2021-09-24	17.00	1
87	2021-09-28 13:44:52.693884+00	2021-09-28 13:44:52.693884+00	2021-09-25	23.00	1
88	2021-09-28 13:44:52.713886+00	2021-09-28 13:44:52.713886+00	2021-09-26	30.00	1
94	2021-10-05 07:04:03.994068+00	2021-10-11 01:01:35.013869+00	2021-10-02	0.00	1
85	2021-09-28 13:40:31.418498+00	2021-09-28 13:44:51.79028+00	2021-09-28	38.00	1
95	2021-10-05 07:04:04.011064+00	2021-10-11 01:01:35.024742+00	2021-10-03	0.00	1
92	2021-10-04 12:23:05.18952+00	2021-10-11 01:01:35.035856+00	2021-10-04	40.00	1
90	2021-10-01 12:29:16.106297+00	2021-10-01 12:29:16.107301+00	2021-09-29	47.00	1
91	2021-10-01 12:29:16.178423+00	2021-10-01 12:29:16.178423+00	2021-09-30	32.00	1
62	2021-09-07 04:03:57.660917+00	2021-10-04 12:23:05.69945+00	2021-09-01	81.00	1
63	2021-09-07 04:03:57.682154+00	2021-10-04 12:23:05.708999+00	2021-09-02	10.00	1
64	2021-09-07 04:03:57.682154+00	2021-10-04 12:23:05.719534+00	2021-09-03	24.00	1
102	2021-10-12 04:19:33.553339+00	2021-10-12 04:19:33.553339+00	2021-10-12	0.00	1
93	2021-10-05 07:04:03.146198+00	2021-10-11 01:01:35.046022+00	2021-10-05	20.00	1
65	2021-09-07 04:03:57.697783+00	2021-09-28 13:44:52.445886+00	2021-09-04	43.00	1
66	2021-09-07 04:03:57.713409+00	2021-09-28 13:44:52.455885+00	2021-09-05	21.00	1
67	2021-09-07 04:07:14.42425+00	2021-09-28 13:44:52.466887+00	2021-09-06	12.00	1
68	2021-09-11 14:05:49.530462+00	2021-09-28 13:44:52.476887+00	2021-09-07	31.00	1
69	2021-09-11 14:05:49.548551+00	2021-09-28 13:44:52.486887+00	2021-09-08	0.00	1
70	2021-09-11 14:05:49.56379+00	2021-09-28 13:44:52.497887+00	2021-09-09	0.00	1
71	2021-09-11 14:05:49.579331+00	2021-09-28 13:44:52.507886+00	2021-09-10	15.00	1
72	2021-09-14 01:52:43.075708+00	2021-09-28 13:44:52.517887+00	2021-09-11	0.00	1
103	2021-10-13 06:54:24.729948+00	2021-10-13 06:54:24.729948+00	2021-10-13	0.00	1
96	2021-10-06 11:42:39.922145+00	2021-10-11 01:01:35.594387+00	2021-10-06	19.00	1
73	2021-09-14 01:52:43.113971+00	2021-09-28 13:44:52.527885+00	2021-09-12	50.00	1
74	2021-09-14 01:52:43.3553+00	2021-09-28 13:44:52.537886+00	2021-09-13	9.00	1
75	2021-09-21 11:03:07.094167+00	2021-09-28 13:44:52.547885+00	2021-09-14	14.00	1
97	2021-10-07 11:35:10.892207+00	2021-10-11 01:01:35.612384+00	2021-10-07	49.00	1
99	2021-10-11 01:01:35.680518+00	2021-10-11 01:01:35.680518+00	2021-10-08	0.00	1
76	2021-09-21 11:03:07.23714+00	2021-09-28 13:44:52.557887+00	2021-09-15	74.00	1
77	2021-09-21 11:03:07.24904+00	2021-09-28 13:44:52.567885+00	2021-09-16	17.00	1
78	2021-09-21 11:03:07.261855+00	2021-09-28 13:44:52.577891+00	2021-09-17	23.00	1
79	2021-09-21 11:03:07.274469+00	2021-09-28 13:44:52.589888+00	2021-09-18	15.00	1
80	2021-09-21 11:03:07.285553+00	2021-09-28 13:44:52.600889+00	2021-09-19	0.00	1
100	2021-10-11 01:01:35.822454+00	2021-10-11 01:01:35.822454+00	2021-10-09	7.00	1
101	2021-10-11 01:01:35.836975+00	2021-10-11 01:01:35.836975+00	2021-10-10	35.00	1
98	2021-10-11 01:01:33.99023+00	2021-10-11 13:31:31.596679+00	2021-10-11	55.00	1
105	2021-10-15 02:54:09.800991+00	2021-10-16 02:39:37.657976+00	2021-10-14	7.00	1
106	2021-10-16 02:38:18.463394+00	2021-11-09 11:53:26.223329+00	2021-10-16	67.00	1
107	2021-10-17 15:28:04.246309+00	2021-11-09 11:53:26.232865+00	2021-10-17	0.00	1
104	2021-10-15 02:54:09.174987+00	2021-11-09 11:53:26.21316+00	2021-10-15	8.00	1
117	2021-11-09 11:53:26.243574+00	2021-11-09 11:53:26.243574+00	2021-10-18	80.00	1
122	2021-11-09 11:53:26.7114+00	2021-11-24 08:00:20.761085+00	2021-10-31	41.00	1
118	2021-11-09 11:53:26.265194+00	2021-11-18 09:21:30.244371+00	2021-10-20	0.00	1
110	2021-10-23 04:59:38.983126+00	2021-11-18 09:21:30.275559+00	2021-10-21	17.00	1
119	2021-11-09 11:53:26.355889+00	2021-11-22 09:46:02.932714+00	2021-10-25	4.00	1
113	2021-10-26 11:31:19.06699+00	2021-11-22 09:46:02.932714+00	2021-10-26	7.00	1
114	2021-10-27 14:54:14.671449+00	2021-11-22 09:46:02.948337+00	2021-10-27	0.00	1
115	2021-10-28 05:32:55.255479+00	2021-11-22 09:46:02.948337+00	2021-10-28	42.00	1
120	2021-11-09 11:53:26.52595+00	2021-11-22 09:46:02.964013+00	2021-10-29	14.00	1
121	2021-11-09 11:53:26.542915+00	2021-11-22 09:46:02.964013+00	2021-10-30	0.00	1
159	2021-11-24 08:00:20.765083+00	2021-11-24 08:00:20.765083+00	2021-11-01	57.00	1
109	2021-10-23 04:59:38.292856+00	2021-11-22 09:46:02.87027+00	2021-10-23	23.00	1
112	2021-10-24 02:15:49.126527+00	2021-11-22 09:46:02.917142+00	2021-10-24	0.00	1
160	2021-11-24 08:00:20.768082+00	2021-11-24 08:00:20.768082+00	2021-11-02	0.00	1
161	2021-11-24 08:00:20.774078+00	2021-11-24 08:00:20.774078+00	2021-11-03	16.00	1
162	2021-11-24 08:00:20.778077+00	2021-11-24 08:00:20.778077+00	2021-11-04	0.00	1
163	2021-11-24 08:00:20.782073+00	2021-11-24 08:00:20.782073+00	2021-11-05	0.00	1
164	2021-11-24 08:00:20.78607+00	2021-11-24 08:00:20.78607+00	2021-11-06	0.00	1
165	2021-11-24 08:00:20.791068+00	2021-11-24 08:00:20.792067+00	2021-11-07	0.00	1
166	2021-11-24 08:00:20.796064+00	2021-11-24 08:00:20.796064+00	2021-11-08	0.00	1
167	2021-11-24 08:00:20.800062+00	2021-11-24 08:00:20.800062+00	2021-11-09	0.00	1
168	2021-11-24 08:00:20.80306+00	2021-11-24 08:00:20.80306+00	2021-11-10	0.00	1
169	2021-11-24 08:00:20.810058+00	2021-11-24 08:00:20.810058+00	2021-11-11	0.00	1
108	2021-10-19 12:57:05.149668+00	2021-11-18 09:21:30.228721+00	2021-10-19	36.00	1
111	2021-10-23 04:59:38.995088+00	2021-11-18 09:21:30.275559+00	2021-10-22	32.00	1
158	2021-11-24 08:00:20.586185+00	2021-11-24 14:25:31.196876+00	2021-11-24	0.00	1
170	2021-11-26 03:38:46.748306+00	2021-11-26 03:38:46.748306+00	2021-11-26	0.00	1
171	2021-12-02 16:09:23.206939+00	2021-12-02 16:11:08.88725+00	2021-12-02	0.00	1
172	2021-12-03 02:10:14.824031+00	2021-12-03 11:40:53.596452+00	2021-12-03	0.00	1
173	2021-12-04 01:16:17.75699+00	2021-12-04 02:45:36.633069+00	2021-12-04	0.00	1
174	2021-12-10 05:49:06.073423+00	2021-12-10 05:49:58.690679+00	2021-12-10	0.00	1
175	2021-12-11 08:17:20.042971+00	2021-12-11 08:17:25.388047+00	2021-12-11	0.00	1
176	2021-12-14 02:52:50.016915+00	2021-12-14 02:52:50.016951+00	2021-12-14	0.00	1
177	2021-12-21 04:30:22.968449+00	2021-12-21 04:30:22.968505+00	2021-12-21	0.00	1
178	2021-12-22 04:15:14.083973+00	2021-12-22 04:15:14.08401+00	2021-12-22	0.00	1
179	2022-01-05 11:02:28.276498+00	2022-01-05 11:09:36.073953+00	2022-01-05	0.00	1
\.


--
-- Data for Name: fact_chit_customers; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.fact_chit_customers (id, created, modified, chit_id, customer_id, prefered_month) FROM stdin;
20	2021-09-29 07:38:43.264367+00	2021-09-29 07:38:43.264367+00	2	18	4
12	2021-09-29 07:37:07.564998+00	2021-09-29 07:37:07.564998+00	2	28	\N
37	2021-10-17 01:11:51.601398+00	2021-10-17 01:11:51.601398+00	3	30	\N
25	2021-10-05 13:52:12.522696+00	2021-10-05 13:52:12.522696+00	3	3	1
36	2021-10-16 15:46:29.047432+00	2021-10-16 15:46:29.047432+00	3	19	\N
30	2021-10-05 13:55:51.986851+00	2021-10-05 13:55:51.986851+00	3	24	\N
26	2021-10-05 13:52:29.002842+00	2021-10-05 13:52:29.002842+00	3	8	\N
28	2021-10-05 13:52:54.053525+00	2021-10-05 13:52:54.053525+00	3	7	\N
27	2021-10-05 13:52:39.963538+00	2021-10-05 13:52:39.963538+00	3	4	\N
35	2021-10-05 13:58:43.929975+00	2021-10-05 13:58:43.929975+00	3	27	\N
34	2021-10-05 13:58:13.04655+00	2021-10-05 13:58:13.04655+00	3	26	\N
29	2021-10-05 13:53:19.459246+00	2021-10-05 13:53:19.459246+00	3	12	\N
5	2021-09-29 07:32:48.035852+00	2021-09-29 07:32:48.035852+00	2	3	1
8	2021-09-29 07:36:44.735245+00	2021-09-29 07:36:44.735245+00	2	8	2
15	2021-09-29 07:37:58.234754+00	2021-09-29 07:37:58.234754+00	2	13	3
19	2021-09-29 07:38:38.057919+00	2021-09-29 07:38:38.057919+00	2	17	\N
10	2021-09-29 07:36:58.091876+00	2021-09-29 07:36:58.091876+00	2	9	\N
21	2021-09-29 07:38:50.243596+00	2021-09-29 07:38:50.243596+00	2	19	\N
16	2021-09-29 07:38:16.626558+00	2021-09-29 07:38:16.626558+00	2	14	5
18	2021-09-29 07:38:33.094122+00	2021-09-29 07:38:33.094122+00	2	16	\N
24	2021-09-29 07:39:08.28144+00	2021-09-29 07:39:08.28144+00	2	22	\N
9	2021-09-29 07:36:52.638647+00	2021-09-29 07:36:52.638647+00	2	2	\N
22	2021-09-29 07:38:56.652116+00	2021-09-29 07:38:56.652116+00	2	20	\N
23	2021-09-29 07:39:03.019823+00	2021-09-29 07:39:03.019823+00	2	31	\N
11	2021-09-29 07:37:02.558245+00	2021-09-29 07:37:02.558245+00	2	10	\N
17	2021-09-29 07:38:25.851942+00	2021-09-29 07:38:25.851942+00	2	15	\N
7	2021-09-29 07:36:38.877556+00	2021-09-29 07:36:38.877556+00	2	7	\N
14	2021-09-29 07:37:17.804529+00	2021-09-29 07:37:17.804529+00	2	4	\N
6	2021-09-29 07:36:33.278676+00	2021-09-29 07:36:33.278676+00	2	6	\N
13	2021-09-29 07:37:12.455847+00	2021-09-29 07:37:12.455847+00	2	12	\N
\.


--
-- Data for Name: fact_chit_payment; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.fact_chit_payment (id, created, modified, paid_date, chit_id, customer_id, month) FROM stdin;
22	2021-09-29 07:45:12.051362+00	2021-09-29 07:45:12.051362+00	2021-09-29	2	17	2021-07-01
23	2021-09-29 07:45:12.731816+00	2021-09-29 07:45:12.731816+00	2021-09-29	2	9	2021-07-01
24	2021-09-29 07:45:13.868547+00	2021-09-29 07:45:13.868547+00	2021-09-29	2	19	2021-07-01
25	2021-09-29 07:45:14.569786+00	2021-09-29 07:45:14.569786+00	2021-09-29	2	13	2021-07-01
26	2021-09-29 07:45:15.669739+00	2021-09-29 07:45:15.669739+00	2021-09-29	2	14	2021-07-01
27	2021-09-29 07:45:16.395728+00	2021-09-29 07:45:16.395728+00	2021-09-29	2	16	2021-07-01
28	2021-09-29 07:45:17.606728+00	2021-09-29 07:45:17.606728+00	2021-09-29	2	22	2021-07-01
29	2021-09-29 07:45:18.350657+00	2021-09-29 07:45:18.350657+00	2021-09-29	2	8	2021-07-01
30	2021-09-29 07:45:20.427625+00	2021-09-29 07:45:20.427625+00	2021-09-29	2	2	2021-07-01
31	2021-09-29 07:45:21.089386+00	2021-09-29 07:45:21.089386+00	2021-09-29	2	20	2021-07-01
33	2021-09-29 07:45:22.536468+00	2021-09-29 07:45:22.536468+00	2021-09-29	2	10	2021-07-01
34	2021-09-29 07:45:23.24931+00	2021-09-29 07:45:23.24931+00	2021-09-29	2	15	2021-07-01
35	2021-09-29 07:45:24.006648+00	2021-09-29 07:45:24.006648+00	2021-09-29	2	7	2021-07-01
36	2021-09-29 07:45:34.170399+00	2021-09-29 07:45:34.170399+00	2021-09-29	2	18	2021-07-01
37	2021-09-29 07:45:34.437396+00	2021-09-29 07:45:34.438398+00	2021-09-29	2	4	2021-07-01
38	2021-09-29 07:45:34.5034+00	2021-09-29 07:45:34.5034+00	2021-09-29	2	3	2021-07-01
39	2021-09-29 07:45:34.997644+00	2021-09-29 07:45:34.998645+00	2021-09-29	2	6	2021-07-01
40	2021-09-29 07:45:36.410027+00	2021-09-29 07:45:36.410027+00	2021-09-29	2	12	2021-07-01
41	2021-09-29 07:45:59.404655+00	2021-09-29 07:45:59.404655+00	2021-09-29	2	17	2021-08-01
42	2021-09-29 07:46:00.084579+00	2021-09-29 07:46:00.084579+00	2021-09-29	2	9	2021-08-01
43	2021-09-29 07:46:01.108849+00	2021-09-29 07:46:01.108849+00	2021-09-29	2	19	2021-08-01
44	2021-09-29 07:46:02.120192+00	2021-09-29 07:46:02.120192+00	2021-09-29	2	13	2021-08-01
45	2021-09-29 07:46:02.941847+00	2021-09-29 07:46:02.941847+00	2021-09-29	2	14	2021-08-01
46	2021-09-29 07:46:03.66537+00	2021-09-29 07:46:03.66537+00	2021-09-29	2	16	2021-08-01
47	2021-09-29 07:46:04.333552+00	2021-09-29 07:46:04.333552+00	2021-09-29	2	22	2021-08-01
48	2021-09-29 07:46:05.416091+00	2021-09-29 07:46:05.416091+00	2021-09-29	2	8	2021-08-01
49	2021-09-29 07:46:06.11682+00	2021-09-29 07:46:06.117821+00	2021-09-29	2	2	2021-08-01
50	2021-09-29 07:46:08.06887+00	2021-09-29 07:46:08.06887+00	2021-09-29	2	20	2021-08-01
51	2021-09-29 07:46:10.228996+00	2021-09-29 07:46:10.228996+00	2021-09-29	2	10	2021-08-01
53	2021-09-29 07:46:13.218124+00	2021-09-29 07:46:13.218124+00	2021-09-29	2	15	2021-08-01
54	2021-09-29 07:46:14.250721+00	2021-09-29 07:46:14.250721+00	2021-09-29	2	7	2021-08-01
55	2021-09-29 07:46:15.164885+00	2021-09-29 07:46:15.164885+00	2021-09-29	2	4	2021-08-01
56	2021-09-29 07:46:16.208125+00	2021-09-29 07:46:16.208125+00	2021-09-29	2	18	2021-08-01
57	2021-09-29 07:46:17.132485+00	2021-09-29 07:46:17.133484+00	2021-09-29	2	3	2021-08-01
58	2021-09-29 07:46:18.275513+00	2021-09-29 07:46:18.275513+00	2021-09-29	2	6	2021-08-01
59	2021-09-29 07:46:19.532787+00	2021-09-29 07:46:19.532787+00	2021-09-29	2	12	2021-08-01
60	2021-09-29 07:46:31.513987+00	2021-09-29 07:46:31.513987+00	2021-09-29	2	17	2021-09-01
61	2021-09-29 07:46:32.739666+00	2021-09-29 07:46:32.739666+00	2021-09-29	2	9	2021-09-01
62	2021-09-29 07:46:33.441106+00	2021-09-29 07:46:33.441106+00	2021-09-29	2	19	2021-09-01
63	2021-09-29 07:46:34.316246+00	2021-09-29 07:46:34.316246+00	2021-09-29	2	13	2021-09-01
64	2021-09-29 07:46:35.015056+00	2021-09-29 07:46:35.015056+00	2021-09-29	2	14	2021-09-01
65	2021-09-29 07:46:35.987626+00	2021-09-29 07:46:35.987626+00	2021-09-29	2	16	2021-09-01
66	2021-09-29 07:46:36.867102+00	2021-09-29 07:46:36.867102+00	2021-09-29	2	22	2021-09-01
67	2021-09-29 07:46:37.782726+00	2021-09-29 07:46:37.782726+00	2021-09-29	2	8	2021-09-01
68	2021-09-29 07:46:38.745465+00	2021-09-29 07:46:38.745465+00	2021-09-29	2	2	2021-09-01
69	2021-09-29 07:46:39.48304+00	2021-09-29 07:46:39.48304+00	2021-09-29	2	20	2021-09-01
71	2021-09-29 07:46:41.181013+00	2021-09-29 07:46:41.181013+00	2021-09-29	2	10	2021-09-01
72	2021-09-29 07:46:43.087155+00	2021-09-29 07:46:43.087155+00	2021-09-29	2	15	2021-09-01
73	2021-09-29 07:46:44.416746+00	2021-09-29 07:46:44.416746+00	2021-09-29	2	7	2021-09-01
74	2021-09-29 07:46:45.16274+00	2021-09-29 07:46:45.16274+00	2021-09-29	2	4	2021-09-01
75	2021-09-29 07:46:45.955695+00	2021-09-29 07:46:45.955695+00	2021-09-29	2	18	2021-09-01
76	2021-09-29 07:46:47.143373+00	2021-09-29 07:46:47.143373+00	2021-09-29	2	3	2021-09-01
77	2021-09-29 07:46:48.806371+00	2021-09-29 07:46:48.806371+00	2021-09-29	2	6	2021-09-01
78	2021-09-29 07:46:49.630373+00	2021-09-29 07:46:49.630373+00	2021-09-29	2	12	2021-09-01
79	2021-10-01 02:29:54.041205+00	2021-10-01 02:29:54.041205+00	2021-10-01	2	12	2021-10-01
80	2021-10-01 04:08:45.880995+00	2021-10-01 04:08:45.880995+00	2021-10-01	2	22	2021-10-01
81	2021-10-01 04:09:15.851374+00	2021-10-01 04:09:15.851374+00	2021-10-01	2	20	2021-10-01
82	2021-10-01 12:21:55.371995+00	2021-10-01 12:21:55.371995+00	2021-10-01	2	16	2021-10-01
83	2021-10-03 02:09:35.554178+00	2021-10-03 02:09:35.554178+00	2021-10-03	2	15	2021-10-01
84	2021-10-03 02:09:51.896425+00	2021-10-03 02:09:51.896425+00	2021-10-03	2	10	2021-10-01
85	2021-10-04 12:30:34.739577+00	2021-10-04 12:30:34.739577+00	2021-10-04	2	17	2021-10-01
86	2021-10-04 12:33:31.747771+00	2021-10-04 12:33:31.747771+00	2021-10-04	2	9	2021-10-01
87	2021-10-04 12:33:34.584488+00	2021-10-04 12:33:34.584488+00	2021-10-04	2	2	2021-10-01
88	2021-10-04 12:33:34.79831+00	2021-10-04 12:33:34.79831+00	2021-10-04	2	4	2021-10-01
89	2021-10-04 12:33:35.974206+00	2021-10-04 12:33:35.974206+00	2021-10-04	2	3	2021-10-01
91	2021-10-05 03:49:06.566082+00	2021-10-05 03:49:06.566082+00	2021-10-05	2	19	2021-10-01
92	2021-10-05 11:39:55.147464+00	2021-10-05 11:39:55.147464+00	2021-10-05	2	18	2021-10-01
93	2021-10-05 11:47:20.290256+00	2021-10-05 11:47:20.290256+00	2021-10-05	2	7	2021-10-01
94	2021-10-05 12:02:53.174855+00	2021-10-05 12:02:53.174855+00	2021-10-05	2	8	2021-10-01
107	2021-10-29 08:27:21.996681+00	2021-10-29 08:27:21.996681+00	2021-10-29	2	14	2021-11-01
108	2021-10-31 08:19:58.896776+00	2021-10-31 08:19:58.896776+00	2021-10-31	2	3	2021-11-01
98	2021-10-11 13:33:02.260565+00	2021-10-11 13:33:02.260565+00	2021-10-11	2	13	2021-10-01
99	2021-10-16 15:20:41.563721+00	2021-10-16 15:20:41.563721+00	2021-10-16	2	6	2021-10-01
100	2021-10-29 06:52:27.443914+00	2021-10-29 06:52:27.443914+00	2021-10-29	2	12	2021-11-01
101	2021-10-29 06:52:48.215258+00	2021-10-29 06:52:48.215258+00	2021-10-29	2	14	2021-10-01
102	2021-10-29 08:23:54.244416+00	2021-10-29 08:23:54.244416+00	2021-10-29	2	28	2021-07-01
103	2021-10-29 08:23:57.929958+00	2021-10-29 08:23:57.929958+00	2021-10-29	2	28	2021-08-01
104	2021-10-29 08:24:01.646991+00	2021-10-29 08:24:01.646991+00	2021-10-29	2	28	2021-09-01
105	2021-10-29 08:25:02.060255+00	2021-10-29 08:25:02.060255+00	2021-10-29	2	28	2021-10-01
106	2021-10-29 08:25:10.004616+00	2021-10-29 08:25:10.004616+00	2021-10-29	2	28	2021-11-01
109	2021-10-31 08:20:01.73378+00	2021-10-31 08:20:01.73378+00	2021-10-31	2	2	2021-11-01
110	2021-11-01 05:37:32.623661+00	2021-11-01 05:37:32.624662+00	2021-11-01	2	16	2021-11-01
111	2021-11-01 05:40:17.528427+00	2021-11-01 05:40:17.528427+00	2021-11-01	2	20	2021-11-01
112	2021-11-01 05:50:13.824684+00	2021-11-01 05:50:13.824684+00	2021-11-01	3	3	2021-11-01
113	2021-11-01 05:50:15.221186+00	2021-11-01 05:50:15.221186+00	2021-11-01	3	4	2021-11-01
114	2021-11-01 06:07:25.582417+00	2021-11-01 06:07:25.582417+00	2021-11-01	2	10	2021-11-01
115	2021-11-01 06:07:29.988692+00	2021-11-01 06:07:29.988692+00	2021-11-01	2	18	2021-11-01
116	2021-11-01 06:11:11.947599+00	2021-11-01 06:11:11.953012+00	2021-11-01	2	22	2021-11-01
117	2021-11-01 06:22:15.486343+00	2021-11-01 06:22:15.486343+00	2021-11-01	2	15	2021-11-01
118	2021-11-08 17:17:35.036453+00	2021-11-08 17:17:35.036453+00	2021-11-08	2	17	2021-11-01
119	2021-11-08 17:17:37.2493+00	2021-11-08 17:17:37.2493+00	2021-11-08	2	9	2021-11-01
120	2021-11-08 17:17:37.96541+00	2021-11-08 17:17:37.96541+00	2021-11-08	2	19	2021-11-01
121	2021-11-08 17:17:39.859953+00	2021-11-08 17:17:39.859953+00	2021-11-08	2	8	2021-11-01
122	2021-11-08 17:17:43.058643+00	2021-11-08 17:17:43.058643+00	2021-11-08	2	7	2021-11-01
123	2021-11-08 17:17:43.499625+00	2021-11-08 17:17:43.499625+00	2021-11-08	2	4	2021-11-01
124	2021-11-08 17:17:44.297843+00	2021-11-08 17:17:44.297843+00	2021-11-08	2	6	2021-11-01
125	2021-11-08 17:19:56.46986+00	2021-11-08 17:19:56.46986+00	2021-11-08	3	30	2021-11-01
126	2021-11-08 17:20:02.448901+00	2021-11-08 17:20:02.448901+00	2021-11-08	3	19	2021-11-01
127	2021-11-08 17:20:05.320569+00	2021-11-08 17:20:05.320569+00	2021-11-08	3	24	2021-11-01
128	2021-11-08 17:20:05.695238+00	2021-11-08 17:20:05.695238+00	2021-11-08	3	8	2021-11-01
129	2021-11-08 17:20:06.558151+00	2021-11-08 17:20:06.558151+00	2021-11-08	3	7	2021-11-01
130	2021-11-08 17:20:09.545617+00	2021-11-08 17:20:09.545617+00	2021-11-08	3	12	2021-11-01
131	2021-11-10 08:37:55.962292+00	2021-11-10 08:37:55.962292+00	2021-11-10	3	26	2021-11-01
132	2021-11-10 08:37:58.499712+00	2021-11-10 08:37:58.499712+00	2021-11-10	3	27	2021-11-01
133	2021-11-12 06:55:53.168614+00	2021-11-12 06:55:53.168614+00	2021-11-12	2	31	2021-07-01
134	2021-11-12 06:55:56.330425+00	2021-11-12 06:55:56.330425+00	2021-11-12	2	31	2021-08-01
135	2021-11-12 06:55:59.572045+00	2021-11-12 06:55:59.572045+00	2021-11-12	2	31	2021-09-01
136	2021-11-12 06:56:05.461385+00	2021-11-12 06:56:05.461385+00	2021-11-12	2	31	2021-10-01
137	2021-11-12 06:56:12.73024+00	2021-11-12 06:56:12.73024+00	2021-11-12	2	31	2021-11-01
138	2021-11-12 16:16:42.873096+00	2021-11-12 16:16:42.873096+00	2021-11-12	2	13	2021-11-01
139	2021-12-03 01:35:24.844693+00	2021-12-03 01:35:24.844725+00	2021-12-03	2	12	2021-12-01
140	2021-12-03 01:35:32.3292+00	2021-12-03 01:35:32.329226+00	2021-12-03	2	14	2021-12-01
141	2021-12-03 01:35:38.234082+00	2021-12-03 01:35:38.234118+00	2021-12-03	2	18	2021-12-01
142	2021-12-03 01:35:43.878922+00	2021-12-03 01:35:43.878948+00	2021-12-03	2	22	2021-12-01
143	2021-12-03 01:35:48.434277+00	2021-12-03 01:35:48.434306+00	2021-12-03	2	10	2021-12-01
144	2021-12-03 01:38:20.361329+00	2021-12-03 01:38:20.361361+00	2021-12-03	2	2	2021-12-01
145	2021-12-03 01:38:22.77499+00	2021-12-03 01:38:22.775013+00	2021-12-03	2	3	2021-12-01
146	2021-12-03 01:38:23.531592+00	2021-12-03 01:38:23.531617+00	2021-12-03	2	31	2021-12-01
147	2021-12-03 01:38:41.673746+00	2021-12-03 01:38:41.673773+00	2021-12-03	3	3	2021-12-01
148	2021-12-03 01:38:43.748766+00	2021-12-03 01:38:43.748795+00	2021-12-03	3	4	2021-12-01
149	2021-12-03 01:38:59.362962+00	2021-12-03 01:38:59.36299+00	2021-12-03	3	12	2021-12-01
150	2021-12-03 12:26:23.908945+00	2021-12-03 12:26:23.908971+00	2021-12-03	2	9	2021-12-01
151	2021-12-03 12:26:25.940977+00	2021-12-03 12:26:25.941004+00	2021-12-03	2	4	2021-12-01
152	2021-12-03 12:41:08.859162+00	2021-12-03 12:41:08.8592+00	2021-12-03	2	19	2021-12-01
153	2021-12-03 12:41:10.62007+00	2021-12-03 12:41:10.620118+00	2021-12-03	2	16	2021-12-01
154	2021-12-03 12:41:18.339867+00	2021-12-03 12:41:18.339899+00	2021-12-03	2	15	2021-12-01
155	2021-12-03 12:41:19.342476+00	2021-12-03 12:41:19.342503+00	2021-12-03	2	7	2021-12-01
156	2021-12-03 12:41:30.13763+00	2021-12-03 12:41:30.137663+00	2021-12-03	3	30	2021-12-01
157	2021-12-03 12:41:31.128627+00	2021-12-03 12:41:31.128656+00	2021-12-03	3	7	2021-12-01
158	2021-12-03 12:41:36.491883+00	2021-12-03 12:41:36.491913+00	2021-12-03	3	24	2021-12-01
159	2021-12-03 12:41:44.404968+00	2021-12-03 12:41:44.404993+00	2021-12-03	3	19	2021-12-01
160	2021-12-04 01:17:08.430822+00	2021-12-04 01:17:08.430864+00	2021-12-04	2	6	2021-12-01
161	2021-12-04 01:34:50.291006+00	2021-12-04 01:34:50.291039+00	2021-12-04	2	20	2021-12-01
162	2021-12-05 03:22:46.058111+00	2021-12-05 03:22:46.058157+00	2021-12-05	2	17	2021-12-01
163	2021-12-06 03:03:54.134038+00	2021-12-06 03:03:54.134084+00	2021-12-06	3	8	2021-12-01
164	2021-12-06 03:04:04.578537+00	2021-12-06 03:04:04.57857+00	2021-12-06	2	8	2021-12-01
165	2021-12-06 08:34:58.904189+00	2021-12-06 08:34:58.904217+00	2021-12-06	3	27	2021-12-01
166	2021-12-10 04:58:46.352023+00	2021-12-10 04:58:46.35206+00	2021-12-10	2	13	2021-12-01
167	2021-12-11 03:56:52.801109+00	2021-12-11 03:56:52.801154+00	2021-12-11	3	26	2021-12-01
168	2022-01-01 12:39:39.751953+00	2022-01-01 12:39:39.751986+00	2022-01-01	2	28	2021-12-01
169	2022-01-01 12:51:02.609117+00	2022-01-01 12:51:02.60915+00	2022-01-01	2	12	2022-01-01
170	2022-01-01 12:51:06.84348+00	2022-01-01 12:51:06.843515+00	2022-01-01	3	12	2022-01-01
171	2022-01-01 12:51:27.748519+00	2022-01-01 12:51:27.748552+00	2022-01-01	2	20	2022-01-01
172	2022-01-01 12:51:33.68245+00	2022-01-01 12:51:33.682483+00	2022-01-01	2	10	2022-01-01
173	2022-01-01 12:51:35.990285+00	2022-01-01 12:51:35.990324+00	2022-01-01	3	4	2022-01-01
174	2022-01-01 12:52:07.394404+00	2022-01-01 12:52:07.394437+00	2022-01-01	2	8	2022-01-01
175	2022-01-01 12:52:09.570227+00	2022-01-01 12:52:09.57026+00	2022-01-01	3	8	2022-01-01
176	2022-01-01 12:52:17.794212+00	2022-01-01 12:52:17.794245+00	2022-01-01	2	18	2022-01-01
177	2022-01-01 12:52:25.278504+00	2022-01-01 12:52:25.278538+00	2022-01-01	2	14	2022-01-01
178	2022-01-02 12:52:23.509644+00	2022-01-02 12:52:23.509675+00	2022-01-02	2	16	2022-01-01
179	2022-01-02 12:52:32.667958+00	2022-01-02 12:52:32.667994+00	2022-01-02	2	22	2022-01-01
180	2022-01-02 12:52:34.827408+00	2022-01-02 12:52:34.827443+00	2022-01-02	2	2	2022-01-01
181	2022-01-02 12:52:37.263574+00	2022-01-02 12:52:37.263606+00	2022-01-02	2	15	2022-01-01
182	2022-01-02 12:52:39.969762+00	2022-01-02 12:52:39.969793+00	2022-01-02	2	3	2022-01-01
183	2022-01-02 12:52:41.16383+00	2022-01-02 12:52:41.163865+00	2022-01-02	2	31	2022-01-01
184	2022-01-02 12:53:05.446458+00	2022-01-02 12:53:05.446489+00	2022-01-02	3	3	2022-01-01
185	2022-01-03 10:37:09.171192+00	2022-01-03 10:37:09.171226+00	2022-01-03	2	19	2022-01-01
186	2022-01-03 10:37:13.122273+00	2022-01-03 10:37:13.122301+00	2022-01-03	3	19	2022-01-01
187	2022-01-04 23:46:24.487837+00	2022-01-04 23:46:24.487935+00	2022-01-04	3	30	2022-01-01
188	2022-01-04 23:46:27.090384+00	2022-01-04 23:46:27.090416+00	2022-01-04	3	24	2022-01-01
189	2022-01-04 23:46:45.431049+00	2022-01-04 23:46:45.431081+00	2022-01-04	3	7	2022-01-01
190	2022-01-04 23:47:25.840037+00	2022-01-04 23:47:25.840069+00	2022-01-04	2	17	2022-01-01
191	2022-01-04 23:47:43.91585+00	2022-01-04 23:47:43.915882+00	2022-01-04	2	7	2022-01-01
192	2022-01-04 23:48:01.522011+00	2022-01-04 23:48:01.522047+00	2022-01-04	2	28	2022-01-01
194	2022-01-04 23:48:17.480144+00	2022-01-04 23:48:17.480177+00	2022-01-04	2	4	2022-01-01
193	2022-01-04 23:48:17.478667+00	2022-01-04 23:48:17.4787+00	2022-01-04	2	9	2022-01-01
197	2022-01-05 10:49:07.109491+00	2022-01-05 10:49:07.109522+00	2022-01-05	3	27	2022-01-01
198	2022-01-05 10:49:13.638206+00	2022-01-05 10:49:13.638241+00	2022-01-05	2	6	2022-01-01
\.


--
-- Data for Name: fact_chit_settlement; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.fact_chit_settlement (id, created, modified, month, paid, paid_date, chit_id, customer_id, amount, betting) FROM stdin;
13	2021-10-06 05:43:50.515288+00	2021-10-06 05:43:50.515288+00	2021-08-01	t	2021-08-05	2	8	0	\N
14	2021-10-06 05:43:56.413142+00	2021-10-06 05:43:56.413142+00	2021-09-01	t	2021-09-05	2	13	0	\N
17	2021-10-06 06:55:43.749216+00	2021-10-06 06:55:43.749216+00	2021-07-01	t	2021-10-06	2	3	0	\N
9	2021-10-06 05:33:42.800245+00	2021-10-06 11:15:52.766417+00	2021-10-01	t	2021-10-06	2	18	146000	\N
16	2021-10-06 05:44:03.101424+00	2021-11-08 17:18:56.687254+00	2021-11-01	t	2021-11-08	2	14	146000	\N
19	2021-12-03 01:36:16.046127+00	2021-12-11 08:17:04.507287+00	2021-12-01	t	2021-12-11	2	2	149000	[[2, 155000.0]]
20	2021-12-03 02:05:28.565241+00	2021-12-13 02:25:54.051832+00	2021-12-01	t	2021-12-13	3	27	50000	[[27, 50000.0]]
21	2022-01-01 12:53:08.171329+00	2022-01-01 12:53:08.171364+00	2022-01-01	f	\N	2	28	158000	[[28, 158000.0]]
22	2022-01-01 12:54:27.596284+00	2022-01-04 23:47:12.332585+00	2022-01-01	t	2022-01-04	3	4	50000	[[4, 50000.0]]
\.


--
-- Data for Name: fact_credit; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.fact_credit (id, created, modified, amount, name, paid_amount, paid_date, source_id, expected_date) FROM stdin;
1	2021-10-23 03:24:53.355308+00	2021-12-03 12:30:58.901841+00	5000.00	Pending Chit Amount	5000.00	2021-10-29	12	2021-11-05
4	2021-10-23 03:27:49.314042+00	2021-12-03 12:30:58.922087+00	31900.00	Pending Chit Amount	31900.00	2021-10-29	15	2021-10-31
5	2021-12-23 02:33:15.10605+00	2022-01-05 11:02:03.988627+00	7750.00	Pending Chit Amount	7750.00	2022-01-01	15	2022-01-01
6	2021-12-23 02:36:16.428308+00	2022-01-05 11:02:04.015304+00	4000.00	RDS Interest	0.00	\N	8	2022-01-01
\.


--
-- Data for Name: fact_emi; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.fact_emi (id, created, modified, emi_amount, start_date, end_date, card_id, source_id) FROM stdin;
\.


--
-- Data for Name: fact_finance_utilized; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.fact_finance_utilized (id, created, modified, amount, paid_amount, paid_date, status, finance_id, source_id, payment_type) FROM stdin;
2	2021-10-26 15:25:49+00	2021-10-26 15:25:49+00	941000.00	\N	2021-04-01	t	1	16	repayment
4	2021-10-26 15:26:27+00	2021-10-26 15:26:28+00	512000.00	\N	2021-04-01	t	1	7	repayment
8	2021-10-27 08:04:24.223709+00	2021-10-27 08:04:24.224712+00	412000.00	100000.00	2021-04-05	t	1	7	repayment
9	2021-10-27 08:08:03.447879+00	2021-10-27 08:08:03.447879+00	933000.00	8000.00	2021-05-20	t	1	16	repayment
11	2021-10-27 08:12:16.377811+00	2021-10-27 08:12:16.377811+00	853000.00	80000.00	2021-05-31	t	1	16	repayment
12	2021-10-27 08:12:55.011554+00	2021-10-27 08:12:55.011554+00	318000.00	94000.00	2021-06-05	t	1	7	repayment
13	2021-10-27 08:13:19.58991+00	2021-10-27 08:13:19.58991+00	803000.00	50000.00	2021-07-02	t	1	16	repayment
14	2021-10-27 08:13:48.25788+00	2021-10-27 08:13:48.25788+00	258000.00	60000.00	2021-07-22	t	1	7	repayment
19	2021-10-27 08:26:18+00	2021-10-27 08:26:19+00	350000.00	\N	2021-07-15	t	1	8	withdraw
16	2021-10-27 08:25:55.190049+00	2021-10-27 08:25:55.190049+00	818000.00	15000.00	2021-07-22	t	1	16	withdraw
30	2021-10-27 09:48:53.390625+00	2021-10-27 09:48:53.390625+00	845000.00	27000.00	2021-07-28	t	1	16	withdraw
31	2021-10-27 09:49:28.739978+00	2021-10-27 09:49:28.739978+00	227200.00	30800.00	2021-08-04	t	1	7	repayment
32	2021-10-27 09:49:53.421857+00	2021-10-27 09:49:53.421857+00	860000.00	15000.00	2021-08-30	t	1	16	withdraw
33	2021-10-27 09:50:18.591698+00	2021-10-27 09:50:18.591698+00	166300.00	60900.00	2021-08-30	t	1	7	repayment
34	2021-11-08 17:18:31.731277+00	2021-11-08 17:18:31.731277+00	135000.00	31300.00	2021-11-08	t	1	7	repayment
35	2021-11-12 11:23:36+00	2021-11-12 11:23:38+00	100000.00	\N	2021-11-12	t	1	9	withdraw
52	2021-11-15 04:50:38.237009+00	2021-11-15 04:50:38.237009+00	70000.00	30000.00	2021-11-15	t	1	9	repayment
53	2021-12-04 02:45:57.32528+00	2021-12-04 02:45:57.325314+00	760000.00	100000.00	2021-12-04	t	1	16	repayment
74	2021-12-06 15:53:15.45688+00	2021-12-06 15:53:15.456926+00	65000.00	5000.00	2021-12-06	t	1	9	repayment
54	2021-12-06 19:38:20+00	2021-12-06 19:38:21+00	100000.00	\N	2021-12-06	t	1	12	withdraw
75	2021-12-11 08:23:21.924376+00	2021-12-11 08:23:21.9245+00	710000.00	50000.00	2021-12-11	t	1	16	repayment
79	2021-12-14 15:42:01.181086+00	2021-12-14 15:42:01.18113+00	510000.00	200000.00	2021-12-14	t	1	16	repayment
86	2022-01-04 23:50:36.259181+00	2022-01-04 23:50:36.259215+00	84000.00	51000.00	2022-01-04	t	1	7	repayment
87	2022-01-05 05:32:06+00	2022-01-05 05:32:07+00	25000.00	\N	2022-01-05	t	1	48	withdraw
\.


--
-- Data for Name: fact_monthly_payment; Type: TABLE DATA; Schema: public; Owner: pms
--

COPY public.fact_monthly_payment (id, created, modified, paid_date, expense_id, amount, paid_amount, income_id, month, credit_id) FROM stdin;
4345	2021-10-31 05:38:03.496605+00	2021-10-31 05:38:03.496605+00	2021-10-16	\N	105500.00	105500.00	8	2021-10-01	\N
4346	2021-10-31 05:38:03.606301+00	2021-10-31 05:38:03.606301+00	2021-10-16	\N	30000.00	30000.00	10	2021-10-01	\N
4347	2021-10-31 05:38:03.610301+00	2021-10-31 05:38:03.610301+00	2021-10-31	\N	4000.00	4000.00	9	2021-10-01	\N
4348	2021-10-31 05:38:03.614326+00	2021-10-31 05:38:03.614326+00	2021-10-16	\N	2050.00	2050.00	15	2021-10-01	\N
4349	2021-10-31 05:38:03.618058+00	2021-10-31 05:38:03.618058+00	2021-10-16	\N	2000.00	2000.00	11	2021-10-01	\N
4350	2021-10-31 05:38:03.621475+00	2021-10-31 05:38:03.621475+00	2021-10-16	\N	1500.00	1500.00	13	2021-10-01	\N
4351	2021-10-31 05:38:03.626988+00	2021-10-31 05:38:03.626988+00	2021-10-16	\N	3700.00	3700.00	14	2021-10-01	\N
4352	2021-10-31 05:38:03.630386+00	2021-10-31 05:38:03.630386+00	2021-10-16	\N	1500.00	1500.00	12	2021-10-01	\N
4353	2021-10-31 05:38:03.633288+00	2021-10-31 05:38:03.633288+00	2021-10-16	\N	15000.00	15000.00	16	2021-10-01	\N
4354	2021-10-31 05:38:03.637482+00	2021-10-31 05:38:03.637482+00	2021-10-16	1	15500.00	15500.00	\N	2021-10-01	\N
4355	2021-10-31 05:38:03.652618+00	2021-10-31 05:38:03.652618+00	2021-10-16	3	13000.00	13000.00	\N	2021-10-01	\N
4356	2021-10-31 05:38:03.656961+00	2021-10-31 05:38:03.656961+00	2021-10-16	2	8000.00	8000.00	\N	2021-10-01	\N
4357	2021-10-31 05:38:03.66017+00	2021-10-31 05:38:03.66017+00	2021-10-16	10	10000.00	10000.00	\N	2021-10-01	\N
4358	2021-10-31 05:38:03.664466+00	2021-10-31 05:38:03.664466+00	2021-10-16	8	11350.00	11350.00	\N	2021-10-01	\N
4359	2021-10-31 05:38:03.667684+00	2021-10-31 05:38:03.667684+00	2021-10-16	4	6000.00	6000.00	\N	2021-10-01	\N
4360	2021-10-31 05:38:03.672974+00	2021-10-31 05:38:03.672974+00	2021-10-16	5	1000.00	1000.00	\N	2021-10-01	\N
4361	2021-10-31 05:38:03.676756+00	2021-10-31 05:38:03.676756+00	2021-10-16	6	1600.00	1600.00	\N	2021-10-01	\N
4362	2021-10-31 05:38:03.680331+00	2021-10-31 05:38:03.680331+00	2021-10-16	7	11000.00	11000.00	\N	2021-10-01	\N
4363	2021-10-31 05:38:03.684067+00	2021-10-31 05:38:03.684067+00	2021-10-16	11	4500.00	4500.00	\N	2021-10-01	\N
4364	2021-10-31 05:38:03.687393+00	2021-10-31 05:38:03.687393+00	2021-10-16	9	64900.00	64900.00	\N	2021-10-01	\N
4365	2021-10-31 05:38:03.691722+00	2021-10-31 05:38:03.691722+00	2021-10-16	13	3000.00	3000.00	\N	2021-10-01	\N
4366	2021-10-31 05:38:03.695355+00	2021-10-31 05:38:03.695355+00	2021-10-16	12	3000.00	3000.00	\N	2021-10-01	\N
7996	2021-12-26 14:32:45.413464+00	2021-12-26 14:32:45.413518+00	2021-11-24	23	24450.00	24450.00	\N	2021-12-01	\N
5603	2021-11-26 01:19:28.203977+00	2021-11-26 01:19:28.203977+00	2021-10-29	\N	105500.00	105500.00	8	2021-11-01	\N
5604	2021-11-26 01:19:28.305592+00	2021-11-26 01:19:28.305592+00	2021-10-23	\N	29000.00	29000.00	10	2021-11-01	\N
5605	2021-11-26 01:19:28.368831+00	2021-11-26 01:19:28.36983+00	2021-11-23	\N	4000.00	4000.00	9	2021-11-01	\N
5606	2021-11-26 01:19:28.422336+00	2021-11-26 01:19:28.422336+00	2021-11-08	\N	2000.00	2000.00	11	2021-11-01	\N
5607	2021-11-26 01:19:28.425782+00	2021-11-26 01:19:28.425782+00	2021-11-08	\N	2050.00	2050.00	15	2021-11-01	\N
5608	2021-11-26 01:19:28.42878+00	2021-11-26 01:19:28.42878+00	2021-11-08	\N	1500.00	1500.00	13	2021-11-01	\N
5609	2021-11-26 01:19:28.432351+00	2021-11-26 01:19:28.432351+00	2021-11-01	\N	3400.00	3400.00	17	2021-11-01	\N
5610	2021-11-26 01:19:28.43636+00	2021-11-26 01:19:28.43636+00	2021-11-08	\N	1500.00	1500.00	12	2021-11-01	\N
5611	2021-11-26 01:19:28.441203+00	2021-11-26 01:19:28.441203+00	2021-10-31	\N	11974.81	11974.81	19	2021-11-01	\N
5612	2021-11-26 01:19:28.444201+00	2021-11-26 01:19:28.444201+00	2021-11-08	\N	4156.25	4156.25	18	2021-11-01	\N
5613	2021-11-26 01:19:28.447721+00	2021-11-26 01:19:28.447721+00	2021-10-29	\N	31900.00	31900.00	\N	2021-11-01	4
5614	2021-11-26 01:19:28.456859+00	2021-11-26 01:19:28.456859+00	2021-10-29	\N	5000.00	5000.00	\N	2021-11-01	1
5615	2021-11-26 01:19:28.460856+00	2021-11-26 01:19:28.460856+00	2021-10-31	1	15500.00	15500.00	\N	2021-11-01	\N
5616	2021-11-26 01:19:28.481941+00	2021-11-26 01:19:28.481941+00	2021-10-31	3	13000.00	13000.00	\N	2021-11-01	\N
5617	2021-11-26 01:19:28.485939+00	2021-11-26 01:19:28.485939+00	2021-11-08	2	8000.00	8000.00	\N	2021-11-01	\N
5618	2021-11-26 01:19:28.488928+00	2021-11-26 01:19:28.488928+00	2021-11-08	10	16343.56	16343.56	\N	2021-11-01	\N
5619	2021-11-26 01:19:28.491928+00	2021-11-26 01:19:28.491928+00	2021-10-31	8	9200.00	9200.00	\N	2021-11-01	\N
5620	2021-11-26 01:19:28.494931+00	2021-11-26 01:19:28.494931+00	2021-10-31	15	5000.00	5000.00	\N	2021-11-01	\N
5621	2021-11-26 01:19:28.497931+00	2021-11-26 01:19:28.497931+00	2021-10-31	4	6000.00	6000.00	\N	2021-11-01	\N
5622	2021-11-26 01:19:28.502921+00	2021-11-26 01:19:28.502921+00	2021-10-31	5	1000.00	1000.00	\N	2021-11-01	\N
5623	2021-11-26 01:19:28.50692+00	2021-11-26 01:19:28.50692+00	2021-10-31	6	1600.00	1600.00	\N	2021-11-01	\N
5624	2021-11-26 01:19:28.510529+00	2021-11-26 01:19:28.510529+00	2021-11-08	7	11000.00	11000.00	\N	2021-11-01	\N
5625	2021-11-26 01:19:28.514188+00	2021-11-26 01:19:28.514188+00	2021-10-31	14	2500.00	2500.00	\N	2021-11-01	\N
5626	2021-11-26 01:19:28.517131+00	2021-11-26 01:19:28.517131+00	2021-10-29	19	31900.00	31900.00	\N	2021-11-01	\N
5627	2021-11-26 01:19:28.521053+00	2021-11-26 01:19:28.521053+00	2021-11-12	22	2000.00	2000.00	\N	2021-11-01	\N
5628	2021-11-26 01:19:28.525051+00	2021-11-26 01:19:28.525051+00	2021-10-31	21	380.00	380.00	\N	2021-11-01	\N
5629	2021-11-26 01:19:28.529012+00	2021-11-26 01:19:28.529012+00	2021-10-31	18	34000.00	34000.00	\N	2021-11-01	\N
5630	2021-11-26 01:19:28.532781+00	2021-11-26 01:19:28.532781+00	2021-10-31	20	3420.00	3420.00	\N	2021-11-01	\N
5631	2021-11-26 01:19:28.536779+00	2021-11-26 01:19:28.536779+00	2021-10-31	9	30900.00	30900.00	\N	2021-11-01	\N
9593	2022-01-05 01:47:16.65562+00	2022-01-05 01:47:16.65568+00	2022-01-01	\N	106000.00	106000.00	8	2022-01-01	\N
9594	2022-01-05 01:47:16.66695+00	2022-01-05 01:47:16.666985+00	\N	\N	63000.00	0.00	22	2022-01-01	\N
9595	2022-01-05 01:47:16.670385+00	2022-01-05 01:47:16.670443+00	2021-12-25	\N	35000.00	35000.00	10	2022-01-01	\N
9596	2022-01-05 01:47:16.674617+00	2022-01-05 01:47:16.674685+00	\N	\N	771.88	0.00	21	2022-01-01	\N
9597	2022-01-05 01:47:16.67847+00	2022-01-05 01:47:16.678503+00	\N	\N	2000.00	0.00	11	2022-01-01	\N
9598	2022-01-05 01:47:16.681395+00	2022-01-05 01:47:16.681426+00	\N	\N	2050.00	0.00	15	2022-01-01	\N
9599	2022-01-05 01:47:16.684477+00	2022-01-05 01:47:16.68451+00	2022-01-04	\N	1500.00	1500.00	13	2022-01-01	\N
9600	2022-01-05 01:47:16.687154+00	2022-01-05 01:47:16.687185+00	2022-01-01	\N	3400.00	3400.00	17	2022-01-01	\N
9601	2022-01-05 01:47:16.690684+00	2022-01-05 01:47:16.690719+00	2022-01-04	\N	1603.13	1603.13	19	2022-01-01	\N
9602	2022-01-05 01:47:16.693714+00	2022-01-05 01:47:16.693746+00	2022-01-04	\N	1500.00	1500.00	12	2022-01-01	\N
9460	2022-01-05 00:04:26.589342+00	2022-01-05 00:04:26.589377+00	\N	\N	105000.00	0.00	22	2022-04-01	\N
9461	2022-01-05 00:04:26.598425+00	2022-01-05 00:04:26.598461+00	\N	\N	105500.00	0.00	8	2022-04-01	\N
9462	2022-01-05 00:04:26.602033+00	2022-01-05 00:04:26.602089+00	\N	\N	35000.00	0.00	10	2022-04-01	\N
9463	2022-01-05 00:04:26.605862+00	2022-01-05 00:04:26.605895+00	\N	\N	2050.00	0.00	15	2022-04-01	\N
9464	2022-01-05 00:04:26.60893+00	2022-01-05 00:04:26.608964+00	\N	\N	771.88	0.00	21	2022-04-01	\N
9465	2022-01-05 00:04:26.611812+00	2022-01-05 00:04:26.611846+00	\N	\N	2000.00	0.00	11	2022-04-01	\N
9513	2022-01-05 00:04:35.547028+00	2022-01-05 00:04:35.547081+00	\N	\N	105500.00	0.00	8	2022-03-01	\N
9514	2022-01-05 00:04:35.560113+00	2022-01-05 00:04:35.560147+00	\N	\N	105000.00	0.00	22	2022-03-01	\N
9515	2022-01-05 00:04:35.563521+00	2022-01-05 00:04:35.56358+00	\N	\N	35000.00	0.00	10	2022-03-01	\N
9516	2022-01-05 00:04:35.567101+00	2022-01-05 00:04:35.567157+00	\N	\N	2000.00	0.00	11	2022-03-01	\N
9517	2022-01-05 00:04:35.571383+00	2022-01-05 00:04:35.571439+00	\N	\N	831.25	0.00	21	2022-03-01	\N
9518	2022-01-05 00:04:35.575148+00	2022-01-05 00:04:35.575183+00	\N	\N	2050.00	0.00	15	2022-03-01	\N
9519	2022-01-05 00:04:35.57841+00	2022-01-05 00:04:35.578462+00	\N	\N	1500.00	0.00	13	2022-03-01	\N
9603	2022-01-05 01:47:16.696446+00	2022-01-05 01:47:16.696476+00	\N	\N	4156.25	0.00	18	2022-01-01	\N
9604	2022-01-05 01:47:16.699476+00	2022-01-05 01:47:16.699546+00	2022-01-04	\N	1187.50	1187.50	23	2022-01-01	\N
9605	2022-01-05 01:47:16.702903+00	2022-01-05 01:47:16.702938+00	\N	\N	4000.00	0.00	\N	2022-01-01	6
9606	2022-01-05 01:47:16.708691+00	2022-01-05 01:47:16.708727+00	2022-01-01	\N	7750.00	7750.00	\N	2022-01-01	5
9607	2022-01-05 01:47:16.712179+00	2022-01-05 01:47:16.712212+00	2022-01-01	1	15500.00	15500.00	\N	2022-01-01	\N
9608	2022-01-05 01:47:16.720026+00	2022-01-05 01:47:16.720062+00	2022-01-01	3	13000.00	13000.00	\N	2022-01-01	\N
9609	2022-01-05 01:47:16.723395+00	2022-01-05 01:47:16.723438+00	2022-01-05	2	8000.00	8000.00	\N	2022-01-01	\N
9610	2022-01-05 01:47:16.726983+00	2022-01-05 01:47:16.72702+00	2022-01-04	26	2050.00	2050.00	\N	2022-01-01	\N
9611	2022-01-05 01:47:16.730103+00	2022-01-05 01:47:16.730136+00	2022-01-02	10	14829.00	14829.00	\N	2022-01-01	\N
9520	2022-01-05 00:04:35.581723+00	2022-01-05 00:04:35.581756+00	\N	\N	3400.00	0.00	17	2022-03-01	\N
9521	2022-01-05 00:04:35.586145+00	2022-01-05 00:04:35.586182+00	\N	\N	1603.13	0.00	19	2022-03-01	\N
9522	2022-01-05 00:04:35.589777+00	2022-01-05 00:04:35.589821+00	\N	\N	1500.00	0.00	12	2022-03-01	\N
9523	2022-01-05 00:04:35.593526+00	2022-01-05 00:04:35.593563+00	\N	\N	4200.00	0.00	18	2022-03-01	\N
9524	2022-01-05 00:04:35.596834+00	2022-01-05 00:04:35.596886+00	\N	\N	296.88	0.00	24	2022-03-01	\N
9525	2022-01-05 00:04:35.600608+00	2022-01-05 00:04:35.600655+00	\N	\N	1187.50	0.00	23	2022-03-01	\N
9526	2022-01-05 00:04:35.605583+00	2022-01-05 00:04:35.605616+00	\N	1	15500.00	0.00	\N	2022-03-01	\N
9527	2022-01-05 00:04:35.61504+00	2022-01-05 00:04:35.615079+00	\N	3	13000.00	0.00	\N	2022-03-01	\N
9528	2022-01-05 00:04:35.620469+00	2022-01-05 00:04:35.620508+00	\N	2	8000.00	0.00	\N	2022-03-01	\N
9612	2022-01-05 01:47:16.733291+00	2022-01-05 01:47:16.733327+00	2022-01-01	24	20000.00	20000.00	\N	2022-01-01	\N
9613	2022-01-05 01:47:16.738043+00	2022-01-05 01:47:16.738081+00	2022-01-01	8	17700.00	17700.00	\N	2022-01-01	\N
9614	2022-01-05 01:47:16.742291+00	2022-01-05 01:47:16.742324+00	2022-01-01	15	5000.00	5000.00	\N	2022-01-01	\N
9615	2022-01-05 01:47:16.74554+00	2022-01-05 01:47:16.745574+00	2022-01-01	4	8000.00	8000.00	\N	2022-01-01	\N
9616	2022-01-05 01:47:16.748374+00	2022-01-05 01:47:16.748409+00	2022-01-01	5	1000.00	1000.00	\N	2022-01-01	\N
9617	2022-01-05 01:47:16.751174+00	2022-01-05 01:47:16.751206+00	\N	6	2100.00	0.00	\N	2022-01-01	\N
9618	2022-01-05 01:47:16.754082+00	2022-01-05 01:47:16.754114+00	\N	7	11000.00	0.00	\N	2022-01-01	\N
9619	2022-01-05 01:47:16.757399+00	2022-01-05 01:47:16.757437+00	2022-01-01	9	5600.00	5600.00	\N	2022-01-01	\N
9620	2022-01-05 01:47:16.76031+00	2022-01-05 01:47:16.760342+00	2022-01-01	14	2050.00	2050.00	\N	2022-01-01	\N
9621	2022-01-05 01:47:16.763289+00	2022-01-05 01:47:16.763323+00	2021-12-26	20	64000.00	29000.00	\N	2022-01-01	\N
9486	2022-01-05 00:04:26.693895+00	2022-01-05 00:04:26.693944+00	\N	10	13466.25	\N	\N	2022-04-01	\N
9622	2022-01-05 01:47:16.76613+00	2022-01-05 01:47:16.766162+00	2022-01-01	27	3000.00	3000.00	\N	2022-01-01	\N
9466	2022-01-05 00:04:26.615646+00	2022-01-05 00:04:26.615682+00	\N	\N	1500.00	0.00	13	2022-04-01	\N
9467	2022-01-05 00:04:26.61954+00	2022-01-05 00:04:26.619687+00	\N	\N	3400.00	0.00	17	2022-04-01	\N
9468	2022-01-05 00:04:26.622797+00	2022-01-05 00:04:26.622834+00	\N	\N	2000.00	0.00	19	2022-04-01	\N
9469	2022-01-05 00:04:26.625643+00	2022-01-05 00:04:26.625679+00	\N	\N	1500.00	0.00	12	2022-04-01	\N
9470	2022-01-05 00:04:26.628439+00	2022-01-05 00:04:26.628472+00	\N	\N	4200.00	0.00	18	2022-04-01	\N
9471	2022-01-05 00:04:26.631201+00	2022-01-05 00:04:26.631233+00	\N	\N	1187.50	0.00	23	2022-04-01	\N
9472	2022-01-05 00:04:26.635198+00	2022-01-05 00:04:26.635253+00	\N	\N	296.88	0.00	24	2022-04-01	\N
9473	2022-01-05 00:04:26.63862+00	2022-01-05 00:04:26.638653+00	\N	1	15500.00	0.00	\N	2022-04-01	\N
9474	2022-01-05 00:04:26.646199+00	2022-01-05 00:04:26.646242+00	\N	3	13000.00	0.00	\N	2022-04-01	\N
9475	2022-01-05 00:04:26.649277+00	2022-01-05 00:04:26.649329+00	\N	2	8000.00	0.00	\N	2022-04-01	\N
9476	2022-01-05 00:04:26.653198+00	2022-01-05 00:04:26.65326+00	\N	26	2050.00	0.00	\N	2022-04-01	\N
9477	2022-01-05 00:04:26.656376+00	2022-01-05 00:04:26.656412+00	\N	24	20000.00	0.00	\N	2022-04-01	\N
9478	2022-01-05 00:04:26.659395+00	2022-01-05 00:04:26.65943+00	\N	8	19050.00	0.00	\N	2022-04-01	\N
9479	2022-01-05 00:04:26.66236+00	2022-01-05 00:04:26.6624+00	\N	15	5000.00	0.00	\N	2022-04-01	\N
9480	2022-01-05 00:04:26.665409+00	2022-01-05 00:04:26.665443+00	\N	4	8000.00	0.00	\N	2022-04-01	\N
9481	2022-01-05 00:04:26.669356+00	2022-01-05 00:04:26.669414+00	\N	5	1000.00	0.00	\N	2022-04-01	\N
9482	2022-01-05 00:04:26.673895+00	2022-01-05 00:04:26.673934+00	\N	6	2100.00	0.00	\N	2022-04-01	\N
9483	2022-01-05 00:04:26.67691+00	2022-01-05 00:04:26.676943+00	\N	7	11000.00	0.00	\N	2022-04-01	\N
9484	2022-01-05 00:04:26.679965+00	2022-01-05 00:04:26.68+00	\N	14	2050.00	0.00	\N	2022-04-01	\N
9485	2022-01-05 00:04:26.683197+00	2022-01-05 00:04:26.683269+00	\N	9	4500.00	0.00	\N	2022-04-01	\N
7968	2021-12-26 14:32:45.247743+00	2021-12-26 14:32:45.247779+00	2021-11-30	\N	106000.00	106000.00	8	2021-12-01	\N
7969	2021-12-26 14:32:45.287738+00	2021-12-26 14:32:45.287798+00	2021-11-26	\N	35000.00	35000.00	10	2021-12-01	\N
7970	2021-12-26 14:32:45.291583+00	2021-12-26 14:32:45.291618+00	2021-12-16	\N	4000.00	4000.00	9	2021-12-01	\N
7971	2021-12-26 14:32:45.294714+00	2021-12-26 14:32:45.294749+00	2021-12-06	\N	2050.00	2050.00	15	2021-12-01	\N
7972	2021-12-26 14:32:45.298212+00	2021-12-26 14:32:45.29825+00	2021-12-06	\N	831.25	831.25	21	2021-12-01	\N
7973	2021-12-26 14:32:45.303275+00	2021-12-26 14:32:45.303323+00	2021-12-06	\N	2000.00	2000.00	11	2021-12-01	\N
7974	2021-12-26 14:32:45.306833+00	2021-12-26 14:32:45.306917+00	2021-12-02	\N	1500.00	1500.00	13	2021-12-01	\N
7975	2021-12-26 14:32:45.310358+00	2021-12-26 14:32:45.310443+00	2021-12-03	\N	3400.00	3400.00	17	2021-12-01	\N
7976	2021-12-26 14:32:45.314103+00	2021-12-26 14:32:45.314138+00	2021-12-03	\N	1500.00	1500.00	12	2021-12-01	\N
7977	2021-12-26 14:32:45.319713+00	2021-12-26 14:32:45.319891+00	2021-12-03	\N	1603.12	1603.12	19	2021-12-01	\N
7978	2021-12-26 14:32:45.323821+00	2021-12-26 14:32:45.323871+00	2021-12-02	\N	4156.25	4156.25	18	2021-12-01	\N
7979	2021-12-26 14:32:45.32752+00	2021-12-26 14:32:45.327554+00	2021-12-02	1	15500.00	15500.00	\N	2021-12-01	\N
7980	2021-12-26 14:32:45.341084+00	2021-12-26 14:32:45.341131+00	2021-11-30	3	13000.00	13000.00	\N	2021-12-01	\N
7981	2021-12-26 14:32:45.345658+00	2021-12-26 14:32:45.345717+00	2021-12-06	2	8000.00	8000.00	\N	2021-12-01	\N
7982	2021-12-26 14:32:45.351278+00	2021-12-26 14:32:45.351355+00	2021-12-02	10	16650.00	16650.00	\N	2021-12-01	\N
7983	2021-12-26 14:32:45.356226+00	2021-12-26 14:32:45.356276+00	2021-12-03	26	2050.00	2050.00	\N	2021-12-01	\N
7984	2021-12-26 14:32:45.360938+00	2021-12-26 14:32:45.360985+00	2021-12-03	8	17250.00	17250.00	\N	2021-12-01	\N
7985	2021-12-26 14:32:45.3701+00	2021-12-26 14:32:45.370186+00	2021-12-03	15	5000.00	5000.00	\N	2021-12-01	\N
7986	2021-12-26 14:32:45.373599+00	2021-12-26 14:32:45.373632+00	2021-12-03	4	6000.00	6000.00	\N	2021-12-01	\N
7987	2021-12-26 14:32:45.377606+00	2021-12-26 14:32:45.37764+00	2021-11-30	5	1000.00	1000.00	\N	2021-12-01	\N
7988	2021-12-26 14:32:45.381091+00	2021-12-26 14:32:45.381133+00	2021-11-30	6	1600.00	1600.00	\N	2021-12-01	\N
7989	2021-12-26 14:32:45.386902+00	2021-12-26 14:32:45.386953+00	2021-12-26	7	11000.00	11000.00	\N	2021-12-01	\N
7990	2021-12-26 14:32:45.39068+00	2021-12-26 14:32:45.39072+00	2021-12-02	17	3200.00	3200.00	\N	2021-12-01	\N
7991	2021-12-26 14:32:45.393904+00	2021-12-26 14:32:45.393939+00	2021-12-02	14	2100.00	2100.00	\N	2021-12-01	\N
7992	2021-12-26 14:32:45.39717+00	2021-12-26 14:32:45.397209+00	2021-12-02	9	5650.00	5650.00	\N	2021-12-01	\N
7993	2021-12-26 14:32:45.40173+00	2021-12-26 14:32:45.401789+00	2021-12-22	12	3000.00	3000.00	\N	2021-12-01	\N
7994	2021-12-26 14:32:45.405356+00	2021-12-26 14:32:45.405393+00	2021-12-03	20	10550.00	10550.00	\N	2021-12-01	\N
7995	2021-12-26 14:32:45.408624+00	2021-12-26 14:32:45.408672+00	2021-12-06	27	4000.00	4000.00	\N	2021-12-01	\N
9539	2022-01-05 00:04:35.669251+00	2022-01-05 00:04:35.669289+00	\N	10	13466.25	\N	\N	2022-03-01	\N
9529	2022-01-05 00:04:35.624206+00	2022-01-05 00:04:35.624243+00	\N	26	2050.00	0.00	\N	2022-03-01	\N
9530	2022-01-05 00:04:35.628093+00	2022-01-05 00:04:35.628148+00	\N	8	18600.00	0.00	\N	2022-03-01	\N
9531	2022-01-05 00:04:35.631546+00	2022-01-05 00:04:35.631581+00	\N	24	20000.00	0.00	\N	2022-03-01	\N
9532	2022-01-05 00:04:35.636174+00	2022-01-05 00:04:35.636219+00	\N	15	5000.00	0.00	\N	2022-03-01	\N
9533	2022-01-05 00:04:35.639465+00	2022-01-05 00:04:35.63952+00	\N	4	8000.00	0.00	\N	2022-03-01	\N
9534	2022-01-05 00:04:35.642658+00	2022-01-05 00:04:35.642715+00	\N	5	1000.00	0.00	\N	2022-03-01	\N
9535	2022-01-05 00:04:35.64633+00	2022-01-05 00:04:35.646395+00	\N	6	2100.00	0.00	\N	2022-03-01	\N
9536	2022-01-05 00:04:35.650971+00	2022-01-05 00:04:35.651051+00	\N	7	11000.00	0.00	\N	2022-03-01	\N
9537	2022-01-05 00:04:35.654673+00	2022-01-05 00:04:35.654715+00	\N	14	2050.00	0.00	\N	2022-03-01	\N
9538	2022-01-05 00:04:35.657919+00	2022-01-05 00:04:35.657952+00	\N	9	4500.00	0.00	\N	2022-03-01	\N
9592	2022-01-05 00:04:50.36234+00	2022-01-05 00:04:50.362377+00	\N	10	13466.25	\N	\N	2022-02-01	\N
9566	2022-01-05 00:04:50.254122+00	2022-01-05 00:04:50.254157+00	\N	\N	105000.00	0.00	22	2022-02-01	\N
9567	2022-01-05 00:04:50.264376+00	2022-01-05 00:04:50.26442+00	\N	\N	105500.00	0.00	8	2022-02-01	\N
9568	2022-01-05 00:04:50.268556+00	2022-01-05 00:04:50.268595+00	\N	\N	35000.00	0.00	10	2022-02-01	\N
9569	2022-01-05 00:04:50.272011+00	2022-01-05 00:04:50.272072+00	\N	\N	771.88	0.00	21	2022-02-01	\N
9570	2022-01-05 00:04:50.275082+00	2022-01-05 00:04:50.275121+00	\N	\N	2050.00	0.00	15	2022-02-01	\N
9571	2022-01-05 00:04:50.277987+00	2022-01-05 00:04:50.278018+00	\N	\N	2000.00	0.00	11	2022-02-01	\N
9572	2022-01-05 00:04:50.280986+00	2022-01-05 00:04:50.281016+00	\N	\N	1500.00	0.00	13	2022-02-01	\N
9573	2022-01-05 00:04:50.285449+00	2022-01-05 00:04:50.285491+00	\N	\N	3400.00	0.00	17	2022-02-01	\N
9574	2022-01-05 00:04:50.288566+00	2022-01-05 00:04:50.2886+00	\N	\N	997.50	0.00	19	2022-02-01	\N
9575	2022-01-05 00:04:50.29152+00	2022-01-05 00:04:50.291576+00	\N	\N	1500.00	0.00	12	2022-02-01	\N
9576	2022-01-05 00:04:50.294518+00	2022-01-05 00:04:50.294553+00	\N	\N	4200.00	0.00	18	2022-02-01	\N
9577	2022-01-05 00:04:50.2975+00	2022-01-05 00:04:50.297533+00	\N	\N	1187.50	0.00	23	2022-02-01	\N
9578	2022-01-05 00:04:50.301191+00	2022-01-05 00:04:50.301224+00	\N	\N	296.88	0.00	24	2022-02-01	\N
9579	2022-01-05 00:04:50.304774+00	2022-01-05 00:04:50.30481+00	\N	1	15500.00	0.00	\N	2022-02-01	\N
9580	2022-01-05 00:04:50.313126+00	2022-01-05 00:04:50.313182+00	\N	3	13000.00	0.00	\N	2022-02-01	\N
9581	2022-01-05 00:04:50.318268+00	2022-01-05 00:04:50.318304+00	\N	2	8000.00	0.00	\N	2022-02-01	\N
9582	2022-01-05 00:04:50.321727+00	2022-01-05 00:04:50.321763+00	\N	26	2050.00	0.00	\N	2022-02-01	\N
9583	2022-01-05 00:04:50.325358+00	2022-01-05 00:04:50.325392+00	\N	24	20000.00	0.00	\N	2022-02-01	\N
9584	2022-01-05 00:04:50.328455+00	2022-01-05 00:04:50.328498+00	\N	8	18150.00	0.00	\N	2022-02-01	\N
9585	2022-01-05 00:04:50.331491+00	2022-01-05 00:04:50.33166+00	\N	15	5000.00	0.00	\N	2022-02-01	\N
9586	2022-01-05 00:04:50.335713+00	2022-01-05 00:04:50.335747+00	\N	4	8000.00	0.00	\N	2022-02-01	\N
9587	2022-01-05 00:04:50.338709+00	2022-01-05 00:04:50.338744+00	\N	5	1000.00	0.00	\N	2022-02-01	\N
9588	2022-01-05 00:04:50.341573+00	2022-01-05 00:04:50.341607+00	\N	6	2100.00	0.00	\N	2022-02-01	\N
9589	2022-01-05 00:04:50.344921+00	2022-01-05 00:04:50.344956+00	\N	7	11000.00	0.00	\N	2022-02-01	\N
9590	2022-01-05 00:04:50.347692+00	2022-01-05 00:04:50.347725+00	\N	14	2050.00	0.00	\N	2022-02-01	\N
9591	2022-01-05 00:04:50.351616+00	2022-01-05 00:04:50.351656+00	\N	9	5600.00	0.00	\N	2022-02-01	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 104, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: dim_car_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.dim_car_detail_id_seq', 1, true);


--
-- Name: dim_chit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.dim_chit_id_seq', 3, true);


--
-- Name: dim_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.dim_customers_id_seq', 31, true);


--
-- Name: dim_expences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.dim_expences_id_seq', 27, true);


--
-- Name: dim_finance_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.dim_finance_source_id_seq', 48, true);


--
-- Name: dim_flexi_loan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.dim_flexi_loan_id_seq', 2, true);


--
-- Name: dim_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.dim_income_id_seq', 24, true);


--
-- Name: dim_password_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.dim_password_id_seq', 4, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 99, true);


--
-- Name: fact_car_odometer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.fact_car_odometer_id_seq', 179, true);


--
-- Name: fact_chit_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.fact_chit_customers_id_seq', 37, true);


--
-- Name: fact_chit_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.fact_chit_payment_id_seq', 198, true);


--
-- Name: fact_chit_settlement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.fact_chit_settlement_id_seq', 22, true);


--
-- Name: fact_credit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.fact_credit_id_seq', 6, true);


--
-- Name: fact_emi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.fact_emi_id_seq', 1, false);


--
-- Name: fact_flexi_utilized_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.fact_flexi_utilized_id_seq', 111, true);


--
-- Name: fact_monthly_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.fact_monthly_payment_id_seq', 9622, true);


--
-- Name: other_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pms
--

SELECT pg_catalog.setval('public.other_card_id_seq', 3, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: dim_car_detail dim_car_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_car_detail
    ADD CONSTRAINT dim_car_detail_pkey PRIMARY KEY (id);


--
-- Name: dim_chit dim_chit_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_chit
    ADD CONSTRAINT dim_chit_pkey PRIMARY KEY (id);


--
-- Name: dim_customers dim_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_customers
    ADD CONSTRAINT dim_customers_pkey PRIMARY KEY (id);


--
-- Name: dim_expences dim_expences_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_expences
    ADD CONSTRAINT dim_expences_pkey PRIMARY KEY (id);


--
-- Name: dim_finance_source dim_finance_source_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_finance_source
    ADD CONSTRAINT dim_finance_source_pkey PRIMARY KEY (id);


--
-- Name: dim_finance_loan dim_flexi_loan_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_finance_loan
    ADD CONSTRAINT dim_flexi_loan_pkey PRIMARY KEY (id);


--
-- Name: dim_income dim_income_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_income
    ADD CONSTRAINT dim_income_pkey PRIMARY KEY (id);


--
-- Name: dim_password dim_password_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_password
    ADD CONSTRAINT dim_password_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: fact_car_odometer fact_car_odometer_date_car_id_9b3b689f_uniq; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_car_odometer
    ADD CONSTRAINT fact_car_odometer_date_car_id_9b3b689f_uniq UNIQUE (date, car_id);


--
-- Name: fact_car_odometer fact_car_odometer_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_car_odometer
    ADD CONSTRAINT fact_car_odometer_pkey PRIMARY KEY (id);


--
-- Name: fact_chit_customers fact_chit_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_customers
    ADD CONSTRAINT fact_chit_customers_pkey PRIMARY KEY (id);


--
-- Name: fact_chit_payment fact_chit_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_payment
    ADD CONSTRAINT fact_chit_payment_pkey PRIMARY KEY (id);


--
-- Name: fact_chit_settlement fact_chit_settlement_chit_id_month_382ca694_uniq; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_settlement
    ADD CONSTRAINT fact_chit_settlement_chit_id_month_382ca694_uniq UNIQUE (chit_id, month);


--
-- Name: fact_chit_settlement fact_chit_settlement_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_settlement
    ADD CONSTRAINT fact_chit_settlement_pkey PRIMARY KEY (id);


--
-- Name: fact_credit fact_credit_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_credit
    ADD CONSTRAINT fact_credit_pkey PRIMARY KEY (id);


--
-- Name: fact_emi fact_emi_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_emi
    ADD CONSTRAINT fact_emi_pkey PRIMARY KEY (id);


--
-- Name: fact_finance_utilized fact_flexi_utilized_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_finance_utilized
    ADD CONSTRAINT fact_flexi_utilized_pkey PRIMARY KEY (id);


--
-- Name: fact_monthly_payment fact_monthly_payment_month_income_id_expense_id_4c0dbf63_uniq; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_monthly_payment
    ADD CONSTRAINT fact_monthly_payment_month_income_id_expense_id_4c0dbf63_uniq UNIQUE (month, income_id, expense_id);


--
-- Name: fact_monthly_payment fact_monthly_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_monthly_payment
    ADD CONSTRAINT fact_monthly_payment_pkey PRIMARY KEY (id);


--
-- Name: dim_card other_card_pkey; Type: CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_card
    ADD CONSTRAINT other_card_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: dim_expences_chit_id_425e512a; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX dim_expences_chit_id_425e512a ON public.dim_expences USING btree (chit_id);


--
-- Name: dim_expences_finance_id_d598c6cc; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX dim_expences_finance_id_d598c6cc ON public.dim_expences USING btree (finance_id);


--
-- Name: dim_income_finance_id_6ca112b3; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX dim_income_finance_id_6ca112b3 ON public.dim_income USING btree (finance_id);


--
-- Name: dim_income_source_id_c4e58565; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX dim_income_source_id_c4e58565 ON public.dim_income USING btree (source_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: fact_car_odometer_car_id_b57742a9; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_car_odometer_car_id_b57742a9 ON public.fact_car_odometer USING btree (car_id);


--
-- Name: fact_chit_customers_chit_id_01e45ccb; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_chit_customers_chit_id_01e45ccb ON public.fact_chit_customers USING btree (chit_id);


--
-- Name: fact_chit_customers_customer_id_92f5a3d6; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_chit_customers_customer_id_92f5a3d6 ON public.fact_chit_customers USING btree (customer_id);


--
-- Name: fact_chit_payment_chit_id_5a582d82; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_chit_payment_chit_id_5a582d82 ON public.fact_chit_payment USING btree (chit_id);


--
-- Name: fact_chit_payment_customer_id_09aec391; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_chit_payment_customer_id_09aec391 ON public.fact_chit_payment USING btree (customer_id);


--
-- Name: fact_chit_settlement_chit_id_53938882; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_chit_settlement_chit_id_53938882 ON public.fact_chit_settlement USING btree (chit_id);


--
-- Name: fact_chit_settlement_customer_id_dc9d3d46; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_chit_settlement_customer_id_dc9d3d46 ON public.fact_chit_settlement USING btree (customer_id);


--
-- Name: fact_credit_source_id_9e104bee; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_credit_source_id_9e104bee ON public.fact_credit USING btree (source_id);


--
-- Name: fact_emi_card_id_f218a958; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_emi_card_id_f218a958 ON public.fact_emi USING btree (card_id);


--
-- Name: fact_emi_source_id_34dfcc17; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_emi_source_id_34dfcc17 ON public.fact_emi USING btree (source_id);


--
-- Name: fact_flexi_utilized_flexi_id_104286cc; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_flexi_utilized_flexi_id_104286cc ON public.fact_finance_utilized USING btree (finance_id);


--
-- Name: fact_flexi_utilized_source_id_7a6c87d7; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_flexi_utilized_source_id_7a6c87d7 ON public.fact_finance_utilized USING btree (source_id);


--
-- Name: fact_monthly_payment_credit_id_784b6a92; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_monthly_payment_credit_id_784b6a92 ON public.fact_monthly_payment USING btree (credit_id);


--
-- Name: fact_monthly_payment_expense_id_663897b8; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_monthly_payment_expense_id_663897b8 ON public.fact_monthly_payment USING btree (expense_id);


--
-- Name: fact_monthly_payment_income_id_ee55618b; Type: INDEX; Schema: public; Owner: pms
--

CREATE INDEX fact_monthly_payment_income_id_ee55618b ON public.fact_monthly_payment USING btree (income_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dim_expences dim_expences_chit_id_425e512a_fk_dim_chit_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_expences
    ADD CONSTRAINT dim_expences_chit_id_425e512a_fk_dim_chit_id FOREIGN KEY (chit_id) REFERENCES public.dim_chit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dim_expences dim_expences_finance_id_d598c6cc_fk_dim_finance_loan_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_expences
    ADD CONSTRAINT dim_expences_finance_id_d598c6cc_fk_dim_finance_loan_id FOREIGN KEY (finance_id) REFERENCES public.dim_finance_loan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dim_income dim_income_finance_id_6ca112b3_fk_dim_finance_loan_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_income
    ADD CONSTRAINT dim_income_finance_id_6ca112b3_fk_dim_finance_loan_id FOREIGN KEY (finance_id) REFERENCES public.dim_finance_loan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dim_income dim_income_source_id_c4e58565_fk_dim_finance_source_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.dim_income
    ADD CONSTRAINT dim_income_source_id_c4e58565_fk_dim_finance_source_id FOREIGN KEY (source_id) REFERENCES public.dim_finance_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_car_odometer fact_car_odometer_car_id_b57742a9_fk_dim_car_detail_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_car_odometer
    ADD CONSTRAINT fact_car_odometer_car_id_b57742a9_fk_dim_car_detail_id FOREIGN KEY (car_id) REFERENCES public.dim_car_detail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_customers fact_chit_customers_chit_id_01e45ccb_fk_dim_chit_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_customers
    ADD CONSTRAINT fact_chit_customers_chit_id_01e45ccb_fk_dim_chit_id FOREIGN KEY (chit_id) REFERENCES public.dim_chit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_customers fact_chit_customers_customer_id_92f5a3d6_fk_dim_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_customers
    ADD CONSTRAINT fact_chit_customers_customer_id_92f5a3d6_fk_dim_customers_id FOREIGN KEY (customer_id) REFERENCES public.dim_customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_payment fact_chit_payment_chit_id_5a582d82_fk_dim_chit_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_payment
    ADD CONSTRAINT fact_chit_payment_chit_id_5a582d82_fk_dim_chit_id FOREIGN KEY (chit_id) REFERENCES public.dim_chit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_payment fact_chit_payment_customer_id_09aec391_fk_dim_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_payment
    ADD CONSTRAINT fact_chit_payment_customer_id_09aec391_fk_dim_customers_id FOREIGN KEY (customer_id) REFERENCES public.dim_customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_settlement fact_chit_settlement_chit_id_53938882_fk_dim_chit_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_settlement
    ADD CONSTRAINT fact_chit_settlement_chit_id_53938882_fk_dim_chit_id FOREIGN KEY (chit_id) REFERENCES public.dim_chit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_chit_settlement fact_chit_settlement_customer_id_dc9d3d46_fk_dim_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_chit_settlement
    ADD CONSTRAINT fact_chit_settlement_customer_id_dc9d3d46_fk_dim_customers_id FOREIGN KEY (customer_id) REFERENCES public.dim_customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_credit fact_credit_source_id_9e104bee_fk_dim_finance_source_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_credit
    ADD CONSTRAINT fact_credit_source_id_9e104bee_fk_dim_finance_source_id FOREIGN KEY (source_id) REFERENCES public.dim_finance_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_emi fact_emi_card_id_f218a958_fk_dim_card_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_emi
    ADD CONSTRAINT fact_emi_card_id_f218a958_fk_dim_card_id FOREIGN KEY (card_id) REFERENCES public.dim_card(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_emi fact_emi_source_id_34dfcc17_fk_dim_finance_source_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_emi
    ADD CONSTRAINT fact_emi_source_id_34dfcc17_fk_dim_finance_source_id FOREIGN KEY (source_id) REFERENCES public.dim_finance_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_finance_utilized fact_flexi_utilized_finance_id_5b00f313_fk_dim_flexi_loan_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_finance_utilized
    ADD CONSTRAINT fact_flexi_utilized_finance_id_5b00f313_fk_dim_flexi_loan_id FOREIGN KEY (finance_id) REFERENCES public.dim_finance_loan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_finance_utilized fact_flexi_utilized_source_id_7a6c87d7_fk_dim_finance_source_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_finance_utilized
    ADD CONSTRAINT fact_flexi_utilized_source_id_7a6c87d7_fk_dim_finance_source_id FOREIGN KEY (source_id) REFERENCES public.dim_finance_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_monthly_payment fact_monthly_payment_credit_id_784b6a92_fk_fact_credit_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_monthly_payment
    ADD CONSTRAINT fact_monthly_payment_credit_id_784b6a92_fk_fact_credit_id FOREIGN KEY (credit_id) REFERENCES public.fact_credit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_monthly_payment fact_monthly_payment_expense_id_663897b8_fk_dim_expences_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_monthly_payment
    ADD CONSTRAINT fact_monthly_payment_expense_id_663897b8_fk_dim_expences_id FOREIGN KEY (expense_id) REFERENCES public.dim_expences(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fact_monthly_payment fact_monthly_payment_income_id_ee55618b_fk_dim_income_id; Type: FK CONSTRAINT; Schema: public; Owner: pms
--

ALTER TABLE ONLY public.fact_monthly_payment
    ADD CONSTRAINT fact_monthly_payment_income_id_ee55618b_fk_dim_income_id FOREIGN KEY (income_id) REFERENCES public.dim_income(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

