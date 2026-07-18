# terraform-aws-sso

Terraform module that manages an [AWS IAM Identity
Center](https://aws.amazon.com/iam/identity-center/) (SSO) permission set. It
discovers the Identity Center instance, creates a permission set and attaches
managed and inline policies that define its access.

## Usage

```hcl
module "sso" {
  source = "github.com/cybercapybara/terraform-aws-sso"

  name             = "readonly"
  session_duration = "PT2H"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]

  tags = {
    ManagedBy = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| aws       | >= 5.0   |

## Inputs

| Name                  | Description                                             | Type           | Default                   | Required |
|-----------------------|---------------------------------------------------------|----------------|---------------------------|:--------:|
| `name`                | Name of the permission set.                             | `string`       | n/a                       |   yes    |
| `description`         | Description of the permission set.                      | `string`       | `"Managed by Terraform"`  |    no    |
| `session_duration`    | Session validity in ISO-8601 duration format.           | `string`       | `"PT1H"`                  |    no    |
| `relay_state`         | Relay state URL used to redirect users.                 | `string`       | `null`                    |    no    |
| `managed_policy_arns` | AWS managed policy ARNs to attach.                      | `list(string)` | `[]`                      |    no    |
| `inline_policy`       | JSON inline policy to attach.                           | `string`       | `null`                    |    no    |
| `tags`                | Tags applied to the permission set.                     | `map(string)`  | `{}`                      |    no    |

## Outputs

| Name           | Description                                        |
|----------------|----------------------------------------------------|
| `arn`          | ARN of the permission set.                         |
| `id`           | Combined permission set and instance ARN.          |
| `instance_arn` | ARN of the Identity Center instance.               |

## License

[MIT](LICENSE)
