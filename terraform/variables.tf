#=======================================================
#Valores atribuídos às variáveis
#=======================================================

variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da EC2 (Free Tier)"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Nome da chave SSH"
  type        = string
  default     = null
}
