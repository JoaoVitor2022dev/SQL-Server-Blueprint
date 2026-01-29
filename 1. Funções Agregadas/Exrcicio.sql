-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos

SELECT 
    COUNT(*) AS cliente_mais_de_30
FROM sales.customers
WHERE DATE_PART('year', AGE(birth_date)) > 30;

-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers

SELECT 
    DATE_PART('year', AGE(birth_date)) AS idade,
    MAX(idade)
FROM sales.customers


-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)

SELECT 
    MAX(DATE_PART('year', AGE(birth_date))) AS idade_maxima
FROM sales.customers;

-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca


SELECT *
FROM sales.products;

SELECT 
    brand,
    COUNT(*) AS quanitdade_carros
FROM sales.products
GROUP BY brand
HAVING COUNT(*) >= 20
ORDER BY quanitdade_carros DESC

-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo


SELECT 
    brand,
    model_year, 
    COUNT(*)
FROM sales.products
GROUP BY model_year, brand
ORDER BY model_year, brand; 


-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados


SELECT 
   brand,
   COUNT(*) AS quantidades_registro
FROM sales.products
GROUP BY brand 
HAVING  COUNT(*) >= 10
ORDER BY quantidades_registro DESC;