# Levantamento de requisitos — Projeto LEITE

## 1. Objetivo

Documentar a operação conhecida do sítio LEITE e orientar a implementação de uma solução de dados simples em MariaDB.

## 2. Caracterização

| Característica | Informação levantada |
|---|---|
| Atividade | Produção e venda direta de leite |
| Trabalhadores | 1 pessoa |
| Vacas | 6 |
| Cavalos | 2 |
| Clientes | Mais de 30 |
| Tipo de cliente | Pessoa física |
| Produção média por vaca | 6 litros/dia |
| Produção média total | 36 litros/dia |
| Frequência da ordenha | Uma vez ao dia |
| Início da ordenha | 04h |
| Tempo médio por vaca | 30 minutos |
| Transporte | Carroça puxada por 2 cavalos |
| Rota | Fixa |
| Duração aproximada das entregas | 2 horas |
| Duração aproximada do retorno | 1 hora |

## 3. Requisitos funcionais identificados

| Código | Requisito |
|---|---|
| RF-01 | Manter cadastro básico dos animais. |
| RF-02 | Manter cadastro dos clientes. |
| RF-03 | Registrar a produção diária de leite. |
| RF-04 | Registrar os pedidos e acompanhar a entrega por cliente. |
| RF-05 | Registrar o preço por litro aplicado à entrega. |
| RF-06 | Registrar se a entrega foi paga e a data do pagamento. |
| RF-07 | Cadastrar materiais e manter uma quantidade disponível informada. |
| RF-08 | Registrar compras de materiais vinculadas ao item de estoque. |

Esses requisitos descrevem o que a estrutura atual contempla. Não significam que todas as rotinas estejam automatizadas.

## 4. Requisitos não funcionais e diretrizes

- Utilizar MariaDB como SGBD.
- Manter nomes de tabelas e colunas padronizados.
- Preservar integridade referencial por chaves estrangeiras.
- Priorizar simplicidade e facilidade de operação.
- Evitar tabelas sem necessidade comprovada.
- Manter separação entre o banco operacional e a futura camada de BI.

## 5. Regras operacionais levantadas

- Os pedidos são recebidos no dia anterior à entrega.
- A quantidade solicitada varia diariamente.
- O preço por litro é único para todos os clientes.
- As vendas são a prazo.
- Não existe vencimento fixo.
- Não são aceitos pagamentos parciais.
- Uma pessoa executa as atividades da propriedade.
- A rota e a sequência de clientes são fixas.
- As vacas e os cavalos recebem ração duas vezes ao dia.
- A ração é comprada em sacos de 25 kg.
- As rações para vacas e cavalos são diferentes.
- A reposição ocorre quando o trabalhador percebe que a ração está acabando.
- A produção média informada é de 6 litros por vaca/dia.
- A ordenha acontece uma vez ao dia, começando às 04h.
- O leite é fracionado em garrafas de 1 litro; as caixas de 24 garrafas retornam ao sítio.
- Não há estoque de leite no escopo do banco atual.

## 6. Escopo implementado no banco atual

| Área | Implementação |
|---|---|
| Animais | `tb_animal` |
| Clientes | `tb_cliente` |
| Compras | `tb_compra` |
| Pedidos/entregas | `tb_entrega` |
| Materiais/saldo | `tb_estoque` |
| Produção | `tb_producao` |

## 7. Pontos ainda não especificados ou não implementados

- Instrumento exato utilizado para medir o leite na entrega.
- Processo detalhado de higienização dos recipientes e utensílios.
- Tratamento de eventual sobra de leite.
- Forma de registrar pedidos além do registro final em `tb_entrega`.
- Processo de quitação de várias entregas em um único pagamento.
- Rotina de atualização do saldo de estoque nas compras e nos consumos.
- Fornecedores e seus dados.
- Controle sanitário e de qualidade do leite.
- Quantidade efetivamente entregue separada da quantidade solicitada.
- Histórico de movimentações de estoque.

## 8. Critério de evolução

Uma necessidade nova deve ser incluída no modelo somente depois de confirmada no processo real. O objetivo é representar a operação, não criar um sistema genérico de gestão rural.
