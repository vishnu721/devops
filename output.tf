output "public_ip" {
  value       = aws_instance.webserver.*.public_ip
  description = "Public IP of instance."
}