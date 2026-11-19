# Histórico de versões

## 2.4 — 19/11/2026

- Preparado pacote de documentação Markdown para publicação no GitHub.
- Consolidado o contexto operacional mais recente: garrafas de 1 litro e caixas retornáveis de 24 unidades.
- Documentadas seis tabelas operacionais.
- Documentada a remoção de `tb_pedido`, `dt_entrega_prevista` e `tb_entrega.vl_total`.
- Separadas as decisões confirmadas das pendências e limitações.
- Corrigida a contagem estrutural: 35 colunas após remover `dt_entrega_prevista`; 34 esperadas após remover também `vl_total`.

## 2.3 — 19/11/2026

- Documentação técnica atualizada após remoção de `vl_total` de `tb_entrega`.
- Camada analítica/Star Schema mantida como etapa futura.

## 2.2 — 19/11/2026

- Modelo simplificado para seis tabelas.
- Dados de pedido incorporados em `tb_entrega`.
- Tabela `tb_pedido` removida.
- Data prevista de entrega removida posteriormente.

## Versões anteriores

- Levantamento progressivo de requisitos e storytelling.
- Primeira estrutura do banco MariaDB criada e posteriormente simplificada.
