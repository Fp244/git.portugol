programa {
  funcao inteiro contarDigitos (inteiro num) {
    se (num < 11) {
      retorne 1
    } senao {
      retorne 1 + contarDigitos (num/10)
  }
  }
  funcao inicio() { 
    inteiro numero 
    escreva ("Digite um número para saber quantos digitos ele tem: ")
    leia (numero)
    escreva ("o número tem ", contarDigitos( numero ), " digitos! ")
    
    }
    
  }
}
}