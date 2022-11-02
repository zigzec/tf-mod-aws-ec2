provider "aws" {
  region = "ap-northeast-2"
}

resource "random_string" "random" {
  length  = 10
  special = false
}

resource "aws_key_pair" "this" {
  key_name   = "ec2-module-test2-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCykuvv6TwZxSap3UrXdzNWmfhyopAA8xtaROOA13pJHx/TxQKJmdI/NOM/Gtizmwcg8dBMZdtZqLHm6EBPrfvDGm3axTXrQBULQfjQh4mwtjIjrD6qJvkSiYf0KrVVYW60Zam/Z6RtijQvrPDfcazHTpdSEo+cdEe3sGwPM2T0KvN3RWsANhzn4j8jUx4SH9yRqDm3KxXUk4/2D8GZzKZ1ml2hjktI6q4Mm4Z9VB7TnKA+V0U43NvU2/GWtHZcRmDKM6a/LYpYyw9jxfNv2WK+tiIeWzVDSZci00C7tcrlVI33mRp8u9QaUd4tAXMYSSomVGbyDlL2ZF6xytPlHQHRfirtuNso5lfp+6fVocVe/Rz/OsYwU3dkY1T5z+KXiy/TEV04H2dpWCZdbd0gyunuxM1inructBIYsVEIs/9cOSyk59iWwN2ANppyEINWAmuc8t10F/tex4/kechQ2SHGRYezUC90FjmDXImw9NzUTQmEIM0PdMX6plQgNXkz6i8= ec2-module-test-key"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20211129"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_security_group" "this" {
  name   = format("tf-mod-ec2-test-%s-sg", random_string.random.result)
  vpc_id = aws_vpc.this.id

  ingress {
    protocol    = "tcp"
    from_port   = 12017
    to_port     = 12017
    description = "allow e port from self"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ec2" {
  source = "../"

  prefix  = "ct"
  env     = "test"
  team    = "ops"
  purpose = "mongodb"

  vpc_id                      = aws_vpc.this.id
  subnet_id                   = aws_subnet.subnet1.id
  ami_id                      = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  ebs_optimized               = true
  key_name                    = aws_key_pair.this.key_name
  source_dest_check           = true
  vpc_security_group_ids      = [aws_security_group.this.id]
  root_block_device = [
    {
      volume_size = 50
      volume_type = "gp3"
    }
  ]
  required_iam_role   = true
  required_eip        = false
  attached_policy_arn = ["arn:aws:iam::076218763980:policy/owen-quicksight-policy"]
  role_name           = "cttest-mongodb-role"
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "iam_role_arn" {
  value = module.ec2.iam_role_arn
}
