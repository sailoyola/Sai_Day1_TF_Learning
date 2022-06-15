/* output "public_ip" {
  #value = aws_instance.web.public_ip
  value=module.server.public_ip
}

output "public_dns" {
  #value = aws_instance.web.public_dns
  value= module.server.public_dns
} */

output "public_ip" {
  value = aws_instance.web.*.public_ip
}

output "public_dns" {
  value = aws_instance.web.*.public_dns
}