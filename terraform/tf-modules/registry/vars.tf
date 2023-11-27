variable project_name {}
variable project_id {}
variable project_zone {}
variable project_region {}

variable "repository_names" {
  description = "List of repository names"
  type        = list(string)
}