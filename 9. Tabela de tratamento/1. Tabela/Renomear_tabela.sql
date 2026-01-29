# Renomeando com o Schema (Recomendado)
# Se a sua tabela estiver em um schema específico (como dbo ou vendas), é uma boa prática incluir o nome do schema no primeiro parâmetro para evitar ambiguidades:
# Nota: No segundo parâmetro (o novo nome), não coloque o nome do schema. O SQL Server entende que a tabela permanecerá no mesmo schema em que já estava.

EXEC sp_rename '[dbo].[[clientes]]', 'customers';


# Aula 15 - Condições: WHERE e AND
SELECT *
FROM Pedidos
WHERE Status = 'Enviado'
  AND DataPedido >= '2026-01-01';



#Aula 16 - BETWEEN, IN, SELECT LIST
 
  SELECT 
      Nome AS [Nome do Produto], 
      Preco AS Valor,
      (Preco * 0.9) AS [Preco com Desconto] -- Sim, você pode fazer cálculos na lista!
  FROM Produtos
      WHERE Categoria IN ('Moda', 'Acessórios')
      AND Preco BETWEEN 100 AND 500;


#  AULA DE REPLACE 

REPLACE(string_original, texto_procurado, texto_substituto)
-----------------------------------------------------------

SELECT REPLACE('2026-01-29', '-', '/') AS DataFormatada;


-- Resultado: 2026/01/29

SELECT 
    Nome, 
    REPLACE(REPLACE(Telefone, '(', ''), ')', '') AS TelefoneLimpo
FROM Clientes;


SELECT TOP (1000) [customer_id]
      ,[cpf]
      ,[first_name]
      ,[last_name]
      ,[state]
      ,[city]
      ,[birth_date]
      ,[income]
      ,[score]
      ,[professional_status]
      ,[email]
      ,[mobile]
      ,[age]
  FROM [SALES].[dbo].[customers]