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
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="ec2"></a> [ec2](#ec2) | ../ | v0.0.0 |


## Resources

| Name | Type |
|------|------|
| [aws\_storage\_account]() | resource |
| [aws\_storage\_container]() | resource |
| [aws\_storage\_blob]() | resource |

## Inputs

| Name | Input | Type |
|------|------|------|
| [prefix]() | 전체적인 서비스 이름( ex. 크립토네이도 -> ct ) | string |
| [env]() | 환경 ( ex. prod, stg, dev, alpha )| string |
| [purpose]() | 해당 리소스의 용도 ( ex. 스캐너 서버 -> {prefix}{env}-{scanner-api} )| string |
| [team]() | 담당 팀 ( ex. DevOps )| string |
| [location]() | Region | string |
| [sa\_name]() | Storage account 이름 | string |
| [sa\_tier]() | Storage account 서비스 단계 | string |
| [sa\_type]() | Storage account 데이터 관리 타입 | string |
| [sc\_name]() | Storage container 이름 | string |
| [ca\_type]() | container access 타입 | string |
| [sb\_name]() | Storage blob 이름 | string |
| [sb\_type]() | Storage blob 타입 | string |


## Outputs

| Name | Description |
|------|-------------|
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
