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

resource "tls_private_key" "ec2_private_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
    #provisioner "local-exec" {
      #command = "echo '${tls_private_key.ec2_private_key.private_key_pem}' > /var/lib/jenkins/workspace/webserver-pipeline/${aws_instance.webserver.key_name}.pem"
    #}
}

resource "local_file" "ssh_pem" {
  filename = "/var/lib/jenkins/workspace/webserver-pipeline/cloud.pem"
  content = tls_private_key.ec2_private_key.private_key_pem
  file_permission = 400
  
}

#resource "null_resource" "key-perm" {
 #   depends_on = [
  #    tls_private_key.ec2_private_key,
   # ]
    #provisioner "local-exec" {
    #  command = "chmod 400 /var/lib/jenkins/workspace/webserver-pipeline/${aws_instance.webserver.key_name}.pem"
    #}
#}