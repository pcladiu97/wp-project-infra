variable "project_id" {}
variable "project_region" {}

variable "wp_mysql_db_name" {}
variable "wp_mysql_db_user" {}
variable "wp_mysql_db_password" {}

variable "sonarqube_postgres_db_name" {}
variable "sonarqube_postgres_db_user" {}
variable "sonarqube_postgres_db_password" {}


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