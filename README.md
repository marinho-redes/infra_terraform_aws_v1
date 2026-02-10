# Projeto DevOps – Provisionamento de Infraestrutura na AWS com Terraform e CI/CD

## Visão Geral

Este projeto foi desenvolvido com o objetivo de demonstrar competências práticas em DevOps, simulando um cenário próximo ao de um ambiente corporativo real. A solução implementa infraestrutura como código na AWS utilizando Terraform, com pipelines de CI/CD automatizadas através do GitHub Actions.

O foco do projeto está na automação segura do provisionamento de recursos, controle de custos em cloud pública, padronização de código e boas práticas de CI/CD, evitando ações destrutivas automáticas e priorizando rastreabilidade e controle.

---

## Objetivos do Projeto

* Implementar infraestrutura como código utilizando Terraform
* Automatizar validações e planejamento da infraestrutura via CI/CD
* Aplicar boas práticas de versionamento e padronização
* Garantir controle de custos utilizando exclusivamente recursos Free Tier
* Simular um fluxo DevOps real, com separação clara entre validação, planejamento e aplicação

---

## O que este projeto demonstra

Este projeto demonstra conhecimento prático em:

* Infraestrutura como Código (IaC)
* Provisionamento de recursos na AWS
* Automação com GitHub Actions
* Criação de pipelines CI/CD para Terraform
* Controle de mudanças através de `plan` antes de `apply`
* Execução manual de ações sensíveis (`apply` e `destroy`)
* Boas práticas de segurança e controle de acesso

---

## Tecnologias Utilizadas

* Terraform
* AWS (EC2, Security Groups, S3)
* GitHub Actions
* Git
* Visual Studio Code

---

## Arquitetura do Projeto

* Instância EC2 (Free Tier) executando Amazon Linux
* Servidor Nginx configurado via `user_data`
* Security Group permitindo acesso HTTP (80) e SSH (22)
* Bucket S3 para armazenamento de artefatos
* Pipelines CI/CD para automação do Terraform

---

## Estrutura de Diretórios

```
projeto_devops1/
├── terraform/
│   ├── ec2.tf
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── security_groups.tf
│   ├── s3.tf
│   └── key_pairs.tf
│
├── .github/
│   └── workflows/
│       ├── terraform-init.yml
│       ├── terraform-fmt-validate.yml
│       ├── terraform-plan.yml
│       ├── terraform-apply.yml
│       └── terraform-destroy.yml
│
└── README.md
```

---

## Pipelines de CI/CD (GitHub Actions)

Os pipelines foram separados em etapas independentes, seguindo boas práticas utilizadas em ambientes profissionais.

### Terraform Init

Inicializa o Terraform e faz o download dos providers necessários.

### Terraform Fmt & Validate

Verifica a padronização do código (`terraform fmt`) e valida a sintaxe (`terraform validate`).

### Terraform Plan

Gera o plano de execução da infraestrutura, sem aplicar alterações.

### Terraform Apply

Aplica a infraestrutura na AWS. Este workflow é configurado para execução manual (`workflow_dispatch`).

### Terraform Destroy

Remove todos os recursos criados pelo Terraform. Também configurado para execução manual.

---

## Controle de Custos

A arquitetura e os pipelines foram projetados com foco em evitar custos desnecessários, especialmente em uma conta AWS pessoal.

Este projeto foi planejado para operar exclusivamente dentro do Free Tier da AWS:

* Instância EC2 do tipo `t2.micro` ou `t3.micro`
* Uso pontual e controlado do S3
* Execução manual de `apply` e `destroy`

É altamente recomendado executar o workflow de destroy após os testes para evitar cobranças inesperadas.

---

## Segurança e Boas Práticas

* As credenciais da AWS são armazenadas de forma segura usando GitHub Secrets
* O usuário IAM utilizado não possui acesso ao Console da AWS
* As permissões são restritas ao necessário para execução do Terraform

---

## Como Executar Localmente

```bash
cd terraform
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

Para destruir a infraestrutura:

```bash
terraform destroy
```

---

## Possíveis Evoluções do Projeto

Este projeto foi estruturado para permitir evolução gradual, simulando crescimento de maturidade DevOps.

* Backend remoto com S3 e DynamoDB para controle de state
* Separação por ambientes (dev, stage, prod)
* Uso de módulos Terraform
* Autenticação AWS via OIDC (sem Access Keys)
* Geração de diagramas de arquitetura

---

## Autor

Raul Marinho

Projeto desenvolvido para fins educacionais e de portfólio em DevOps.
