PGDMP     6                    v            student    9.6.1    10.1 ,    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16393    student    DATABASE     �   CREATE DATABASE student WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE student;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24604    course    TABLE     �   CREATE TABLE course (
    id integer NOT NULL,
    course_name character varying(20) DEFAULT NULL::character varying,
    course_description character varying(20) DEFAULT NULL::character varying,
    version integer
);
    DROP TABLE public.course;
       public         postgres    false    3            �            1259    24602    course_id_seq    SEQUENCE     o   CREATE SEQUENCE course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.course_id_seq;
       public       postgres    false    3    193            �           0    0    course_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE course_id_seq OWNED BY course.id;
            public       postgres    false    192            �            1259    16409    employee    TABLE     �   CREATE TABLE employee (
    id integer NOT NULL,
    first_name character varying(20) DEFAULT NULL::character varying,
    last_name character varying(20) DEFAULT NULL::character varying,
    salary integer,
    version integer,
    notes text
);
    DROP TABLE public.employee;
       public         postgres    false    3            �            1259    24614    employee_course    TABLE     e   CREATE TABLE employee_course (
    id integer NOT NULL,
    emp_id integer,
    course_id integer
);
 #   DROP TABLE public.employee_course;
       public         postgres    false    3            �            1259    24612    employee_course_id_seq    SEQUENCE     x   CREATE SEQUENCE employee_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.employee_course_id_seq;
       public       postgres    false    195    3            �           0    0    employee_course_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE employee_course_id_seq OWNED BY employee_course.id;
            public       postgres    false    194            �            1259    16407    employee_id_seq    SEQUENCE     q   CREATE SEQUENCE employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.employee_id_seq;
       public       postgres    false    189    3            �           0    0    employee_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE employee_id_seq OWNED BY employee.id;
            public       postgres    false    188            �            1259    16402    hibernate_sequence    SEQUENCE     t   CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public       postgres    false    3            �            1259    16396    t_user    TABLE     �   CREATE TABLE t_user (
    id integer NOT NULL,
    username character varying(100),
    password character varying(500),
    salary integer,
    age integer
);
    DROP TABLE public.t_user;
       public         postgres    false    3            �            1259    16394    t_user_id_seq    SEQUENCE     o   CREATE SEQUENCE t_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.t_user_id_seq;
       public       postgres    false    186    3            �           0    0    t_user_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE t_user_id_seq OWNED BY t_user.id;
            public       postgres    false    185            �            1259    16431    task    TABLE     �   CREATE TABLE task (
    id integer NOT NULL,
    task_name character varying(20) DEFAULT NULL::character varying,
    emp_id integer,
    version integer,
    notes text
);
    DROP TABLE public.task;
       public         postgres    false    3            �            1259    16429    task_id_seq    SEQUENCE     m   CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.task_id_seq;
       public       postgres    false    3    191            �           0    0    task_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE task_id_seq OWNED BY task.id;
            public       postgres    false    190            �           2604    24607 	   course id    DEFAULT     X   ALTER TABLE ONLY course ALTER COLUMN id SET DEFAULT nextval('course_id_seq'::regclass);
 8   ALTER TABLE public.course ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    192    193            �           2604    16412    employee id    DEFAULT     \   ALTER TABLE ONLY employee ALTER COLUMN id SET DEFAULT nextval('employee_id_seq'::regclass);
 :   ALTER TABLE public.employee ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188    189            �           2604    24617    employee_course id    DEFAULT     j   ALTER TABLE ONLY employee_course ALTER COLUMN id SET DEFAULT nextval('employee_course_id_seq'::regclass);
 A   ALTER TABLE public.employee_course ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194    195            �           2604    16399 	   t_user id    DEFAULT     X   ALTER TABLE ONLY t_user ALTER COLUMN id SET DEFAULT nextval('t_user_id_seq'::regclass);
 8   ALTER TABLE public.t_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    185    186            �           2604    16434    task id    DEFAULT     T   ALTER TABLE ONLY task ALTER COLUMN id SET DEFAULT nextval('task_id_seq'::regclass);
 6   ALTER TABLE public.task ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190    191                      0    24604    course 
   TABLE DATA               G   COPY course (id, course_name, course_description, version) FROM stdin;
    public       postgres    false    193   +       {          0    16409    employee 
   TABLE DATA               N   COPY employee (id, first_name, last_name, salary, version, notes) FROM stdin;
    public       postgres    false    189   D+       �          0    24614    employee_course 
   TABLE DATA               9   COPY employee_course (id, emp_id, course_id) FROM stdin;
    public       postgres    false    195   z+       x          0    16396    t_user 
   TABLE DATA               >   COPY t_user (id, username, password, salary, age) FROM stdin;
    public       postgres    false    186   �+       }          0    16431    task 
   TABLE DATA               >   COPY task (id, task_name, emp_id, version, notes) FROM stdin;
    public       postgres    false    191   b,       �           0    0    course_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('course_id_seq', 1, false);
            public       postgres    false    192            �           0    0    employee_course_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('employee_course_id_seq', 13, true);
            public       postgres    false    194            �           0    0    employee_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('employee_id_seq', 1, false);
            public       postgres    false    188            �           0    0    hibernate_sequence    SEQUENCE SET     ;   SELECT pg_catalog.setval('hibernate_sequence', 183, true);
            public       postgres    false    187            �           0    0    t_user_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('t_user_id_seq', 1, false);
            public       postgres    false    185            �           0    0    task_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('task_id_seq', 1, false);
            public       postgres    false    190            �           2606    24611    course course_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public         postgres    false    193                       2606    24619 $   employee_course employee_course_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY employee_course
    ADD CONSTRAINT employee_course_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.employee_course DROP CONSTRAINT employee_course_pkey;
       public         postgres    false    195            �           2606    16416    employee employee_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public         postgres    false    189            �           2606    16401    t_user t_user_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY t_user
    ADD CONSTRAINT t_user_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.t_user DROP CONSTRAINT t_user_pkey;
       public         postgres    false    186            �           2606    16437    task task_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public         postgres    false    191               "   x�3�0�L6�LI-N�4�2�0�L6��b���� }\�      {   &   x�34��J,J�t���4400�4���/I����� p��      �      x�34�44��4�0�24�2��b���� <�!      x   �   x���I�0 �u{����%�P	2�b� 2Hd(DO�.<�xy*2���@I%�J�ȸ�h�y��ݶ_�\L|���NKm�����W���p��B ��]��?-��#��a����<Ȅy��uR�ea��;�Zs�k��岱y�H7>�yM��f���>��7=�D�      }   '   x�3�0�,1�44��4���/I�2�0�,1B����� ���     