#------------------------------------------------------------------------------
# Create Lambda Function
#------------------------------------------------------------------------------
resource "aws_lambda_function" "this" {
  tags                     = var.tags

  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime

  filename          = var.filename
  s3_bucket         = var.s3_bucket
  s3_key            = var.s3_key
  s3_object_version = var.s3_object_version

  memory_size = var.memory_size
  timeout     = var.timeout

  environment_vars {
    variables = var.environment_vars
  }

  layers = var.layer_arns
}
