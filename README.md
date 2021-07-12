<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Usage

Creates metric alarms for use with a Lambda Function

* Success rate

```hcl
module "lambda_metric_alarms" {
  source = "dod-iac/lambda-mteric-alarms/aws"

  name           = var.application
  lambda_function_name = var.lambda_function_name

  actions_alarm             = [var.sns_topic_arn]
  actions_ok                = [var.sns_topic_arn]
  actions_insufficient_data = [var.sns_topic_arn]

  tags = {
    Application = var.application
    Environment = "test"
    Automation  = "Terraform"
  }
}
```

## Terraform Version

Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to master branch.

Terraform 0.11 and 0.12 are not supported.

## License

This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.success_rate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions_alarm"></a> [actions\_alarm](#input\_actions\_alarm) | List of alarm actions to take | `list(string)` | `[]` | no |
| <a name="input_actions_enabled"></a> [actions\_enabled](#input\_actions\_enabled) | Enable the actions. Set to false to temporarily disable actions. | `bool` | `true` | no |
| <a name="input_actions_insufficient_data"></a> [actions\_insufficient\_data](#input\_actions\_insufficient\_data) | List of insufficient data actions to take | `list(string)` | `[]` | no |
| <a name="input_actions_ok"></a> [actions\_ok](#input\_actions\_ok) | List of ok actions to take | `list(string)` | `[]` | no |
| <a name="input_enable_metric_alarm"></a> [enable\_metric\_alarm](#input\_enable\_metric\_alarm) | Enable the metric alarm | `bool` | `true` | no |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | The number of periods over which data is compared to the specified threshold. | `number` | `2` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | The lambda function name for use with CloudWatch Metrics. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The service name. | `string` | n/a | yes |
| <a name="input_period"></a> [period](#input\_period) | The period in seconds over which the specified statistic is applied. | `number` | `120` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the metric alarms. | `map(string)` | `{}` | no |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | The threshold for the metric alarm | `string` | `"99.5"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_success_rate_metric_alarm_arn"></a> [success\_rate\_metric\_alarm\_arn](#output\_success\_rate\_metric\_alarm\_arn) | The ARN of the success rate metric alarm |
| <a name="output_succss_rate_metric_alarm_id"></a> [succss\_rate\_metric\_alarm\_id](#output\_succss\_rate\_metric\_alarm\_id) | The ID of the success rate metric alarm |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
