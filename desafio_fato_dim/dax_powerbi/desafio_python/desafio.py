# Função crescimento_percentual: A função recebe uma lista de dicionários contendo as informações de vendas. 
# Ela extrai o valor de vendas de dois meses consecutivos, calcula a variação percentual 
# e retorna o valor arredondado para duas casas decimais.

def crescimento_percentual(vendas_mensais):
    # Extraímos os valores de venda de dois meses consecutivos
    vendas_mes_anterior = vendas_mensais[0]['valor_venda']
    vendas_mes_atual = vendas_mensais[1]['valor_venda']
    
    # Calculamos o crescimento percentual
    crescimento = ((vendas_mes_atual - vendas_mes_anterior) / vendas_mes_anterior) * 100
    return round(crescimento, 2)

# Lista para armazenar os dados de vendas
vendas_mensais = []

#Entrada de dados: O programa solicita a entrada de dois pares de valores (nome do mês e valor de venda).
# Entrada dos dados dos meses e vendas
for i in range(2):
    mes = input()
    valor_venda = float(input())
    vendas_mensais.append({"mes": mes, "valor_venda": valor_venda})

# Cálculo do crescimento percentual: A função é chamada e o resultado é impresso no formato solicitado, com duas casas decimais.

# Chama a função para calcular o crescimento percentual
resultado = crescimento_percentual(vendas_mensais)

# Imprime o resultado com duas casas decimais
print(f"Crescimento percentual de vendas: {resultado:.2f}%")
