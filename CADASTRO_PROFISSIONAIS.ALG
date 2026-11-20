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

   // >>> SEMANA (estrutura compartilhada - combinar com o grupo) >>>
   // 15 posicoes por profissional (5 dias x 3 turnos).
   // indice = (profissional - 1) * 15 + (dia - 1) * 3 + turno
   // dia: 1=Seg ... 5=Sex | turno: 1=Manha, 2=Tarde, 3=Noite | valor: 1=escalado, 0=livre
   escalaSemana: vetor[1..1500] de inteiro
   // Cobertura minima por especialidade em CADA turno (tabela do Kick-off).
   // 1=Clinica Geral (2), 2=Pediatria (1), 3=Cirurgia (1)
   minimo: vetor[1..3] de inteiro
   dia, indiceSemana: inteiro
   // <<< SEMANA <<<

   // >>> US-20 - variaveis do relatorio semanal >>>
   turnosCobertos, totalPlantoes, maiorCarga, menorCarga: inteiro
   indMaior, indMenor, qtdSobrecarregados: inteiro
   turnoCompleto: logico
   falhasEsp: vetor[1..3] de inteiro
   cargaMed: vetor[1..100] de inteiro
   mediaCarga, percentual: real
   // <<< US-20 <<<

inicio
   quantidade <- 0

   para i de 1 ate 300 faca
      escala[i] <- 0
   fimpara
   para i de 1 ate 9 faca
      demanda[i] <- -1
   fimpara

   // >>> SEMANA - inicializacao >>>
   para i de 1 ate 1500 faca
      escalaSemana[i] <- 0
   fimpara
   minimo[1] <- 2
   minimo[2] <- 1
   minimo[3] <- 1
   // <<< SEMANA <<<

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
      // >>> US-20 - opcao do menu (relatorio semanal) >>>
      escreval("7 - Gerar relatorio semanal")
      // <<< US-20 <<<
      escreval("8 - Sair")
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

      se opcao = 8 entao
         escreval("Encerrando o sistema. Ate logo.")
      fimse

      // =====================================================================
      // >>> US-20 - GERACAO DO RELATORIO SEMANAL (opcao 7) >>>
      // Somente le escalaSemana, nome, crm e especialidade: nao altera
      // cadastros nem escalacoes. Pode ser gerado quantas vezes quiser.
      // =====================================================================
      se opcao = 7 entao
         escreval("")
         escreval("========================================")
         escreval(" RELATORIO SEMANAL DA ESCALA MEDICA")
         escreval("========================================")

         // --- 1) Cobertura: percorre os 15 turnos (5 dias x 3 turnos) ---
         turnosCobertos <- 0
         para j de 1 ate 3 faca
            falhasEsp[j] <- 0
         fimpara

         para dia de 1 ate 5 faca
            para turno de 1 ate 3 faca
               turnoCompleto <- verdadeiro
               para j de 1 ate 3 faca
                  escaladosEsp <- 0
                  para i de 1 ate quantidade faca
                     indiceSemana <- (i - 1) * 15 + (dia - 1) * 3 + turno
                     se (especialidade[i] = j) e (escalaSemana[indiceSemana] = 1) entao
                        escaladosEsp <- escaladosEsp + 1
                     fimse
                  fimpara
                  // cada falta e contada apenas na PROPRIA especialidade
                  se escaladosEsp < minimo[j] entao
                     falhasEsp[j] <- falhasEsp[j] + 1
                     turnoCompleto <- falso
                  fimse
               fimpara
               se turnoCompleto entao
                  turnosCobertos <- turnosCobertos + 1
               fimse
            fimpara
         fimpara

         // divisao por 15 (constante): nunca ha divisao por zero aqui
         percentual <- (turnosCobertos / 15) * 100

         escreval("")
         escreval("--- COBERTURA DA SEMANA ---")
         escreval("Turnos plenamente cobertos: ", turnosCobertos, " de 15")
         escreval("Percentual de turnos plenamente cobertos: ", percentual:5:2, "%")
         se turnosCobertos = 15 entao
            escreval("Situacao: semana PLENAMENTE COBERTA, sem falhas de cobertura.")
         senao
            escreval("Situacao: semana NAO plenamente coberta, existem falhas de cobertura.")
         fimse
         escreval("Falhas por especialidade (turnos abaixo do minimo):")
         escreval("  Clinica Geral: ", falhasEsp[1])
         escreval("  Pediatria: ", falhasEsp[2])
         escreval("  Cirurgia: ", falhasEsp[3])

         // --- 2) Carga dos profissionais (so se houver medicos cadastrados) ---
         escreval("")
         escreval("--- CARGA DE PLANTOES DA EQUIPE ---")
         se quantidade = 0 entao
            escreval("Nao ha profissionais cadastrados: nao e possivel calcular a carga, a media nem a sobrecarga.")
         senao
            totalPlantoes <- 0
            escreval("Plantoes por profissional:")
            para i de 1 ate quantidade faca
               cargaMed[i] <- 0
               para dia de 1 ate 5 faca
                  para turno de 1 ate 3 faca
                     indiceSemana <- (i - 1) * 15 + (dia - 1) * 3 + turno
                     se escalaSemana[indiceSemana] = 1 entao
                        cargaMed[i] <- cargaMed[i] + 1
                     fimse
                  fimpara
               fimpara
               totalPlantoes <- totalPlantoes + cargaMed[i]
               escreval("- ", nome[i], " | CRM: ", crm[i], " | Plantoes: ", cargaMed[i])

               // em empate, prevalece o primeiro profissional encontrado
               se (i = 1) ou (cargaMed[i] > maiorCarga) entao
                  maiorCarga <- cargaMed[i]
                  indMaior <- i
               fimse
               se (i = 1) ou (cargaMed[i] < menorCarga) entao
                  menorCarga <- cargaMed[i]
                  indMenor <- i
               fimse
            fimpara

            // quantidade > 0 garantido pelo "se" acima: sem divisao por zero
            mediaCarga <- totalPlantoes / quantidade

            escreval("")
            escreval("Maior carga - Plantoes: ", maiorCarga, " | ", nome[indMaior], " | CRM: ", crm[indMaior])
            escreval("Menor carga - Plantoes: ", menorCarga, " | ", nome[indMenor], " | CRM: ", crm[indMenor])
            escreval("Carga media da equipe: ", mediaCarga:5:2, " plantoes por medico")

            // --- 3) Sobrecarregados: carga > media + 1 plantao ---
            escreval("")
            escreval("Profissionais sobrecarregados (carga acima da media + 1):")
            qtdSobrecarregados <- 0
            para i de 1 ate quantidade faca
               se cargaMed[i] > mediaCarga + 1 entao
                  qtdSobrecarregados <- qtdSobrecarregados + 1
                  escreval("- ", nome[i], " | CRM: ", crm[i], " | Plantoes: ", cargaMed[i])
               fimse
            fimpara
            se qtdSobrecarregados = 0 entao
               escreval("Nenhum profissional sobrecarregado.")
            fimse
         fimse

         escreval("")
         escreval("Fim do relatorio. Cadastros e escalacoes permanecem inalterados.")
      fimse
      // <<< US-20 <<<

      se (opcao < 1) ou (opcao > 8) entao
         escreval("Opcao invalida. Digite um numero de 1 a 8.")
      fimse
   ate opcao = 8

fimalgoritmo
