INSERT INTO area (nome_area) VALUES
('Area de Marketing'),
('Area de Vendas'),
('Area de TI'),
('Area de Recursos Humanos'),
('Area de Finanças');


INSERT INTO orcamento_anual (data_inicio, data_fim, orcamento_anual) VALUES
('2024-03-01', '2025-02-27', 1500000),
('2023-01-01', '2023-12-31', 3000000),
('2024-03-01', '2025-02-27', 2000000),
('2023-01-01', '2023-12-31', 2500000),
('2024-03-01', '2025-02-27', 1800000),
('2023-01-01', '2023-12-31', 1200000),
('2024-03-01', '2025-02-27', 2700000),
('2023-01-01', '2023-12-31', 3500000),
('2024-03-01', '2025-02-27', 2300000),
('2023-01-01', '2023-12-31', 1700000),
('2024-03-01', '2025-02-27', 1900000),
('2023-01-01', '2023-12-31', 2800000),
('2024-03-01', '2025-02-27', 2100000),
('2023-01-01', '2023-12-31', 1400000),
('2024-03-01', '2025-02-27', 2400000);

-- Centro de Custos relacionados à Área de Marketing (orcamento anual 1)
INSERT INTO centro_de_custos (nome_centro, tipo, fk_orcamento_anual, fk_area) VALUES
('Marketing Digital', 'NAO_PRODUTIVO', 1, 1),
('Comunicação e Marketing', 'PRODUTIVO', 1, 1),
('Pesquisa de Mercado', 'NAO_PRODUTIVO', 1, 1);

-- Centro de Custos relacionados à Área de Vendas (orcamento anual 2)
INSERT INTO centro_de_custos (nome_centro, tipo, fk_orcamento_anual, fk_area) VALUES
('Vendas Online', 'NAO_PRODUTIVO', 2, 2),
('Vendas Presenciais', 'PRODUTIVO', 2, 2),
('Suporte ao Cliente', 'NAO_PRODUTIVO', 2, 2);

-- Centro de Custos relacionados à Área de TI (orcamento anual 3)
INSERT INTO centro_de_custos (nome_centro, tipo, fk_orcamento_anual, fk_area) VALUES
('Desenvolvimento de Software', 'PRODUTIVO', 3, 3),
('Infraestrutura de TI', 'NAO_PRODUTIVO', 3, 3),
('Suporte Técnico', 'PRODUTIVO', 3, 3);

-- Centro de Custos relacionados à Área de Recursos Humanos (orcamento anual 4)
INSERT INTO centro_de_custos (nome_centro, tipo, fk_orcamento_anual, fk_area) VALUES
('Recrutamento e Seleção', 'PRODUTIVO', 4, 4),
('Folha de Pagamento', 'NAO_PRODUTIVO', 4, 4),
('Treinamento e Desenvolvimento', 'PRODUTIVO', 4, 4);

-- Centro de Custos relacionados à Área de Finanças (orcamento anual 5)
INSERT INTO centro_de_custos (nome_centro, tipo, fk_orcamento_anual, fk_area) VALUES
('Contabilidade', 'PRODUTIVO', 5, 5),
('Auditoria Interna', 'NAO_PRODUTIVO', 5, 5),
('Gestão Financeira', 'PRODUTIVO', 5, 5);

-- Gastos variaveis
-- Gastos Variáveis para Centro de Custos 1: Marketing Digital (orcamento_anual 1, area 1)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Software de Análise', 1800, 'Softwares', 'Compra de licença do Power BI', 'Cartão de crédito', 'Licença anual para 5 usuários', '2024-01-23 10:45:12', 'João Silva', TRUE, 1),
('Curso de Marketing Digital', 2500, 'Treinamentos', 'Participação em curso online sobre SEO', 'Transferência bancária', 'Curso com duração de 40 horas', '2023-10-05 17:23:45', 'Maria Oliveira', TRUE, 1);

-- Gastos Variáveis para Centro de Custos 2: Comunicação e Marketing (orcamento_anual 1, area 1)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Produção de Conteúdo', 1200, 'Marketing de Conteúdo', 'Criação de artigo para o blog da empresa', 'Cartão de débito', 'Conteúdo informativo e relevante para o público-alvo', '2024-05-14 08:32:11', 'Bruno Santos', TRUE, 2),
('Campanha de Email Marketing', 3200, 'Publicidade', 'Criação e envio de campanha de email marketing', 'Transferência bancária', 'Campanha direcionada para aumentar o engajamento', '2023-12-19 20:12:54', 'Ana Lopes', TRUE, 2);

-- Gastos Variáveis para Centro de Custos 3: Pesquisa de Mercado (orcamento_anual 1, area 1)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Pesquisa de Opinião', 2100, 'Pesquisas', 'Realização de pesquisa online com clientes', 'Dinheiro', 'Coleta de dados sobre satisfação do cliente', '2024-02-07 13:58:33', 'Pedro Souza', TRUE, 3),
('Ferramentas de Pesquisa', 1400, 'Softwares', 'Compra de software para análise de dados de pesquisa', 'Cartão de crédito', 'Software para auxiliar na análise dos resultados', '2024-04-02 13:58:33', 'Pedro Silva', TRUE, 3);


-- Gastos Variáveis para Centro de Custos 1: Vendas Online (orcamento_anual 2, area 2)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Plataforma de E-commerce', 3800, 'Softwares', 'Assinatura mensal da plataforma de e-commerce', 'Cartão de crédito', 'Plataforma para gestão da loja online', '2024-03-11 16:23:45', 'João Silva', TRUE, 4),
('Campanha de Publicidade Online', 1200, 'Publicidade', 'Criação e veiculação de anúncios no Google Ads', 'Transferência bancária', 'Campanha direcionada para aumentar as vendas online', '2023-11-02 09:58:33', 'Maria Oliveira', TRUE, 4);

-- Gastos Variáveis para Centro de Custos 2: Vendas Presenciais (orcamento_anual 2, area 2)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Comissões de Venda', 2500, 'Despesas de Pessoal', 'Pagamento de comissões aos vendedores', 'Dinheiro', 'Recompensa pela performance das vendas', '2024-02-04 11:32:11', 'Bruno Santos', TRUE, 5),
('Material de Ponto de Venda', 1800, 'Material de escritório', 'Compra de materiais para o PDV', 'Cartão de débito', 'Impressora fiscal, papel, etiquetas, etc.', '2023-10-17 20:12:54', 'Ana Lopes', TRUE, 5);

-- Gastos Variáveis para Centro de Custos 3: Suporte ao Cliente (orcamento_anual 2, area 2)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Ferramenta de Atendimento', 1400, 'Softwares', 'Assinatura mensal da ferramenta de atendimento', 'Cartão de crédito', 'Software para auxiliar no atendimento ao cliente', '2024-01-28 13:58:33', 'Pedro Souza', TRUE, 6),
('Treinamento para Equipe de Suporte', 2100, 'Treinamentos', 'Participação em curso online sobre atendimento ao cliente - Atendimento com Empatia', 'Cartão de crédito', 'Curso com duração de 40 horas ministrado pela XYZ Treinamentos', '2024-02-15 10:45:12', 'Pedro Souza', TRUE, 6);


-- Gastos Variáveis para Centro de Custos 1: Desenvolvimento de Software (orcamento_anual 3, area 3)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Licença de Software', 2500, 'Softwares', 'Compra de licença anual do Visual Studio', 'Cartão de crédito', 'Licença para 5 desenvolvedores', '2024-03-25 14:23:45', 'João Silva', TRUE, 7),
('Curso de Desenvolvimento de Software', 1800, 'Treinamentos', 'Participação em curso presencial sobre desenvolvimento web', 'Transferência bancária', 'Curso com duração de 30 horas', '2023-12-08 11:58:33', 'Maria Oliveira', TRUE, 7);

-- Gastos Variáveis para Centro de Custos 2: Infraestrutura de TI (orcamento_anual 3, area 3)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Manutenção de Hardware', 1200, 'Serviços', 'Contrato de manutenção anual dos servidores', 'Dinheiro', 'Manutenção preventiva e corretiva', '2024-02-11 09:32:11', 'Bruno Santos', TRUE, 8),
('Armazenamento em Nuvem', 3200, 'Serviços', 'Assinatura mensal do serviço de armazenamento em nuvem', 'Cartão de débito', 'Armazenamento de dados da empresa', '2023-11-04 18:12:54', 'Ana Lopes', TRUE, 8);

-- Gastos Variáveis para Centro de Custos 3: Suporte Técnico (orcamento_anual 3, area 3)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Ferramentas de Monitoramento', 1400, 'Softwares', 'Compra de software para monitoramento de rede', 'Cartão de crédito', 'Monitoramento de desempenho da rede', '2024-01-31 13:58:33', 'Pedro Souza', TRUE, 9),
('Equipamentos de Rede', 2100, 'Equipamentos de TI', 'Compra de 2 roteadores Cisco modelo XYZ e 5 switches TP-Link modelo ABC', 'Cartão de crédito', 'Equipamentos para atualização da rede interna da empresa', '2024-02-18 10:45:12', 'Pedro Souza', TRUE, 9);


-- Gastos Variáveis para Centro de Custos 1: Recrutamento e Seleção (orcamento_anual 4, area 4)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Plataforma de Recrutamento', 2500, 'Softwares', 'Assinatura mensal da plataforma de recrutamento online', 'Cartão de crédito', 'Plataforma para gestão de vagas e candidatos', '2024-03-18 16:23:45', 'João Silva', TRUE, 10),
('Anúncios de Vagas', 1800, 'Publicidade', 'Criação e veiculação de anúncios de vagas em sites e redes sociais', 'Transferência bancária', 'Divulgação de vagas para atrair talentos', '2023-12-01 09:58:33', 'Maria Oliveira', TRUE, 10);

-- Gastos Variáveis para Centro de Custos 2: Folha de Pagamento (orcamento_anual 4, area 4)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Encargos Trabalhistas', 3200, 'Despesas com Pessoal', 'Pagamento de encargos trabalhistas (INSS, FGTS, etc.)', 'Dinheiro', 'Obrigações legais com os funcionários', '2024-02-08 11:32:11', 'Bruno Santos', TRUE, 11),
('Terceirização de Serviços', 1200, 'Serviços', 'Contratação de empresa terceirizada para folha de pagamento', 'Cartão de débito', 'Gerenciamento da folha de pagamento', '2023-11-17 20:12:54', 'Ana Lopes', TRUE, 11);

-- Gastos Variáveis para Centro de Custos 3: Treinamento e Desenvolvimento (orcamento_anual 4, area 4)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Curso de Liderança', 2100, 'Treinamentos', 'Participação em curso presencial sobre liderança', 'Cartão de crédito', 'Desenvolvimento de habilidades de liderança para gestores', '2024-01-31 13:58:33', 'Pedro Souza', TRUE, 12),
('Material Didático', 1400, 'Material didático', 'Compra de 10 livros de liderança e desenvolvimento organizacional', 'Cartão de crédito', 'Material para complementar o curso de liderança', '2024-02-15 10:45:12', 'Pedro Souza', TRUE, 12);

-- Gastos Variáveis para Centro de Custos 1: Contabilidade (orcamento_anual 5, area 5)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Assinatura Software Contabilidade', 2500, 'Softwares', 'Assinatura mensal do software de contabilidade', 'Cartão de crédito', 'Software para gestão contábil da empresa', '2024-03-25 14:23:45', 'João Silva', TRUE, 13),
('Consultoria Contábil', 1800, 'Serviços', 'Assessoria contábil para questões fiscais e tributárias', 'Transferência bancária', 'Consultoria para garantir o cumprimento das obrigações fiscais', '2023-12-08 11:58:33', 'Maria Oliveira', TRUE, 13);

-- Gastos Variáveis para Centro de Custos 2: Auditoria Interna (orcamento_anual 5, area 5)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Treinamento Auditoria Interna', 1200, 'Treinamentos', 'Participação em curso presencial sobre auditoria interna', 'Dinheiro', 'Aperfeiçoamento profissional dos auditores internos', '2024-02-11 09:32:11', 'Bruno Santos', TRUE, 14),
('Ferramentas de Auditoria', 3200, 'Softwares', 'Compra de software para auxiliar na realização de auditorias', 'Cartão de débito', 'Software para automatizar tarefas e gerar relatórios', '2023-11-04 18:12:54', 'Ana Lopes', TRUE, 14);

-- Gastos Variáveis para Centro de Custos 3: Gestão Financeira (orcamento_anual 5, area 5)
INSERT INTO gastos_variaveis (tipo_variavel, valor, categoria_despesa, desc_transacao, metodo_pagto, obs, data, responsavel, aprovado, fk_centro_de_custos) VALUES
('Assinatura Software Gestão Financeira', 1400, 'Softwares', 'Assinatura mensal do software de gestão financeira', 'Cartão de crédito', 'Software para controle de fluxo de caixa e investimentos', '2024-01-31 13:58:33', 'Pedro Souza', TRUE, 15),
('Consultoria Financeira', 2100, 'Consultoria', 'Consultoria para análise de investimentos e planejamento financeiro', 'Cartão de crédito', 'Consultoria para auxiliar na tomada de decisões de investimento', '2023-10-05 10:45:12', 'Pedro Souza', TRUE, 15);


-- 1. Marcos Silva (Desenvolvimento de Software)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Marcos Silva', 'marcos.silva@empresa.com.br', 'f31e2d37170d55f010f4466544142924', 'EXEC');

-- 2. Ana Oliveira (Infraestrutura de TI)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Ana Oliveira', 'ana.oliveira@empresa.com.br', '4823e85551523e28157643f17a67e79a', 'EXEC');

-- 3. Bruno Santos (Suporte Técnico)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Bruno Santos', 'bruno.santos@empresa.com.br', '356400753228538355613119066a321a', 'EXEC');

-- 4. João Silva (Recursos Humanos)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('João Silva', 'joao.silva@empresa.com.br', '23022166e875846864289943151e3d28', 'EXEC');

-- 5. Maria Oliveira (Recursos Humanos)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Maria Oliveira', 'maria.oliveira@empresa.com.br', '1234567890abcdef1234567890abcdef', 'EXEC');

-- 6. Pedro Souza (Recursos Humanos)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Pedro Souza', 'pedro.souza@empresa.com.br', 'abcdef12345678901234567890abcdef', 'EXEC');

-- 7. Carlos Oliveira (Finanças)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Carlos Oliveira', 'carlos.oliveira@empresa.com.br', 'f0e284e5b49733335433e35627477a7f', 'EXEC');

-- 8. Luisa Silva (Finanças)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Luisa Silva', 'luisa.silva@empresa.com.br', 'd41d8cd98f00b204e9800998ecf8427e', 'EXEC');

-- 9. Rodrigo Lima (Marketing)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Rodrigo Lima', 'rodrigo.lima@empresa.com.br', '1c0cfe8f80134fdeb5d84b68b9f8e9ae', 'EXEC');

-- 10. Fernanda Costa (Marketing)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Fernanda Costa', 'fernanda.costa@empresa.com.br', '5f4dcc3b5aa765d61d8327deb882cf99', 'EXEC');

-- 11. Lucas Rocha (Vendas)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Lucas Rocha', 'lucas.rocha@empresa.com.br', '098f6bcd4621d373cade4e832627b4f6', 'EXEC');

-- 12. Amanda Mendes (Vendas)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Amanda Mendes', 'amanda.mendes@empresa.com.br', '5ebe2294ecd0e0f08eab7690d2a6ee69', 'EXEC');

-- 13. Felipe Silva (Desenvolvimento de Software)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Felipe Silva', 'felipe.silva@empresa.com.br', 'e99a18c428cb38d5f260853678922e03', 'EXEC');

-- 14. Julia Ferreira (Infraestrutura de TI)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Julia Ferreira', 'julia.ferreira@empresa.com.br', '6c97424dc92c008d4ae36e4e09f4c437', 'EXEC');

-- 15. André Martins (Suporte Técnico)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('André Martins', 'andre.martins@empresa.com.br', 'f1e4c3d28213f70a2454c74c4c2a70fc', 'EXEC');

-- 16. Beatriz Lima (Desenvolvimento de Software)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Beatriz Lima', 'beatriz.lima@empresa.com.br', 'a6d3f2a9c9b0e9efc6b1e6f6c5d9e2f3', 'FUNC');

-- 17. Carlos Mendes (Infraestrutura de TI)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Carlos Mendes', 'carlos.mendes@empresa.com.br', 'b7e6f7c8d9a1b2c3d4e5f6g7h8i9j0k1', 'FUNC');

-- 18. Daniela Alves (Suporte Técnico)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Daniela Alves', 'daniela.alves@empresa.com.br', 'c8d9e0f1g2h3i4j5k6l7m8n9o0p1q2r3', 'FUNC');

-- 19. Eduardo Ferreira (Recursos Humanos)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Eduardo Ferreira', 'eduardo.ferreira@empresa.com.br', 'd9e0f1g2h3i4j5k6l7m8n9o0p1q2r3s4', 'FUNC');

-- 20. Fabiana Souza (Recursos Humanos)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Fabiana Souza', 'fabiana.souza@empresa.com.br', 'e0f1g2h3i4j5k6l7m8n9o0p1q2r3s4t5', 'FUNC');

-- 21. Gabriel Martins (Finanças)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Gabriel Martins', 'gabriel.martins@empresa.com.br', 'f1g2h3i4j5k6l7m8n9o0p1q2r3s4t5u6', 'FUNC');

-- 22. Helena Rocha (Finanças)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Helena Rocha', 'helena.rocha@empresa.com.br', 'g2h3i4j5k6l7m8n9o0p1q2r3s4t5u6v7', 'FUNC');

-- 23. Igor Nunes (Marketing)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Igor Nunes', 'igor.nunes@empresa.com.br', 'h3i4j5k6l7m8n9o0p1q2r3s4t5u6v7w8', 'FUNC');

-- 24. Juliana Barros (Marketing)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Juliana Barros', 'juliana.barros@empresa.com.br', 'i4j5k6l7m8n9o0p1q2r3s4t5u6v7w8x9', 'FUNC');

-- 25. Kevin Dias (Vendas)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Kevin Dias', 'kevin.dias@empresa.com.br', 'j5k6l7m8n9o0p1q2r3s4t5u6v7w8x9y0', 'FUNC');

-- 26. Larissa Carvalho (Vendas)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Larissa Carvalho', 'larissa.carvalho@empresa.com.br', 'k6l7m8n9o0p1q2r3s4t5u6v7w8x9y0z1', 'FUNC');

-- 27. Marcelo Gonçalves (Desenvolvimento de Software)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Marcelo Gonçalves', 'marcelo.goncalves@empresa.com.br', 'l7m8n9o0p1q2r3s4t5u6v7w8x9y0z1a2', 'FUNC');

-- 28. Natalia Ribeiro (Infraestrutura de TI)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Natalia Ribeiro', 'natalia.ribeiro@empresa.com.br', 'm8n9o0p1q2r3s4t5u6v7w8x9y0z1a2b3', 'FUNC');

-- 29. Otavio Lima (Suporte Técnico)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Otavio Lima', 'otavio.lima@empresa.com.br', 'n9o0p1q2r3s4t5u6v7w8x9y0z1a2b3c4', 'FUNC');

-- 30. Patricia Fernandes (Recursos Humanos)
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Patricia Fernandes', 'patricia.fernandes@empresa.com.br', 'o0p1q2r3s4t5u6v7w8x9y0z1a2b3c4d5', 'FUNC');


-- 1. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(1, 1, 1);

-- 2. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(2, 2, 1);

-- 3. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(3, 3, 1);


-- 4. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(4, 4, 2);

-- 5. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(5, 5, 2);

-- 6. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(6, 6, 2);


-- 7. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(7, 7, 3);

-- 8. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(8, 8, 3);

-- 9. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(9, 9, 3);


-- 10. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(10, 10, 4);

-- 11. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(11, 11, 4);

-- 12. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(12, 12, 4);


-- 13. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(13, 13, 5);

-- 14. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(14, 14, 5);

-- 15. Executivo
INSERT INTO executivo (fk_centro_de_custos, fk_usuario, fk_area) VALUES
(15, 15, 5);


-- 16. Beatriz Lima (Desenvolvimento de Software)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Beatriz Lima', 'beatriz.lima@empresa.com.br', 'Desenvolvimento de Software', 'Senior', 8000, 1, 16);

-- 17. Carlos Mendes (Infraestrutura de TI)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Carlos Mendes', 'carlos.mendes@empresa.com.br', 'Infraestrutura de TI', 'Pleno', 7000, 2, 17);

-- 18. Daniela Alves (Suporte Técnico)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Daniela Alves', 'daniela.alves@empresa.com.br', 'Suporte Técnico', 'Junior', 6000, 3, 18);

-- 19. Eduardo Ferreira (Recursos Humanos)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Eduardo Ferreira', 'eduardo.ferreira@empresa.com.br', 'Recursos Humanos', 'Pleno', 6500, 4, 19);

-- 20. Fabiana Souza (Recursos Humanos)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Fabiana Souza', 'fabiana.souza@empresa.com.br', 'Recursos Humanos', 'Junior', 5500, 5, 20);

-- 21. Gabriel Martins (Finanças)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Gabriel Martins', 'gabriel.martins@empresa.com.br', 'Finanças', 'Senior', 9000, 6, 21);

-- 22. Helena Rocha (Finanças)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Helena Rocha', 'helena.rocha@empresa.com.br', 'Finanças', 'Pleno', 8000, 7, 22);

-- 23. Igor Nunes (Marketing)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Igor Nunes', 'igor.nunes@empresa.com.br', 'Marketing', 'Senior', 7500, 8, 23);

-- 24. Juliana Barros (Marketing)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Juliana Barros', 'juliana.barros@empresa.com.br', 'Marketing', 'Junior', 5000, 9, 24);

-- 25. Kevin Dias (Vendas)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Kevin Dias', 'kevin.dias@empresa.com.br', 'Vendas', 'Pleno', 7000, 10, 25);

-- 26. Larissa Carvalho (Vendas)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Larissa Carvalho', 'larissa.carvalho@empresa.com.br', 'Vendas', 'Junior', 6000, 11, 26);

-- 27. Marcelo Gonçalves (Desenvolvimento de Software)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Marcelo Gonçalves', 'marcelo.goncalves@empresa.com.br', 'Desenvolvimento de Software', 'Pleno', 7000, 12, 27);

-- 28. Natalia Ribeiro (Infraestrutura de TI)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Natalia Ribeiro', 'natalia.ribeiro@empresa.com.br', 'Infraestrutura de TI', 'Junior', 6000, 13, 28);

-- 29. Otavio Lima (Suporte Técnico)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Otavio Lima', 'otavio.lima@empresa.com.br', 'Suporte Técnico', 'Senior', 7500, 14, 29);

-- 30. Patricia Fernandes (Recursos Humanos)
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario) VALUES
('Patricia Fernandes', 'patricia.fernandes@empresa.com.br', 'Recursos Humanos', 'Pleno', 7000, 15, 30);

