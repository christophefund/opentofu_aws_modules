#------------------------------------------------------------------------------
# Create Log Group
#------------------------------------------------------------------------------
resource "aws_cloudwatch_log_group" "this" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_arn
  log_group_class   = var.log_group_class
  #skip_destroy      = var.skip_destroy
  tags = var.tags
}

#------------------------------------------------------------------------------
# Create Subscription Filter (Optional)
#------------------------------------------------------------------------------
resource "aws_cloudwatch_log_subscription_filter" "this" {
  count           = var.create_subscription_filter ? 1 : 0
  name            = var.subscription_filter_name
  log_group_name  = aws_cloudwatch_log_group.this.name
  filter_pattern  = var.subscription_filter_pattern
  destination_arn = var.subscription_destination_arn
  role_arn        = var.subscription_role_arn
  distribution    = var.subscription_distribution

  depends_on = [aws_cloudwatch_log_group.this]
}

#------------------------------------------------------------------------------
# Create Metric Filter (Optional)
#------------------------------------------------------------------------------
resource "aws_cloudwatch_log_metric_filter" "this" {
  count          = length(var.metric_filters)
  name           = var.metric_filters[count.index].name
  log_group_name = aws_cloudwatch_log_group.this.name
  pattern        = var.metric_filters[count.index].pattern

  metric_transformation {
    name          = var.metric_filters[count.index].metric_name
    namespace     = var.metric_filters[count.index].namespace
    value         = var.metric_filters[count.index].value
    default_value = var.metric_filters[count.index].default_value
    unit          = var.metric_filters[count.index].unit
  }

  depends_on = [aws_cloudwatch_log_group.this]
}
