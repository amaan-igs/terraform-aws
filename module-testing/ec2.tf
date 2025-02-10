module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"

  name = "test-10"
  instance_type = "t2.micro"
  ami = "ami-00bb6a80f01f03502"
  key_name = "igs--1"

    vpc_security_group_ids = ["sg-07ea31bd8b8dab9f1"]
    tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  
}