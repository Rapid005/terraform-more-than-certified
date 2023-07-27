terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

resource "random_string" "random" {
  count = var.container_count
  length = 4
  special = false
  upper = false
}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "docker_container" "nodered" {
  count = var.container_count
  name  = join("-",["nodered-container",random_string.random[count.index].result])
  image = docker_image.nodered_image.name
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}
