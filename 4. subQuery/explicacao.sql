/* ##########################################################
   SUBQUERIES NO SQL
   Autor: João Mocambite
   Objetivo: Demonstrar subqueries simples e com WITH (CTE)
   ########################################################## */


/* ==========================================================
   EXEMPLO 1 - SUBQUERY NO WHERE
   ----------------------------------------------------------
   Quando usar:
   - Quando a subquery retorna um valor único (ex: MIN, MAX, AVG)
   - Pode ser usada em WHERE, HAVING ou SELECT
   ========================================================== */

-- Objetivo: mostrar o veículo mais barato da tabela 'sales.products'

SELECT 
    *
FROM 
    sales.products
WHERE 
    price = (
        SELECT MIN(price)
        FROM sales.products
    );

-- Observação:
-- A subquery (SELECT MIN(price)...) retorna apenas UM valor.
-- Por isso pode ser usada diretamente dentro do WHERE.


/* ==========================================================
   EXEMPLO 2 - SUBQUERY COM WITH (CTE)
   ----------------------------------------------------------
   Quando usar:
   - Quando a subquery precisa criar uma tabela temporária
   - Ideal para cálculos intermediários ou consultas complexas
   ========================================================== */

-- Objetivo: calcular a idade média dos clientes agrupada por status profissional

WITH clientes_calculados AS (
    SELECT 
        professional_status,
        EXTRACT(YEAR FROM AGE(current_date, birth_date)) AS idade
    FROM 
        sales.customers
)
SELECT 
    professional_status,
    ROUND(AVG(idade), 1) AS idade_media
FROM 
    clientes_calculados
GROUP BY 
    professional_status
ORDER BY 
    idade_media;


/* ==========================================================
   EXEMPLO 3 - SUBQUERY NO SELECT
   ----------------------------------------------------------
   Quando usar:
   - Quando você quer calcular um valor relacionado a cada linha
     (exemplo: total de vendas por produto, sem fazer JOIN)
   ========================================================== */

-- Objetivo: mostrar cada produto com a quantidade total vendida

SELECT 
    p.product_id,
    p.product_name,
    p.price,
    (
        SELECT COUNT(*)
        FROM sales.orders AS o
        WHERE o.product_id = p.product_id
    ) AS total_vendas
FROM 
    sales.products AS p
ORDER BY 
    total_vendas DESC;


/* ==========================================================
   RESUMO RÁPIDO
   ----------------------------------------------------------
   | Tipo de Subquery | Onde Usar | Retorna | Exemplo de Uso |
   |------------------|-----------|----------|----------------|
   | Simples (WHERE)  | WHERE / HAVING | Valor único | WHERE price = (SELECT MIN(price)...) |
   | Com WITH (CTE)   | Antes da query | Tabela temp | WITH tabela_temp AS (...) SELECT ... |
   | No SELECT        | Dentro do SELECT | Valor calculado | SELECT (SELECT COUNT(*)...) AS qtd |
   ========================================================== */
