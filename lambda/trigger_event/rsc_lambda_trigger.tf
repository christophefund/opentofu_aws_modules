#------------------------------------------------------------------------------
# Create Lambda Function Trigger
#------------------------------------------------------------------------------
resource "aws_cloudwatch_event_rule" "this" {
  tags = var.tags

  name          = var.rule_name != null ? var.rule_name : null
  description   = var.rule_description
  event_pattern = var.event_pattern
}

resource "aws_cloudwatch_event_target" "this" {
  rule      = aws_cloudwatch_event_rule.this.name
  target_id = "LambdaTarget"
  arn       = var.lambda_function_arn
}

#------------------------------------------------------------------------------
# Create Lambda Permissions to Allow the Trigger
#------------------------------------------------------------------------------
resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.this.arn
}
