
resource "aws_instance" "ec2" {
  ami = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  key_name = "Gaurav_Mumbai_Region"
  subnet_id = aws_subnet.public_subnet.id
  
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "EC2"
  }
}
