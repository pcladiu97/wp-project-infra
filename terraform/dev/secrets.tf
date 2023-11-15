// Get secret value for SA account
data "google_secret_manager_secret_version" "registry_sa_secret_data" {
 secret   = "projects/440219679769/secrets/registry-sa"
}

// Get secret values from GCP for mysql secret
data "google_secret_manager_secret_version" "mysql_db_host" {
 secret   = "projects/440219679769/secrets/mysql_db_host"
}
data "google_secret_manager_secret_version" "mysql_db_name" {
 secret   = "projects/440219679769/secrets/mysql_db_name"
}
data "google_secret_manager_secret_version" "mysql_db_username" {
 secret   = "projects/440219679769/secrets/mysql_db_username"
}
data "google_secret_manager_secret_version" "mysql_db_password" {
 secret   = "projects/440219679769/secrets/mysql_db_password"
}

resource "kubernetes_secret" "registry_sa_secret" {
  metadata {
    name      = "registry-sa"
    namespace = "wp"
  }

  data = {
    ".dockerconfigjson" = data.google_secret_manager_secret_version.registry_sa_secret_data.secret_data
  }

  type = "kubernetes.io/dockerconfigjson"
}

// mysql secret
resource "kubernetes_secret" "mysql_secret" {
  metadata {
    name      = "mysql"
    namespace = "wp"
  }

  data = {
    "db_host"     = data.google_secret_manager_secret_version.mysql_db_host.secret_data
    "db_name"     = data.google_secret_manager_secret_version.mysql_db_name.secret_data
    "db_username" = data.google_secret_manager_secret_version.mysql_db_username.secret_data
    "db_password" = data.google_secret_manager_secret_version.mysql_db_password.secret_data
  }

  type = "Opaque"
}