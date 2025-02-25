resource "aws_instance" "ec2" {
  ami = "ami-0ddfba243cbee3768"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name = "Gaurav_Mumbai_Region"
  tags = {
    Name = "dev"
  }

#below examples are for lifecycle meta_arguments 

#lifecycle {
#   create_before_destroy = true   #this attribute will create the new object first and then destroy the old one
#}

lifecycle {
   prevent_destroy = truecl #Terraform will error when it attempts to destroy a resource when this is set to true:
}

#lifecycle {
#   ignore_changes = [tags] #This means that Terraform will never update the object but will be able to create or destroy it.
#}
}