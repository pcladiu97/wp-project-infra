variable "project_id" {}
variable "project_region" {}
variable "project_zone" {}
variable "environment" {}
variable "gke_nodes_number" {}

variable "wp_mysql_db_host" {}
variable "wp_mysql_db_name" {}
variable "wp_mysql_db_user" {}
variable "wp_mysql_db_password" {}

variable "registry_sa_secret_data" {}

variable "wp_namespace" {
    default = "wp"
}

variable "aspnet_namespace" {
    default = "aspnet"
}

variable "network" {
  type = object({
    name      = string
    self_link = string
  })
}
variable "subnetwork" {
  type = object({
    name      = string
    self_link = string
  })
}