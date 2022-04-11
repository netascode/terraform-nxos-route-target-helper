variable "value" {
  description = "Route Target value."
  type        = string

  validation {
    condition     = "auto" == var.value || can(regex("\\d+\\.\\d+\\.\\d+\\.\\d+:\\d+", var.value)) || can(regex("\\d+:\\d+", var.value))
    error_message = "Allowed formats: `auto`, `1.1.1.1:1`, `65535:1`."
  }
}

