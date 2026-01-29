1. Subquery com IN

O IN  funciona como um filtro de lista. Ele verifica se um valor existe dentro de um conjunto de resultados que você definiu.

#Quando usar: Quando você tem uma lista fixa ou curta de valores vindo de outra tabela.

#Exemplo: Selecionar clientes que fizeram pedidos.


SELECT Nome 
FROM Clientes 
WHERE ClienteID IN (SELECT ClienteID FROM Pedidos);


2. Subquery com EXISTS

# O EXISTS não olha para os dados em si, mas sim para a existência deles. Ele para de procurar assim que encontra a primeira correspondência (o que o torna muito performático).

# Quando usar: Para verificar relações entre tabelas, especialmente em grandes volumes de dados.

# Exemplo: Mesma lógica, mas verificando se "existe algum registro" relacionado.

SQL
SELECT Nome 
FROM Clientes c 
WHERE EXISTS (SELECT 1 FROM Pedidos p WHERE p.ClienteID = c.ClienteID);


3. CTE (Common Table Expressions) - O WITH

# A CTE é como criar uma tabela temporária na memória que só dura durante a execução daquela query. Ela deixa o código muito mais limpo e organizado que as subqueries.

# Vantagem: Você pode dar um nome para esse bloco e reutilizá-lo na mesma consulta.

# Exemplo: Primeiro calculamos o total de vendas e depois filtramos.

WITH VendasPorAno AS (
    SELECT Ano, SUM(Valor) as Total
    FROM Vendas
    GROUP BY Ano
)
SELECT * FROM VendasPorAno WHERE Total > 10000;



Recurso	Estilo	    Melhor      uso

IN	               Lista	   Filtros simples e diretos.

EXISTS	           Booleano	   Performance em checagens de relacionamento.

CTE (WITH)	       Estrutural  Organizar queries complexas e cálculos em etapas.


Dica de ouro: No dia a dia, prefira CTEs para organizar seu raciocínio (o código fica legível) e use EXISTS em vez de IN se a tabela de consulta for muito grande.


