output "image_name" {
  value = docker_image.nodered_image.name
}
output "container_name_1st" {
  value = docker_container.nodered[*].name
}
output "ip_addresss" {
  value = [for i in docker_container.nodered[*]: join( ":", i.network_data[*].ip_address, i.ports[*].external  )]
}
