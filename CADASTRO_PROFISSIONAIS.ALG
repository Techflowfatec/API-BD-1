algoritmo "Escala_Medica"

var
   quantidade, opcao: inteiro
   i, j, turno, codigoEsp, confirmacao: inteiro
   indice, plantaoNoDia, escaladosEsp, disponiveisEsp: inteiro
   totalTurno, quantidadeNecessaria: inteiro
   indiceDisponibilidade, indiceEscala, indiceDemanda: inteiro
   podePublicar: logico
    dia, diaLoop, turnoLoop, espLoop, baseEscala, contagem: inteiro
   alterarDisp, alterarEsp, qtdEscalacoes, cobertos: inteiro
   conflito, turnoOk: logico
   percentual: real
   novaDisp: vetor[1..3] de inteiro
   falhaEsp: vetor[1..3] de inteiro
   minimo: vetor[1..3] de inteiro
   crmEntrada, nomeEntrada: caractere
   nome: vetor[1..100] de caractere
   crm: vetor[1..100] de caractere
   especialidade: vetor[1..100] de inteiro
   disponivel: vetor[1..300] de inteiro
   escala: vetor[1..1500] de inteiro
   demanda: vetor[1..9] de inteiro

inicio
   quantidade <- 0

   minimo[1] <- 2
   minimo[2] <- 1
   minimo[3] <- 1

   para i de 1 ate 1500 faca
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
      escreval("4 - Escalar profissional (dia e turno)")
      escreval("5 - Ver resumo da escala de um dia")
      escreval("6 - Analisar cobertura e possibilidade de publicacao")
      escreval("7 - Remover profissional da escala")
      escreval("8 - Alterar disponibilidade/especialidade de profissional")
      escreval("9 - Indicadores de cobertura da semana")
      escreval("10 - Sair")
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
         escreval("--- ESCALAR PROFISSIONAL NA SEMANA ---")
         escreval("Dia: 1 - Segunda | 2 - Terca | 3 - Quarta | 4 - Quinta | 5 - Sexta")
         escreva("Codigo do dia: ")
         leia(dia)
         enquanto (dia < 1) ou (dia > 5) faca
            escreval("Dia invalido. Digite de 1 a 5.")
            escreva("Codigo do dia: ")
            leia(dia)
         fimenquanto
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
            indiceEscala <- (dia - 1) * 300 + (indice - 1) * 3 + turno
            se escala[indiceEscala] = 1 entao
               escreval("Esse profissional ja esta escalado nesse dia e turno.")
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
                     baseEscala <- (dia - 1) * 300 + (indice - 1) * 3 + 1
                     plantaoNoDia <- escala[baseEscala] + escala[baseEscala + 1] + escala[baseEscala + 2]
                     se plantaoNoDia >= 2 entao
                        escreval("Erro: limite de dois plantoes no dia atingido.")
                        escreval("A atribuicao foi recusada e a escala permaneceu inalterada.")
                     senao
                        escala[indiceEscala] <- 1
                        escreval("Profissional escalado com sucesso.")
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse

      se opcao = 5 entao
         escreval("")
         escreval("--- RESUMO DA ESCALA DO DIA ---")
         escreval("Dia: 1 - Segunda | 2 - Terca | 3 - Quarta | 4 - Quinta | 5 - Sexta")
         escreva("Codigo do dia: ")
         leia(dia)
         enquanto (dia < 1) ou (dia > 5) faca
            escreval("Dia invalido. Digite de 1 a 5.")
            escreva("Codigo do dia: ")
            leia(dia)
         fimenquanto
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
               indiceEscala <- (dia - 1) * 300 + (i - 1) * 3 + turno
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
                  indiceEscala <- (dia - 1) * 300 + (i - 1) * 3 + turno
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
         escreval("Dia: 1 - Segunda | 2 - Terca | 3 - Quarta | 4 - Quinta | 5 - Sexta")
         escreva("Codigo do dia a analisar: ")
         leia(dia)
         enquanto (dia < 1) ou (dia > 5) faca
            escreval("Dia invalido. Digite de 1 a 5.")
            escreva("Codigo do dia: ")
            leia(dia)
         fimenquanto
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
         escreval("Resultado da analise para o dia ", dia, ", turno ", turno, ":")
         para j de 1 ate 3 faca
            disponiveisEsp <- 0
            escaladosEsp <- 0
            para i de 1 ate quantidade faca
               indiceDisponibilidade <- (i - 1) * 3 + turno
               se (especialidade[i] = j) e (disponivel[indiceDisponibilidade] = 1) entao
                  disponiveisEsp <- disponiveisEsp + 1
               fimse
               indiceEscala <- (dia - 1) * 300 + (i - 1) * 3 + turno
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
         escreval("")
         escreval("--- REMOVER PROFISSIONAL DA ESCALA ---")
         escreval("Dia: 1 - Segunda | 2 - Terca | 3 - Quarta | 4 - Quinta | 5 - Sexta")
         escreva("Codigo do dia: ")
         leia(dia)
         enquanto (dia < 1) ou (dia > 5) faca
            escreval("Dia invalido. Digite de 1 a 5.")
            escreva("Codigo do dia: ")
            leia(dia)
         fimenquanto
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
            indiceEscala <- (dia - 1) * 300 + (indice - 1) * 3 + turno
            se escala[indiceEscala] = 0 entao
               escreval("Erro: esse profissional nao esta escalado nesse dia e turno. A escala nao foi alterada.")
            senao
               escala[indiceEscala] <- 0
               escreval("Profissional removido da escala (dia ", dia, ", turno ", turno, "). Posto liberado.")
               baseEscala <- (dia - 1) * 300 + (indice - 1) * 3 + 1
               plantaoNoDia <- escala[baseEscala] + escala[baseEscala + 1] + escala[baseEscala + 2]
               escreval("Plantoes restantes desse profissional no dia: ", plantaoNoDia)
               escreval("Cobertura recalculada do turno:")
               para espLoop de 1 ate 3 faca
                  contagem <- 0
                  para i de 1 ate quantidade faca
                     indiceEscala <- (dia - 1) * 300 + (i - 1) * 3 + turno
                     se (escala[indiceEscala] = 1) e (especialidade[i] = espLoop) entao
                        contagem <- contagem + 1
                     fimse
                  fimpara
                  se espLoop = 1 entao
                     escreva("  Clinica Geral: ")
                  senao
                     se espLoop = 2 entao
                        escreva("  Pediatria: ")
                     senao
                        escreva("  Cirurgia: ")
                     fimse
                  fimse
                  escreva(contagem, " escalado(s); minimo ", minimo[espLoop])
                  se contagem >= minimo[espLoop] entao
                     escreval("; cobertura atingida")
                  senao
                     escreval("; faltam ", minimo[espLoop] - contagem)
                  fimse
               fimpara
            fimse
         fimse
      fimse

      se opcao = 8 entao
         escreval("")
         escreval("--- ALTERAR CADASTRO DE PROFISSIONAL ---")
         escreva("Identificador/CRM do profissional: ")
         leia(crmEntrada)
         indice <- 0
         para i de 1 ate quantidade faca
            se crm[i] = crmEntrada entao
               indice <- i
            fimse
         fimpara

         se indice = 0 entao
            escreval("Erro: profissional nao cadastrado. O cadastro nao foi alterado.")
         senao
            escreva("Alterar a disponibilidade? (1=Sim, 0=Nao): ")
            leia(alterarDisp)
            enquanto (alterarDisp <> 0) e (alterarDisp <> 1) faca
               escreval("Resposta invalida. Digite 1 para Sim ou 0 para Nao.")
               escreva("Alterar a disponibilidade? (1=Sim, 0=Nao): ")
               leia(alterarDisp)
            fimenquanto
            escreva("Alterar a especialidade? (1=Sim, 0=Nao): ")
            leia(alterarEsp)
            enquanto (alterarEsp <> 0) e (alterarEsp <> 1) faca
               escreval("Resposta invalida. Digite 1 para Sim ou 0 para Nao.")
               escreva("Alterar a especialidade? (1=Sim, 0=Nao): ")
               leia(alterarEsp)
            fimenquanto

            se (alterarDisp = 0) e (alterarEsp = 0) entao
               escreval("Nenhuma alteracao solicitada. Cadastro mantido.")
            senao
               se alterarDisp = 1 entao
                  escreval("Informe a NOVA disponibilidade (vale para todos os dias).")
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
                     novaDisp[j] <- confirmacao
                  fimpara
               fimse

               se alterarEsp = 1 entao
                  escreval("Nova especialidade:")
                  escreval("1 - Clinica Geral | 2 - Pediatria | 3 - Cirurgia")
                  escreva("Codigo da especialidade: ")
                  leia(codigoEsp)
                  enquanto (codigoEsp < 1) ou (codigoEsp > 3) faca
                     escreval("Opcao invalida. Digite 1, 2 ou 3.")
                     escreva("Codigo da especialidade: ")
                     leia(codigoEsp)
                  fimenquanto
               fimse

               conflito <- falso
               qtdEscalacoes <- 0
               para diaLoop de 1 ate 5 faca
                  para j de 1 ate 3 faca
                     indiceEscala <- (diaLoop - 1) * 300 + (indice - 1) * 3 + j
                     se escala[indiceEscala] = 1 entao
                        qtdEscalacoes <- qtdEscalacoes + 1
                        se (alterarDisp = 1) e (novaDisp[j] = 0) entao
                           conflito <- verdadeiro
                           escreval("Conflito: o profissional ja esta escalado no dia ", diaLoop, ", turno ", j, ". Remova-o da escala antes de retirar essa disponibilidade.")
                        fimse
                     fimse
                  fimpara
               fimpara
               se (alterarEsp = 1) e (codigoEsp <> especialidade[indice]) e (qtdEscalacoes > 0) entao
                  conflito <- verdadeiro
                  escreval("Conflito: o profissional possui ", qtdEscalacoes, " escalacao(oes) na especialidade atual. Remova-as antes de trocar a especialidade.")
               fimse

               se conflito entao
                  escreval("Alteracao recusada. Escala e cadastro permaneceram exatamente como estavam.")
               senao
                  se alterarDisp = 1 entao
                     para j de 1 ate 3 faca
                        indiceDisponibilidade <- (indice - 1) * 3 + j
                        disponivel[indiceDisponibilidade] <- novaDisp[j]
                     fimpara
                  fimse
                  se alterarEsp = 1 entao
                     especialidade[indice] <- codigoEsp
                  fimse
                  escreval("Cadastro atualizado com sucesso. A escala foi mantida.")
               fimse
            fimse
         fimse
      fimse

      se opcao = 9 entao
         escreval("")
         escreval("--- INDICADORES DE COBERTURA DA SEMANA ---")
         escreval("Minimo por turno: Clinica Geral ", minimo[1], ", Pediatria ", minimo[2], ", Cirurgia ", minimo[3])
         cobertos <- 0
         para j de 1 ate 3 faca
            falhaEsp[j] <- 0
         fimpara

         para diaLoop de 1 ate 5 faca
            para turnoLoop de 1 ate 3 faca
               turnoOk <- verdadeiro
               para espLoop de 1 ate 3 faca
                  contagem <- 0
                  para i de 1 ate quantidade faca
                     indiceEscala <- (diaLoop - 1) * 300 + (i - 1) * 3 + turnoLoop
                     se (escala[indiceEscala] = 1) e (especialidade[i] = espLoop) entao
                        contagem <- contagem + 1
                     fimse
                  fimpara
                  se contagem < minimo[espLoop] entao
                     falhaEsp[espLoop] <- falhaEsp[espLoop] + 1
                     turnoOk <- falso
                  fimse
               fimpara
               se turnoOk entao
                  cobertos <- cobertos + 1
               fimse
            fimpara
         fimpara

         percentual <- cobertos * 100 / 15
         escreval("")
         escreval("Turnos plenamente cobertos: ", cobertos, " de 15")
         escreval("Percentual de turnos plenamente cobertos: ", percentual:6:1, "%")
         se cobertos = 15 entao
            escreval("Semana plenamente coberta: SIM")
         senao
            escreval("Semana plenamente coberta: NAO")
         fimse
         escreval("Falhas de cobertura por especialidade (turnos abaixo do minimo):")
         escreval("  Clinica Geral: ", falhaEsp[1])
         escreval("  Pediatria: ", falhaEsp[2])
         escreval("  Cirurgia: ", falhaEsp[3])
      fimse

      se opcao = 10 entao
         escreval("Encerrando o sistema. Ate logo.")
      fimse

      se (opcao < 1) ou (opcao > 10) entao
         escreval("Opcao invalida. Digite um numero de 1 a 10.")
      fimse
   ate opcao = 10

fimalgoritmo