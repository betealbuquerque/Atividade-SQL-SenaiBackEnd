📚 Atividade Prática – Banco de Dados Relacional

Curso de Back-End – SENAI

Este repositório reúne as atividades práticas propostas em sala de aula, com foco em Banco de Dados Relacional, envolvendo duas aplicações:

🏦 SysBank – Sistema de Gestão Bancária

🚚 LogiTrack – Sistema de Rastreamento Logístico

Ambos os projetos têm como objetivo modelar, implementar e popular bancos de dados relacionais, utilizando conceitos de modelagem, DER, criação de tabelas em MySQL e inserção de dados fictícios.

📌 Objetivos da Atividade

Identificar entidades, atributos, chaves primárias e estrangeiras.

Definir relacionamentos e cardinalidades.

Criar o DER (Diagrama Entidade-Relacionamento).

Implementar a modelagem em MySQL.

Popular o banco com dados fictícios que simulem situações reais.

🏦 Projeto 1 – SysBank (Sistema Bancário)

O SysBank é um sistema para gerenciar clientes, contas, transações e produtos financeiros de um banco digital.

Escopo

Agências – Cadastro das agências físicas ou digitais.

Funcionários – Dados dos colaboradores e vínculo com agência.

Clientes – Cadastro central dos clientes do banco.

Contas – Contas bancárias vinculadas a clientes e agências.

Cartões – Débito e crédito associados a contas.

Faturas – Controle de gastos de cartões de crédito.

Transações – Registro de depósitos, saques, transferências e pagamentos.

Beneficiários – Agenda de favorecidos para transferências recorrentes.

Empréstimos – Contratos de crédito solicitados pelos clientes.

Parcelas – Detalhamento dos pagamentos de empréstimos.

Investimentos – Aplicações financeiras (CDB, ações, etc).

🚚 Projeto 2 – LogiTrack (Sistema de Rastreamento Logístico)

O LogiTrack é um sistema para gerenciar entregas, rastrear pacotes e controlar motoristas e veículos de uma transportadora.

Escopo

Clientes – Remetentes e destinatários.

Motoristas – Condutores responsáveis pelas entregas.

Veículos – Frota utilizada nas rotas de entrega.

Envios – Registro de remessas com coleta, destino e status.

Pacotes – Itens transportados em cada envio.

Rotas de Entrega – Agrupamento de envios atribuídos a motoristas e veículos.

Rastreamento – Histórico de atualizações de cada envio.

📐 Etapas Realizadas

✅ Modelagem: Definição das entidades, atributos e relacionamentos.
✅ DER: Criação dos diagramas Entidade-Relacionamento.
✅ Implementação: Scripts SQL para criação das tabelas no MySQL.
✅ Inserção de dados fictícios: Clientes, contas, envios, pacotes e movimentações.

🚀 Tecnologias Utilizadas

MySQL – Sistema de gerenciamento de banco de dados.

SQL – Linguagem de definição e manipulação de dados.

MySQL Workbench / Draw.io – Ferramentas para modelagem e DER.

📂 Estrutura do Repositório

/sysbank → Documentação e scripts do sistema bancário.

/logitrack → Documentação e scripts do sistema logístico.

/modelagem → Diagramas DER.

/scripts → Scripts SQL (DDL e DML).

/exemplos → Consultas SQL para simulação de operações.

✨ Resultados Esperados

Com os projetos, será possível:

SysBank: cadastrar clientes, contas, transações, cartões, empréstimos e investimentos.

LogiTrack: gerenciar entregas, motoristas, veículos, pacotes e rastreamento de status.

Ambos os sistemas reforçam a aplicação prática de conceitos de bancos de dados relacionais em cenários distintos (bancário e logístico).

🔹 Atividade desenvolvida como parte do curso de Back-End (SENAI).
