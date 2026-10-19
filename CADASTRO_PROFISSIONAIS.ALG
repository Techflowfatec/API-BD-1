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
   profissionalPlantoesDia : vetor[1..50] de inteiro
   turnoEscalado1 : vetor[1..50] de inteiro
   turnoEscalado2 : vetor[1..50] de inteiro
   idEscalar, turnoDesejado, posMedico, opcaoEscala : inteiro
   medicoEncontrado : logico


Inicio
   controle <- 0
   duplicado <- falso

   repita
      limpatela
      controle <- controle + 1

      repita
         escreval("Digite o ID num?rico do funcion?rio:")
         leia(profissionalId[controle])
         duplicado <- falso

         para i de 1 ate controle - 1 faca
            se (profissionalId[controle] = profissionalId[i]) entao
               duplicado <- verdadeiro
               escreval("Esse ID j? existe!! Digite outro ID.")
            fimse
         fimpara
      ate (duplicado = falso)
      limpatela

      escreval("Digite o nome do funcion?rio:")
      leia(profissionalNome[controle])
      limpatela

      escreval("Digite o n?mero correspondente da 1? especialidade:")
      escreval("1 - Cl?nico Geral")
      escreval("2 - Pediatra")
      escreval("3 - Cirurgi?o")
      leia(profissionalEspecialidade1[controle])
      limpatela

      escreval("Este funcion?rio possui uma 2? especialidade?")
      escreval("1 - SIM")
      escreval("2 - N?O")
      leia(respostaEspecialidade)

      se (respostaEspecialidade = 1) entao
         escreval("Digite o n?mero da 2? especialidade:")
         escreval("1 - Cl?nico Geral")
         escreval("2 - Pediatra")
         escreval("3 - Cirurgi?o")
         leia(profissionalEspecialidade2[controle])

         enquanto (profissionalEspecialidade2[controle] = profissionalEspecialidade1[controle]) faca
            escreval("Digite uma especialidade diferente (j? cadastrada na 1?):")
            leia(profissionalEspecialidade2[controle])
         fimenquanto
         limpatela

         escreval("Este funcion?rio possui uma 3? especialidade?")
         escreval("1 - SIM")
         escreval("2 - N?O")
         leia(respostaEspecialidade)

         se (respostaEspecialidade = 1) entao
            escreval("Digite o n?mero da 3? especialidade:")
            escreval("1 - Cl?nico Geral")
            escreval("2 - Pediatra")
            escreval("3 - Cirurgi?o")
            leia(profissionalEspecialidade3[controle])

            enquanto (profissionalEspecialidade3[controle] = profissionalEspecialidade2[controle]) ou (profissionalEspecialidade3[controle] = profissionalEspecialidade1[controle]) faca
               escreval("Digite uma especialidade diferente (j? cadastrada):")
               leia(profissionalEspecialidade3[controle])
            fimenquanto
         fimse
      fimse
      limpatela

      escreval("Digite o turno do funcion?rio:")
      escreval("1 - MANH?")
      escreval("2 - TARDE")
      escreval("3 - NOITE")
      leia(profissionalTurno1[controle])

      escreval("Este funcion?rio trabalha em mais um turno?")
      escreval("1 - SIM")
      escreval("2 - N?O")
      leia(respostaTurno)

      se (respostaTurno = 1) entao
         escreval("Digite o segundo turno do funcion?rio:")
         escreval("1 - MANH?")
         escreval("2 - TARDE")
         escreval("3 - NOITE")
         leia(profissionalTurno2[controle])

         enquanto (profissionalTurno2[controle] = profissionalTurno1[controle]) faca
            escreval("Este turno j? foi selecionado!! Digite outro turno")
            leia(profissionalTurno2[controle])
         fimenquanto
      fimse

      escreval("Deseja Cadastrar mais um funcion?rio?")
      escreval("1 - SIM")
      escreval("2 - N?O")
      leia(respostaCadastro)

   ate (respostaCadastro <> 1)
   limpatela

   escreval("=== RELAT?RIO DE FUNCION?RIOS ===")
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

   para i de 1 ate controle faca
      profissionalPlantoesDia[i] <- 0
      turnoEscalado1[i] <- 0
      turnoEscalado2[i] <- 0
   fimpara

   repita
      escreval()
      escreval("=== ESCALAÇÃO DE PLANTÃO DE MÉDICOS ===")
      escreval("1 - Escalar Médico em um Turno")
      escreval("2 - Ver Resumo de Plantões do Dia")
      escreval("3 - Finalizar Escalação")
      escreva("Opção: ")
      leia(opcaoEscala)
      limpatela

      se (opcaoEscala = 1) entao
         escreval("--- ATRIBUIR MÉDICO AO TURNO ---")
         escreva("Digite o ID do médico a ser escalado: ")
         leia(idEscalar)

         posMedico <- 0
         medicoEncontrado <- falso

         para i de 1 ate controle faca
            se (profissionalId[i] = idEscalar) entao
               posMedico <- i
               medicoEncontrado <- verdadeiro
            fimse
         fimpara

         se (nao medicoEncontrado) entao
            escreval("[ERRO] ID do médico não foi encontrado no cadastro!")
         senao

            se (profissionalPlantoesDia[posMedico] >= 2) entao
               escreval("-------------------------------------------------------------------")
               escreval("O médico ", profissionalNome[posMedico], " (ID: ", idEscalar,)
               escreval("já atingiu o limite MÁXIMO de 2 plantões no mesmo dia!")
               escreval("A escalação NÃO foi realizada.")
               escreval("-------------------------------------------------------------------")
            senao
               escreval("Médico encontrado: ", profissionalNome[posMedico])
               escreval("Plantões atribuídos hoje até agora: ", profissionalPlantoesDia[posMedico], "/2")
               escreval()
               escreval("Selecione o Turno para escalar:")
               escreval("1 - MANHÃ")
               escreval("2 - TARDE")
               escreval("3 - NOITE")
               escreva("Opção: ")
               leia(turnoDesejado)

               se (turnoDesejado <> profissionalTurno1[posMedico]) e (turnoDesejado <> profissionalTurno2[posMedico]) entao
                  escreval("-------------------------------------------------------------------")
                  escreval("O médico não tem disponibilidade registrada")
                  escreval("para trabalhar neste turno! A escalação foi cancelada.")
                  escreval("-------------------------------------------------------------------")
               senao
                  se (profissionalPlantoesDia[posMedico] = 1) e (turnoDesejado = turnoEscalado1[posMedico]) entao
                     escreval("-------------------------------------------------------------------")
                     escreval("O médico ", profissionalNome[posMedico])
                     escreval("já está escalado no turno ", turnoDesejado, " no dia de hoje!")
                     escreval("Não é permitido ocupar dois postos no mesmo turno.")
                     escreval("-------------------------------------------------------------------")
                  senao
                     profissionalPlantoesDia[posMedico] <- profissionalPlantoesDia[posMedico] + 1

                     se (profissionalPlantoesDia[posMedico] = 1) entao
                        turnoEscalado1[posMedico] <- turnoDesejado
                     senao
                        turnoEscalado2[posMedico] <- turnoDesejado
                     fimse

                     escreval("-------------------------------------------------------------------")
                     escreval("[SUCESSO] Médico ", profissionalNome[posMedico], " escalado com sucesso!")
                     escreval("Nova quantidade de plantões do médico no dia: ", profissionalPlantoesDia[posMedico], "/2")
                     escreval("-------------------------------------------------------------------")
                  fimse
               fimse
            fimse
         fimse

      senao se (opcaoEscala = 2) entao
         escreval("=== RESUMO DE PLANTÕES ATRIBUÍDOS NO DIA ===")
         para i de 1 ate controle faca
            escreval("ID: ", profissionalId[i], " | Nome: ", profissionalNome[i], " | Plantões no Dia: ", profissionalPlantoesDia[i], "/2")
         fimpara
   fimse

ate (opcaoEscala = 3)

Fimalgoritmo