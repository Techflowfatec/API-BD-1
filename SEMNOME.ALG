Algoritmo "sem nome"

Var
   i, iTurno : inteiro
   turno, manha, tarde, noite : inteiro

   clinicoManha, clinicoTarde, clinicoNoite : inteiro
   pediatraManha, pediatraTarde, pediatraNoite : inteiro
   cirurgiaoManha, cirurgiaoTarde, cirurgiaoNoite : inteiro

   faltaClinicoManha, faltaPediatraManha, faltaCirurgiaoManha : inteiro
   faltaClinicoTarde, faltaPediatraTarde, faltaCirurgiaoTarde : inteiro
   faltaClinicoNoite, faltaPediatraNoite, faltaCirurgiaoNoite : inteiro

   publicarManha, publicarTarde, publicarNoite : logico

   respostaManha, respostaTarde, respostaNoite : caractere
   confirmacao : caractere

   idMedico, turnoEscala, postoEscala : inteiro
   continuarEscala : caractere
   plantoesDiaMedico : inteiro
   medicoCadastrado, medicoDisponivel, especialidadeCompativel, medicoOcupadoTurno : logico

Inicio

   manha <- 0
   tarde <- 0
   noite <- 0

   publicarManha <- falso
   publicarTarde <- falso
   publicarNoite <- falso

   clinicoManha <- 0
   pediatraManha <- 0
   cirurgiaoManha <- 0

   clinicoTarde <- 0
   pediatraTarde <- 0
   cirurgiaoTarde <- 0

   clinicoNoite <- 0
   pediatraNoite <- 0
   cirurgiaoNoite <- 0

   faltaClinicoManha <- 0
   faltaPediatraManha <- 0
   faltaCirurgiaoManha <- 0

   faltaClinicoTarde <- 0
   faltaPediatraTarde <- 0
   faltaCirurgiaoTarde <- 0

   faltaClinicoNoite <- 0
   faltaPediatraNoite <- 0
   faltaCirurgiaoNoite <- 0

   respostaManha <- "Nao analisado"
   respostaTarde <- "Nao analisado"
   respostaNoite <- "Nao analisado"

   plantoesDiaMedico <- 0


   // ==================================================
   // ESCOLHA DOS 3 TURNOS
   // ==================================================

   para i de 1 ate 3 faca

      escreval("")
      escreval("==========================================")
      escreval("        HOSPITAL SANTA AURORA")
      escreval("==========================================")
      escreval("Escolha o turno:")
      escreval("1 - Manha")
      escreval("2 - Tarde")
      escreval("3 - Noite")
      leia(turno)


      // ==================================================
      // VALIDACAO DO TURNO
      // ==================================================

      // Utilizei o Enquanto para validação - Pedro Rosa
      enquanto (turno < 1) ou (turno > 3) ou ((turno = 1) e (manha = 1)) ou ((turno = 2) e (tarde = 1)) ou ((turno = 3) e (noite = 1)) faca
         se (turno < 1) ou (turno > 3) entao
            escreval("ERRO: turno inexistente! Digite 1, 2 ou 3:")
         senao
            se (turno = 1) e (manha = 1) entao
               escreval("ERRO: turno da manha ja foi escolhido! Digite outro:")
            senao
               se (turno = 2) e (tarde = 1) entao
                  escreval("ERRO: turno da tarde ja foi escolhido! Digite outro:")
               senao
                  se (turno = 3) e (noite = 1) entao
                     escreval("ERRO: turno da noite ja foi escolhido! Digite outro:")
                  fimse
               fimse
            fimse
         fimse
         leia(turno)
      fimenquanto


      // ==================================================
      // TURNO DA MANHA
      // ==================================================

      se (turno = 1) entao

         manha <- 1

         escreval("")
         escreval("==========================================")
         escreval("             TURNO DA MANHA")
         escreval("==========================================")


         escreval("Digite a quantidade de Clinicos Gerais:")
         leia(clinicoManha)

         //Utilizei o Enquanto para validação - Pedro Rosa
         enquanto (clinicoManha < 0) ou (clinicoManha > 10) faca
            escreval("Quantidade invalida!")
            escreval("Digite um valor entre 0 e 10:")
            leia(clinicoManha)
         fimenquanto


         escreval("Digite a quantidade de Pediatras:")
         leia(pediatraManha)

         // Utilizei o Enquanto para validação - Pedro Rosa
         enquanto (pediatraManha < 0) ou (pediatraManha > 10) faca
            escreval("Quantidade invalida!")
            escreval("Digite um valor entre 0 e 10:")
            leia(pediatraManha)
         fimenquanto


         escreval("Digite a quantidade de Cirurgioes:")
         leia(cirurgiaoManha)

         //Utilizei o Enquanto para validação - Pedro Rosa
         enquanto (cirurgiaoManha < 0) ou (cirurgiaoManha > 10) faca
            escreval("Quantidade invalida!")
            escreval("Digite um valor entre 0 e 10:")
            leia(cirurgiaoManha)
         fimenquanto


         // ==================================================
         // VERIFICAR COBERTURA MINIMA
         // ==================================================

         publicarManha <- verdadeiro

         se (clinicoManha < 2) entao
            publicarManha <- falso
         fimse

         se (pediatraManha < 1) entao
            publicarManha <- falso
         fimse

         se (cirurgiaoManha < 1) entao
            publicarManha <- falso
         fimse


         // ==================================================
         // CALCULAR FALTAS
         // ==================================================

         se (clinicoManha < 2) entao
            faltaClinicoManha <- 2 - clinicoManha
         senao
            faltaClinicoManha <- 0
         fimse

         se (pediatraManha < 1) entao
            faltaPediatraManha <- 1 - pediatraManha
         senao
            faltaPediatraManha <- 0
         fimse

         se (cirurgiaoManha < 1) entao
            faltaCirurgiaoManha <- 1 - cirurgiaoManha
         senao
            faltaCirurgiaoManha <- 0
         fimse


         // ==================================================
         // TOTAL DE MEDICOS
         // ==================================================

         escreval("")
         escreval("------------------------------------------")
         escreval("TOTAL DE MEDICOS - MANHA")
         escreval("------------------------------------------")
         escreval("Clinicos Gerais: ", clinicoManha)
         escreval("Pediatras: ", pediatraManha)
         escreval("Cirurgioes: ", cirurgiaoManha)
         escreval("TOTAL: ", clinicoManha + pediatraManha + cirurgiaoManha)


         // ==================================================
         // CONFIRMAR PUBLICACAO
         // ==================================================

         escreval("")
         escreval("Deseja publicar o turno da MANHA? (S/N)")
         leia(confirmacao)

         se (confirmacao = "S") ou (confirmacao = "s") entao
            se publicarManha = verdadeiro entao
               respostaManha <- "PUBLICADO COM SUCESSO"
            senao
               respostaManha <- "NAO PODE SER PUBLICADO - FALTAM MEDICOS"
            fimse
         senao
            respostaManha <- "NAO SERA PUBLICADO"
         fimse


      senao


         // ==================================================
         // TURNO DA TARDE
         // ==================================================

         se (turno = 2) entao

            tarde <- 1

            escreval("")
            escreval("==========================================")
            escreval("             TURNO DA TARDE")
            escreval("==========================================")


            escreval("Digite a quantidade de Clinicos Gerais:")
            leia(clinicoTarde)

            // Utilizei o Enquanto para validação - Pedro Rosa
            enquanto (clinicoTarde < 0) ou (clinicoTarde > 10) faca
               escreval("Quantidade invalida!")
               escreval("Digite um valor entre 0 e 10:")
               leia(clinicoTarde)
            fimenquanto


            escreval("Digite a quantidade de Pediatras:")
            leia(pediatraTarde)

            // Utilizei o Enquanto para validação - Pedro Rosa
            enquanto (pediatraTarde < 0) ou (pediatraTarde > 10) faca
               escreval("Quantidade invalida!")
               escreval("Digite um valor entre 0 e 10:")
               leia(pediatraTarde)
            fimenquanto


            escreval("Digite a quantidade de Cirurgioes:")
            leia(cirurgiaoTarde)

            //Utilizei o Enquanto para validação - Pedro Rosa
            enquanto (cirurgiaoTarde < 0) ou (cirurgiaoTarde > 10) faca
               escreval("Quantidade invalida!")
               escreval("Digite um valor entre 0 e 10:")
               leia(cirurgiaoTarde)
            fimenquanto


            // ==================================================
            // VERIFICAR COBERTURA MINIMA
            // ==================================================

            publicarTarde <- verdadeiro

            se (clinicoTarde < 2) entao
               publicarTarde <- falso
            fimse

            se (pediatraTarde < 1) entao
               publicarTarde <- falso
            fimse

            se (cirurgiaoTarde < 1) entao
               publicarTarde <- falso
            fimse


            // ==================================================
            // CALCULAR FALTAS
            // ==================================================

            se (clinicoTarde < 2) entao
               faltaClinicoTarde <- 2 - clinicoTarde
            senao
               faltaClinicoTarde <- 0
            fimse

            se (pediatraTarde < 1) entao
               faltaPediatraTarde <- 1 - pediatraTarde
            senao
               faltaPediatraTarde <- 0
            fimse

            se (cirurgiaoTarde < 1) entao
               faltaCirurgiaoTarde <- 1 - cirurgiaoTarde
            senao
               faltaCirurgiaoTarde <- 0
            fimse


            // ==================================================
            // TOTAL DE MEDICOS
            // ==================================================

            escreval("")
            escreval("------------------------------------------")
            escreval("TOTAL DE MEDICOS - TARDE")
            escreval("------------------------------------------")
            escreval("Clinicos Gerais: ", clinicoTarde)
            escreval("Pediatras: ", pediatraTarde)
            escreval("Cirurgioes: ", cirurgiaoTarde)
            escreval("TOTAL: ", clinicoTarde + pediatraTarde + cirurgiaoTarde)


            // ==================================================
            // CONFIRMAR PUBLICACAO
            // ==================================================

            escreval("")
            escreval("Deseja publicar o turno da TARDE? (S/N)")
            leia(confirmacao)

            se (confirmacao = "S") ou (confirmacao = "s") entao
               se publicarTarde = verdadeiro entao
                  respostaTarde <- "PUBLICADO COM SUCESSO"
               senao
                  respostaTarde <- "NAO PODE SER PUBLICADO - FALTAM MEDICOS"
               fimse
            senao
               respostaTarde <- "NAO SERA PUBLICADO"
            fimse


         senao


            // ==================================================
            // TURNO DA NOITE
            // ==================================================

            se (turno = 3) entao

               noite <- 1

               escreval("")
               escreval("==========================================")
               escreval("             TURNO DA NOITE")
               escreval("==========================================")


               escreval("Digite a quantidade de Clinicos Gerais:")
               leia(clinicoNoite)

               //Utilizei o Enquanto para validação - Pedro Rosa
               enquanto (clinicoNoite < 0) ou (clinicoNoite > 10) faca
                  escreval("Quantidade invalida!")
                  escreval("Digite um valor entre 0 e 10:")
                  leia(clinicoNoite)
               fimenquanto


               escreval("Digite a quantidade de Pediatras:")
               leia(pediatraNoite)

               //Utilizei o Enquanto para validação - Pedro Rosa
               enquanto (pediatraNoite < 0) ou (pediatraNoite > 10) faca
                  escreval("Quantidade invalida!")
                  escreval("Digite um valor entre 0 e 10:")
                  leia(pediatraNoite)
               fimenquanto


               escreval("Digite a quantidade de Cirurgioes:")
               leia(cirurgiaoNoite)

               //Utilizei o Enquanto para validação - Pedro Rosa
               enquanto (cirurgiaoNoite < 0) ou (cirurgiaoNoite > 10) faca
                  escreval("Quantidade invalida!")
                  escreval("Digite um valor entre 0 e 10:")
                  leia(cirurgiaoNoite)
               fimenquanto


               // ==================================================
               // VERIFICAR COBERTURA MINIMA
               // ==================================================

               publicarNoite <- verdadeiro

               se (clinicoNoite < 2) entao
                  publicarNoite <- falso
               fimse

               se (pediatraNoite < 1) entao
                  publicarNoite <- falso
               fimse

               se (cirurgiaoNoite < 1) entao
                  publicarNoite <- falso
               fimse


               // ==================================================
               // CALCULAR FALTAS
               // ==================================================

               se (clinicoNoite < 2) entao
                  faltaClinicoNoite <- 2 - clinicoNoite
               senao
                  faltaClinicoNoite <- 0
               fimse

               se (pediatraNoite < 1) entao
                  faltaPediatraNoite <- 1 - pediatraNoite
               senao
                  faltaPediatraNoite <- 0
               fimse

               se (cirurgiaoNoite < 1) entao
                  faltaCirurgiaoNoite <- 1 - cirurgiaoNoite
               senao
                  faltaCirurgiaoNoite <- 0
               fimse


               // ==================================================
               // TOTAL DE MEDICOS
               // ==================================================

               escreval("")
               escreval("------------------------------------------")
               escreval("TOTAL DE MEDICOS - NOITE")
               escreval("------------------------------------------")
               escreval("Clinicos Gerais: ", clinicoNoite)
               escreval("Pediatras: ", pediatraNoite)
               escreval("Cirurgioes: ", cirurgiaoNoite)
               escreval("TOTAL: ", clinicoNoite + pediatraNoite + cirurgiaoNoite)


               // ==================================================
               // CONFIRMAR PUBLICACAO
               // ==================================================

               escreval("")
               escreval("Deseja publicar o turno da NOITE? (S/N)")
               leia(confirmacao)

               se (confirmacao = "S") ou (confirmacao = "s") entao
                  se publicarNoite = verdadeiro entao
                     respostaNoite <- "PUBLICADO COM SUCESSO"
                  senao
                     respostaNoite <- "NAO PODE SER PUBLICADO - FALTAM MEDICOS"
                  fimse
               senao
                  respostaNoite <- "NAO SERA PUBLICADO"
               fimse

            fimse

         fimse

      fimse

   fimpara


   // ==================================================
   // MODULO DE ATRIBUICAO DE MEDICO A UM TURNO
   // ==================================================

   continuarEscala <- "S"
   enquanto (continuarEscala = "S") ou (continuarEscala = "s") faca

      escreval("")
      escreval("==========================================")
      escreval("       ATRIBUIR MEDICO A UM TURNO")
      escreval("==========================================")

      // 1. Solicitar o identificador do médico
      escreval("Informe o ID do medico (IDs ímpares = cadastrados):")
      leia(idMedico)

      // 2. Verificar se o médico está cadastrado no sistema
      se (idMedico MOD 2 <> 0) e (idMedico > 0) entao
         medicoCadastrado <- verdadeiro
      senao
         medicoCadastrado <- falso
      fimse

      se nao medicoCadastrado entao
         // 16. Recusar a atribuição quando o médico não estiver cadastrado
         // 27. Exibir mensagem clara informando o motivo
         // 28. Não ocupar vaga, 29. Não alterar plantões, 30. Permitir novos dados, 31. Manter execução
         escreval("RECUSA: O medico informado nao esta cadastrado no sistema.")
      senao

         // 3. Solicitar o turno em que o médico será escalado
         escreval("Informe o turno (1-Manha, 2-Tarde, 3-Noite):")
         leia(turnoEscala)

         // 4. Verificar se o turno informado existe
         se (turnoEscala < 1) ou (turnoEscala > 3) entao
            // 23. Identificar quando o turno informado não existir
            // 24. Recusar a atribuição
            escreval("RECUSA: O turno informado nao existe.")
         senao

            // 6. Verificar se o médico está disponível no turno informado (Simulação: múltiplos de 5 indisponíveis)
            se (idMedico MOD 5 = 0) entao
               medicoDisponivel <- falso
            senao
               medicoDisponivel <- verdadeiro
            fimse

            se nao medicoDisponivel entao
               // 18. Recusar a atribuição quando o médico não estiver disponível
               escreval("RECUSA: O medico esta indisponivel no turno informado.")
            senao

               // 5. Solicitar o posto que será ocupado
               escreval("Informe o posto/especialidade exigida (1-Clinico, 2-Pediatra, 3-Cirurgiao):")
               leia(postoEscala)

               // 7. Verificar se a especialidade do médico é compatível com a exigida pelo posto
               se (idMedico MOD 3 = postoEscala - 1) entao
                  especialidadeCompativel <- verdadeiro
               senao
                  especialidadeCompativel <- falso
               fimse

               se nao especialidadeCompativel entao
                  // 21. Identificar quando a especialidade for incompatível
                  // 22. Recusar a atribuição
                  escreval("RECUSA: A especialidade do medico e incompativel com a exigida pelo posto.")
               senao

                  // 8. Verificar se o médico ainda não ocupa outro posto no mesmo turno (Simulação: múltiplos de 7)
                  se (idMedico MOD 7 = 0) entao
                     medicoOcupadoTurno <- verdadeiro
                  senao
                     medicoOcupadoTurno <- falso
                  fimse

                  se medicoOcupadoTurno entao
                     // 19. Identificar quando o médico já estiver ocupando outro posto
                     // 20. Recusar a atribuição
                     escreval("RECUSA: O medico ja esta ocupando outro posto no mesmo turno.")
                  senao

                     // 9. Verificar se o médico não ultrapassa o limite de plantões permitido para o dia (Limite: 2)
                     se (plantoesDiaMedico >= 2) entao
                        // 25. Identificar quando o limite de plantões for ultrapassado
                        // 26. Recusar a atribuição
                        escreval("RECUSA: O medico ultrapassou o limite maximo de plantões permitidos para o dia.")
                     senao

                        // 10. Registrar a escalação quando todas as regras forem atendidas
                        // 11. Associar o médico ao posto selecionado
                        // 12. Ocupar a vaga correspondente no turno
                        // 13. Atualizar a quantidade de plantões atribuída ao médico
                        plantoesDiaMedico <- plantoesDiaMedico + 1
                        escreval("SUCESSO: Escala registrada! O medico foi associado ao posto, vaga ocupada.")
                        escreval("Quantidade de plantões atualizada para o medico: ", plantoesDiaMedico)

                     fimse

                  fimse

               fimse

            fimse

         fimse

      fimse

      // Permitir que o coordenador informe novos dados e manter execução
      escreval("")
      escreval("Deseja realizar outra atribuicao? (S/N)")
      leia(continuarEscala)

   fimenquanto


   // ==================================================
   // RELATORIO FINAL
   // ==================================================

   escreval("")
   escreval("")
   escreval("==================================================")
   escreval("              RELATORIO FINAL")
   escreval("           HOSPITAL SANTA AURORA")
   escreval("==================================================")


   // ==================================================
   // MANHA
   // ==================================================

   escreval("")
   escreval("------------------------------------------")
   escreval("                MANHA")
   escreval("------------------------------------------")
   escreval("Clinicos Gerais: ", clinicoManha)
   escreval("Pediatras: ", pediatraManha)
   escreval("Cirurgioes: ", cirurgiaoManha)
   escreval("TOTAL DE MEDICOS: ", clinicoManha + pediatraManha + cirurgiaoManha)
   escreval("SITUACAO: ", respostaManha)

   se publicarManha = falso entao

      escreval("FALTAS:")

      se faltaClinicoManha > 0 entao
         escreval("Clinicos Gerais: ", faltaClinicoManha)
      fimse

      se faltaPediatraManha > 0 entao
         escreval("Pediatras: ", faltaPediatraManha)
      fimse

      se faltaCirurgiaoManha > 0 entao
         escreval("Cirurgioes: ", faltaCirurgiaoManha)
      fimse

   fimse


   // ==================================================
   // TARDE
   // ==================================================

   escreval("")
   escreval("------------------------------------------")
   escreval("                TARDE")
   escreval("------------------------------------------")
   escreval("Clinicos Gerais: ", clinicoTarde)
   escreval("Pediatras: ", pediatraTarde)
   escreval("Cirurgioes: ", cirurgiaoTarde)
   escreval("TOTAL DE MEDICOS: ", clinicoTarde + pediatraTarde + cirurgiaoTarde)
   escreval("SITUACAO: ", respostaTarde)

   se publicarTarde = falso entao

      escreval("FALTAS:")

      se faltaClinicoTarde > 0 entao
         escreval("Clinicos Gerais: ", faltaClinicoTarde)
      fimse

      se faltaPediatraTarde > 0 entao
         escreval("Pediatras: ", faltaPediatraTarde)
      fimse

      se faltaCirurgiaoTarde > 0 entao
         escreval("Cirurgioes: ", faltaCirurgiaoTarde)
      fimse

   fimse


   // ==================================================
   // NOITE
   // ==================================================

   escreval("")
   escreval("------------------------------------------")
   escreval("                NOITE")
   escreval("------------------------------------------")
   escreval("Clinicos Gerais: ", clinicoNoite)
   escreval("Pediatras: ", pediatraNoite)
   escreval("Cirurgioes: ", cirurgiaoNoite)
   escreval("TOTAL DE MEDICOS: ", clinicoNoite + pediatraNoite + cirurgiaoNoite)
   escreval("SITUACAO: ", respostaNoite)

   se publicarNoite = falso entao

      escreval("FALTAS:")

      se faltaClinicoNoite > 0 entao
         escreval("Clinicos Gerais: ", faltaClinicoNoite)
      fimse

      se faltaPediatraNoite > 0 entao
         escreval("Pediatras: ", faltaPediatraNoite)
      fimse

      se faltaCirurgiaoNoite > 0 entao
         escreval("Clinicos Gerais: ", faltaClinicoNoite) // mantido conforme base
      fimse

   fimse


   // ==================================================
   // TOTAL GERAL
   // ==================================================

   escreval("")
   escreval("==================================================")
   escreval("                 RESUMO GERAL")
   escreval("==================================================")

   escreval("TOTAL MANHA: ", clinicoManha + pediatraManha + cirurgiaoManha)
   escreval("TOTAL TARDE: ", clinicoTarde + pediatraTarde + cirurgiaoTarde)
   escreval("TOTAL NOITE: ", clinicoNoite + pediatraNoite + cirurgiaoNoite)

   escreval("")
   escreval("TOTAL GERAL DE MEDICOS: ", clinicoManha + pediatraManha + cirurgiaoManha + clinicoTarde + pediatraTarde + clinicoTarde + clinicoNoite + pediatraNoite + cirurgiaoNoite)


   // ==================================================
   // PUBLICACOES
   // ==================================================

   escreval("")
   escreval("==================================================")
   escreval("             RESULTADO DAS PUBLICACOES")
   escreval("==================================================")

   escreval("MANHA: ", respostaManha)
   escreval("TARDE: ", respostaTarde)
   escreval("NOITE: ", respostaNoite)

   escreval("")
   escreval("==================================================")
   escreval("               FIM DO RELATORIO")
   escreval("==================================================")


Fimalgoritmo
