programa {
  const inteiro MAX_USUARIOS = 5

  cadeia usuarios[MAX_USUARIOS][2]
  real saldos[MAX_USUARIOS]  
  inteiro totalUsuarios = 0
  logico logado = falso
  cadeia usuarioAtual = ""

  funcao cadastrarUsuarios() {
    se (totalUsuarios >= MAX_USUARIOS){
      escreva("Limite de usuários atingido!\n")
    } senao {
      escreva("Digite seu nome de usuário: \n")
      leia(usuarios[totalUsuarios][0])
      escreva("Digite sua senha: \n")
      leia(usuarios[totalUsuarios][1])
      saldos[totalUsuarios] = 0  
      totalUsuarios = totalUsuarios + 1
      escreva("Usuário cadastrado com sucesso!\n")
    }
  }

  funcao logico login() {
    cadeia nome, senha
    para (inteiro tentativas = 1; tentativas <= 3; tentativas++) {
      escreva("Digite seu nome de usuário: ")
      leia(nome)
      escreva("Digite a senha: ")
      leia(senha)

      para (inteiro i = 0; i < totalUsuarios; i++) {
        se (usuarios[i][0] == nome e usuarios[i][1] == senha) {
          usuarioAtual = nome
          logado = verdadeiro
          escreva("Login efetuado com sucesso!\n")
          retorne verdadeiro
        }
      }

      se (tentativas < 3) {
        escreva("Usuário ou senha incorretos.\n")
        se (tentativas == 2) {
          escreva("Atenção!! Resta apenas uma tentativa!!\n")
        }
      }
    }

    escreva("Número máximo de tentativas atingido. Encerrando login.\n")
    retorne falso
  }

  funcao inteiro encontrarIndiceUsuario(cadeia nome) {
    para (inteiro i = 0; i < totalUsuarios; i++) {
      se (usuarios[i][0] == nome) {
        retorne i
      }
    }
    retorne -1
  }

  funcao real deposito() {
    inteiro indice = encontrarIndiceUsuario(usuarioAtual)
    se (indice == -1) {
      escreva("Erro: usuário não encontrado.\n")
      retorne 0
    }

    real valor
    escreva("Digite o valor para depósito: R$ ")
    leia(valor)
    se (valor > 0) {
      saldos[indice] = saldos[indice] + valor
      escreva("Depósito realizado com sucesso!\n")
    } senao {
      escreva("Valor inválido.\n")
    }

    retorne saldos[indice]
  }

  funcao real saque() {
    inteiro indice = encontrarIndiceUsuario(usuarioAtual)
    se (indice == -1) {
      escreva("Erro: usuário não encontrado.\n")
      retorne 0
    }

    real valor
    escreva("Digite o valor para saque: R$ ")
    leia(valor)
    se (valor > 0 e valor <= saldos[indice]) {
      saldos[indice] = saldos[indice] - valor
      escreva("Saque realizado com sucesso!\n")
    } senao {
      escreva("Saque inválido. Verifique o valor.\n")
    }

    retorne saldos[indice]
  }

  funcao real exibirSaldo() {
    inteiro indice = encontrarIndiceUsuario(usuarioAtual)
    se (indice == -1) {
      escreva("Erro: usuário não encontrado.\n")
      retorne 0
    }

    escreva("Seu saldo atual é: R$ ", saldos[indice], "\n")
    retorne saldos[indice]
  }

  funcao menuSistema() {
    inteiro opcao

    faca {
      escreva("\nMenu do Sistema:\n")
      escreva("1 - Depósito\n")
      escreva("2 - Saque\n")
      escreva("3 - Exibir Saldo\n")
      escreva("4 - Sair\n")
      escreva("Escolha uma opção: ")
      leia(opcao)

      escolha (opcao) {
        caso 1:
          deposito()
          pare
        caso 2:
          saque()
          pare
        caso 3:
          exibirSaldo()
          pare
        caso 4:
          escreva("Saindo do sistema...\n")
          logado = falso
          pare
        caso contrario:
          escreva("Opção inválida. Tente novamente.\n")
      }
    } enquanto (logado)
  }

  funcao inicio() {
    inteiro opcao
    faca {
      escreva("\n=== Bem-vindo ao sistema bancário ===\n")
      escreva("1 - Cadastrar usuário\n")
      escreva("2 - Fazer login\n")
      escreva("3 - Sair\n")
      escreva("Escolha uma opção: ")
      leia(opcao)

      escolha (opcao) {
        caso 1:
          cadastrarUsuarios()
          pare
        caso 2:
          se (login()) {
            menuSistema()
          }
          pare
        caso 3:
          escreva("Encerrando o programa.\n")
          pare
        caso contrario:
          escreva("Opção inválida.\n")
      }
    } enquanto (opcao != 3)
  }
}
