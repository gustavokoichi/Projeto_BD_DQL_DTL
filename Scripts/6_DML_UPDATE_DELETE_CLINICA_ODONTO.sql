SET SQL_SAFE_UPDATES = 0;

-- Mudar a contratação de planos Regionais para 'Misto'
UPDATE PlanoSaude
	SET tipoContratacao = 'Misto'
		WHERE abrangencia = 'Regional';
        
-- Aumentar o preço do plano 'OdontoMax Básico' (Apolice 1002) em 10%
UPDATE PlanoSaude
	SET preco = preco * 1.10
		WHERE numeroApolice = 1002;

-- Deletar o plano 'Garantia Dental' (Apolice 1020)
DELETE FROM PlanoSaude
	WHERE numeroApolice = 1020;        

-- Atualizar o estado civil e profissão do paciente Roberto Alves Pinto (CPF 333...)
UPDATE Paciente
	SET estadoCivil = 'Casado', profissao = 'Consultor'
		WHERE cpf = '333.333.333-33';


-- Deletar o vínculo de trabalho da funcionária Isabela (ID 9) com o cargo de Recepcionista (CBO 422105)
DELETE FROM Trabalhar
	WHERE Funcionario_idFuncionario = 9
		AND Cargo_cbo = 422105;


-- Corrigir o email do funcionário Daniel Pereira Rocha (ID 4)
UPDATE Funcionario
	SET email = 'daniel.p.rocha@clinica.com'
		WHERE idFuncionario = 4;


-- Deletar o funcionário Thiago Cruz Almeida (ID 20)
DELETE FROM Funcionario
	WHERE idFuncionario = 20;


-- Reajuste salarial de 8% para Auxiliares de Saúde Bucal (CBO 515105)
UPDATE Cargo
	SET salario = salario * 1.08
		WHERE cbo = 515105;


-- Deleta o endereço associado ao Funcionário João Gomes Nuno (ID 10).
-- Este endereço tinha o CEP '50020-020' e foi inserido com o ID de funcionário 10.
DELETE FROM Endereco
	WHERE Funcionario_idFuncionario = 10;


-- Reduzir em 15% o preço da 'Limpeza e Profilaxia' (ID 1)
UPDATE Procedimento
	SET preco = preco * 0.85
		WHERE idProcedimento = 1;


-- Aumentar o custo do procedimento 'Implante Osseo (Unidade)' (ID 10)
UPDATE Procedimento
	SET custo = 1350.00
		WHERE idProcedimento = 10;

-- Deletar o procedimento 'Biópsia de Lesão Bucal' (ID 16)
DELETE FROM Procedimento
	WHERE idProcedimento = 16;

-- Atualizar o foco do laboratório 'Diagnóstico Maxilo' (ID 2)
UPDATE labExterno
	SET procedimento = 'Radiologia Digital'
		WHERE idlabExterno = 2;

-- Deletar o laboratório 'Lab Odonto Estética' (ID 5)
DELETE FROM labExterno
	WHERE idlabExterno = 5;

-- Marcar o agendamento 10 como concluído, atualizANDo a data de atendimento
UPDATE Agendamento
	SET estadoDoPaciente = 'Concluído',
		data = '2025-10-27 16:00:00'
			WHERE idAgendamento = 10 AND Funcionario_idFuncionario = 9;

-- Deletar o agendamento cancelado de Vanessa Cruz Ribeiro (ID 18)
DELETE FROM Agendamento
	WHERE idAgendamento = 18 AND estadoDoPaciente = 'Cancelado';

-- Corrigir o número de telefone do paciente Pedro Santos Rocha (CPF 555...)
UPDATE Telefone
	SET numero = '81995555555'
		WHERE Paciente_cpf = '555.555.555-55';

-- Mudar o endereço do funcionário Bruno Lima Ferreira (ID 2)
UPDATE Endereco
	SET cep = '54400-000', cidade = 'Jaboatão dos Guararapes'
		WHERE Funcionario_idFuncionario = 2;

-- Deletar a consulta de Pedro Santos Rocha (Agendamento 5)
DELETE FROM Consulta
	WHERE Agendamento_idAgendamento = 5 
AND Agendamento_Funcionario_idFuncionario = 13 
AND Dentista_Funcionario_idFuncionario = 4;