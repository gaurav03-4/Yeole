provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

# Create a VPC (optional if you already have a VPC)
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet with auto-assign public IP enabled
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"  # Change to your desired AZ
  map_public_ip_on_launch = true  # This enables auto-assign public IP
}

# Create an internet gateway (if you want to allow public access)
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

# Create an EC2 instance in the subnet
resource "aws_instance" "example" {
  ami           = "ami-027951e78de46a00e"  # Change to a valid AMI in your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "ExampleInstance"
  }
}
