PGDMP     /    /            
    |         	   lebondeal    14.13 (Homebrew)    14.13 (Homebrew)     m           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            n           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            o           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            p           1262    16537 	   lebondeal    DATABASE     T   CREATE DATABASE lebondeal WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE lebondeal;
                gabriel    false                        3079    16722 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            q           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    16707    belong    TABLE     b   CREATE TABLE public.belong (
    product_uuid uuid NOT NULL,
    order_number integer NOT NULL
);
    DROP TABLE public.belong;
       public         heap    gabriel    false            �            1259    16693    orders    TABLE     �  CREATE TABLE public.orders (
    order_number integer NOT NULL,
    user_uuid uuid NOT NULL,
    order_total_cost_ht numeric(10,2) NOT NULL,
    order_total_quantity integer NOT NULL,
    deliver_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT orders_order_total_cost_ht_check CHECK ((order_total_cost_ht >= (0)::numeric)),
    CONSTRAINT orders_order_total_quantity_check CHECK ((order_total_quantity >= 0))
);
    DROP TABLE public.orders;
       public         heap    gabriel    false            �            1259    16692    orders_order_number_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.orders_order_number_seq;
       public          gabriel    false    213            r           0    0    orders_order_number_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.orders_order_number_seq OWNED BY public.orders.order_number;
          public          gabriel    false    212            �            1259    16680    products    TABLE     5  CREATE TABLE public.products (
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
    DROP TABLE public.products;
       public         heap    gabriel    false            �            1259    16669    users    TABLE     +  CREATE TABLE public.users (
    user_uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    user_pseudo character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    user_password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap    gabriel    false            �           2604    16696    orders order_number    DEFAULT     z   ALTER TABLE ONLY public.orders ALTER COLUMN order_number SET DEFAULT nextval('public.orders_order_number_seq'::regclass);
 B   ALTER TABLE public.orders ALTER COLUMN order_number DROP DEFAULT;
       public          gabriel    false    213    212    213            j          0    16707    belong 
   TABLE DATA           <   COPY public.belong (product_uuid, order_number) FROM stdin;
    public          gabriel    false    214   2!       i          0    16693    orders 
   TABLE DATA           |   COPY public.orders (order_number, user_uuid, order_total_cost_ht, order_total_quantity, deliver_at, created_at) FROM stdin;
    public          gabriel    false    213   O!       g          0    16680    products 
   TABLE DATA           �   COPY public.products (product_uuid, product_name, product_description, product_price, product_quantity, created_at, updated_at) FROM stdin;
    public          gabriel    false    211   >"       f          0    16669    users 
   TABLE DATA           \   COPY public.users (user_uuid, user_pseudo, username, user_password, created_at) FROM stdin;
    public          gabriel    false    210   f$       s           0    0    orders_order_number_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.orders_order_number_seq', 1, false);
          public          gabriel    false    212            �           2606    16711    belong belong_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.belong
    ADD CONSTRAINT belong_pkey PRIMARY KEY (product_uuid, order_number);
 <   ALTER TABLE ONLY public.belong DROP CONSTRAINT belong_pkey;
       public            gabriel    false    214    214            �           2606    16701    orders orders_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_number);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            gabriel    false    213            �           2606    16691    products products_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_uuid);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            gabriel    false    211            �           2606    16675    users users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_uuid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            gabriel    false    210            �           2606    16677    users users_user_pseudo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_pseudo_key UNIQUE (user_pseudo);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_pseudo_key;
       public            gabriel    false    210            �           2606    16679    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            gabriel    false    210            �           2606    16717    belong belong_order_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.belong
    ADD CONSTRAINT belong_order_number_fkey FOREIGN KEY (order_number) REFERENCES public.orders(order_number);
 I   ALTER TABLE ONLY public.belong DROP CONSTRAINT belong_order_number_fkey;
       public          gabriel    false    213    3541    214            �           2606    16712    belong belong_product_uuid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.belong
    ADD CONSTRAINT belong_product_uuid_fkey FOREIGN KEY (product_uuid) REFERENCES public.products(product_uuid);
 I   ALTER TABLE ONLY public.belong DROP CONSTRAINT belong_product_uuid_fkey;
       public          gabriel    false    3539    214    211            �           2606    16702    orders orders_user_uuid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_uuid_fkey FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_uuid_fkey;
       public          gabriel    false    3533    213    210            j      x������ � �      i   �   x�m��m�0�rn��")�j�G��K��.�s���1��Hn��=H��9��:�6�b�GD���D@�?Ͻ?��Y�o�2�\��З	�/�^C�z�R#����|�^�Z�M�@1��� �� ��/�_���s	_�&eX[BL`)
"�A���,k��[^�r����?r��WK���	WK�n}�<�����Xo!X�1o�W�Ƕmߩ\      g     x�m��n�0���S���D�֢�s�� >$-z!)�*�I#M��k٭s��!������FO�0�Hm)1�2H�R.I�/v)q���zG��4�t��0]��c9k�����܃bO���M�8�c*F+N�$Tj���low�pLu�vT׃��&���H���x4�i��m?T�c
S���c�C�������M�8�;�u+�y�AP8�s�p����`����\��_�p	-�?nF	G/M'5ک�S�h\ �	E��-���j�Dod���ڟl*+|3���0�r�|�|r9���C?�e�ok��E풢GO1m*}����.:N;��EL����[�HP���c�&h|��B	�0Um����.�s�틪>�C��i�p��N�hE��\p�ۺ)�;���>a&lM��J�kn�2���3�l���$6��V�6H�	o�&���8���e�6h�����⏰痪VϘh")�1;ߢ�*V^�B*�P�.�Ĵ�n�P��?WZ.W\�n�H�;�d���l����a      f   d  x�E��j1����S�����dNN���ꅵX)TD�$gv���.��m���B�/���G��3k�1P0�c�����փ�$��c���D�yy���T��n�2�h�+m:c���4d�4Da�b �l��6P�>�֨yL�8�^�I��"G6*�/~����F{x){0�Һ3�j<͔Z"J��7�!
�r$��I���.�j�ǭ��R�'5}��x��/���ۗ<�
��ԡkzvBh8�"� &��8�m�������I�~8_��S�c�n����ץ��]��Q��=_!lڜ�DԠ�e��=�{H�wgy�����q_D�XF�6���I��n}�7��=����mgu��C�4� ��~v     