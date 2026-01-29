-- ##############################################################################
-- COMANDO UNION E UNION ALL
-- ##############################################################################

-- OBJETIVO: O comando UNION é usado para combinar o conjunto de resultados de
-- duas ou mais instruções SELECT em um único conjunto de resultados.

-- REQUISITOS OBRIGATÓRIOS PARA O USO DO UNION/UNION ALL:
-- 1. NÚMERO DE COLUNAS: Cada instrução SELECT deve ter o mesmo número de colunas.
-- 2. ORDEM DAS COLUNAS: As colunas devem ter a mesma ordem na seleção.
-- 3. TIPO DE DADOS: As colunas correspondentes (pela posição) devem ter tipos de
--    dados *compatíveis* (o que geralmente significa tipos idênticos ou que o
--    banco de dados pode converter implicitamente, como INT e FLOAT).

-- ##############################################################################
-- UNION x UNION ALL
-- ##############################################################################

-- 1. UNION ALL
-- FINALIDADE: Combina os resultados de todas as consultas.
-- COMPORTAMENTO: Mantém *TODAS* as linhas de registro, *INCLUINDO* as linhas
-- que são idênticas (duplicadas) nas tabelas combinadas.
-- VANTAGEM: É geralmente o mais rápido, pois o banco de dados não precisa
-- processar a remoção de duplicatas.

-- EXEMPLO UNION ALL: Duplicando linhas de registro
SELECT column_a, column_b FROM tabela_1
UNION ALL
SELECT column_a, column_b FROM tabela_2;

-- 2. UNION (ou apenas UNION, sem o ALL)
-- FINALIDADE: Combina os resultados de todas as consultas e filtra as duplicatas.
-- COMPORTAMENTO: Retorna apenas linhas *DISTINTAS* (não duplicadas) no
-- conjunto de resultados final. Ele verifica se um registro é totalmente
-- idêntico em *todas* as colunas a um registro já encontrado e, se for, o descarta.
-- DESVANTAGEM: É mais lento que o UNION ALL, pois requer uma etapa extra
-- de processamento para identificar e remover as duplicatas.

-- EXEMPLO UNION: Removendo linhas duplicadas
SELECT column_a, column_b FROM tabela_1
UNION
SELECT column_a, column_b FROM tabela_2;

-- ##############################################################################
-- EXEMPLO PRÁTICO (União simples de duas tabelas)
-- Usaremos o UNION ALL para garantir que todos os registros sejam mantidos
-- A Tabela 'temp_tables.products_2' deve ter as mesmas colunas que 'sales.products'
-- para que o comando funcione.
-- ##############################################################################

SELECT *
FROM sales.products

UNION ALL

SELECT *
FROM temp_tables.products_2;

-- ##############################################################################
-- EXEMPLO PRÁTICO 2 (Selecionando colunas específicas e garantindo a compatibilidade)
-- ##############################################################################

SELECT id AS product_id, price AS valor
FROM sales.products

UNION ALL

SELECT sku AS product_id, retail_price AS valor
FROM temp_tables.products_2

-- Nota:
-- - Renomeamos (AS) as colunas para que ambas as seleções tenham os mesmos nomes
--   (product_id e valor) no resultado final.
-- - É crucial que o tipo de dado da coluna 'id' seja compatível com o de 'sku',
--   e o tipo de 'price' seja compatível com o de 'retail_price'.