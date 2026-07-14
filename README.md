[English](#english) | [Português](#português)

<a id="english"></a>
# QA Robot Framework & Python

[![CI/CD Pipeline](https://github.com/realleotavares/qa-robot-framework-python/actions/workflows/robot-pipeline.yml/badge.svg)](https://github.com/realleotavares/qa-robot-framework-python/actions)
[![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![Robot Framework](https://img.shields.io/badge/Robot_Framework-000000?logo=robotframework&logoColor=white)](https://robotframework.org/)
[![Live Report](https://img.shields.io/badge/Live_Report-GitHub_Pages-blue?logo=github)](https://realleotavares.github.io/qa-robot-framework-python/)

This is my secondary QA portfolio, dedicated to test automation using **Python** and **Robot Framework**. I use this repository to demonstrate how I write BDD (Behavior Driven Development) test scripts with Keyword-Driven architecture.

## Repository Architecture (Multi-Client)

Following enterprise standards, the test scripts are organized by client folders, demonstrating scalable modularity for Keyword-Driven Development.

```text
📁 qa-robot-framework-python/
├── 📄 README.md                   # This document
├── 📄 requirements.txt            # Python dependencies (robotframework-browser)
├── 📁 .github/workflows/          # CI/CD Pipelines (GitHub Actions & Pages)
│
├── 📁 comptia/                    # Portal tests
│   └── 📁 tests/
│       └── 📄 search_certification.robot # BDD scenarios
│
├── 📁 luxury-store/               # E-commerce tests
│   └── 📁 tests/
│       └── 📄 add_to_cart_flow.robot # BDD scenarios
│
├── 📁 dio/                        # Behavior Driven UI Validation
│   └── 📁 tests/
│       └── 📄 profile.robot       # BDD scenarios intercepting relative asset routes
│
└── 📁 tavardt/                    # Web Front-End testing
    └── 📁 tests/
        └── 📄 tavardt_ui.robot    # BDD scenarios and high-level test cases
```

## Live Quality Dashboard

> **[View Live HTML Test Report](https://realleotavares.github.io/qa-robot-framework-python/)**
> 
> Our CI/CD pipeline automatically publishes the latest Robot Framework execution report (`log.html` and `report.html`) to GitHub Pages. It provides full traceability of keyword execution, variables, and screenshots on failure.

## Quick Start (Developer Onboarding)

Want to run these BDD tests locally?

**Prerequisites:** [Python](https://www.python.org/downloads/) (v3.11+) and Node.js (for Browser library)

```bash
# 1. Clone the repository
git clone https://github.com/realleotavares/qa-robot-framework-python.git
cd qa-robot-framework-python

# 2. Create and activate a virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Initialize the Browser Library (downloads Playwright binaries internally)
rfbrowser init

# 5. Run the BDD Test Suite
robot -d results */tests/

# 6. The report will be generated at results/log.html
```

## The QA Engineering Ecosystem

This repository is part of a larger Quality Engineering ecosystem, demonstrating my ability to test applications across the entire testing pyramid. Check out the other layers:

- **[Playwright E2E Architecture](https://github.com/realleotavares/playwright-e2e-automation)** (Main E2E Framework)
- **[Pytest API Automation](https://github.com/realleotavares/pytest-api-automation)** (Backend JSON & Schema validation)
- **[QA Robot Framework & Python](https://github.com/realleotavares/qa-robot-framework-python)** (BDD & Keyword-Driven UI Testing)
- **[K6 Performance Testing](https://github.com/realleotavares/k6-performance-testing)** (Load, Stress & Spike Testing SLAs)

---
*This portfolio is governed by strict CI/CD and engineering standards.*

<br><br><br>

<a id="português"></a>
# QA Robot Framework & Python

[![CI/CD Pipeline](https://github.com/realleotavares/qa-robot-framework-python/actions/workflows/robot-pipeline.yml/badge.svg)](https://github.com/realleotavares/qa-robot-framework-python/actions)
[![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![Robot Framework](https://img.shields.io/badge/Robot_Framework-000000?logo=robotframework&logoColor=white)](https://robotframework.org/)
[![Live Report](https://img.shields.io/badge/Live_Report-GitHub_Pages-blue?logo=github)](https://realleotavares.github.io/qa-robot-framework-python/)

Este é o meu portfólio secundário de QA, focado especificamente em automação com **Python** e **Robot Framework**. Utilizo este repositório para demonstrar como escrevo scripts de teste baseados em BDD (Behavior Driven Development) usando uma arquitetura *Keyword-Driven*.

## Arquitetura do Repositório (Multi-Client)

Seguindo o padrão corporativo, os testes aqui são organizados por pastas de clientes. Isso me permite escalar a arquitetura baseada em Keywords mantendo a organização de um projeto real.

```text
📁 qa-robot-framework-python/
├── 📄 README.md                   # Este documento
├── 📄 requirements.txt            # Dependências Python (robotframework-browser)
├── 📁 .github/workflows/          # Pipeline de CI/CD (GitHub Actions)
│
├── 📁 comptia/                    # Testes do Portal
│   └── 📁 tests/
│       └── 📄 search_certification.robot # Cenários BDD
│
├── 📁 luxury-store/               # Testes de E-commerce
│   └── 📁 tests/
│       └── 📄 add_to_cart_flow.robot # Cenários BDD
│
├── 📁 dio/                        # Validação de UI Orientada a Comportamento
│   └── 📁 tests/
│       └── 📄 profile.robot       # Cenários BDD interceptando rotas relativas
│
└── 📁 tavardt/                    # Testes de interface web
    └── 📁 tests/
        └── 📄 tavardt_ui.robot    # Cenários BDD e casos de teste de alto nível
```

## Dashboard de Qualidade (Ao Vivo)

> **[Acessar Relatório HTML Interativo](https://realleotavares.github.io/qa-robot-framework-python/)**
> 
> Nossa pipeline CI/CD publica automaticamente o último relatório de execução do Robot Framework (`log.html`) no GitHub Pages. Ele provê rastreabilidade completa de execução de keywords, variáveis e screenshots de falhas.

## Quick Start (Onboarding de Desenvolvedores)

Quer rodar estes testes BDD na sua máquina?

**Pré-requisitos:** [Python](https://www.python.org/downloads/) (v3.11+) e Node.js (necessário para a Browser Library)

```bash
# 1. Clone o repositório
git clone https://github.com/realleotavares/qa-robot-framework-python.git
cd qa-robot-framework-python

# 2. Crie e ative um ambiente virtual
python -m venv venv
source venv/bin/activate  # No Windows: venv\Scripts\activate

# 3. Instale as dependências
pip install -r requirements.txt

# 4. Inicialize a Browser Library (baixa os binários do Playwright internamente)
rfbrowser init

# 5. Rode a suíte de testes BDD
robot -d results */tests/

# 6. O relatório será gerado no caminho results/log.html
```

## O Ecossistema de Engenharia de Qualidade

Este repositório faz parte de um ecossistema maior de Quality Engineering, demonstrando minha habilidade de testar aplicações em todas as camadas da Pirâmide de Testes. Conheça as outras camadas:

- **[Playwright E2E Architecture](https://github.com/realleotavares/playwright-e2e-automation)** (Framework Principal de E2E)
- **[Pytest API Automation](https://github.com/realleotavares/pytest-api-automation)** (Validação de Backend JSON & Schema)
- **[QA Robot Framework & Python](https://github.com/realleotavares/qa-robot-framework-python)** (Testes de UI BDD & Keyword-Driven)
- **[K6 Performance Testing](https://github.com/realleotavares/k6-performance-testing)** (SLAs de Load, Stress & Spike Testing)

---
*Este portfólio é governado por rigorosos padrões de CI/CD e engenharia de software.*

