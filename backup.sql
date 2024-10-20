--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: area; Type: TABLE; Schema: public; Owner: grupo1
--

CREATE TABLE public.area (
    id_area integer NOT NULL,
    nome_area character varying(45) NOT NULL
);


ALTER TABLE public.area OWNER TO grupo1;

--
-- Name: area_id_area_seq; Type: SEQUENCE; Schema: public; Owner: grupo1
--

CREATE SEQUENCE public.area_id_area_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.area_id_area_seq OWNER TO grupo1;

--
-- Name: area_id_area_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo1
--

ALTER SEQUENCE public.area_id_area_seq OWNED BY public.area.id_area;


--
-- Name: centro_de_custos; Type: TABLE; Schema: public; Owner: grupo1
--

CREATE TABLE public.centro_de_custos (
    id_centro_de_custos integer NOT NULL,
    nome_centro character varying(45) NOT NULL,
    tipo character varying(45) NOT NULL,
    fk_orcamento_anual integer NOT NULL,
    fk_area integer NOT NULL
);


ALTER TABLE public.centro_de_custos OWNER TO grupo1;

--
-- Name: centro_de_custos_id_centro_de_custos_seq; Type: SEQUENCE; Schema: public; Owner: grupo1
--

CREATE SEQUENCE public.centro_de_custos_id_centro_de_custos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.centro_de_custos_id_centro_de_custos_seq OWNER TO grupo1;

--
-- Name: centro_de_custos_id_centro_de_custos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo1
--

ALTER SEQUENCE public.centro_de_custos_id_centro_de_custos_seq OWNED BY public.centro_de_custos.id_centro_de_custos;


--
-- Name: executivo; Type: TABLE; Schema: public; Owner: grupo1
--

CREATE TABLE public.executivo (
    "Id_executivo" integer NOT NULL,
    fk_centro_de_custos integer NOT NULL,
    fk_usuario integer NOT NULL
);


ALTER TABLE public.executivo OWNER TO grupo1;

--
-- Name: executivo_Id_executivo_seq; Type: SEQUENCE; Schema: public; Owner: grupo1
--

CREATE SEQUENCE public."executivo_Id_executivo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."executivo_Id_executivo_seq" OWNER TO grupo1;

--
-- Name: executivo_Id_executivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo1
--

ALTER SEQUENCE public."executivo_Id_executivo_seq" OWNED BY public.executivo."Id_executivo";


--
-- Name: funcionario; Type: TABLE; Schema: public; Owner: grupo1
--

CREATE TABLE public.funcionario (
    id_funcionarios integer NOT NULL,
    nome character varying(45),
    email character varying(65),
    cargo character varying(65) NOT NULL,
    senioridade character varying(25) NOT NULL,
    salario double precision NOT NULL,
    fk_centro_de_custos integer NOT NULL,
    fk_usuario integer NOT NULL
);


ALTER TABLE public.funcionario OWNER TO grupo1;

--
-- Name: funcionario_id_funcionarios_seq; Type: SEQUENCE; Schema: public; Owner: grupo1
--

CREATE SEQUENCE public.funcionario_id_funcionarios_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.funcionario_id_funcionarios_seq OWNER TO grupo1;

--
-- Name: funcionario_id_funcionarios_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo1
--

ALTER SEQUENCE public.funcionario_id_funcionarios_seq OWNED BY public.funcionario.id_funcionarios;


--
-- Name: gastos_variaveis; Type: TABLE; Schema: public; Owner: grupo1
--

CREATE TABLE public.gastos_variaveis (
    id_gastos_variaveis integer NOT NULL,
    tipo_variavel character varying(45) NOT NULL,
    valor double precision NOT NULL,
    categoria_despesa character varying(255) NOT NULL,
    desc_transacao character varying(255),
    metodo_pagto character varying(45),
    obs character varying(200),
    data timestamp without time zone NOT NULL,
    responsavel character varying(65) NOT NULL,
    aprovado boolean DEFAULT false NOT NULL,
    fk_centro_de_custos integer NOT NULL
);


ALTER TABLE public.gastos_variaveis OWNER TO grupo1;

--
-- Name: gastos_variaveis_id_gastos_variaveis_seq; Type: SEQUENCE; Schema: public; Owner: grupo1
--

CREATE SEQUENCE public.gastos_variaveis_id_gastos_variaveis_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gastos_variaveis_id_gastos_variaveis_seq OWNER TO grupo1;

--
-- Name: gastos_variaveis_id_gastos_variaveis_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo1
--

ALTER SEQUENCE public.gastos_variaveis_id_gastos_variaveis_seq OWNED BY public.gastos_variaveis.id_gastos_variaveis;


--
-- Name: orcamento_anual; Type: TABLE; Schema: public; Owner: grupo1
--

CREATE TABLE public.orcamento_anual (
    id_orcamento_anual integer NOT NULL,
    data_inicio timestamp without time zone NOT NULL,
    data_fim timestamp without time zone NOT NULL,
    orcamento_anual double precision NOT NULL
);


ALTER TABLE public.orcamento_anual OWNER TO grupo1;

--
-- Name: orcamento_anual_id_orcamento_anual_seq; Type: SEQUENCE; Schema: public; Owner: grupo1
--

CREATE SEQUENCE public.orcamento_anual_id_orcamento_anual_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orcamento_anual_id_orcamento_anual_seq OWNER TO grupo1;

--
-- Name: orcamento_anual_id_orcamento_anual_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo1
--

ALTER SEQUENCE public.orcamento_anual_id_orcamento_anual_seq OWNED BY public.orcamento_anual.id_orcamento_anual;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: grupo1
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nome character varying(45) NOT NULL,
    email character varying(65) NOT NULL,
    senha character varying(65) NOT NULL,
    tipo_usuario character varying(4) NOT NULL
);


ALTER TABLE public.usuario OWNER TO grupo1;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: grupo1
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO grupo1;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo1
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- Name: area id_area; Type: DEFAULT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.area ALTER COLUMN id_area SET DEFAULT nextval('public.area_id_area_seq'::regclass);


--
-- Name: centro_de_custos id_centro_de_custos; Type: DEFAULT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.centro_de_custos ALTER COLUMN id_centro_de_custos SET DEFAULT nextval('public.centro_de_custos_id_centro_de_custos_seq'::regclass);


--
-- Name: executivo Id_executivo; Type: DEFAULT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.executivo ALTER COLUMN "Id_executivo" SET DEFAULT nextval('public."executivo_Id_executivo_seq"'::regclass);


--
-- Name: funcionario id_funcionarios; Type: DEFAULT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.funcionario ALTER COLUMN id_funcionarios SET DEFAULT nextval('public.funcionario_id_funcionarios_seq'::regclass);


--
-- Name: gastos_variaveis id_gastos_variaveis; Type: DEFAULT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.gastos_variaveis ALTER COLUMN id_gastos_variaveis SET DEFAULT nextval('public.gastos_variaveis_id_gastos_variaveis_seq'::regclass);


--
-- Name: orcamento_anual id_orcamento_anual; Type: DEFAULT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.orcamento_anual ALTER COLUMN id_orcamento_anual SET DEFAULT nextval('public.orcamento_anual_id_orcamento_anual_seq'::regclass);


--
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: grupo1
--

COPY public.area (id_area, nome_area) FROM stdin;
1	Area de Marketing
2	Area de Vendas
3	Area de TI
4	Area de Recursos Humanos
5	Area de Finanças
\.


--
-- Data for Name: centro_de_custos; Type: TABLE DATA; Schema: public; Owner: grupo1
--

COPY public.centro_de_custos (id_centro_de_custos, nome_centro, tipo, fk_orcamento_anual, fk_area) FROM stdin;
1	Marketing Digital	NAO_PRODUTIVO	1	1
2	Comunicação e Marketing	PRODUTIVO	1	1
3	Pesquisa de Mercado	NAO_PRODUTIVO	1	1
4	Vendas Online	NAO_PRODUTIVO	2	2
5	Vendas Presenciais	PRODUTIVO	2	2
6	Suporte ao Cliente	NAO_PRODUTIVO	2	2
7	Desenvolvimento de Software	PRODUTIVO	3	3
8	Infraestrutura de TI	NAO_PRODUTIVO	3	3
9	Suporte Técnico	PRODUTIVO	3	3
10	Recrutamento e Seleção	PRODUTIVO	4	4
11	Folha de Pagamento	NAO_PRODUTIVO	4	4
12	Treinamento e Desenvolvimento	PRODUTIVO	4	4
13	Contabilidade	PRODUTIVO	5	5
14	Auditoria Interna	NAO_PRODUTIVO	5	5
15	Gestão Financeira	PRODUTIVO	5	5
\.


--
-- Data for Name: executivo; Type: TABLE DATA; Schema: public; Owner: grupo1
--

COPY public.executivo ("Id_executivo", fk_centro_de_custos, fk_usuario) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	11	11
12	12	12
13	13	13
14	14	14
15	15	15
\.


--
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: grupo1
--

COPY public.funcionario (id_funcionarios, nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) FROM stdin;
1	Beatriz Lima	beatriz.lima@empresa.com.br	Desenvolvimento de Software	Senior	8000	1	16
2	Carlos Mendes	carlos.mendes@empresa.com.br	Infraestrutura de TI	Pleno	7000	2	17
3	Daniela Alves	daniela.alves@empresa.com.br	Suporte Técnico	Junior	6000	3	18
4	Eduardo Ferreira	eduardo.ferreira@empresa.com.br	Recursos Humanos	Pleno	6500	4	19
5	Fabiana Souza	fabiana.souza@empresa.com.br	Recursos Humanos	Junior	5500	5	20
6	Gabriel Martins	gabriel.martins@empresa.com.br	Finanças	Senior	9000	6	21
7	Helena Rocha	helena.rocha@empresa.com.br	Finanças	Pleno	8000	7	22
8	Igor Nunes	igor.nunes@empresa.com.br	Marketing	Senior	7500	8	23
9	Juliana Barros	juliana.barros@empresa.com.br	Marketing	Junior	5000	9	24
10	Kevin Dias	kevin.dias@empresa.com.br	Vendas	Pleno	7000	10	25
11	Larissa Carvalho	larissa.carvalho@empresa.com.br	Vendas	Junior	6000	11	26
12	Marcelo Gonçalves	marcelo.goncalves@empresa.com.br	Desenvolvimento de Software	Pleno	7000	12	27
13	Natalia Ribeiro	natalia.ribeiro@empresa.com.br	Infraestrutura de TI	Junior	6000	13	28
14	Otavio Lima	otavio.lima@empresa.com.br	Suporte Técnico	Senior	7500	14	29
15	Patricia Fernandes	patricia.fernandes@empresa.com.br	Recursos Humanos	Pleno	7000	15	30
\.


--
-- Data for Name: gastos_variaveis; Type: TABLE DATA; Schema: public; Owner: grupo1
--

COPY public.gastos_variaveis (id_gastos_variaveis, tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) FROM stdin;
1	Software de Análise	1800	Softwares	Compra de licença do Power BI	Cartão de crédito	Licença anual para 5 usuários	2024-01-23 10:45:12	João Silva	t	1
2	Curso de Marketing Digital	2500	Treinamentos	Participação em curso online sobre SEO	Transferência bancária	Curso com duração de 40 horas	2023-10-05 17:23:45	Maria Oliveira	t	1
3	Produção de Conteúdo	1200	Marketing de Conteúdo	Criação de artigo para o blog da empresa	Cartão de débito	Conteúdo informativo e relevante para o público-alvo	2024-05-14 08:32:11	Bruno Santos	t	2
4	Campanha de Email Marketing	3200	Publicidade	Criação e envio de campanha de email marketing	Transferência bancária	Campanha direcionada para aumentar o engajamento	2023-12-19 20:12:54	Ana Lopes	t	2
5	Pesquisa de Opinião	2100	Pesquisas	Realização de pesquisa online com clientes	Dinheiro	Coleta de dados sobre satisfação do cliente	2024-02-07 13:58:33	Pedro Souza	t	3
6	Ferramentas de Pesquisa	1400	Softwares	Compra de software para análise de dados de pesquisa	Cartão de crédito	Software para auxiliar na análise dos resultados	2024-04-02 13:58:33	Pedro Silva	t	3
7	Plataforma de E-commerce	3800	Softwares	Assinatura mensal da plataforma de e-commerce	Cartão de crédito	Plataforma para gestão da loja online	2024-03-11 16:23:45	João Silva	t	4
8	Campanha de Publicidade Online	1200	Publicidade	Criação e veiculação de anúncios no Google Ads	Transferência bancária	Campanha direcionada para aumentar as vendas online	2023-11-02 09:58:33	Maria Oliveira	t	4
9	Comissões de Venda	2500	Despesas de Pessoal	Pagamento de comissões aos vendedores	Dinheiro	Recompensa pela performance das vendas	2024-02-04 11:32:11	Bruno Santos	t	5
10	Material de Ponto de Venda	1800	Material de escritório	Compra de materiais para o PDV	Cartão de débito	Impressora fiscal, papel, etiquetas, etc.	2023-10-17 20:12:54	Ana Lopes	t	5
11	Ferramenta de Atendimento	1400	Softwares	Assinatura mensal da ferramenta de atendimento	Cartão de crédito	Software para auxiliar no atendimento ao cliente	2024-01-28 13:58:33	Pedro Souza	t	6
12	Treinamento para Equipe de Suporte	2100	Treinamentos	Participação em curso online sobre atendimento ao cliente - Atendimento com Empatia	Cartão de crédito	Curso com duração de 40 horas ministrado pela XYZ Treinamentos	2024-02-15 10:45:12	Pedro Souza	t	6
13	Licença de Software	2500	Softwares	Compra de licença anual do Visual Studio	Cartão de crédito	Licença para 5 desenvolvedores	2024-03-25 14:23:45	João Silva	t	7
14	Curso de Desenvolvimento de Software	1800	Treinamentos	Participação em curso presencial sobre desenvolvimento web	Transferência bancária	Curso com duração de 30 horas	2023-12-08 11:58:33	Maria Oliveira	t	7
15	Manutenção de Hardware	1200	Serviços	Contrato de manutenção anual dos servidores	Dinheiro	Manutenção preventiva e corretiva	2024-02-11 09:32:11	Bruno Santos	t	8
16	Armazenamento em Nuvem	3200	Serviços	Assinatura mensal do serviço de armazenamento em nuvem	Cartão de débito	Armazenamento de dados da empresa	2023-11-04 18:12:54	Ana Lopes	t	8
17	Ferramentas de Monitoramento	1400	Softwares	Compra de software para monitoramento de rede	Cartão de crédito	Monitoramento de desempenho da rede	2024-01-31 13:58:33	Pedro Souza	t	9
18	Equipamentos de Rede	2100	Equipamentos de TI	Compra de 2 roteadores Cisco modelo XYZ e 5 switches TP-Link modelo ABC	Cartão de crédito	Equipamentos para atualização da rede interna da empresa	2024-02-18 10:45:12	Pedro Souza	t	9
19	Plataforma de Recrutamento	2500	Softwares	Assinatura mensal da plataforma de recrutamento online	Cartão de crédito	Plataforma para gestão de vagas e candidatos	2024-03-18 16:23:45	João Silva	t	10
20	Anúncios de Vagas	1800	Publicidade	Criação e veiculação de anúncios de vagas em sites e redes sociais	Transferência bancária	Divulgação de vagas para atrair talentos	2023-12-01 09:58:33	Maria Oliveira	t	10
21	Encargos Trabalhistas	3200	Despesas com Pessoal	Pagamento de encargos trabalhistas (INSS, FGTS, etc.)	Dinheiro	Obrigações legais com os funcionários	2024-02-08 11:32:11	Bruno Santos	t	11
22	Terceirização de Serviços	1200	Serviços	Contratação de empresa terceirizada para folha de pagamento	Cartão de débito	Gerenciamento da folha de pagamento	2023-11-17 20:12:54	Ana Lopes	t	11
23	Curso de Liderança	2100	Treinamentos	Participação em curso presencial sobre liderança	Cartão de crédito	Desenvolvimento de habilidades de liderança para gestores	2024-01-31 13:58:33	Pedro Souza	t	12
24	Material Didático	1400	Material didático	Compra de 10 livros de liderança e desenvolvimento organizacional	Cartão de crédito	Material para complementar o curso de liderança	2024-02-15 10:45:12	Pedro Souza	t	12
25	Assinatura Software Contabilidade	2500	Softwares	Assinatura mensal do software de contabilidade	Cartão de crédito	Software para gestão contábil da empresa	2024-03-25 14:23:45	João Silva	t	13
26	Consultoria Contábil	1800	Serviços	Assessoria contábil para questões fiscais e tributárias	Transferência bancária	Consultoria para garantir o cumprimento das obrigações fiscais	2023-12-08 11:58:33	Maria Oliveira	t	13
27	Treinamento Auditoria Interna	1200	Treinamentos	Participação em curso presencial sobre auditoria interna	Dinheiro	Aperfeiçoamento profissional dos auditores internos	2024-02-11 09:32:11	Bruno Santos	t	14
28	Ferramentas de Auditoria	3200	Softwares	Compra de software para auxiliar na realização de auditorias	Cartão de débito	Software para automatizar tarefas e gerar relatórios	2023-11-04 18:12:54	Ana Lopes	t	14
29	Assinatura Software Gestão Financeira	1400	Softwares	Assinatura mensal do software de gestão financeira	Cartão de crédito	Software para controle de fluxo de caixa e investimentos	2024-01-31 13:58:33	Pedro Souza	t	15
30	Consultoria Financeira	2100	Consultoria	Consultoria para análise de investimentos e planejamento financeiro	Cartão de crédito	Consultoria para auxiliar na tomada de decisões de investimento	2023-10-05 10:45:12	Pedro Souza	t	15
\.


--
-- Data for Name: orcamento_anual; Type: TABLE DATA; Schema: public; Owner: grupo1
--

COPY public.orcamento_anual (id_orcamento_anual, data_inicio, data_fim, orcamento_anual) FROM stdin;
1	2024-03-01 00:00:00	2025-02-27 00:00:00	1500000
2	2023-01-01 00:00:00	2023-12-31 00:00:00	3000000
3	2024-03-01 00:00:00	2025-02-27 00:00:00	2000000
4	2023-01-01 00:00:00	2023-12-31 00:00:00	2500000
5	2024-03-01 00:00:00	2025-02-27 00:00:00	1800000
6	2023-01-01 00:00:00	2023-12-31 00:00:00	1200000
7	2024-03-01 00:00:00	2025-02-27 00:00:00	2700000
8	2023-01-01 00:00:00	2023-12-31 00:00:00	3500000
9	2024-03-01 00:00:00	2025-02-27 00:00:00	2300000
10	2023-01-01 00:00:00	2023-12-31 00:00:00	1700000
11	2024-03-01 00:00:00	2025-02-27 00:00:00	1900000
12	2023-01-01 00:00:00	2023-12-31 00:00:00	2800000
13	2024-03-01 00:00:00	2025-02-27 00:00:00	2100000
14	2023-01-01 00:00:00	2023-12-31 00:00:00	1400000
15	2024-03-01 00:00:00	2025-02-27 00:00:00	2400000
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: grupo1
--

COPY public.usuario (id_usuario, nome, email, senha, tipo_usuario) FROM stdin;
1	Marcos Silva	marcos.silva@empresa.com.br	123456	EXEC
2	Ana Oliveira	ana.oliveira@empresa.com.br	123456	EXEC
3	Bruno Santos	bruno.santos@empresa.com.br	123456	EXEC
4	João Silva	joao.silva@empresa.com.br	123456	EXEC
5	Maria Oliveira	maria.oliveira@empresa.com.br	123456	EXEC
6	Pedro Souza	pedro.souza@empresa.com.br	123456	EXEC
7	Carlos Oliveira	carlos.oliveira@empresa.com.br	123456	EXEC
8	Luisa Silva	luisa.silva@empresa.com.br	123456	EXEC
9	Rodrigo Lima	rodrigo.lima@empresa.com.br	123456	EXEC
10	Fernanda Costa	fernanda.costa@empresa.com.br	123456	EXEC
11	Lucas Rocha	lucas.rocha@empresa.com.br	123456	EXEC
12	Amanda Mendes	amanda.mendes@empresa.com.br	123456	EXEC
13	Felipe Silva	felipe.silva@empresa.com.br	123456	EXEC
14	Julia Ferreira	julia.ferreira@empresa.com.br	123456	EXEC
15	André Martins	andre.martins@empresa.com.br	123456	EXEC
16	Beatriz Lima	beatriz.lima@empresa.com.br	123456	FUNC
17	Carlos Mendes	carlos.mendes@empresa.com.br	123456	FUNC
18	Daniela Alves	daniela.alves@empresa.com.br	123456	FUNC
19	Eduardo Ferreira	eduardo.ferreira@empresa.com.br	123456	FUNC
20	Fabiana Souza	fabiana.souza@empresa.com.br	123456	FUNC
21	Gabriel Martins	gabriel.martins@empresa.com.br	123456	FUNC
22	Helena Rocha	helena.rocha@empresa.com.br	123456	FUNC
23	Igor Nunes	igor.nunes@empresa.com.br	123456	FUNC
24	Juliana Barros	juliana.barros@empresa.com.br	123456	FUNC
25	Kevin Dias	kevin.dias@empresa.com.br	123456	FUNC
26	Larissa Carvalho	larissa.carvalho@empresa.com.br	123456	FUNC
27	Marcelo Gonçalves	marcelo.goncalves@empresa.com.br	123456	FUNC
28	Natalia Ribeiro	natalia.ribeiro@empresa.com.br	123456	FUNC
29	Otavio Lima	otavio.lima@empresa.com.br	123456	FUNC
30	Patricia Fernandes	patricia.fernandes@empresa.com.br	123456	FUNC
\.


--
-- Name: area_id_area_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo1
--

SELECT pg_catalog.setval('public.area_id_area_seq', 5, true);


--
-- Name: centro_de_custos_id_centro_de_custos_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo1
--

SELECT pg_catalog.setval('public.centro_de_custos_id_centro_de_custos_seq', 15, true);


--
-- Name: executivo_Id_executivo_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo1
--

SELECT pg_catalog.setval('public."executivo_Id_executivo_seq"', 15, true);


--
-- Name: funcionario_id_funcionarios_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo1
--

SELECT pg_catalog.setval('public.funcionario_id_funcionarios_seq', 15, true);


--
-- Name: gastos_variaveis_id_gastos_variaveis_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo1
--

SELECT pg_catalog.setval('public.gastos_variaveis_id_gastos_variaveis_seq', 30, true);


--
-- Name: orcamento_anual_id_orcamento_anual_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo1
--

SELECT pg_catalog.setval('public.orcamento_anual_id_orcamento_anual_seq', 15, true);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo1
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 30, true);


--
-- Name: area area_nome_area_key; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_nome_area_key UNIQUE (nome_area);


--
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id_area);


--
-- Name: centro_de_custos centro_de_custos_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.centro_de_custos
    ADD CONSTRAINT centro_de_custos_pkey PRIMARY KEY (id_centro_de_custos);


--
-- Name: executivo executivo_fk_usuario_key; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.executivo
    ADD CONSTRAINT executivo_fk_usuario_key UNIQUE (fk_usuario);


--
-- Name: executivo executivo_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.executivo
    ADD CONSTRAINT executivo_pkey PRIMARY KEY ("Id_executivo");


--
-- Name: funcionario funcionario_email_key; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_email_key UNIQUE (email);


--
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id_funcionarios);


--
-- Name: gastos_variaveis gastos_variaveis_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.gastos_variaveis
    ADD CONSTRAINT gastos_variaveis_pkey PRIMARY KEY (id_gastos_variaveis);


--
-- Name: gastos_variaveis gastos_variaveis_tipo_variavel_data_responsavel_key; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.gastos_variaveis
    ADD CONSTRAINT gastos_variaveis_tipo_variavel_data_responsavel_key UNIQUE (tipo_variavel, data, responsavel);


--
-- Name: orcamento_anual orcamento_anual_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.orcamento_anual
    ADD CONSTRAINT orcamento_anual_pkey PRIMARY KEY (id_orcamento_anual);


--
-- Name: centro_de_custos unique_centro_de_custos; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.centro_de_custos
    ADD CONSTRAINT unique_centro_de_custos UNIQUE (nome_centro, fk_area);


--
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: centro_de_custos centro_de_custos_fk_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.centro_de_custos
    ADD CONSTRAINT centro_de_custos_fk_area_fkey FOREIGN KEY (fk_area) REFERENCES public.area(id_area);


--
-- Name: centro_de_custos centro_de_custos_fk_orcamento_anual_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.centro_de_custos
    ADD CONSTRAINT centro_de_custos_fk_orcamento_anual_fkey FOREIGN KEY (fk_orcamento_anual) REFERENCES public.orcamento_anual(id_orcamento_anual);


--
-- Name: executivo executivo_fk_centro_de_custos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.executivo
    ADD CONSTRAINT executivo_fk_centro_de_custos_fkey FOREIGN KEY (fk_centro_de_custos) REFERENCES public.centro_de_custos(id_centro_de_custos);


--
-- Name: executivo executivo_fk_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.executivo
    ADD CONSTRAINT executivo_fk_usuario_fkey FOREIGN KEY (fk_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: funcionario funcionario_fk_centro_de_custos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_fk_centro_de_custos_fkey FOREIGN KEY (fk_centro_de_custos) REFERENCES public.centro_de_custos(id_centro_de_custos);


--
-- Name: funcionario funcionario_fk_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo1
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_fk_usuario_fkey FOREIGN KEY (fk_usuario) REFERENCES public.usuario(id_usuario);


--
-- PostgreSQL database dump complete
--

