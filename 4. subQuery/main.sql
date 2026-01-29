-- PARA QUE SERVE ##################################################################
-- Servem para consultar dados de outras consultas.


-- TIPOS ###########################################################################
-- Subquery no WHERE
-- Subquery com WITH
-- Subquery no FROM
-- Subquery no SELECT


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Subquery no WHERE
-- Informe qual é o veículo mais barato da tabela products


SELECT 
    * 
FROM sales.products 
WHERE price = menor_valor


SELECT 
    * 
FROM sales.products 
WHERE price = SELECT MIN(price) FROM sales.products


SELECT MIN(price) FROM sales.products


-- Subquery no WHERE apenas irá funcionar quando for para retornar um valor únioco 


-- (Exemplo 2) Subquery com WITH
-- Calcule a idade média dos clientes por status profissional

WITH alguma_tabela AS (
    SELECT
    professional_status, 
    (current_date - birth_date)/ 365 AS idade
FROM sales.customers 
)

SELECT 
    professional_status, 
    AVG(idade) as idade. 
FROM alguma_tabela 
GROUP BY professional_status


--------------------------------------------

SELECT
    professional_status, 
    (current_date - birth_date)/ 365 AS idade
FROM sales.customers 


-- (Exemplo 3) Subquery no FROM
-- Calcule a média de idades dos clientes por status profissional



-- (Exemplo 4) Subquery no SELECT
-- Na tabela sales.funnel crie uma coluna que informe o nº de visitas acumuladas 
-- que a loja visitada recebeu até o momento



-- RESUMO ##########################################################################
-- (1) Servem para consultar dados de outras consultas.
-- (2) Para que as subqueries no WHERE e no SELECT funcionem, elas devem retornar 
-- apenas um único valor
-- (3) Não é recomendado utilizar subqueries diretamente dentro do FROM pois isso 
-- dificulta a legibilidade da query. 
