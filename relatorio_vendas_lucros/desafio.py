def analisar_desempenho_funcionarios():
    # Entrada de dados
    registros = input()
    desempenho = []

    # Processamento dos dados
    for registro in registros.split(', '):
        nome, pontuacao = registro.split(': ')
        pontuacao = int(pontuacao)

        # Classificação de desempenho
        if pontuacao > 90:
            categoria = "Excelente"
        elif 75 <= pontuacao <= 90:
            categoria = "Bom"
        else:
            categoria = "Regular"

        # Adiciona à lista de desempenho
        desempenho.append(f"{nome}: {categoria}")

    # Exibe a saída
    for resultado in desempenho:
        print(resultado)

# Chamada da função
analisar_desempenho_funcionarios()


# Explicação:
#Recebe a entrada: Lê uma única linha contendo os registros no formato "Nome: Pontuação", separados por vírgula.
#Processa os dados: Divide cada registro, converte a pontuação para inteiro e classifica conforme os critérios fornecidos.
# Armazena os resultados: Cria uma lista de strings no formato "Nome: Categoria".
# Exibe a saída: Percorre a lista e imprime cada resultado em uma nova linha.