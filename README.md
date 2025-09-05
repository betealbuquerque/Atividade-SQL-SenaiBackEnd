📚 Projetos Práticos de Banco de Dados Relacional

Este repositório documenta as atividades práticas de modelagem e implementação de bancos de dados relacionais, desenvolvidas como parte do curso de Back-End no SENAI. O foco principal está na aplicação de conceitos teóricos em cenários de negócio reais, utilizando o MySQL.

Os três projetos principais são: FoodNet (um marketplace de alimentos), SysBank (um sistema de gestão bancária) e LogiTrack (um sistema de rastreamento logístico).

📌 Objetivos da Atividade
Cada projeto visa solidificar as seguintes habilidades:

Modelagem: Identificar entidades, atributos, chaves primárias e estrangeiras.
Relacionamentos: Definir e representar as cardinalidades (1:1, 1:N, N:N).
Diagrama ER: Criar o Diagrama Entidade-Relacionamento (DER).
Implementação: Escrever scripts SQL para a criação e configuração das tabelas no MySQL.
População de Dados: Inserir dados fictícios para simular e testar as operações do sistema.

🍔 Projeto 1: FoodNet — Sistema de Marketplace
O FoodNet simula a base de dados de um marketplace de alimentos que conecta clientes, restaurantes e entregadores. O sistema gerencia toda a operação, desde o cardápio dos restaurantes até o fluxo de pedidos, avaliações e promoções.

Entidades-Chave:

Clientes 🍽️: Usuários da plataforma.
Restaurantes 🧑‍🍳: Estabelecimentos parceiros.
Produtos 🍕: Itens disponíveis para pedido.
Pedidos 📝: Registro completo dos pedidos dos clientes.
Itens do Pedido 🛒: Detalhes dos produtos em cada pedido.
Entregadores 🏍️: Profissionais responsáveis pela entrega.
Avaliações ⭐: Feedback de clientes sobre restaurantes e entregadores.
Cupons 💰: Gerenciamento de descontos e promoções.

🏦 Projeto 2: SysBank — Sistema de Gestão Bancária
O SysBank simula o back-end de um banco digital, gerenciando de forma integrada as informações dos clientes e suas atividades financeiras, como transações diárias, cartões, empréstimos e investimentos.

Entidades-Chave:

Agências 🏢: Informações das agências físicas ou digitais.
Funcionários 🧑‍💼: Dados dos colaboradores e suas responsabilidades.
Clientes 👨‍👩‍👧‍👦: Cadastro central de todos os correntistas.
Contas 💳: Representação das contas bancárias, com saldo e status.
Cartões 💳: Dados de cartões de débito e crédito associados às contas.
Faturas 🧾: Consolidação de despesas de cartões de crédito.
Transações 🔄: Registro detalhado de todas as movimentações financeiras.
Empréstimos 🤝: Gerenciamento dos contratos de crédito.
Investimentos 📈: Permite aos clientes aplicarem seu dinheiro em produtos financeiros.

🚚 Projeto 3: LogiTrack — Sistema de Rastreamento Logístico
O LogiTrack é um sistema para uma empresa de transportes, projetado para gerenciar e rastrear envios, controlando a coleta, a entrega, a frota de veículos e os motoristas.

Entidades-Chave:

Clientes 📦: Podem ser remetentes e/ou destinatários.
Motoristas 👨‍✈️: Dados dos condutores responsáveis pelas entregas.
Veículos 🚛: Informações da frota, como placa e capacidade de carga.
Envios 🗺️: Registro completo das remessas, de ponta a ponta.
Pacotes 🎁: Detalhes dos itens transportados em cada envio.
Rotas de Entrega 📍: Agrupamento de envios, atribuídos a motoristas e veículos.
Rastreamento 🔍: Histórico de atualizações de status de cada envio.

✨ Resultados Alcançados
Com a conclusão dos projetos, foi possível:

FoodNet: Criar um sistema funcional capaz de registrar clientes, restaurantes, produtos e, principalmente, gerenciar o fluxo de pedidos, entregas e avaliações.
SysBank: Construir uma base de dados robusta para simular as principais operações de um banco digital, como a criação de contas, o registro de transações, empréstimos e investimentos.
LogiTrack: Desenvolver uma solução para o gerenciamento de uma transportadora, permitindo o controle de motoristas e veículos, além do rastreamento em tempo real de pacotes e envios.

Esses projetos demonstram a aplicação prática de conceitos de banco de dados relacionais em cenários distintos, reforçando a importância da modelagem e da integridade de dados para o desenvolvimento de sistemas robustos e eficientes.

🧠 O que aprendi
FoodNet: Aprendi a modelar um sistema de marketplace com lógica de negócio complexa, entendendo o fluxo de dados entre clientes, restaurantes e entregadores, além de gerenciar pedidos, avaliações e cupons.

SysBank: Mergulhei na criação de um sistema financeiro, que exige alta confiabilidade. O projeto ensinou a modelar relacionamentos complexos, como um cliente que pode ter várias contas, e a criar tabelas para rastrear transações e gerenciar contratos.

LogiTrack: Neste projeto, desenvolvi a capacidade de modelar um sistema de logística, aprendendo como representar rotas de entrega, a relação entre motoristas e veículos, e a importância de uma tabela de rastreamento para registrar atualizações de status em tempo real.

🛠️ Tecnologias Utilizadas
MySQL: Sistema de Gerenciamento de Banco de Dados.
SQL: Linguagem de Definição e Manipulação de Dados.
MySQL Workbench / Draw.io: Ferramentas para modelagem e criação de diagramas ER.



🔹 Atividade desenvolvida como parte do curso de Back-End (SENAI).
