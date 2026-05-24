resource "aws_security_group" "web_sg" {
  name = "olive-art-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "olive_server" {

  ami           = "ami-0c1ac8a41498c1a9c"
  instance_type = "t3.micro"

  key_name = "olive-art-devops-key"

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  tags = {
    Name = "OliveArtDevOps"
  }
}

output "server_ip" {

  value = aws_instance.olive_server.public_ip

}
