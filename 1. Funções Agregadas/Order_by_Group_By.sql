-- PARA QUE SERVE ##################################################################
-- Serve para agrupar registros semelhantes de uma coluna
-- Normalmente utilizado em conjunto com as Funções de agregação


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Contagem agrupada de uma coluna
-- Calcule o nº de clientes da tabela customers por estado
select count(*)
from sales.customers

-------------

select *
from sales.customers
LIMIT 10

-------------

SELECT
   state AS  estados,
   COUNT(cpf) AS clientes
FROM sales.customers
GROUP BY estados
ORDER BY clientes DESC; 

-- (Exemplo 2) Contagem agrupada de várias colunas
-- Calcule o nº de clientes por estado e status profissional 



select count(*)
from sales.customers

select *
from sales.customers
LIMIT 10


SELECT
    state AS estado,
    professional_status AS status_profissional,
    COUNT(cpf) AS total_clientes
FROM sales.customers
GROUP BY state, professional_status
ORDER BY estado, total_clientes DESC;



SELECT COUNT(DISTINCT(cpf)) FROM sales.customers; 

professional_status


-- (Exemplo 3) Seleção de valores distintos
-- Selecione os estados distintos na tabela customers utilizando o group by
select distinct state
from sales.customers


-- RESUMO ##########################################################################
-- (1) Serve para agrupar registros semelhantes de uma coluna, 
-- (2) Normalmente utilizado em conjunto com as Funções de agregação
-- (3) Pode-se referenciar a coluna a ser agrupada pela sua posição ordinal 
-- (ex: GROUP BY 1,2,3 irá agrupar pelas 3 primeiras colunas da tabela) 
-- (4) O GROUP BY sozinho funciona como um DISTINCT, eliminando linhas duplicadas


