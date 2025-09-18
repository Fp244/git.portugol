/**desenvolva uma função recursiva que calcule o fatorial de um número inteiro n, onde o
 * fatorial de n (representado por n!) é definido como n* (n-1) * (n-2) * ... 1. */
 
programa {
  funcao inicio() {
    inteiro num
    escreva ("Digite um número para saber seu fatorial: ")
    leia (num)
    escreva ("O fatorial desse número é: ", fatorial (num))
  }
  funcao inteiro fatorial (inteiro n) {
    se (n == 0) {
      retorne 1
    } senao {
      retorne n * fatorial (n-1)
    }
  }
}
