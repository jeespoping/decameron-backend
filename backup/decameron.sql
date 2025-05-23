PGDMP  8            
        }         	   decameron    16.8 (Debian 16.8-1.pgdg120+1)    17.4 #    >           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            @           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            A           1262    16389 	   decameron    DATABASE     t   CREATE DATABASE decameron WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE decameron;
                     postgres    false            �            1259    16390    descriptions    TABLE     �  CREATE TABLE public.descriptions (
    id bigint NOT NULL,
    hotel_id integer NOT NULL,
    amount integer NOT NULL,
    type character varying(255) NOT NULL,
    accommodation character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT descriptions_accommodation_check CHECK (((accommodation)::text = ANY (ARRAY[('SENCILLA'::character varying)::text, ('DOBLE'::character varying)::text, ('TRIPLE'::character varying)::text, ('CUADRUPLE'::character varying)::text]))),
    CONSTRAINT descriptions_type_check CHECK (((type)::text = ANY (ARRAY[('ESTANDAR'::character varying)::text, ('JUNIOR'::character varying)::text, ('SUITE'::character varying)::text])))
);
     DROP TABLE public.descriptions;
       public         heap r       postgres    false            �            1259    16397    descriptions_id_seq    SEQUENCE     |   CREATE SEQUENCE public.descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.descriptions_id_seq;
       public               postgres    false    215            B           0    0    descriptions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.descriptions_id_seq OWNED BY public.descriptions.id;
          public               postgres    false    216            �            1259    16398    hotels    TABLE     �  CREATE TABLE public.hotels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    nit character varying(255) NOT NULL,
    room character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    public_id character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.hotels;
       public         heap r       postgres    false            �            1259    16403    hotels_id_seq    SEQUENCE     v   CREATE SEQUENCE public.hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.hotels_id_seq;
       public               postgres    false    217            C           0    0    hotels_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;
          public               postgres    false    218            �            1259    16404 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap r       postgres    false            �            1259    16407    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public               postgres    false    219            D           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public               postgres    false    220            �            1259    16408    users    TABLE     h  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    api_token character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16413    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    221            E           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    222            �           2604    16414    descriptions id    DEFAULT     r   ALTER TABLE ONLY public.descriptions ALTER COLUMN id SET DEFAULT nextval('public.descriptions_id_seq'::regclass);
 >   ALTER TABLE public.descriptions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    216    215            �           2604    16415 	   hotels id    DEFAULT     f   ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);
 8   ALTER TABLE public.hotels ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217            �           2604    16416    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219            �           2604    16417    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221            4          0    16390    descriptions 
   TABLE DATA           i   COPY public.descriptions (id, hotel_id, amount, type, accommodation, created_at, updated_at) FROM stdin;
    public               postgres    false    215   (*       6          0    16398    hotels 
   TABLE DATA           n   COPY public.hotels (id, name, address, city, nit, room, image, public_id, created_at, updated_at) FROM stdin;
    public               postgres    false    217   �*       8          0    16404 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public               postgres    false    219   �,       :          0    16408    users 
   TABLE DATA           m   COPY public.users (id, name, email, password, api_token, remember_token, created_at, updated_at) FROM stdin;
    public               postgres    false    221   3-       F           0    0    descriptions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.descriptions_id_seq', 15, true);
          public               postgres    false    216            G           0    0    hotels_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.hotels_id_seq', 10, true);
          public               postgres    false    218            H           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 3, true);
          public               postgres    false    220            I           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public               postgres    false    222            �           2606    16419    descriptions descriptions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.descriptions DROP CONSTRAINT descriptions_pkey;
       public                 postgres    false    215            �           2606    16421    hotels hotels_nit_unique 
   CONSTRAINT     R   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_nit_unique UNIQUE (nit);
 B   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_nit_unique;
       public                 postgres    false    217            �           2606    16423    hotels hotels_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public                 postgres    false    217            �           2606    16425    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public                 postgres    false    219            �           2606    16427    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public                 postgres    false    221            �           2606    16429    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    221            �           2606    16430 *   descriptions descriptions_hotel_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_hotel_id_foreign FOREIGN KEY (hotel_id) REFERENCES public.hotels(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.descriptions DROP CONSTRAINT descriptions_hotel_id_foreign;
       public               postgres    false    215    3229    217            4   g   x�m�1� �W�������;46�Nf'K
h����
-dS� ��Y�Lb�d��#�����s,\���#��+iĐ�)||�Fk�#�ׂ�7EU&�      6     x��Ա��0��<��,��Ƙ�.U�DJ�6�8b��7JqEڴ�bw�6��V�a~!ͧ��{�^��OJ��'���L��Q�U� e<q�Q���c��a�w�T�}VZՎ۴6a�����ԏai�þѵ��@)!�>�:l:٨sa�݁��C�?m��@��0� O��L N�\� '�$�x}�t~�S/�X�
����,�(��٬����� X
���4F"��
+���=��z��9-�+�+�b�(��U��j$�8Oâ���Z_�վ�bDo DiT}�zQCV��G#S�"����E�#W���Ы�������0�X?04#I�"*�)󦱃I�ï���9���_�'�H0K0vռ}U�:�z�gP�N6�MC���f���hwca�,5}��j8U����wpp�<�������V�b֑wu�2:�n���l��}�Q3f��ǃ�l�J犯%QB���I�MY���\����ޗ6�<ճgZEFy o��`|�T��C.Z�Oc��c+�k�+��'��3]H.��[����e�e      8   \   x�U�A
� @ѵ&�QC�V	��v�\|���Z��#��G[�И��8UjaM,��!=���w�2��Ae<�w�[�W��~�����(�      :     x�=ȹr�@  ��6Ξ�RE�V1�+xdlP�����'Uf^����]�i��]���V|MV^�g�h���]���PW4��
%vԖ�����>��b LF�2��/?Ђ"qә�{al���-)�����g޾^�d��u_MW$$N��q���������l=dʝ�M�E-��^0�ME`�Un�e��>]��I����c=ٹ�M�=��ϙ#�c�!����F�Z�X�#�,8�(ӏc]�9�V�     