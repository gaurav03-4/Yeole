# Two diffrent resources create in two diffrent region using alias word
provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  region = "us-east-1"
  alias = "provider-2"
}

resource "aws_instance" "name" {
  ami = "ami-0ddfba243cbee3768"
  instance_type = "t2.micro"
  key_name = "Gaurav_Mumbai_Region"
  tags = {
    Name = "dev"
  }
}

resource "aws_s3_bucket" "name" {
  bucket = "oppo78"
  provider = aws.provider-2
}

# same resource create into two different regions 
# provider "aws" {
#   region = "us-east-1"
# }

# provider "aws" {
#   region = "ap-south-1"
#   alias  = "mumbai"
# }

# variable "regions" {
#   type = map(object({
#     ami             = string
#     availability_zone = string
#   }))
#   default = {
#     "us-east-1"  = { ami = "ami-085ad6ae776d8f09c", availability_zone = "us-east-1a" }
#     "ap-south-1" = { ami = "ami-05169c5e5bfb48fb4", availability_zone = "ap-south-1a" }
#   }
# }

# resource "aws_instance" "multi_region" {
#   for_each = var.regions

#   ami             = each.value.ami
#   instance_type   = "t2.micro"
#   key_name        = "ec2test"
#   availability_zone = each.value.availability_zone

#   provider = each.key == "us-east-1" ? aws : aws.mumbai

#   tags = {
#     Name = "dev-${each.key}"
#   }
# }