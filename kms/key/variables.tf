#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
variable "tags" {
  description = "Tags to set for the Resources"
  type        = map(string)
}

variable "aws_account_id" {
  description = "Description of the KMS key"
  type        = string
}

#------------------------------------------------------------------------------
# IAM Policy
#------------------------------------------------------------------------------
variable "key_description" {
  description = "Description of the KMS key"
  type        = string
}

variable "key_usage" {
  description = "Intended use of the key (ENCRYPT_DECRYPT, SIGN_VERIFY, or GENERATE_VERIFY_MAC)"
  type        = string
  default     = "ENCRYPT_DECRYPT"
  validation {
    condition     = contains(["ENCRYPT_DECRYPT", "SIGN_VERIFY", "GENERATE_VERIFY_MAC"], var.key_usage)
    error_message = "Key usage must be ENCRYPT_DECRYPT, SIGN_VERIFY, or GENERATE_VERIFY_MAC."
  }
}

variable "customer_master_key_spec" {
  description = "Type of key material (SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, etc.)"
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  validation {
    condition = contains([
      "SYMMETRIC_DEFAULT", "RSA_2048", "RSA_3072", "RSA_4096",
      "ECC_NIST_P256", "ECC_NIST_P384", "ECC_NIST_P521",
      "ECC_SECG_P256K1", "HMAC_224", "HMAC_256", "HMAC_384", "HMAC_512"
    ], var.customer_master_key_spec)
    error_message = "Invalid customer master key spec."
  }
}

variable "key_policy" {
  description = "JSON policy document for the KMS key (if null, a default policy will be created)"
  type        = string
  default     = null
}

variable "enable_key_rotation" {
  description = "Enable automatic key rotation every year"
  type        = bool
  default     = true
}

variable "deletion_window_in_days" {
  description = "Duration in days before the key is deleted after destruction (7-30)"
  type        = number
  default     = 30
  validation {
    condition     = var.deletion_window_in_days >= 7 && var.deletion_window_in_days <= 30
    error_message = "Deletion window must be between 7 and 30 days."
  }
}

variable "is_enabled" {
  description = "Whether the key is enabled"
  type        = bool
  default     = true
}

variable "multi_region" {
  description = "Whether to create a multi-region key"
  type        = bool
  default     = false
}

variable "key_alias" {
  description = "Alias for the KMS key"
  type        = string
  default     = ""
}

/*
# CloudWatch Logs specific variables
variable "enable_cloudwatch_logs_encryption" {
  description = "Add CloudWatch Logs service permissions to the key policy"
  type        = bool
  default     = false
}

variable "cloudwatch_log_group_arns" {
  description = "List of CloudWatch Log Group ARNs that can use this key"
  type        = list(string)
  default     = []
}
*/


# Additional service permissions
variable "allow_services" {
  description = "List of AWS service principals to grant key usage (e.g., ['s3.amazonaws.com', 'sns.amazonaws.com'])"
  type        = list(string)
  default     = []
}

variable "admin_principal_arns" {
  description = "List of IAM principal ARNs that can administer the key"
  type        = list(string)
  default     = []
}

variable "user_principal_arns" {
  description = "List of IAM principal ARNs that can use the key"
  type        = list(string)
  default     = []
}

variable "grant_creation_principals" {
  description = "List of IAM principal ARNs that can create grants"
  type        = list(string)
  default     = []
}

