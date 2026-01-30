# 💰 Cost Center Service API

[![Go Version](https://img.shields.io/badge/Go-1.21+-00ADD8?style=for-the-badge&logo=go&logoColor=white)](https://go.dev/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)

Este projeto foi desenvolvido como parte de um desafio acadêmico com o objetivo de **otimizar a gestão de centros de custo** de uma empresa. A API permite que funcionários lancem despesas e que gestores (executivos) aprovem, recusem e monitorem os gastos por área e centro de custo.

---

## 🚀 Funcionalidades Principais

### Para Executivos (Gestores)
* **Gestão de Centros de Custo:** Criação e visualização de centros de custo (Produtivos e Não-Produtivos).
* **Gestão de Pessoal:** Cadastro de funcionários e associação automática via ID de centro de custo.
* **Fluxo de Aprovação:** Interface para validar ou recusar despesas variáveis enviadas pela equipe.
* **Monitoramento:** Filtros de gastos por área, por centro de custo e por funcionário específico.

### Para Funcionários
* **Lançamento de Despesas:** Registro detalhado de custos (valor, categoria, método de pagamento, observações).
* **Autenticação:** Sistema de login seguro e registro de perfil.

---

## 🛠️ Tech Stack & Arquitetura

A aplicação foi construída utilizando **Go (Golang)**, focando em performance e manutenibilidade através da **Clean Architecture**:



* **Linguagem:** Go 1.21+
* **Banco de Dados:** PostgreSQL (Interfaceado com `sqlx` e `pgx`).
* **Geração de Código:**
    * **OpenAPI:** Contrato definido em `api_docs.yml` para geração automática do servidor.
    * **SQLC:** Queries SQL puras convertidas automaticamente em código Go seguro.
* **Logging:** Logs estruturados com `uber-go/zap`.
* **Ambiente:** Docker e Docker Compose.

---

## 🔧 Como Executar

### 1. Pré-requisitos
* Go instalado (v1.21 ou superior)
* Docker e Docker Compose

### 2. Configuração do Ambiente
Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis (ajuste conforme seu ambiente):
```env
DATABASE_USER=postgres
DATABASE_PASSWORD=postgres
DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_NAME=cost_center_db
AUTHORIZATION_SERVICE=seu_token_aqui
```

## 📝 Documentação da API

A API foi documentada utilizando o padrão **OpenAPI 3.0**. O contrato técnico detalhado, contendo os modelos de dados (schemas) e as definições de segurança, pode ser consultado no arquivo:
👉 `api/api_docs.yml`

### Principais Endpoints

| Método | Endpoint | Descrição | Tag |
| :--- | :--- | :--- | :--- |
| `POST` | `/api/v1/login` | Autenticação | `user` |
| `POST` | `/api/v1/cost-centers` | Cadastro de novos centros de custo | `executive` |
| `POST` | `/api/v1/create-variable-cost/{id}` | Registro de uma nova despesa variável | `cost` |
| `PATCH` | `/api/v1/variable-cost` | Aprovação ou rejeição de despesas | `executive` |
| `GET` | `/api/v1/variable-cost/by-cost-center/{id}` | Relatório de despesas por centro de custo | `executive` |
| `GET` | `/api/v1/employees/by-cost-center/{id}` | Listagem de funcionários por centro de custo | `executive` |


