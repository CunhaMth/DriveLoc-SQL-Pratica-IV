-- Script de UPDATE e DELETE - DriveLoc
-- Com condições para segurança

USE DriveLoc;

-- UPDATE: Atualizar status de veículo para Manutencao
UPDATE Veiculo 
SET status = 'Manutencao' 
WHERE idVeiculo = 2 AND status = 'Locado';

-- UPDATE: Aumentar valor diária de veículos antigos
UPDATE Veiculo 
SET valorDiaria = valorDiaria * 1.1 
WHERE ano < 2022;

-- DELETE: Remover reserva cancelada (com condição)
DELETE FROM Reserva 
WHERE status = 'Cancelada' AND dataFim < CURDATE();

-- DELETE: Remover multa antiga (mais de 1 ano)
DELETE FROM Multa 
WHERE data < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);