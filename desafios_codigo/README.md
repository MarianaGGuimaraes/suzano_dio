## COMO RESOLVER DESAFIOS DE CÓDIGO
#### Essa pasta faz parte do módulo xxxxxx onde é ensinado como resolver diversos desafios em linguagens distintas. São 5 desafios realizados em 5 linguagens sendo a primeira linguagem trabalhada ==Java== seguido por ==JavaScript==, ==C#==, ==Python== e ==Kotlin==. O enunciado do desafio é o mesmo para todas as linguagens.

#### DESAFIO: 
Faça um programa que calcule e imprima o salário a ser transferido para um funcionário. Para realizar o cálculo receba o valor bruto do salário e o adicional dos benefícios. O salário a ser transferido é calculado da seguinte maneira:

    (valor bruto do salario - percentual de imposto mediante ao salário) + adicional dos benefícios.

Para calcular o **percentual de imposto** segue as alíquotas:
    
    De R$ 0.00 a R$ 1100.00 = 5.00%  
    De R$ 1100.01 a R$ 2500.00 = 10.00%
    Maior que R$ 2500.00 = 15.00%

#### Entrada
A entrada consiste em vários arquivos de teste que conterá o **valor bruto do salário** e **adicional dos benefícios**. Conforme mostrado no exemplo de entrada a seguir.

| Entrada  | Saída      |
|----------|------------|
| 2000    | 2050.00     |
| 250     |             |

#### Saída
Para cada arquivo da entrada terá um arquivo de saída. Será gerada uma linha com um número que será a diferença entre o valor bruto do salário e o percentual do imposto mediante a faixa salarial somado com o adicional dos benefícios. 

#### DESAFIO 2:
Neste desafio, você vai simular a operação de uma consulta que filtra funcionários por cargo, semelhante ao comportamento de uma consulta SQL com a cláusula WHERE. O objetivo é filtrar uma lista de funcionários pelo cargo especificado e retornar os nomes daqueles que ocupam o cargo desejado.

Embora o SQL seja uma linguagem utilizada para consultas em bancos de dados, aqui estamos simulando uma operação similar em Python, filtrando uma lista de dicionários que contém as informações dos funcionários.

#### Entrada
Você receberá:
Um número inteiro n representando o número de funcionários.
Uma lista de dicionários, onde cada dicionário contém três chaves:
id: o identificador único do funcionário,
nome: o nome do funcionário,
cargo: o cargo ocupado pelo funcionário.
Uma string representando o cargo que você deseja filtrar.

#### Saída
Uma lista com os nomes dos funcionários que ocupam o cargo especificado.

Exemplos
A tabela abaixo apresenta exemplos com alguns dados de entrada e suas respectivas saídas esperadas. Certifique-se de testar seu programa com esses exemplos e com outros casos possíveis.

| Entrada                  | Saída      |
|--------------------------|------------|
|3                         | ['Ana', 'Maria']
|1
|Ana
|Desenvolvedora
|2
|Pedro
|Gerente
|3
|Maria
|Desenvolvedora
|Desenvolvedora    |    |


Atenção: É extremamente importante que as entradas e saídas sejam exatamente iguais às descritas na descrição do desafio de código.

Os desafios apresentados aqui têm como objetivo principal exercitar os conceitos aprendidos e proporcionar um primeiro contato com lógica de programação. Caso não tenha experiência em programação, utilize o template disponível e preencha com os conceitos aprendidos. Para resetar o template, basta clicar em “Restart Code”.

#### DESAFIO 3:

Neste desafio, você será responsável por implementar um simulador de cálculo de salários para uma lista de funcionários. Cada funcionário tem um nome, o número de horas trabalhadas e o valor que ele recebe por hora. Sua tarefa é calcular o salário de cada funcionário multiplicando as horas trabalhadas pelo valor da hora.

Você receberá primeiro um número que indica a quantidade de funcionários, seguido por uma lista de dicionários contendo as informações de cada funcionário. A função deve retornar uma lista de strings, onde cada string apresenta o nome do funcionário seguido do seu salário calculado.

#### Entrada
A entrada será composta por:

Um número inteiro n que representa a quantidade de funcionários.
Uma lista de n dicionários. Cada dicionário conterá três chaves:
"nome": uma string representando o nome do funcionário.
"horas_trabalhadas": um número inteiro representando as horas que o funcionário trabalhou.
"valor_hora": um número decimal representando o valor pago por hora trabalhada.

#### Saída
A saída deverá ser uma lista de strings. Cada string deverá seguir o formato:

"Nome: Salário", onde:
Nome é o nome do funcionário.
Salário é o resultado do cálculo das horas trabalhadas multiplicadas pelo valor por hora, formatado com duas casas decimais.
Exemplos
A tabela abaixo apresenta exemplos com alguns dados de entrada e suas respectivas saídas esperadas. Certifique-se de testar seu programa com esses exemplos e com outros casos possíveis.

| Entrada                  | Saída                  |
|--------------------------|------------            |
|2                         |Ana: 1000.0 Pedro: 1050.0
|Ana                       |
|40                        |
|25                        |
|Pedro                     |
|35                        |
|30                        |                           |
|
|1                         |Maria: 900.0
|Maria                     |
|45                        |
|20                        |
|
|3                         |João: 450.0 Luiza: 450.0 Carlos: 440.0
|João
|30
|15
|Luiza
|25
|18
|Carlos
|20
|22