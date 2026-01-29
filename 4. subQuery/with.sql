# Estuda a subquery with 

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Análise de recorrência dos leads

-- Calcule o volume de visitas por dia ao site separado por 1ª visita e demais visitas


WITH [PRIMEIRA VISITA] AS
(
    SELECT [customer_id], MIN([visit_page_date]) AS [VISITA 1]
    FROM [SALES].[dbo].[funnel]
    GROUP BY [customer_id]
)

SELECT
    [FUNNEL].[visit_page_date],
    CASE
        WHEN [FUNNEL].[visit_page_date] <> [PRIMEIRA VISITA].[VISITA 1] THEN 1
        ELSE 0
    END AS [LEAD RECORRENTE],
    COUNT(*)
FROM
    [SALES].[dbo].[funnel] AS [FUNNEL]
LEFT JOIN
    [PRIMEIRA VISITA]
    ON [FUNNEL].[customer_id] = [PRIMEIRA VISITA].[customer_id]
GROUP BY
    [FUNNEL].[visit_page_date],
    [PRIMEIRA VISITA].[VISITA 1] 

-- (Exemplo 2) Análise do preço versus o preço médio

-- Calcule, para cada visita ao site, quanto o preço do um veículo visitado pelo cliente

-- estava acima ou abaixo do preço médio dos veículos daquela marca 

-- (levar em consideração o desconto dado no veículo)
