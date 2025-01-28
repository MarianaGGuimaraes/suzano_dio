# Descrição

Você deverá calcular o crescimento percentual entre dois meses consecutivos de vendas, um conceito essencial em análises financeiras. Esse cálculo permite visualizar a evolução das vendas ao longo do tempo. Para isso, você deverá comparar o valor total de vendas de dois meses consecutivos e determinar a variação percentual.

Para calcular o crescimento, subtraia o valor de vendas do mês anterior do valor de vendas do mês atual, depois divida essa diferença pelo valor de vendas do mês anterior e multiplique por 100 para obter a porcentagem de crescimento.

Entrada
Dois pares de entradas, cada um contendo o nome de um mês e o valor total de vendas desse mês (um número decimal).

Saída
O percentual de crescimento de vendas, com duas casas decimais.

Exemplos
A tabela abaixo apresenta exemplos com alguns dados de entrada e suas respectivas saídas esperadas. Certifique-se de testar seu programa com esses exemplos e com outros casos possíveis.

| Entrada	|Saída |
| ----------|------|
| Janeiro
| 5000
| Fevereiro
| 6000	    |Crescimento percentual de vendas: 20.00% |
|Março
| 8000
| Abril
| 10000	| Crescimento percentual de vendas: 25.00%|
| Maio
| 7000
| Junho
| 8400	| Crescimento percentual de vendas: 20.00%|

Atenção: É extremamente importante que as entradas e saídas sejam exatamente iguais às descritas na descrição do desafio de código.

# Descrição

Neste desafio, você irá acumular os valores de venda ao longo dos meses, somando cada valor ao total anterior. Esse cálculo é essencial em relatórios de vendas, pois permite visualizar a tendência de crescimento ao longo do tempo. Imagine que você trabalha em uma equipe de vendas e precisa apresentar um relatório mensal; o total acumulado mostra não apenas quanto foi vendido em cada mês, mas também o desempenho geral da equipe.

Em um ambiente DAX (Data Analysis Expressions), utilizado em ferramentas como Power BI e Excel, funções como CALCULATE e FILTER são aplicadas para calcular o total acumulado de vendas. Ao simular esse cálculo em Python, você entenderá como essas operações são realizadas em uma plataforma de análise de dados.

Entrada
A entrada consiste em:

Um número inteiro n (1 ≤ n ≤ 12), representando a quantidade de meses.
Em seguida, serão fornecidos n pares de entradas, onde cada par consiste em:
Um string representando o nome do mês (por exemplo, "Janeiro", "Fevereiro", etc.).
Um número decimal representando o valor total de vendas desse mês (por exemplo, 5000.0).
Saída
A saída deve ser uma lista de strings, onde cada string corresponde a um mês e seu respectivo total acumulado de vendas.

Exemplos
A tabela abaixo apresenta exemplos com alguns dados de entrada e suas respectivas saídas esperadas. Certifique-se de testar seu programa com esses exemplos e com outros casos possíveis.

| Entrada	|Saída|
|----------|---------|
|3      
|Janeiro
|5000
|Fevereiro
|11000
|Março
|18000	|Janeiro: 5000.0   
|        |Fevereiro: 16000.0
|        |Março: 34000.0
|3
|Abril
|1500
|Maio
|2500
|Junho
|3500	| Abril: 1500.0
|       |Maio: 4000.0
|       |Junho: 7500.0
|3
|Julho
|1000
|Agosto
|3000
|Setembro|
|500	|Julho: 1000.0
|       |Agosto: 4000.0
|       |Setembro: 4500.0

Atenção: É extremamente importante que as entradas e saídas sejam exatamente iguais às descritas na descrição do desafio de código.