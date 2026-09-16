Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Antonio Carlos Nicolodi 

Var
opcao_turno:inteiro
turno:caractere


Inicio
    escreval("==== Bem Vindo! ===")
    escreval("==== Escala de Plantões ====")
    
    // ================================
    // US01 - Selecionar Turno
    // ================================
    escreval ("==== Seleção do Turno ====")
    escreval ("1 - Manhã")
    escreval ("2 - tarde")
    Escreval ("3 - Noite")
   Escreva ("Escolha o turno: ")
   Leia (opcao_turno)

   Enquanto (opcao_turno < 1) ou (opcao_turno > 3) faca

      Escreval ("")
      Escreval ("ERRO: opção de turno inválida!")
      Escreval ("Escolha uma das opções:")
      Escreval ("1 - Manhã")
      Escreval ("2 - Tarde")
      Escreval ("3 - Noite")
      Escreva ("Escolha novamente: ")
      Leia (opcao_turno)

   FimEnquanto


Fimalgoritmo