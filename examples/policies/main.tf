module "iam" {
  source = "../../"

  iam_policies = {
    WebmasterPolicy = {
      name          = "WebmasterPolicy"
      description   = "Policy used for webmasters"
      json_document = file("webmaster-policy.json")
    }

    BackupsOperatorPolicy = {
      name          = "BackupsOperatorPolicy"
      description   = "Policy used for Backup Operators"
      json_document = file("backup-operators-policy.json")
    }
  }
}
