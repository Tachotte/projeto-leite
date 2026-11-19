# Pendências, limitações e riscos conhecidos

Este documento evita tratar funcionalidades futuras como se já estivessem implementadas.

## 1. Validação final da estrutura

- [ ] Executar novamente o script de validação após remover `tb_entrega.vl_total`.
- [ ] Confirmar a contagem final de colunas: esperada em 33.
- [ ] Confirmar índices e chaves estrangeiras após a última alteração.
- [ ] Obter `SHOW CREATE TABLE` das seis tabelas para registrar integralmente tipos, defaults, checks e opções de tabela.
- [ ] Conferir se o banco físico corresponde integralmente ao dicionário.

## 2. Pedidos e entregas

- `nu_litros` não distingue explicitamente quantidade solicitada e quantidade efetivamente entregue.
- O processo informado prevê pedidos no dia anterior, mas a estrutura atual registra uma linha por cliente em `tb_entrega`.
- Não há tabela ou estrutura para itens de pedido.
- Não há data prevista, por decisão explícita do usuário.

## 3. Financeiro

- O pagamento é descrito como integral e sem parcelas parciais.
- A estrutura atual possui `fl_pago` e `dt_pagamento` em cada registro de entrega.
- Ainda não existe uma entidade de recebimento que permita registrar uma quitação única para várias entregas de um mesmo cliente.
- É necessário avaliar se o processo real exige associar um pagamento a várias entregas sem criar complexidade desnecessária.
- `vl_total` foi removido de `tb_entrega`; métricas financeiras serão tratadas no BI.

## 4. Estoque e compras

- `tb_compra` registra quantidade e valor total da compra.
- `tb_estoque.nu_quantidade` mantém um saldo, mas não foi confirmada uma rotina automática para atualizar esse saldo.
- Não existe histórico formal de saídas/consumo.
- Não há fornecedor cadastrado.
- A compra de ração ocorre quando o trabalhador percebe que está acabando.
- Não foi confirmado se a quantidade em estoque já é atualizada manualmente ou por algum processo externo.

## 5. Produção e animais

- `tb_producao` registra produção diária agregada.
- Não existe relacionamento físico entre produção e animal.
- `tb_animal.sg_especie` é texto; não existe tabela separada de espécies no modelo atual.
- A tabela de produção possui unicidade por data, limitando a um registro por dia.

## 6. Higiene, conservação e conformidade

O processo relatado menciona distribuição logo após a ordenha e ausência de refrigeração no sítio. Essa informação não constitui avaliação sanitária. Higienização, conservação, transporte, qualidade e exigências regulatórias devem ser verificados com profissional competente e fontes oficiais aplicáveis.

## 7. Dados de teste observados em 19/11/2026

Na validação enviada pelo usuário, antes da remoção de `vl_total`, foram apresentados:

| Tabela | Registros |
|---|---:|
| `tb_animal` | 8 |
| `tb_cliente` | 0 |
| `tb_compra` | 0 |
| `tb_entrega` | 0 |
| `tb_estoque` | 3 |
| `tb_producao` | 0 |

A contagem de registros deve ser atualizada quando houver nova carga. Os três itens de estoque não foram identificados nominalmente no resultado compartilhado.
