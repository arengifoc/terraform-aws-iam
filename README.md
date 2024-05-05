# terraform-aws-iam
Terraform module for creating the most common IAM resources

<!-- BEGIN_TF_DOCS -->
## IAM resources Terraform module

This module create some of the most common IAM resources

| Name                                           | Description                                |
| ---------------------------------------------- | ------------------------------------------ |
| [policies](examples/policies/)                 | Basic creation of policies                 |
| [users-and-groups](examples/users-and-groups/) | Creation of users and groups with policies |
| [roles](examples/roles/)                       | Creation of roles with policies            |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy) | resource |
| [aws_iam_group_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_groups"></a> [iam\_groups](#input\_iam\_groups) | Map of groups to create. | `any` | `{}` | no |
| <a name="input_iam_policies"></a> [iam\_policies](#input\_iam\_policies) | Map of users to create. | `any` | `{}` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | Map of roles to create. | `any` | `{}` | no |
| <a name="input_iam_users"></a> [iam\_users](#input\_iam\_users) | Map of users to create. | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_groups"></a> [groups](#output\_groups) | Map of attributes of groups created. |
| <a name="output_managed_policies"></a> [managed\_policies](#output\_managed\_policies) | Map of attributes of managed policies created. |
| <a name="output_roles"></a> [roles](#output\_roles) | Map of attributes of roles created. |
| <a name="output_user_access_keys"></a> [user\_access\_keys](#output\_user\_access\_keys) | Map of Access Key IDs and Secret Access Keys of users created. |
| <a name="output_users"></a> [users](#output\_users) | Map of attributes of users created. |
<!-- END_TF_DOCS -->