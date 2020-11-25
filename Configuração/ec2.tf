
Com esse comando foi criado uma EC2 com ubuntu 20.04 e o tipo de instancia t2.medium

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

resource "aws_instance" "k8s-master01" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  vpc_security_group_ids = [ aws_security_group.k8s-master.id ,  aws_security_group.k8s-worker.id ,  aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.k8s.id
  tags = {
    Name = "K8s-master01"
  }
}

resource "aws_instance" "k8s-master02" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  vpc_security_group_ids = [ aws_security_group.k8s-master.id ,  aws_security_group.k8s-worker.id ,  aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.k8s.id
  tags = {
    Name = "K8s-master02"
  }
}

resource "aws_instance" "k8s-worker" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  vpc_security_group_ids = [ aws_security_group.k8s-master.id ,  aws_security_group.k8s-worker.id ,  aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.k8s.id
  tags = {
    Name = "K8s-worker"
  }
}