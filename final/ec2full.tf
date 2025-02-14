module "ec2_instance" {
  source = "git::https://github.com/amaan-igs/terraform-aws-ec2-instance.git"

  ami_id                = "ami-00bb6a80f01f03502"
  instance_type         = "t2.micro"
  subnet_id             = "subnet-0194c32a03d44fdbd"
  security_group_ids    = ["sg-07ea31bd8b8dab9f1"]
  instance_name         = "demo-sudo-friday"
  key_name              = "sudo"
  iam_instance_profile  = "instance-profile-igs" 
  root_volume_size      = 9  
  root_volume_type      = "gp2"
  root_volume_encryption = true
  enable_imdsv2         = true

  ebs_volumes = [
    {
      device_name = "/dev/xvdf"
      volume_size = 20
      volume_type = "gp2"
      encrypted   = true
    }
  ]

  tags = {
    Environment = "prod"
    Project     = "wayz-project"
  }
}
