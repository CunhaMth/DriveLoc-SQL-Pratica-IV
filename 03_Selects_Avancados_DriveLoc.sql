-- Script de SELECTs Avançados - DriveLoc
-- Exemplos com WHERE, ORDER BY, LIMIT, JOIN, etc.

USE DriveLoc;

-- 1. SELECT com WHERE e ORDER BY
SELECT nome, valorDiaria, categoria 
FROM Veiculo 
WHERE status = 'Disponivel' 
ORDER BY valorDiaria ASC 
LIMIT 3;

-- 2. SELECT com JOIN (Cliente e Locacao)
SELECT c.nome AS cliente, l.dataRetirada, l.valorTotal, f.nome AS filial
FROM Cliente c
JOIN Locacao l ON c.idCliente = l.idCliente
JOIN Filial f ON l.idFilial = f.idFilial
WHERE l.status = 'Concluida'
ORDER BY l.valorTotal DESC;

-- 3. SELECT com GROUP BY e COUNT (Locações por Cliente)
SELECT c.nome, COUNT(l.idLocacao) AS totalLocacoes, SUM(l.valorTotal) AS totalFaturado
FROM Cliente c
LEFT JOIN Locacao l ON c.idCliente = l.idCliente
GROUP BY c.idCliente, c.nome
HAVING COUNT(l.idLocacao) > 0
ORDER BY totalFaturado DESC;

-- 4. SELECT com INNER JOIN e WHERE (Multas por Veículo)
SELECT v.placa, m.descricao, m.valor, l.dataRetirada
FROM Veiculo v
INNER JOIN Locacao l ON v.idVeiculo = l.idVeiculo
INNER JOIN Multa m ON l.idLocacao = m.idLocacao
WHERE m.valor > 100
ORDER BY m.data DESC;

-- 5. SELECT com LIKE e LIMIT (Clientes por Nome)
SELECT nome, email, telefone
FROM Cliente
WHERE nome LIKE 'J%'
ORDER BY nome
LIMIT 5;