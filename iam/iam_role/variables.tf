#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
variable "tags" {
  description = "Tags to set for the Resources"
  type        = map(string)
  default     = {}
}


#------------------------------------------------------------------------------
# IAM Policy
#------------------------------------------------------------------------------
variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.policy_name))
    error_message = "Policy name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "policy_description" {
  description = "Description of the IAM policy"
  type        = string
  default     = ""
}

variable "policy_document" {
  description = "IAM policy document in JSON format"
  type        = string
  validation {
    condition     = can(jsondecode(var.policy_document))
    error_message = "Policy document must be valid JSON."
  }
}

#------------------------------------------------------------------------------
# IAM Role
#------------------------------------------------------------------------------
variable "role_name" {
  description = "Name of the IAM role"
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9-_+=,.@]+$", var.role_name))
    error_message = "Role name must contain only valid IAM role characters."
  }
}

variable "role_description" {
  description = "Description of the IAM role"
  type        = string
  default     = ""
}

variable "trust_policy" {
  description = "Trust policy document in JSON format"
  type        = string
  validation {
    condition     = can(jsondecode(var.trust_policy))
    error_message = "Trust policy must be valid JSON."
  }
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds (3600-43200)"
  type        = number
  default     = 3600
  validation {
    condition     = var.max_session_duration >= 3600 && var.max_session_duration <= 43200
    error_message = "Max session duration must be between 3600 and 43200 seconds."
  }
}

variable "additional_policy_arns" {
  description = "List of additional managed policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

/*
variable "force_detach_policies" {
  description = "Whether to force detach policies from the role when destroying"
  type        = bool
  default     = false
}
*/