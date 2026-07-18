data "aws_ssoadmin_instances" "this" {}

resource "aws_ssoadmin_permission_set" "this" {
  name             = var.name
  description      = var.description
  instance_arn     = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  session_duration = var.session_duration
  relay_state      = var.relay_state

  tags = var.tags
}

resource "aws_ssoadmin_managed_policy_attachment" "this" {
  for_each = toset(var.managed_policy_arns)

  instance_arn       = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
  managed_policy_arn = each.value
}

resource "aws_ssoadmin_permission_set_inline_policy" "this" {
  count = var.inline_policy != null ? 1 : 0

  instance_arn       = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
  inline_policy      = var.inline_policy
}
