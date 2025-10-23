USE ClinicaOdontologica;

-- 1. Adicionar uma coluna 'status' na tabela Paciente
ALTER TABLE Paciente
ADD COLUMN status ENUM('Ativo', 'Inativo', 'Suspenso') NOT NULL DEFAULT 'Ativo';

-- 2. Modificar o tamanho da coluna 'nome' na tabela Funcionario
ALTER TABLE Funcionario
MODIFY COLUMN nome VARCHAR(100);

-- 3. Adicionar uma coluna 'cnpj' na tabela PlanoSaude
ALTER TABLE PlanoSaude
ADD COLUMN cnpj VARCHAR(18) UNIQUE AFTER nome;

-- 4. Adicionar uma coluna 'formaAgendamento' na tabela Agendamento
ALTER TABLE Agendamento
ADD COLUMN formaAgendamento VARCHAR(20) NOT NULL DEFAULT 'Presencial';

-- 5. Adicionar um índice na coluna 'descricao' da tabela Procedimento
ALTER TABLE Procedimento
ADD INDEX idx_descricao (`descricao`);

-- 6. Remover a restrição ZEROFILL da coluna 'salario' na tabela Cargo
ALTER TABLE Cargo
MODIFY COLUMN salario DECIMAL(7,2) UNSIGNED NOT NULL;

-- 7. NOVA ALTERAÇÃO SEGURA: Adicionar uma coluna 'tipo' na tabela Procedimento
ALTER TABLE Procedimento
ADD COLUMN tipo VARCHAR(45) AFTER nome;

-- 8. Adicionar uma restrição CHECK para garantir dataFim >= dataInicio
ALTER TABLE Trabalhar
ADD CONSTRAINT chk_datas_trabalho CHECK (dataFim >= dataInicio);

-- 9. Modificar a coluna 'compl' para NOT NULL (Obrigatória)
ALTER TABLE PlanoSaude
MODIFY COLUMN preco DECIMAL(10,2) UNSIGNED NOT NULL;

-- 10. NOVA ALTERAÇÃO SEGURA: Aumentar o tamanho do campo 'email' na tabela Funcionario
ALTER TABLE Funcionario
MODIFY COLUMN email VARCHAR(100);