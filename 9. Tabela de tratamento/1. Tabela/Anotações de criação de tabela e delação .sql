

-- Garante que a tabela não exista antes de tentar criá-la
IF OBJECT_ID('[TEMP_TABLES].[dbo].[customers_age]', 'U') IS NOT NULL
    DROP TABLE [TEMP_TABLES].[dbo].[customers_age];

-- Seleciona e insere na nova tabela
SELECT 
    [customer_id], 
    DATEDIFF(HOUR, [birth_date], GETDATE()) / 8766 AS [idade]
    INTO [TEMP_TABLES].[dbo].[customers_age] 
FROM [SALES].[dbo].[customers];