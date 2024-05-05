variable "iam_policies" {
  description = "Map of users to create."
  type        = any
  default     = {} # Map of objects. See below

  # --------------------------------
  # Descriptions
  # --------------------------------
  #
  # Attribute  : name
  # Data type  : string
  # Required   : no
  # Default    : null
  # Description: Name of the IAM policy. Conflicts with name_prefix.
  #
  # Attribute  : name_prefix
  # Data type  : string
  # Required   : no
  # Default    : null
  # Description: Creates a unique name beginning with the specified prefix.
  # Conflicts with name.
  #
  # Attribute  : description
  # Data type  : string
  # Required   : no
  # Default    : null
  # Description: Description of the IAM policy.
  #
  # Attribute  : path
  # Data type  : string
  # Required   : no
  # Default    : /
  # Description: Path in which to create the policy.
  #
  # Attribute  : json_document
  # Data type  : string
  # Required   : yes
  # Description: Policy document. This is a JSON formatted string.
  #
  # Attribute  : tags
  # Data type  : map(string)
  # Required   : no
  # Default    : {}
  # Description: Tags for the policy.
  #
}

variable "iam_roles" {
  description = "Map of roles to create."
  type        = any
  default     = {} # Map of objects. See below

  # --------------------------------
  # Descriptions
  # --------------------------------
  #
  # Attribute  : name
  # Data type  : string
  # Required   : no
  # Default    : null
  # Description: Name of the IAM role. Conflicts with name_prefix.
  #
  # Attribute  : name_prefix
  # Data type  : string
  # Required   : no
  # Default    : null
  # Description: Creates a unique name beginning with the specified prefix.
  # Conflicts with name.
  #
  # Attribute  : description
  # Data type  : string
  # Required   : no
  # Default    : null
  # Description: Description of the IAM role.
  #
  # Attribute  : path
  # Data type  : string
  # Required   : no
  # Default    : /
  # Description: Path in which to create the role.
  #
  # Attribute  : tags
  # Data type  : map(string)
  # Required   : no
  # Default    : {}
  # Description: Tags for the role.
  #
  # Attribute  : assume_role_policy
  # Data type  : string
  # Required   : yes
  # Description: Policy that grants an entity permission to assume the role.
  #
  # Attribute  : force_detach_policies
  # Data type  : bool
  # Required   : no
  # Default    : false
  # Description: Whether to force detaching any policies the role has before
  # destroying it.
  #
  # Attribute  : max_session_duration
  # Data type  : number
  # Required   : no
  # Default    : 3600
  # Description: Maximum session duration (in seconds) that you want to set for
  # the specified role. This setting can have a value from 3600 (1 hour) to
  # 43200 (12 hours).
  #
  # Attribute  : permissions_boundary
  # Data type  : string
  # Required   : no
  # Default    : null
  # Description: ARN of the policy that is used to set the permissions boundary
  # for the role.
  #
  # Attribute  : inline_policies
  # Data type  : map(string)
  # Required   : no
  # Default    : {}
  # Description: Map of strings that create one or more inline policies for the
  # role. The key is policy name, whereas the value is the JSON document
  # of the IAM policy.
  #
  # Attribute  : managed_policies
  # Data type  : list(string)
  # Required   : no
  # Default    : []
  # Description: List of strings that represent the ARNs of the managed policies
  # that will be attach to the role.
  #
}

variable "iam_users" {
  description = "Map of users to create."
  type        = any
  default     = {} # Map of objects. See below

  # --------------------------------
  # Descriptions
  # --------------------------------
  #
  # Attribute  : name
  # Data type  : string
  # Required   : yes
  # Description: Name of the IAM user
  #
  # Attribute  : path
  # Data type  : string
  # Required   : no
  # Default    : /
  # Description: Path in which to create the user.
  #
  # Attribute  : force_destroy
  # Data type  : bool
  # Required   : no
  # Default    : false
  # Description: When destroying this user, destroy even if it has
  # non-Terraform-managed IAM access keys, login profile or MFA devices.
  # Without force_destroy a user with non-Terraform-managed access keys
  # and login profile will fail to be destroyed.
  #
  # Attribute  : tags
  # Data type  : map(string)
  # Required   : no
  # Default    : {}
  # Description: Tags for the user.
  #
  # Attribute  : num_access_keys
  # Data type  : number
  # Required   : no
  # Default    : 0
  # Description: Number of Access Keys to create for the user. Valid values are
  # 0, 1 or 2.
  #
  # Attribute  : inline_policies
  # Data type  : map(string)
  # Required   : no
  # Default    : {}
  # Description: Map of strings that create one or more inline policies for the
  # user. The key is policy name, whereas the value is the JSON document
  # of the IAM policy.
  # Examples   :
  #
  # inline_policies = {
  #   adminPolicy   = file("admin-policy.json")
  #   BillingAccess = file("billing-policy.json")
  # }
  #
  # Attribute  : managed_policies
  # Data type  : list(string)
  # Required   : no
  # Default    : []
  # Description: List of strings that represent the ARNs of the managed policies
  # that will be attach to the user.
  #
}

variable "iam_groups" {
  description = "Map of groups to create."
  type        = any
  default     = {} # Map of objects. See below

  # --------------------------------
  # Descriptions
  # --------------------------------
  #
  # Attribute  : name
  # Data type  : string
  # Required   : yes
  # Description: Name of the IAM group
  #
  # Attribute  : path
  # Data type  : string
  # Required   : no
  # Default    : /
  # Description: Path in which to create the group.
  #
  # Attribute  : inline_policies
  # Data type  : map(string)
  # Required   : no
  # Default    : {}
  # Description: Map of strings that create one or more inline policies for the
  # group. The key is policy name, whereas the value is the JSON document
  # of the IAM policy.
  #
  # Attribute  : members
  # Data type  : list(string)
  # Required   : no
  # Default    : []
  # Description: List of one or more IAM users specified by name that belong to
  # this group.
  #
  # Attribute  : managed_policies
  # Data type  : list(string)
  # Required   : no
  # Default    : []
  # Description: List of strings that represent the ARNs of the managed policies
  # that will be attach to the group.
  #
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}
