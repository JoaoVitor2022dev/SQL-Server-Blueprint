-- PARA QUE SERVE ##################################################################
-- Servem para executar operações aritmética nos registros de uma coluna 


-- TIPOS DE FUNÇÕES AGREGADAS ######################################################
-- COUNT()
-- SUM()
-- MIN()
-- MAX()
-- AVG()

-- EXEMPLOS ########################################################################

-- COUNT() -------------------------------------------------------------------------

-- (Exemplo 1) Contagem de todas as linhas de uma tabela
-- Conte todas as visitas realizadas ao site da empresa fictícia


SELECT COUNT(*)
FROM sales.funnel; 

-- (Exemplo 2) Contagem das linhas de uma coluna
-- Conte todos os pagamentos registrados na tabela sales.funnel 

SELECT * FROM sales.funnel;

SELECT COUNT(paid_date) FROM sales.funnel; 

Registramos 3.788 venda no mes de agosto 

-- (Exemplo 3) Contagem distinta de uma coluna
-- Conte todos os produtos distintos visitados em jan/21

SELECT COUNT(DISTINCT(brand))
FROM sales.products; 

temos 40 protudos diferentes em nosso estoque

SELECT DISTINCT(brand) 
FROM sales.products; 


SELECT COUNT(*)
FROM sales.products; 

-- OUTRAS FUNÇÕES ------------------------------------------------------------------

-- (Exemplo 4) Calcule o preço mínimo, máximo e médio dos productos da tabela products

SELECT MIN(price) FROM sales.products;

SELECT MIN(price) FROM sales.products;

SELECT SUM(price) FROM sales.products;

SELECT AVG(price) FROM sales.products;

-- (Exemplo 5) Informe qual é o veículo mais caro da tabela products

SELECT 
brand, price
FROM sales.products
WHERE price = (SELECT MIN(price) FROM sales.products)


-- RESUMO ##########################################################################
-- (1) Servem para executar operações aritmética nos registros de uma coluna 
-- (2) Funções agregadas não computam células vazias (NULL) como zero
-- (3) Na função COUNT() pode-se utilizar o asterisco (*) para contar os registros
-- (4) COUNT(DISTINCT ) irá contar apenas os valores exclusivos



--------------------------------------------------------------------------

Por exemplo, suponha que você tem uma tabela Vendas com colunas: Produto, Quantidade, Valor.

Exemplo 1 Sem GROUP BY (tudo em um único resultado):
SELECT 
    COUNT(*) AS Total_Registros,
    SUM(Quantidade) AS Total_Quantidade,
    AVG(Valor) AS Media_Valor,
    MAX(Valor) AS Maior_Valor,
    MIN(Valor) AS Menor_Valor
FROM Vendas;


➡️ Aqui ele retorna uma linha só com todos os agregados.

Exemplo 2  Com GROUP BY (resultados por categoria):
SELECT 
    Produto,
    SUM(Quantidade) AS Total_Quantidade,
    AVG(Valor) AS Media_Valor,
    MAX(Valor) AS Maior_Valor
FROM Vendas
GROUP BY Produto;


➡️ Aqui ele retorna uma linha por produto, com várias funções de agregação aplicadas.

👉 Então, sim, você pode usar várias funções de agregação juntas.
O detalhe é:

Sem GROUP BY → resultado único (tudo agregado).

Com GROUP BY → resultado por grupo.



