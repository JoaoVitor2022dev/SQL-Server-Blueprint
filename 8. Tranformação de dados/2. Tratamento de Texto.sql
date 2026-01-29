-- 1. Maiúsculas e Minúsculas
SELECT CASE WHEN UPPER('São Paulo') = 'SÃO PAULO' THEN 1 ELSE 0 END;

SELECT CASE WHEN LOWER('São Paulo') = 'são paulo' THEN 1 ELSE 0 END;

-- 2. Espaços (TRIM funciona do SQL Server 2017 em diante)
SELECT CASE WHEN TRIM('SÃO PAULO     ') = 'SÃO PAULO' THEN 1 ELSE 0 END;

-- 3. Substituição (REPLACE)
SELECT CASE WHEN REPLACE('SAO PAULO', 'SAO', 'SÃO') = 'SÃO PAULO' THEN 1 ELSE 0 END;