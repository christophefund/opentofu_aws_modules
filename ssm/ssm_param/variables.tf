#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
variable "tags" {
  type        = map(string)
  description = "Tags to set for the Resources"
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
  description = "The type of the parameter (String, StringList, SecureString)."
}

variable "value" {
  type        = string
  description = "The value of the parameter."
}

variable "description" {
  type        = string
  description = "Description of the parameter."
}

variable "tier" {
  type        = string
  description = "Parameter tier: Standard, Advanced, Intelligent-Tiering."
  default     = "Standard"
}

variable "key_id" {
  type        = string
  description = "KMS key ID for encrypting SecureString parameters."
  default     = null
}

variable "allowed_pattern" {
  type        = string
  description = "Regex pattern to validate parameter value."
  default     = null
}

variable "data_type" {
  type        = string
  description = "Data type of the parameter."
  default     = null
}

variable "ignore_value_changes" {
  type        = bool
  description = "Ignore value changes in Terraform lifecycle."
  default     = false
}