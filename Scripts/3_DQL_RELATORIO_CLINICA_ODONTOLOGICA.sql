-- 1) Lista de Dentistas (Nome Dentista, CRO Dentista e TotalConsultas) que realizaram mais de uma consulta entre 2015 e 2020.

SELECT func.nome Dentista,
den.cro CRO,
COUNT(con.Agendamento_idAgendamento) TotalConsultas 
FROM Dentista den
INNER JOIN Funcionario func ON den.Funcionario_idFuncionario = func.idFuncionario
INNER JOIN Consulta con ON den.Funcionario_idFuncionario = con.Dentista_Funcionario_idFuncionario
INNER JOIN Agendamento agen ON con.Agendamento_idAgendamento = agen.idAgendamento
	WHERE YEAR(agen.data) BETWEEN 2015 AND 2020
    GROUP BY func.nome, den.cro
		HAVING TotalConsultas > 1;

-- 2) 5 ProcedimentoS com maior faturamento total, trazendo (Nome do procedimento e faturamento total)
-- ordenado do maior pro menor.

SELECT proc.nome Procedimento,
SUM(proc.preco) FaturamentoTotal
FROM Financa fin
INNER JOIN Procedimento proc ON fin.Procedimento_idProcedimento
	GROUP BY proc.nome
		ORDER BY FaturamentoTotal DESC
			LIMIT 5;
            
-- 3) Lista de funcionários que não mudaram de cargo ou seja, que têm menos de 1 registro na tabela Trabalhar
-- trazendo (Nome Funcionario e Nome Cargo).

SELECT func.nome Funcionario,
cargo.ocupacao Cargo
FROM Funcionario func
INNER JOIN Trabalhar trab ON func.idFuncionario = trab.Funcionario_idFuncionario
LEFT JOIN Cargo cargo ON trab.Cargo_cbo = cargo.cbo
	 GROUP BY func.idFuncionario, cargo.cbo
		HAVING COUNT(trab.Cargo_cbo) <= 1
			ORDER BY func.nome;

-- 4) Funcionários que nunca fizeram nenhum agendamento.
-- Trazendo (Nome Funcionario, Email Funcionario e Cargo)

SELECT func.nome Funcionario,
func.email Email,
cargo.ocupacao Cargo
FROM Funcionario func
LEFT JOIN Agendamento agen ON func.idFuncionario = agen.Funcionario_idFuncionario
LEFT JOIN Trabalhar trab ON func.idFuncionario = trab.Funcionario_idFuncionario
LEFT JOIN Cargo cargo ON trab.Cargo_cbo = cargo.cbo
	WHERE agen.idAgendamento IS NULL
		AND (trab.dataFim > NOW() OR trab.dataFim IS NULL);
    
-- 5) Lista dos cargos (ocupações) e a média salarial de cada um, para cargo que tiveram mais de 1 funcionário.
-- Trazendo (Ocupacao e Salario Medio).

SELECT cargo.ocupacao Cargo,
CONCAT('R$ ', FORMAT(AVG(cargo.salario), 2, 'de_DE')) MediaSalarial
FROM Cargo cargo
INNER JOIN Trabalhar trab ON cargo.cbo = trab.Cargo_cbo
	GROUP BY cargo.ocupacao
		HAVING COUNT(trab.Funcionario_idfuncionario) > 1;

-- 6) Lista de pacientes 1 ou mais agendamento em dias distintos e o número de dias agendados.
-- Trazendo (Nome Paciente, CPF Paciente, Numero Dias)

SELECT pac.nome Paciente,
pac.cpf CPF,
COUNT(DISTINCT (DATE(agen.data))) DiasAgendados
FROM Paciente pac
INNER JOIN Agendamento agen ON pac.cpf = agen.Paciente_cpf
	GROUP BY pac.cpf
		HAVING DiasAgendados >= 1
			ORDER BY DiasAgendados DESC;
            
-- 7) Lista dos pacientes e o custo total que a clinica teve com todos os procedimentos até agora.
-- Trazendo (Nome Paciente, CPF Paciente, Custo Total).

SELECT pac.nome Paciente,
pac.cpf CPF,
SUM(proc.custo) CustoTotal
FROM Paciente pac
INNER JOIN Agendamento agen ON pac.cpf = agen.Paciente_cpf
INNER JOIN Consulta con ON agen.idAgendamento = con.Agendamento_idAgendamento
INNER JOIN Procedimento proc ON con.Procedimento_idProcedimento = proc.idProcedimento
	WHERE agen.data <= NOW()
		GROUP BY pac.cpf
			ORDER BY CustoTotal DESC;

-- 8) Lista de pacientes que possuem um plano de saúde mas que nunca tiveram uma consulta registrada, somente agendamentos.
-- Trazendo (Nome Paciente, Email Paciente, PlanoSaude Paciente)

SELECT pac.nome Paciente,
pac.email Email,
ps.nome PlanoSaude
FROM Paciente pac
INNER JOIN PlanoSaude ps ON pac.PlanoSaude_numeroApolice = ps.numeroApolice
LEFT JOIN Agendamento agen ON pac.cpf = agen.Paciente_cpf
LEFT JOIN Consulta con ON agen.idAgendamento = con.Agendamento_idAgendamento
	WHERE con.Agendamento_idAgendamento IS NULL;
    
-- 9) Lista de dentistas que não têm nenhum agendamento marcado entre (27/10/2025 e 02/11/2025).
-- Trazendo (Nome Dentista e CRO)

SELECT func.nome Dentista,
den.cro CRO
FROM Dentista den
INNER JOIN Funcionario func ON den.Funcionario_idFuncionario = func.idFuncionario
	WHERE den.Funcionario_idFuncionario NOT IN
    (SELECT agen.Funcionario_idFuncionario FROM Agendamento agen
		WHERE agen.data BETWEEN '2025-10-27 00:00:00' and '2025-11-02 23:59:59');
        
-- 10) Procedimentos realizados por Ana Souza Costa (id = 1).
-- Trazendo (Nome Procedimentos)

SELECT proc.nome Procedimento
FROM Procedimento proc
	WHERE proc.idProcedimento IN
    (SELECT con.Procedimento_idProcedimento FROM Consulta con
		WHERE con.Dentista_Funcionario_idFuncionario = 1 );
        
-- 11) Laboratórios que nunca foram utilizados em nenhuma consulta registrada.
-- Trazendo (Nome LabExterno e Email LabExterno).

SELECT le.nome LabExterno,
le.email Email
FROM labExterno le
LEFT JOIN Consulta con ON le.idLabExterno = con.labExterno_idLabExterno
	WHERE con.labExterno_idLabExterno IS NULL;
    
-- 12) Procedimentos que não foram usados em Consultas ou seja, não possuem registro em Financa.
-- Trazendo (Nome Procedimento)

SELECT proc.nome Procedimento
FROM Procedimento proc
INNER JOIN Consulta con ON proc.idProcedimento = con.Procedimento_idProcedimento
LEFT JOIN Financa f ON con.Procedimento_idProcedimento = f.Procedimento_idProcedimento
	WHERE f.Procedimento_idProcedimento IS NULL
		GROUP BY proc.nome;
        
-- 13) Lista de consultas com data/hora, paciente, dentista, procedimento e plano de saúde do paciente.
-- Trazendo (Data_Hora Consulta, Paciente Nome, Dentista Nome, Procedimento nome, PlanoSaude Nome).

SELECT agen.data Dataconsulta,
pac.nome Paciente,
func.nome Dentista,
proc.nome Procedimento,
ps.nome PlanoSaude
FROM Consulta con
INNER JOIN Agendamento agen ON con.Agendamento_idAgendamento = agen.idAgendamento
INNER JOIN Paciente pac ON agen.Paciente_cpf = pac.cpf
INNER JOIN Dentista den ON con.Dentista_Funcionario_idfuncionario = den.Funcionario_idFuncionario
INNER JOIN Funcionario func ON den.Funcionario_idfuncionario = func.idFuncionario
LEFT JOIN Procedimento proc ON con.Procedimento_idProcedimento = proc.idProcedimento
LEFT JOIN PlanoSaude ps ON pac.PlanoSaude_numeroApolice = ps.numeroApolice
	ORDER BY agen.data DESC;
    
-- 14) Lista os funcionários NÃO dentistas mais bem pagos.
-- Trazendo (Endereco (Logradouro, Numero e Bairro), Nome Cargo e Salario).

SELECT func.nome Funcionario,
cargo.ocupacao Cargo,
CONCAT('R$ ', FORMAT(cargo.salario, 2, 'de_DE')) Salario
FROM Funcionario func
INNER JOIN Trabalhar trab ON func.idFuncionario = trab.Funcionario_idFuncionario
INNER JOIN Cargo cargo ON trab.Cargo_cbo = cargo.cbo
	WHERE func.idfuncionario NOT IN
    (SELECT Funcionario_idFuncionario FROM Dentista)
		ORDER BY cargo.salario DESC;

-- 15) Lista de funcionários com salários abaixo da média excluindo dentistas.
-- Trazendo (Nome Funcionario, Salario Funcionario, Ocupacao Funcionario).

SELECT func.nome Funcionario,
CONCAT('R$ ', FORMAT(cargo.salario, 2, 'de_DE')) Salario,
cargo.ocupacao Cargo
FROM Funcionario func
INNER JOIN Trabalhar trab ON func.idFuncionario = trab.Funcionario_idFuncionario
INNER JOIN Cargo cargo ON trab.Cargo_cbo = cargo.cbo
	WHERE func.idFuncionario NOT IN
    (SELECT Funcionario_idFuncionario FROM Dentista den) AND cargo.salario < 
    (SELECT AVG(salario) FROM Cargo cargo)
		ORDER BY cargo.salario DESC;
        
-- 16) Lista de de todos os planos de saúde e a quantidade total de consultas relizados por seus pacientes.
-- Trazendo (Nome PlanoSaude, TotalConsultas)

SELECT ps.nome PlanoSaude,
COUNT(con.Agendamento_idAgendamento) TotalConsultas
FROM PlanoSaude ps
INNER JOIN Paciente pac ON ps.numeroApolice = pac.PlanoSaude_numeroApolice
INNER JOIN Agendamento agen ON pac.cpf = agen.Paciente_cpf
INNER JOIN Consulta con ON agen.idAgendamento = con.Agendamento_idAgendamento
	GROUP BY ps.nome
		ORDER BY TotalConsultas DESC;
        
-- 17) Lista de agendamentos para pacientes que moran no bairro Boa Vista
-- Trazendo (Nome Funcionario, Nome Paciente e Data Agendamento)

SELECT func.nome Funcionario,
pac.nome Paciente,
agen.data DataAgendamento
FROM Agendamento agen
INNER JOIN Funcionario func ON agen.Funcionario_idFuncionario = func.idFuncionario
INNER JOIN Paciente pac ON agen.Paciente_cpf = pac.cpf
INNER JOIN Endereco e ON pac.cpf = e.Paciente_cpf
	WHERE e.bairro = 'Boa Vista'
		ORDER BY agen.data;
        
-- 18) Lista de todos os dentistas e os procedimentos únicos que já realizaram.
-- Trazendo (Nome Dentista, CRO Dentista).

SELECT
func.nome Dentista,
den.cro CRO,
GROUP_CONCAT(DISTINCT proc.nome SEPARATOR ', ') AS ProcedimentosRealizados
FROM Dentista den
INNER JOIN Funcionario func ON den.Funcionario_idFuncionario = func.idFuncionario
INNER JOIN Consulta con ON den.Funcionario_idFuncionario = con.Dentista_Funcionario_idFuncionario
INNER JOIN Procedimento proc ON con.Procedimento_idProcedimento = proc.idProcedimento
	GROUP BY func.nome, den.cro
		ORDER BY func.nome;
        
 -- 19) Lista do total de agendamentos por status do paciente.
 -- Trazendo (Estado Paciente, TotalOcorrencias).
 
 SELECT agen.estadoDoPaciente Status,
 COUNT(agen.idAgendamento) TotalOcorrencias
 FROM Agendamento agen
	GROUP BY agen.estadoDoPaciente
		ORDER BY TotalOcorrencias;
        
 -- 20) Lista de todos os pacientes que possuem pelo menos 1 agendamento e todos os seus numeros de telefone.
 -- Trazendo (Nome Paciente, CPF Paciente, Telefone Paciente).
 
 SELECT pac.nome Paciente,
 pac.cpf CPF,
 COALESCE(GROUP_CONCAT(tel.numero SEPARATOR ', '), 'Sem registro') telefones
 FROM Paciente pac
 INNER JOIN Agendamento agen ON pac.cpf = agen.Paciente_cpf
 LEFT JOIN Telefone tel ON pac.cpf = tel.Paciente_cpf
	GROUP BY pac.nome, pac.cpf
		ORDER BY pac.nome;
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        