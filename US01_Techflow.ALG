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

para i de 1 ate 3 faca

escreval("------------------------------------")
escreval("| HOSPITAL SANTA AURORA |")
escreval("------------------------------------")
escreval("Digite o turno que deseja:")
escreval("1 - Manhã | 2 - Tarde | 3 - Noite")
leia(turno)


// ==================================================
// VALIDAÇÃO DO TURNO
// ==================================================

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
// US2 - INFORMAR QUANTIDADE DE MÉDICOS
// ==================================================

se (turno = 1) entao

manha <- 1

escreval("")
escreval("TURNO DA MANHÃ")

escreval("Digite a quantidade de Clínicos Gerais:")
leia(clinicoManha)

escreval("Digite a quantidade de Pediatras:")
leia(pediatraManha)

escreval("Digite a quantidade de Cirurgiões:")
leia(cirurgiaoManha)


senao

se (turno = 2) entao

tarde <- 1

escreval("")
escreval("TURNO DA TARDE")

escreval("Digite a quantidade de Clínicos Gerais:")
leia(clinicoTarde)

escreval("Digite a quantidade de Pediatras:")
leia(pediatraTarde)

escreval("Digite a quantidade de Cirurgiões:")
leia(cirurgiaoTarde)


senao

se (turno = 3) entao

noite <- 1

escreval("")
escreval("TURNO DA NOITE")

escreval("Digite a quantidade de Clínicos Gerais:")
leia(clinicoNoite)

escreval("Digite a quantidade de Pediatras:")
leia(pediatraNoite)

escreval("Digite a quantidade de Cirurgiões:")
leia(cirurgiaoNoite)

fimse

fimse

fimse


// ==================================================
// US3 - VALIDAR QUANTIDADE DE MÉDICOS
// ==================================================

se (turno = 1) entao

para iManha de 1 ate 10 faca

se (clinicoManha < 0) ou (clinicoManha > 10) entao

escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iManha , "/10")
escreval("Digite um número entre 0 e 10:")
leia(clinicoManha)

fimse

fimpara


para iManha de 1 ate 10 faca

se (pediatraManha < 0) ou (pediatraManha > 10) entao

escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iManha , "/10")
escreval("Digite um número entre 0 e 10:")
leia(pediatraManha)

fimse

fimpara


para iManha de 1 ate 10 faca

se (cirurgiaoManha < 0) ou (cirurgiaoManha > 10) entao

escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iManha , "/10")
escreval("Digite um número entre 0 e 10:")
leia(cirurgiaoManha)

fimse

fimpara


senao

se (turno = 2) entao

para iTarde de 1 ate 10 faca

se (clinicoTarde < 0) ou (clinicoTarde > 10) entao

escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iTarde , "/10")
escreval("Digite um número entre 0 e 10:")
leia(clinicoTarde)

fimse

fimpara


para iTarde de 1 ate 10 faca

se (pediatraTarde < 0) ou (pediatraTarde > 10) entao

escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iTarde , "/10")
escreval("Digite um número entre 0 e 10:")
leia(pediatraTarde)

fimse

fimpara


para iTarde de 1 ate 10 faca

se (cirurgiaoTarde < 0) ou (cirurgiaoTarde > 10) entao

escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iTarde , "/10")
escreval("Digite um número entre 0 e 10:")
leia(cirurgiaoTarde)

fimse

fimpara


senao

se (turno = 3) entao

para iNoite de 1 ate 10 faca

se (clinicoNoite < 0) ou (clinicoNoite > 10) entao

escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iNoite , "/10")
escreval("Digite um número entre 0 e 10:")
leia(clinicoNoite)

fimse

fimpara


para iNoite de 1 ate 10 faca

se (pediatraNoite < 0) ou (pediatraNoite > 10) entao

escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iNoite , "/10")
escreval("Digite um número entre 0 e 10:")
leia(pediatraNoite)

fimse

fimpara


para iNoite de 1 ate 10 faca

se (cirurgiaoNoite < 0) ou (cirurgiaoNoite > 10) entao

escreval("QUANTIDADE INVÁLIDA!!! Tentativa", iNoite , "/10")
escreval("Digite um número entre 0 e 10:")
leia(cirurgiaoNoite)

fimse

fimpara

fimse

fimse

fimse

fimpara

     ==================================================
      // US4 - VERIFICAR COBERTURA MÍNIMA
      // ==================================================

      se (turno = 1) entao

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

fimalgoritmo
