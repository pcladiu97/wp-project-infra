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
    bucket      = "wp-project-manage-tf-state-bucket"
    prefix      = "terraform/infrastructure-state"
    credentials = "files/credentials/wp-project-manage-9cd31bcca03b.json"
  }
}

provider "google" {
  credentials = file("files/credentials/wp-project-manage-9cd31bcca03b.json")
  project     = var.project_id
  zone        = var.project_zone
}
