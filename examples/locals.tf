locals {
  prefix             = "main-test"
  env                = "test2"
  team               = "devops"
  purpose            = "test2"
  vpc_id             = "vpc-05319596e6a5ca558"
  #vpc_id            = data.terraform_remote_state.vpc.outputs.id
  subnet_id	     = "subnet-076606de8973075ed"
  #subnet_id	     = data.terraform_remote_state.vpc.outputs.private_subnets["ap-northeast-2a"].id
  #private_subnet_ids = values(data.terraform_remote_state.vpc.outputs.private_subnets)[*].id
  authorized_cidrs = distinct(concat([
    "10.77.77.0/24", "10.88.88.0/24"
  ]))
  #private_subnet_cidrs = values(data.terraform_remote_state.vpc.outputs.private_subnets)[*].cidr_block
  key_name             = "test-key"

  root_block_device = [
    {
      volume_size = 100
      volume_type = "gp3"
    }
  ]

  ebs_block_device = [
    {
      volume_size = 50
      volume_type = "gp3"
      device_name = "/dev/sdb"
    }
  ]
}
