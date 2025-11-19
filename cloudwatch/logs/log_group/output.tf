#------------------------------------------------------------------------------
# Log Group
#------------------------------------------------------------------------------
output "log_group_name" {
  description = "Name of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.this.name
}

output "log_group_arn" {
  description = "ARN of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.this.arn
}

output "log_group_id" {
  description = "ID of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.this.id
}

output "retention_in_days" {
  description = "Retention period in days"
  value       = aws_cloudwatch_log_group.this.retention_in_days
}

output "kms_key_id" {
  description = "KMS key ID used for encryption"
  value       = aws_cloudwatch_log_group.this.kms_key_id
}


#------------------------------------------------------------------------------
# Subscription Filter
#------------------------------------------------------------------------------
output "subscription_filter_id" {
  description = "ID of the subscription filter (if created)"
  value       = try(aws_cloudwatch_log_subscription_filter.this[0].id, null)
}

#------------------------------------------------------------------------------
# Metric Filter
#------------------------------------------------------------------------------
output "metric_filter_ids" {
  description = "IDs of the metric filters (if created)"
  value       = [for filter in aws_cloudwatch_log_metric_filter.this : filter.id]
}
