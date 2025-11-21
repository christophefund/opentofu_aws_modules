#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
variable "tags" {
  description = "Tags to set for the Resources"
  type        = map(string)
  default     = {}
}


#------------------------------------------------------------------------------
# Lambda Function Trigger
#------------------------------------------------------------------------------
variable "lambda_function_arn" {
  description = "ARN of the Lambda function to trigger"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function to allow EventBridge invocation"
  type        = string
}

variable "event_pattern" {
  description = "EventBridge event pattern JSON string"
  type        = string
}

variable "rule_name" {
  description = "Name of the EventBridge rule"
  type        = string
  default     = null
}

variable "rule_description" {
  description = "Description of the EventBridge rule"
  type        = string
  default     = ""
}
