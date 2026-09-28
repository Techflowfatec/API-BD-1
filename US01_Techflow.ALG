Algoritmo "semnome"

Var
<<<<<<< HEAD
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
=======
   i, iTurno, iManha, iTarde, iNoite : inteiro
   turno, manha, tarde, noite : inteiro
>>>>>>> 5998d8a (commit do Joao)

   clinicoManha, clinicoTarde, clinicoNoite : inteiro
   pediatraManha, pediatraTarde, pediatraNoite : inteiro
   cirurgiaoManha, cirurgiaoTarde, cirurgiaoNoite : inteiro

   faltaClinicoManha, faltaPediatraManha, faltaCirurgiaoManha : inteiro
   faltaClinicoTarde, faltaPediatraTarde, faltaCirurgiaoTarde : inteiro
   faltaClinicoNoite, faltaPediatraNoite, faltaCirurgiaoNoite : inteiro

   publicarManha, publicarTarde, publicarNoite : logico

   respostaManha, respostaTarde, respostaNoite : caractere
   confirmacao : caractere

Inicio

<<<<<<< HEAD
manha <- 0
tarde <- 0
noite <- 0


// ==================================================
// US1 - ESCOLHER O TURNO DO PLANT√ÉO
// ==================================================

para i de 1 ate 3 faca

escreval("------------------------------------")
escreval("| HOSPITAL SANTA AURORA |")
escreval("------------------------------------")
escreval("Digite o turno que deseja:")
escreval("1 - Manh√£ | 2 - Tarde | 3 - Noite")
leia(turno)


// ==================================================
// VALIDA√á√ÉO DO TURNO
// ==================================================

para iTurno de 1 ate 10 faca

se (turno < 1) ou (turno > 3) entao

escreval("TURNO INEXISTENTE!!! Tentativa", iTurno , "/10")
escreval("Digite um n√∫mero entre 1 e 3")
leia(turno)

senao

se (turno = 1) e (manha = 1) entao

escreval("TURNO J√Å ESCOLHIDO!!! Tentativa", iTurno , "/10")
escreval("Escolha um turno ainda n√£o selecionado")
leia(turno)

senao

se (turno = 2) e (tarde = 1) entao

escreval("TURNO J√Å ESCOLHIDO!!! Tentativa", iTurno , "/10")
escreval("Escolha um turno ainda n√£o selecionado")
leia(turno)

senao

se (turno = 3) e (noite = 1) entao

escreval("TURNO J√Å ESCOLHIDO!!! Tentativa", iTurno , "/10")
escreval("Escolha um turno ainda n√£o selecionado")
leia(turno)

fimse

fimse

fimse

fimse

fimpara


// ==================================================
// US2 - INFORMAR QUANTIDADE DE M√âDICOS
// ==================================================

se (turno = 1) entao

manha <- 1

escreval("")
escreval("TURNO DA MANH√É")

escreval("Digite a quantidade de Cl√≠nicos Gerais:")
leia(clinicoManha)

escreval("Digite a quantidade de Pediatras:")
leia(pediatraManha)

escreval("Digite a quantidade de Cirurgi√µes:")
leia(cirurgiaoManha)


senao

se (turno = 2) entao

tarde <- 1

escreval("")
escreval("TURNO DA TARDE")

escreval("Digite a quantidade de Cl√≠nicos Gerais:")
leia(clinicoTarde)

escreval("Digite a quantidade de Pediatras:")
leia(pediatraTarde)

escreval("Digite a quantidade de Cirurgi√µes:")
leia(cirurgiaoTarde)


senao

se (turno = 3) entao

noite <- 1

escreval("")
escreval("TURNO DA NOITE")

escreval("Digite a quantidade de Cl√≠nicos Gerais:")
leia(clinicoNoite)

escreval("Digite a quantidade de Pediatras:")
leia(pediatraNoite)

escreval("Digite a quantidade de Cirurgi√µes:")
leia(cirurgiaoNoite)

fimse

fimse

fimse


// ==================================================
// US3 - VALIDAR QUANTIDADE DE M√âDICOS
// ==================================================

se (turno = 1) entao

para iManha de 1 ate 10 faca

se (clinicoManha < 0) ou (clinicoManha > 10) entao

escreval("QUANTIDADE INV√ÅLIDA!!! Tentativa", iManha , "/10")
escreval("Digite um n√∫mero entre 0 e 10:")
leia(clinicoManha)

fimse

fimpara


para iManha de 1 ate 10 faca

se (pediatraManha < 0) ou (pediatraManha > 10) entao

escreval("QUANTIDADE INV√ÅLIDA!!! Tentativa", iManha , "/10")
escreval("Digite um n√∫mero entre 0 e 10:")
leia(pediatraManha)

fimse

fimpara


para iManha de 1 ate 10 faca

se (cirurgiaoManha < 0) ou (cirurgiaoManha > 10) entao

escreval("QUANTIDADE INV√ÅLIDA!!! Tentativa", iManha , "/10")
escreval("Digite um n√∫mero entre 0 e 10:")
leia(cirurgiaoManha)

fimse

fimpara


senao

se (turno = 2) entao

para iTarde de 1 ate 10 faca

se (clinicoTarde < 0) ou (clinicoTarde > 10) entao

escreval("QUANTIDADE INV√ÅLIDA!!! Tentativa", iTarde , "/10")
escreval("Digite um n√∫mero entre 0 e 10:")
leia(clinicoTarde)

fimse

fimpara


para iTarde de 1 ate 10 faca

se (pediatraTarde < 0) ou (pediatraTarde > 10) entao

escreval("QUANTIDADE INV√ÅLIDA!!! Tentativa", iTarde , "/10")
escreval("Digite um n√∫mero entre 0 e 10:")
leia(pediatraTarde)

fimse

fimpara


para iTarde de 1 ate 10 faca

se (cirurgiaoTarde < 0) ou (cirurgiaoTarde > 10) entao

escreval("QUANTIDADE INV√ÅLIDA!!! Tentativa", iTarde , "/10")
escreval("Digite um n√∫mero entre 0 e 10:")
leia(cirurgiaoTarde)

fimse

fimpara


senao

se (turno = 3) entao

para iNoite de 1 ate 10 faca

se (clinicoNoite < 0) ou (clinicoNoite > 10) entao

escreval("QUANTIDADE INV√ÅLIDA!!! Tentativa", iNoite , "/10")
escreval("Digite um n√∫mero entre 0 e 10:")
leia(clinicoNoite)

fimse

fimpara


para iNoite de 1 ate 10 faca

se (pediatraNoite < 0) ou (pediatraNoite > 10) entao

escreval("QUANTIDADE INV√ÅLIDA!!! Tentativa", iNoite , "/10")
escreval("Digite um n√∫mero entre 0 e 10:")
leia(pediatraNoite)

fimse

fimpara


para iNoite de 1 ate 10 faca

se (cirurgiaoNoite < 0) ou (cirurgiaoNoite > 10) entao

escreval("QUANTIDADE INV√ÅLIDA!!! Tentativa", iNoite , "/10")
escreval("Digite um n√∫mero entre 0 e 10:")
leia(cirurgiaoNoite)

fimse

fimpara

fimse

fimse

fimse

fimpara

     ==================================================
      // US4 - VERIFICAR COBERTURA M√çNIMA
=======
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


   // ==================================================
   // ESCOLHA DOS 3 TURNOS
   // ==================================================

   para i de 1 ate 3 faca

      escreval("")
      escreval("==========================================")
      escreval("       HOSPITAL SANTA AURORA")
      escreval("==========================================")
      escreval("Escolha o turno:")
      escreval("1 - Manha")
      escreval("2 - Tarde")
      escreval("3 - Noite")
      leia(turno)


      // ==================================================
      // VALIDACAO DO TURNO
      // ==================================================

      para iTurno de 1 ate 10 faca

         se (turno < 1) ou (turno > 3) entao

            escreval("ERRO: turno inexistente!")
            escreval("Tentativa ", iTurno, " de 10.")
            escreval("Digite 1, 2 ou 3:")
            leia(turno)

         senao

            se (turno = 1) e (manha = 1) entao

               escreval("ERRO: turno da manha ja foi escolhido!")
               escreval("Digite outro turno:")
               leia(turno)

            senao

               se (turno = 2) e (tarde = 1) entao

                  escreval("ERRO: turno da tarde ja foi escolhido!")
                  escreval("Digite outro turno:")
                  leia(turno)

               senao

                  se (turno = 3) e (noite = 1) entao

                     escreval("ERRO: turno da noite ja foi escolhido!")
                     escreval("Digite outro turno:")
                     leia(turno)

                  fimse

               fimse

            fimse

         fimse

      fimpara


      // ==================================================
      // TURNO DA MANHA
>>>>>>> 5998d8a (commit do Joao)
      // ==================================================

      se (turno = 1) entao

<<<<<<< HEAD
=======
         manha <- 1

         escreval("")
         escreval("==========================================")
         escreval("             TURNO DA MANHA")
         escreval("==========================================")


         escreval("Digite a quantidade de Clinicos Gerais:")
         leia(clinicoManha)

         para iManha de 1 ate 10 faca

            se (clinicoManha < 0) ou (clinicoManha > 10) entao

               escreval("Quantidade invalida!")
               escreval("Digite um valor entre 0 e 10:")
               leia(clinicoManha)

            fimse

         fimpara


         escreval("Digite a quantidade de Pediatras:")
         leia(pediatraManha)

         para iManha de 1 ate 10 faca

            se (pediatraManha < 0) ou (pediatraManha > 10) entao

               escreval("Quantidade invalida!")
               escreval("Digite um valor entre 0 e 10:")
               leia(pediatraManha)

            fimse

         fimpara


         escreval("Digite a quantidade de Cirurgioes:")
         leia(cirurgiaoManha)

         para iManha de 1 ate 10 faca

            se (cirurgiaoManha < 0) ou (cirurgiaoManha > 10) entao

               escreval("Quantidade invalida!")
               escreval("Digite um valor entre 0 e 10:")
               leia(cirurgiaoManha)

            fimse

         fimpara


         // ==================================================
         // VERIFICAR COBERTURA MINIMA
         // ==================================================

>>>>>>> 5998d8a (commit do Joao)
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


<<<<<<< HEAD
      senao

         se (turno = 2) entao

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


         senao

            se (turno = 3) entao

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

            fimse

         fimse

      fimse
// ==================================================
      // US5 - IDENTIFICAR AS FALTAS
      // ==================================================

      se (turno = 1) entao
=======
         // ==================================================
         // CALCULAR FALTAS
         // ==================================================
>>>>>>> 5998d8a (commit do Joao)

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


<<<<<<< HEAD
      senao

         se (turno = 2) entao

=======
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

            para iTarde de 1 ate 10 faca

               se (clinicoTarde < 0) ou (clinicoTarde > 10) entao

                  escreval("Quantidade invalida!")
                  escreval("Digite um valor entre 0 e 10:")
                  leia(clinicoTarde)

               fimse

            fimpara


            escreval("Digite a quantidade de Pediatras:")
            leia(pediatraTarde)

            para iTarde de 1 ate 10 faca

               se (pediatraTarde < 0) ou (pediatraTarde > 10) entao

                  escreval("Quantidade invalida!")
                  escreval("Digite um valor entre 0 e 10:")
                  leia(pediatraTarde)

               fimse

            fimpara


            escreval("Digite a quantidade de Cirurgioes:")
            leia(cirurgiaoTarde)

            para iTarde de 1 ate 10 faca

               se (cirurgiaoTarde < 0) ou (cirurgiaoTarde > 10) entao

                  escreval("Quantidade invalida!")
                  escreval("Digite um valor entre 0 e 10:")
                  leia(cirurgiaoTarde)

               fimse

            fimpara


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

>>>>>>> 5998d8a (commit do Joao)
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


<<<<<<< HEAD
         senao

            se (turno = 3) entao

=======
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

               para iNoite de 1 ate 10 faca

                  se (clinicoNoite < 0) ou (clinicoNoite > 10) entao

                     escreval("Quantidade invalida!")
                     escreval("Digite um valor entre 0 e 10:")
                     leia(clinicoNoite)

                  fimse

               fimpara


               escreval("Digite a quantidade de Pediatras:")
               leia(pediatraNoite)

               para iNoite de 1 ate 10 faca

                  se (pediatraNoite < 0) ou (pediatraNoite > 10) entao

                     escreval("Quantidade invalida!")
                     escreval("Digite um valor entre 0 e 10:")
                     leia(pediatraNoite)

                  fimse

               fimpara


               escreval("Digite a quantidade de Cirurgioes:")
               leia(cirurgiaoNoite)

               para iNoite de 1 ate 10 faca

                  se (cirurgiaoNoite < 0) ou (cirurgiaoNoite > 10) entao

                     escreval("Quantidade invalida!")
                     escreval("Digite um valor entre 0 e 10:")
                     leia(cirurgiaoNoite)

                  fimse

               fimpara


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

>>>>>>> 5998d8a (commit do Joao)
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

<<<<<<< HEAD
            fimse

         fimse

      fimse


      // ==================================================
      // US6 - RESULTADO DA AN¡LISE
      // ==================================================

      se (turno = 1) entao

         se (publicarManha = falso) entao
            respostaManha <- "N„o pode ser publicado!!!"
         senao
            respostaManha <- "Pode ser publicado!!!"
         fimse


      senao

         se (turno = 2) entao

            se (publicarTarde = falso) entao
               respostaTarde <- "N„o pode ser publicado!!!"
            senao
               respostaTarde <- "Pode ser publicado!!!"
            fimse


         senao

            se (turno = 3) entao

               se (publicarNoite = falso) entao
                  respostaNoite <- "N„o pode ser publicado!!!"
               senao
                  respostaNoite <- "Pode ser publicado!!!"
=======

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

>>>>>>> 5998d8a (commit do Joao)
               fimse

            fimse

         fimse

      fimse

<<<<<<< HEAD

      limpatela

=======
>>>>>>> 5998d8a (commit do Joao)
   fimpara


   // ==================================================
<<<<<<< HEAD
   // US6 - RESULTADO FINAL
   // ==================================================

   escreval("")
   escreval("------------------------------------")
   escreval("|     HOSPITAL SANTA AURORA        |")
   escreval("------------------------------------")


   // ==================================================
   // US5 + US6 - RESULTADO DA MANH√
   // ==================================================

   escreval("")
   escreval("TURNO DA MANH√")
   escreval("Quantidade mÌnima:")
   escreval("2 ClÌnicos Gerais | 1 Pediatra | 1 Cirurgi„o")
   escreval("-----------------------------------------------")

   escreval(respostaManha)

   escreval("Quantidade de ClÌnicos : ", clinicoManha)
   escreval("Quantidade de Pediatras : ", pediatraManha)
   escreval("Quantidade de Cirurgiıes : ", cirurgiaoManha)


   se (publicarManha = falso) entao

      escreval("")
      escreval("FALTAS:")

      se (faltaClinicoManha > 0) entao
         escreval("ClÌnicos Gerais: faltam ", faltaClinicoManha)
      fimse

      se (faltaPediatraManha > 0) entao
         escreval("Pediatras: faltam ", faltaPediatraManha)
      fimse

      se (faltaCirurgiaoManha > 0) entao
         escreval("Cirurgiıes: faltam ", faltaCirurgiaoManha)
      fimse

   fimse


   // ==================================================
   // US5 + US6 - RESULTADO DA TARDE
   // ==================================================

   escreval("")
   escreval("TURNO DA TARDE")
   escreval("Quantidade mÌnima:")
   escreval("2 ClÌnicos Gerais | 1 Pediatra | 1 Cirurgi„o")
   escreval("-----------------------------------------------")

   escreval(respostaTarde)

   escreval("Quantidade de ClÌnicos : ", clinicoTarde)
   escreval("Quantidade de Pediatras : ", pediatraTarde)
   escreval("Quantidade de Cirurgiıes : ", cirurgiaoTarde)


   se (publicarTarde = falso) entao

      escreval("")
      escreval("FALTAS:")

      se (faltaClinicoTarde > 0) entao
         escreval("ClÌnicos Gerais: faltam ", faltaClinicoTarde)
      fimse

      se (faltaPediatraTarde > 0) entao
         escreval("Pediatras: faltam ", faltaPediatraTarde)
      fimse

      se (faltaCirurgiaoTarde > 0) entao
         escreval("Cirurgiıes: faltam ", faltaCirurgiaoTarde)
=======
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
   escreval("               MANHA")
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
>>>>>>> 5998d8a (commit do Joao)
      fimse

   fimse


   // ==================================================
<<<<<<< HEAD
   // US5 + US6 - RESULTADO DA NOITE
   // ==================================================

   escreval("")
   escreval("TURNO DA NOITE")
   escreval("Quantidade mÌnima:")
   escreval("2 ClÌnicos Gerais | 1 Pediatra | 1 Cirurgi„o")
   escreval("-----------------------------------------------")

   escreval(respostaNoite)

   escreval("Quantidade de ClÌnicos : ", clinicoNoite)
   escreval("Quantidade de Pediatras : ", pediatraNoite)
   escreval("Quantidade de Cirurgiıes : ", cirurgiaoNoite)


   se (publicarNoite = falso) entao

      escreval("")
      escreval("FALTAS:")

      se (faltaClinicoNoite > 0) entao
         escreval("ClÌnicos Gerais: faltam ", faltaClinicoNoite)
      fimse

      se (faltaPediatraNoite > 0) entao
         escreval("Pediatras: faltam ", faltaPediatraNoite)
      fimse

      se (faltaCirurgiaoNoite > 0) entao
         escreval("Cirurgiıes: faltam ", faltaCirurgiaoNoite)
      fimse

   fimse
fimalgoritmo
=======
   // TARDE
   // ==================================================

   escreval("")
   escreval("------------------------------------------")
   escreval("               TARDE")
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
   escreval("               NOITE")
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
         escreval("Cirurgioes: ", faltaCirurgiaoNoite)
      fimse

   fimse


   // ==================================================
   // TOTAL GERAL
   // ==================================================

   escreval("")
   escreval("==================================================")
   escreval("                RESUMO GERAL")
   escreval("==================================================")

   escreval("TOTAL MANHA: ", clinicoManha + pediatraManha + cirurgiaoManha)
   escreval("TOTAL TARDE: ", clinicoTarde + pediatraTarde + cirurgiaoTarde)
   escreval("TOTAL NOITE: ", clinicoNoite + pediatraNoite + cirurgiaoNoite)

   escreval("")
   escreval("TOTAL GERAL DE MEDICOS: ", clinicoManha + pediatraManha + cirurgiaoManha + clinicoTarde + pediatraTarde + cirurgiaoTarde + clinicoNoite + pediatraNoite + cirurgiaoNoite)


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
   escreval("             FIM DO RELATORIO")
   escreval("==================================================")


Fimalgoritmo
>>>>>>> 5998d8a (commit do Joao)
