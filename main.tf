## --------------------------------------------------------
## Resources
## --------------------------------------------------------
#
# Managed policies
#
resource "aws_iam_policy" "this" {
  for_each = var.iam_policies

  name        = try(each.value.name, null)
  name_prefix = try(each.value.name_prefix, null)
  description = try(each.value.description, null)
  path        = try(each.value.path, "/")
  policy      = each.value.json_document

  tags = merge(var.tags, try(each.value.tags, {}))
}

#
# Roles
#
resource "aws_iam_role" "this" {
  for_each = var.iam_roles

  name                  = try(each.value.name, null)
  name_prefix           = try(each.value.name_prefix, null)
  description           = try(each.value.description, null)
  path                  = try(each.value.path, "/")
  assume_role_policy    = each.value.assume_role_policy
  force_detach_policies = try(each.value.force_detach_policies, false)
  permissions_boundary  = try(each.value.permissions_boundary, null)
  max_session_duration  = max(3600, min(try(each.value.max_session_duration, 3600), 43200))

  tags = merge(var.tags, try(each.value.tags, {}))
}

#
# Inline policies for roles
#
locals {
  iam_role_inline_policies = merge(flatten([
    for key, value in var.iam_roles :
    {
      for item in setproduct([key], try(keys(value.inline_policies), [])) :
      "${item[0]}:${item[1]}" => {
        role   = item[0]
        name   = item[1]
        policy = value.inline_policies[item[1]]
      }
    }
  ])...)
}

resource "aws_iam_role_policy" "this" {
  for_each = local.iam_role_inline_policies

  name   = each.value.name
  role   = aws_iam_role.this[each.value.role].name
  policy = each.value.policy
}

#
# Managed policies for roles
#
locals {
  iam_role_managed_policies = merge(flatten([
    for key, value in var.iam_roles :
    {
      for item in setproduct([key], try(toset(value.managed_policies), [])) :
      "${item[0]}:${item[1]}" => {
        role = value.name
        arn  = item[1]
      }
    }
  ])...)
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = local.iam_role_managed_policies

  role       = each.value.role
  policy_arn = each.value.arn
}

#
# Groups creation
#
resource "aws_iam_group" "this" {
  for_each = var.iam_groups

  name = each.value.name
  path = try(each.value.path, "/")
}

#
# Inline policies for groups
#
locals {
  iam_group_inline_policies = merge(flatten([
    for key, value in var.iam_groups :
    {
      for item in setproduct([key], try(keys(value.inline_policies), [])) :
      "${item[0]}:${item[1]}" => {
        group  = item[0]
        name   = item[1]
        policy = value.inline_policies[item[1]]
      }
    }
  ])...)
}

resource "aws_iam_group_policy" "this" {
  for_each = local.iam_group_inline_policies

  name   = each.value.name
  group  = aws_iam_group.this[each.value.group].name
  policy = each.value.policy
}

#
# Groups memberships
#
resource "aws_iam_group_membership" "this" {
  for_each = {
    for key, value in var.iam_groups :
    key => value if try(length(value.members), 0) > 0
  }

  name  = "${each.key}-group-membership"
  users = each.value.members
  group = aws_iam_group.this[each.key].name
}

#
# Managed policies for groups
#
locals {
  iam_group_managed_policies = merge(flatten([
    for key, value in var.iam_groups :
    {
      for item in setproduct([key], try(toset(value.managed_policies), [])) :
      "${item[0]}:${item[1]}" => {
        group = value.name
        arn   = item[1]
      }
    }
  ])...)
}

resource "aws_iam_group_policy_attachment" "this" {
  for_each = local.iam_group_managed_policies

  group      = each.value.group
  policy_arn = each.value.arn
}

#
# Users creation
#
resource "aws_iam_user" "this" {
  for_each = var.iam_users

  name          = each.value.name
  path          = try(each.value.path, "/")
  force_destroy = try(each.value.force_destroy_iam_user, false)

  tags = merge(var.tags, try(each.value.tags, {}))
}

#
# Access Keys creation for users
#
locals {
  iam_access_keys = merge(flatten([
    for key, value in var.iam_users :
    {
      for item in setproduct([key], range(max(0, min(try(value.num_access_keys, 0), 2)))) :
      "${item[0]}:${item[1]}" => key
    }
  ])...)
}

resource "aws_iam_access_key" "this" {
  for_each = local.iam_access_keys

  user = aws_iam_user.this[each.value].name
}

#
# Inline policies for users
#
locals {
  iam_user_inline_policies = merge(flatten([
    for key, value in var.iam_users :
    {
      for item in setproduct([key], try(keys(value.inline_policies), [])) :
      "${item[0]}:${item[1]}" => {
        user   = item[0]
        name   = item[1]
        policy = value.inline_policies[item[1]]
      }
    }
  ])...)
}

resource "aws_iam_user_policy" "this" {
  for_each = local.iam_user_inline_policies

  name   = each.value.name
  user   = aws_iam_user.this[each.value.user].name
  policy = each.value.policy
}

#
# Managed policies for users
#
locals {
  iam_user_managed_policies = merge(flatten([
    for key, value in var.iam_users :
    {
      for item in setproduct([key], try(toset(value.managed_policies), [])) :
      "${item[0]}:${item[1]}" => {
        user = value.name
        arn  = item[1]
      }
    }
  ])...)
}

resource "aws_iam_user_policy_attachment" "this" {
  for_each = local.iam_user_managed_policies

  user       = each.value.user
  policy_arn = each.value.arn
}
