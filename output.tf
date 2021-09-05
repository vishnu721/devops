output "private_ip" {
  value       = aws_instance.webserver.*.private_ip
  description = "Private IP of instance."
}