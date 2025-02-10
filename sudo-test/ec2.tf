module "sudo-vpc" {
  source  = "sudo-terraform-aws-modules/sudo-vpc/aws"
  version = "0.0.1"
}
module "ec2_instance" {
  source = "git::https://github.com/amaan-igs/terraform-aws-ec2-instance.git"

  ami_id             = "ami-00bb6a80f01f03502"
  instance_type      = "t2.micro"
  subnet_id          = "subnet-0194c32a03d44fdbd"
  security_group_ids = ["sg-07ea31bd8b8dab9f1"]
  instance_name      = "hehe-test"
  key_name = "sudo"
  root_volume_size = 9

  tags = {
    Environment = "dev"
  }

}

output "public_ip" {
  value = module.ec2_instance.public_ip
}

output "private_ip" {
  value = module.ec2_instance.private_ip
}