-- PARA QUE SERVEM #################################################################
-- Servem para criar comandos personalizados de scripts usados recorrentemente.

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Crie uma função chamada DATEDIFF para calcular a diferença entre
-- duas datas em dias, semanas, meses, anos

CREATE FUNCTION dbo.fn_CalculaDiferenca (
    @unidade VARCHAR(10), 
    @data_inicial DATE, 
    @data_final DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @resultado INT;

    SELECT @resultado = CASE
        WHEN @unidade IN ('d', 'day', 'days') THEN DATEDIFF(DAY, @data_inicial, @data_final)
        WHEN @unidade IN ('w', 'week', 'weeks') THEN DATEDIFF(WEEK, @data_inicial, @data_final)
        WHEN @unidade IN ('m', 'month', 'months') THEN DATEDIFF(MONTH, @data_inicial, @data_final)
        WHEN @unidade IN ('y', 'year', 'years') THEN DATEDIFF(YEAR, @data_inicial, @data_final)
        ELSE NULL
    END;

    RETURN @resultado;
END;
GO


SELECT dbo.fn_CalculaDiferenca('month', '2023-01-01', '2023-05-01') AS Diferenca;