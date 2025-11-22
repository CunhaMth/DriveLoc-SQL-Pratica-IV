-- Script de Inserção de Dados - DriveLoc
-- Execute após o script de criação

USE DriveLoc;

-- Inserindo Filiais
INSERT INTO Filial (nome, endereco, cidade) VALUES
('Filial Centro', 'Rua das Flores, 123', 'São Paulo'),
('Filial Aeroporto', 'Av. do Aeroporto, 456', 'Rio de Janeiro'),
('Filial Shopping', 'Av. Paulista, 789', 'Belo Horizonte');

-- Inserindo Clientes
INSERT INTO Cliente (nome, cpfCnpj, email, telefone, tipo) VALUES
('João Silva', '123.456.789-00', 'joao@email.com', '(11)99999-0001', 'PF'),
('Maria Oliveira', '987.654.321-00', 'maria@email.com', '(21)99999-0002', 'PF'),
('Empresa XYZ Ltda', '12.345.678/0001-99', 'xyz@empresa.com', '(31)99999-0003', 'PJ'),
('Pedro Santos', '111.222.333-44', 'pedro@email.com', '(11)99999-0004', 'PF');

-- Inserindo Veículos
INSERT INTO Veiculo (placa, marca, modelo, ano, categoria, valorDiaria) VALUES
('ABC-1234', 'Toyota', 'Corolla', 2023, 'Sedan', 150.00),
('XYZ-5678', 'Volkswagen', 'Gol', 2022, 'Popular', 80.00),
('DEF-9012', 'Fiat', 'Uno', 2021, 'Popular', 70.00),
('GHI-3456', 'Hyundai', 'HB20', 2023, 'Hatch', 120.00),
('JKL-7890', 'Chevrolet', 'Onix', 2022, 'Hatch', 110.00);

-- Inserindo Reservas
INSERT INTO Reserva (idCliente, idVeiculo, dataReserva, dataInicio, dataFim, status) VALUES
(1, 1, '2025-11-20', '2025-11-25', '2025-11-28', 'Confirmada'),
(2, 2, '2025-11-21', '2025-11-22', '2025-11-25', 'Confirmada'),
(3, 3, '2025-11-19', '2025-11-26', '2025-11-30', 'Cancelada'),
(4, 4, '2025-11-22', '2025-11-23', '2025-11-24', 'Confirmada');

-- Inserindo Locações
INSERT INTO Locacao (idCliente, idVeiculo, idFilial, dataRetirada, dataDevolucao, kmSaida, kmEntrada, nivelCombustivelSaida, nivelCombustivelEntrada, valorTotal) VALUES
(1, 1, 1, '2025-11-25 10:00:00', '2025-11-28 14:30:00', 50000, 51200, 'Cheio', 'Meio', 450.00),
(2, 2, 2, '2025-11-22 09:00:00', NULL, 30000, NULL, 'Cheio', NULL, 0.00),  -- Locação ativa
(4, 4, 1, '2025-11-23 11:00:00', '2025-11-24 16:00:00', 20000, 20150, 'Cheio', 'Cheio', 120.00);

-- Inserindo Manutenções
INSERT INTO Manutencao (idVeiculo, dataEntrada, dataSaida, descricao, custo) VALUES
(1, '2025-11-15', '2025-11-20', 'Troca de óleo e revisão geral', 250.00),
(2, '2025-11-10', '2025-11-12', 'Alinhamento e balanceamento', 150.00),
(3, '2025-11-18', NULL, 'Reparo no motor - em andamento', NULL);

-- Inserindo Multas
INSERT INTO Multa (idLocacao, data, valor, descricao) VALUES
(1, '2025-11-26', 200.00, 'Excesso de velocidade na Marginal'),
(1, '2025-11-27', 150.00, 'Estacionamento irregular'),
(3, '2025-11-24', 100.00, 'Sem cinto de segurança');