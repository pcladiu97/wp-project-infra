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
    bucket      = "wp-project-production-tf-state-bucket"
    prefix      = "terraform/infrastructure-state"
    credentials = "files/credentials/wp-project-production-5ff3e20c2864.json"
  }
}

provider "google" {
    credentials = file("files/credentials/wp-project-production-5ff3e20c2864.json")
    project     = local.project_id
    zone        = local.project_zone
}

provider "kubernetes" {
    config_path    = "~/.kube/config"
}