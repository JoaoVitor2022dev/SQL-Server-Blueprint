-- EXERCÍCIOS ########################################################################

-- (Exemplo 1) Identifique qual é o status profissional mais frequente nos clientes 
-- que compraram automóveis no site


SELECT 
   cus.professional_status,
   COUNT(fun.paid_date) AS pagamentos
FROM sales.funnel AS fun
LEFT JOIN sales.customers AS cus 
    ON fun.customer_id = cus.customer_id
GROUP BY cus.professional_status
ORDER BY pagamentos DESC

SELECT 
   *
FROM sales.funnel; 

SELECT 
   *
FROM sales.customers; 

-- (Exemplo 2) Identifique qual é o gênero mais frequente nos clientes que compraram
-- automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders

SELECT * FROM temp_tables.ibge_genders LIMIT 10

SELECT 

   ibge.gender, 
   COUNT(fun.paid_date)
  
FROM sales.funnel AS fun
LEFT JOIN sales.customers AS cus
     ON fun.customer_id = cus.customer_id 
LEFT JOIN temp_tables.ibge_genders AS ibge 
     ON LOWER(cus.first_name) = LOWER(ibge.first_name)
GROUP BY ibge.gender 


-- (Exemplo 3) Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions

select * from sales.customers limit 10

select * from temp_tables.regions limit 10

SELECT 

    reg.region, 
	COUNT(fun.visit_page_date) AS visitas
    
FROM sales.funnel AS fun 
LEFT JOIN sales.customers as cus 
    ON fun.customer_id = cus.customer_id
LEFT JOIN temp_tables.regions AS reg	
    ON LOWER(cus.city) = LOWER(reg.city) 
	AND LOWER(cus.state) = LOWER(reg.state) 
GROUP BY reg.region
ORDER BY visitas DESC
       

