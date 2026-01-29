-- CONTEÚDO ########################################################################

 Criação de tabela a partir de uma query

 Criação de tabela a partir do zero

 Deleção de tabelas

-- EXEMPLOS ########################################################################

                                                                                      (Exemplo 1) Criação de tabela a partir de uma query
# Crie uma tabela chamada customers_age com o id e a idade dos clientes. 
# Chame-a de temp_tables.customers_age

#2. Garante que a tabela não exista antes de tentar criá-la

                               IF OBJECT_ID('[TEMP_TABLES].[dbo].[customers_age]', 'U') IS NOT NULL
                                   DROP TABLE [TEMP_TABLES].[dbo].[customers_age];

#1. Seleciona e insere na nova tabela

                                SELECT 
                                    [customer_id], 
                                    DATEDIFF(HOUR, [birth_date], GETDATE()) / 8766 AS [idade]
                                    INTO [TEMP_TABLES].[dbo].[customers_age] 
                                FROM [SALES].[dbo].[customers];


                                                                                        (Exemplo 2) Criação de tabela a partir do zero
#Crie uma tabela com a tradução dos status profissionais dos clientes. 
#Chame-a de temp_tables.profissoes
 
                                SELECT DISTINCT 
                                       [professional_status]
                                FROM [SALES].[dbo].[customers];
                                
                                CREATE TABLE [TEMP_TABLES].[dbo].[profissoes] (
                                    [professional_status] VARCHAR(100),
                                    [status_profissional] VARCHAR(100)
                                );
                                
                                INSERT INTO [TEMP_TABLES].[dbo].[profissoes](
                                    [professional_status],
                                    [status_profissional]
                                )
                                VALUES
                                    ('freelancer', 'freelancer'),
                                    ('retired', 'aposentado(a)'),
                                    ('clt', 'clt'),
                                    ('self_employed', 'autônomo(a)'),
                                    ('other', 'outro'),
                                    ('businessman', 'empresário(a)'),
                                    ('civil_servant', 'funcionário público(a)'),
                                    ('student', 'estudante');
 
 
                                                                                         (Exemplo 3) Deleção de tabelas

#Delete a tabela temp_tables.profissoes

                                DROP TABLE [TEMP_TABLES].[dbo].[profissoes]


                                                                                         (Exemplo 4) Esvaziar os dados da tabela 


                                                                                         Como funciona (Exemplo Prático)

# Imagine que você tem uma tabela de logs temporários chamada LogsProcessamento que ficou gigante e você quer limpá-la.


-- Comando simples e direto
                                 TRUNCATE TABLE LogsProcessamento; 


-- RESUMO ##########################################################################

(1) Para criar tabelas a partir de uma query basta escrever a query normalmente e
colocar o comando INTO antes do FROM informando o schema e o nome da tabela 
a ser criada

(2) Para criar tabelas a partir do zero é necessário (a) criar uma tabela vazia 
com o comando CREATE TABLE (b) Informar que valores serão inseridos com o comando
INSERT INTO seguido do nome das colunas (c) Inserir os valores manualmente em forma 
 de lista após o comando VALUES

(3) Para deletar uma tabela utiliza-se o comando DROP TABLE

