-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers


SELECT
      CONCAT([customers].[first_name], ' ', [customers].[last_name]) AS [full_name],
      
      COUNT([funnel].[visit_page_date]) AS [total_visits]

FROM [SALES].[dbo].[customers] AS [customers]

LEFT JOIN [SALES].[dbo].[funnel] AS [funnel]

      ON [customers].[customer_id] = [funnel].[customer_id]

GROUP BY CONCAT([customers].[first_name], ' ', [customers].[last_name])

ORDER BY [total_visits] DESC;
