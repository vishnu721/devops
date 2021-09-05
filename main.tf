provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.micro"
    key_name = "LinuxServer"
    subnet_id = "subnet-0234a4f33271ada2f"
    vpc_security_group_ids = ["sg-0f7bcaae06d0c6bf0"]

    tags = {
        Name = "WebServer"
    }
}