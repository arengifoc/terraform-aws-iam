output "managed_policies" {
  description = "Map of attributes of managed policies created."
  value       = module.iam.managed_policies
}

output "roles" {
  description = "Map of attributes of roles created."
  value       = module.iam.roles
}

output "users" {
  description = "Map of attributes of users created."
  value       = module.iam.users
}

output "groups" {
  description = "Map of attributes of groups created."
  value       = module.iam.groups
}

output "user_access_keys" {
  description = "Map of Access Key IDs and Secret Access Keys of users created."
  sensitive   = true
  value       = module.iam.user_access_keys
}
