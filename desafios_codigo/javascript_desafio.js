// Desafios js na DIO têm funções 'gets' e 'print' acessíveis globalmente;
// - 'gets': lê uma linha com dado(s) de entrada do usuário;
// - print : imprime um texto de saída, pulando linha
// essas duas funções acima não são nativas do js, mas estão disponíveis na DIO

//Lê valores de entrada. Const se o valor não vai mudar ao longo do tempo e let quando é variável 
const valorSalario = parseFloat(gets());
const valorBeneficios = parseFloat(gets());

// Calcula o imposto através da função 'calcularImposto'
const valorImposto = calcularImposto(valorSalario);
//Calcula e imprime a saída com 2 casas decimais
const saida = valorSalario - valorImposto + valorBeneficios;
print(saida.toFixed(2));

// Função útil para o cálculo do imposto (baseado nas alíquotas). A funçãod efine um escopo próprio,ela não enxerga o que está em cima dela. Aqui atribui-se um valor para aliquota ao invés de valorImposto
function calcularImposto(salario) {
    let aliquota;
    if (salario >= 0 && salario <= 1100){
        aliquota = 0.05;
    }
    // TO DO - CRIAR AS DEMAIS CONDIÇÕES PAR AAS ALIQUOTAS DE 10% E 15%
    else if (salario >= 1100.01 && salario <= 2500.00) {
        aliquota = 0.10;
    }
// js não utiliza o F de ponto flutuante como em c# e java
    else  { 
        aliquota = 0.15;
     }

    return aliquota * salario;
}