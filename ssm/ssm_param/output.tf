output "ssm_param_name" {
  value = aws_ssm_parameter.this.name
}

output "ssm_param_arn" {
  value = aws_ssm_parameter.this.arn
}

output "ssm_param_version" {
  value = aws_ssm_parameter.this.version
}
