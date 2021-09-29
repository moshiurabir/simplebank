PGDMP     (    +                y            simple_bank    13.1    13.1 5    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16385    simple_bank    DATABASE     _   CREATE DATABASE simple_bank WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE simple_bank;
                root    false            �            1259    16905    accounts    TABLE     �   CREATE TABLE public.accounts (
    id bigint NOT NULL,
    owner character varying NOT NULL,
    balance bigint NOT NULL,
    currency character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.accounts;
       public         heap    root    false            �            1259    16903    accounts_id_seq    SEQUENCE     x   CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.accounts_id_seq;
       public          root    false    202            �           0    0    accounts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;
          public          root    false    201            �            1259    16971    adminboards    TABLE     �  CREATE TABLE public.adminboards (
    id bigint NOT NULL,
    username character varying NOT NULL,
    hashed_password character varying NOT NULL,
    full_name character varying NOT NULL,
    "position" character varying NOT NULL,
    signimg character varying NOT NULL,
    isadmin character varying NOT NULL,
    section character varying NOT NULL,
    admintype character varying NOT NULL,
    sectionid character varying NOT NULL,
    mobile character varying NOT NULL,
    email character varying NOT NULL,
    password_changed_at timestamp with time zone DEFAULT '0001-01-01 00:00:00+00'::timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.adminboards;
       public         heap    root    false            �            1259    16969    adminboards_id_seq    SEQUENCE     {   CREATE SEQUENCE public.adminboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.adminboards_id_seq;
       public          root    false    209            �           0    0    adminboards_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.adminboards_id_seq OWNED BY public.adminboards.id;
          public          root    false    208            �            1259    16917    entries    TABLE     �   CREATE TABLE public.entries (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    amount bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.entries;
       public         heap    root    false            �           0    0    COLUMN entries.amount    COMMENT     J   COMMENT ON COLUMN public.entries.amount IS 'can be negative or positive';
          public          root    false    204            �            1259    16915    entries_id_seq    SEQUENCE     w   CREATE SEQUENCE public.entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.entries_id_seq;
       public          root    false    204            �           0    0    entries_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.entries_id_seq OWNED BY public.entries.id;
          public          root    false    203            �            1259    16386    schema_migrations    TABLE     c   CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap    root    false            �            1259    16926 	   transfers    TABLE     �   CREATE TABLE public.transfers (
    id bigint NOT NULL,
    from_account_id bigint NOT NULL,
    to_account_id bigint NOT NULL,
    amount bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.transfers;
       public         heap    root    false            �           0    0    COLUMN transfers.amount    COMMENT     A   COMMENT ON COLUMN public.transfers.amount IS 'must be positive';
          public          root    false    206            �            1259    16924    transfers_id_seq    SEQUENCE     y   CREATE SEQUENCE public.transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.transfers_id_seq;
       public          root    false    206            �           0    0    transfers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.transfers_id_seq OWNED BY public.transfers.id;
          public          root    false    205            �            1259    16957    users    TABLE     }  CREATE TABLE public.users (
    username character varying NOT NULL,
    hashed_password character varying NOT NULL,
    full_name character varying NOT NULL,
    email character varying NOT NULL,
    password_changed_at timestamp with time zone DEFAULT '0001-01-01 00:00:00+00'::timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    root    false            ?           2604    16908    accounts id    DEFAULT     j   ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);
 :   ALTER TABLE public.accounts ALTER COLUMN id DROP DEFAULT;
       public          root    false    201    202    202            G           2604    16974    adminboards id    DEFAULT     p   ALTER TABLE ONLY public.adminboards ALTER COLUMN id SET DEFAULT nextval('public.adminboards_id_seq'::regclass);
 =   ALTER TABLE public.adminboards ALTER COLUMN id DROP DEFAULT;
       public          root    false    209    208    209            A           2604    16920 
   entries id    DEFAULT     h   ALTER TABLE ONLY public.entries ALTER COLUMN id SET DEFAULT nextval('public.entries_id_seq'::regclass);
 9   ALTER TABLE public.entries ALTER COLUMN id DROP DEFAULT;
       public          root    false    204    203    204            C           2604    16929    transfers id    DEFAULT     l   ALTER TABLE ONLY public.transfers ALTER COLUMN id SET DEFAULT nextval('public.transfers_id_seq'::regclass);
 ;   ALTER TABLE public.transfers ALTER COLUMN id DROP DEFAULT;
       public          root    false    206    205    206            �          0    16905    accounts 
   TABLE DATA           L   COPY public.accounts (id, owner, balance, currency, created_at) FROM stdin;
    public          root    false    202   �=       �          0    16971    adminboards 
   TABLE DATA           �   COPY public.adminboards (id, username, hashed_password, full_name, "position", signimg, isadmin, section, admintype, sectionid, mobile, email, password_changed_at, created_at) FROM stdin;
    public          root    false    209   �?       �          0    16917    entries 
   TABLE DATA           E   COPY public.entries (id, account_id, amount, created_at) FROM stdin;
    public          root    false    204   �?       �          0    16386    schema_migrations 
   TABLE DATA           ;   COPY public.schema_migrations (version, dirty) FROM stdin;
    public          root    false    200   =A       �          0    16926 	   transfers 
   TABLE DATA           [   COPY public.transfers (id, from_account_id, to_account_id, amount, created_at) FROM stdin;
    public          root    false    206   ^A       �          0    16957    users 
   TABLE DATA           m   COPY public.users (username, hashed_password, full_name, email, password_changed_at, created_at) FROM stdin;
    public          root    false    207   B       �           0    0    accounts_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.accounts_id_seq', 27, true);
          public          root    false    201                        0    0    adminboards_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.adminboards_id_seq', 1, false);
          public          root    false    208                       0    0    entries_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.entries_id_seq', 42, true);
          public          root    false    203                       0    0    transfers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.transfers_id_seq', 27, true);
          public          root    false    205            N           2606    16914    accounts accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public            root    false    202            ^           2606    16985 !   adminboards adminboards_email_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.adminboards
    ADD CONSTRAINT adminboards_email_key UNIQUE (email);
 K   ALTER TABLE ONLY public.adminboards DROP CONSTRAINT adminboards_email_key;
       public            root    false    209            `           2606    16983 "   adminboards adminboards_mobile_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.adminboards
    ADD CONSTRAINT adminboards_mobile_key UNIQUE (mobile);
 L   ALTER TABLE ONLY public.adminboards DROP CONSTRAINT adminboards_mobile_key;
       public            root    false    209            b           2606    16981    adminboards adminboards_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.adminboards
    ADD CONSTRAINT adminboards_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.adminboards DROP CONSTRAINT adminboards_pkey;
       public            root    false    209            S           2606    16923    entries entries_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.entries
    ADD CONSTRAINT entries_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.entries DROP CONSTRAINT entries_pkey;
       public            root    false    204            P           2606    16992    accounts owner_currency_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT owner_currency_key UNIQUE (owner, currency);
 E   ALTER TABLE ONLY public.accounts DROP CONSTRAINT owner_currency_key;
       public            root    false    202    202            K           2606    16390 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            root    false    200            W           2606    16932    transfers transfers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.transfers DROP CONSTRAINT transfers_pkey;
       public            root    false    206            Z           2606    16968    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            root    false    207            \           2606    16966    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            root    false    207            L           1259    16948    accounts_owner_idx    INDEX     H   CREATE INDEX accounts_owner_idx ON public.accounts USING btree (owner);
 &   DROP INDEX public.accounts_owner_idx;
       public            root    false    202            Q           1259    16949    entries_account_id_idx    INDEX     P   CREATE INDEX entries_account_id_idx ON public.entries USING btree (account_id);
 *   DROP INDEX public.entries_account_id_idx;
       public            root    false    204            T           1259    16950    transfers_from_account_id_idx    INDEX     ^   CREATE INDEX transfers_from_account_id_idx ON public.transfers USING btree (from_account_id);
 1   DROP INDEX public.transfers_from_account_id_idx;
       public            root    false    206            U           1259    16952 +   transfers_from_account_id_to_account_id_idx    INDEX     {   CREATE INDEX transfers_from_account_id_to_account_id_idx ON public.transfers USING btree (from_account_id, to_account_id);
 ?   DROP INDEX public.transfers_from_account_id_to_account_id_idx;
       public            root    false    206    206            X           1259    16951    transfers_to_account_id_idx    INDEX     Z   CREATE INDEX transfers_to_account_id_idx ON public.transfers USING btree (to_account_id);
 /   DROP INDEX public.transfers_to_account_id_idx;
       public            root    false    206            c           2606    16986    accounts accounts_owner_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_owner_fkey FOREIGN KEY (owner) REFERENCES public.users(username);
 F   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_owner_fkey;
       public          root    false    2908    207    202            d           2606    16933    entries entries_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entries
    ADD CONSTRAINT entries_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id);
 I   ALTER TABLE ONLY public.entries DROP CONSTRAINT entries_account_id_fkey;
       public          root    false    2894    204    202            e           2606    16938 (   transfers transfers_from_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_from_account_id_fkey FOREIGN KEY (from_account_id) REFERENCES public.accounts(id);
 R   ALTER TABLE ONLY public.transfers DROP CONSTRAINT transfers_from_account_id_fkey;
       public          root    false    2894    202    206            f           2606    16943 &   transfers transfers_to_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_to_account_id_fkey FOREIGN KEY (to_account_id) REFERENCES public.accounts(id);
 P   ALTER TABLE ONLY public.transfers DROP CONSTRAINT transfers_to_account_id_fkey;
       public          root    false    202    206    2894            �   �  x�u�K��@DשSx��������};f�@$!1�ӻ��R�$Y/HC7n�5���	VLo*���F�]��r�C��R+�ys�m{(|�y�vV�`^����Ư��/h_(b��7h��u9!�L�/(�`��i�.egt�fg�OU��as`���1ދ�籮�,y\k��%��[	�m�6,ޤ;Ia������q_X�XRw"�˶�6��{�A��:���z;G�e�kұ$��������hҤ/�4.ա�7p��4+��ھ\v3���P<��Ϸ������Y=� �/�w���Tw0��<�v��{t�4�D2�"����Ӧ��A.��ׁ�@�˺�O`��H(�a&�x°��B9��pb�#�g�t����V�{V�5Ηb3�"U(-.��eU��I�g�Ay��]�2:#�jI�٢i��q�����)����a��1_(3��]�t�-V��?��s      �      x������ � �      �   G  x����q�0гTE�g�/�%����(���c���!��A���dyB� �(~촡ml�dH�a��~#�&�E�S�*��I\�4,f���	g�`>�z����2�L�H���bod�V�615�rX�"_�D�#U]��s�����=p]W���I�I���8�c��%����}��β����:u���{�@Բwkt�(^��*3nܤ��L��^�M܋y� \׎�����j�8�*�Ж=�W/�q��4�;���0��=��vTb.g�s��{�e^b�n'��ٲwU���E��̅��.�d�?����p)�      �      x�3�L����� �T      �     x���Ir!�5}��Sv�k@�g���!z��ؿ�� �0�11^4^�?����[���/��؅5&�#T�	�����sX��Iv�%�mB?C�� �T��c��{HZ�A��n�GI��cA>wb��r��Uj��S�P�r��;"J���)�Mq�ف5<Rfźe��`o��u�|C�R�x�J+tNT��mC{.�(���s}�K��Wj�PZ��-�TæWD�zzsQ��xޕ2[����
��d'ZS�;TyS_����*�j�������ak�g      �   w  x���IӪH�u�_q��(��
TPQQP�7$ �L2����_-z��D���9�M�ˢ�A9��n���^^�{(y�����"�-�!�ʪ�2>J�Iq���v�F��^4a���j�|���;� �����I�ޯ�j����$��/��E��@p'ο�x_N}T�}4�F1���ϛ��i0���c��t�����$W�O�>Q�^�/�o���_,�ϳ_�*o� ��:e{��J���֖�uei��|����U���񰂇 pޥvGLC��5(�i�ҿ�̉�������$��f~<&P"Ks_��_~@�ళms>l�e���V������Li���l��\7�}��2�^�@���-��D�&8�4L)�h�c%�[f��J�\�i�~B6��ΙdFf���T�=�-q	��~���sgH��� �oP�;^�rJ����z��B��;҈�ն>���D��V�ʑ�ЉV�ftQ
�n(�z!Hd�˓:y;%�J�uݝ2Y��(n��`MQ����Ǡ�{k�+w˓]�q��x��j�
�a�p��x�x/Pҹ5���=t6�Z-�#��t�n���u��4|��d⃙�]���dw��" E�W� M��C�@O2��X������R2*�i��^��X���@�Eh�� �T!JRI��`����+QT��[�Y�'Y���
t_��07<z���I�{��k��m��ң��>B�uQUK�h��A����e ����j_M����ܕ�Jv|�#N1ažo�XE��}8E�J��Q#D�:"#0�&'�A��!XRd�T�m�8�p*7����f��;8�q</=x9�7��%���^M�U�=���_U9�Py�D�<AS��g�Y�z��Z�w���ə��V���������i��s@�8������	=x��}w�G�潥�|hQ��D*�U��i�e2z�J��X;�G�W���B<7#Y���HN�:�MQ
��qa��H������q��N�Q�k���5���OX�E"+ݮ��Z�c^���nL����`�boLr�e ��D�=�k7���4���.���2/�/��o)���獅���~͘#b��|�SE�N����m���u<-��\���J8��W��TsHQh�t0=4��V,
�q޶{�v���?��������CPS�+;�m@[�M;.�A�s�=�a��o���(Q�v:�e�޲y�nl����0��̣C�e�Fc�UY�`j��r ,�&k��HR�~��p
��;8:�A�>b�����,A'�)G����C���k&k����q�; �_u�,Q$OoP�uC���L��Њ%�B{���L6���6�	.u�hWiN8�h�t�N!?��1L��M��`�fEAd�U�y�|G�<2�:��_G�KĄ��b(�ۋ�.n�7ᵞ��E^���\��;FM�>n�l�ah��=�ځ�w��R&e=jnIO�'E�'�3|<n��hv%B�������1��g|�A�Q����FpQ1��)�|����-�dv9�����-'�����4n�uO��0���F5��
���fߥ��-�B<Mr�'k�b�> ��<1����PX��3��h�ּk�e0´,�O܉�O�l�@��YӀ�I�W�$�+�Y�DE�𩽸3�t_��!��Fs�4��ɛ}�:R��Mb#�ȗ%jEx9`,�ڇ�3�\�B$����F��~�3���W}e�/s��Ǹ	���@>ŉy8�]�0i�u{�����b&\�91DI´��t6�����Qñ�s�������J�'��Ń'����gE��I'�x
C?�g��y�� J�� ��*X2�g5��݆����z^�[�*�q(��a�y(���U[L/��4^��sK��f*����/�s�s�D���%ih}��~9��	�Y�}�~Y�M���#?|����s�a�IN� ���޷��������^90��5-�Q�ݒ���y?2�-�}{˼r������J�L����H �]Q�FU��m�cm��]G
R�W�0��i��뗁X���w`L�4��1�vAs)NXn"ȭ�紛�(9��<H��F{ws�<��Ÿlq ���π�nQc�A�|lߍ��؏?�z���     