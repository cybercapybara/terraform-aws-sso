output "arn" {
  description = "ARN of the permission set."
  value       = aws_ssoadmin_permission_set.this.arn
}

output "id" {
  description = "Combined permission set ARN and instance ARN identifier."
  value       = aws_ssoadmin_permission_set.this.id
}

output "instance_arn" {
  description = "ARN of the IAM Identity Center instance the permission set belongs to."
  value       = aws_ssoadmin_permission_set.this.instance_arn
}
