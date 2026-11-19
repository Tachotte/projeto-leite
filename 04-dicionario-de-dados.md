# Dicionário de dados — `db_sitio_leite`

**SGBD:** MariaDB 13.0  
**Estrutura:** 6 tabelas.  
**Contagem esperada após remover `tb_entrega.vl_total`: 34 colunas.**

> O dicionário foi montado a partir da estrutura enviada para validação. A definição completa de todas as tabelas (`SHOW CREATE TABLE`) ainda não foi fornecida; por isso, as restrições não apresentadas explicitamente não são presumidas.

## Convenções

- `PK`: chave primária.
- `FK`: chave estrangeira.
- `UK`: restrição/índice único.
- `NULL`: campo opcional.
- `NOT NULL`: campo obrigatório.

## 1. `tb_animal`

**Finalidade:** cadastro básico dos animais.

| Coluna | Tipo | Nulo? | Chave/atributo | Descrição |
|---|---|---:|---|---|
| `id_animal` | `BIGINT(20) UNSIGNED` | Não | PK, AUTO_INCREMENT | Identificador do animal |
| `nm_animal` | `VARCHAR(100)` | Não | UK `uk_animal_nome` | Nome do animal |
| `sg_especie` | `VARCHAR(20)` | Não | — | Espécie/categoria informada |
| `sg_status` | `VARCHAR(15)` | Não | DEFAULT `'ATIVO'` | Situação cadastral |

## 2. `tb_cliente`

**Finalidade:** cadastro dos clientes.

| Coluna | Tipo | Nulo? | Chave/atributo | Descrição |
|---|---|---:|---|---|
| `id_cliente` | `BIGINT(20) UNSIGNED` | Não | PK, AUTO_INCREMENT | Identificador do cliente |
| `nm_cliente` | `VARCHAR(150)` | Não | Índice `idx_cliente_nome` | Nome do cliente |
| `nu_telefone` | `VARCHAR(20)` | Sim | — | Telefone |
| `de_endereco` | `VARCHAR(255)` | Sim | — | Endereço |
| `fl_ativo` | `TINYINT(1)` | Não | DEFAULT `1` | Indicador de ativo |

## 3. `tb_compra`

**Finalidade:** registro de compras de materiais.

| Coluna | Tipo | Nulo? | Chave/atributo | Descrição |
|---|---|---:|---|---|
| `id_compra` | `BIGINT(20) UNSIGNED` | Não | PK, AUTO_INCREMENT | Identificador da compra |
| `id_estoque` | `BIGINT(20) UNSIGNED` | Não | FK `fk_compra_estoque` | Material comprado |
| `dt_compra` | `DATE` | Não | Índice `idx_compra_data` | Data da compra |
| `nu_quantidade` | `DECIMAL(12,3)` | Não | CHECK `> 0` | Quantidade comprada |
| `vl_total` | `DECIMAL(12,2)` | Não | CHECK `>= 0` | Valor total da compra |
| `de_observacao` | `VARCHAR(255)` | Sim | — | Observação |

FK: `id_estoque` referencia `tb_estoque.id_estoque`.

## 4. `tb_entrega`

**Finalidade:** registrar o pedido do cliente e acompanhar a entrega e o pagamento.

| Coluna | Tipo | Nulo? | Chave/atributo | Descrição |
|---|---|---:|---|---|
| `id_entrega` | `BIGINT(20) UNSIGNED` | Não | PK, AUTO_INCREMENT | Identificador do registro |
| `id_cliente` | `BIGINT(20) UNSIGNED` | Não | FK `fk_entrega_cliente` | Cliente |
| `dt_pedido` | `DATE` | Não | — | Data do pedido |
| `dt_entrega_real` | `DATE` | Sim | — | Data efetiva da entrega |
| `nu_litros` | `DECIMAL(10,2)` | Não | — | Quantidade de litros registrada |
| `vl_litro` | `DECIMAL(10,2)` | Não | — | Preço por litro |
| `sg_status` | `VARCHAR(20)` | Não | DEFAULT `'PENDENTE'`; CHECK | Situação: `PENDENTE`, `CONCLUIDA` ou `CANCELADA` |
| `fl_pago` | `TINYINT(1)` | Não | DEFAULT `0` | Indicador de pagamento |
| `dt_pagamento` | `DATE` | Sim | — | Data do pagamento |
| `de_observacao` | `VARCHAR(255)` | Sim | — | Observação |

FK: `id_cliente` referencia `tb_cliente.id_cliente`.

**Campos deliberadamente ausentes:**
- `dt_entrega_prevista`: removida por não ser necessária.
- `vl_total`: removida; o valor poderá ser derivado na camada analítica.

## 5. `tb_estoque`

**Finalidade:** cadastro dos materiais e quantidade disponível.

| Coluna | Tipo | Nulo? | Chave/atributo | Descrição |
|---|---|---:|---|---|
| `id_estoque` | `BIGINT(20) UNSIGNED` | Não | PK, AUTO_INCREMENT | Identificador do item |
| `nm_item` | `VARCHAR(100)` | Não | UK `uk_estoque_nome` | Nome do material |
| `sg_categoria` | `VARCHAR(30)` | Não | — | Categoria |
| `sg_unidade` | `VARCHAR(10)` | Não | — | Unidade de medida |
| `nu_quantidade` | `DECIMAL(12,3)` | Não | DEFAULT `0.000` | Quantidade disponível |

## 6. `tb_producao`

**Finalidade:** registro diário da produção.

| Coluna | Tipo | Nulo? | Chave/atributo | Descrição |
|---|---|---:|---|---|
| `id_producao` | `BIGINT(20) UNSIGNED` | Não | PK, AUTO_INCREMENT | Identificador da produção |
| `dt_producao` | `DATE` | Não | UK `uk_producao_data` | Data da produção |
| `nu_litros_produzidos` | `DECIMAL(10,2)` | Não | — | Litros produzidos |
| `de_observacao` | `VARCHAR(255)` | Sim | — | Observação |

## Relacionamentos

| Origem | Coluna | Destino | Coluna |
|---|---|---|---|
| `tb_compra` | `id_estoque` | `tb_estoque` | `id_estoque` |
| `tb_entrega` | `id_cliente` | `tb_cliente` | `id_cliente` |

## Índices identificados na validação

| Tabela | Índice | Coluna | Único? |
|---|---|---|---:|
| `tb_animal` | `PRIMARY` | `id_animal` | Sim |
| `tb_animal` | `uk_animal_nome` | `nm_animal` | Sim |
| `tb_cliente` | `PRIMARY` | `id_cliente` | Sim |
| `tb_cliente` | `idx_cliente_nome` | `nm_cliente` | Não |
| `tb_compra` | `PRIMARY` | `id_compra` | Sim |
| `tb_compra` | `idx_compra_data` | `dt_compra` | Não |
| `tb_compra` | `idx_compra_estoque` | `id_estoque` | Não |
| `tb_entrega` | `PRIMARY` | `id_entrega` | Sim |
| `tb_entrega` | `idx_entrega_cliente` | `id_cliente` | Não |
| `tb_estoque` | `PRIMARY` | `id_estoque` | Sim |
| `tb_estoque` | `uk_estoque_nome` | `nm_item` | Sim |
| `tb_producao` | `PRIMARY` | `id_producao` | Sim |
| `tb_producao` | `uk_producao_data` | `dt_producao` | Sim |

**Nota:** a lista de índices foi fornecida antes da remoção de `vl_total`; essa remoção não deveria alterar os índices listados. Recomenda-se executar novamente a validação para confirmar o estado final.
