# Validação do banco de dados

## 1. Objetivo

Verificar se o banco `db_sitio_leite` mantém a estrutura esperada, sem alterar dados ou objetos.

## 2. Resultado estrutural compartilhado em 19/11/2026

Antes da remoção da coluna `tb_entrega.vl_total`, foram apresentados:

- 6 tabelas;
- 34 colunas;
- 13 índices;
- 2 chaves estrangeiras.

Após a remoção de `vl_total`, a contagem esperada passa a ser **34 colunas** (4 + 5 + 6 + 10 + 5 + 4). A contagem final precisa ser confirmada executando novamente o script.

## 3. Relacionamentos confirmados

- `tb_compra.id_estoque` → `tb_estoque.id_estoque`
- `tb_entrega.id_cliente` → `tb_cliente.id_cliente`

## 4. Restrições explicitamente observadas

Na definição compartilhada de `tb_compra`:
- `ck_compra_quantidade`: `nu_quantidade > 0`.
- `ck_compra_valor`: `vl_total >= 0`.

Na definição compartilhada de `tb_entrega` antes da remoção de `vl_total`:
- `ck_entrega_status`: status limitado a `PENDENTE`, `CONCLUIDA` ou `CANCELADA`.

Não foram presumidas outras restrições.

## 5. Como executar

1. Abra seu cliente MariaDB.
2. Selecione o banco `db_sitio_leite`.
3. Execute `sql/validar_db_sitio_leite.sql`.
4. Guarde os resultados para comparação com o dicionário de dados.

O script contém somente consultas de leitura.
