PGDMP     +    *                {            delivery_db    15.4    15.4 "               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    delivery_db    DATABASE     �   CREATE DATABASE delivery_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Bolivia.1252';
    DROP DATABASE delivery_db;
                postgres    false            �            1259    16413    roles    TABLE       CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(180) NOT NULL,
    image character varying(255),
    route character varying(255),
    created_at timestamp(0) without time zone NOT NULL,
    update_at timestamp(0) without time zone NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    16412    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    215                       0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    214            �            1259    16424    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    phone character varying(80) NOT NULL,
    image character varying(255),
    password character varying(255) NOT NULL,
    is_available boolean,
    session_token character varying(255),
    created_at timestamp(0) without time zone NOT NULL,
    update_at timestamp(0) without time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16438    users_has_roles    TABLE     �   CREATE TABLE public.users_has_roles (
    id_user bigint NOT NULL,
    id_rol bigint NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    update_at timestamp(0) without time zone NOT NULL
);
 #   DROP TABLE public.users_has_roles;
       public         heap    postgres    false            �            1259    16437    users_has_roles_id_rol_seq    SEQUENCE     �   CREATE SEQUENCE public.users_has_roles_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.users_has_roles_id_rol_seq;
       public          postgres    false    220                       0    0    users_has_roles_id_rol_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.users_has_roles_id_rol_seq OWNED BY public.users_has_roles.id_rol;
          public          postgres    false    219            �            1259    16436    users_has_roles_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_has_roles_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.users_has_roles_id_user_seq;
       public          postgres    false    220                       0    0    users_has_roles_id_user_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.users_has_roles_id_user_seq OWNED BY public.users_has_roles.id_user;
          public          postgres    false    218            �            1259    16423    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217                        0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            p           2604    16416    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            q           2604    16427    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            r           2604    16441    users_has_roles id_user    DEFAULT     �   ALTER TABLE ONLY public.users_has_roles ALTER COLUMN id_user SET DEFAULT nextval('public.users_has_roles_id_user_seq'::regclass);
 F   ALTER TABLE public.users_has_roles ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    218    220    220            s           2604    16442    users_has_roles id_rol    DEFAULT     �   ALTER TABLE ONLY public.users_has_roles ALTER COLUMN id_rol SET DEFAULT nextval('public.users_has_roles_id_rol_seq'::regclass);
 E   ALTER TABLE public.users_has_roles ALTER COLUMN id_rol DROP DEFAULT;
       public          postgres    false    219    220    220                      0    16413    roles 
   TABLE DATA           N   COPY public.roles (id, name, image, route, created_at, update_at) FROM stdin;
    public          postgres    false    215   �'                 0    16424    users 
   TABLE DATA           �   COPY public.users (id, email, name, lastname, phone, image, password, is_available, session_token, created_at, update_at) FROM stdin;
    public          postgres    false    217   )                 0    16438    users_has_roles 
   TABLE DATA           Q   COPY public.users_has_roles (id_user, id_rol, created_at, update_at) FROM stdin;
    public          postgres    false    220   *       !           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
          public          postgres    false    214            "           0    0    users_has_roles_id_rol_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.users_has_roles_id_rol_seq', 1, false);
          public          postgres    false    219            #           0    0    users_has_roles_id_user_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.users_has_roles_id_user_seq', 1, false);
          public          postgres    false    218            $           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    216            u           2606    16422    roles roles_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_name_key;
       public            postgres    false    215            w           2606    16420    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    215            y           2606    16433    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    217                       2606    16444 $   users_has_roles users_has_roles_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.users_has_roles
    ADD CONSTRAINT users_has_roles_pkey PRIMARY KEY (id_user, id_rol);
 N   ALTER TABLE ONLY public.users_has_roles DROP CONSTRAINT users_has_roles_pkey;
       public            postgres    false    220    220            {           2606    16435    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            postgres    false    217            }           2606    16431    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            �           2606    16450 +   users_has_roles users_has_roles_id_rol_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_has_roles
    ADD CONSTRAINT users_has_roles_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.users_has_roles DROP CONSTRAINT users_has_roles_id_rol_fkey;
       public          postgres    false    3191    220    215            �           2606    16445 ,   users_has_roles users_has_roles_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_has_roles
    ADD CONSTRAINT users_has_roles_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.users_has_roles DROP CONSTRAINT users_has_roles_id_user_fkey;
       public          postgres    false    3197    220    217               =  x����N�0Ư�)|��R�����睉a�u���3��-�M�Yғ���N~�w���~�y�m��9m���hy<p�%T0�pE��+�Ʃ��[f����@�F)T���
Τ��X�� �@JnZ/翻G��yW�4�o�}+%38���2�^�0JK�Bz�O�� <h�~�,�c�`�u޴ҁ��%aE�WE�ӄ�U��9�PYVU�N��1�5�"��E\<��n{���	�r7]���N��s`j�Μ���Z,Ujv�1���L��\k�gߑcK�8^3*R9����O�/�ȯ�M�8��۠�         �   x�m�=o�0���Y�~m�L-�R� j! ;_5��%�����H��I'=�~Ν2�ݭ9u� �Ε)+��d�sh7CU����[��"��6?�\^��~��4����H�M�*�u2k_n�6�P�%�.����P˸s���Ԣ�I���-�ߡ�:�G��/��	�]��oe�
�n���0O6�m�'�'��{��M=�'�$� }��]c�ќS�         @   x���4�4202�5��5�P00�22�2�*�e�i�"n`F�ĸ,Q�54�22�24�&����� �g     