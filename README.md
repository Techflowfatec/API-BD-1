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

O sistema responde de forma direta:
- ✅ Pode publicar o plantão?
- ❌ Se não pode, **qual especialidade está faltando e quantos profissionais faltam**?
- ⚠️ Os dados digitados são válidos?

---

## 💡 Objetivo

Transformar o processo manual em um sistema que:
- Centraliza a verificação de cobertura mínima por turno
- Valida entradas impossíveis (quantidades negativas, valores absurdos, turnos inexistentes)
- Apresenta diagnóstico claro: **pode publicar / o que está faltando**
- Evolui incrementalmente em três Sprints

---

## 📊 Regras de Cobertura Mínima

| Especialidade | Mínimo por Turno |
|---|---|
| Clínico Geral | 2 |
| Pediatra | 1 |
| Cirurgião | 1 |

- Turnos disponíveis: **Manhã, Tarde e Noite**
- Plantão abaixo da cobertura mínima **não pode ser publicado**
- O sistema deve informar **qual especialidade** e **quantos profissionais faltam**

---

## 📝 Product Backlog

| ID | User Story | Prioridade | Sprint |
|---|---|---|---|
| 1 | Como coordenador de escala, quero escolher o turno do plantão, para que eu possa analisar a cobertura daquele turno. | Alta | 1 |
| 2 | Como coordenador de escala, quero informar a quantidade de médicos de cada especialidade no turno, para verificar se há profissionais suficientes. | Alta | 1 |
| 3 | Como coordenador de escala, quero que o sistema valide os dados informados, para evitar opções inválidas ou quantidades impossíveis. | Alta | 1 |
| 4 | Como coordenador de escala, quero que o sistema verifique a cobertura mínima do plantão, para saber se todas as especialidades possuem profissionais suficientes. | Alta | 1 |
| 5 | Como coordenador de escala, quero saber qual especialidade está com falta de profissionais e quantos faltam, para poder corrigir o plantão. | Alta | 1 |
| 6 | Como coordenador de escala, quero receber o resultado da análise do plantão, para saber se ele pode ou não ser publicado. | Alta| 1 |
| 7 | Como coordenador de escala, quero analisar mais de um plantão, para acompanhar a cobertura de diferentes turnos. | Média | 2 |
| 8 | Como coordenador de escala, quero cadastrar médicos com nome e especialidade, para identificar quem está alocado em cada plantão. | — | 3 |
| 9 | Como coordenador de escala, quero montar um plantão com médicos específicos, para saber exatamente quem trabalhará em cada turno. | — | 3 |

---

## 🛠 Tecnologias Utilizadas

| Ferramenta | Uso |
|---|---|
| **VisuAlg** | Ambiente de desenvolvimento principal (pseudocódigo) |
| **Pseudocódigo** | Lógica de programação — estruturas condicionais, repetição, vetores |
| **Git / GitHub** | Controle de versão e documentação |
| **Console / Texto** | Interface de interação com o usuário |

> ⚠️ Restrições do VisuAlg:
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
   - Informe a quantidade de cada especialidade (limite: 0 a 10)
   - Receba o diagnóstico: ✅ Pode publicar ou ❌ Motivo da reprovação

### Cenários de Teste
| Cenário | Resultado Esperado |
|---|---|
| Todos mínimos atingidos | ✅ Pode publicar |
| Faltando 1 Pediatra | ❌ Não pode — faltam 1 Pediatra |
| Quantidade negativa | ⚠️ Erro — valor inválido |
| Turno 4 | ⚠️ Erro — opção inválida |
| Valor > 10 | ⚠️ Erro — valor acima do limite |

---

## ✅ Definições de Pronto

### DoR — Pronto para Iniciar
- [ ] User story clara e compreendida pela equipe
- [ ] Critérios de aceite definidos
- [ ] Cenários de sucesso e erro mapeados
- [ ] Esforço estimado
- [ ] Sem impedimentos para iniciar

### DoD — Pronto para Entregar
- [ ] Código implementado no VisuAlg
- [ ] Passa em todos os cenários de teste
- [ ] Mensagens claras para o usuário
- [ ] Código versionado no GitHub
- [ ] Demonstração funcional na Sprint Review
- [ ] Documentação atualizada

---

## 📂 Estrutura do Repositório


---

## 👥 Equipe TechFlow

| Nome | Função |
|---|---|
| *Bruno Amaral* | Product Owner |
| *Amanda Mesquita* | Scrum Master |
| *Ana Clara Brito* | Desenvolvedor |
| *Guilherme Ribeiro* | Desenvolvedor |
| *Pedro Rosa* | Desenvolvedor |
| *Pedro Albino* | Desenvolvedor |
| *Karina Fernanda* | Desenvolvedor |

---

## 📌 Status do Projeto

| Fase | Status |
|---|---|
| Sprint 1 | Finalizada |
| Sprint 2 | ⏳ Planejada |
| Sprint 3 | ⏳ Planejada |

---

<p align="center"><strong>TechFlow</strong><br>
<em>API Inteligente. Soluções que Fluem.</em></p>



