# Esta função utiliza uma list comprehension para iterar sobre a lista de funcionários. Verifica se o valor do campo cargo no dicionário do funcionário é igual ao cargo especificado no filtro. Retorna uma lista contendo apenas os valores do campo nome dos funcionários que atendem ao critério.

def filtrar_funcionarios(funcionarios, cargo):
    # TO DO: Filtre os funcionários pelo cargo especificado
  return [funcionario['nome'] for funcionario in funcionarios if funcionario['cargo'] == cargo]


# Função para entrada do usuário
def main_filtro():
    n = int(input())
    funcionarios = []

    for _ in range(n):
        id_funcionario = int(input()) # Lê o ID do funcionário
        nome = input() # Lê o nome do funcionário
        cargo = input() # Lê o cargo do funcionário
        funcionarios.append({"id": id_funcionario, "nome": nome, "cargo": cargo})

    cargo_filtro = input()
    resultado = filtrar_funcionarios(funcionarios, cargo_filtro)
    
    print(resultado)

# Executando a função
main_filtro()

# este é um simulador de consulta SQL