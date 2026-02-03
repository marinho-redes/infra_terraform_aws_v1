#=========================================================
#Instâncias EC2
#=========================================================

#Instância ami t3.micro
resource "aws_instance" "web" {
    ami           = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type

    subnet_id = aws_subnet.public.id

    vpc_security_group_ids = [
        aws_security_group.web_sg.id
    ]

#Automação para instalação e ativação do serviço nginx / Teste HTML 
    user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Site do projeto DevOps com Terraform </h1>" > /usr/share/nginx/html/index.html
              EOF

#Tags de identificação da instância
    tags = {
        Name       = "devops-web"
        Project    = "Projeto DevOps10"
        Owner      = "Raul Marinho"
        Enviroment = "dev"
    }
}