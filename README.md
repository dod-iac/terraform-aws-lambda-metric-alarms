## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13.0 |
| aws | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| actions\_alarm | List of alarm actions to take | `list(string)` | `[]` | no |
| actions\_enabled | Enable the actions. Set to false to temporarily disable actions. | `bool` | `true` | no |
| actions\_insufficient\_data | List of insufficient data actions to take | `list(string)` | `[]` | no |
| actions\_ok | List of ok actions to take | `list(string)` | `[]` | no |
| enable\_metric\_alarm | Enable the metric alarm | `bool` | `true` | no |
| environment | Environment tag, e.g prod. | `string` | n/a | yes |
| lambda\_function\_name | The lambda function name for use with CloudWatch Metrics. | `string` | n/a | yes |
| name | The service name. | `string` | n/a | yes |
| tags | Tags applied to the metric alarms. | `map(string)` | `{}` | no |
| threshold | The threshold for the metric alarm | `string` | `"99.5"` | no |

## Outputs

| Name | Description |
|------|-------------|
| success\_rate\_metric\_alarm\_arn | The ARN of the success rate metric alarm |
| succss\_rate\_metric\_alarm\_id | The ID of the success rate metric alarm |

