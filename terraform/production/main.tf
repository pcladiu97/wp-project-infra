// Get secret for registry-sa secret
data "google_secret_manager_secret_version" "registry_sa_secret_data" {
 secret   = "projects/286193583764/secrets/registry-sa"
}

// Get secret values from GCP for mysql secret
data "google_secret_manager_secret_version" "mysql_db_host" {
 secret   = "projects/286193583764/secrets/mysql_db_host"
}
data "google_secret_manager_secret_version" "mysql_db_name" {
 secret   = "projects/286193583764/secrets/mysql_db_name"
}
data "google_secret_manager_secret_version" "mysql_db_username" {
 secret   = "projects/286193583764/secrets/mysql_db_username"
}
data "google_secret_manager_secret_version" "mysql_db_password" {
 secret   = "projects/286193583764/secrets/mysql_db_password"
}

module "main_bucket" {
    source = "../tf-modules/bucket"

    project_region        = local.project_region
    tf_state_bucket_name  = "${local.project_id}-tf-state-bucket"
}

module "main_kubernetes" {
    source = "../tf-modules/kubernetes"

    project_id        = local.project_id
    project_region    = local.project_region
    project_zone      = local.project_zone
    environment       = local.environment
    gke_nodes_number  = local.gke_nodes_number

    network     = module.main_vpc.network
    subnetwork  = module.main_vpc.subnetwork
    
    wp_mysql_db_host        = data.google_secret_manager_secret_version.mysql_db_host.secret_data
    wp_mysql_db_name        = data.google_secret_manager_secret_version.mysql_db_name.secret_data
    wp_mysql_db_user        = data.google_secret_manager_secret_version.mysql_db_username.secret_data
    wp_mysql_db_password    = data.google_secret_manager_secret_version.mysql_db_password.secret_data

    registry_sa_secret_data = data.google_secret_manager_secret_version.registry_sa_secret_data.secret_data
}

module "main_vpc" {
    source = "../tf-modules/vpc"

    project_id        = local.project_id
    project_region    = local.project_region
}

module "main_sql" {
    source = "../tf-modules/sql"
    
    project_id      = local.project_id
    project_region  = local.project_region

    wp_mysql_db_name        = data.google_secret_manager_secret_version.mysql_db_name.secret_data
    wp_mysql_db_user        = data.google_secret_manager_secret_version.mysql_db_username.secret_data
    wp_mysql_db_password    = data.google_secret_manager_secret_version.mysql_db_password.secret_data

    network     = module.main_vpc.network
    subnetwork  = module.main_vpc.subnetwork
}