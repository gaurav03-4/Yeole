terraform {
  backend "s3" {
    bucket = "yeole" 
    key    = "terraform.tfstate"
    region = "ap-south-1"
    tags = "dev"
  }
}
