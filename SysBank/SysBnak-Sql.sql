create	database sysBank;

use	 SysBank;

CREATE TABLE Agencias (
    id_agencia INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome_completo VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    id_agencia INT,
    FOREIGN KEY (id_agencia) REFERENCES Agencias(id_agencia)
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome_completo VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Contas (
    id_conta INT AUTO_INCREMENT PRIMARY KEY,
    numero_conta VARCHAR(20) NOT NULL UNIQUE,
    tipo ENUM('Corrente', 'Poupança') NOT NULL,
    saldo DECIMAL(15, 2) NOT NULL,
    data_abertura DATE NOT NULL,
    status ENUM('Ativa', 'Inativa', 'Bloqueada') NOT NULL,
    id_cliente INT,
    id_agencia INT,
    id_funcionario INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_agencia) REFERENCES Agencias(id_agencia),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE Cartoes (
    id_cartao INT AUTO_INCREMENT PRIMARY KEY,
    numero_cartao VARCHAR(20) NOT NULL UNIQUE,
    tipo ENUM('Crédito', 'Débito') NOT NULL,
    data_validade DATE NOT NULL,
    limite DECIMAL(15, 2),
    status ENUM('Ativo', 'Bloqueado') NOT NULL,
    id_conta INT,
    FOREIGN KEY (id_conta) REFERENCES Contas(id_conta)
);

CREATE TABLE Faturas (
    id_fatura INT AUTO_INCREMENT PRIMARY KEY,
    id_cartao INT,
    data_vencimento DATE NOT NULL,
    valor_total DECIMAL(15, 2) NOT NULL,
    status ENUM('Aberta', 'Paga', 'Vencida') NOT NULL,
    FOREIGN KEY (id_cartao) REFERENCES Cartoes(id_cartao)
);

CREATE TABLE Transacoes (
    id_transacao INT AUTO_INCREMENT PRIMARY KEY,
    id_conta_origem INT,
    id_conta_destino INT,
    tipo ENUM('Depósito', 'Saque', 'Transferência', 'Pagamento') NOT NULL,
    valor DECIMAL(15, 2) NOT NULL,
    data_hora DATETIME NOT NULL,
    FOREIGN KEY (id_conta_origem) REFERENCES Contas(id_conta),
    FOREIGN KEY (id_conta_destino) REFERENCES Contas(id_conta)
);

CREATE TABLE Beneficiarios (
    id_beneficiario INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    nome_favorecido VARCHAR(255) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL,
    banco VARCHAR(255) NOT NULL,
    agencia VARCHAR(10) NOT NULL,
    conta VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    valor_total DECIMAL(15, 2) NOT NULL,
    taxa_juros DECIMAL(5, 2) NOT NULL,
    numero_parcelas INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    status ENUM('Em análise', 'Aprovado', 'Quitado') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE ParcelasEmprestimo (
    id_parcela INT AUTO_INCREMENT PRIMARY KEY,
    id_emprestimo INT,
    numero_parcela INT NOT NULL,
    valor DECIMAL(15, 2) NOT NULL,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE,
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimos(id_emprestimo)
);

CREATE TABLE Investimentos (
    id_investimento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    tipo_produto VARCHAR(255) NOT NULL,
    valor_aplicado DECIMAL(15, 2) NOT NULL,
    data_aplicacao DATE NOT NULL,
    rentabilidade DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Agencias (nome, endereco) VALUES
('Agência Central', 'Rua Principal, 123 - Centro, São Paulo'),
('Agência Sul', 'Av. das Américas, 456 - Barra, Rio de Janeiro'),
('Agência Norte', 'Rua das Flores, 789 - Zona Norte, Belo Horizonte'),
('Agência Leste', 'Rua 25 de Março, 101 - Centro, Salvador'),
('Agência Oeste', 'Rua do Comércio, 202 - Zona Oeste, Curitiba'),
('Agência Digital', 'Online, Rua Virtual, São Paulo'),
('Agência ABC', 'Rua das Pedras, 333 - Campinas, SP'),
('Agência XYZ', 'Av. Paulista, 500 - São Paulo'),
('Agência Vitória', 'Rua do Mercado, 612 - Vitória, ES'),
('Agência Nova Era', 'Rua do Sol, 410 - Rio de Janeiro');

INSERT INTO Funcionarios (cpf, nome_completo, cargo, id_agencia) VALUES
('12345678901', 'Carlos Silva', 'Gerente de Contas', 1),
('98765432100', 'Ana Souza', 'Caixa', 2),
('11122233344', 'Bruna Oliveira', 'Assistente Administrativo', 3),
('22233344455', 'Marcos Almeida', 'Gerente de Contas', 4),
('33344455566', 'Luana Pereira', 'Caixa', 5),
('44455566677', 'Ricardo Souza', 'Assistente Administrativo', 6),
('55566677788', 'Fernanda Costa', 'Gerente de Investimentos', 7),
('66677788899', 'Gabriel Lima', 'Analista de Crédito', 8),
('77788899900', 'Juliana Santos', 'Caixa', 9),
('88899900011', 'Paulo Ferreira', 'Gerente de Contas', 10);

INSERT INTO Clientes (cpf, nome_completo, data_nascimento, endereco, email, telefone) VALUES
('12345678901', 'João da Silva', '1985-07-15', 'Rua das Palmeiras, 200 - São Paulo', 'joao@gmail.com', '11987654321'),
('23456789012', 'Maria Oliveira', '1990-04-22', 'Av. Brasil, 45 - Rio de Janeiro', 'maria@gmail.com', '21987654322'),
('34567890123', 'Carlos Alberto', '1982-10-30', 'Rua dos Canela, 100 - Belo Horizonte', 'carlos@gmail.com', '31987654323'),
('45678901234', 'Bruna Santos', '1995-12-05', 'Rua dos Bobos, 200 - Curitiba', 'bruna@gmail.com', '41987654324'),
('56789012345', 'Luana Pereira', '1993-01-10', 'Av. da República, 300 - Salvador', 'luana@gmail.com', '51987654325'),
('67890123456', 'Ricardo Costa', '1988-03-21', 'Rua do Sol, 400 - Campinas', 'ricardo@gmail.com', '61987654326'),
('78901234567', 'Fernanda Lima', '1997-06-12', 'Rua Flor de Lis, 500 - Porto Alegre', 'fernanda@gmail.com', '71987654327'),
('89012345678', 'Paulo Santos', '1991-08-03', 'Rua da Paz, 600 - Fortaleza', 'paulo@gmail.com', '81987654328'),
('90123456789', 'Juliana Oliveira', '1987-09-09', 'Av. dos Navegantes, 700 - Recife', 'juliana@gmail.com', '91987654329'),
('01234567890', 'Gabriel Ferreira', '1992-11-25', 'Rua das Acácias, 800 - Manaus', 'gabriel@gmail.com', '01987654330');

INSERT INTO Contas (numero_conta, tipo, saldo, data_abertura, status, id_cliente, id_agencia, id_funcionario) VALUES
('1234567890', 'Corrente', 2500.50, '2022-01-15', 'Ativa', 1, 1, 1),
('2345678901', 'Poupança', 1500.75, '2022-03-22', 'Ativa', 2, 2, 2),
('3456789012', 'Corrente', 5000.00, '2022-07-05', 'Ativa', 3, 3, 3),
('4567890123', 'Poupança', 1000.50, '2022-05-18', 'Ativa', 4, 4, 4),
('5678901234', 'Corrente', 3000.20, '2022-02-11', 'Bloqueada', 5, 5, 5),
('6789012345', 'Poupança', 7000.00, '2022-09-08', 'Ativa', 6, 6, 6),
('7890123456', 'Corrente', 1200.00, '2022-06-14', 'Ativa', 7, 7, 7),
('8901234567', 'Poupança', 2500.10, '2022-01-21', 'Inativa', 8, 8, 8),
('9012345678', 'Corrente', 4500.80, '2022-04-10', 'Ativa', 9, 9, 9),
('0123456789', 'Poupança', 300.50, '2022-08-15', 'Bloqueada', 10, 10, 10);

INSERT INTO Cartoes (numero_cartao, tipo, data_validade, limite, status, id_conta) VALUES
('1111222233334444', 'Débito', '2026-10-20', NULL, 'Ativo', 1),
('2222333344445555', 'Crédito', '2025-12-15', 5000.00, 'Ativo', 2),
('3333444455556666', 'Débito', '2027-04-10', NULL, 'Ativo', 3),
('4444555566667777', 'Crédito', '2025-07-12', 3000.00, 'Bloqueado', 4),
('5555666677778888', 'Débito', '2026-03-25', NULL, 'Ativo', 5),
('6666777788889999', 'Crédito', '2027-09-30', 10000.00, 'Ativo', 6),
('7777888899990000', 'Débito', '2025-06-11', NULL, 'Ativo', 7),
('8888999900001111', 'Crédito', '2026-05-19', 7000.00, 'Ativo', 8),
('9999000011112222', 'Débito', '2027-11-01', NULL, 'Ativo', 9),
('0000111122223333', 'Crédito', '2025-01-07', 2000.00, 'Ativo', 10);

INSERT INTO Faturas (id_cartao, data_vencimento, valor_total, status) VALUES
(1, '2023-11-20', 1000.50, 'Aberta'),
(2, '2023-11-15', 2000.00, 'Paga'),
(3, '2023-12-10', 1500.25, 'Aberta'),
(4, '2023-10-05', 500.00, 'Vencida'),
(5, '2023-12-02', 750.75, 'Aberta'),
(6, '2023-11-25', 1800.00, 'Aberta'),
(7, '2023-10-15', 1200.50, 'Paga'),
(8, '2023-11-10', 650.20, 'Aberta'),
(9, '2023-12-12', 3000.00, 'Aberta'),
(10, '2023-11-30', 800.00, 'Paga');
	