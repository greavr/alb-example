# VPC Setup
variable "region" {}
variable "environment" {}

variable "network-cidr" {
    default = "10.0.0.0/16"
}
variable "vpc-name" {
    default = "main"
}
variable "subnets" {
    default = [{
        zone = "us-west-1c"
        cidr = "10.0.0.0/19"
    },
    {
        zone = "us-west-1b"
        cidr = "10.0.32.0/19"
    }]
}
