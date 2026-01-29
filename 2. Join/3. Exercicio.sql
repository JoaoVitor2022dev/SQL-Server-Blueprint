-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel

SELECT * FROM sales.funnel LIMIT 10; 

SELECT * FROM sales.products LIMIT 10;

# Pesquisa de número de de carro por modelo de carro
SELECT
   pro.model AS modelo,
   COUNT(visit_page_date) AS contagem
FROM sales.funnel AS fun
   LEFT JOIN sales.products AS pro
   ON fun.product_id = pro.product_id
GROUP BY modelo
ORDER BY contagem DESC; 


# Verificar a contagem de visitas na tabela de sales.funnnel 
SELECT
   COUNT(visit_page_date) AS contagem
FROM sales.funnel;

-- Temos os três maiores numero de modelos de carros: palio, gol e uno. Que representão 15,14%
-- de todos os carros da loja 

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel

SELECT * FROM sales.stores LIMIT 10;

SELECT * FROM sales.funnel LIMIT 10; 


SELECT
   sto.store_name AS loja,
   COUNT(visit_page_date) AS visitas
FROM sales.funnel AS fun
   LEFT JOIN sales.stores AS sto
   ON fun.store_id = sto.store_id
GROUP BY loja
ORDER BY visitas DESC; 



