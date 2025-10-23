-- PLANO DE SAÚDE


INSERT INTO PlanoSaude (numeroApolice, nome, abrangencia, tipoContratacao, preco) VALUES
(1001, 'Sorriso Feliz Platinum', 'Nacional', 'Empresarial', 550.00),
(1002, 'OdontoMax Básico', 'Regional', 'Individual', 95.50),
(1003, 'DentalLife Premium', 'Estadual', 'Familiar', 320.75),
(1004, 'Cario Livre', 'Nacional', 'Empresarial', 480.00),
(1005, 'Boca Saudável', 'Regional', 'Individual', 110.00),
(1006, 'MegaSorriso', 'Nacional', 'Familiar', 650.99),
(1007, 'Prev Odonto', 'Municipal', 'Individual', 75.00),
(1008, 'Top Dente', 'Estadual', 'Empresarial', 290.00),
(1009, 'Vital Odonto', 'Nacional', 'Familiar', 499.90),
(1010, 'Saúde Bucal Já', 'Regional', 'Individual', 135.00),
(1011, 'Sorri Mais', 'Estadual', 'Empresarial', 380.00),
(1012, 'Uni Dente', 'Nacional', 'Individual', 210.00),
(1013, 'Clube do Dente', 'Regional', 'Familiar', 275.50),
(1014, 'Sorriso Perfeito', 'Nacional', 'Empresarial', 510.00),
(1015, 'Prevident', 'Estadual', 'Individual', 150.00),
(1016, 'Dental Express', 'Regional', 'Familiar', 350.00),
(1017, 'Premium Care', 'Nacional', 'Empresarial', 700.00),
(1018, 'Odonto Fácil', 'Municipal', 'Individual', 88.00),
(1019, 'Super Sorriso', 'Estadual', 'Familiar', 420.00),
(1020, 'Garantia Dental', 'Nacional', 'Individual', 190.00);



-- FUNCIONÁRIO

INSERT INTO Funcionario (idFuncionario, nome, dataNasc, email) VALUES
(1, 'Ana Souza Costa', '1985-03-15', 'ana.costa@clinica.com'),
(2, 'Bruno Lima Ferreira', '1978-11-20', 'bruno.ferreira@clinica.com'),
(3, 'Carla Mendes Alves', '1992-07-01', 'carla.alves@clinica.com'),
(4, 'Daniel Pereira Rocha', '1980-01-25', 'daniel.rocha@clinica.com'),
(5, 'Erica Santos Oliveira', '1995-05-10', 'erica.oliveira@clinica.com'),
(6, 'Fábio Neves Borges', '1975-09-03', 'fabio.borges@clinica.com'),
(7, 'Giovana Dias Melo', '1990-12-12', 'giovana.melo@clinica.com'),
(8, 'Hugo Vaz Castro', '1988-06-28', 'hugo.castro@clinica.com'),
(9, 'Isabela Reis Martins', '1993-02-18', 'isabela.martins@clinica.com'),
(10, 'João Gomes Nuno', '1970-04-05', 'joao.nuno@clinica.com'),
(11, 'Karen Silva Lopes', '1996-08-22', 'karen.lopes@clinica.com'),
(12, 'Lucas Mota Pires', '1983-03-30', 'lucas.pires@clinica.com'),
(13, 'Mariana Azevedo Torres', '1991-10-14', 'mariana.torres@clinica.com'),
(14, 'Nelson Cunha Ribeiro', '1976-12-08', 'nelson.ribeiro@clinica.com'),
(15, 'Olívia Ramos Viana', '1994-01-01', 'olivia.viana@clinica.com'),
(16, 'Pedro Xavier Rocha', '1989-05-19', 'pedro.rocha@clinica.com'),
(17, 'Quiteria Mendes Souza', '1997-07-27', 'quiteria.souza@clinica.com'),
(18, 'Rafael Gomes Brito', '1981-09-11', 'rafael.brito@clinica.com'),
(19, 'Sofia Teles Melo', '1998-04-04', 'sofia.melo@clinica.com'),
(20, 'Thiago Cruz Almeida', '1979-11-02', 'thiago.almeida@clinica.com');


-- CARGO

INSERT INTO Cargo (cbo, ocupacao, salario) VALUES
(223208, 'Cirurgião-Dentista Clínico Geral', 9500.00),
(223260, 'Especialista em Ortodontia', 12000.00),
(422105, 'Recepcionista de Consultório', 2500.00),
(515105, 'Auxiliar de Saúde Bucal (ASB)', 2100.00),
(142105, 'Gerente Administrativo', 6000.00);


-- DENTISTA

INSERT INTO Dentista (Funcionario_idFuncionario, cro) VALUES
(1, 105432),
(2, 118765),
(3, 120987),
(4, 131234),
(5, 140567),
(6, 151890),
(7, 160123),
(8, 171456);


-- PROCEDIMENTO

INSERT INTO Procedimento (nome, descricao, custo, preco) VALUES
('Limpeza e Profilaxia', 'Remoção de tártaro e placa, aplicação de flúor.', 25.00, 150.00),
('Restauração de Amálgama', 'Obturação simples com material prateado.', 15.00, 120.00),
('Restauração de Resina', 'Obturação estética com resina composta.', 35.00, 250.00),
('Extração Simples', 'Remoção de dente sem complicação cirúrgica.', 50.00, 180.00),
('Extração de Siso', 'Cirurgia para remoção de dente do siso incluso.', 150.00, 450.00),
('Clareamento a Laser (Sessão)', 'Clareamento dental ativado por laser.', 80.00, 550.00),
('Canal (Endodontia)', 'Tratamento de canal em dente unirradicular.', 300.00, 850.00),
('Aplicação de Selante', 'Prevenção de cáries em sulcos dentários.', 5.00, 70.00),
('Facetas de Porcelana (Unidade)', 'Revestimento estético para dentes.', 800.00, 1500.00),
('Implante Osseo (Unidade)', 'Cirurgia de colocação de pino de titânio.', 1200.00, 3000.00),
('Prótese Total (Dentadura)', 'Prótese removível completa.', 600.00, 1400.00),
('Manutenção Ortodôntica', 'Ajuste mensal de aparelho fixo.', 10.00, 180.00),
('Raspagem Periodontal', 'Limpeza profunda para tratamento de gengivite/periodontite.', 80.00, 350.00),
('Coroa em Porcelana', 'Coroa protética totalmente em porcelana.', 500.00, 1100.00),
('Check-up Preventivo', 'Exame clínico e radiográfico de rotina.', 15.00, 100.00),
('Biópsia de Lesão Bucal', 'Remoção de tecido para análise laboratorial.', 120.00, 400.00),
('Cirurgia de Gengiva', 'Procedimento para correção de sorriso gengival.', 250.00, 750.00),
('Dessensibilização', 'Tratamento para dentes sensíveis.', 30.00, 160.00),
('Aparelho Estético', 'Instalação de aparelho ortodôntico transparente.', 150.00, 700.00),
('Radiografia Panorâmica', 'Exame de imagem completo da boca.', 40.00, 130.00);


-- LABORATÓRIO EXTERNO

INSERT INTO labExterno (idlabExterno, nome, procedimento, email) VALUES
(1, 'Laboratório Cerâmica Pura', 'Prótese Fixa e Facetas', 'ceramica@lab.com'),
(2, 'Diagnóstico Maxilo', 'Exames e Radiologia Avançada', 'maxilo@lab.com'),
(3, 'Implante Total LTDA', 'Componentes para Implantes', 'implante@lab.com'),
(4, 'Arte Dental Próteses', 'Prótese Removível e Aparelhos', 'arte.dental@lab.com'),
(5, 'Lab Odonto Estética', 'Lentes de Contato Dental', 'estetica@lab.com');


-- PACIENTE

INSERT INTO Paciente (cpf, rg, nome, dataNasc, estadoCivil, profissao, email, PlanoSaude_numeroApolice) VALUES
('111.111.111-11', '1111111', 'Marcos Vinicius Silva', '1990-04-12', 'Casado', 'Engenheiro Civil', 'marcos.silva@email.com', 1001),
('222.222.222-22', '2222222', 'Laura Mendes Costa', '1985-08-25', 'Solteiro', 'Analista de Sistemas', 'laura.costa@email.com', 1002),
('333.333.333-33', '3333333', 'Roberto Alves Pinto', '1970-01-05', 'Viúvo', 'Aposentado', 'roberto.pinto@email.com', 1003),
('444.444.444-44', '4444444', 'Juliana Fernandes Lima', '1998-11-01', 'Solteiro', 'Estudante', 'juliana.lima@email.com', NULL),
('555.555.555-55', '5555555', 'Pedro Santos Rocha', '1965-06-18', 'Casado', 'Comerciante', 'pedro.rocha@email.com', 1004),
('666.666.666-66', '6666666', 'Camila Oliveira Soares', '2000-03-03', 'Solteiro', 'Design Gráfico', 'camila.soares@email.com', 1005),
('777.777.777-77', '7777777', 'André Martins Barbosa', '1979-09-15', 'Divorciado', 'Professor', 'andre.barbosa@email.com', 1006),
('888.888.888-88', '8888888', 'Patrícia Neves Viana', '1993-02-28', 'Casado', 'Contadora', 'patricia.viana@email.com', 1007),
('999.999.999-99', '9999999', 'Felipe Gomes Brito', '1982-12-10', 'Solteiro', 'Eletricista', 'felipe.brito@email.com', NULL),
('000.000.000-00', '0000000', 'Helena Reis Xavier', '1955-07-07', 'Viúvo', 'Dona de Casa', 'helena.xavier@email.com', 1008),
('123.123.123-12', '1231231', 'Guilherme Castro Melo', '1988-04-20', 'Casado', 'Corretor de Imóveis', 'guilherme.melo@email.com', 1009),
('321.321.321-32', '3213213', 'Beatriz Silva Torres', '1995-10-10', 'Solteiro', 'Jornalista', 'beatriz.torres@email.com', 1010),
('456.456.456-45', '4564564', 'Marcelo Rocha Dantas', '1973-02-14', 'Divorciado', 'Advogado', 'marcelo.dantas@email.com', NULL),
('654.654.654-65', '6546546', 'Aline Ferreira Ramos', '1991-08-08', 'Casado', 'Arquiteta', 'aline.ramos@email.com', 1011),
('789.789.789-78', '7897897', 'Ricardo Sousa Nogueira', '1960-11-30', 'Solteiro', 'Motorista', 'ricardo.nogueira@email.com', 1012),
('987.987.987-98', '9879879', 'Sofia Alves Teixeira', '2002-05-17', 'Solteiro', 'Estudante', 'sofia.teixeira@email.com', 1013),
('101.101.101-01', '1010101', 'Thiago Lima Pires', '1984-01-22', 'Casado', 'Empresário', 'thiago.pires@email.com', 1014),
('202.202.202-02', '2020202', 'Vanessa Cruz Ribeiro', '1977-06-06', 'Solteiro', 'Secretária', 'vanessa.ribeiro@email.com', NULL),
('303.303.303-03', '3030303', 'Carlos Eduardo Viana', '1999-12-29', 'Solteiro', 'Atendente', 'carlos.viana@email.com', 1015),
('404.404.404-04', '4040404', 'Mariana Gomes Castro', '1996-03-07', 'Casado', 'Programadora', 'mariana.castro@email.com', NULL);


-- TRABALHAR

INSERT INTO Trabalhar (Cargo_cbo, Funcionario_idFuncionario, dataInicio, dataFim) VALUES
(223208, 1, '2018-05-01', '2022-12-31'),  -- Ana: Clínico Geral
(223260, 2, '2019-01-15', NULL),          -- Bruno: Ortodontista
(223208, 3, '2020-03-20', '2023-01-10'),  -- Carla: Clínico Geral
(223260, 4, '2021-07-01', NULL),          -- Daniel: Ortodontista
(223208, 5, '2022-01-10', '2023-03-20'),  -- Erica: Clínico Geral
(422105, 9, '2017-02-01', '2020-05-23'),  -- Isabela: Recepcionista
(515105, 10, '2019-06-01', '2021-02-13'), -- João: ASB
(142105, 11, '2016-11-01', '2020-10-30'), -- Karen: Gerente
(422105, 12, '2021-08-01', NULL),         -- Lucas: Recepcionista
(515105, 13, '2023-01-01', NULL);         -- Mariana: ASB


-- AGENDAMENTO

INSERT INTO Agendamento (idAgendamento, data, estadoDoPaciente, Paciente_cpf, Funcionario_idFuncionario) VALUES
(1, '2016-03-15 09:00:00', 'Agendado', '111.111.111-11', 9),
(2, '2016-07-20 10:30:00', 'Agendado', '222.222.222-22', 12),
(3, '2017-01-10 14:00:00', 'Agendado', '333.333.333-33', 9),
(4, '2017-05-25 15:30:00', 'Agendado', '444.444.444-44', 10),
(5, '2017-11-08 09:30:00', 'Confirmado', '555.555.555-55', 13),
(6, '2018-02-14 11:00:00', 'Confirmado', '666.666.666-66', 9),
(7, '2018-06-19 14:30:00', 'Confirmado', '777.777.777-77', 12),
(8, '2018-12-03 10:00:00', 'Agendado', '888.888.888-88', 10),
(9, '2019-03-29 11:30:00', 'Cancelado', '999.999.999-99', 13),
(10, '2019-08-12 16:00:00', 'Agendado', '000.000.000-00', 9),
(11, '2020-01-22 09:00:00', 'Atendido', '123.123.123-12', 12),
(12, '2020-11-05 10:30:00', 'Atendido', '321.321.321-32', 10),
(13, '2021-04-16 14:00:00', 'Atendido', '456.456.456-45', 9),
(14, '2021-09-01 09:30:00', 'Atendido', '654.654.654-65', 13),
(15, '2021-12-07 11:00:00', 'Agendado', '789.789.789-78', 12),
(16, '2022-05-18 14:30:00', 'Confirmado', '987.987.987-98', 10),
(17, '2023-03-08 10:00:00', 'Cancelado', '101.101.101-01', 9),
(18, '2024-04-10 11:30:00', 'Agendado', '202.202.202-02', 13),
(19, '2025-09-05 16:00:00', 'Atendido', '303.303.303-03', 12),
(20, '2025-11-15 09:00:00', 'Confirmado', '404.404.404-04', 10);


-- CONSULTA

INSERT INTO Consulta (Agendamento_idAgendamento, Agendamento_Funcionario_idFuncionario, Dentista_Funcionario_idFuncionario, Procedimento_idProcedimento, labExterno_idlabExterno, Funcionario_idFuncionario) VALUES
(1, 9, 1, 1, NULL, 10), -- Marcos: Limpeza (Dentista Ana, ASB João)
(2, 12, 2, 12, NULL, 13), -- Laura: Manutenção Ortodôntica (Dentista Bruno, ASB Mariana)
(3, 9, 3, 7, NULL, 10), -- Roberto: Canal (Dentista Carla, ASB João)
(5, 13, 4, 3, NULL, NULL), -- Pedro: Restauração Resina (Dentista Daniel, Sem ASB)
(6, 9, 5, 4, NULL, 13), -- Camila: Extração Simples (Dentista Erica, ASB Mariana)
(7, 12, 6, 13, NULL, 10), -- André: Raspagem Periodontal (Dentista Fábio, ASB João)
(8, 10, 7, 9, 1, 13), -- Patrícia: Facetas (envolve lab 1) (Dentista Giovana, ASB Mariana)
(10, 9, 8, 10, 3, NULL), -- Helena: Implante Ósseo (envolve lab 3) (Dentista Hugo, Sem ASB)
(11, 12, 1, 20, 2, 10), -- Guilherme: Radiografia Panorâmica (envolve lab 2) (Dentista Ana, ASB João)
(12, 10, 2, 1, NULL, 13); -- Beatriz: Limpeza (Dentista Bruno, ASB Mariana)


-- FINANÇA


INSERT INTO Financa (Consulta_Agendamento_idAgendamento, Consulta_Agendamento_Funcionario_idFuncionario, Consulta_Dentista_Funcionario_idFuncionario, Procedimento_idProcedimento, PlanoSaude_numeroApolice, Cargo_cbo) VALUES
(1, 9, 1, 1, 1001, 223208), -- Marcos: Limpeza, Plano 1001, Dentista Geral
(2, 12, 2, 12, 1002, 223260), -- Laura: Manutenção, Plano 1002, Dentista Ortodontista
(3, 9, 3, 7, 1003, 223208), -- Roberto: Canal, Plano 1003, Dentista Geral
(5, 13, 4, 3, 1004, 223260), -- Pedro: Restauração, Plano 1004, Dentista Ortodontista
(6, 9, 5, 4, 1005, 223208), -- Camila: Extração, Plano 1005, Dentista Geral
(7, 12, 6, 13, 1006, 223208), -- André: Raspagem, Plano 1006, Dentista Geral
(8, 10, 7, 9, 1007, 223208), -- Patrícia: Facetas, Plano 1007, Dentista Geral
(10, 9, 8, 10, 1008, 223260), -- Helena: Implante, Plano 1008, Dentista Ortodontista
(11, 12, 1, 20, 1009, 223208), -- Guilherme: Radiografia, Plano 1009, Dentista Geral
(12, 10, 2, 1, 1010, 223260); -- Beatriz: Limpeza, Plano 1010, Dentista Ortodontista


-- ENDEREÇO 

INSERT INTO Endereco (cep, logradouro, numero, compl, bairro, cidade, estado, uf, Paciente_cpf, Funcionario_idFuncionario) VALUES
-- Endereços dos Pacientes (Funcionario_idFuncionario = 1 para preenchimento de NOT NULL)
('50001-001', 'Rua das Flores', 123, 'Apto 101', 'Boa Vista', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 1),
('60002-002', 'Avenida Principal', 456, 'Casa', 'Centro', 'Fortaleza', 'Ceará', 'CE', '222.222.222-22', 1),
('40003-003', 'Travessa da Saudade', 78, NULL, 'Pelourinho', 'Salvador', 'Bahia', 'BA', '333.333.333-33', 1),
('30004-004', 'Rua do Contorno', 900, 'Sala 1', 'Savassi', 'Belo Horizonte', 'Minas Gerais', 'MG', '444.444.444-44', 1),
('20005-005', 'Avenida Atlântica', 150, 'Bloco B', 'Copacabana', 'Rio de Janeiro', 'Rio de Janeiro', 'RJ', '555.555.555-55', 1),
('01006-006', 'Rua Augusta', 2500, NULL, 'Jardins', 'São Paulo', 'São Paulo', 'SP', '666.666.666-66', 1),
('90007-007', 'Rua dos Andradas', 50, 'Loja 10', 'Centro Histórico', 'Porto Alegre', 'Rio Grande do Sul', 'RS', '777.777.777-77', 1),
('80008-008', 'Alameda das Acácias', 33, 'Cobertura', 'Batel', 'Curitiba', 'Paraná', 'PR', '888.888.888-88', 1),
('70009-009', 'Quadra 10 Sul', 10, 'Lote B', 'Asa Sul', 'Brasília', 'Distrito Federal', 'DF', '999.999.999-99', 1),
('54010-010', 'Rua da União', 100, 'Ap 505', 'Pina', 'Recife', 'Pernambuco', 'PE', '000.000.000-00', 1),
-- Endereços dos Funcionários (Paciente_cpf = '111.111.111-11' para preenchimento de NOT NULL)
('50011-011', 'Avenida Sul', 500, NULL, 'Imbiribeira', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 1), -- Ana
('50012-012', 'Rua José Alves', 30, 'Casa 2', 'Madalena', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 2), -- Bruno
('50013-013', 'Rua Aurora', 101, NULL, 'Santo Amaro', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 3), -- Carla
('50014-014', 'Estrada do Encanamento', 200, 'Bloco C', 'Parnamirim', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 4), -- Daniel
('50015-015', 'Rua do Sol', 40, NULL, 'Graças', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 5), -- Erica
('50016-016', 'Avenida Caxangá', 15, 'Sala 3', 'Cordeiro', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 6), -- Fábio
('50017-017', 'Rua João Tude', 75, NULL, 'Casa Amarela', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 7), -- Giovana
('50018-018', 'Avenida Boa Viagem', 1800, 'Apto 802', 'Boa Viagem', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 8), -- Hugo
('50019-019', 'Rua do Bom Jesus', 22, NULL, 'Recife Antigo', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 9), -- Isabela
('50020-020', 'Rua da Moeda', 99, 'Fundos', 'São José', 'Recife', 'Pernambuco', 'PE', '111.111.111-11', 10); -- João


-- TELEFONE

INSERT INTO Telefone (numero, Paciente_cpf, PlanoSaude_numeroApolice, Funcionario_idFuncionario) VALUES
-- Telefones para Pacientes (usando Funcionario 1 e Plano 1001 como preenchedores)
('81991010101', '111.111.111-11', 1001, 1),
('81992020202', '222.222.222-22', 1001, 1),
('81993030303', '333.333.333-33', 1001, 1),
('81994040404', '444.444.444-44', 1001, 1),
('81995050505', '555.555.555-55', 1001, 1),
('81996060606', '666.666.666-66', 1001, 1),
('81997070707', '777.777.777-77', 1001, 1),
('81998080808', '888.888.888-88', 1001, 1),
('81999090909', '999.999.999-99', 1001, 1),
('81988101010', '000.000.000-00', 1001, 1),
-- Telefones para Funcionários (usando Paciente 1 e Plano 1001 como preenchedores)
('8130010001', '111.111.111-11', 1001, 1), -- Ana
('8130020002', '111.111.111-11', 1001, 2), -- Bruno
('8130030003', '111.111.111-11', 1001, 3), -- Carla
('8130040004', '111.111.111-11', 1001, 4), -- Daniel
('8130050005', '111.111.111-11', 1001, 5), -- Erica
('8130060006', '111.111.111-11', 1001, 6), -- Fábio
('8130070007', '111.111.111-11', 1001, 7), -- Giovana
('8130080008', '111.111.111-11', 1001, 8), -- Hugo
('8130090009', '111.111.111-11', 1001, 9), -- Isabela
('8130100010', '111.111.111-11', 1001, 10); -- João


