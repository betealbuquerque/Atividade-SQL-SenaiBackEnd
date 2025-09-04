CREATE DATABASE LogiTrack;

USE LogiTrack;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento ENUM('CPF', 'CNPJ') NOT NULL,
    documento VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco TEXT NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Motoristas (
    id_motorista INT PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cnh VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Veiculos (
    placa VARCHAR(10) PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    capacidade_kg DECIMAL(10,2) NOT NULL
);

CREATE TABLE Envios (
    codigo_rastreamento VARCHAR(20) PRIMARY KEY,
    id_remetente INT NOT NULL,
    id_destinatario INT NOT NULL,
    endereco_coleta TEXT NOT NULL,
    endereco_entrega TEXT NOT NULL,
    data_solicitacao DATE NOT NULL,
    status ENUM('Aguardando Coleta', 'Em Trânsito', 'Entregue') NOT NULL,

    FOREIGN KEY (id_remetente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_destinatario) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Pacotes (
    id_pacote INT PRIMARY KEY AUTO_INCREMENT,
    codigo_rastreamento VARCHAR(20) NOT NULL,
    peso DECIMAL(10,2) NOT NULL,
    dimensoes VARCHAR(100),
    descricao TEXT,

    FOREIGN KEY (codigo_rastreamento) REFERENCES Envios(codigo_rastreamento)
);

CREATE TABLE Rotas (
    id_rota INT PRIMARY KEY AUTO_INCREMENT,
    id_motorista INT NOT NULL,
    placa_veiculo VARCHAR(10) NOT NULL,
    data_saida DATE NOT NULL,
    data_chegada DATE,

    FOREIGN KEY (id_motorista) REFERENCES Motoristas(id_motorista),
    FOREIGN KEY (placa_veiculo) REFERENCES Veiculos(placa)
);

CREATE TABLE Envios_Rotas (
    id_rota INT,
    codigo_rastreamento VARCHAR(20),

    PRIMARY KEY (id_rota, codigo_rastreamento),
    FOREIGN KEY (id_rota) REFERENCES Rotas(id_rota),
    FOREIGN KEY (codigo_rastreamento) REFERENCES Envios(codigo_rastreamento)
);

CREATE TABLE Rastreamento_Status (
    id_status INT PRIMARY KEY AUTO_INCREMENT,
    codigo_rastreamento VARCHAR(20) NOT NULL,
    data_hora DATETIME NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,

    FOREIGN KEY (codigo_rastreamento) REFERENCES Envios(codigo_rastreamento)
);

INSERT INTO Clientes (id_cliente, cpf_cnpj, nome, endereco, email) VALUES
(1, '12345678901', 'João Silva', 'Rua das Flores, 123 - São Paulo/SP', 'joao.silva@email.com'),
(2, '98765432100', 'Maria Oliveira', 'Av. Brasil, 456 - Rio de Janeiro/RJ', 'maria.oliveira@email.com'),
(3, '11223344556', 'Carlos Pereira', 'Rua A, 10 - Belo Horizonte/MG', 'carlos.pereira@email.com'),
(4, '22334455667', 'Fernanda Souza', 'Rua B, 50 - Curitiba/PR', 'fernanda.souza@email.com'),
(5, '33445566778', 'Ricardo Santos', 'Av. Central, 500 - Salvador/BA', 'ricardo.santos@email.com'),
(6, '44556677889', 'Ana Costa', 'Rua C, 70 - Porto Alegre/RS', 'ana.costa@email.com'),
(7, '55667788990', 'Juliana Lima', 'Rua D, 12 - Recife/PE', 'juliana.lima@email.com'),
(8, '66778899001', 'Roberto Almeida', 'Av. Paulista, 1000 - São Paulo/SP', 'roberto.almeida@email.com'),
(9, '77889900112', 'Patrícia Rocha', 'Rua E, 200 - Fortaleza/CE', 'patricia.rocha@email.com'),
(10, '88990011223', 'Felipe Gomes', 'Av. Atlântica, 150 - Rio de Janeiro/RJ', 'felipe.gomes@email.com'),
(11, '11223300987', 'Camila Fernandes', 'Rua F, 250 - Manaus/AM', 'camila.fernandes@email.com'),
(12, '22334400987', 'Thiago Martins', 'Rua G, 300 - Brasília/DF', 'thiago.martins@email.com'),
(13, '33445500987', 'Beatriz Ramos', 'Rua H, 400 - Goiânia/GO', 'beatriz.ramos@email.com'),
(14, '44556600987', 'Gustavo Nunes', 'Av. Norte, 600 - Recife/PE', 'gustavo.nunes@email.com'),
(15, '55667700987', 'Sofia Melo', 'Rua I, 700 - Belém/PA', 'sofia.melo@email.com'),
(16, '66778800987', 'Lucas Ferreira', 'Rua J, 800 - Vitória/ES', 'lucas.ferreira@email.com'),
(17, '77889900987', 'Larissa Carvalho', 'Av. Sul, 900 - Natal/RN', 'larissa.carvalho@email.com'),
(18, '88990000987', 'Pedro Barbosa', 'Rua K, 100 - Florianópolis/SC', 'pedro.barbosa@email.com'),
(19, '99001100987', 'Mariana Castro', 'Rua L, 150 - Campo Grande/MS', 'mariana.castro@email.com'),
(20, '11122233344', 'André Teixeira', 'Av. Oeste, 200 - Teresina/PI', 'andre.teixeira@email.com');

INSERT INTO Motoristas (id_motorista, cpf, nome, cnh) VALUES
(1, '32165498700', 'Eduardo Ramos', 'CNH1234567'),
(2, '65498732111', 'Marcelo Alves', 'CNH2345678'),
(3, '74185296322', 'Rodrigo Mota', 'CNH3456789'),
(4, '85296374133', 'Diego Souza', 'CNH4567890'),
(5, '96374185244', 'Fabiano Lopes', 'CNH5678901'),
(6, '14725836955', 'Paulo Henrique', 'CNH6789012'),
(7, '25836914766', 'Renato Cardoso', 'CNH7890123'),
(8, '36914725877', 'Fábio Moreira', 'CNH8901234'),
(9, '95175385288', 'Sérgio Lima', 'CNH9012345'),
(10, '75395145699', 'Alexandre Costa', 'CNH0123456');

INSERT INTO Veiculos (placa, modelo, capacidade_kg) VALUES
('ABC1A11', 'Mercedes Actros', 18000),
('DEF2B22', 'Volvo FH', 20000),
('GHI3C33', 'Scania R450', 22000),
('JKL4D44', 'Iveco Stralis', 17000),
('MNO5E55', 'DAF XF', 21000),
('PQR6F66', 'MAN TGX', 19000),
('STU7G77', 'Volkswagen Constellation', 16000),
('VWX8H88', 'Ford Cargo', 15000),
('YZA9I99', 'Mercedes Atego', 14000),
('BCD0J00', 'Scania P280', 13000);

INSERT INTO Envios (codigo_rastreamento, endereco_coleta, endereco_entrega, data_solicitacao, status) VALUES
('R001', 'Rua das Flores, 123 - São Paulo/SP', 'Av. Brasil, 456 - Rio de Janeiro/RJ', '2025-08-01', 'Aguardando Coleta'),
('R002', 'Av. Central, 500 - Salvador/BA', 'Rua B, 50 - Curitiba/PR', '2025-08-02', 'Em Trânsito'),
('R003', 'Rua A, 10 - Belo Horizonte/MG', 'Rua C, 70 - Porto Alegre/RS', '2025-08-03', 'Entregue'),
('R004', 'Av. Paulista, 1000 - São Paulo/SP', 'Rua E, 200 - Fortaleza/CE', '2025-08-04', 'Aguardando Coleta'),
('R005', 'Rua F, 250 - Manaus/AM', 'Av. Atlântica, 150 - Rio de Janeiro/RJ', '2025-08-05', 'Em Trânsito'),
('R006', 'Rua G, 300 - Brasília/DF', 'Rua H, 400 - Goiânia/GO', '2025-08-06', 'Entregue'),
('R007', 'Av. Norte, 600 - Recife/PE', 'Rua I, 700 - Belém/PA', '2025-08-07', 'Em Trânsito'),
('R008', 'Rua J, 800 - Vitória/ES', 'Av. Sul, 900 - Natal/RN', '2025-08-08', 'Entregue'),
('R009', 'Rua K, 100 - Florianópolis/SC', 'Rua L, 150 - Campo Grande/MS', '2025-08-09', 'Aguardando Coleta'),
('R010', 'Av. Oeste, 200 - Teresina/PI', 'Rua das Flores, 123 - São Paulo/SP', '2025-08-10', 'Em Trânsito'),
('R011', 'Av. Brasil, 456 - Rio de Janeiro/RJ', 'Rua A, 10 - Belo Horizonte/MG', '2025-08-11', 'Entregue'),
('R012', 'Rua B, 50 - Curitiba/PR', 'Rua F, 250 - Manaus/AM', '2025-08-12', 'Aguardando Coleta'),
('R013', 'Rua C, 70 - Porto Alegre/RS', 'Rua G, 300 - Brasília/DF', '2025-08-13', 'Em Trânsito'),
('R014', 'Rua E, 200 - Fortaleza/CE', 'Rua H, 400 - Goiânia/GO', '2025-08-14', 'Entregue'),
('R015', 'Av. Atlântica, 150 - Rio de Janeiro/RJ', 'Av. Norte, 600 - Recife/PE', '2025-08-15', 'Aguardando Coleta'),
('R016', 'Rua I, 700 - Belém/PA', 'Rua J, 800 - Vitória/ES', '2025-08-16', 'Entregue'),
('R017', 'Av. Sul, 900 - Natal/RN', 'Rua K, 100 - Florianópolis/SC', '2025-08-17', 'Em Trânsito'),
('R018', 'Rua L, 150 - Campo Grande/MS', 'Av. Oeste, 200 - Teresina/PI', '2025-08-18', 'Entregue'),
('R019', 'Rua das Flores, 123 - São Paulo/SP', 'Av. Central, 500 - Salvador/BA', '2025-08-19', 'Aguardando Coleta'),
('R020', 'Rua H, 400 - Goiânia/GO', 'Rua D, 12 - Recife/PE', '2025-08-20', 'Em Trânsito');

INSERT INTO Pacotes (id_pacote, peso_kg, dimensoes, descricao, codigo_envio) VALUES
(1, 10.5, '40x30x20', 'Roupas', 'R001'),
(2, 5.2, '20x20x15', 'Livros', 'R001'),
(3, 15.0, '50x40x35', 'Eletrodoméstico', 'R002'),
(4, 2.5, '15x10x10', 'Celular', 'R003'),
(5, 8.0, '35x25x20', 'Brinquedos', 'R004'),
(6, 12.3, '45x30x25', 'Peças Automotivas', 'R005'),
(7, 18.0, '60x40x40', 'Móveis desmontados', 'R006'),
(8, 1.2, '10x10x5', 'Acessórios eletrônicos', 'R007'),
(9, 3.7, '25x20x15', 'Utensílios de cozinha', 'R008'),
(10, 22.0, '70x50x45', 'Equipamento de ginástica', 'R009'),
(11, 6.4, '30x25x15', 'Calçados', 'R010'),
(12, 9.8, '40x35x25', 'Ferramentas', 'R011'),
(13, 14.0, '55x40x30', 'Impressora', 'R012'),
(14, 7.6, '30x30x20', 'Material escolar', 'R013'),
(15, 11.2, '45x35x25', 'Cosméticos', 'R014'),
(16, 4.0, '20x15x10', 'Perfumes', 'R015'),
(17, 16.5, '60x50x40', 'Computador', 'R016'),
(18, 2.8, '18x15x12', 'Relógio', 'R017'),
(19, 19.3, '65x45x40', 'Monitor de vídeo', 'R018'),
(20, 13.7, '50x40x35', 'Instrumento musical', 'R019');

INSERT INTO Rotas (id_rota, id_motorista, placa_veiculo, data_saida, data_chegada) VALUES
(1, 1, 'ABC1A11', '2025-08-01', '2025-08-03'),
(2, 2, 'DEF2B22', '2025-08-02', '2025-08-04'),
(3, 3, 'GHI3C33', '2025-08-03', '2025-08-05'),
(4, 4, 'JKL4D44', '2025-08-04', '2025-08-06'),
(5, 5, 'MNO5E55', '2025-08-05', '2025-08-07'),
(6, 6, 'PQR6F66', '2025-08-06', '2025-08-08'),
(7, 7, 'STU7G77', '2025-08-07', '2025-08-09'),
(8, 8, 'VWX8H88', '2025-08-08', '2025-08-10'),
(9, 9, 'YZA9I99', '2025-08-09', '2025-08-11'),
(10, 10, 'BCD0J00', '2025-08-10', '2025-08-12');

INSERT INTO Rastreamento (id_rastreamento, codigo_envio, data_hora, localizacao, descricao) VALUES
(1, 'R001', '2025-08-01 08:00:00', 'São Paulo/SP', 'Pedido registrado e aguardando coleta'),
(2, 'R001', '2025-08-02 10:30:00', 'São Paulo/SP', 'Pacote coletado pelo motorista'),
(3, 'R002', '2025-08-02 09:15:00', 'Salvador/BA', 'Pedido em trânsito para Curitiba'),
(4, 'R002', '2025-08-03 14:00:00', 'Belo Horizonte/MG', 'Parada técnica para abastecimento'),
(5, 'R003', '2025-08-03 11:00:00', 'Belo Horizonte/MG', 'Pedido entregue ao destinatário'),
(6, 'R004', '2025-08-04 08:45:00', 'São Paulo/SP', 'Pacote aguardando coleta'),
(7, 'R005', '2025-08-05 13:20:00', 'Manaus/AM', 'Pedido em trânsito para Rio de Janeiro'),
(8, 'R006', '2025-08-06 17:10:00', 'Brasília/DF', 'Pedido entregue com sucesso'),
(9, 'R007', '2025-08-07 15:45:00', 'Recife/PE', 'Pedido saiu para entrega'),
(10, 'R008', '2025-08-08 18:30:00', 'Vitória/ES', 'Pedido entregue ao cliente'),
(11, 'R009', '2025-08-09 07:50:00', 'Florianópolis/SC', 'Aguardando coleta'),
(12, 'R010', '2025-08-10 12:00:00', 'Teresina/PI', 'Pedido em trânsito'),
(13, 'R011', '2025-08-11 14:25:00', 'Rio de Janeiro/RJ', 'Entrega concluída'),
(14, 'R012', '2025-08-12 09:35:00', 'Manaus/AM', 'Pacote pronto para coleta'),
(15, 'R013', '2025-08-13 11:50:00', 'Porto Alegre/RS', 'Pedido em trânsito'),
(16, 'R014', '2025-08-14 16:10:00', 'Goiânia/GO', 'Pedido entregue'),
(17, 'R015', '2025-08-15 10:05:00', 'Rio de Janeiro/RJ', 'Pedido aguardando coleta'),
(18, 'R016', '2025-08-16 19:40:00', 'Belém/PA', 'Pedido entregue'),
(19, 'R017', '2025-08-17 08:55:00', 'Natal/RN', 'Pedido em trânsito'),
(20, 'R018', '2025-08-18 21:15:00', 'Campo Grande/MS', 'Pedido entregue ao destinatário');

