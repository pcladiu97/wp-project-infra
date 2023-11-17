terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.4.0"
    }
  }
  required_version = ">= 1.6.3"
}

terraform {
  backend "gcs" {
    bucket      = "wp-project-404313-tf-state-bucket"
    prefix      = "terraform/infrastructure-state"
    credentials = "files/wp-project-404313-88863e84d905.json"
  }
}

provider "google" {
    credentials = file("files/wp-project-404313-88863e84d905.json")
    project     = local.project_id
    zone        = local.project_zone
}

provider "kubernetes" {
    config_path    = "~/.kube/config"
}