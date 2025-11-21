#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
variable "tags" {
  description = "Tags to set for the Resources"
  type        = map(string)
  default     = {}
}


#------------------------------------------------------------------------------
# SSM Parameter
#------------------------------------------------------------------------------
variable "name" {
  type        = string
  description = "The name of the parameter."
}

variable "type" {
  type        = string
  default     = "String"
  description = "The type of the parameter (String, StringList, SecureString)."
}

variable "value" {
  type        = string
  default     = null
  description = "The value of the parameter."
}


variable "description" {
  type        = string
  default     = null
  description = "Description of the parameter."
}

variable "tier" {
  type        = string
  default     = null
  description = "Parameter tier: Standard, Advanced, Intelligent-Tiering."
}

variable "key_id" {
  type        = string
  default     = null
  description = "KMS key ID for encrypting SecureString parameters."
}

variable "allowed_pattern" {
  type        = string
  default     = null
  description = "Regex pattern to validate parameter value."
}

variable "data_type" {
  type        = string
  default     = null
  description = "Data type of the parameter."
}

variable "ignore_value_changes" {
  type        = bool
  default     = false
  description = "Ignore value changes in Terraform lifecycle."
}
