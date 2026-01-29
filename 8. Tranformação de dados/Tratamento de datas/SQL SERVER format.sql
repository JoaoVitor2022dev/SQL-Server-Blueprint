-- TIPOS ###########################################################################

-- INTERVAL
-- DATE_TRUNC
-- EXTRACT
-- DATEDIFF

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Soma de datas utilizando INTERVAL
-- Calcule a data de hoje mais 10 unidades (dias, semanas, meses, horas)

SELECT DATEADD(WEEK, +10, GETDATE());

-- (Exemplo 2) Truncagem de datas utilizando DATE_TRUNC
-- Calcule quantas visitas ocorreram por mês no site da empresa

-- DATE_TRUNC no SQL SERVER temos que usar o coamdno FORMAT e CAST para converter 

SELECT 
    CAST(FORMAT([visit_page_date], 'yyyy-MM-01') AS DATE) AS [visit_page_month], 
    COUNT(*) AS [total_visits]
FROM [SALES].[dbo].[funnel]
GROUP BY FORMAT([visit_page_date], 'yyyy-MM-01')
ORDER BY [visit_page_month] DESC;

-- (Exemplo 3) Extração de unidades de uma data utilizando EXTRACT
-- Calcule qual é o dia da semana que mais recebe visitas ao site

--  EXTRACT no SQL SERVER é  DATEPART

SELECT
    DATEPART(weekday, visit_page_date) AS dia_da_semana,
    COUNT(*) AS total_visitas
FROM [SALES].[dbo].[funnel]
GROUP BY DATEPART(weekday, visit_page_date)
ORDER BY dia_da_semana;


-- (Exemplo 4) Diferença entre datas com operador de subtração (-) 
-- Calcule a diferença entre hoje e '2018-06-01', em dias, semanas, meses e anos.

-- Forma manual 
SELECT DATEDIFF(day, '2018-06-01', GETDATE()) 
SELECT DATEDIFF(day, '2018-06-01', GETDATE()) / 7;
SELECT DATEDIFF(day, '2018-06-01', GETDATE()) / 30;
SELECT DATEDIFF(day, '2018-06-01', GETDATE()) / 365;

-- Forma de valida com Função 
SELECT DATEDIFF(DAY, '2018-06-01', GETDATE());

-- (1) O comando INTERVAL é utilizado para somar datas na unidade desejada. Caso a 
-- unidade não seja informada, o SQL irá entender que a soma foi feita em dias.
-- (2) O comando DATE_TRUNC é utilizado para truncar uma data no início do período
-- (3) O comando EXTRACT é utilizado para extrair unidades de uma data/timestamp
-- (4) O cálculo da diferença entre datas com o operador de subtração (-) retorna  
-- valores em dias. Para calcular a diferença entre datas em outra unidade é necessário
-- fazer uma transformação de unidades (ou criar uma função para isso)
-- (5) Utilize o Guia de comandos para consultar as unidades de data e hora utilizadas 
-- no SQL



