module "ec2_instance" {
  source = "git::https://github.com/amaan-igs/terraform-aws-ec2-instance.git"

  ami_id                 = "ami-00bb6a80f01f03502"    # Required
  instance_type          = "t2.micro"                 # Optional (default: t2.micro)
  subnet_id              = "subnet-0194c32a03d44fdbd" # Required
  security_group_ids     = ["sg-07ea31bd8b8dab9f1"]   # Required
  instance_name          = "1-2-instance"             # Required
#   iam_instance_profile   = "data-engineer" # Optional
  root_volume_encryption = true                       # Optional (default: true)
  enable_imdsv2          = true                       # Optional (default: true)
  key_name               = "sudo"

  ebs_volumes = [
    {
      device_name = "/dev/xvdf"
      volume_size = 20
      volume_type = "gp2"
      encrypted   = true
    }
  ]

  tags = {
    Environment = "dev"          # Optional
    Project     = "sudo-project" # Optional
  }
}

output "public_ip" {
  value = module.ec2_instance.public_ip
}

output "private_ip" {
  value = module.ec2_instance.private_ip
}

output "instance_name" {
  value = module.ec2_instance.instance_name
}


output "instance_type" {
  value = module.ec2_instance.instance_type
}

output "key_name" {
  value = module.ec2_instance.key_name
}

output "root_volume_size" {
  value = module.ec2_instance.root_volume_size
}

output "ebs_volumes" {
  value = module.ec2_instance.ebs_volumes
}

output "tags" {
  value = module.ec2_instance.tags
}