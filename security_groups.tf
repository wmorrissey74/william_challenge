resource "aws_security_group" "helloworld" {
  name        = "helloworld"
  description = "Allow access for ssh and http"
  vpc_id      = "vpc-05171faed78691c10"

  ingress {
    description = "allow https traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow http traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssh traffic"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["76.217.11.46/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_traffic_from_home"
  }
}
