# Mini Mundo - Clínica Odontológica

## Descrição

Este projeto estabelece o modelo de banco de dados para a Clínica Odontológica, com o objetivo de gerenciar de forma eficaz todas as suas operações. O sistema integra dados de atendimento ao paciente, agendamento de consultas, registros clínicos, controle de pessoal e gestão financeira.

## Regras de negócio e integridade de dados

Além das regras de negócio pré-definidas, adicionamos as seguintes para ter uma integridade maior no banco de dados:

### Identificação de Ativos
A coluna `dataFim` na tabela `Trabalhar` aceita NULL, indicando que o funcionário ainda está ativo naquele cargo, conforme a lógica do projeto.

### Especialização de Funcionário
Dentistas são uma especialização de Funcionario (Dentista é uma entidade fraca), garantindo que apenas funcionários ativos possam ser dentistas.

### Vínculo Clínico
Um Registro Clínico (implementado pela tabela `Consulta`) é estritamente vinculado a um Agendamento (intenção), um Dentista (responsável) e um Procedimento (o serviço realizado).

### Endereço e Contato
As tabelas `Endereco` e `Telefone` gerenciam as informações de contato, permitindo múltiplos telefones por paciente/funcionário.

### Controle de Pagamento
A tabela `Financa` centraliza o faturamento, vinculando a consulta, o procedimento, o plano de saúde (se aplicável) e o cargo (para rastrear o custo/salário base do serviço).
