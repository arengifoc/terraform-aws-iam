data "aws_caller_identity" "current" {}

module "iam" {
  source = "../../"

  iam_roles = {
    EC2SecretReader = {
      name               = "EC2SecretReader"
      description        = "Role for EC2 instances with access to read secrets from Secrets Manager."
      assume_role_policy = file("secrets-reader-assumerole.json.tpl")

      inline_policies = {
        SecretsReader = templatefile(
          "secrets-reader.json.tpl",
          {
            account_id = data.aws_caller_identity.current.account_id
          }
        )
      }

      managed_policies = [
        "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
        "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
      ]
    }
  }
}
