/* ============================================================
   🧠 CHAVE MENTAL – FUNÇÕES AGREGADAS NO SQL
   ============================================================ */

/* 🔹 FUNÇÕES AGREGADAS
   AVG()  -> média
   SUM()  -> soma
   COUNT()-> contagem
   MAX()  -> valor máximo
   MIN()  -> valor mínimo
*/

/* 🔹 GROUP BY
   -> Agrupa linhas para aplicar funções agregadas.
   -> Pense: "quero o total POR categoria".
*/
SELECT Categoria, SUM(Vendas) AS Total_Vendas
FROM Produtos
GROUP BY Categoria;


/* 🔹 WHERE
   -> Filtra linhas ANTES do agrupamento.
   -> Só funciona com colunas normais (não agregadas).
*/
SELECT *
FROM Produtos
WHERE Preco > 100;


/* 🔹 HAVING
   -> Filtra DEPOIS do agrupamento.
   -> Usado para funções agregadas.
*/
SELECT Categoria, SUM(Vendas) AS Total_Vendas
FROM Produtos
GROUP BY Categoria
HAVING SUM(Vendas) > 1000;


/* ============================================================
   ⚡ RESUMÃO MENTAL:
   WHERE   -> filtro em dados crus
   GROUP BY-> agrupar para resumir
   HAVING  -> filtro no resultado agregado
   Funções -> AVG | SUM | COUNT | MAX | MIN
   ============================================================ */
