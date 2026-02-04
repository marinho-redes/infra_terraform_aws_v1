#=========================================================
# Definição da versão e do provider a ser utilizado pelo terrform.
#=========================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#==========================================================
# Região definida como us-east-1
#==========================================================

provider "aws" {
  region = "us-east-1"
}