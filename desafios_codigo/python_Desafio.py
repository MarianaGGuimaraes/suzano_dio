''' Para ler e escrever dados em Python utiliza-se as seguinte funções:
- input: lê uma linha com dado(s) de entrada do usuário
- print: imprime um texto de saída, pulando linha 
'''

# função útil para o cálculo do imposto (baseado nas alíquotas)
def calcular_imposto(salario):
    aliquota = 0.00
    if (salario >= 0 and salario <= 1100):
        aliquota = 0.05
# TO DO criar as demais condições para as alíquotas de 10 e 15%
    elif (salario >= 1100.01 and salario <= 2500.00):
        aliquota = 0.10
    else:  
        aliquota = 0.15
    
    return aliquota * salario
    
# lê os valores de entrada:
valor_salario = float(input())
valor_beneficios = float(input())

# calcula o imposto através da função 'calcular_imposto"
valor_imposto = calcular_imposto(valor_salario)
# calcula e imprime a saída com 2 casas decimais
saida = valor_salario - valor_imposto + valor_beneficios
print(f'{saida: .2f}')