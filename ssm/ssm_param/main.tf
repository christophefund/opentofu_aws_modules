#------------------------------------------------------------------------------
# Create SSM Parameter
#------------------------------------------------------------------------------
resource "aws_ssm_parameter" "this" {
  name            = var.name
  type            = var.type
  value           = var.value
  description     = var.description
  tier            = var.tier
  key_id          = var.type == "SecureString" ? var.key_id : null # Only pass a Key if the type is SecureString
  allowed_pattern = var.allowed_pattern
  data_type       = var.data_type
  tags            = var.tags
  /*
  lifecycle {
    ignore_changes = var.ignore_value_changes ? [ "value" ] : []
  }
  */
}
