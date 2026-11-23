Algoritmo "HospitalSantaAurora_EscalaSemanal"

Var
   // Controle de menu e fluxo
   opcaoMenu, i, diaAtual : inteiro
   sairSistema : logico
   confirmacaoSaida : caractere

   // Modo leitura de opcoes via arquivo-texto de entrada
   qtdComandosArquivo, idxComando, opcaoArquivo : inteiro
   usarModoArquivo : caractere

   // Controle de turnos diarios
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

   // Regras e limites de escala
   LIMITE_SEMANAL, LIMITE_DIARIO : inteiro
   idMedico, turnoEscala, postoEscala : inteiro
   continuarEscala, flagNoiteAnterior : caractere
   medicoCadastrado, medicoDisponivel, especialidadeCompativel, medicoOcupadoTurno : logico

   // Dados por medico (IDs de 1 a 50)
   plantoesDia : vetor[1..50] de inteiro
   plantoesSemana : vetor[1..50] de inteiro
   trabalhouNoiteAnterior : vetor[1..50] de logico
   jaEscaladoNoTurno : vetor[1..50, 1..3] de logico

   // Indicadores gerenciais e exportacao
   totalEscalacoesValidas, totalRecusas : inteiro
   recusasLimiteSemanal, recusasFaltaDescanso, recusasLimiteDiario, recusasOutras : inteiro
   totalMedicosTurnos, totalFaltasGeral : inteiro
   logEscalas, logExportacao : caractere

Inicio

   // ==================================================
   // INICIALIZACAO GERAL DO SISTEMA
   // ==================================================
   LIMITE_SEMANAL <- 6 // Sugestao inicial (validar com o cliente)
   LIMITE_DIARIO <- 2
   diaAtual <- 1

   sairSistema <- falso
   totalEscalacoesValidas <- 0
   totalRecusas <- 0
   recusasLimiteSemanal <- 0
   recusasFaltaDescanso <- 0
   recusasLimiteDiario <- 0
   recusasOutras <- 0
   logEscalas <- ""
   logExportacao <- "Nenhuma exportacao gerada ate o momento."

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

   para i de 1 ate 50 faca
      plantoesDia[i] <- 0
      plantoesSemana[i] <- 0
      trabalhouNoiteAnterior[i] <- falso
      jaEscaladoNoTurno[i, 1] <- falso
      jaEscaladoNoTurno[i, 2] <- falso
      jaEscaladoNoTurno[i, 3] <- falso
   fimpara


   // ==================================================
   // LOOP PRINCIPAL DO MENU (RETORNA APOS CADA ACAO)
   // ==================================================
   enquanto nao sairSistema faca

      escreval("")
      escreval("==================================================")
      escreval("           HOSPITAL SANTA AURORA")
      escreval("         MENU PRINCIPAL - GESTAO DE ESCALA")
      escreval("==================================================")
      escreval("1 - Configurar turnos, cobertura minima e publicacao")
      escreval("2 - Atribuir medico a um turno")
      escreval("3 - Visualizar cobertura semanal")
      escreval("4 - Consultar indicadores gerenciais da equipe")
      escreval("5 - Gerar relatorio semanal")
      escreval("6 - Exportar dados dos medicos e das escalacoes")
      escreval("7 - Ler opcoes do menu via arquivo-texto de entrada")
      escreval("0 - Encerrar sistema")
      escreval("==================================================")
      escreval("Escolha uma opcao:")
      leia(opcaoMenu)

      // Validacao da opcao do menu principal
      enquanto (opcaoMenu < 0) ou (opcaoMenu > 7) faca
         escreval("ERRO: Opcao invalida! Digite um numero entre 0 e 7:")
         leia(opcaoMenu)
      fimenquanto


      // ==================================================
      // OPCAO 7: LEITURA DE OPCOES VIA ARQUIVO-TEXTO DE ENTRADA
      // ==================================================
      // Nota: Em Visualg puro, a leitura de arquivo externo e simulada
      // pela entrada sequencial das linhas/opcoes do arquivo-texto.
      se opcaoMenu = 7 entao
         escreval("")
         escreval("--------------------------------------------------")
         escreval("   LEITURA DE OPCOES VIA ARQUIVO-TEXTO DE ENTRADA")
         escreval("--------------------------------------------------")
         escreval("Informe quantas opcoes constam no arquivo-texto (1 a 20):")
         leia(qtdComandosArquivo)

         enquanto (qtdComandosArquivo < 1) ou (qtdComandosArquivo > 20) faca
            escreval("Quantidade invalida! Digite um valor entre 1 e 20:")
            leia(qtdComandosArquivo)
         fimenquanto

         para idxComando de 1 ate qtdComandosArquivo faca
            escreval("Linha ", idxComando, " do arquivo (opcao do menu 1..6 ou 0):")
            leia(opcaoArquivo)

            se (opcaoArquivo >= 0) e (opcaoArquivo <= 6) entao
               escreval("Arquivo-texto -> Executando opcao ", opcaoArquivo, "...")
               opcaoMenu <- opcaoArquivo
            senao
               escreval("AVISO: Opcao ", opcaoArquivo, " lida no arquivo e invalida e sera ignorada.")
               opcaoMenu <- -1
            fimse

            // Executa a opcao valida lida do arquivo-texto
            // ----------------------------------------------
            se opcaoMenu = 1 entao
               manha <- 0
               tarde <- 0
               noite <- 0
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
                              escreval("ERRO: turno da noite ja foi escolhido! Digite outro:")
                           fimse
                        fimse
                     fimse
                     leia(turno)
                  fimenquanto

                  se turno = 1 entao
                     manha <- 1
                     escreval("Digite a quantidade de Clinicos Gerais (Manha):")
                     leia(clinicoManha)
                     enquanto (clinicoManha < 0) ou (clinicoManha > 10) faca
                        escreval("Quantidade invalida! Digite entre 0 e 10:")
                        leia(clinicoManha)
                     fimenquanto

                     escreval("Digite a quantidade de Pediatras (Manha):")
                     leia(pediatraManha)
                     enquanto (pediatraManha < 0) ou (pediatraManha > 10) faca
                        escreval("Quantidade invalida! Digite entre 0 e 10:")
                        leia(pediatraManha)
                     fimenquanto

                     escreval("Digite a quantidade de Cirurgioes (Manha):")
                     leia(cirurgiaoManha)
                     enquanto (cirurgiaoManha < 0) ou (cirurgiaoManha > 10) faca
                        escreval("Quantidade invalida! Digite entre 0 e 10:")
                        leia(cirurgiaoManha)
                     fimenquanto

                     publicarManha <- verdadeiro
                     se (clinicoManha < 2) ou (pediatraManha < 1) ou (cirurgiaoManha < 1) entao
                        publicarManha <- falso
                     fimse

                     se clinicoManha < 2 entao
                        faltaClinicoManha <- 2 - clinicoManha
                     senao
                        faltaClinicoManha <- 0
                     fimse

                     se pediatraManha < 1 entao
                        faltaPediatraManha <- 1 - pediatraManha
                     senao
                        faltaPediatraManha <- 0
                     fimse

                     se cirurgiaoManha < 1 entao
                        faltaCirurgiaoManha <- 1 - cirurgiaoManha
                     senao
                        faltaCirurgiaoManha <- 0
                     fimse

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
                     se turno = 2 entao
                        tarde <- 1
                        escreval("Digite a quantidade de Clinicos Gerais (Tarde):")
                        leia(clinicoTarde)
                        enquanto (clinicoTarde < 0) ou (clinicoTarde > 10) faca
                           escreval("Quantidade invalida! Digite entre 0 e 10:")
                           leia(clinicoTarde)
                        fimenquanto

                        escreval("Digite a quantidade de Pediatras (Tarde):")
                        leia(pediatraTarde)
                        enquanto (pediatraTarde < 0) ou (pediatraTarde > 10) faca
                           escreval("Quantidade invalida! Digite entre 0 e 10:")
                           leia(pediatraTarde)
                        fimenquanto

                        escreval("Digite a quantidade de Cirurgioes (Tarde):")
                        leia(cirurgiaoTarde)
                        enquanto (cirurgiaoTarde < 0) ou (cirurgiaoTarde > 10) faca
                           escreval("Quantidade invalida! Digite entre 0 e 10:")
                           leia(cirurgiaoTarde)
                        fimenquanto

                        publicarTarde <- verdadeiro
                        se (clinicoTarde < 2) ou (pediatraTarde < 1) ou (cirurgiaoTarde < 1) entao
                           publicarTarde <- falso
                        fimse

                        se clinicoTarde < 2 entao
                           faltaClinicoTarde <- 2 - clinicoTarde
                        senao
                           faltaClinicoTarde <- 0
                        fimse

                        se pediatraTarde < 1 entao
                           faltaPediatraTarde <- 1 - pediatraTarde
                        senao
                           faltaPediatraTarde <- 0
                        fimse

                        se cirurgiaoTarde < 1 entao
                           faltaCirurgiaoTarde <- 1 - cirurgiaoTarde
                        senao
                           faltaCirurgiaoTarde <- 0
                        fimse

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
                        noite <- 1
                        escreval("Digite a quantidade de Clinicos Gerais (Noite):")
                        leia(clinicoNoite)
                        enquanto (clinicoNoite < 0) ou (clinicoNoite > 10) faca
                           escreval("Quantidade invalida! Digite entre 0 e 10:")
                           leia(clinicoNoite)
                        fimenquanto

                        escreval("Digite a quantidade de Pediatras (Noite):")
                        leia(pediatraNoite)
                        enquanto (pediatraNoite < 0) ou (pediatraNoite > 10) faca
                           escreval("Quantidade invalida! Digite entre 0 e 10:")
                           leia(pediatraNoite)
                        fimenquanto

                        escreval("Digite a quantidade de Cirurgioes (Noite):")
                        leia(cirurgiaoNoite)
                        enquanto (cirurgiaoNoite < 0) ou (cirurgiaoNoite > 10) faca
                           escreval("Quantidade invalida! Digite entre 0 e 10:")
                           leia(cirurgiaoNoite)
                        fimenquanto

                        publicarNoite <- verdadeiro
                        se (clinicoNoite < 2) ou (pediatraNoite < 1) ou (cirurgiaoNoite < 1) entao
                           publicarNoite <- falso
                        fimse

                        se clinicoNoite < 2 entao
                           faltaClinicoNoite <- 2 - clinicoNoite
                        senao
                           faltaClinicoNoite <- 0
                        fimse

                        se pediatraNoite < 1 entao
                           faltaPediatraNoite <- 1 - pediatraNoite
                        senao
                           faltaPediatraNoite <- 0
                        fimse

                        se cirurgiaoNoite < 1 entao
                           faltaCirurgiaoNoite <- 1 - cirurgiaoNoite
                        senao
                           faltaCirurgiaoNoite <- 0
                        fimse

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
               fimpara
            fimse

            se opcaoMenu = 2 entao
               continuarEscala <- "S"
               enquanto (continuarEscala = "S") ou (continuarEscala = "s") faca
                  escreval("")
                  escreval("==========================================")
                  escreval("       ATRIBUIR MEDICO A UM TURNO")
                  escreval("==========================================")
                  escreval("Informe o ID do medico (1 a 50, IDs impares = cadastrados):")
                  leia(idMedico)

                  se (idMedico >= 1) e (idMedico <= 50) e (idMedico MOD 2 <> 0) entao
                     medicoCadastrado <- verdadeiro
                  senao
                     medicoCadastrado <- falso
                  fimse

                  se nao medicoCadastrado entao
                     totalRecusas <- totalRecusas + 1
                     recusasOutras <- recusasOutras + 1
                     escreval("RECUSA: O medico informado nao esta cadastrado no sistema.")
                  senao
                     escreval("Informe o turno (1-Manha, 2-Tarde, 3-Noite):")
                     leia(turnoEscala)

                     se (turnoEscala < 1) ou (turnoEscala > 3) entao
                        totalRecusas <- totalRecusas + 1
                        recusasOutras <- recusasOutras + 1
                        escreval("RECUSA: O turno informado nao existe.")
                     senao
                        se (turnoEscala = 1) e trabalhouNoiteAnterior[idMedico] entao
                           totalRecusas <- totalRecusas + 1
                           recusasFaltaDescanso <- recusasFaltaDescanso + 1
                           escreval("RECUSA: Falta de descanso! O medico trabalhou no turno da noite do dia anterior e nao pode assumir a manha.")
                        senao
                           se plantoesSemana[idMedico] >= LIMITE_SEMANAL entao
                              totalRecusas <- totalRecusas + 1
                              recusasLimiteSemanal <- recusasLimiteSemanal + 1
                              escreval("RECUSA: Limite semanal atingido (", plantoesSemana[idMedico], "/", LIMITE_SEMANAL, " plantoes na semana).")
                           senao
                              se plantoesDia[idMedico] >= LIMITE_DIARIO entao
                                 totalRecusas <- totalRecusas + 1
                                 recusasLimiteDiario <- recusasLimiteDiario + 1
                                 escreval("RECUSA: O medico ultrapassou o limite maximo de ", LIMITE_DIARIO, " plantoes permitidos para o dia.")
                              senao
                                 se idMedico MOD 5 = 0 entao
                                    medicoDisponivel <- falso
                                 senao
                                    medicoDisponivel <- verdadeiro
                                 fimse

                                 se nao medicoDisponivel entao
                                    totalRecusas <- totalRecusas + 1
                                    recusasOutras <- recusasOutras + 1
                                    escreval("RECUSA: O medico esta indisponivel no turno informado.")
                                 senao
                                    escreval("Informe o posto/especialidade exigida (1-Clinico, 2-Pediatra, 3-Cirurgiao):")
                                    leia(postoEscala)

                                    se (postoEscala < 1) ou (postoEscala > 3) entao
                                       totalRecusas <- totalRecusas + 1
                                       recusasOutras <- recusasOutras + 1
                                       escreval("RECUSA: Posto/especialidade invalido.")
                                    senao
                                       se (idMedico MOD 3 = postoEscala - 1) entao
                                          especialidadeCompativel <- verdadeiro
                                       senao
                                          especialidadeCompativel <- falso
                                       fimse

                                       se nao especialidadeCompativel entao
                                          totalRecusas <- totalRecusas + 1
                                          recusasOutras <- recusasOutras + 1
                                          escreval("RECUSA: A especialidade do medico e incompativel com a exigida pelo posto.")
                                       senao
                                          se (idMedico MOD 7 = 0) ou jaEscaladoNoTurno[idMedico, turnoEscala] entao
                                             medicoOcupadoTurno <- verdadeiro
                                          senao
                                             medicoOcupadoTurno <- falso
                                          fimse

                                          se medicoOcupadoTurno entao
                                             totalRecusas <- totalRecusas + 1
                                             recusasOutras <- recusasOutras + 1
                                             escreval("RECUSA: O medico ja esta ocupando outro posto no mesmo turno.")
                                          senao
                                             // Escala valida: atualiza contadores apenas aqui
                                             plantoesDia[idMedico] <- plantoesDia[idMedico] + 1
                                             plantoesSemana[idMedico] <- plantoesSemana[idMedico] + 1
                                             jaEscaladoNoTurno[idMedico, turnoEscala] <- verdadeiro
                                             totalEscalacoesValidas <- totalEscalacoesValidas + 1

                                             se turnoEscala = 3 entao
                                                trabalhouNoiteAnterior[idMedico] <- verdadeiro
                                             senao
                                                se turnoEscala = 2 entao
                                                   trabalhouNoiteAnterior[idMedico] <- falso
                                                fimse
                                             fimse

                                             se postoEscala = 1 entao
                                                se turnoEscala = 1 entao
                                                   clinicoManha <- clinicoManha + 1
                                                senao
                                                   se turnoEscala = 2 entao
                                                      clinicoTarde <- clinicoTarde + 1
                                                   senao
                                                      clinicoNoite <- clinicoNoite + 1
                                                   fimse
                                                fimse
                                             senao
                                                se postoEscala = 2 entao
                                                   se turnoEscala = 1 entao
                                                      pediatraManha <- pediatraManha + 1
                                                   senao
                                                      se turnoEscala = 2 entao
                                                         pediatraTarde <- pediatraTarde + 1
                                                      senao
                                                         pediatraNoite <- pediatraNoite + 1
                                                      fimse
                                                   fimse
                                                senao
                                                   se turnoEscala = 1 entao
                                                      cirurgiaoManha <- cirurgiaoManha + 1
                                                   senao
                                                      se turnoEscala = 2 entao
                                                         cirurgiaoTarde <- cirurgiaoTarde + 1
                                                      senao
                                                         cirurgiaoNoite <- cirurgiaoNoite + 1
                                                      fimse
                                                   fimse
                                                fimse
                                             fimse

                                             logEscalas <- logEscalas + "Medico ID " + Numpcarac(idMedico) + " | Turno " + Numpcarac(turnoEscala) + " | Posto " + Numpcarac(postoEscala) + " ; "

                                             escreval("SUCESSO: Escala registrada! O medico foi associado ao posto e a vaga foi ocupada.")
                                             escreval("Plantoes no dia: ", plantoesDia[idMedico], "/", LIMITE_DIARIO, " | Plantoes na semana: ", plantoesSemana[idMedico], "/", LIMITE_SEMANAL)
                                          fimse
                                       fimse
                                    fimse
                                 fimse
                              fimse
                           fimse
                        fimse
                     fimse
                  fimse

                  escreval("")
                  escreval("Deseja realizar outra atribuicao? (S/N)")
                  leia(continuarEscala)
               fimenquanto
            fimse

            se opcaoMenu = 3 entao
               escreval("")
               escreval("==================================================")
               escreval("              COBERTURA SEMANAL")
               escreval("==================================================")
               escreval("Limite semanal configurado por medico: ", LIMITE_SEMANAL, " plantoes")
               escreval("Minimo por turno: 2 Clinicos, 1 Pediatra, 1 Cirurgiao")
               escreval("Manha -> Clin:", clinicoManha, " | Ped:", pediatraManha, " | Cir:", cirurgiaoManha, " | Status:", respostaManha)
               escreval("Tarde -> Clin:", clinicoTarde, " | Ped:", pediatraTarde, " | Cir:", cirurgiaoTarde, " | Status:", respostaTarde)
               escreval("Noite -> Clin:", clinicoNoite, " | Ped:", pediatraNoite, " | Cir:", cirurgiaoNoite, " | Status:", respostaNoite)
               escreval("Medicos com plantoes registrados na semana:")
               para i de 1 ate 50 faca
                  se plantoesSemana[i] > 0 entao
                     escreval(" - Medico ID ", i, ": ", plantoesSemana[i], "/", LIMITE_SEMANAL, " plantoes na semana (", plantoesDia[i], "/", LIMITE_DIARIO, " no dia)")
                  fimse
               fimpara
            fimse

            se opcaoMenu = 4 entao
               escreval("")
               escreval("==================================================")
               escreval("        INDICADORES GERENCIAIS DA EQUIPE")
               escreval("==================================================")
               escreval("Total de escalacoes validas registradas: ", totalEscalacoesValidas)
               escreval("Total de tentativas recusadas: ", totalRecusas)
               escreval(" - Recusas por limite semanal atingido: ", recusasLimiteSemanal)
               escreval(" - Recusas por falta de descanso (noite -> manha): ", recusasFaltaDescanso)
               escreval(" - Recusas por limite diario atingido: ", recusasLimiteDiario)
               escreval(" - Outras recusas (cadastro, turno, disponibilidade, posto, conflito): ", recusasOutras)
            fimse

            se opcaoMenu = 5 entao
               totalMedicosTurnos <- clinicoManha + pediatraManha + cirurgiaoManha + clinicoTarde + pediatraTarde + cirurgiaoTarde + clinicoNoite + pediatraNoite + cirurgiaoNoite
               totalFaltasGeral <- faltaClinicoManha + faltaPediatraManha + faltaCirurgiaoManha + faltaClinicoTarde + faltaPediatraTarde + faltaCirurgiaoTarde + faltaClinicoNoite + faltaPediatraNoite + faltaCirurgiaoNoite

               escreval("")
               escreval("==================================================")
               escreval("              RELATORIO SEMANAL")
               escreval("           HOSPITAL SANTA AURORA")
               escreval("==================================================")
               escreval("MANHA -> Clin:", clinicoManha, " Ped:", pediatraManha, " Cir:", cirurgiaoManha, " | Situacao: ", respostaManha)
               escreval("TARDE -> Clin:", clinicoTarde, " Ped:", pediatraTarde, " Cir:", cirurgiaoTarde, " | Situacao: ", respostaTarde)
               escreval("NOITE -> Clin:", clinicoNoite, " Ped:", pediatraNoite, " Cir:", cirurgiaoNoite, " | Situacao: ", respostaNoite)
               escreval("TOTAL DE MEDICOS NOS TURNOS: ", totalMedicosTurnos)
               escreval("TOTAL DE FALTAS IDENTIFICADAS: ", totalFaltasGeral)
               escreval("ESCALACOES VALIDAS: ", totalEscalacoesValidas, " | RECUSAS: ", totalRecusas)
            fimse

            se opcaoMenu = 6 entao
               logExportacao <- "EXPORTACAO_MEDICOS_ESCALACOES | LimiteSemanal=" + Numpcarac(LIMITE_SEMANAL) + " | EscalacoesValidas=" + Numpcarac(totalEscalacoesValidas) + " | Detalhes=" + logEscalas
               escreval("")
               escreval("==================================================")
               escreval("     EXPORTACAO DE MEDICOS E ESCALACOES")
               escreval("==================================================")
               escreval(logExportacao)
               escreval("Dados exportados com sucesso na sessao atual.")
            fimse

            se opcaoMenu = 0 entao
               sairSistema <- verdadeiro
            fimse
         fimpara


      // ==================================================
      // OPCAO 1: CONFIGURAR TURNOS E PUBLICACAO
      // ==================================================
      senao
         se opcaoMenu = 1 entao
            manha <- 0
            tarde <- 0
            noite <- 0

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
                           escreval("ERRO: turno da noite ja foi escolhido! Digite outro:")
                        fimse
                     fimse
                  fimse
                  leia(turno)
               fimenquanto

               se (turno = 1) entao
                  manha <- 1
                  escreval("")
                  escreval("==========================================")
                  escreval("             TURNO DA MANHA")
                  escreval("==========================================")

                  escreval("Digite a quantidade de Clinicos Gerais:")
                  leia(clinicoManha)
                  enquanto (clinicoManha < 0) ou (clinicoManha > 10) faca
                     escreval("Quantidade invalida!")
                     escreval("Digite um valor entre 0 e 10:")
                     leia(clinicoManha)
                  fimenquanto

                  escreval("Digite a quantidade de Pediatras:")
                  leia(pediatraManha)
                  enquanto (pediatraManha < 0) ou (pediatraManha > 10) faca
                     escreval("Quantidade invalida!")
                     escreval("Digite um valor entre 0 e 10:")
                     leia(pediatraManha)
                  fimenquanto

                  escreval("Digite a quantidade de Cirurgioes:")
                  leia(cirurgiaoManha)
                  enquanto (cirurgiaoManha < 0) ou (cirurgiaoManha > 10) faca
                     escreval("Quantidade invalida!")
                     escreval("Digite um valor entre 0 e 10:")
                     leia(cirurgiaoManha)
                  fimenquanto

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

                  escreval("")
                  escreval("------------------------------------------")
                  escreval("TOTAL DE MEDICOS - MANHA")
                  escreval("------------------------------------------")
                  escreval("Clinicos Gerais: ", clinicoManha)
                  escreval("Pediatras: ", pediatraManha)
                  escreval("Cirurgioes: ", cirurgiaoManha)
                  escreval("TOTAL: ", clinicoManha + pediatraManha + cirurgiaoManha)

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
                  se (turno = 2) entao
                     tarde <- 1
                     escreval("")
                     escreval("==========================================")
                     escreval("             TURNO DA TARDE")
                     escreval("==========================================")

                     escreval("Digite a quantidade de Clinicos Gerais:")
                     leia(clinicoTarde)
                     enquanto (clinicoTarde < 0) ou (clinicoTarde > 10) faca
                        escreval("Quantidade invalida!")
                        escreval("Digite um valor entre 0 e 10:")
                        leia(clinicoTarde)
                     fimenquanto

                     escreval("Digite a quantidade de Pediatras:")
                     leia(pediatraTarde)
                     enquanto (pediatraTarde < 0) ou (pediatraTarde > 10) faca
                        escreval("Quantidade invalida!")
                        escreval("Digite um valor entre 0 e 10:")
                        leia(pediatraTarde)
                     fimenquanto

                     escreval("Digite a quantidade de Cirurgioes:")
                     leia(cirurgiaoTarde)
                     enquanto (cirurgiaoTarde < 0) ou (cirurgiaoTarde > 10) faca
                        escreval("Quantidade invalida!")
                        escreval("Digite um valor entre 0 e 10:")
                        leia(cirurgiaoTarde)
                     fimenquanto

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

                     escreval("")
                     escreval("------------------------------------------")
                     escreval("TOTAL DE MEDICOS - TARDE")
                     escreval("------------------------------------------")
                     escreval("Clinicos Gerais: ", clinicoTarde)
                     escreval("Pediatras: ", pediatraTarde)
                     escreval("Cirurgioes: ", cirurgiaoTarde)
                     escreval("TOTAL: ", clinicoTarde + pediatraTarde + cirurgiaoTarde)

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
                     noite <- 1
                     escreval("")
                     escreval("==========================================")
                     escreval("             TURNO DA NOITE")
                     escreval("==========================================")

                     escreval("Digite a quantidade de Clinicos Gerais:")
                     leia(clinicoNoite)
                     enquanto (clinicoNoite < 0) ou (clinicoNoite > 10) faca
                        escreval("Quantidade invalida!")
                        escreval("Digite um valor entre 0 e 10:")
                        leia(clinicoNoite)
                     fimenquanto

                     escreval("Digite a quantidade de Pediatras:")
                     leia(pediatraNoite)
                     enquanto (pediatraNoite < 0) ou (pediatraNoite > 10) faca
                        escreval("Quantidade invalida!")
                        escreval("Digite um valor entre 0 e 10:")
                        leia(pediatraNoite)
                     fimenquanto

                     escreval("Digite a quantidade de Cirurgioes:")
                     leia(cirurgiaoNoite)
                     enquanto (cirurgiaoNoite < 0) ou (cirurgiaoNoite > 10) faca
                        escreval("Quantidade invalida!")
                        escreval("Digite um valor entre 0 e 10:")
                        leia(cirurgiaoNoite)
                     fimenquanto

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

                     escreval("")
                     escreval("------------------------------------------")
                     escreval("TOTAL DE MEDICOS - NOITE")
                     escreval("------------------------------------------")
                     escreval("Clinicos Gerais: ", clinicoNoite)
                     escreval("Pediatras: ", pediatraNoite)
                     escreval("Cirurgioes: ", cirurgiaoNoite)
                     escreval("TOTAL: ", clinicoNoite + pediatraNoite + cirurgiaoNoite)

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
            fimpara


         // ==================================================
         // OPCAO 2: ATRIBUIR MEDICO A UM TURNO
         // ==================================================
         senao
            se opcaoMenu = 2 entao
               continuarEscala <- "S"
               enquanto (continuarEscala = "S") ou (continuarEscala = "s") faca

                  escreval("")
                  escreval("==========================================")
                  escreval("       ATRIBUIR MEDICO A UM TURNO")
                  escreval("==========================================")

                  escreval("Informe o ID do medico (1 a 50, IDs impares = cadastrados):")
                  leia(idMedico)

                  se (idMedico >= 1) e (idMedico <= 50) e (idMedico MOD 2 <> 0) entao
                     medicoCadastrado <- verdadeiro
                  senao
                     medicoCadastrado <- falso
                  fimse

                  se nao medicoCadastrado entao
                     totalRecusas <- totalRecusas + 1
                     recusasOutras <- recusasOutras + 1
                     escreval("RECUSA: O medico informado nao esta cadastrado no sistema.")
                  senao
                     escreval("Informe o turno (1-Manha, 2-Tarde, 3-Noite):")
                     leia(turnoEscala)

                     se (turnoEscala < 1) ou (turnoEscala > 3) entao
                        totalRecusas <- totalRecusas + 1
                        recusasOutras <- recusasOutras + 1
                        escreval("RECUSA: O turno informado nao existe.")
                     senao
                        // Regra: impedir escala na manha se trabalhou na noite anterior
                        se (turnoEscala = 1) e trabalhouNoiteAnterior[idMedico] entao
                           totalRecusas <- totalRecusas + 1
                           recusasFaltaDescanso <- recusasFaltaDescanso + 1
                           escreval("RECUSA: Falta de descanso! O medico trabalhou no turno da noite do dia anterior e nao pode ser escalado na manha.")
                        senao
                           // Regra: impedir nova escala se ja atingiu o limite semanal (permite atingir exatamente o limite)
                           se plantoesSemana[idMedico] >= LIMITE_SEMANAL entao
                              totalRecusas <- totalRecusas + 1
                              recusasLimiteSemanal <- recusasLimiteSemanal + 1
                              escreval("RECUSA: Limite semanal atingido! O medico ja possui ", plantoesSemana[idMedico], " de ", LIMITE_SEMANAL, " plantoes na semana.")
                           senao
                              // Regra: limite maximo de 2 plantoes por dia
                              se plantoesDia[idMedico] >= LIMITE_DIARIO entao
                                 totalRecusas <- totalRecusas + 1
                                 recusasLimiteDiario <- recusasLimiteDiario + 1
                                 escreval("RECUSA: O medico ultrapassou o limite maximo de ", LIMITE_DIARIO, " plantoes permitidos para o dia.")
                              senao
                                 // Disponibilidade no turno (simulacao: multiplos de 5 indisponiveis)
                                 se idMedico MOD 5 = 0 entao
                                    medicoDisponivel <- falso
                                 senao
                                    medicoDisponivel <- verdadeiro
                                 fimse

                                 se nao medicoDisponivel entao
                                    totalRecusas <- totalRecusas + 1
                                    recusasOutras <- recusasOutras + 1
                                    escreval("RECUSA: O medico esta indisponivel no turno informado.")
                                 senao
                                    escreval("Informe o posto/especialidade exigida (1-Clinico, 2-Pediatra, 3-Cirurgiao):")
                                    leia(postoEscala)

                                    se (postoEscala < 1) ou (postoEscala > 3) entao
                                       totalRecusas <- totalRecusas + 1
                                       recusasOutras <- recusasOutras + 1
                                       escreval("RECUSA: Posto/especialidade invalido.")
                                    senao
                                       se (idMedico MOD 3 = postoEscala - 1) entao
                                          especialidadeCompativel <- verdadeiro
                                       senao
                                          especialidadeCompativel <- falso
                                       fimse

                                       se nao especialidadeCompativel entao
                                          totalRecusas <- totalRecusas + 1
                                          recusasOutras <- recusasOutras + 1
                                          escreval("RECUSA: A especialidade do medico e incompativel com a exigida pelo posto.")
                                       senao
                                          se (idMedico MOD 7 = 0) ou jaEscaladoNoTurno[idMedico, turnoEscala] entao
                                             medicoOcupadoTurno <- verdadeiro
                                          senao
                                             medicoOcupadoTurno <- falso
                                          fimse

                                          se medicoOcupadoTurno entao
                                             totalRecusas <- totalRecusas + 1
                                             recusasOutras <- recusasOutras + 1
                                             escreval("RECUSA: O medico ja esta ocupando outro posto no mesmo turno.")
                                          senao
                                             // Todas as regras atendidas: registra escalacao e atualiza contadores
                                             plantoesDia[idMedico] <- plantoesDia[idMedico] + 1
                                             plantoesSemana[idMedico] <- plantoesSemana[idMedico] + 1
                                             jaEscaladoNoTurno[idMedico, turnoEscala] <- verdadeiro
                                             totalEscalacoesValidas <- totalEscalacoesValidas + 1

                                             se turnoEscala = 3 entao
                                                trabalhouNoiteAnterior[idMedico] <- verdadeiro
                                             senao
                                                se turnoEscala = 2 entao
                                                   trabalhouNoiteAnterior[idMedico] <- falso
                                                fimse
                                             fimse

                                             se postoEscala = 1 entao
                                                se turnoEscala = 1 entao
                                                   clinicoManha <- clinicoManha + 1
                                                senao
                                                   se turnoEscala = 2 entao
                                                      clinicoTarde <- clinicoTarde + 1
                                                   senao
                                                      clinicoNoite <- clinicoNoite + 1
                                                   fimse
                                                fimse
                                             senao
                                                se postoEscala = 2 entao
                                                   se turnoEscala = 1 entao
                                                      pediatraManha <- pediatraManha + 1
                                                   senao
                                                      se turnoEscala = 2 entao
                                                         pediatraTarde <- pediatraTarde + 1
                                                      senao
                                                         pediatraNoite <- pediatraNoite + 1
                                                      fimse
                                                   fimse
                                                senao
                                                   se turnoEscala = 1 entao
                                                      cirurgiaoManha <- cirurgiaoManha + 1
                                                   senao
                                                      se turnoEscala = 2 entao
                                                         cirurgiaoTarde <- cirurgiaoTarde + 1
                                                      senao
                                                         cirurgiaoNoite <- cirurgiaoNoite + 1
                                                      fimse
                                                   fimse
                                                fimse
                                             fimse

                                             logEscalas <- logEscalas + "Medico ID " + Numpcarac(idMedico) + " | Turno " + Numpcarac(turnoEscala) + " | Posto " + Numpcarac(postoEscala) + " ; "

                                             escreval("SUCESSO: Escala registrada! O medico foi associado ao posto e a vaga foi ocupada.")
                                             escreval("Plantoes no dia: ", plantoesDia[idMedico], "/", LIMITE_DIARIO, " | Plantoes na semana: ", plantoesSemana[idMedico], "/", LIMITE_SEMANAL)
                                          fimse
                                       fimse
                                    fimse
                                 fimse
                              fimse
                           fimse
                        fimse
                     fimse
                  fimse

                  escreval("")
                  escreval("Deseja realizar outra atribuicao? (S/N)")
                  leia(continuarEscala)
               fimenquanto


            // ==================================================
            // OPCAO 3: VISUALIZAR COBERTURA SEMANAL
            // ==================================================
            senao
               se opcaoMenu = 3 entao
                  escreval("")
                  escreval("==================================================")
                  escreval("              COBERTURA SEMANAL")
                  escreval("           HOSPITAL SANTA AURORA")
                  escreval("==================================================")
                  escreval("Limite semanal por medico: ", LIMITE_SEMANAL, " plantoes")
                  escreval("Cobertura minima exigida por turno: 2 Clinicos, 1 Pediatra, 1 Cirurgiao")
                  escreval("")
                  escreval("MANHA -> Clinicos: ", clinicoManha, " | Pediatras: ", pediatraManha, " | Cirurgioes: ", cirurgiaoManha, " | Situacao: ", respostaManha)
                  escreval("TARDE -> Clinicos: ", clinicoTarde, " | Pediatras: ", pediatraTarde, " | Cirurgioes: ", cirurgiaoTarde, " | Situacao: ", respostaTarde)
                  escreval("NOITE -> Clinicos: ", clinicoNoite, " | Pediatras: ", pediatraNoite, " | Cirurgioes: ", cirurgiaoNoite, " | Situacao: ", respostaNoite)
                  escreval("")
                  escreval("Carga semanal dos medicos com plantoes:")
                  para i de 1 ate 50 faca
                     se plantoesSemana[i] > 0 entao
                        escreval(" - Medico ID ", i, ": ", plantoesSemana[i], "/", LIMITE_SEMANAL, " na semana | ", plantoesDia[i], "/", LIMITE_DIARIO, " no dia")
                     fimse
                  fimpara


               // ==================================================
               // OPCAO 4: CONSULTAR INDICADORES GERENCIAIS DA EQUIPE
               // ==================================================
               senao
                  se opcaoMenu = 4 entao
                     totalMedicosTurnos <- clinicoManha + pediatraManha + cirurgiaoManha + clinicoTarde + pediatraTarde + cirurgiaoTarde + clinicoNoite + pediatraNoite + cirurgiaoNoite
                     totalFaltasGeral <- faltaClinicoManha + faltaPediatraManha + faltaCirurgiaoManha + faltaClinicoTarde + faltaPediatraTarde + faltaCirurgiaoTarde + faltaClinicoNoite + faltaPediatraNoite + faltaCirurgiaoNoite

                     escreval("")
                     escreval("==================================================")
                     escreval("        INDICADORES GERENCIAIS DA EQUIPE")
                     escreval("==================================================")
                     escreval("Total de medicos alocados nos turnos: ", totalMedicosTurnos)
                     escreval("Total de faltas apuradas nos turnos: ", totalFaltasGeral)
                     escreval("Total de atribuicoes validas: ", totalEscalacoesValidas)
                     escreval("Total de atribuicoes recusadas: ", totalRecusas)
                     escreval(" - Por limite semanal atingido: ", recusasLimiteSemanal)
                     escreval(" - Por falta de descanso (noite anterior -> manha): ", recusasFaltaDescanso)
                     escreval(" - Por limite diario atingido: ", recusasLimiteDiario)
                     escreval(" - Por outras regras: ", recusasOutras)


                  // ==================================================
                  // OPCAO 5: GERAR RELATORIO SEMANAL
                  // ==================================================
                  senao
                     se opcaoMenu = 5 entao
                        totalMedicosTurnos <- clinicoManha + pediatraManha + cirurgiaoManha + clinicoTarde + pediatraTarde + cirurgiaoTarde + clinicoNoite + pediatraNoite + cirurgiaoNoite
                        totalFaltasGeral <- faltaClinicoManha + faltaPediatraManha + faltaCirurgiaoManha + faltaClinicoTarde + faltaPediatraTarde + faltaCirurgiaoTarde + faltaClinicoNoite + faltaPediatraNoite + faltaCirurgiaoNoite

                        escreval("")
                        escreval("==================================================")
                        escreval("              RELATORIO SEMANAL")
                        escreval("           HOSPITAL SANTA AURORA")
                        escreval("==================================================")
                        escreval("MANHA -> Clinicos: ", clinicoManha, " | Pediatras: ", pediatraManha, " | Cirurgioes: ", cirurgiaoManha, " | Total: ", clinicoManha + pediatraManha + cirurgiaoManha, " | Situacao: ", respostaManha)
                        se publicarManha = falso entao
                           escreval("   Faltas Manha -> Clin:", faltaClinicoManha, " Ped:", faltaPediatraManha, " Cir:", faltaCirurgiaoManha)
                        fimse

                        escreval("TARDE -> Clinicos: ", clinicoTarde, " | Pediatras: ", pediatraTarde, " | Cirurgioes: ", cirurgiaoTarde, " | Total: ", clinicoTarde + pediatraTarde + cirurgiaoTarde, " | Situacao: ", respostaTarde)
                        se publicarTarde = falso entao
                           escreval("   Faltas Tarde -> Clin:", faltaClinicoTarde, " Ped:", faltaPediatraTarde, " Cir:", faltaCirurgiaoTarde)
                        fimse

                        escreval("NOITE -> Clinicos: ", clinicoNoite, " | Pediatras: ", pediatraNoite, " | Cirurgioes: ", cirurgiaoNoite, " | Total: ", clinicoNoite + pediatraNoite + cirurgiaoNoite, " | Situacao: ", respostaNoite)
                        se publicarNoite = falso entao
                           escreval("   Faltas Noite -> Clin:", faltaClinicoNoite, " Ped:", faltaPediatraNoite, " Cir:", faltaCirurgiaoNoite)
                        fimse

                        escreval("--------------------------------------------------")
                        escreval("TOTAL GERAL DE MEDICOS NOS TURNOS: ", totalMedicosTurnos)
                        escreval("TOTAL GERAL DE FALTAS: ", totalFaltasGeral)
                        escreval("ESCALACOES VALIDAS: ", totalEscalacoesValidas, " | RECUSAS: ", totalRecusas)
                        escreval("==================================================")


                     // ==================================================
                     // OPCAO 6: EXPORTAR DADOS DOS MEDICOS E ESCALACOES
                     // ==================================================
                     senao
                        se opcaoMenu = 6 entao
                           logExportacao <- "EXPORTACAO_MEDICOS_ESCALACOES | LimiteSemanal=" + Numpcarac(LIMITE_SEMANAL) + " | EscalacoesValidas=" + Numpcarac(totalEscalacoesValidas) + " | Escalacoes=" + logEscalas

                           escreval("")
                           escreval("==================================================")
                           escreval("    EXPORTACAO DE DADOS - MEDICOS E ESCALACOES")
                           escreval("==================================================")
                           escreval("Resumo da carga por medico:")
                           para i de 1 ate 50 faca
                              se plantoesSemana[i] > 0 entao
                                 escreval("ID_MEDICO=", i, "; PLANTOES_DIA=", plantoesDia[i], "; PLANTOES_SEMANA=", plantoesSemana[i], "; NOITE_ANTERIOR=", trabalhouNoiteAnterior[i])
                              fimse
                           fimpara
                           escreval("--------------------------------------------------")
                           escreval("Registro de escalacoes:")
                           escreval(logExportacao)
                           escreval("==================================================")
                           escreval("Dados exportados com sucesso!")


                        // ==================================================
                        // OPCAO 0: ENCERRAR SISTEMA DE FORMA CONTROLADA
                        // ==================================================
                        senao
                           se opcaoMenu = 0 entao
                              escreval("")
                              escreval("==================================================")
                              escreval("           ENCERRAMENTO DO SISTEMA")
                              escreval("==================================================")
                              escreval("ATENCAO: Os dados nao ficam armazenados automaticamente entre execucoes.")
                              escreval("RECOMENDACAO: Exporte os dados (opcao 6) antes de encerrar o sistema.")
                              escreval("")
                              escreval("Deseja realmente encerrar o sistema? (S/N)")
                              leia(confirmacaoSaida)

                              se (confirmacaoSaida = "S") ou (confirmacaoSaida = "s") entao
                                 sairSistema <- verdadeiro
                                 escreval("")
                                 escreval("Sistema encerrado. Obrigado por utilizar o Hospital Santa Aurora!")
                              senao
                                 sairSistema <- falso
                                 escreval("Encerramento cancelado. Retornando ao menu principal...")
                              fimse
                           fimse
                        fimse
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse

   fimenquanto

Fimalgoritmo
