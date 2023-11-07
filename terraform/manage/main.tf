terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.4.0"
    }
  }
  required_version = ">= 1.6.3"
}

provider "google" {
  credentials = file("files/wp-project-manage-9cd31bcca03b.json")
  project     = var.project_id
  zone        = var.project_zone
}
