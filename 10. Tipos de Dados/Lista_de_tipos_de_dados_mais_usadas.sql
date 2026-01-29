Criei uma nota com a lista simplificada dos tipos de dados para facilitar sua consulta durante a importação de dados externos.

Aqui está o conteúdo organizado para o seu arquivo `.sql`:

```sql
/* LISTA DE REFERÊNCIA: TIPOS DE DADOS SQL SERVER 
   Ideal para mapeamento de importação externa (CSV, Excel, etc.)
*/

--                                  NUMÉRICOS

INT                 -- Inteiros (Ex: IDs, Quantidades)
BIGINT              -- Inteiros grandes (Ex: IDs de sistemas globais)
DECIMAL(18,2)       -- Valores monetários/Financeiro
FLOAT               -- Valores científicos ou médias aproximadas
BIT                 -- Booleano/Status (0 ou 1)

--                                    TEXTO

VARCHAR(255)        -- Texto variável (Nomes, Logradouros, E-mails)
VARCHAR(MAX)        -- Textos extremamente longos (Observações)
CHAR(2)             -- Texto fixo (Ex: Siglas de UF)
NVARCHAR(255)       -- Texto com suporte a Emojis e caracteres especiais

--                                  DATA E HORA

DATE                -- Apenas data (AAAA-MM-DD)
DATETIME2           -- Data e hora com alta precisão
TIME                -- Apenas o horário

--                                    OUTROS

UNIQUEIDENTIFIER    -- Para colunas de GUID/UUID
VARBINARY(MAX)      -- Para arquivos ou dados binários

```