variable "name" {
  type        = string
  description = "The service name."
}

variable "environment" {
  type        = string
  description = "Environment tag, e.g prod."
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the metric alarms."
  default     = {}
}

variable "enable_metric_alarm" {
  type        = bool
  description = "Enable the metric alarm"
  default     = true
}

variable "actions_enabled" {
  type        = bool
  description = "Enable the actions. Set to false to temporarily disable actions."
  default     = true
}

variable "actions_alarm" {
  type        = list(string)
  description = "List of alarm actions to take"
  default     = []
}

variable "actions_ok" {
  type        = list(string)
  description = "List of ok actions to take"
  default     = []
}

variable "actions_insufficient_data" {
  type        = list(string)
  description = "List of insufficient data actions to take"
  default     = []
}

variable "lambda_function_name" {
  type        = string
  description = "The lambda function name for use with CloudWatch Metrics."
}

variable "threshold" {
  type        = string
  description = "The threshold for the metric alarm"
  default     = "99.5"
}

variable "evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
  default     = 2
}

variable "period" {
  type        = number
  description = "The period in seconds over which the specified statistic is applied."
  default     = 120
}
