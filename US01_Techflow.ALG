algoritmo "Escala_Medica"

var
   quantidade, opcao: inteiro
   i, j, turno, codigoEsp, confirmacao: inteiro
   indice, plantaoNoDia, escaladosEsp, disponiveisEsp: inteiro
   totalTurno, quantidadeNecessaria: inteiro
   indiceDisponibilidade, indiceEscala, indiceDemanda: inteiro
   podePublicar: logico
   crmEntrada, nomeEntrada: caractere
   nome: vetor[1..100] de caractere
   crm: vetor[1..100] de caractere
   especialidade: vetor[1..100] de inteiro
   // Tres disponibilidades consecutivas por profissional.
   disponivel: vetor[1..300] de inteiro
   // Tres turnos do proximo dia por profissional.
   escala: vetor[1..300] de inteiro
   // Tres especialidades para cada um dos tres turnos.
   demanda: vetor[1..9] de inteiro

inicio
   quantidade <- 0

   para i de 1 ate 300 faca
      escala[i] <- 0
   fimpara
   para i de 1 ate 9 faca
      demanda[i] <- -1
   fimpara

   repita
      escreval("")
      escreval("========================================")
      escreval(" SISTEMA DE ESCALA MEDICA - COORDENACAO")
      escreval("========================================")
      escreval("1 - Cadastrar profissional")
      escreval("2 - Consultar profissional")
      escreval("3 - Listar profissionais cadastrados")
      escreval("4 - Escalar profissional para o proximo dia")
      escreval("5 - Ver resumo da escala do proximo dia")
      escreval("6 - Analisar cobertura e possibilidade de publicacao")
      escreval("7 - Sair")
      escreva("Digite uma opcao: ")
      leia(opcao)

      se opcao = 1 entao
         escreval("")
         escreval("--- CADASTRO DE PROFISSIONAL ---")
         se quantidade >= 100 entao
            escreval("Limite de 100 profissionais atingido. Cadastro nao realizado.")
         senao
            escreva("Identificador/CRM unico: ")
            leia(crmEntrada)
            se crmEntrada = "" entao
               escreval("Erro: o identificador nao pode ficar vazio. Cadastro cancelado.")
            senao
               indice <- 0
               para i de 1 ate quantidade faca
                  se crm[i] = crmEntrada entao
                     indice <- i
                  fimse
               fimpara

               se indice <> 0 entao
                  escreval("Erro: esse identificador ja esta cadastrado.")
                  escreval("Nenhum cadastro duplicado foi criado.")
               senao
                  escreva("Nome completo: ")
                  leia(nomeEntrada)
                  se nomeEntrada = "" entao
                     escreval("Erro: o nome nao pode ficar vazio. Cadastro cancelado.")
                  senao
                     escreval("Especialidade:")
                     escreval("1 - Clinica Geral")
                     escreval("2 - Pediatria")
                     escreval("3 - Cirurgia")
                     escreva("Codigo da especialidade: ")
                     leia(codigoEsp)
                     enquanto (codigoEsp < 1) ou (codigoEsp > 3) faca
                        escreval("Opcao invalida. Digite 1, 2 ou 3.")
                        escreva("Codigo da especialidade: ")
                        leia(codigoEsp)
                     fimenquanto

                     escreval("Informe a disponibilidade para o proximo dia.")
                     para j de 1 ate 3 faca
                        se j = 1 entao
                           escreva("Disponivel de manha? (1=Sim, 0=Nao): ")
                        senao
                           se j = 2 entao
                              escreva("Disponivel a tarde? (1=Sim, 0=Nao): ")
                           senao
                              escreva("Disponivel a noite? (1=Sim, 0=Nao): ")
                           fimse
                        fimse
                        leia(confirmacao)
                        enquanto (confirmacao <> 0) e (confirmacao <> 1) faca
                           escreval("Resposta invalida. Digite 1 para Sim ou 0 para Nao.")
                           escreva("Disponibilidade: ")
                           leia(confirmacao)
                        fimenquanto
                        indiceDisponibilidade <- (quantidade * 3) + j
                        disponivel[indiceDisponibilidade] <- confirmacao
                     fimpara

                     quantidade <- quantidade + 1
                     crm[quantidade] <- crmEntrada
                     nome[quantidade] <- nomeEntrada
                     especialidade[quantidade] <- codigoEsp
                     escreval("Cadastro realizado com sucesso.")
                  fimse
               fimse
            fimse
         fimse
      fimse

      se opcao = 2 entao
         escreval("")
         escreval("--- CONSULTA DE PROFISSIONAL ---")
         escreva("Digite o identificador/CRM: ")
         leia(crmEntrada)
         indice <- 0
         para i de 1 ate quantidade faca
            se crm[i] = crmEntrada entao
               indice <- i
            fimse
         fimpara

         se indice = 0 entao
            escreval("Nenhum profissional encontrado com esse identificador.")
            escreval("Confira o dado e tente novamente pelo menu.")
         senao
            escreval("Nome: ", nome[indice])
            escreval("Identificador/CRM: ", crm[indice])
            escreva("Especialidade: ")
            se especialidade[indice] = 1 entao
               escreval("Clinica Geral")
            senao
               se especialidade[indice] = 2 entao
                  escreval("Pediatria")
               senao
                  escreval("Cirurgia")
               fimse
            fimse
            escreval("Disponibilidade para o proximo dia:")
            indiceDisponibilidade <- (indice - 1) * 3 + 1
            se disponivel[indiceDisponibilidade] = 1 entao
               escreval("- Manha: disponivel")
            senao
               escreval("- Manha: indisponivel")
            fimse
            indiceDisponibilidade <- (indice - 1) * 3 + 2
            se disponivel[indiceDisponibilidade] = 1 entao
               escreval("- Tarde: disponivel")
            senao
               escreval("- Tarde: indisponivel")
            fimse
            indiceDisponibilidade <- (indice - 1) * 3 + 3
            se disponivel[indiceDisponibilidade] = 1 entao
               escreval("- Noite: disponivel")
            senao
               escreval("- Noite: indisponivel")
            fimse
         fimse
      fimse

      se opcao = 3 entao
         escreval("")
         escreval("--- PROFISSIONAIS CADASTRADOS ---")
         se quantidade = 0 entao
            escreval("Ainda nao ha profissionais cadastrados.")
         senao
            para i de 1 ate quantidade faca
               escreval("")
               escreval("Profissional ", i)
               escreval("Nome: ", nome[i])
               escreval("Identificador/CRM: ", crm[i])
               escreva("Especialidade: ")
               se especialidade[i] = 1 entao
                  escreval("Clinica Geral")
               senao
                  se especialidade[i] = 2 entao
                     escreval("Pediatria")
                  senao
                     escreval("Cirurgia")
                  fimse
               fimse
               escreva("Turnos disponiveis no proximo dia: ")
               indiceDisponibilidade <- (i - 1) * 3 + 1
               se disponivel[indiceDisponibilidade] = 1 entao
                  escreva("manha ")
               fimse
               indiceDisponibilidade <- (i - 1) * 3 + 2
               se disponivel[indiceDisponibilidade] = 1 entao
                  escreva("tarde ")
               fimse
               indiceDisponibilidade <- (i - 1) * 3 + 3
               se disponivel[indiceDisponibilidade] = 1 entao
                  escreva("noite ")
               fimse
               indiceDisponibilidade <- (i - 1) * 3 + 1
               se (disponivel[indiceDisponibilidade] = 0) e (disponivel[indiceDisponibilidade + 1] = 0) e (disponivel[indiceDisponibilidade + 2] = 0) entao
                  escreva("nenhum")
               fimse
               escreval("")
            fimpara
         fimse
      fimse

      se opcao = 4 entao
         escreval("")
         escreval("--- ESCALAR PROFISSIONAL PARA O PROXIMO DIA ---")
         escreval("Turno: 1 - Manha | 2 - Tarde | 3 - Noite")
         escreva("Codigo do turno: ")
         leia(turno)
         enquanto (turno < 1) ou (turno > 3) faca
            escreval("Turno invalido. Digite 1, 2 ou 3.")
            escreva("Codigo do turno: ")
            leia(turno)
         fimenquanto

         escreva("Identificador/CRM do profissional: ")
         leia(crmEntrada)
         indice <- 0
         para i de 1 ate quantidade faca
            se crm[i] = crmEntrada entao
               indice <- i
            fimse
         fimpara

         se indice = 0 entao
            escreval("Erro: profissional nao cadastrado. A escala nao foi alterada.")
         senao
            indiceEscala <- (indice - 1) * 3 + turno
            se escala[indiceEscala] = 1 entao
               escreval("Esse profissional ja esta escalado nesse turno do proximo dia.")
            senao
               escreval("Especialidade requerida para este plantao:")
               escreval("1 - Clinica Geral | 2 - Pediatria | 3 - Cirurgia")
               escreva("Codigo da especialidade requerida: ")
               leia(codigoEsp)
               enquanto (codigoEsp < 1) ou (codigoEsp > 3) faca
                  escreval("Opcao invalida. Digite 1, 2 ou 3.")
                  escreva("Codigo da especialidade requerida: ")
                  leia(codigoEsp)
               fimenquanto

               se especialidade[indice] <> codigoEsp entao
                  escreval("Erro: a especialidade do profissional nao corresponde ao plantao.")
                  escreval("A atribuicao foi recusada e a escala permaneceu inalterada.")
               senao
                  indiceDisponibilidade <- (indice - 1) * 3 + turno
                  se disponivel[indiceDisponibilidade] = 0 entao
                     escreval("Erro: profissional indisponivel nesse turno. Escala nao alterada.")
                  senao
                     indiceEscala <- (indice - 1) * 3 + 1
                     plantaoNoDia <- escala[indiceEscala] + escala[indiceEscala + 1] + escala[indiceEscala + 2]
                     se plantaoNoDia >= 2 entao
                        escreval("Erro: limite de dois plantoes no proximo dia atingido.")
                        escreval("A atribuicao foi recusada e a escala permaneceu inalterada.")
                     senao
                        indiceEscala <- (indice - 1) * 3 + turno
                        escala[indiceEscala] <- 1
                        escreval("Profissional escalado com sucesso para o proximo dia.")
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse

      se opcao = 5 entao
         escreval("")
         escreval("--- RESUMO DA ESCALA DO PROXIMO DIA ---")
         para turno de 1 ate 3 faca
            se turno = 1 entao
               escreval("")
               escreval("MANHA")
            senao
               se turno = 2 entao
                  escreval("")
                  escreval("TARDE")
               senao
                  escreval("")
                  escreval("NOITE")
               fimse
            fimse

            totalTurno <- 0
            para i de 1 ate quantidade faca
               indiceEscala <- (i - 1) * 3 + turno
               se escala[indiceEscala] = 1 entao
                  totalTurno <- totalTurno + 1
                  escreva("- ", nome[i], " | CRM: ", crm[i], " | ")
                  se especialidade[i] = 1 entao
                     escreval("Clinica Geral")
                  senao
                     se especialidade[i] = 2 entao
                        escreval("Pediatria")
                     senao
                        escreval("Cirurgia")
                     fimse
                  fimse
               fimse
            fimpara
            se totalTurno = 0 entao
               escreval("Nenhum profissional escalado neste turno.")
            senao
               escreval("Total escalado no turno: ", totalTurno)
            fimse

            para j de 1 ate 3 faca
               escaladosEsp <- 0
               para i de 1 ate quantidade faca
                  indiceEscala <- (i - 1) * 3 + turno
                  se (escala[indiceEscala] = 1) e (especialidade[i] = j) entao
                     escaladosEsp <- escaladosEsp + 1
                  fimse
               fimpara
               se j = 1 entao
                  escreva("  Clinica Geral: ")
               senao
                  se j = 2 entao
                     escreva("  Pediatria: ")
                  senao
                     escreva("  Cirurgia: ")
                  fimse
               fimse
               escreva(escaladosEsp, " escalado(s)")
               indiceDemanda <- (turno - 1) * 3 + j
               se demanda[indiceDemanda] >= 0 entao
                  escreva("; minimo necessario: ", demanda[indiceDemanda])
                  se escaladosEsp >= demanda[indiceDemanda] entao
                     escreval("; cobertura atingida")
                  senao
                     escreval("; cobertura insuficiente")
                  fimse
               senao
                  escreval("; demanda ainda nao informada")
               fimse
            fimpara
         fimpara
      fimse

      se opcao = 6 entao
         escreval("")
         escreval("--- ANALISE DE COBERTURA E PUBLICACAO ---")
         escreval("Analise para o proximo dia.")
         escreval("Turno: 1 - Manha | 2 - Tarde | 3 - Noite")
         escreva("Codigo do turno a analisar: ")
         leia(turno)
         enquanto (turno < 1) ou (turno > 3) faca
            escreval("Turno invalido. Digite 1, 2 ou 3.")
            escreva("Codigo do turno: ")
            leia(turno)
         fimenquanto

         escreval("Informe o numero MINIMO necessario para cada especialidade (0 a 100).")
         para j de 1 ate 3 faca
            se j = 1 entao
               escreva("Quantidade de Clinica Geral: ")
            senao
               se j = 2 entao
                  escreva("Quantidade de Pediatria: ")
               senao
                  escreva("Quantidade de Cirurgia: ")
               fimse
            fimse
            leia(quantidadeNecessaria)
            enquanto (quantidadeNecessaria < 0) ou (quantidadeNecessaria > 100) faca
               escreval("Quantidade invalida. Digite um numero de 0 a 100.")
               escreva("Quantidade necessaria: ")
               leia(quantidadeNecessaria)
            fimenquanto
            indiceDemanda <- (turno - 1) * 3 + j
            demanda[indiceDemanda] <- quantidadeNecessaria
         fimpara

         podePublicar <- verdadeiro
         escreval("")
         escreval("Resultado da analise para o proximo dia, turno ", turno, ":")
         para j de 1 ate 3 faca
            disponiveisEsp <- 0
            escaladosEsp <- 0
            para i de 1 ate quantidade faca
               indiceDisponibilidade <- (i - 1) * 3 + turno
               se (especialidade[i] = j) e (disponivel[indiceDisponibilidade] = 1) entao
                  disponiveisEsp <- disponiveisEsp + 1
               fimse
               indiceEscala <- (i - 1) * 3 + turno
               se (especialidade[i] = j) e (escala[indiceEscala] = 1) entao
                  escaladosEsp <- escaladosEsp + 1
               fimse
            fimpara

            se j = 1 entao
               escreva("Clinica Geral")
            senao
               se j = 2 entao
                  escreva("Pediatria")
               senao
                  escreva("Cirurgia")
               fimse
            fimse
            indiceDemanda <- (turno - 1) * 3 + j
            escreval(": necessario ", demanda[indiceDemanda], ", disponiveis ", disponiveisEsp, ", escalados ", escaladosEsp)

            se disponiveisEsp < demanda[indiceDemanda] entao
               podePublicar <- falso
               escreval("  Falta de profissionais disponiveis nesta especialidade.")
            fimse
            se escaladosEsp < demanda[indiceDemanda] entao
               podePublicar <- falso
               escreval("  O minimo ainda nao foi preenchido na escala.")
            fimse
         fimpara

         se podePublicar entao
            escreval("RESULTADO: o turno atende aos minimos e PODE ser publicado.")
         senao
            escreval("RESULTADO: o turno NAO pode ser publicado; corrija a cobertura e analise novamente.")
         fimse
      fimse

      se opcao = 7 entao
         escreval("Encerrando o sistema. Ate logo.")
      fimse

      se (opcao < 1) ou (opcao > 7) entao
         escreval("Opcao invalida. Digite um numero de 1 a 7.")
      fimse
   ate opcao = 7

fimalgoritmo
