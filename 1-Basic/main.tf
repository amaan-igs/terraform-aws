provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "test" {
    ami           = "ami-00bb6a80f01f03502"
    instance_type = "t2.micro"
    subnet_id = "subnet-0194c32a03d44fdbd"
    key_name = "igs--1"
}