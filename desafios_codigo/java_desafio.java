// Para ler e escrever dados em java usa-se esse padrão na DIO:
// - new Scanner(System.in): cria um leitor de entradas com métodos úteis com prefixo 'next'
// - System.out.println: imprime um texto de saída (output) pulando uma linha.

import java.util.Scanner;

public class Desafio {
    public static void main(String[] args) {
        Scanner leitorDeEntradas - new Scanner(System.in);
        float valorSalario = leitorDeEntradas.nextFloat();
        float valorBeneficios = leitorDeEntradas.nextFloat();

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
        System.out.println(String.format("%2.f", saída));
    }
}