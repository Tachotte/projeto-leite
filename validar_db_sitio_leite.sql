-- Projeto LEITE
-- Validacao estrutural e quantitativa (somente leitura)
-- MariaDB 13.0
-- Nao executa INSERT, UPDATE, DELETE, DROP ou ALTER.

USE db_sitio_leite;

-- 1. Quantidade e nomes das tabelas
SELECT COUNT(*) AS total_tabelas
FROM information_schema.tables
WHERE table_schema = DATABASE()
  AND table_type = 'BASE TABLE';

SHOW TABLES;

-- 2. Quantidade total de colunas
SELECT COUNT(*) AS total_colunas
FROM information_schema.columns
WHERE table_schema = DATABASE();

-- 3. Estrutura de todas as colunas
SELECT
    TABLE_NAME AS nm_tabela,
    COLUMN_NAME AS nm_coluna,
    COLUMN_TYPE AS tipo_dado,
    IS_NULLABLE AS permite_nulo,
    COLUMN_KEY AS tipo_chave,
    COLUMN_DEFAULT AS valor_padrao,
    EXTRA AS atributo
FROM information_schema.columns
WHERE table_schema = DATABASE()
ORDER BY TABLE_NAME, ORDINAL_POSITION;

-- 4. Indices
SELECT
    TABLE_NAME AS nm_tabela,
    INDEX_NAME AS nm_indice,
    COLUMN_NAME AS nm_coluna,
    NON_UNIQUE AS nao_unico,
    SEQ_IN_INDEX AS ordem_coluna
FROM information_schema.statistics
WHERE table_schema = DATABASE()
ORDER BY TABLE_NAME, INDEX_NAME, SEQ_IN_INDEX;

-- 5. Chaves estrangeiras
SELECT
    TABLE_NAME AS tabela_origem,
    COLUMN_NAME AS coluna_origem,
    CONSTRAINT_NAME AS nome_fk,
    REFERENCED_TABLE_NAME AS tabela_referenciada,
    REFERENCED_COLUMN_NAME AS coluna_referenciada
FROM information_schema.key_column_usage
WHERE table_schema = DATABASE()
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, CONSTRAINT_NAME;

-- 6. Quantidade de registros por tabela
SELECT 'tb_animal' AS nm_tabela, COUNT(*) AS total_registros FROM tb_animal
UNION ALL
SELECT 'tb_cliente', COUNT(*) FROM tb_cliente
UNION ALL
SELECT 'tb_compra', COUNT(*) FROM tb_compra
UNION ALL
SELECT 'tb_entrega', COUNT(*) FROM tb_entrega
UNION ALL
SELECT 'tb_estoque', COUNT(*) FROM tb_estoque
UNION ALL
SELECT 'tb_producao', COUNT(*) FROM tb_producao;

-- 7. DDL integral de cada tabela
SHOW CREATE TABLE tb_animal;
SHOW CREATE TABLE tb_cliente;
SHOW CREATE TABLE tb_compra;
SHOW CREATE TABLE tb_entrega;
SHOW CREATE TABLE tb_estoque;
SHOW CREATE TABLE tb_producao;
