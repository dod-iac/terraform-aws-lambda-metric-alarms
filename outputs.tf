
output "succss_rate_metric_alarm_id" {
  description = "The ID of the success rate metric alarm"
  value       = aws_cloudwatch_metric_alarm.success_rate.id
}

output "success_rate_metric_alarm_arn" {
  description = "The ARN of the success rate metric alarm"
  value       = aws_cloudwatch_metric_alarm.success_rate.arn
}
