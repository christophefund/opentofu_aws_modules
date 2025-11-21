#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
variable "tags" {
  description = "Tags to set for the Resources"
  type        = map(string)
  default     = {}
}


#------------------------------------------------------------------------------
# Lambda Function
#------------------------------------------------------------------------------
variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Handler of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "Runtime environment for Lambda"
  type        = string
}

variable "memory_size" {
  description = "Memory size in MB"
  type        = number
  default     = 256
}

variable "timeout" {
  description = "Timeout in seconds"
  type        = number
  default     = 30
}

variable "environment_vars" {
  description = "Environment variables"
  type        = map(string)
  default     = {}
}

variable "layer_arns" {
  description = "List of Lambda layer ARNs"
  type        = list(string)
  default     = []
}

variable "filename" {
  description = "Local path to the deployment ZIP file"
  type        = string
  default     = null
}

variable "s3_bucket" {
  description = "S3 bucket containing deployment package"
  type        = string
  default     = null
}

variable "s3_key" {
  description = "S3 key for deployment package"
  type        = string
  default     = null
}

variable "s3_object_version" {
  description = "S3 object version"
  type        = string
  default     = null
}

variable "iam_role" {
  description = "IAM Role to be used by the Lambda Function"
  type        = string
  default     = null
}