module "iam" {
  source = "../../"

  iam_users = {
    diego = { name = "dsanchez", num_access_keys = 1 }

    angel = {
      name            = "angel"
      num_access_keys = 2

      inline_policies = {
        default = file("angel-default-inline-policy.json")
        admin   = file("angel-admin-inline-policy.json")
      }
    }
  }

  iam_groups = {
    admins = {
      name    = "admins"
      members = ["arengifo"]

      inline_policies = {
        administrator = file("admins-administrator-inline-policy.json")
      }
    }
  }
}

