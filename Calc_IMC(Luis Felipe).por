/*Crie uma função que receba o peso e a altura de uma pessoa e retorne o valor do IMC (fórmula: IMC = peso / (altura * altura)). */

programa {
  funcao real calcularIMC (real peso, real altura) {
    retorne peso / (altura * altura)
  }
  funcao cadeia classificarIMC (real imc, caracter genero) {
    se (genero == 'F' ou genero == 'f') 
    se (imc < 19) {
      retorne "Abaixo do peso"
    se (imc <= 23.9)
      retorne "Peso normal"
    se (imc <= 28.9)
      retorne "Obesidade leve"
    se ( imc <= 38.9)
      retorne "Obesidade moderada"
    se (imc <= 39) 
      retorne "Obesidade mórbida"      
    senao se (genero == 'M' ou genero == 'm') {
      se (imc < 20) 
      retorne "Abaixo do peso"
      se ( imc <= 24.9) 
      retorne "Normal" 
      se ( imc <= 29.9) 
      retorne "Obesidade leve" 
      se ( imc <= 39.9) 
      retorne "Obesidade moderada" 
      senao retorne "Obesidade morbida"
    }
    }
  } 
  funcao inicio() {
    real peso, altura, imc
    caracter genero
    cadeia classificacao
    escreva ("Digite seu peso em Kg: ")
    leia (peso)
    escreva ("Digite sua altura em metros: ")
    leia (altura) 
    escreva ("Digite seu gênero (M/F): ")
    leia (genero)
    imc = calcularIMC (peso, altura)
    classificacao = classificarIMC (imc, genero)
    escreva ("Seu IMC é: ", imc, "e sua classificação é: ", classificacao )
  }
}
