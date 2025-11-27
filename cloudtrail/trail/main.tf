#------------------------------------------------------------------------------
# Create Cloudtrail Trail
#------------------------------------------------------------------------------
resource "aws_cloudtrail" "main" {
  name                          = var.trail_name
  s3_bucket_name                = var.s3_bucket_name
  s3_key_prefix                 = var.s3_key_prefix
  include_global_service_events = var.include_global_service_events
  is_multi_region_trail         = var.is_multi_region_trail
  is_organization_trail         = var.is_organization_trail
  enable_logging                = var.enable_logging
  enable_log_file_validation    = var.enable_log_file_validation
  kms_key_id                    = var.kms_key_id
  cloud_watch_logs_group_arn    = var.cloudwatch_logs_group_arn != null ? "${var.cloudwatch_logs_group_arn}:*" : null
  cloud_watch_logs_role_arn     = var.cloudwatch_logs_role_arn

  tags = merge(
    var.tags,
    {
      Name = var.trail_name
    }
  )
}
