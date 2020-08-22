# Conectando ao provider - aws
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
}

## Criando os securitys groups ##
# Liberando porta 22
resource "aws_security_group" "acesso_ssh" {
  name        = "acesso_ssh"
  description = "Liberando acessos aos servidores via SSH"

  ingress {
    from_port   = 22
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Acesso SSH"
  }
}

# Liberando porta 8080
resource "aws_security_group" "acesso_http" {
  name        = "acesso_http"
  description = "Liberando acessos web via http"

  ingress {

    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Acesso Http"
  }
}

# Configurando as instâncias
resource "aws_instance" "telemetria" {
    count = 3
    ami = "ami-07fb7bd53bacdfc16"
    instance_type = "t2.micro"
    key_name = "bootcamp_devops"
    tags = {
        Name = "telemetria${count.index}"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}", "${aws_security_group.acesso_http.id}", "sg-304fc64d"]

}
