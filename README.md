## Usage

To run this example you need to execute:

```bash

terraform plan
terraform apply
--------------------
atlantis plan
atlantis apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="ec2"></a> [ec2](#ec2) | ../ | v0.0.0 |


## Resources

| Name | Type | Require |
|------|------|----------|
| [aws\_instance]() | resource |  |
| [aws\_eip]() | resource |  |
| [aws\_iam\_instance\_profile]() | resource |  |
| [aws\_key\_pair]() | resource |  |
| [aws\_security\_group]() | resource |  |

## Inputs

| Name | Input | Type |
|------|------|------|
| [prefix]() | The service name | string |
| [env]() | Environment like prod, stg, dev, alpha ... | string |
| [purpose]() | The team tag used to managed resources | string |
| [team]() | The team tag used to managed resources | string |
| [vpc\_id]() | The VPC id for EC2 instance | string |
| [subnet\_id]() | The subnet id for EC2 instance | string |
| [ami\_id]() | The AMI id for EC2 instance | string |
| [instance\_type]() | The instance type for EC2 instance | string |
| [associate\_public\_ip\_address]() | Whether to associate a public IP address with an instance in a VPC | bool |
| [ebs\_optimized]() | If true, the launched EC2 instance will be EBS-optimized | bool |
| [key\_name]() | The key name for EC2 instance | string |
| [source\_dest\_check]() | Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. | string |
| [vpc\_security\_group\_ids]() | The security group ids for EC2 instance | list(string) |
| [user\_data]() | The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead. | string |
| [root\_block\_device]() | Customize details about the root block device of the instance. See Block Devices below for details | string |
| [ebs\_block\_device]() | Additional EBS block devices to attach to the instance | string |
| [metadata\_options]() | Customize the metadata options of the instance | string |
| [iam\_instance\_profile]() | IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile | string |
| [required\_iam\_role]() | Whether IAM role is required | bool |
| [required\_eip]() | Whether EIP is required | bool |
| [attached\_policy\_arn]() | attachecd policy to role | list(string) |
| [role\_name]() | After creating ec2, write role that exists name | string |


## Outputs

| Name | Description |
|------|-------------|
| [instance_id]() | Instance ID |
| [private_ip]() | Private IP |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
