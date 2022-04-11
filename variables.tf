variable "values" {
  description = "List of Route Target values."
  type        = list(string)

  validation {
    condition = alltrue([
      for v in var.values : "auto" == v || can(regex("\\d+\\.\\d+\\.\\d+\\.\\d+:\\d+", v)) || can(regex("\\d+:\\d+", v))
    ])
    error_message = "Allowed formats: `auto`, `1.1.1.1:1`, `65535:1`."
  }
}

