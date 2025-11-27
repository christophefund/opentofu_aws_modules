#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
variable "tags" {
  description = "Map of tags to apply to the log group"
  type        = map(string)
  default     = {}
}

#------------------------------------------------------------------------------
# CloudTrail Trail
#------------------------------------------------------------------------------
variable "trail_name" {
  description = "Name of the CloudTrail trail"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the existing S3 bucket for CloudTrail logs"
  type        = string
}

variable "s3_key_prefix" {
  description = "S3 key prefix for CloudTrail logs"
  type        = string
  default     = ""
}

variable "is_multi_region_trail" {
  description = "Whether the trail logs events in all regions"
  type        = bool
}

variable "is_organization_trail" {
  description = "Whether this is an AWS Organizations trail"
  type        = bool
}

variable "enable_log_file_validation" {
  description = "Enable log file integrity validation"
  type        = bool
}

variable "include_global_service_events" {
  description = "Include global service events (IAM, STS, CloudFront)"
  type        = bool
}

variable "enable_logging" {
  description = "Enable logging for the trail"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "KMS key ID for log encryption (optional)"
  type        = string
  default     = null
}

variable "cloudwatch_logs_group_arn" {
  description = "CloudWatch Logs group ARN (optional)"
  type        = string
  default     = null
}

variable "cloudwatch_logs_role_arn" {
  description = "IAM role ARN for CloudWatch Logs (optional)"
  type        = string
  default     = null
}