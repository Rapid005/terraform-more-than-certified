variable "image" {
  description = "Which image to choose from"
  type        = map(any)
  default = {
    dev  = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}
variable "container_count" {
  description = "Count Value for containers"
  type        = number
  default     = 1
}

variable "int_port" {
  description = "Internal port for nodered container"
  type        = number
  default     = 1880

  validation {
    condition     = var.int_port == 1880
    error_message = "Port should be 1880"
  }
}

variable "ext_port" {
  type = map(any)

  validation {
    condition     = max(var.ext_port["dev"]...) <= 65535 && min(var.ext_port["dev"]...) >= 1980
    error_message = "The external port for dev must be between 1980 > port > 65535"
  }
  validation {
    condition     = max(var.ext_port["prod"]...) < 1980 && min(var.ext_port["prod"]...) >= 1880
    error_message = "The external port for prod  must be between 1880 > port > 1980"
  }
}
locals {
  container_count = length(lookup(var.ext_port, terraform.workspace))
}
