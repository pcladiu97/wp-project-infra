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
  credentials = file("files/wp-project-404313-88863e84d905.json")
  project     = var.project_id
  zone        = var.project_zone
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}
