-- TIPOS ###########################################################################

-- CASE WHEN

-- COALESCE()


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Agrupamento de dados com CASE WHEN

-- Calcule o nº de clientes que ganham abaixo de 5k, entre 5k e 10k, entre 10k e 

-- 15k e acima de 15k


WITH [Faixa de renda] AS (
      SELECT 
            [income],
            CASE 
                WHEN [income]  <  5000  THEN '0-5000'
                WHEN [income]  >= 5000  AND  [income] < 10000 THEN '5K - 10K'
                WHEN [income]  >= 10000 AND  [income] < 15000 THEN '10K - 15K'
                ELSE 'Acima 15K'
                END AS [Faixa renda]
      FROM [SALES].[dbo].[customers] 
)
SELECT 
    [Faixa renda],
    COUNT(*)   
FROM [Faixa de renda]
GROUP BY [Faixa renda]


-- (Exemplo 2) Tratamento de dados nulos com COALESCE

-- Crie uma coluna chamada populacao_ajustada na tabela temp_tables.regions e

-- preencha com os dados da coluna population, mas caso esse campo estiver nulo, 

-- preencha com a população média (geral) das cidades do Brasil


-- Opção 1
SELECT
	*,
	CASE
		WHEN [population] IS NOT NULL THEN [population]
		else (SELECT avg([population]) FROM temp_tables.regions)
		AND AS [População ajustada]

FROM [TEMP_TABLES].[dbo].[regions]
  
  
-- Opção 1
  SELECT 
     *,
     COALESCE([population], (SELECT AVG([population]) FROM [TEMP_TABLES].[dbo].[regions] )) AS [População ajustada]
  FROM [TEMP_TABLES].[dbo].[regions]
  WHERE [population] IS NULL
    
-- RESUMO ##########################################################################

-- (1) CASE WHEN é o comando utilizado para criar respostas específicas para 

-- diferentes condições e é muito utilizado para fazer agrupamento de dados

-- (2) COALESCE é o comando utilizado para preencher campos nulos com o primeiro

-- valor não nulo de uma sequência de valores.