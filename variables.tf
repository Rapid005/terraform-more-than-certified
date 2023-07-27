variable "container_count" {
  description = "Count Value for containers"
  type = number
  default = 1
}

variable "int_port" {
  description = "Internal port for nodered container"
  type = number
  default = 1880

  validation {
    condition = var.int_port == 1880
    error_message = "Port should be 1880"
  }
}

variable "ext_port" {
  type = number

  validation {
    condition = var.ext_port <= 65535 && var.ext_port > 0
    error_message = "The external port must be between 0~65535"
  }
}
