variable "name" {
  description = "Name of the permission set."
  type        = string
}

variable "description" {
  description = "Description of the permission set."
  type        = string
  default     = "Managed by Terraform"
}

variable "session_duration" {
  description = "Length of time a session remains valid, in ISO-8601 duration format."
  type        = string
  default     = "PT1H"
}

variable "relay_state" {
  description = "Relay state URL used to redirect users within the application during sign-in. Null omits it."
  type        = string
  default     = null
}

variable "managed_policy_arns" {
  description = "List of AWS managed policy ARNs to attach to the permission set."
  type        = list(string)
  default     = []
}

variable "inline_policy" {
  description = "JSON inline policy to attach to the permission set. Null skips the inline policy."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to the permission set."
  type        = map(string)
  default     = {}
}
