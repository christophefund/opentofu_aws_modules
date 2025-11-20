output "function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.this.function_name
}

output "function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.this.arn
}

output "function_invoke_arn" {
  description = "The Invoke ARN of the Lambda function (used for permissions or asynchronous invoking)"
  value       = aws_lambda_function.this.invoke_arn
}

output "last_modified" {
  description = "Timestamp of when the Lambda function was last modified"
  value       = aws_lambda_function.this.last_modified
}

output "version" {
  description = "Version of the Lambda function"
  value       = aws_lambda_function.this.version
}
