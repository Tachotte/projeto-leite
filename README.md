# Projeto LEITE

**Sistema de informação para organização da produção e distribuição de leite em uma pequena propriedade rural.**

[![Banco de dados](https://img.shields.io/badge/Database-MariaDB%2013.0-blue)](https://mariadb.org/)
[![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)]()

## 1. Visão geral

O Projeto LEITE documenta e implementa, de forma incremental, uma solução de dados para apoiar a operação de um pequeno sítio produtor de leite. O foco é manter um modelo simples, aderente à rotina real da propriedade e sem criar controles que não façam parte da operação.

O projeto começou com levantamento de requisitos e storytelling, avançou para a modelagem relacional e atualmente possui um banco operacional MariaDB chamado `db_sitio_leite`.

## 2. Contexto operacional conhecido

- 6 vacas leiteiras e 2 cavalos.
- Produção média informada: 6 litros por vaca/dia, totalizando aproximadamente 36 litros/dia.
- Ordenha uma vez ao dia, com início às 04h.
- Tempo informado de ordenha: aproximadamente 30 minutos por vaca.
- 1 trabalhador executa as atividades operacionais.
- Mais de 30 clientes, todos pessoas físicas.
- Pedidos recebidos no dia anterior; quantidades variam.
- Distribuição em rota fixa, por carroça puxada por dois cavalos.
- Tempo aproximado de entrega: 2 horas; retorno: 1 hora.
- Leite fracionado em garrafas de 1 litro, acondicionadas em caixas de 24 unidades.
- As garrafas são entregues; as caixas retornam ao sítio.
- Não há estoque de leite no escopo do banco operacional.

Os números são informações levantadas com a propriedade e representam médias ou características informadas, não metas ou garantias de produção.

## 3. Banco operacional atual

Banco: `db_sitio_leite`  
SGBD: MariaDB 13.0  
Estrutura documentada: **6 tabelas e 34 colunas**.

| Tabela | Responsabilidade |
|---|---|
| `tb_animal` | Cadastro de animais |
| `tb_cliente` | Cadastro de clientes |
| `tb_compra` | Registro de compras de materiais |
| `tb_entrega` | Registro do pedido e acompanhamento da entrega/pagamento |
| `tb_estoque` | Cadastro de materiais e saldo disponível |
| `tb_producao` | Registro da produção diária |

Relacionamentos confirmados:

- `tb_compra.id_estoque` → `tb_estoque.id_estoque`
- `tb_entrega.id_cliente` → `tb_cliente.id_cliente`

A tabela `tb_pedido` foi removida e suas informações foram incorporadas a `tb_entrega`. A coluna `dt_entrega_prevista` também foi removida. A coluna `vl_total` de `tb_entrega` foi removida deliberadamente; o total poderá ser derivado na futura camada analítica.

## 4. Escopo e princípios

### Incluído no modelo operacional atual

- Cadastro básico de animais e clientes.
- Registro diário da produção.
- Registro de pedidos/entregas por cliente.
- Registro de compras de materiais.
- Cadastro de materiais e saldo informado.

### Fora do escopo atual

- Estoque de leite.
- Controle individual de alimentação por animal.
- Controle de água.
- Cadastro de fornecedores.
- Controle de rota e sequência de clientes por tabelas.
- Controle de garrafas entregues individualmente ou rastreamento de retorno de garrafas.
- Tabelas específicas para latões ou caixas retornáveis.
- Cálculo de faturamento armazenado em `tb_entrega`.

A simplicidade é uma decisão de projeto. Novas tabelas só devem ser adicionadas quando houver requisito real que justifique sua necessidade.

## 5. Documentação

- [Storytelling](docs/01-storytelling.md)
- [Levantamento de requisitos](docs/02-requisitos.md)
- [Regras de negócio](docs/03-regras-de-negocio.md)
- [Dicionário de dados](docs/04-dicionario-de-dados.md)
- [Modelo relacional](docs/05-modelo-relacional.md)
- [Decisões de modelagem](docs/06-decisoes-de-modelagem.md)
- [Pendências e limitações conhecidas](docs/07-pendencias.md)
- [Validação do banco](docs/08-validacao.md)
- [Histórico de alterações](CHANGELOG.md)

## 6. Organização do repositório

```text
Projeto_LEITE/
├── README.md
├── CHANGELOG.md
├── docs/
│   ├── 01-storytelling.md
│   ├── 02-requisitos.md
│   ├── 03-regras-de-negocio.md
│   ├── 04-dicionario-de-dados.md
│   ├── 05-modelo-relacional.md
│   ├── 06-decisoes-de-modelagem.md
│   ├── 07-pendencias.md
│   └── 08-validacao.md
└── sql/
    └── validar_db_sitio_leite.sql
```

## 7. Estado do projeto

O banco operacional está criado e foi submetido a uma validação estrutural com resultados compartilhados em 19/11/2026. A estrutura apresentada após a remoção de `dt_entrega_prevista` tinha 35 colunas. Com a remoção adicional de `tb_entrega.vl_total`, a estrutura esperada passa a ter **34 colunas**. A contagem final deve ser confirmada com o script de validação incluído neste repositório.

A estrutura completa de criação (`CREATE TABLE`) ainda não foi extraída para todas as seis tabelas. Por isso, este repositório documenta a estrutura validada e não apresenta um script de recriação integral que possa divergir do banco real.

## 8. Próximas evoluções

1. Confirmar a estrutura final após a remoção de `vl_total`.
2. Resolver as pendências de modelagem listadas na documentação.
3. Definir e documentar a carga/rotina operacional sem ampliar o modelo desnecessariamente.
4. Projetar separadamente a camada analítica em Star Schema.
5. Criar fatos e dimensões de BI somente após validar as necessidades de análise.

## 9. Como contribuir

Este é um projeto de estudo e documentação. Antes de alterar o modelo:

1. Consulte as regras de negócio.
2. Verifique se a alteração representa uma necessidade real do sítio.
3. Atualize o dicionário de dados e o histórico.
4. Execute o script de validação.
5. Registre as alterações no Git.

---
**Projeto LEITE — documentação técnica.**  
**Versão documental:** 2.4 (pacote de documentação para GitHub)  
**Última revisão:** 19/11/2026
