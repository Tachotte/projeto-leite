# Regras de negócio — Projeto LEITE

As regras abaixo consolidam informações fornecidas durante o levantamento. Quando uma regra descreve uma prática operacional, ela não implica que exista automação correspondente no banco.

| Código | Regra |
|---|---|
| RN-01 | A quantidade solicitada pelos clientes varia diariamente. |
| RN-02 | Os pedidos são recebidos no dia anterior à entrega. |
| RN-03 | O preço por litro é único para todos os clientes. |
| RN-04 | As vendas são realizadas a prazo (“fiado”). |
| RN-05 | Não existe prazo fixo para pagamento. |
| RN-06 | Não são aceitos pagamentos parciais; o pagamento informado é integral. |
| RN-07 | Uma pessoa executa as atividades operacionais do sítio. |
| RN-08 | A rota e a sequência de atendimento são fixas. |
| RN-09 | A carroça é puxada por dois cavalos. |
| RN-10 | Os animais recebem ração duas vezes ao dia. |
| RN-11 | Vacas e cavalos utilizam a mesma fonte natural de água. |
| RN-12 | A ração fica armazenada em galpão junto com outros materiais. |
| RN-13 | A reposição de ração ocorre quando o trabalhador percebe que está acabando. |
| RN-14 | A ração é comprada em sacos de 25 kg. |
| RN-15 | Vacas e cavalos recebem tipos diferentes de ração. |
| RN-16 | Cada vaca produz, em média, 6 litros de leite por dia. |
| RN-17 | As vacas são ordenhadas uma vez ao dia. |
| RN-18 | A ordenha começa às 04h. |
| RN-19 | Após a ordenha, o leite é preparado para distribuição imediata, conforme prática relatada. |
| RN-20 | O leite é entregue em garrafas de 1 litro; as caixas com capacidade para 24 garrafas retornam ao sítio. |
| RN-21 | O banco operacional não controla estoque de leite. |
| RN-22 | O pedido e o acompanhamento da entrega são mantidos em `tb_entrega`, sem tabela `tb_pedido` separada. |
| RN-23 | A data prevista de entrega não é necessária no modelo atual. |
| RN-24 | `vl_total` não será armazenado em `tb_entrega` nesta fase. |
| RN-25 | A futura camada de BI será separada do banco operacional e poderá derivar o valor total a partir de litros e preço por litro. |

## Observações

1. RN-19 descreve o processo informado, não uma avaliação de conformidade sanitária.
2. RN-20 registra a embalagem/retorno informado. Não existe controle individual de garrafas ou caixas no banco atual.
3. RN-24 é uma decisão de modelagem: a coluna `vl_total` foi removida de `tb_entrega`.
4. A regra de pagamento integral ainda precisa ser conciliada com a estrutura atual, que marca pagamento por registro de entrega.
