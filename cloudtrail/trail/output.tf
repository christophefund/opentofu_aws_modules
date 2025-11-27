#------------------------------------------------------------------------------
# CloudTrail Trail
#------------------------------------------------------------------------------
output "trail_id" {
  description = "Name of the CloudTrail trail"
  value       = aws_cloudtrail.main.id
}

output "trail_arn" {
  description = "ARN of the CloudTrail trail"
  value       = aws_cloudtrail.main.arn
}

output "trail_name" {
  description = "Name of the CloudTrail trail"
  value       = aws_cloudtrail.main.name
}

output "account_id" {
  description = "AWS Account ID where the trail was created"
  value       = data.aws_caller_identity.current.account_id
}

output "home_region" {
  description = "Region where the trail was created"
  value       = aws_cloudtrail.main.home_region
}