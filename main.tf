/**
 * ## Usage
 *
 * Creates metric alarms for use with a Lambda Function
 *
 * * Success rate
 *
 * ```hcl
 * module "lambda_metric_alarms" {
 *   source = "dod-iac/lambda-mteric-alarms/aws"
 *
 *   name           = var.application
 *   lambda_function_name = var.lambda_function_name
 *
 *   actions_alarm             = [var.sns_topic_arn]
 *   actions_ok                = [var.sns_topic_arn]
 *   actions_insufficient_data = [var.sns_topic_arn]
 *
 *   tags = {
 *     Application = var.application
 *     Environment = "test"
 *     Automation  = "Terraform"
 *   }
 * }
 * ```
 *
 * ## Terraform Version
 *
 * Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to master branch.
 *
 * Terraform 0.11 and 0.12 are not supported.
 *
 * ## License
 *
 * This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.
 */

resource "aws_cloudwatch_metric_alarm" "success_rate" {

  alarm_name        = format("%s-success-rate", var.name)
  alarm_description = format("Success rate for %s", var.name)

  actions_enabled           = var.actions_enabled
  alarm_actions             = var.actions_alarm
  ok_actions                = var.actions_ok
  insufficient_data_actions = var.actions_insufficient_data

  comparison_operator = "LessThanThreshold"
  threshold           = var.threshold
  evaluation_periods  = var.evaluation_periods
  treat_missing_data  = "notBreaching"

  metric_query {
    id          = "e1"
    expression  = "(m1-m2)/m1*100"
    label       = "Success Rate"
    return_data = "true"
  }

  metric_query {
    id = "m1"

    metric {
      metric_name = "Invocations"
      namespace   = "AWS/Lambda"
      period      = var.period
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        FunctionName = var.lambda_function_name
      }
    }
  }

  metric_query {
    id = "m2"

    metric {
      metric_name = "Errors"
      namespace   = "AWS/Lambda"
      period      = var.period
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        FunctionName = var.lambda_function_name
      }
    }
  }

  tags = var.tags
}
