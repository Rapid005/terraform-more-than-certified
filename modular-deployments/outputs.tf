output "application_access" {
  value       = module.container[*]
  description = "The ports and ip-address for the container"
}
