resource "aws_instance" "EC2" {
  ami = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  key_name = "Gaurav_Mumbai_Region"
  tags = {
    Name = "EC2_Test"
  }
}