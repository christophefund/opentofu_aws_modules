locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name

#------------------------------------------------------------------------------
# Create a Default Root Account KMS Key Policy if not provided
#------------------------------------------------------------------------------
  default_policy_statements = [{
    Sid    = "EnableIAMUserPermissions"
    Effect = "Allow"
    Principal = {
      AWS = "arn:aws:iam::${local.account_id}:root"
    }
    Action   = "kms:*"
    Resource = "*"
  }]

  default_policy = jsonencode({
    Version = "2012-10-17"
    Statement = local.default_policy_statements
  })

  final_policy = var.key_policy != null ? var.key_policy : local.default_policy

}