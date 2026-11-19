# Projeto LEITE — Storytelling

## 1. A propriedade e sua rotina

O sítio LEITE é uma pequena propriedade rural que produz e distribui leite diretamente aos consumidores. A operação é conduzida por uma única pessoa, responsável pelas atividades do dia a dia, incluindo o cuidado com os animais, a ordenha, a preparação do leite, o transporte, as entregas e a administração.

A propriedade possui seis vacas leiteiras e dois cavalos. Cada vaca produz, em média, seis litros de leite por dia. A produção média estimada do conjunto é, portanto, de 36 litros diários.

## 2. Da ordenha à distribuição

A ordenha acontece uma vez ao dia e começa às 04h. O tempo informado é de aproximadamente 30 minutos por vaca, o que representa cerca de três horas para as seis vacas, considerando a execução sequencial.

Após a ordenha, o leite é fracionado em garrafas de um litro. As garrafas são acondicionadas em caixas com capacidade para 24 unidades. As garrafas são entregues aos clientes e as caixas retornam ao sítio.

A distribuição é feita por uma carroça puxada por dois cavalos. A rota e a sequência de atendimento são fixas. O percurso de entregas dura aproximadamente duas horas, e o retorno ao sítio leva cerca de uma hora.

**Nota operacional:** as informações sobre acondicionamento e distribuição descrevem a prática relatada. Este documento não atesta conformidade sanitária, temperatura adequada ou segurança do produto. Higiene, conservação, transporte e requisitos sanitários devem ser avaliados com orientação técnica e conforme a regulamentação aplicável.

## 3. Clientes, pedidos e recebimentos

O sítio atende mais de 30 clientes, todos pessoas físicas. Os pedidos são recebidos no dia anterior à entrega e as quantidades variam diariamente.

O preço por litro informado é único para todos os clientes. As vendas são realizadas a prazo, informalmente descritas como “fiado”. Não há vencimento fixo e não são aceitos pagamentos parciais: o pagamento é integral.

O banco atual registra o pedido/entrega, o preço por litro e os indicadores de pagamento. A estrutura financeira é intencionalmente simples e ainda possui limitações para representar quitações que agrupem várias entregas.

## 4. Alimentação e materiais

As vacas recebem pasto e ração duas vezes ao dia. O consumo informado é de dois quilos de ração por vaca/dia, totalizando 12 kg/dia para as seis vacas.

Os dois cavalos também recebem pasto e ração duas vezes ao dia. O consumo informado é de três quilos por cavalo/dia, totalizando 6 kg/dia.

O consumo total estimado é de 18 kg de ração por dia, ou aproximadamente 540 kg em 30 dias. As rações são diferentes para vacas e cavalos, adquiridas em sacos de 25 kg. A ração fica em um galpão junto com outros materiais, e a reposição ocorre quando o trabalhador percebe que está acabando.

O banco atual mantém cadastro de materiais, saldo e registro de compras, mas ainda não automatiza a atualização do saldo nem registra formalmente todas as saídas/consumos.

## 5. Oportunidade de organização

A proposta é organizar os registros essenciais sem transformar a rotina em um processo burocrático. O banco operacional atual concentra seis áreas: animais, clientes, compras, entregas, estoque de materiais e produção diária.

O projeto não controla estoque de leite. Também não inclui, neste momento, controle individual de alimentação, água, rota, fornecedores ou recipientes retornáveis.

## 6. Visão resumida do processo

| Momento | Atividade |
|---|---|
| 04h | Início da ordenha |
| Aproximadamente 07h | Término estimado da ordenha |
| Após a ordenha | Fracionamento em garrafas e acondicionamento nas caixas |
| Em seguida | Carregamento da carroça e início da rota fixa |
| Aproximadamente 2 horas | Duração informada das entregas |
| Aproximadamente 1 hora | Retorno ao sítio |

Os tempos são estimativas informadas e não representam a jornada completa do trabalhador.

## 7. Resultado pretendido

O objetivo é manter um histórico organizado da produção, clientes, pedidos/entregas e compras, com uma estrutura que possa evoluir para análises gerenciais.

A camada de BI será construída separadamente, usando modelagem dimensional (Star Schema). Ela não deve ser confundida com o banco operacional atual.
