

resource "aws_instance" "web" {
  ami               = var.ami_id
  instance_type     = "t2.micro"
  key_name          = "ansi-aws-centos"
  availability_zone = "us-east-2a"
  subnet_id         = "subnet-0038c568fd40b5ae7"

  tags = {
    Name = "Helloworld"
  }

  vpc_security_group_ids = [
    aws_security_group.helloworld.id,
  ]
}