# MedShift — Sistema de Validação de Escalas Médicas

> 🏥 Apoio à construção e validação de escalas de plantão — Hospital Santa Aurora  
> Equipe **TechFlow** | API 2026/2

---

## 📋 Índice
- [Sobre o Projeto](#sobre-o-projeto)
- [Objetivo](#objetivo)
- [Regras de Cobertura Mínima](#regras-de-cobertura-mínima)
- [Product Backlog](#product-backlog)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Como Executar](#como-executar)
- [Definições de Pronto](#definições-de-pronto)
- [Estrutura do Repositório](#estrutura-do-repositório)
- [Equipe](#equipe)

---

## 🎯 Sobre o Projeto

O **MedShift** é um sistema desenvolvido para apoiar a coordenação do **Hospital Santa Aurora** na organização e validação de escalas médicas de plantão. Atualmente, a conferência é feita de forma manual, consumindo tempo e propensa a erros.

O sistema **não apenas registra nomes** — ele responde:
- ✅ Pode publicar o plantão?
- ❌ Se não pode, **qual especialidade está faltando e quantos profissionais faltam**?
- ⚠️ Os dados digitados fazem sentido?

---

## 💡 Objetivo

Transformar o processo manual em um sistema que:
- Centraliza a verificação de cobertura mínima por turno
- Valida entradas impossíveis (quantidades negativas, valores absurdos, turnos inexistentes)
- Apresenta diagnóstico claro: **pode publicar / o que está faltando**
- Evolui incrementalmente em três Sprints

---

## 📊 Regras de Cobertura Mínima

| Especialidade | Manhã | Tarde | Noite |
|---|---|---|---|
| Clínico Geral | 2 | 2 | 2 |
| Pediatra | 1 | 1 | 1 |
| Cirurgião | 1 | 1 | 1 |

- Plantão abaixo da cobertura mínima **não pode ser publicado**
- O sistema deve informar **qual especialidade** e **quantos profissionais faltam**

---

## 📝 Product Backlog

| ID | User Story | Prioridade | Sprint |
|---|---|---|---|
| US01 | Como coordenador, quero escolher o turno do plantão, para analisar a cobertura | Alta | 1 |
| US02 | Como coordenador, quero informar a quantidade de médicos por especialidade, para verificar suficiência | Alta | 1 |
| US03 | Como coordenador, quero validação automática dos dados, para evitar entradas inválidas | Alta | 1 |
| US04 | Como coordenador, quero verificação da cobertura mínima, para saber se há profissionais suficientes | Alta | 1 |
| US05 | Como coordenador, quero saber qual especialidade está faltando e quantos faltam, para corrigir | Alta | 1 |
| US06 | Como coordenador, quero receber mensagem clara se pode publicar, para decidir rápido | Alta | 1 |
| US07 | Como coordenador, quero que quantidades negativas sejam rejeitadas, para impedir dados impossíveis | Alta | 1 |
| US08 | Como coordenador, quero limite máximo de profissionais por especialidade, para evitar erros de digitação | Média | 1 |
| US09 | Como coordenador, quero selecionar apenas turnos válidos, para evitar operações incorretas | Média | 1 |
| US10 | Como coordenador, quero usar pelo teclado/console, sem depender de interface gráfica | Média | 1 |
| US11 | Analisar múltiplos plantões | Alta | 2 |
| US12 | Cadastrar médicos com nome e especialidade | — | 3 |
| US13 | Montar plantão com profissionais específicos | — | 3 |

---

## 🛠 Tecnologias Utilizadas

| Ferramenta | Uso |
|---|---|
| **VisuAlg** | Ambiente de desenvolvimento principal (pseudocódigo) |
| **Pseudocódigo** | Lógica de programação — estruturas condicionais, repetição, vetores |
| **Git / GitHub** | Controle de versão e documentação |
| **Console / Texto** | Interface de interação com o usuário |

> ⚠️ **Restrições do VisuAlg**:
> - Sem tipo registro → usa vetores paralelos
> - Sem gravação de arquivos → dados não persistem entre execuções
> - Vetores de até 2 dimensões
> - Interface textual via teclado

---

## 🚀 Como Executar

### Pré-requisitos
- VisuAlg instalado

### Passo a Passo
1. Abra o arquivo `.alg` no VisuAlg
2. Execute o programa (▶️)
3. Siga as instruções no console:
   - Escolha o turno: `1-Manhã | 2-Tarde | 3-Noite`
   - Informe a quantidade de cada especialidade
   - Receba o diagnóstico: ✅ Pode publicar ou ❌ Motivo da reprovação

### Cenários de Teste
| Cenário | Resultado Esperado |
|---|---|
| Todos mínimos atingidos | ✅ Pode publicar |
| Faltando 1 Pediatra | ❌ Não pode — Faltam 1 Pediatra |
| Quantidade negativa | ⚠️ Erro — Valor inválido |
| Turno 4 | ⚠️ Erro — Opção inválida |
| Valor > 10 | ⚠️ Erro — Valor acima do limite |

---

## ✅ Definições de Pronto

### DoR — Definition of Ready
- [ ] User story clara e compreendida pela equipe
- [ ] Critérios de aceite definidos
- [ ] Cenários de sucesso e erro mapeados
- [ ] Esforço estimado
- [ ] Sem impedimentos para iniciar

### DoD — Definition of Done
- [ ] Código implementado no VisuAlg
- [ ] Passa em todos os cenários de teste
- [ ] Mensagens claras para o usuário
- [ ] Código versionado no GitHub
- [ ] Demonstração funcional na Sprint Review
- [ ] Documentação atualizada

---

## 📂 Estrutura do Repositório

