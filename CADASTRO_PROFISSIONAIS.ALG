Algoritmo "cadastro_profissionais"

Var
   profissionalId : vetor[1..50] de inteiro
   profissionalNome : vetor[1..50] de caractere
   profissionalTurno1 : vetor[1..50] de inteiro
   profissionalTurno2 : vetor[1..50] de inteiro
   profissionalEspecialidade1 : vetor[1..50] de inteiro
   profissionalEspecialidade2 : vetor[1..50] de inteiro
   profissionalEspecialidade3 : vetor[1..50] de inteiro
   controle, i, respostaCadastro, respostaEspecialidade, respostaTurno : inteiro
   duplicado : logico

Inicio
   controle <- 0
   duplicado <- falso

   repita
      limpatela
      controle <- controle + 1

      repita
         escreval("Digite o ID numérico do funcionário:")
         leia(profissionalId[controle])
         duplicado <- falso

         para i de 1 ate controle - 1 faca
            se (profissionalId[controle] = profissionalId[i]) entao
               duplicado <- verdadeiro
               escreval("Esse ID já existe!! Digite outro ID.")
            fimse
         fimpara
      ate (duplicado = falso)
      limpatela

      escreval("Digite o nome do funcionário:")
      leia(profissionalNome[controle])
      limpatela

      escreval("Digite o número correspondente da 1ª especialidade:")
      escreval("1 - Clínico Geral")
      escreval("2 - Pediatra")
      escreval("3 - Cirurgião")
      leia(profissionalEspecialidade1[controle])
      limpatela

      escreval("Este funcionário possui uma 2ª especialidade?")
      escreval("1 - SIM")
      escreval("2 - NÃO")
      leia(respostaEspecialidade)

      se (respostaEspecialidade = 1) entao
         escreval("Digite o número da 2ª especialidade:")
         escreval("1 - Clínico Geral")
         escreval("2 - Pediatra")
         escreval("3 - Cirurgião")
         leia(profissionalEspecialidade2[controle])

         enquanto (profissionalEspecialidade2[controle] = profissionalEspecialidade1[controle]) faca
            escreval("Digite uma especialidade diferente (já cadastrada na 1ª):")
            leia(profissionalEspecialidade2[controle])
         fimenquanto
         limpatela

         escreval("Este funcionário possui uma 3ª especialidade?")
         escreval("1 - SIM")
         escreval("2 - NÃO")
         leia(respostaEspecialidade)

         se (respostaEspecialidade = 1) entao
            escreval("Digite o número da 3ª especialidade:")
            escreval("1 - Clínico Geral")
            escreval("2 - Pediatra")
            escreval("3 - Cirurgião")
            leia(profissionalEspecialidade3[controle])

            enquanto (profissionalEspecialidade3[controle] = profissionalEspecialidade2[controle]) ou (profissionalEspecialidade3[controle] = profissionalEspecialidade1[controle]) faca
               escreval("Digite uma especialidade diferente (já cadastrada):")
               leia(profissionalEspecialidade3[controle])
            fimenquanto
         fimse
      fimse
      limpatela

      escreval("Digite o turno do funcionário:")
      escreval("1 - MANHÃ")
      escreval("2 - TARDE")
      escreval("3 - NOITE")
      leia(profissionalTurno1[controle])

      escreval("Este funcionário trabalha em mais um turno?")
      escreval("1 - SIM")
      escreval("2 - NÃO")
      leia(respostaTurno)

      se (respostaTurno = 1) entao
         escreval("Digite o segundo turno do funcionário:")
         escreval("1 - MANHÃ")
         escreval("2 - TARDE")
         escreval("3 - NOITE")
         leia(profissionalTurno2[controle])

         enquanto (profissionalTurno2[controle] = profissionalTurno1[controle]) faca
            escreval("Este turno já foi selecionado!! Digite outro turno")
            leia(profissionalTurno2[controle])
         fimenquanto
      fimse

      escreval("Deseja Cadastrar mais um funcionário?")
      escreval("1 - SIM")
      escreval("2 - NÃO")
      leia(respostaCadastro)

   ate (respostaCadastro <> 1)
   limpatela

   escreval("=== RELATÓRIO DE FUNCIONÁRIOS ===")
   para i de 1 ate controle faca
      escreval()
      escreval("Profissional: ", i)
      escreval("ID: ", profissionalId[i])
      escreval("Nome: ", profissionalNome[i])

      escreva("Especialidade(s): ", profissionalEspecialidade1[i])
      se (profissionalEspecialidade2[i] > 0) entao
         escreva(", ", profissionalEspecialidade2[i])
      fimse
      se (profissionalEspecialidade3[i] > 0) entao
         escreva(", ", profissionalEspecialidade3[i])
      fimse
      escreval()

      escreva("Turno(s): ", profissionalTurno1[i])
      se (profissionalTurno2[i] > 0) entao
         escreva(", ", profissionalTurno2[i])
      fimse
      escreval()

      escreval("--------------------------------")
   fimpara
Fimalgoritmo