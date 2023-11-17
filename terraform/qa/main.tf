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
    bucket      = "wp-project-qa-tf-state-bucket"
    prefix      = "terraform/infrastructure-state"
    credentials = "files/wp-project-qa-fff4e8beed43.json"
  }
}

provider "google" {
    credentials = file("files/wp-project-qa-fff4e8beed43.json")
    project     = var.project_id
    zone        = var.project_zone
}

provider "kubernetes" {
    config_path    = "~/.kube/config"
}

// Get secret for registry-sa secret
data "google_secret_manager_secret_version" "registry_sa_secret_data" {
 secret   = "projects/284298684649/secrets/registry-sa"
}

// Get secret values from GCP for mysql secret
data "google_secret_manager_secret_version" "mysql_db_host" {
 secret   = "projects/284298684649/secrets/mysql_db_host"
}
data "google_secret_manager_secret_version" "mysql_db_name" {
 secret   = "projects/284298684649/secrets/mysql_db_name"
}
data "google_secret_manager_secret_version" "mysql_db_username" {
 secret   = "projects/284298684649/secrets/mysql_db_password"
}
data "google_secret_manager_secret_version" "mysql_db_password" {
 secret   = "projects/284298684649/secrets/mysql_db_username"
}

module "main_bucket" {
    source = "../cloud-run/bucket"

    project_region        = var.project_region
    tf_state_bucket_name  = "${var.project_id}-tf-state-bucket"
}

module "main_kubernetes" {
    source = "../cloud-run/kubernetes"

    project_id        = var.project_id
    project_region    = var.project_region
    project_zone      = var.project_zone
    environment       = var.environment
    gke_nodes_number  = var.gke_nodes_number

    network     = module.main_vpc.network
    subnetwork  = module.main_vpc.subnetwork
    
    wp_mysql_db_host        = data.google_secret_manager_secret_version.mysql_db_host.secret_data
    wp_mysql_db_name        = data.google_secret_manager_secret_version.mysql_db_name.secret_data
    wp_mysql_db_user        = data.google_secret_manager_secret_version.mysql_db_username.secret_data
    wp_mysql_db_password    = data.google_secret_manager_secret_version.mysql_db_password.secret_data

    registry_sa_secret_data = data.google_secret_manager_secret_version.registry_sa_secret_data.secret_data
}

module "main_vpc" {
    source = "../cloud-run/vpc"

    project_id        = var.project_id
    project_region    = var.project_region
}

module "main_sql" {
    source = "../cloud-run/sql"
    
    project_id      = var.project_id
    project_region  = var.project_region

    wp_mysql_db_name        = data.google_secret_manager_secret_version.mysql_db_name.secret_data
    wp_mysql_db_user        = data.google_secret_manager_secret_version.mysql_db_username.secret_data
    wp_mysql_db_password    = data.google_secret_manager_secret_version.mysql_db_password.secret_data
}