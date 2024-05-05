output "managed_policies" {
  description = "Map of attributes of managed policies created."

  value = {
    for key, value in aws_iam_policy.this :
    key => {
      arn       = value.arn
      name      = value.name
      policy_id = value.policy_id
    }
  }
}

output "roles" {
  description = "Map of attributes of roles created."

  value = {
    for k, v in aws_iam_role.this :
    k => {
      name = v.name
      arn  = v.arn
      inline_policies = [
        for key, value in aws_iam_role_policy.this :
        value.name if v.name == value.role
      ]

      managed_policies = [
        for key, value in aws_iam_role_policy_attachment.this :
        value.policy_arn if v.name == value.role
      ]
    }
  }
}

output "users" {
  description = "Map of attributes of users created."

  value = {
    for k, v in aws_iam_user.this :
    k => {
      name = v.name
      arn  = v.arn

      inline_policies = [
        for key, value in aws_iam_user_policy.this :
        value.name if v.name == value.user
      ]

      managed_policies = [
        for key, value in aws_iam_user_policy_attachment.this :
        value.policy_arn if v.name == value.user
      ]
    }
  }
}

output "groups" {
  description = "Map of attributes of groups created."

  value = {
    for k, v in aws_iam_group.this :
    k => {
      name = v.name
      arn  = v.arn
      inline_policies = [
        for key, value in aws_iam_group_policy.this :
        value.name if v.name == value.group
      ]

      managed_policies = [
        for key, value in aws_iam_group_policy_attachment.this :
        value.policy_arn if v.name == value.group
      ]
    }
  }
}

output "user_access_keys" {
  description = "Map of Access Key IDs and Secret Access Keys of users created."
  sensitive   = true

  value = {
    for k, v in aws_iam_access_key.this :
    k => {
      id     = v.id
      secret = v.secret
    }
  }
}
