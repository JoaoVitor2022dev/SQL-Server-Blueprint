/*
-------------------------------------------------------------------------------
GUIA DE TIPOS DE DADOS - SQL SERVER
-------------------------------------------------------------------------------
Dica: Escolha sempre o menor tipo de dado que comporte seu valor com segurança
para garantir máxima performance e economia de disco/memória.
*/

-- 1. Criando um banco de dados de exemplo
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ExemploTiposDados')

BEGIN
    CREATE DATABASE ExemploTiposDados;


USE ExemploTiposDados;

-- 2. Criando a tabela demonstrativa
IF OBJECT_ID('Usuarios', 'U') IS NOT NULL DROP TABLE Usuarios;

CREATE TABLE Usuarios (
    -- INT: Ideal para chaves primárias. Rápido para indexação.
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,

    -- VARCHAR(n): Texto de tamanho variável. Economiza espaço.
    -- Use para nomes, e-mails e descrições.
    Nome VARCHAR(100) NOT NULL,

    -- CHAR(n): Tamanho fixo. Ideal para códigos padronizados (UF, Siglas).
    -- Sempre ocupará 2 bytes aqui, sem overhead de controle.
    EstadoSigla CHAR(2) NOT NULL,

    -- NVARCHAR(n): Suporta caracteres especiais/emojis (Unicode).
    -- Essencial para sistemas internacionais ou campos de "Bio".
    Biografia NVARCHAR(500),

    -- DECIMAL(p,s): p = total de dígitos, s = decimais.
    -- SEMPRE use para dinheiro. Evite FLOAT para finanças.
    SalarioAtual DECIMAL(18, 2),

    -- BIT: Armazena 0 ou 1. O SQL Server agrupa vários BITs em 1 byte.
    EstaAtivo BIT DEFAULT 1,

    -- DATE: Apenas data (sem hora). Perfeito para aniversários.
    DataNascimento DATE,

    -- DATETIME2: O padrão moderno para data e hora com alta precisão.
    DataCadastro DATETIME2 DEFAULT GETDATE(),

    -- BIGINT: Use apenas se o valor puder ultrapassar 2 bilhões.
    ContadorAcessosGlobal BIGINT DEFAULT 0
);
GO

-- 3. Inserindo dados de teste
INSERT INTO Usuarios (Nome, EstadoSigla, Biografia, SalarioAtual, EstaAtivo, DataNascimento)
VALUES 
('João Silva', 'SP', 'Desenvolvedor entusiasta 🚀', 5500.50, 1, '1990-05-15'),
('Maria Oliveira', 'RJ', 'Analista de Dados 📊', 7200.00, 1, '1985-10-22');


-- 4. Consulta para validar os dados
SELECT 
    Nome, 
    SalarioAtual, 
    DataCadastro,
    CASE WHEN EstaAtivo = 1 THEN 'Sim' ELSE 'Não' END AS Ativo
FROM Usuarios;