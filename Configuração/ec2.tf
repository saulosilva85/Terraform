Com esse comando foi criado 3 EC2 com ubuntu 20.04

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "server 01" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  vpc_security_group_ids = [ aws_security_group.k8s-master.id ,  aws_security_group.k8s-worker.id ,  aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.k8s.id
  tags = {
    Name = "server 01"
  }
}

resource "aws_instance" "server 02" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  vpc_security_group_ids = [ aws_security_group.k8s-master.id ,  aws_security_group.k8s-worker.id ,  aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.k8s.id
  tags = {
    Name = "server 02"
  }
}

resource "aws_instance" "server 03" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  vpc_security_group_ids = [ aws_security_group.k8s-master.id ,  aws_security_group.k8s-worker.id ,  aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.k8s.id
  tags = {
    Name = "server 03"
  }
}