def valor_acumulado_vendas(vendas_mensais):
    acumulado = 0  # Inicializa o acumulado como zero
    vendas_acumuladas = []  # Lista para armazenar os resultados acumulados
    
    # Calcula o valor acumulado mês a mês
    for venda in vendas_mensais:
        acumulado += venda["valor_venda"]
        vendas_acumuladas.append(f"{venda['mes']}: {acumulado:.1f}")
    
    # Retorna a lista de vendas acumuladas
    return vendas_acumuladas


# Lista para armazenar os dados de vendas
vendas_mensais = []

# Entrada do número de meses
n = int(input())

# Entrada dos dados de cada mês e valor de vendas
for i in range(n):
    mes = input()
    valor_venda = float(input())
    vendas_mensais.append({"mes": mes, "valor_venda": valor_venda})

# Chama a função para calcular o valor acumulado de vendas
resultados_acumulados = valor_acumulado_vendas(vendas_mensais)

# Imprime os resultados
for resultado in resultados_acumulados:
    print(resultado)
