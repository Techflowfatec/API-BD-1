algoritmo "Escala_Medica_Sprint3"

var
   quantidade, opcao: inteiro
   i, j, d, t, turno, dia, codigoEsp, confirmacao: inteiro
   indice, indiceDisponibilidade, indiceEscala, indiceDemanda: inteiro
   totalTurno, totalEspecialidade, totalDia, totalSemana: inteiro
   demandaTemporaria: vetor[1..3] de inteiro
   escaladosEsp, disponiveisEsp, faltam: inteiro
   totalCobertos, falhasClinica, falhasPediatria, falhasCirurgia: inteiro
   carga, maiorCarga, menorCarga, totalPlantoes: inteiro
   indiceMaior, indiceMenor: inteiro
   media: real
   podeAlterar, semanaCompleta, encerrar: logico
   crmEntrada, nomeEntrada, resposta: caractere
   nome: vetor[1..100] de caractere
   crm: vetor[1..100] de caractere
   especialidade: vetor[1..100] de inteiro
   // Disponibilidade por turno da semana, igual para os cinco dias.
   disponivel: vetor[1..300] de inteiro
   // Uma posicao por profissional, dia e turno: 100 x 5 x 3.
   escala: vetor[1..1500] de inteiro
   // Demanda minima por dia, turno e especialidade: 5 x 3 x 3.
   demanda: vetor[1..45] de inteiro

inicio
   quantidade <- 0
   encerrar <- falso

   para i de 1 ate 1500 faca
      escala[i] <- 0
   fimpara

   // Demanda padrao por turno: Clinica Geral = 2; Pediatria e Cirurgia = 1.
   // Esta demanda e fixa para todos os dias e turnos da semana.
   para i de 1 ate 45 faca
      demanda[i] <- 1
   fimpara
   para d de 1 ate 5 faca
      para turno de 1 ate 3 faca
         indiceDemanda <- ((d - 1) * 3 + (turno - 1)) * 3 + 1
         demanda[indiceDemanda] <- 2
      fimpara
   fimpara

   repita
      limpatela
      escreval("")
      escreval("+----------------------------------------------------------+")
      escreval("|                 TECHFLOW - ESCALA MEDICA                 |")
      escreval("|           PLANEJAMENTO SEMANAL: SEGUNDA A SEXTA          |")
      escreval("+----------------------------------------------------------+")
      escreval("| CADASTRO E ESCALA                                        |")
      escreval("| [01] Cadastrar profissional                              |")
      escreval("| [02] Consultar profissional                              |")
      escreval("| [03] Listar equipe                                       |")
      escreval("| [04] Escalar profissional (dia/turno)                    |")
      escreval("| [05] Resumo de um dia                                    |")
      escreval("| [06] Remover profissional da escala                      |")
      escreval("| [07] Alterar especialidade/disponibilidade               |")
      escreval("|----------------------------------------------------------|")
      escreval("| ANALISE E RELATORIOS                                     |")
      escreval("| [08] Cobertura semanal                                   |")
      escreval("| [09] Indicadores e relatorio semanal                     |")
      escreval("| [10] Encerrar                                            |")
      escreval("+----------------------------------------------------------+")
      escreval("Demanda fixa por turno: Clinico Geral 2 | Pediatria 1 | Cirurgia 1")
      escreval("Equipe cadastrada: ", quantidade, " profissional(is) | Limite: 100")
      escreva("Escolha uma opcao [1-10]: ")
      leia(opcao)

      se opcao = 1 entao
         escreval("")
         escreval("+---------------- CADASTRO DE PROFISSIONAL ----------------+")
         se quantidade >= 100 entao
            escreval("Limite de 100 profissionais atingido. Cadastro nao realizado.")
         senao
            escreva("Identificador/CRM unico: ")
            leia(crmEntrada)
            se crmEntrada = "" entao
               escreval("[ERRO] o identificador nao pode ficar vazio. Cadastro cancelado.")
            senao
               indice <- 0
               para i de 1 ate quantidade faca
                  se crm[i] = crmEntrada entao
                     indice <- i
                  fimse
               fimpara

               se indice <> 0 entao
                  escreval("[ERRO] esse identificador ja esta cadastrado.")
               senao
                  escreva("Nome completo: ")
                  leia(nomeEntrada)
                  se nomeEntrada = "" entao
                     escreval("[ERRO] o nome nao pode ficar vazio. Cadastro cancelado.")
                  senao
                     escreval("Especialidade: 1 - Clinica Geral | 2 - Pediatria | 3 - Cirurgia")
                     escreva("Codigo da especialidade: ")
                     leia(codigoEsp)
                     enquanto (codigoEsp < 1) ou (codigoEsp > 3) faca
                        escreval("[ERRO] Opcao invalida. Digite 1, 2 ou 3.")
                        escreva("Codigo da especialidade: ")
                        leia(codigoEsp)
                     fimenquanto

                     escreval("Disponibilidade para cada turno da semana:")
                     para t de 1 ate 3 faca
                        se t = 1 entao
                           escreva("Disponivel de manha? (1=Sim, 0=Nao): ")
                        senao
                           se t = 2 entao
                              escreva("Disponivel a tarde? (1=Sim, 0=Nao): ")
                           senao
                              escreva("Disponivel a noite? (1=Sim, 0=Nao): ")
                           fimse
                        fimse
                        leia(confirmacao)
                        enquanto (confirmacao <> 0) e (confirmacao <> 1) faca
                           escreval("[ERRO] Resposta invalida. Digite 1 para Sim ou 0 para Nao.")
                           escreva("Disponibilidade: ")
                           leia(confirmacao)
                        fimenquanto
                        indiceDisponibilidade <- (quantidade * 3) + t
                        disponivel[indiceDisponibilidade] <- confirmacao
                     fimpara

                     quantidade <- quantidade + 1
                     crm[quantidade] <- crmEntrada
                     nome[quantidade] <- nomeEntrada
                     especialidade[quantidade] <- codigoEsp
                     escreval("[OK] Cadastro realizado com sucesso.")
                  fimse
               fimse
            fimse
         fimse
      fimse

      se opcao = 2 entao
         escreval("")
         escreval("+---------------- CONSULTA DE PROFISSIONAL ----------------+")
         escreva("Digite o identificador/CRM: ")
         leia(crmEntrada)
         indice <- 0
         para i de 1 ate quantidade faca
            se crm[i] = crmEntrada entao
               indice <- i
            fimse
         fimpara

         se indice = 0 entao
            escreval("[AVISO] Nenhum profissional encontrado com esse identificador.")
         senao
            escreval("+----------------------------------------------------------+")
            escreval("| FICHA DO PROFISSIONAL                                    |")
            escreval("+----------------------------------------------------------+")
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
            escreval("")
            escreval("DISPONIBILIDADE SEMANAL")
            indiceDisponibilidade <- (indice - 1) * 3 + 1
            se disponivel[indiceDisponibilidade] = 1 entao
               escreval("- Manha: disponivel")
            senao
               escreval("- Manha: indisponivel")
            fimse
            se disponivel[indiceDisponibilidade + 1] = 1 entao
               escreval("- Tarde: disponivel")
            senao
               escreval("- Tarde: indisponivel")
            fimse
            se disponivel[indiceDisponibilidade + 2] = 1 entao
               escreval("- Noite: disponivel")
            senao
               escreval("- Noite: indisponivel")
            fimse
         fimse
      fimse

      se opcao = 3 entao
         escreval("")
         escreval("+--------------------- EQUIPE CADASTRADA ------------------+")
         se quantidade = 0 entao
            escreval("Ainda nao ha profissionais cadastrados. Use a opcao 1 para cadastrar.")
         senao
            para i de 1 ate quantidade faca
               escreval("")
               escreval("+----------------------------------------------------------+")
               escreval("| PROFISSIONAL ", i)
               escreval("+----------------------------------------------------------+")
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
               escreval("")
               escreva("Disponibilidade: ")
               indiceDisponibilidade <- (i - 1) * 3 + 1
               se disponivel[indiceDisponibilidade] = 1 entao
                  escreva("manha ")
               fimse
               se disponivel[indiceDisponibilidade + 1] = 1 entao
                  escreva("tarde ")
               fimse
               se disponivel[indiceDisponibilidade + 2] = 1 entao
                  escreva("noite ")
               fimse
               se (disponivel[indiceDisponibilidade] = 0) e (disponivel[indiceDisponibilidade + 1] = 0) e (disponivel[indiceDisponibilidade + 2] = 0) entao
                  escreva("nenhum turno")
               fimse
               escreval("")
            fimpara
         fimse
      fimse

      se opcao = 4 entao
         escreval("")
         escreval("+-------------------- MONTAR ESCALA SEMANAL --------------+")
         escreval("Selecione o dia: [1] Segunda [2] Terca [3] Quarta [4] Quinta [5] Sexta")
         escreva("Codigo do dia: ")
         leia(dia)
         enquanto (dia < 1) ou (dia > 5) faca
            escreval("[ERRO] Dia invalido. Digite um numero de 1 a 5.")
            escreva("Codigo do dia: ")
            leia(dia)
         fimenquanto

         escreval("Turno: 1-Manha | 2-Tarde | 3-Noite")
         escreva("Codigo do turno: ")
         leia(turno)
         enquanto (turno < 1) ou (turno > 3) faca
            escreval("[ERRO] Turno invalido. Digite um numero de 1 a 3.")
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
            escreval("[ERRO] profissional nao cadastrado. Escala nao alterada.")
         senao
            indiceEscala <- (indice - 1) * 15 + (dia - 1) * 3 + turno
            se escala[indiceEscala] = 1 entao
               escreval("Esse profissional ja esta escalado nesse dia e turno.")
            senao
               indiceDisponibilidade <- (indice - 1) * 3 + turno
               totalDia <- 0
               totalSemana <- 0
               para t de 1 ate 3 faca
                  indiceEscala <- (indice - 1) * 15 + (dia - 1) * 3 + t
                  totalDia <- totalDia + escala[indiceEscala]
               fimpara
               para d de 1 ate 5 faca
                  para t de 1 ate 3 faca
                     indiceEscala <- (indice - 1) * 15 + (d - 1) * 3 + t
                     totalSemana <- totalSemana + escala[indiceEscala]
                  fimpara
               fimpara

               se disponivel[indiceDisponibilidade] = 0 entao
                  escreval("[ERRO] profissional indisponivel nesse turno. Escala nao alterada.")
               senao
                  se totalDia >= 2 entao
                     escreval("[ERRO] limite de dois plantoes no mesmo dia atingido.")
                  senao
                     se totalSemana >= 6 entao
                        escreval("[ERRO] limite semanal de seis plantoes atingido.")
                     senao
                        se (turno = 1) e (dia > 1) entao
                           indiceEscala <- (indice - 1) * 15 + (dia - 2) * 3 + 3
                           se escala[indiceEscala] = 1 entao
                              escreval("[ERRO] descanso obrigatorio. Nao pode trabalhar de manha apos plantao na noite anterior.")
                           senao
                              totalTurno <- 0
                              para i de 1 ate quantidade faca
                                 indiceEscala <- (i - 1) * 15 + (dia - 1) * 3 + turno
                                 totalTurno <- totalTurno + escala[indiceEscala]
                              fimpara
                              se totalTurno >= 4 entao
                                 escreval("[ERRO] o turno ja atingiu o limite de quatro postos.")
                              senao
                                 indiceEscala <- (indice - 1) * 15 + (dia - 1) * 3 + turno
                                 escala[indiceEscala] <- 1
                                 escreval("[OK] Profissional escalado com sucesso.")
                              fimse
                           fimse
                        senao
                           totalTurno <- 0
                           para i de 1 ate quantidade faca
                              indiceEscala <- (i - 1) * 15 + (dia - 1) * 3 + turno
                              totalTurno <- totalTurno + escala[indiceEscala]
                           fimpara
                           se totalTurno >= 4 entao
                              escreval("[ERRO] o turno ja atingiu o limite de quatro postos.")
                           senao
                              indiceEscala <- (indice - 1) * 15 + (dia - 1) * 3 + turno
                              escala[indiceEscala] <- 1
                              escreval("[OK] Profissional escalado com sucesso.")
                           fimse
                        fimse
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse

      se opcao = 5 entao
         escreval("")
         escreval("+------------------------ RESUMO DO DIA -------------------+")
         escreval("Selecione o dia: [1] Segunda [2] Terca [3] Quarta [4] Quinta [5] Sexta")
         escreva("Codigo do dia: ")
         leia(dia)
         enquanto (dia < 1) ou (dia > 5) faca
            escreval("[ERRO] Dia invalido. Digite um numero de 1 a 5.")
            escreva("Codigo do dia: ")
            leia(dia)
         fimenquanto

         escreval("")
         se dia = 1 entao
            escreval("+------------------------ SEGUNDA-FEIRA -------------------+")
         senao
            se dia = 2 entao
               escreval("+--------------------------- TERCA-FEIRA ------------------+")
            senao
               se dia = 3 entao
                  escreval("+--------------------------- QUARTA-FEIRA -----------------+")
               senao
                  se dia = 4 entao
                     escreval("+--------------------------- QUINTA-FEIRA -----------------+")
                  senao
                     escreval("+--------------------------- SEXTA-FEIRA ------------------+")
                  fimse
               fimse
            fimse
         fimse

         para turno de 1 ate 3 faca
            se turno = 1 entao
               escreval("[ TURNO: MANHA ]")
            senao
               se turno = 2 entao
                  escreval("[ TURNO: TARDE ]")
               senao
                  escreval("[ TURNO: NOITE ]")
               fimse
            fimse
            totalTurno <- 0
            para i de 1 ate quantidade faca
               indiceEscala <- (i - 1) * 15 + (dia - 1) * 3 + turno
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
            escreval("  Ocupacao: ", totalTurno, "/4 posto(s)")
            para j de 1 ate 3 faca
               escaladosEsp <- 0
               para i de 1 ate quantidade faca
                  indiceEscala <- (i - 1) * 15 + (dia - 1) * 3 + turno
                  se (escala[indiceEscala] = 1) e (especialidade[i] = j) entao
                     escaladosEsp <- escaladosEsp + 1
                  fimse
               fimpara
               indiceDemanda <- ((dia - 1) * 3 + (turno - 1)) * 3 + j
               se j = 1 entao
                  escreva("  Clinica Geral  | ")
               senao
                  se j = 2 entao
                     escreva("  Pediatria      | ")
                  senao
                     escreva("  Cirurgia       | ")
                  fimse
               fimse
               faltam <- demanda[indiceDemanda] - escaladosEsp
               se faltam < 0 entao
                  faltam <- 0
               fimse
               escreva("Escalados ", escaladosEsp, " | Minimo ", demanda[indiceDemanda])
               se faltam = 0 entao
                  escreval(" | [OK] COBERTURA ATINGIDA")
               senao
                  escreval(" | [PENDENTE] Faltam ", faltam)
               fimse
            fimpara
         fimpara
      fimse

      se opcao = 6 entao
         escreval("")
         escreval("+-------------------- REMOVER DA ESCALA -------------------+")
         escreval("Selecione o dia: [1] Segunda [2] Terca [3] Quarta [4] Quinta [5] Sexta")
         escreva("Codigo do dia: ")
         leia(dia)
         enquanto (dia < 1) ou (dia > 5) faca
            escreval("[ERRO] Dia invalido. Digite um numero de 1 a 5.")
            leia(dia)
         fimenquanto
         escreva("Turno: 1-Manha | 2-Tarde | 3-Noite: ")
         leia(turno)
         enquanto (turno < 1) ou (turno > 3) faca
            escreval("[ERRO] Turno invalido. Digite um numero de 1 a 3.")
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
            escreval("Profissional nao encontrado. Escala mantida sem alteracoes.")
         senao
            indiceEscala <- (indice - 1) * 15 + (dia - 1) * 3 + turno
            se escala[indiceEscala] = 0 entao
               escreval("Esse profissional nao esta escalado nesse dia e turno.")
            senao
               escala[indiceEscala] <- 0
               escreval("[OK] Escalacao removida; posto liberado e cobertura recalculada automaticamente.")
            fimse
         fimse
      fimse

      se opcao = 7 entao
         escreval("")
         escreval("+-------------- ALTERAR DADOS DO PROFISSIONAL -------------+")
         escreva("Identificador/CRM do profissional: ")
         leia(crmEntrada)
         indice <- 0
         para i de 1 ate quantidade faca
            se crm[i] = crmEntrada entao
               indice <- i
            fimse
         fimpara
         se indice = 0 entao
            escreval("Profissional nao encontrado. Cadastro mantido sem alteracoes.")
         senao
            escreval("Nova especialidade: 1 - Clinica Geral | 2 - Pediatria | 3 - Cirurgia")
            escreva("Codigo da especialidade: ")
            leia(codigoEsp)
            enquanto (codigoEsp < 1) ou (codigoEsp > 3) faca
               escreval("[ERRO] Opcao invalida. Digite 1, 2 ou 3.")
               leia(codigoEsp)
            fimenquanto
            para t de 1 ate 3 faca
               se t = 1 entao
                  escreva("Disponivel de manha? (1=Sim, 0=Nao): ")
               senao
                  se t = 2 entao
                     escreva("Disponivel a tarde? (1=Sim, 0=Nao): ")
                  senao
                     escreva("Disponivel a noite? (1=Sim, 0=Nao): ")
                  fimse
               fimse
               leia(demandaTemporaria[t])
               enquanto (demandaTemporaria[t] <> 0) e (demandaTemporaria[t] <> 1) faca
                  escreval("[ERRO] Resposta invalida. Digite 1 para Sim ou 0 para Nao.")
                  leia(demandaTemporaria[t])
               fimenquanto
            fimpara

            podeAlterar <- verdadeiro
            para d de 1 ate 5 faca
               para t de 1 ate 3 faca
                  indiceEscala <- (indice - 1) * 15 + (d - 1) * 3 + t
                  se escala[indiceEscala] = 1 entao
                     se (codigoEsp <> especialidade[indice]) ou (demandaTemporaria[t] = 0) entao
                        podeAlterar <- falso
                     fimse
                  fimse
               fimpara
            fimpara

            se podeAlterar = falso entao
               escreval("Alteracao recusada: conflita com uma escalacao existente. Cadastro e escala permaneceram inalterados.")
            senao
               especialidade[indice] <- codigoEsp
               indiceDisponibilidade <- (indice - 1) * 3
               para t de 1 ate 3 faca
                  disponivel[indiceDisponibilidade + t] <- demandaTemporaria[t]
               fimpara
               escreval("[OK] Especialidade e disponibilidade atualizadas com sucesso.")
            fimse
         fimse
      fimse

      se opcao = 8 entao
         escreval("")
         escreval("+---------------------- COBERTURA SEMANAL -----------------+")
         totalCobertos <- 0
         falhasClinica <- 0
         falhasPediatria <- 0
         falhasCirurgia <- 0
         para d de 1 ate 5 faca
            se d = 1 entao
               escreval("+------------------------ SEGUNDA-FEIRA -------------------+")
            senao
               se d = 2 entao
                  escreval("+--------------------------- TERCA-FEIRA ------------------+")
               senao
                  se d = 3 entao
                     escreval("+--------------------------- QUARTA-FEIRA -----------------+")
                  senao
                     se d = 4 entao
                        escreval("+--------------------------- QUINTA-FEIRA -----------------+")
                     senao
                        escreval("+--------------------------- SEXTA-FEIRA ------------------+")
                     fimse
                  fimse
               fimse
            fimse
            para turno de 1 ate 3 faca
               escreval("")
               se turno = 1 entao
                  escreval("  +-- MANHA -----------------------------------------------+")
               senao
                  se turno = 2 entao
                     escreval("  +-- TARDE -----------------------------------------------+")
                  senao
                     escreval("  +-- NOITE -----------------------------------------------+")
                  fimse
               fimse
               semanaCompleta <- verdadeiro
               para j de 1 ate 3 faca
                  escaladosEsp <- 0
                  para i de 1 ate quantidade faca
                     indiceEscala <- (i - 1) * 15 + (d - 1) * 3 + turno
                     se (escala[indiceEscala] = 1) e (especialidade[i] = j) entao
                        escaladosEsp <- escaladosEsp + 1
                     fimse
                  fimpara
                  indiceDemanda <- ((d - 1) * 3 + (turno - 1)) * 3 + j
                  faltam <- demanda[indiceDemanda] - escaladosEsp
                  se j = 1 entao
                     escreva("     Clinica Geral | ")
                     se faltam > 0 entao
                        falhasClinica <- falhasClinica + 1
                        semanaCompleta <- falso
                        escreval("Escalados ", escaladosEsp, " / Minimo ", demanda[indiceDemanda], " | [FALTA ", faltam, "]")
                     senao
                        escreval("Escalados ", escaladosEsp, " / Minimo ", demanda[indiceDemanda], " | [OK]")
                     fimse
                  senao
                     se j = 2 entao
                        escreva("     Pediatria     | ")
                        se faltam > 0 entao
                           falhasPediatria <- falhasPediatria + 1
                           semanaCompleta <- falso
                           escreval("Escalados ", escaladosEsp, " / Minimo ", demanda[indiceDemanda], " | [FALTA ", faltam, "]")
                        senao
                           escreval("Escalados ", escaladosEsp, " / Minimo ", demanda[indiceDemanda], " | [OK]")
                        fimse
                     senao
                        escreva("     Cirurgia      | ")
                        se faltam > 0 entao
                           falhasCirurgia <- falhasCirurgia + 1
                           semanaCompleta <- falso
                           escreval("Escalados ", escaladosEsp, " / Minimo ", demanda[indiceDemanda], " | [FALTA ", faltam, "]")
                        senao
                           escreval("Escalados ", escaladosEsp, " / Minimo ", demanda[indiceDemanda], " | [OK]")
                        fimse
                     fimse
                  fimse
               fimpara
               se semanaCompleta entao
                  totalCobertos <- totalCobertos + 1
                  escreval("     Situacao: [OK] TURNO COBERTO")
               senao
                  escreval("     Situacao: [ATENCAO] COBERTURA INSUFICIENTE")
               fimse
            fimpara
         fimpara
         escreval("------------------------------------------------------------")
         escreval("RESUMO DA SEMANA: ", totalCobertos, " de 15 turnos plenamente cobertos")
         se totalCobertos = 15 entao
            escreval("A semana esta plenamente coberta.")
         senao
            escreval("A semana NAO esta plenamente coberta.")
         fimse
         escreval("Falhas por especialidade (turnos abaixo do minimo):")
         escreval("  Clinica Geral: ", falhasClinica, " | Pediatria: ", falhasPediatria, " | Cirurgia: ", falhasCirurgia)
      fimse

      se opcao = 9 entao
         escreval("")
         escreval("+=========== INDICADORES E RELATORIO SEMANAL =============+")

         totalCobertos <- 0
         falhasClinica <- 0
         falhasPediatria <- 0
         falhasCirurgia <- 0
         para d de 1 ate 5 faca
            para turno de 1 ate 3 faca
               semanaCompleta <- verdadeiro
               para j de 1 ate 3 faca
                  escaladosEsp <- 0
                  para i de 1 ate quantidade faca
                     indiceEscala <- (i - 1) * 15 + (d - 1) * 3 + turno
                     se (escala[indiceEscala] = 1) e (especialidade[i] = j) entao
                        escaladosEsp <- escaladosEsp + 1
                     fimse
                  fimpara
                  indiceDemanda <- ((d - 1) * 3 + (turno - 1)) * 3 + j
                  se escaladosEsp < demanda[indiceDemanda] entao
                     semanaCompleta <- falso
                     se j = 1 entao
                        falhasClinica <- falhasClinica + 1
                     senao
                        se j = 2 entao
                           falhasPediatria <- falhasPediatria + 1
                        senao
                           falhasCirurgia <- falhasCirurgia + 1
                        fimse
                     fimse
                  fimse
               fimpara
               se semanaCompleta entao
                  totalCobertos <- totalCobertos + 1
               fimse
            fimpara
         fimpara

         media <- 0
         totalPlantoes <- 0
         se quantidade = 0 entao
            escreval("Nao ha profissionais cadastrados; nao e possivel calcular carga ou media da equipe.")
         senao
            maiorCarga <- -1
            menorCarga <- 16
            indiceMaior <- 1
            indiceMenor <- 1
            para i de 1 ate quantidade faca
               carga <- 0
               para d de 1 ate 5 faca
                  para turno de 1 ate 3 faca
                     indiceEscala <- (i - 1) * 15 + (d - 1) * 3 + turno
                     carga <- carga + escala[indiceEscala]
                  fimpara
               fimpara
               totalPlantoes <- totalPlantoes + carga
               se carga > maiorCarga entao
                  maiorCarga <- carga
                  indiceMaior <- i
               fimse
               se carga < menorCarga entao
                  menorCarga <- carga
                  indiceMenor <- i
               fimse
            fimpara
            media <- totalPlantoes / quantidade
         fimse

         escreval("------------------------------------------------------------")
         escreval("COBERTURA: ", totalCobertos, "/15 turnos completos | ", (totalCobertos * 100) / 15, "%")
         se totalCobertos = 15 entao
            escreval("Situacao da semana: PLENAMENTE COBERTA")
         senao
            escreval("Situacao da semana: NAO PLENAMENTE COBERTA")
         fimse
         escreval("FALHAS POR ESPECIALIDADE (turnos abaixo do minimo)")
         escreval("  Clinica Geral: ", falhasClinica, " | Pediatria: ", falhasPediatria, " | Cirurgia: ", falhasCirurgia)

         se quantidade > 0 entao
            escreval("")
            escreval("CARGA SEMANAL POR PROFISSIONAL")
            escreval("------------------------------------------------------------")
            para i de 1 ate quantidade faca
               carga <- 0
               para d de 1 ate 5 faca
                  para turno de 1 ate 3 faca
                     indiceEscala <- (i - 1) * 15 + (d - 1) * 3 + turno
                     carga <- carga + escala[indiceEscala]
                  fimpara
               fimpara
               escreval("- ", nome[i], " | CRM: ", crm[i], " | ", carga, " plantao(oes)")
            fimpara
            escreval("")
            escreval("MAIOR CARGA: ", maiorCarga, " plantao(s)")
            para i de 1 ate quantidade faca
               carga <- 0
               para d de 1 ate 5 faca
                  para turno de 1 ate 3 faca
                     indiceEscala <- (i - 1) * 15 + (d - 1) * 3 + turno
                     carga <- carga + escala[indiceEscala]
                  fimpara
               fimpara
               se carga = maiorCarga entao
                  escreval("- ", nome[i], " | CRM: ", crm[i])
               fimse
            fimpara
            escreval("")
            escreval("MENOR CARGA: ", menorCarga, " plantao(s)")
            para i de 1 ate quantidade faca
               carga <- 0
               para d de 1 ate 5 faca
                  para turno de 1 ate 3 faca
                     indiceEscala <- (i - 1) * 15 + (d - 1) * 3 + turno
                     carga <- carga + escala[indiceEscala]
                  fimpara
               fimpara
               se carga = menorCarga entao
                  escreval("- ", nome[i], " | CRM: ", crm[i])
               fimse
            fimpara
            escreval("")
            escreval("MEDIA DA EQUIPE: ", media, " plantao(s) por profissional")
            escreval("")
            escreval("SOBRECARGA (mais de 1 plantao acima da media):")
            totalTurno <- 0
            para i de 1 ate quantidade faca
               carga <- 0
               para d de 1 ate 5 faca
                  para turno de 1 ate 3 faca
                     indiceEscala <- (i - 1) * 15 + (d - 1) * 3 + turno
                     carga <- carga + escala[indiceEscala]
                  fimpara
               fimpara
               se carga > (media + 1) entao
                  escreval("- ", nome[i], " | CRM: ", crm[i], " | ", carga, " plantao(oes)")
                  totalTurno <- totalTurno + 1
               fimse
            fimpara
            se totalTurno = 0 entao
               escreval("Nenhum profissional sobrecarregado.")
            fimse
         senao
            escreval("Carga por profissional, maior/menor carga e media: sem dados de profissionais.")
         fimse

         se totalPlantoes = 0 entao
            escreval("Ainda nao ha escalacoes registradas na semana.")
         fimse
      fimse

      se opcao = 10 entao
         escreval("")
         escreval("+----------------------------------------------------------+")
         escreval("| ATENCAO: os dados desta execucao nao ficam salvos.       |")
         escreval("| Confira/anote as informacoes antes de encerrar.          |")
         escreval("+----------------------------------------------------------+")
         escreva("Deseja realmente encerrar? (1=Sim, 0=Nao): ")
         leia(confirmacao)
         enquanto (confirmacao <> 0) e (confirmacao <> 1) faca
            escreval("[ERRO] Resposta invalida. Digite 1 para confirmar ou 0 para voltar ao menu.")
            escreva("Deseja encerrar? ")
            leia(confirmacao)
         fimenquanto
         se confirmacao = 1 entao
            encerrar <- verdadeiro
            escreval("Sistema encerrado. Ate logo.")
         senao
            escreval("Encerramento cancelado. Os dados continuam disponiveis nesta execucao.")
         fimse
      fimse

      se (opcao < 1) ou (opcao > 10) entao
         escreval("[ERRO] Opcao invalida. Digite um numero de 1 a 10.")
      fimse

      se encerrar = falso entao
         escreval("")
         escreval("+----------------------------------------------------------+")
         escreval("| Pressione ENTER para voltar ao menu principal            |")
         escreval("+----------------------------------------------------------+")
         leia(resposta)
      fimse
   ate encerrar

fimalgoritmo