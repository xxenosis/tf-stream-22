# Про датасорсы и объекты предподготовленной инфраструктуры

terraform {}

provider "aws" {
  region = "eu-central-1"

### TODO: Don't commit credentials! Move it to env vars or ~/.aws/credentials!
#  aws_access_key_id = ""
#  aws_secret_access_key = ""

}

data "aws_vpc" "predefined_default_vpc" {
  default = true
}

data "aws_subnet_ids" "list_of_predefined_subnets" {
  vpc_id = data.aws_vpc.predefined_default_vpc.id
}

output "info_default_vpc" {
  value = data.aws_vpc.predefined_default_vpc
}

output "predefined_subnets" {
  value = data.aws_subnet_ids.list_of_predefined_subnets
}
