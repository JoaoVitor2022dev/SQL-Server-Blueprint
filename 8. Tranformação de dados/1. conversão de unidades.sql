-- TIPOS DE CONVERSÃO ##############################################################
-- Operador ::
-- CAST

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Conversão de texto em data

-- Corrija a query abaixo utilizando o operador ::

select '2021-10-01' - '2021-02-01'

SELECT DATEDIFF(day,'2021-10-01','2021-02-01') AS [DIFIRENÇA DE DIAS]



 -- CONVERTER OS DADOS DE UMA COLUNA EM DATA, APENAS USAR O CAST()

SELECT CAST('2021-10-01' AS DATE) - CAST('2021-02-01' AS DATE) AS [DIFERENÇAS ENTRE OS DIAS]



-- (Exemplo 2) Conversão de texto em número
-- Corrija a query abaixo utilizando o operador ::
SELECT CAST('100' AS NUMERIC(10,2)) - CAST('10' AS NUMERIC(10,2)) AS Resultado;




-- (Exemplo 3) Conversão de número em texto
-- Corrija a query abaixo utilizando o operador ::
select replace(112122,'1','A')

SELECT REPLACE(CAST(1011010010 AS VARCHAR(20)), '1', 'A') AS Resultado;




-- (Exemplo 4) Conversão de texto em data
-- Corrija a query abaixo utilizando a função CAST

select '2021-10-01' - '2021-02-01'

SELECT DATEDIFF(day,'2021-10-01','2021-02-01') AS [DIFIRENÇA DE DIAS]

-- RESUMO ##########################################################################
-- (1) O operador :: e o CAST() são funções utilizadas para converter um dado para 
-- a unidade desejada. 
-- (2) O operador :: é mais "clean", porém, em algumas ocasiões não funciona, sendo
-- necessário utilizar a função CAST()
-- (3) Use o Guia de comandos para consultar a lista de unidades mais utilizadas
