-- Script de Criação do Banco de Dados DriveLoc
-- Experiência Prática IV - Modelagem de Banco de Dados

-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS DriveLoc;
USE DriveLoc;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpfCnpj VARCHAR(18) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    tipo ENUM('PF', 'PJ') NOT NULL
);

-- Tabela Filial
CREATE TABLE Filial (
    idFilial INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(8) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    valorDiaria DECIMAL(10,2) NOT NULL,
    status ENUM('Disponivel', 'Manutencao', 'Locado') DEFAULT 'Disponivel'
);

-- Tabela Reserva
CREATE TABLE Reserva (
    idReserva INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idVeiculo INT NOT NULL,
    dataReserva DATE NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    status ENUM('Confirmada', 'Cancelada') DEFAULT 'Confirmada',
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

-- Tabela Locacao
CREATE TABLE Locacao (
    idLocacao INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idVeiculo INT NOT NULL,
    idFilial INT NOT NULL,
    dataRetirada DATETIME NOT NULL,
    dataDevolucao DATETIME,
    kmSaida INT,
    kmEntrada INT,
    nivelCombustivelSaida ENUM('Cheio', 'Meio', 'Baixo'),
    nivelCombustivelEntrada ENUM('Cheio', 'Meio', 'Baixo'),
    valorTotal DECIMAL(10,2) NOT NULL,
    status ENUM('Ativa', 'Concluida', 'Cancelada') DEFAULT 'Ativa',
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (idFilial) REFERENCES Filial(idFilial)
);

-- Tabela Manutencao
CREATE TABLE Manutencao (
    idManutencao INT PRIMARY KEY AUTO_INCREMENT,
    idVeiculo INT NOT NULL,
    dataEntrada DATE NOT NULL,
    dataSaida DATE,
    descricao VARCHAR(500),
    custo DECIMAL(10,2),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

-- Tabela Multa
CREATE TABLE Multa (
    idMulta INT PRIMARY KEY AUTO_INCREMENT,
    idLocacao INT NOT NULL,
    data DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    FOREIGN KEY (idLocacao) REFERENCES Locacao(idLocacao)
);