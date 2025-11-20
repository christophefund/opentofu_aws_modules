#------------------------------------------------------------------------------
# Create KMS Key
#------------------------------------------------------------------------------
resource "aws_kms_key" "this" {
  description              = var.key_description
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  policy                   = local.final_policy
  deletion_window_in_days  = var.deletion_window_in_days
  is_enabled               = var.is_enabled
  enable_key_rotation      = var.enable_key_rotation && var.key_usage == "ENCRYPT_DECRYPT" && var.customer_master_key_spec == "SYMMETRIC_DEFAULT"
  multi_region             = var.multi_region
  tags                     = var.tags
}

#------------------------------------------------------------------------------
# Create KMS Key Alias
#------------------------------------------------------------------------------
resource "aws_kms_alias" "this" {
  count         = var.key_alias != "" ? 1 : 0
  name          = "alias/${var.key_alias}"
  target_key_id = aws_kms_key.this.key_id
}
