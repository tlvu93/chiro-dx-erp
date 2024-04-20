SET check_function_bodies = false;
CREATE TABLE public.contact_details (
    id integer NOT NULL,
    email text,
    phone text
);
CREATE SEQUENCE public.contact_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.contact_details_id_seq OWNED BY public.contact_details.id;
CREATE TABLE public.contacts (
    id integer NOT NULL,
    name text NOT NULL,
    relationship text NOT NULL,
    contact_details text NOT NULL
);
CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;
CREATE TABLE public.customers (
    id integer NOT NULL,
    name text NOT NULL,
    last_name text NOT NULL,
    contact_details_id integer,
    registration_date date NOT NULL,
    industry_branch text
);
CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
CREATE TABLE public.employees (
    id integer NOT NULL,
    name text NOT NULL,
    "position" text NOT NULL,
    department text NOT NULL,
    hire_date date NOT NULL
);
CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
CREATE TABLE public.industry_branch (
    name text NOT NULL,
    description text
);
CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity numeric NOT NULL,
    order_date date NOT NULL,
    status text NOT NULL
);
CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
CREATE TABLE public.payment_method (
    method text NOT NULL,
    description text
);
CREATE TABLE public.payments (
    id integer NOT NULL,
    invoice_id integer NOT NULL,
    amount numeric NOT NULL,
    payment_date date NOT NULL,
    method text NOT NULL
);
CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;
CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    price numeric NOT NULL,
    stock_quantity integer NOT NULL
);
CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
CREATE TABLE public.relationship_types (
    type text NOT NULL,
    description text
);
CREATE TABLE public.suppliers (
    id integer NOT NULL,
    name text NOT NULL,
    contact_details text NOT NULL,
    address text NOT NULL
);
CREATE SEQUENCE public.suppliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;
CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_online boolean NOT NULL
);
CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
ALTER TABLE ONLY public.contact_details ALTER COLUMN id SET DEFAULT nextval('public.contact_details_id_seq'::regclass);
ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);
ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);
ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);
ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
ALTER TABLE ONLY public.contact_details
    ADD CONSTRAINT contact_details_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.industry_branch
    ADD CONSTRAINT industry_branch_pkey PRIMARY KEY (name);
ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT payment_method_pkey PRIMARY KEY (method);
ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.relationship_types
    ADD CONSTRAINT relationship_types_pkey PRIMARY KEY (type);
ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_relationship_fkey FOREIGN KEY (relationship) REFERENCES public.relationship_types(type) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_contact_details_id_fkey FOREIGN KEY (contact_details_id) REFERENCES public.contact_details(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_industry_branch_fkey FOREIGN KEY (industry_branch) REFERENCES public.industry_branch(name) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_method_fkey FOREIGN KEY (method) REFERENCES public.payment_method(method) ON UPDATE RESTRICT ON DELETE RESTRICT;
