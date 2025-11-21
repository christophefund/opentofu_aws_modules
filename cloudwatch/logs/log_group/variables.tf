#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
variable "tags" {
  description = "Map of tags to apply to the log group"
  type        = map(string)
  default     = {}
}

#------------------------------------------------------------------------------
# Log Group
#------------------------------------------------------------------------------
variable "log_group_name" {
  description = "Name of the CloudWatch Log Group (e.g., /aws/lambda/my-function)"
  type        = string
  validation {
    condition     = can(regex("^[\\.\\-_/#A-Za-z0-9]+$", var.log_group_name))
    error_message = "Log group name must contain only valid CloudWatch Log Group characters."
  }
}

variable "retention_in_days" {
  description = "Number of days to retain log events (0 = never expire)"
  type        = number
  default     = 7
  validation {
    condition = contains([
      0, 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653
    ], var.retention_in_days)
    error_message = "Retention must be 0 or one of AWS's supported retention periods."
  }
}

variable "kms_key_arn" {
  description = "ARN of the KMS key to use for encrypting log data"
  type        = string
  default     = null
}

variable "log_group_class" {
  description = "Log class of the log group (STANDARD or INFREQUENT_ACCESS)"
  type        = string
  default     = "STANDARD"
  validation {
    condition     = contains(["STANDARD", "INFREQUENT_ACCESS"], var.log_group_class)
    error_message = "Log group class must be either STANDARD or INFREQUENT_ACCESS."
  }
}

/*
variable "skip_destroy" {
  description = "Set to true to prevent Terraform from deleting the log group on destroy"
  type        = bool
  default     = false
}*/

#------------------------------------------------------------------------------
# Subscription Filter
#------------------------------------------------------------------------------
variable "create_subscription_filter" {
  description = "Whether to create a subscription filter for this log group"
  type        = bool
  default     = false
}

variable "subscription_filter_name" {
  description = "Name of the subscription filter"
  type        = string
  default     = ""
}

variable "subscription_filter_pattern" {
  description = "Filter pattern for the subscription filter"
  type        = string
  default     = ""
}

variable "subscription_destination_arn" {
  description = "ARN of the destination for subscription filter (Lambda, Kinesis, etc.)"
  type        = string
  default     = ""
}

variable "subscription_role_arn" {
  description = "ARN of an IAM role for CloudWatch Logs to assume (required for Kinesis)"
  type        = string
  default     = null
}

variable "subscription_distribution" {
  description = "Distribution method for subscription filter (ByLogStream or Random)"
  type        = string
  default     = "ByLogStream"
  validation {
    condition     = contains(["ByLogStream", "Random"], var.subscription_distribution)
    error_message = "Distribution must be either ByLogStream or Random."
  }
}

#------------------------------------------------------------------------------
# Metric Filter
#------------------------------------------------------------------------------
variable "create_metric_filter" {
  description = "Whether to create a metric filter for this log group"
  type        = bool
  default     = false
}

variable "metric_filters" {
  description = "List of metric filter configurations"
  type = list(object({
    name          = string
    pattern       = string
    metric_name   = string
    namespace     = string
    value         = string
    default_value = optional(number)
    unit          = optional(string)
  }))
  default = []
}
