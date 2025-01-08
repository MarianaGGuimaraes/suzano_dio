// Para ler e escrever dados em C# usa-se os seguintes métodos da classe Console:
// - Console.ReadLine: lÊ UMA linha com dados(s) de entrada do usuário;
// - Console.WriteLine: imprime um texto de saída (output) pulando uma linha.


using System;

public class Desafio {

    public static void main() {
        //lê valores de entrada
        float valorSalario = float.Parse(Console.ReadLine());
        float valorBeneficios = float.Parse(Console.ReadLine());

        float valorImposto = 0;

        if (valorSalario >= 0 && valorSalario <= 1100) {
            //Atribiu a alíquota de 5% mediante o salário
            valorImposto = 0.05F * valorSalario;
        }

        //TO DO Criar as demais condições para as alíquotas de 10% e 15%
        else if (valorSalario >= 1100.01 && valorSalario <= 2500) {
           
            valorImposto = 0.10F * valorSalario;
        }

        else  
         { valorImposto = 0.15F * valorSalario;
            }

        //Calcula e imprime a saída (com 2 casas decimais)
        float saida = valorSalario - valorImposto + valorBeneficios;
       Console.WriteLine(saida.ToString("0.00"));
    }
}