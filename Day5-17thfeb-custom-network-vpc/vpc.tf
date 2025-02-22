#creating vpc
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Gaurav"
  }
}

#creating public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true  # This enables auto-assign public IP
  tags = {
    Name = "subnet-1"
  }
}

#creating private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
}

#creating IG
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Internet gateway"
  }
}

#creating RT and edit route
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  
    route {
      gateway_id = aws_internet_gateway.ig.id
      cidr_block = "0.0.0.0/16"
  }

  
}


#RT to Subnet connection (subent association)
resource "aws_route_table_association" "name" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.public_subnet.id
  
}

# Create nat gateway for private subnet
# Create route for private subnets and edit routes 
# route table association 

#Create securtiy group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "TLS from ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    description = "TLS from ssh"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}