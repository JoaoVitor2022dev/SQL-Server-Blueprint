###  1 - Como extraid a data atual 

SELECT GETDATE();  

RETORNO => [2025-12-29 22:07:00.573]

#   2 - CAST ou CONVERT: Se você quiser apenas a data (sem a hora), você precisa transformar o resultado.

SELECT CAST(GETDATE() AS DATE);
-- OU
SELECT CONVERT(DATE, GETDATE());

RETORNO => [2025-12-29]

#   3 - SYSDATETIME(): Retorna a data e hora com mais precisão de milissegundos que o GETDATE.

SELECT SYSDATETIME();


#   4 - CURRENT_TIMESTAMP: Esta é a versão padrão ANSI que o SQL Server suporta (equivale ao GETDATE()).

SELECT CURRENT_TIMESTAMP;


#  5 -  INTERVALO 

SELECT DATEADD(WEEK, -10, GETDATE());

# o Primeiro retorno desse coamdno é com data e hora e para apenas receber data é preciso trasnformar em data simples 

SELECT CAST(DATEADD(WEEK, +10, GETDATE())  AS DATE);

SELECT CAST(DATEADD(MONTH, +10, GETDATE()) AS DATE);

SELECT CAST(DATEADD(YEAR, +10, GETDATE())  AS DATE);

SELECT DATEADD(HOURS, +10, GETDATE()) ;


#  RETURNO DA FUNÇÃO DE INTERVAL => 

SELECT DATEADD(WEEK, -10, GETDATE());

-- DATEDIFF: Serve para saber a diferença entre duas datas (Ex: quantos dias faltam para o Natal?).

SELECT DATEDIFF(DAY, GETDATE(), '2025-12-31');  

-- DATEPART: Serve para "extrair" uma parte da data (Ex: quero saber apenas o dia de hoje).

SELECT DATEPART(DAY, GETDATE()); => EXTRAIR O DIA DO MES TIPO 29/12 => 29

-- EOMONTH: Serve para descobrir o último dia do mês de uma data (muito útil para relatórios financeiros).

SELECT EOMONTH(GETDATE());



