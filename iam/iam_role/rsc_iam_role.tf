#------------------------------------------------------------------------------
# Create IAM Role with Trust Policy for all Accounts in the Organization
#------------------------------------------------------------------------------
resource "aws_iam_role" "this" {
  name                  = var.role_name
  description           = var.role_description
  assume_role_policy    = var.trust_policy
  max_session_duration  = var.max_session_duration
 # force_detach_policies = var.force_detach_policies
  tags                  = var.tags
}


#------------------------------------------------------------------------------
# Attach Access Policy to IAM Role
#------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "custom_policy" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

# Attach additional managed policies to the role
resource "aws_iam_role_policy_attachment" "additional" {
  for_each   = toset(var.additional_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}
