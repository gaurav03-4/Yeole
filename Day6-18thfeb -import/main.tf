resource "aws_instance" "import" {
  ami = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  key_name = "Gaurav_Mumbai_Region"
  tags = {
    Name = "dev"
  }
}