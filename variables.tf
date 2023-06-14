# ----------------------------------------------------------------------------------------------------------------------
# Variables
# ----------------------------------------------------------------------------------------------------------------------
# AWS Projects
variable "region" {
    type = string
    default = "us-west-1"
}

variable "domainName" {
  default = "*.ricktest.org"
  type    = string
}

variable "environment" {
  default = "dev"
  type = string
}

variable "containers" {
  default = [{
    container = "nginx"
    container_port = 80
    host_port = 8080
    name = "main"
    protocol = "tcp"
  },
  {
    container = "nginx"
    container_port = 80
    host_port = 8080
    name = "sub1"
    protocol = "tcp"
  }]
}