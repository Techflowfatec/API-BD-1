Algoritmo "semnome"

Var
   i, iTurno, iManha, iTarde, iNoite : inteiro
   turno, manha, tarde, noite : inteiro

   clinicoManha, clinicoTarde, clinicoNoite : inteiro
   pediatraManha, pediatraTarde, pediatraNoite : inteiro
   cirurgiaoManha, cirurgiaoTarde, cirurgiaoNoite : inteiro

   faltaClinicoManha, faltaPediatraManha, faltaCirurgiaoManha : inteiro
   faltaClinicoTarde, faltaPediatraTarde, faltaCirurgiaoTarde : inteiro
   faltaClinicoNoite, faltaPediatraNoite, faltaCirurgiaoNoite : inteiro

   publicarManha, publicarTarde, publicarNoite : logico

   respostaManha, respostaTarde, respostaNoite : caractere


Inicio

   manha <- 0
   tarde <- 0
   noite <- 0


   // ==================================================
   // US1 - ESCOLHER O TURNO DO PLANTÃO
   // ==================================================
   // O coordenador pode escolher entre Manhã, Tarde
   // e Noite para analisar a cobertura daquele turno.

   para i de 1 ate 3 faca

      escreval("------------------------------------")
      escreval("|     HOSPITAL SANTA AURORA        |")
      escreval("------------------------------------")
      escreval("Digite o turno que deseja:")
      escreval("1 - Manhã  | 2 - Tarde  | 3 - Noite")
      leia(turno)


      // ==================================================
      // US3 - VALIDAÇÃO DO TURNO
      // ==================================================
      // Verifica se o turno informado existe e se ainda
      // não foi escolhido.

      para iTurno de 1 ate 10 faca

         se (turno < 1) ou (turno > 3) entao

            escreval("TURNO INEXISTENTE!!! Tentativa", iTurno , "/10")
            escreval("Digite um número entre 1 e 3")
            leia(turno)

         senao

            se (turno = 1) e (manha = 1) entao

               escreval("TURNO JÁ ESCOLHIDO!!! Tentativa", iTurno , "/10")
               escreval("Escolha um turno ainda não selecionado")
               leia(turno)

            senao

               se (turno = 2) e (tarde = 1) entao

                  escreval("TURNO JÁ ESCOLHIDO!!! Tentativa", iTurno , "/10")
                  escreval("Escolha um turno ainda não selecionado")
                  leia(turno)

               senao

                  se (turno = 3) e (noite = 1) entao

                     escreval("TURNO JÁ ESCOLHIDO!!! Tentativa", iTurno , "/10")
                     escreval("Escolha um turno ainda não selecionado")
                     leia(turno)

                  fimse

               fimse

            fimse

         fimse

      fimpara


      // ==================================================
      // TURNO DA MANHÃ
      // ==================================================

      se (turno = 1) entao

         manha <- 1

         escreval("")
         escreval("TURNO DA MANHÃ")


         // ==================================================
         // US2 - INFORMAR QUANTIDADE DE MÉDICOS
         // ==================================================
         // Informa a quantidade de Clínicos Gerais,
         // Pediatras e Cirurgiões.

         escreval("Digite a quantidade de Clínicos Gerais:")
         leia(clinicoManha)


         // ==================================================
         // US3 - VALIDAÇÃO DA QUANTIDADE
         // ==================================================
         // Aceita somente valores inteiros de 0 a 10.

         para iManha de 1 ate 10 faca

            se (clinicoManha < 0) ou (clinicoManha > 10) entao

               escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iManha , "/10")
               escreval("Digite um número entre 0 e 10:")
               leia(clinicoManha)

            fimse

         fimpara


         escreval("Digite a quantidade de Pediatras:")
         leia(pediatraManha)


         // US3 - VALIDAÇÃO DA QUANTIDADE DE PEDIATRAS

         para iManha de 1 ate 10 faca

            se (pediatraManha < 0) ou (pediatraManha > 10) entao

               escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iManha , "/10")
               escreval("Digite um número entre 0 e 10:")
               leia(pediatraManha)

            fimse

         fimpara


         escreval("Digite a quantidade de Cirurgiões:")
         leia(cirurgiaoManha)


         // US3 - VALIDAÇÃO DA QUANTIDADE DE CIRURGIÕES

         para iManha de 1 ate 10 faca

            se (cirurgiaoManha < 0) ou (cirurgiaoManha > 10) entao

               escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iTurno , "/10")
               escreval("Digite um número entre 0 e 10:")
               leia(cirurgiaoManha)

            fimse

         fimpara


         // ==================================================
         // US4 - VERIFICAR COBERTURA MÍNIMA
         // ==================================================
         // Mínimo:
         // 2 Clínicos Gerais
         // 1 Pediatra
         // 1 Cirurgião

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
         // US5 - IDENTIFICAR AS FALTAS
         // ==================================================
         // Mostra qual especialidade está abaixo do mínimo
         // e quantos profissionais faltam.

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
         // US6 - RESULTADO DA ANÁLISE
         // ==================================================

         se (publicarManha = falso) entao

            respostaManha <- "Não pode ser publicado!!!"

         senao

            respostaManha <- "Pode ser publicado!!!"

         fimse


      senao


         // ==================================================
         // TURNO DA TARDE
         // ==================================================

         se (turno = 2) entao

            tarde <- 1

            escreval("")
            escreval("TURNO DA TARDE")


            // ==================================================
            // US2 - INFORMAR QUANTIDADE DE MÉDICOS
            // ==================================================

            escreval("Digite a quantidade de Clínicos Gerais:")
            leia(clinicoTarde)


            // ==================================================
            // US3 - VALIDAÇÃO
            // ==================================================

            para iTarde de 1 ate 10 faca

               se (clinicoTarde < 0) ou (clinicoTarde > 10) entao

                  escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iTarde , "/10")
                  escreval("Digite um número entre 0 e 10:")
                  leia(clinicoTarde)

               fimse

            fimpara


            escreval("Digite a quantidade de Pediatras:")
            leia(pediatraTarde)


            // US3 - VALIDAÇÃO

            para iTarde de 1 ate 10 faca

               se (pediatraTarde < 0) ou (pediatraTarde > 10) entao

                  escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iTarde , "/10")
                  escreval("Digite um número entre 0 e 10:")
                  leia(pediatraTarde)

               fimse

            fimpara


            escreval("Digite a quantidade de Cirurgiões:")
            leia(cirurgiaoTarde)


            // US3 - VALIDAÇÃO

            para iTarde de 1 ate 10 faca

               se (cirurgiaoTarde < 0) ou (cirurgiaoTarde > 10) entao

                  escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iTarde , "/10")
                  escreval("Digite um número entre 0 e 10:")
                  leia(cirurgiaoTarde)

               fimse

            fimpara


            // ==================================================
            // US4 - VERIFICAR COBERTURA MÍNIMA
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
            // US5 - IDENTIFICAR AS FALTAS
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
            // US6 - RESULTADO DA ANÁLISE
            // ==================================================

            se (publicarTarde = falso) entao

               respostaTarde <- "Não pode ser publicado!!!"

            senao

               respostaTarde <- "Pode ser publicado!!!"

            fimse


         senao


            // ==================================================
            // TURNO DA NOITE
            // ==================================================

            se (turno = 3) entao

               noite <- 1

               escreval("")
               escreval("TURNO DA NOITE")


               // ==================================================
               // US2 - INFORMAR QUANTIDADE DE MÉDICOS
               // ==================================================

               escreval("Digite a quantidade de Clínicos Gerais:")
               leia(clinicoNoite)


               // ==================================================
               // US3 - VALIDAÇÃO
               // ==================================================

               para iNoite de 1 ate 10 faca

                  se (clinicoNoite < 0) ou (clinicoNoite > 10) entao

                     escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iNoite , "/10")
                     escreval("Digite um número entre 0 e 10:")
                     leia(clinicoNoite)

                  fimse

               fimpara


               escreval("Digite a quantidade de Pediatras:")
               leia(pediatraNoite)


               // US3 - VALIDAÇÃO

               para iNoite de 1 ate 10 faca

                  se (pediatraNoite < 0) ou (pediatraNoite > 10) entao

                     escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iNoite , "/10")
                     escreval("Digite um número entre 0 e 10:")
                     leia(pediatraNoite)

                  fimse

               fimpara


               escreval("Digite a quantidade de Cirurgiões:")
               leia(cirurgiaoNoite)


               // US3 - VALIDAÇÃO

               para iNoite de 1 ate 10 faca

                  se (cirurgiaoNoite < 0) ou (cirurgiaoNoite > 10) entao

                     escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iNoite , "/10")
                     escreval("Digite um número entre 0 e 10:")
                     leia(cirurgiaoNoite)

                  fimse

               fimpara


               // ==================================================
               // US4 - VERIFICAR COBERTURA MÍNIMA
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
               // US5 - IDENTIFICAR AS FALTAS
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
               // US6 - RESULTADO DA ANÁLISE
               // ==================================================

               se (publicarNoite = falso) entao

                  respostaNoite <- "Não pode ser publicado!!!"

               senao

                  respostaNoite <- "Pode ser publicado!!!"

               fimse

            fimse

         fimse

      fimse

      limpatela

   fimpara


   // ==================================================
   // US6 - RESULTADO FINAL
   // ==================================================

   escreval("")
   escreval("------------------------------------")
   escreval("|     HOSPITAL SANTA AURORA        |")
   escreval("------------------------------------")


   // ==================================================
   // US5 + US6 - RESULTADO DA MANHÃ
   // ==================================================

   escreval("")
   escreval("TURNO DA MANHÃ")
   escreval("Quantidade mínima:")
   escreval("2 Clínicos Gerais | 1 Pediatra | 1 Cirurgião")
   escreval("-----------------------------------------------")

   escreval(respostaManha)

   escreval("Quantidade de Clínicos : ", clinicoManha)
   escreval("Quantidade de Pediatras : ", pediatraManha)
   escreval("Quantidade de Cirurgiões : ", cirurgiaoManha)


   // US5 - MOSTRAR FALTAS

   se (publicarManha = falso) entao

      escreval("")
      escreval("FALTAS:")

      se (faltaClinicoManha > 0) entao
         escreval("Clínicos Gerais: faltam ", faltaClinicoManha)
      fimse

      se (faltaPediatraManha > 0) entao
         escreval("Pediatras: faltam ", faltaPediatraManha)
      fimse

      se (faltaCirurgiaoManha > 0) entao
         escreval("Cirurgiões: faltam ", faltaCirurgiaoManha)
      fimse

   fimse


   // ==================================================
   // US5 + US6 - RESULTADO DA TARDE
   // ==================================================

   escreval("")
   escreval("TURNO DA TARDE")
   escreval("Quantidade mínima:")
   escreval("2 Clínicos Gerais | 1 Pediatra | 1 Cirurgião")
   escreval("-----------------------------------------------")

   escreval(respostaTarde)

   escreval("Quantidade de Clínicos : ", clinicoTarde)
   escreval("Quantidade de Pediatras : ", pediatraTarde)
   escreval("Quantidade de Cirurgiões : ", cirurgiaoTarde)


   // US5 - MOSTRAR FALTAS

   se (publicarTarde = falso) entao

      escreval("")
      escreval("FALTAS:")

      se (faltaClinicoTarde > 0) entao
         escreval("Clínicos Gerais: faltam ", faltaClinicoTarde)
      fimse

      se (faltaPediatraTarde > 0) entao
         escreval("Pediatras: faltam ", faltaPediatraTarde)
      fimse

      se (faltaCirurgiaoTarde > 0) entao
         escreval("Cirurgiões: faltam ", faltaCirurgiaoTarde)
      fimse

   fimse


   // ==================================================
   // US5 + US6 - RESULTADO DA NOITE
   // ==================================================

   escreval("")
   escreval("TURNO DA NOITE")
   escreval("Quantidade mínima:")
   escreval("2 Clínicos Gerais | 1 Pediatra | 1 Cirurgião")
   escreval("-----------------------------------------------")

   escreval(respostaNoite)

   escreval("Quantidade de Clínicos : ", clinicoNoite)
   escreval("Quantidade de Pediatras : ", pediatraNoite)
   escreval("Quantidade de Cirurgiões : ", cirurgiaoNoite)


   // US5 - MOSTRAR FALTAS

   se (publicarNoite = falso) entao

      escreval("")
      escreval("FALTAS:")

      se (faltaClinicoNoite > 0) entao
         escreval("Clínicos Gerais: faltam ", faltaClinicoNoite)
      fimse

      se (faltaPediatraNoite > 0) entao
         escreval("Pediatras: faltam ", faltaPediatraNoite)
      fimse

      se (faltaCirurgiaoNoite > 0) entao
         escreval("Cirurgiões: faltam ", faltaCirurgiaoNoite)
      fimse

   fimse


Fimalgoritmo