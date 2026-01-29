-- 1 - analisar os base de dados 


SELECT TOP (1000) [visit_id]
      ,[customer_id]
      ,[store_id]
      ,[product_id]
      ,[visit_page_date]
      ,[add_to_cart_date]
      ,[start_checkout_date]
      ,[finish_checkout_date]
      ,[paid_date]
      ,[discount]
  FROM [SALES].[dbo].[funnel]


-- 2 - Precisamos verificar e analistar melhor essas visitas  

SELECT 
    COUNT([visit_page_date]) 
FROM [SALES].[dbo].[funnel]

-- Retorno dos númerro de visitdas é 30.580 visitdas no total 

-- 3 - Precisamos saber o numero de visitas colocaram algo no carrinho 

SELECT 
     COUNT([add_to_cart_date]) 
FROM [SALES].[dbo].[funnel]

-- Retorno dos númerro de visitdas é 20.020 visitdas no total 

-- 4 Conseguimos entender e analisar melhor, agora vamos combinar esse dados com a lojas 

SELECT TOP (1000) [store_name]
      ,[store_cnpj]
      ,[store_id]
FROM [SALES].[dbo].[stores]

-- Conseguimos um conexão entre as duas base de dados

SELECT
     [stores].[store_name] AS [Loja],
     
     COUNT([funnel].[visit_page_date]) AS [Visita],
     
     COUNT([funnel].[add_to_cart_date]) AS [Simulacao],

     (CAST(COUNT([funnel].[add_to_cart_date]) AS DECIMAL(10, 4)) / COUNT([funnel].[visit_page_date])) AS [Conversao]

FROM [SALES].[dbo].[funnel] AS [funnel]
LEFT JOIN [SALES].[dbo].[stores] AS [stores]
    ON [funnel].[store_id] = [stores].[store_id]
GROUP BY [stores].[store_name]
ORDER BY [Visita] DESC


1 - ANALISAR A BASE DE DADOS TOTAL - finalizado

2 - CONTINUAR A AULA - PROCESSANDO - finalizado

3 - ESTUDO DE EXEMPLO PARA USAR O WITH - Pendente 









    

