variable "iam_users" {
  description = "Map of users to create."
  type        = any
  default     = {}
}

variable "iam_groups" {
  description = "Map of groups to create."
  type        = any
  default     = {}
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}
