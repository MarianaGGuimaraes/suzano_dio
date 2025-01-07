-- queries para extração de insights

-- Quais são as equipes especializadas em veículos elétricos ou híbridos?
SELECT Nequip, Decricao 
	FROM Equipe 
	WHERE Decricao LIKE '%elétricos%' OR Decricao LIKE '%híbridos%';

-- Quantas equipes estão registradas no banco de dados?
SELECT COUNT(*) AS Total_Equipes 
	FROM Equipe;
    
-- Quantos responsáveis estão atribuídos a cada equipe?
SELECT idEquipe_Responsavel, COUNT(*) AS Total_Responsaveis 
	FROM Responsavel 
	GROUP BY idEquipe_Responsavel;

-- Quais responsáveis estão associados a clientes que moram em Porto Alegre (RS)?
SELECT r.Pnome, r.Sobrenome, r.Funcao 
	FROM Responsavel r 
	INNER JOIN Equipe e ON r.idEquipe_Responsavel = e.idEquipe
	INNER JOIN Cliente c ON c.Cidade = 'Porto Alegre' AND c.UF = 'RS';
    
-- Quantos clientes cada equipe atende, considerando os responsáveis?
SELECT e.Nequip, COUNT(DISTINCT c.CPF_Cliente) AS Total_Clientes 
	FROM Equipe e 
	INNER JOIN Responsavel r ON e.idEquipe = r.idEquipe_Responsavel
	INNER JOIN Cliente c ON c.Cidade = r.Cidade_Mecanico
	GROUP BY e.Nequip;

-- Qual a distribuição de tipos de equipes no banco de dados?
SELECT 
    CASE 
        WHEN Decricao LIKE '%especializada%' THEN 'Especializada' 
        ELSE 'Geral' 
    END AS Tipo_Equipe, 
    COUNT(*) AS Total 
FROM Equipe 
GROUP BY Tipo_Equipe;

-- Existem responsáveis sobrecarregados em alguma equipe?
SELECT idEquipe_Responsavel, COUNT(*) AS Total_Responsaveis 
	FROM Responsavel 
	GROUP BY idEquipe_Responsavel 
	HAVING Total_Responsaveis = 1;
    
-- perfil geográfico clientes
SELECT UF, Cidade, COUNT(*) AS Total_Clientes 
	FROM Cliente 
	GROUP BY UF, Cidade 
	ORDER BY Total_Clientes DESC;
    
-- média de clients por cidade
SELECT AVG(Total_Clientes) AS Media_Clientes 
FROM (
    SELECT Cidade, COUNT(*) AS Total_Clientes 
    FROM Cliente 
    GROUP BY Cidade
) Subquery;



-- estado com cliente, mas sem responsáveis?
SELECT DISTINCT c.UF 
FROM Cliente c 
WHERE NOT EXISTS (
    SELECT 1 
    FROM Responsavel r 
    WHERE c.UF = r.UF_Mec
);


-- notas fiscais com valor superior a 500
SELECT idNota_Fiscal, Valor_Total 
FROM Nota_Fiscal 
WHERE Valor_Total > 500;


-- Quais clientes realizaram serviços e compraram peças no mesmo período?
SELECT 
    concat(c.Pnome_Cliente,' ', c.Sobrenome_Cliente) as nome_cliente, 
    s.Tipo_Servico, quantidade_pecas, nome_peca
FROM Cliente c
JOIN Ordem_Servico os ON c.idCliente = os.idCliente_OS
JOIN Servico s ON s.idOS_Servico = os.idOrdem_Servico
JOIN pecas_em_os p ON p.idOS_pecas = os.idOrdem_Servico
JOIN pecas pe ON pe.idPecas = p.idPecas_em_os
WHERE os.dt_abertura BETWEEN '2024-01-01' AND '2024-12-31'
AND os.dt_conclusao BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY quantidade_pecas DESC;


-- Quais orçamentos de clientes se transformaram em serviços?
SELECT 
    o.idOrçamento,
    o.produtoservico,
    s.Tipo_Servico 
FROM Orcamento o
JOIN ordem_servico os on o.idOS_Orcamento = os.idOrdem_Servico
JOIN Servico s ON s.idOS_Servico = os.idOrdem_Servico
WHERE o.status_orcamento = 'Aprovado';



