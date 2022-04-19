output "key_name" {
  description = "The name of the key pair key"
  value       = module.ec2_key_pair.key_name
}
