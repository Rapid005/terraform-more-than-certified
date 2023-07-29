locals {
  deployment = {
    nodered = {
      container_count = length(var.ext_port["nodered"][terraform.workspace])
      image           = var.image["nodered"][terraform.workspace]
      int_port        = 1880
      ext_port        = var.ext_port["nodered"][terraform.workspace]
      container_path  = "/data"
    }
    influxdb = {
      container_count = length(var.ext_port["influxdb"][terraform.workspace])
      image           = var.image["influxdb"][terraform.workspace]
      int_port        = 8086
      ext_port        = var.ext_port["influxdb"][terraform.workspace]
      container_path  = "/var/lib/influxdb"
    }
    grafana = {
      container_count = length(var.ext_port["grafana"][terraform.workspace])
      image           = var.image["grafana"][terraform.workspace]
      int_port        = 3000
      ext_port        = var.ext_port["grafana"][terraform.workspace]
      container_path  = "/var/lib/grafana"
    }
  }
}
