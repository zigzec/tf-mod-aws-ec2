resource "random_string" "random" {
  length  = 10
  special = false
}

# public image
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

module "ec2" {
  source = "../"
  #source = "git@github.com:zigzec/tf-mod-aws-ec2.git?ref=v0.0.0"

  prefix  = local.prefix
  env     = local.env
  team    = local.team
  purpose = local.purpose

  vpc_id                      = local.vpc_id
  subnet_id                   = local.subnet_id
  ami_id                      = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  associate_public_ip_address = false
  ebs_optimized               = true
  key_name                    = aws_key_pair.this.key_name
  source_dest_check           = true
  vpc_security_group_ids      = [aws_security_group.this.id]
  root_block_device           = local.root_block_device
  ebs_block_device            = local.ebs_block_device

  required_iam_role   = false
  required_eip        = false

  ## only required_iam_role = true
  #role_name           = "ec2-readonly-test"
}
