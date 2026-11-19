# Decisões de modelagem

Este documento registra decisões tomadas para manter o banco operacional simples e aderente à operação conhecida.

| Decisão | Justificativa |
|---|---|
| Manter seis tabelas | Reduzir complexidade e evitar entidades sem necessidade operacional confirmada. |
| Incorporar pedido em `tb_entrega` | As tabelas separadas de pedido e entrega estavam vazias; optou-se por uma estrutura única. |
| Remover `tb_pedido` | Evitar duplicidade e simplificar o fluxo. |
| Remover `dt_entrega_prevista` | O usuário informou que a data prevista não é necessária. |
| Manter `dt_pedido` | Registrar quando o cliente fez o pedido. |
| Manter `dt_entrega_real` | Registrar quando a entrega aconteceu; pode permanecer nula enquanto não realizada. |
| Remover `vl_total` de `tb_entrega` | O total será tratado futuramente na camada analítica, não no modelo operacional atual. |
| Manter `vl_litro` e `nu_litros` | Preservar os elementos necessários para derivar o valor total no BI. |
| Não controlar estoque de leite | A operação informada não requer estoque de leite no modelo atual. |
| Não criar tabela de água | O controle de água não faz parte do escopo atual. |
| Não detalhar alimentação por animal | Evitar granularidade desnecessária nesta fase. |
| Separar BI do operacional | O Star Schema será projetado como camada analítica própria. |

## Fronteira entre operacional e analítico

O banco operacional registra eventos e cadastros essenciais. A futura camada analítica poderá derivar métricas, por exemplo:

`valor_total_calculado = nu_litros * vl_litro`

Essa expressão é uma regra de transformação candidata para a camada de BI, não uma coluna atualmente existente em `tb_entrega`.

## Histórico de simplificação

1. O modelo inicial considerava mais entidades e tabelas.
2. A estrutura foi simplificada progressivamente.
3. A tabela `tb_pedido` foi removida e seus dados incorporados em `tb_entrega`.
4. A data prevista foi removida.
5. O valor total da entrega foi removido.
6. O modelo operacional atual possui seis tabelas.
