# simulador de cálculo de salários para uma lista de funcionários.

def calcular_salarios(funcionarios):
    # TO DO: Calcule os salários com base nas horas trabalhadas e no valor por hora:
    salarios = [] # aqui salarios inicializa a lista que vai armazenar os resultados

    for funcionario in funcionarios:
      salario = funcionario['horas_trabalhadas'] * funcionario ['valor_hora']  # aqui salario é um float que representa o salário individual do funcionário
      salarios.append(f"{funcionario['nome']}: {salario:.1f}")  # Adiciona à lista; Saída do valor é com apenas 1 casa decimal (1F)

    #TO DO: Retorne 'salarios':
    return salarios

# Função para entrada do usuário
def main_salario():
    n = int(input())
    funcionarios = []

    for _ in range(n):
        nome = input()
        horas_trabalhadas = int(input())
        valor_hora = float(input())
        
        # TO DO: Adicione um dicionário com as informações do funcionário à lista 'funcionarios'.
        funcionarios.append({
          "nome": nome,
          "horas_trabalhadas": horas_trabalhadas,
          "valor_hora": valor_hora
        })

    resultado = calcular_salarios(funcionarios)
    
    for salario in resultado:
        print(salario)

# Executando a função
main_salario()


