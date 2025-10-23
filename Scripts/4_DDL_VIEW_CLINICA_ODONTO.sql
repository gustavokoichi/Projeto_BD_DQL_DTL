-- 1
CREATE VIEW DentistasMaisAtivos_2015_2020 AS
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

-- 2
CREATE VIEW ProcedimentoFaturamento AS
SELECT proc.nome Procedimento,
SUM(proc.preco) FaturamentoTotal
FROM Financa fin
INNER JOIN Procedimento proc ON fin.Procedimento_idProcedimento
	GROUP BY proc.nome
		ORDER BY FaturamentoTotal DESC
			LIMIT 5;

-- 3
CREATE VIEW SalarioMedioCargo AS
SELECT cargo.ocupacao Cargo,
CONCAT('R$ ', FORMAT(AVG(cargo.salario), 2, 'de_DE')) MediaSalarial
FROM Cargo cargo
INNER JOIN Trabalhar trab ON cargo.cbo = trab.Cargo_cbo
	GROUP BY cargo.ocupacao
		HAVING COUNT(trab.Funcionario_idfuncionario) > 1;

-- 4
CREATE VIEW PacienteCustoProcedimento AS
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

-- 5
CREATE VIEW NoShowComPS AS
SELECT pac.nome Paciente,
pac.email Email,
ps.nome PlanoSaude
FROM Paciente pac
INNER JOIN PlanoSaude ps ON pac.PlanoSaude_numeroApolice = ps.numeroApolice
LEFT JOIN Agendamento agen ON pac.cpf = agen.Paciente_cpf
LEFT JOIN Consulta con ON agen.idAgendamento = con.Agendamento_idAgendamento
	WHERE con.Agendamento_idAgendamento IS NULL;

-- 6
CREATE VIEW LabNaoUtilizado AS
SELECT le.nome LabExterno,
le.email Email
FROM labExterno le
LEFT JOIN Consulta con ON le.idLabExterno = con.labExterno_idLabExterno
	WHERE con.labExterno_idLabExterno IS NULL;

-- 7
CREATE VIEW ListaConsultas AS
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

-- 8 
CREATE VIEW HoleriteSemDentista AS
SELECT func.nome Funcionario,
cargo.ocupacao Cargo,
CONCAT('R$ ', FORMAT(cargo.salario, 2, 'de_DE')) Salario
FROM Funcionario func
INNER JOIN Trabalhar trab ON func.idFuncionario = trab.Funcionario_idFuncionario
INNER JOIN Cargo cargo ON trab.Cargo_cbo = cargo.cbo
	WHERE func.idfuncionario NOT IN
    (SELECT Funcionario_idFuncionario FROM Dentista)
		ORDER BY cargo.salario DESC;
        
-- 9
CREATE VIEW PsQtdTotalConsultas AS
SELECT ps.nome PlanoSaude,
COUNT(con.Agendamento_idAgendamento) TotalConsultas
FROM PlanoSaude ps
INNER JOIN Paciente pac ON ps.numeroApolice = pac.PlanoSaude_numeroApolice
INNER JOIN Agendamento agen ON pac.cpf = agen.Paciente_cpf
INNER JOIN Consulta con ON agen.idAgendamento = con.Agendamento_idAgendamento
	GROUP BY ps.nome
		ORDER BY TotalConsultas DESC;
        
-- 10
CREATE VIEW DentistaProcedimento AS
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









